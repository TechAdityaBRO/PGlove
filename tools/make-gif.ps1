$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

# ---------------------------------------------------------------------------
# make-gif.ps1 — hand-rolled animated GIF89a writer.
# GDI+ in this runtime cannot author multi-frame GIFs (SaveAdd fails, and the
# two-arg SetPropertyItem overload is absent), so we render frames with GDI+
# and serialise the GIF ourselves: median-free fixed palette, LZW, per-frame
# Graphic Control Extension delays.
# ---------------------------------------------------------------------------

$out     = "C:\Users\Aditya\PGlove\logo.gif"
$SIZE    = 240
$FRAMES  = 8
$DELAYCS = 12          # centiseconds -> 120ms

$purple   = [System.Drawing.Color]::FromArgb(255, 109, 40, 217)
$blue     = [System.Drawing.Color]::FromArgb(255, 59, 130, 246)
$cyan     = [System.Drawing.Color]::FromArgb(255, 103, 232, 249)
$clear    = [System.Drawing.Color]::Transparent
$aWhite   = [System.Drawing.Color]::FromArgb(90, 255, 255, 255)
$aNone    = [System.Drawing.Color]::FromArgb(0, 255, 255, 255)
$aRing    = [System.Drawing.Color]::FromArgb(110, 103, 232, 249)
$aShadow  = [System.Drawing.Color]::FromArgb(80, 0, 0, 0)
$aSpark   = [System.Drawing.Color]::FromArgb(210, 103, 232, 249)
$unitPx   = [System.Drawing.GraphicsUnit]::Pixel

function New-RoundedPath([int]$x, [int]$y, [int]$w, [int]$h, [int]$r) {
    $p = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $d = $r * 2
    $p.AddArc($x, $y, $d, $d, 180, 90)
    $p.AddArc(($x + $w - $d), $y, $d, $d, 270, 90)
    $p.AddArc(($x + $w - $d), ($y + $h - $d), $d, $d, 0, 90)
    $p.AddArc($x, ($y + $h - $d), $d, $d, 90, 90)
    $p.CloseFigure()
    return $p
}

function Write-TextCentered($g, [string]$text, [System.Drawing.Font]$font, [System.Drawing.Brush]$brush, [int]$cx, [int]$cy) {
    $sz = $g.MeasureString($text, $font)
    $pt = [System.Drawing.PointF]::new([single]($cx - ($sz.Width / 2)), [single]($cy - ($sz.Height / 2)))
    $g.DrawString($text, $font, $brush, $pt)
}

function New-LogoBitmap([int]$size) {
    $bmp = [System.Drawing.Bitmap]::new($size, $size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $g.Clear($clear)

    $pad = [int]($size * 0.06)
    $w = $size - (2 * $pad)
    $path = New-RoundedPath $pad $pad $w $w ([int]($size * 0.22))

    $rect = [System.Drawing.Rectangle]::new($pad, $pad, $w, $w)
    $g.FillPath([System.Drawing.Drawing2D.LinearGradientBrush]::new($rect, $purple, $blue, 35.0), $path)
    $hRect = [System.Drawing.Rectangle]::new($pad, $pad, $w, [int]($w * 0.5))
    $g.FillPath([System.Drawing.Drawing2D.LinearGradientBrush]::new($hRect, $aWhite, $aNone, 90.0), $path)

    $ringR = [int]($size * 0.30)
    $cx = [single]($size / 2)
    $cy = [single]($size * 0.40)
    $ringPen = [System.Drawing.Pen]::new($aRing, [single][Math]::Max(2.0, $size * 0.022))
    $g.DrawEllipse($ringPen, [single]($cx - $ringR), [single]($cy - $ringR), [single]($ringR * 2), [single]($ringR * 2))
    $g.DrawEllipse($ringPen, [single]($cx - $ringR * 0.5), [single]($cy - $ringR * 1.1), [single]$ringR, [single]($ringR * 2.2))

    $cr = [int]($size * 0.09)
    $g.FillEllipse([System.Drawing.SolidBrush]::new($cyan), [single]($cx - $cr / 2), [single]($cy - $cr / 2), [single]$cr, [single]$cr)

    $font = [System.Drawing.Font]::new("Segoe UI", [single]($size * 0.30), [System.Drawing.FontStyle]::Bold, $unitPx)
    Write-TextCentered $g "PG" $font ([System.Drawing.SolidBrush]::new($aShadow)) ([int]($cx + 2)) ([int]($size * 0.74))
    Write-TextCentered $g "PG" $font ([System.Drawing.SolidBrush]::new([System.Drawing.Color]::White)) ([int]$cx) ([int]($size * 0.735))
    $font.Dispose()
    $g.Dispose()
    return $bmp
}

function Get-PackedRgb([System.Drawing.Bitmap]$bmp) {
    $w = $bmp.Width; $h = $bmp.Height
    $d = $bmp.LockBits([System.Drawing.Rectangle]::new(0, 0, $w, $h),
          [System.Drawing.Imaging.ImageLockMode]::ReadOnly,
          [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $stride = [Math]::Abs($d.Stride)
    $buf = [byte[]]::new($stride * $h)
    [System.Runtime.InteropServices.Marshal]::Copy($d.Scan0, $buf, 0, $buf.Length)
    $bmp.UnlockBits($d)
    $px = [int[]]::new($w * $h)
    for ($y = 0; $y -lt $h; $y++) {
        $row = $y * $stride
        $o = $y * $w
        for ($x = 0; $x -lt $w; $x++) {
            $i = $row + ($x * 4)
            $px[$o + $x] = ($buf[$i + 2] -shl 16) -bor ($buf[$i + 1] -shl 8) -bor $buf[$i]
        }
    }
    return $px
}

# ---- fixed 256-colour palette: 6x6x6 cube + 40 greys -----------------
$pal = [System.Collections.Generic.List[int]]::new()
$ramp = @(0, 51, 102, 153, 204, 255)
foreach ($r in $ramp) { foreach ($g in $ramp) { foreach ($b in $ramp) {
    $pal.Add(($r -shl 16) -bor ($g -shl 8) -bor $b)
} } }
for ($i = 0; $i -lt 40; $i++) { $v = $i * 4; $pal.Add(($v -shl 16) -bor ($v -shl 8) -bor $v) }

function ConvertTo-Indices([int[]]$px) {
    $idx = [byte[]]::new($px.Length)
    $cache = @{}
    for ($i = 0; $i -lt $px.Length; $i++) {
        $c = $px[$i]
        $hit = $cache[$c]
        if ($null -ne $hit) { $idx[$i] = [byte]$hit; continue }
        $r = ($c -shr 16) -band 255; $g = ($c -shr 8) -band 255; $b = $c -band 255
        $best = 0; $bestD = [int]::MaxValue
        for ($p = 0; $p -lt 256; $p++) {
            $pc = $pal[$p]
            $dr = $r - (($pc -shr 16) -band 255)
            $dg = $g - (($pc -shr 8) -band 255)
            $db = $b - ($pc -band 255)
            $dist = ($dr * $dr) + ($dg * $dg) + ($db * $db)
            if ($dist -lt $bestD) { $bestD = $dist; $best = $p; if ($dist -eq 0) { break } }
        }
        $cache[$c] = $best
        $idx[$i] = [byte]$best
    }
    return $idx
}

# ---- GIF LZW (code order matches the standard decoder) ----------------
function Compress-Lzw([byte[]]$idx, [int]$minCodeSize) {
    $clearCode = 1 -shl $minCodeSize
    $endCode = $clearCode + 1
    $codes = [System.Collections.Generic.List[int]]::new()
    $sizes = [System.Collections.Generic.List[int]]::new()
    $codeSize = $minCodeSize + 1
    $maxCode = (1 -shl $codeSize) - 1
    $next = $endCode + 1
    $dict = [System.Collections.Generic.Dictionary[int, int]]::new()

    $codes.Add($clearCode); $sizes.Add($codeSize)

    $cur = [int]$idx[0]
    for ($i = 1; $i -lt $idx.Length; $i++) {
        $k = [int]$idx[$i]
        $key = ($cur -shl 8) -bor $k
        if ($dict.ContainsKey($key)) { $cur = $dict[$key]; continue }

        $codes.Add($cur); $sizes.Add($codeSize)
        if ($next -gt $maxCode -and $codeSize -lt 12) {
            $codeSize++; $maxCode = (1 -shl $codeSize) - 1
        }
        $cur = $k

        if ($next -lt 4096) {
            $dict[$key] = $next; $next++
        } else {
            $codes.Add($clearCode); $sizes.Add($codeSize)
            $dict.Clear()
            $next = $endCode + 1
            $codeSize = $minCodeSize + 1
            $maxCode = (1 -shl $codeSize) - 1
        }
    }
    $codes.Add($cur); $sizes.Add($codeSize)
    $codes.Add($endCode); $sizes.Add($codeSize)

    $bytes = [System.Collections.Generic.List[byte]]::new()
    $acc = 0; $nb = 0
    for ($i = 0; $i -lt $codes.Count; $i++) {
        $acc = $acc -bor ($codes[$i] -shl $nb)
        $nb += $sizes[$i]
        while ($nb -ge 8) {
            $bytes.Add([byte]($acc -band 0xFF))
            $acc = $acc -shr 8
            $nb -= 8
        }
    }
    if ($nb -gt 0) { $bytes.Add([byte]($acc -band 0xFF)) }
    return $bytes.ToArray()
}

# ---- render frames ---------------------------------------------------
Write-Output "rendering $FRAMES frames at ${SIZE}x${SIZE} ..."
$frameIdx = @()
for ($n = 0; $n -lt $FRAMES; $n++) {
    $bmp = New-LogoBitmap $SIZE
    $gg = [System.Drawing.Graphics]::FromImage($bmp)
    $gg.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $t = ($n / [double]$FRAMES) * 2 * [Math]::PI
    $orbitR = [double]($SIZE * 0.36)
    $cx = [double]($SIZE / 2)
    $cy = [double]($SIZE * 0.40)
    $sr = [int]($SIZE * 0.05)
    $gg.FillEllipse(
        [System.Drawing.SolidBrush]::new($aSpark),
        [single]($cx + [Math]::Cos($t) * $orbitR - $sr / 2),
        [single]($cy + [Math]::Sin($t) * $orbitR * 0.40 - $sr / 2),
        [single]$sr, [single]$sr)
    $gg.Dispose()
    Write-Output ("  frame {0}: quantising ..." -f $n)
    $frameIdx += ,(ConvertTo-Indices (Get-PackedRgb $bmp))
    $bmp.Dispose()
}

# ---- assemble --------------------------------------------------------
$gif = [System.Collections.Generic.List[byte]]::new()
$ascii = [System.Text.Encoding]::ASCII
foreach ($ch in 'GIF89a'.ToCharArray()) { $gif.Add([byte][char]$ch) }
$gif.Add([byte]($SIZE -band 0xFF)); $gif.Add([byte]($SIZE -shr 8))
$gif.Add([byte]($SIZE -band 0xFF)); $gif.Add([byte]($SIZE -shr 8))
$gif.Add(0xF7)   # GCT present, 8-bit colour resolution, 256 entries
$gif.Add(0x00)   # background index
$gif.Add(0x00)   # pixel aspect ratio
for ($p = 0; $p -lt 256; $p++) {
    $c = $pal[$p]
    $gif.Add([byte](($c -shr 16) -band 255))
    $gif.Add([byte](($c -shr 8) -band 255))
    $gif.Add([byte]($c -band 255))
}
# NETSCAPE2.0 looping extension
$gif.Add(0x21); $gif.Add(0xFF); $gif.Add(0x0B)
foreach ($ch in 'NETSCAPE2.0'.ToCharArray()) { $gif.Add([byte][char]$ch) }
$gif.Add(0x03); $gif.Add(0x01); $gif.Add(0x00); $gif.Add(0x00); $gif.Add(0x00)

$minCodeSize = 8
for ($n = 0; $n -lt $FRAMES; $n++) {
    # Graphic Control Extension
    $gif.Add(0x21); $gif.Add(0xF9); $gif.Add(0x04)
    $gif.Add(0x04)                                        # disposal = do not dispose
    $gif.Add([byte]($DELAYCS -band 0xFF)); $gif.Add([byte]($DELAYCS -shr 8))
    $gif.Add(0x00)                                        # transparent index
    $gif.Add(0x00)                                        # block terminator
    # Image Descriptor
    $gif.Add(0x2C)
    $gif.Add(0x00); $gif.Add(0x00); $gif.Add(0x00); $gif.Add(0x00)
    $gif.Add([byte]($SIZE -band 0xFF)); $gif.Add([byte]($SIZE -shr 8))
    $gif.Add([byte]($SIZE -band 0xFF)); $gif.Add([byte]($SIZE -shr 8))
    $gif.Add(0x00)                                        # no LCT, not interlaced
    # LZW data
    $gif.Add([byte]$minCodeSize)
    $data = Compress-Lzw $frameIdx[$n] $minCodeSize
    $pos = 0
    while ($pos -lt $data.Length) {
        $take = [Math]::Min(255, $data.Length - $pos)
        $gif.Add([byte]$take)
        for ($q = 0; $q -lt $take; $q++) { $gif.Add($data[$pos + $q]) }
        $pos += $take
    }
    $gif.Add(0x00)                                        # block terminator
    Write-Output ("  encoded frame {0} ({1} LZW bytes)" -f $n, $data.Length)
}
$gif.Add(0x3B)   # trailer

[System.IO.File]::WriteAllBytes($out, $gif.ToArray())
Write-Output ("wrote {0} ({1} bytes, {2} frames, {3}ms/frame)" -f $out, $gif.Count, $FRAMES, ($DELAYCS * 10))

# ---- verify ----------------------------------------------------------
$chk = [System.Drawing.Image]::FromFile($out)
$fd = [System.Drawing.Imaging.FrameDimension]::new([System.Drawing.Imaging.FrameDimension]::Time)
$fc = $chk.GetFrameCount($fd)
Write-Output "VERIFY: GDI+ decoded frame count = $fc (expected $FRAMES)"
$chk.SelectActiveFrame($fd, 0)
$p = $chk.GetPropertyItem(0x5100)
if ($p) { Write-Output ("VERIFY: frame delay = {0} centiseconds" -f [System.BitConverter]::ToInt32($p.Value, 0)) }
$png = "C:\Users\Aditya\AppData\Local\Temp\opencode\gif-frame0.png"
$chk.Save($png, [System.Drawing.Imaging.ImageFormat]::Png)
Write-Output "VERIFY: exported frame 0 -> $png"
$chk.Dispose()

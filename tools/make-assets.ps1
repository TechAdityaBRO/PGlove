$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

$root = "C:\Users\Aditya\PGlove"
$purple   = [System.Drawing.Color]::FromArgb(255, 109, 40, 217)
$purpleLt = [System.Drawing.Color]::FromArgb(255, 171, 123, 255)
$blue     = [System.Drawing.Color]::FromArgb(255, 59, 130, 246)
$cyan     = [System.Drawing.Color]::FromArgb(255, 103, 232, 249)
$bg       = [System.Drawing.Color]::FromArgb(255, 10, 4, 32)
$clear    = [System.Drawing.Color]::Transparent
$aWhite   = [System.Drawing.Color]::FromArgb(90, 255, 255, 255)
$aNone    = [System.Drawing.Color]::FromArgb(0, 255, 255, 255)
$aRing    = [System.Drawing.Color]::FromArgb(110, 103, 232, 249)
$aShadow  = [System.Drawing.Color]::FromArgb(80, 0, 0, 0)
$aPurple  = [System.Drawing.Color]::FromArgb(130, 109, 40, 217)
$aBlue    = [System.Drawing.Color]::FromArgb(120, 37, 99, 235)
$aSpark   = [System.Drawing.Color]::FromArgb(210, 103, 232, 249)
$lightTxt = [System.Drawing.Color]::FromArgb(255, 232, 228, 245)
$mutedTxt = [System.Drawing.Color]::FromArgb(255, 150, 138, 195)
$fontDir  = [System.Drawing.FontStyle]
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
    $x = [single]($cx - ($sz.Width / 2))
    $y = [single]($cy - ($sz.Height / 2))
    $pt = [System.Drawing.PointF]::new($x, $y)
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
    $r = [int]($size * 0.22)
    $path = New-RoundedPath $pad $pad $w $w $r

    $rect = [System.Drawing.Rectangle]::new($pad, $pad, $w, $w)
    $grad = [System.Drawing.Drawing2D.LinearGradientBrush]::new($rect, $purple, $blue, 35.0)
    $g.FillPath($grad, $path)

    $hRect = [System.Drawing.Rectangle]::new($pad, $pad, $w, [int]($w * 0.5))
    $hl = [System.Drawing.Drawing2D.LinearGradientBrush]::new($hRect, $aWhite, $aNone, 90.0)
    $g.FillPath($hl, $path)

    $ringR = [int]($size * 0.30)
    $cx = [single]($size / 2)
    $cy = [single]($size * 0.40)
    $ringPen = [System.Drawing.Pen]::new($aRing, [single][Math]::Max(2.0, $size * 0.022))
    $g.DrawEllipse($ringPen, [single]($cx - $ringR), [single]($cy - $ringR), [single]($ringR * 2), [single]($ringR * 2))
    $g.DrawEllipse($ringPen, [single]($cx - $ringR * 0.5), [single]($cy - $ringR * 1.1), [single]$ringR, [single]($ringR * 2.2))

    $cr = [int]($size * 0.09)
    $core = [System.Drawing.SolidBrush]::new($cyan)
    $g.FillEllipse($core, [single]($cx - $cr / 2), [single]($cy - $cr / 2), $cr, $cr)

    $font = [System.Drawing.Font]::new("Segoe UI", [single]($size * 0.30), [System.Drawing.FontStyle]::Bold, $unitPx)
    $shadow = [System.Drawing.SolidBrush]::new($aShadow)
    Write-TextCentered $g "PG" $font $shadow ([int]($cx + 2)) ([int]($size * 0.74))
    $white = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::White)
    Write-TextCentered $g "PG" $font $white ([int]$cx) ([int]($size * 0.735))
    $font.Dispose()

    $g.Dispose()
    return $bmp
}

function Save-Png([System.Drawing.Image]$img, [string]$path, [int]$w, [int]$h) {
    if ($img.Width -eq $w -and $img.Height -eq $h) {
        $img.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    } else {
        $out = [System.Drawing.Bitmap]::new($w, $h)
        $g2 = [System.Drawing.Graphics]::FromImage($out)
        $g2.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g2.Clear($clear)
        $g2.DrawImage($img, 0, 0, $w, $h)
        $g2.Dispose()
        $out.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        $out.Dispose()
    }
    Write-Output ("  {0}  ({1}x{2})" -f (Split-Path $path -Leaf), $w, $h)
}

Write-Output "logo / icons:"
$logo = New-LogoBitmap 512
Save-Png $logo (Join-Path $root "logo.png") 512 512
Save-Png $logo (Join-Path $root "icon-512.png") 512 512
Save-Png $logo (Join-Path $root "icon-192.png") 192 192
Save-Png $logo (Join-Path $root "favicon.png") 64 64
Save-Png $logo (Join-Path $root "apple-touch-icon.png") 180 180
$logo.Dispose()

Write-Output "og-image.png:"
$W = 1200; $H = 630
$og = [System.Drawing.Bitmap]::new($W, $H)
$g3 = [System.Drawing.Graphics]::FromImage($og)
$g3.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g3.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$g3.Clear($bg)
$bgRect = [System.Drawing.Rectangle]::new(0, 0, $W, $H)
$bgGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new($bgRect, [System.Drawing.Color]::FromArgb(255, 26, 12, 68), [System.Drawing.Color]::FromArgb(255, 8, 3, 24), 25.0)
$g3.FillRectangle($bgGrad, 0, 0, $W, $H)
$g1r = [System.Drawing.Rectangle]::new(0, 0, 620, 420)
$g1 = [System.Drawing.Drawing2D.LinearGradientBrush]::new($g1r, $aPurple, [System.Drawing.Color]::FromArgb(0, 109, 40, 217), 45.0)
$g3.FillRectangle($g1, 0, 0, 620, 420)
$g2r = [System.Drawing.Rectangle]::new(600, 250, 600, 380)
$g2 = [System.Drawing.Drawing2D.LinearGradientBrush]::new($g2r, $aBlue, [System.Drawing.Color]::FromArgb(0, 37, 99, 235), 45.0)
$g3.FillRectangle($g2, 600, 250, 600, 380)

$logoSmall = New-LogoBitmap 260
$g3.DrawImage($logoSmall, 90, 185, 260, 260)
$logoSmall.Dispose()

$titleFont = [System.Drawing.Font]::new("Segoe UI", [single]100, [System.Drawing.FontStyle]::Bold, $unitPx)
$subFont   = [System.Drawing.Font]::new("Segoe UI", [single]40, [System.Drawing.FontStyle]::Regular, $unitPx)
$tagFont   = [System.Drawing.Font]::new("Consolas", [single]29, [System.Drawing.FontStyle]::Bold, $unitPx)
$tRect = [System.Drawing.Rectangle]::new(404, 170, 740, 130)
$tGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new($tRect, $purpleLt, $blue, 0.0)
$g3.DrawString("PGlove", $titleFont, $tGrad, [System.Drawing.PointF]::new(400, 165))
$lightB = [System.Drawing.SolidBrush]::new($lightTxt)
$g3.DrawString("A Browser With A New Generation", $subFont, $lightB, [System.Drawing.PointF]::new(406, 300))
$cyanB = [System.Drawing.SolidBrush]::new($cyan)
$g3.DrawString("Stable v1.0.3  |  Tauri 2 / Rust / WebView2", $tagFont, $cyanB, [System.Drawing.PointF]::new(406, 372))
$mutedB = [System.Drawing.SolidBrush]::new($mutedTxt)
$g3.DrawString("Made in India for the world  |  BRO GANG & D1M Studios", $tagFont, $mutedB, [System.Drawing.PointF]::new(406, 424))
$g3.Dispose()
$og.Save((Join-Path $root "og-image.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$og.Dispose()
Write-Output ("  og-image.png  ({0}x{1})" -f $W, $H)

Write-Output "ALL ASSETS DONE"

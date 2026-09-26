$ErrorActionPreference = "Stop"
$root = "C:\Users\Aditya\PGlove"

# ---------------------------------------------------------------------------
# make-subpages.ps1
# Regenerates the four legacy sub-pages (extensions, features, roadmap, support)
# so they share the current theme, SEO head, Hindi hover tooltips, nav and
# footer with index.html / privacy/ / terms/.
# ---------------------------------------------------------------------------

$HEAD = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>__TITLE__</title>
<meta name="description" content="__DESC__">
<meta name="keywords" content="__KEYS__">
<meta name="author" content="Aditya Kumar Sethi (TechAdityaBRO)">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="theme-color" content="#0a0420">
<link rel="canonical" href="__CANON__">

<script type="application/ld+json">
__JSONLD__
</script>

<meta property="og:type" content="website">
<meta property="og:site_name" content="PGlove">
<meta property="og:title" content="__TITLE__">
<meta property="og:description" content="__DESC__">
<meta property="og:url" content="__CANON__">
<meta property="og:image" content="https://pglove.jo3.org/og-image.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:locale" content="en_US">

<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="__TITLE__">
<meta name="twitter:description" content="__DESC__">
<meta name="twitter:image" content="https://pglove.jo3.org/og-image.png">

<link rel="icon" type="image/png" href="/favicon.png">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="manifest" href="/manifest.json">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Space+Grotesk:wght@400;600;700&family=JetBrains+Mono:wght@400;500;600&family=Noto+Sans+Devanagari:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root{
  --purple-200:#c9aaff; --purple-300:#ab7bff; --purple-400:#8b4dff; --purple-500:#6d28d9;
  --blue-400:#60a5fa; --blue-500:#3b82f6; --cyan-300:#67e8f9;
  --bg-0:#05010f; --bg-1:#0a0420; --surface:#140a38;
  --border:rgba(139,77,255,.18); --border-strong:rgba(139,77,255,.35);
  --text:#e8e4f5; --text-dim:#b8aee0; --text-muted:#7a6fa5;
  --green:#10b981; --green-light:#6ee7b7; --orange:#fb923c; --pink:#f472b6;
  --yellow:#ffcb05; --matrix:#0dbd8b; --ease:cubic-bezier(.22,1,.36,1);
}
*{margin:0;padding:0;box-sizing:border-box}
html{scroll-behavior:smooth;scroll-padding-top:5rem}
body{background:var(--bg-0);color:var(--text);font-family:'Inter',system-ui,sans-serif;line-height:1.7;overflow-x:hidden}
img{max-width:100%}
a{color:var(--purple-300)}
::selection{background:var(--purple-500);color:#fff}
.bg-grid{position:fixed;inset:0;pointer-events:none;z-index:0;
  background-image:linear-gradient(rgba(139,77,255,.04) 1px,transparent 1px),linear-gradient(90deg,rgba(139,77,255,.04) 1px,transparent 1px);
  background-size:60px 60px}
.bg-glow{position:fixed;inset:0;pointer-events:none;z-index:0;
  background:radial-gradient(ellipse at 20% 0%,rgba(109,40,217,.14) 0%,transparent 55%),
             radial-gradient(ellipse at 80% 100%,rgba(59,130,246,.10) 0%,transparent 55%)}
.nav{position:fixed;top:0;left:0;width:100%;z-index:100;backdrop-filter:blur(20px);
  background:rgba(10,4,32,.85);border-bottom:1px solid var(--border);
  padding:.75rem 2rem;display:flex;justify-content:space-between;align-items:center;gap:1rem}
.nav-brand{display:flex;align-items:center;gap:.6rem;text-decoration:none;
  font-family:'Space Grotesk',sans-serif;font-size:1.4rem;font-weight:700;
  background:linear-gradient(135deg,var(--purple-200),var(--blue-400));
  -webkit-background-clip:text;background-clip:text;-webkit-text-fill-color:transparent}
.brand-mark{width:32px;height:32px;object-fit:contain}
.nav-links{display:flex;align-items:center;flex-wrap:wrap}
.nav-links a{color:var(--text-dim);text-decoration:none;margin-left:1.2rem;font-size:.85rem;transition:color .3s;white-space:nowrap}
.nav-links a:hover,.nav-links a.active{color:var(--purple-200)}
.nav-cta{margin-left:1.2rem!important;padding:.42rem .95rem;border-radius:99px;
  background:linear-gradient(135deg,var(--purple-500),var(--blue-500));color:#fff!important;font-weight:600}
main{position:relative;z-index:1;max-width:1060px;margin:0 auto;padding:7rem 1.5rem 3rem}
.page-tag{display:inline-block;font-family:'JetBrains Mono',monospace;font-size:.72rem;font-weight:600;
  color:var(--purple-300);text-transform:uppercase;letter-spacing:2px;margin-bottom:.9rem;
  padding:.3rem .8rem;border:1px solid var(--border);border-radius:99px;background:rgba(139,77,255,.07)}
.page-title{font-family:'Space Grotesk',sans-serif;font-size:clamp(1.9rem,5vw,2.9rem);font-weight:700;
  line-height:1.14;margin-bottom:.9rem;
  background:linear-gradient(135deg,#fff,var(--purple-200) 55%,var(--blue-400));
  -webkit-background-clip:text;background-clip:text;-webkit-text-fill-color:transparent}
.page-sub{color:var(--text-dim);font-size:1.05rem;max-width:660px;margin-bottom:2.8rem}
.block-title{font-family:'Space Grotesk',sans-serif;font-size:clamp(1.3rem,3.4vw,1.8rem);font-weight:700;
  margin:3rem 0 .4rem}
.block-sub{color:var(--text-dim);font-size:.98rem;margin-bottom:1.8rem;max-width:640px}
.grid{display:grid;gap:1.4rem;grid-template-columns:repeat(auto-fit,minmax(280px,1fr))}
.grid.narrow{grid-template-columns:repeat(auto-fit,minmax(240px,1fr))}
.card{display:block;text-decoration:none;color:inherit;position:relative;overflow:hidden;
  background:linear-gradient(160deg,rgba(30,16,84,.6) 0%,rgba(20,10,56,.88) 100%);
  border:1px solid var(--border);border-radius:18px;padding:1.7rem 1.5rem;
  transition:all .4s var(--ease)}
.card:hover{transform:translateY(-5px);border-color:var(--border-strong);box-shadow:0 18px 45px rgba(109,40,217,.22)}
.card h3{font-family:'Space Grotesk',sans-serif;font-size:1.1rem;font-weight:700;margin-bottom:.5rem}
.card p{color:var(--text-dim);font-size:.9rem}
.card-ico{font-size:1.9rem;margin-bottom:.8rem;display:block}
.card-actions{display:flex;gap:.7rem;flex-wrap:wrap;margin-top:1.1rem}
.card::after{content:'';position:absolute;top:0;left:0;width:100%;height:3px;opacity:.85}
.card.c-archived::after{background:linear-gradient(90deg,var(--orange),var(--yellow))}
.card.c-dev::after{background:linear-gradient(90deg,var(--purple-500),var(--purple-300))}
.card.c-paused::after{background:linear-gradient(90deg,#555,#999)}
.card.c-live::after{background:linear-gradient(90deg,var(--green),var(--cyan-300))}
.card.c-done::after{background:linear-gradient(90deg,var(--green),var(--cyan-300))}
.card.c-arch::after{background:linear-gradient(90deg,var(--orange),var(--yellow))}
.card.c-default::after{background:linear-gradient(90deg,var(--purple-500),var(--blue-500))}
.badge{display:inline-block;font-family:'JetBrains Mono',monospace;font-size:.64rem;font-weight:600;
  letter-spacing:1px;text-transform:uppercase;padding:.22rem .6rem;border-radius:5px;margin-bottom:.7rem}
.b-green{background:rgba(16,185,129,.14);color:var(--green-light);border:1px solid rgba(16,185,129,.3)}
.b-orange{background:rgba(251,146,60,.14);color:#fdba74;border:1px solid rgba(251,146,60,.3)}
.b-purple{background:rgba(139,77,255,.14);color:var(--purple-200);border:1px solid var(--border)}
.b-grey{background:rgba(122,111,165,.14);color:var(--text-muted);border:1px solid var(--border)}
.b-cyan{background:rgba(34,211,238,.12);color:var(--cyan-300);border:1px solid rgba(34,211,238,.3)}
.b-matrix{background:rgba(13,189,139,.14);color:var(--matrix);border:1px solid rgba(13,189,139,.3)}
.btn{padding:.8rem 1.5rem;border-radius:10px;text-decoration:none;font-weight:600;font-size:.88rem;
  transition:all .3s var(--ease);display:inline-flex;align-items:center;gap:.5rem;border:none;cursor:pointer;font-family:inherit}
.btn-primary{background:linear-gradient(135deg,var(--purple-500),var(--blue-500));color:#fff;box-shadow:0 8px 30px rgba(109,40,217,.35)}
.btn-primary:hover{transform:translateY(-3px);filter:brightness(1.12)}
.btn-outline{background:rgba(139,77,255,.07);color:var(--purple-200);border:1px solid var(--purple-500)}
.btn-outline:hover{background:rgba(109,40,217,.16);transform:translateY(-3px)}
.btn-green{background:var(--green);color:#fff}
.btn-green:hover{transform:translateY(-3px);filter:brightness(1.1)}
.btn-orange{background:linear-gradient(135deg,var(--orange),var(--yellow));color:#1a1200}
.btn-orange:hover{transform:translateY(-3px)}
.btn-ghost{background:transparent;color:var(--text-dim);border:1px solid var(--border)}
.btn-ghost:hover{border-color:var(--purple-400);color:var(--purple-200)}
.btn-sm{padding:.55rem 1.1rem;font-size:.82rem}
.code-block{background:var(--bg-1);border:1px solid var(--border);border-radius:10px;padding:.8rem .95rem;
  font-family:'JetBrains Mono',monospace;font-size:.8rem;color:var(--cyan-300);
  overflow-x:auto;white-space:nowrap;margin-top:.9rem}
.road{position:relative;padding-left:2.2rem;margin-top:1rem}
.road::before{content:'';position:absolute;left:.55rem;top:.4rem;bottom:.4rem;width:2px;
  background:linear-gradient(180deg,var(--green),var(--purple-500),rgba(139,77,255,.15))}
.road-item{position:relative;margin-bottom:1.6rem}
.road-item::before{content:'';position:absolute;left:-2.05rem;top:.45rem;width:14px;height:14px;
  border-radius:50%;background:var(--bg-0);border:2px solid var(--purple-400)}
.road-item.done::before{background:var(--green);border-color:var(--green);box-shadow:0 0 12px rgba(16,185,129,.6)}
.road-item.arch::before{background:var(--orange);border-color:var(--orange)}
.road-item.paused::before{background:var(--bg-1);border-color:var(--text-muted)}
.road-head{display:flex;gap:.7rem;align-items:center;flex-wrap:wrap;margin-bottom:.3rem}
.road-ver{font-family:'JetBrains Mono',monospace;font-size:.95rem;font-weight:600;color:var(--purple-200)}
.road-name{font-family:'Space Grotesk',sans-serif;font-weight:600}
.road-item p{color:var(--text-dim);font-size:.92rem}
.donate-address{background:var(--bg-1);border:1px solid var(--border);border-radius:10px;
  padding:.85rem 1rem;margin-top:.6rem;font-family:'JetBrains Mono',monospace;font-size:.76rem;
  color:var(--text-dim);word-break:break-all}
.community-card.proton::after{background:linear-gradient(90deg,#6d4aff,#a06bff)}
.community-card.slack::after{background:linear-gradient(90deg,#e01e5a,#36c5f0)}
.community-card.matrix::after{background:linear-gradient(90deg,#0dbd8b,#1a9e74)}
.note{padding:1.3rem 1.5rem;border-radius:16px;margin:2rem 0;font-size:.93rem;color:var(--text-dim);
  background:rgba(251,146,60,.07);border:1px solid rgba(251,146,60,.28)}
.note.info{background:rgba(34,211,238,.06);border-color:rgba(34,211,238,.26)}
.note b{color:var(--text)}
footer{position:relative;z-index:1;text-align:center;padding:2.8rem 1.5rem;
  border-top:1px solid var(--border);color:var(--text-muted);font-size:.84rem}
footer a{color:var(--purple-300);text-decoration:none}
footer a:hover{text-decoration:underline}
.footer-links{display:flex;justify-content:center;gap:1.3rem;flex-wrap:wrap;margin-top:1rem}
.social-row{display:flex;justify-content:center;gap:.8rem;flex-wrap:wrap;margin:1.2rem 0}
.social-row a{width:40px;height:40px;border-radius:12px;background:rgba(139,77,255,.08);
  border:1px solid var(--border);display:flex;align-items:center;justify-content:center;
  color:var(--purple-300);transition:all .3s var(--ease)}
.social-row a:hover{background:rgba(139,77,255,.2);transform:translateY(-3px);color:var(--cyan-300);text-decoration:none}
.tr{position:relative;display:inline-block}
.tr .hi{position:absolute;top:-2.4em;left:50%;transform:translateX(-50%) translateY(8px) scale(.9);
  background:var(--purple-500);color:#fff;font-family:'Noto Sans Devanagari',sans-serif;font-size:.82rem;font-weight:500;
  padding:8px 18px;border-radius:8px;white-space:nowrap;opacity:0;pointer-events:none;
  transition:opacity .3s ease,transform .3s ease;z-index:100;box-shadow:0 0 20px rgba(109,40,217,.5)}
.tr .hi::after{content:'';position:absolute;bottom:-5px;left:50%;transform:translateX(-50%);
  border-left:5px solid transparent;border-right:5px solid transparent;border-top:5px solid var(--purple-500)}
.tr:hover .hi{opacity:1;transform:translateX(-50%) translateY(0) scale(1)}
.tr .hi-long{white-space:normal;width:max-content;max-width:min(78vw,320px);text-align:center;line-height:1.5}
@media (hover:none){.tr .hi{display:none}}
@media (max-width:860px){
  .nav{padding:.7rem 1.1rem}
  .nav-links a{margin-left:.8rem;font-size:.8rem}
  main{padding:6rem 1.15rem 2rem}
}
@media (prefers-reduced-motion:reduce){*{transition-duration:.01ms!important}html{scroll-behavior:auto}}
</style>
</head>
<body>
<div class="bg-grid" aria-hidden="true"></div>
<div class="bg-glow" aria-hidden="true"></div>

<nav class="nav">
  <a href="/" class="nav-brand">
    <img src="/logo.gif" alt="" width="32" height="32" class="brand-mark" onerror="this.src='/logo.png'">
    <span>PGlove</span>
  </a>
  <div class="nav-links">
    <a href="/"><span class="tr">Home<span class="hi">होम</span></span></a>
    <a href="/#download"><span class="tr">Download<span class="hi">डाउनलोड</span></span></a>
    <a href="/#extensions"><span class="tr">Extensions<span class="hi">एक्सटेंशन</span></span></a>
    <a href="/#features"><span class="tr">Features<span class="hi">विशेषताएँ</span></span></a>
    <a href="/#community"><span class="tr">Community<span class="hi">समुदाय</span></span></a>
    <a href="__ACTIVE__"><span class="tr">More<span class="hi">और</span></span></a>
    <a href="https://github.com/TechAdityaBRO/PGlove" class="nav-cta" target="_blank" rel="noopener"><i class="fab fa-github"></i> <span class="tr">GitHub<span class="hi">गिटहब</span></span></a>
  </div>
</nav>

<main>
  <span class="page-tag">__TAG__</span>
  <h1 class="page-title">__H1__</h1>
  <p class="page-sub">__SUB__</p>
__BODY__
</main>

<footer>
  <a href="/" class="nav-brand" style="justify-content:center;font-size:1.2rem">
    <img src="/logo.gif" alt="PGlove" width="28" height="28" class="brand-mark" onerror="this.src='/logo.png'">
    <span>PGlove</span>
  </a>
  <div class="social-row">
    <a href="https://github.com/TechAdityaBRO/PGlove" target="_blank" rel="noopener" aria-label="GitHub"><i class="fab fa-github"></i></a>
    <a href="https://codeberg.org/TechAditya/PGlove/" target="_blank" rel="noopener" aria-label="Codeberg"><i class="fas fa-code-branch"></i></a>
    <a href="https://progroupco.itch.io/pglove" target="_blank" rel="noopener" aria-label="Itch.io"><i class="fab fa-itch-io"></i></a>
    <a href="https://matrix.to/#/#pglove:matrix.org" target="_blank" rel="noopener" aria-label="Matrix"><i class="fas fa-comments"></i></a>
    <a href="https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw" target="_blank" rel="noopener" aria-label="Slack"><i class="fab fa-slack"></i></a>
    <a href="https://brogang.techaditya.workers.dev" target="_blank" rel="noopener" aria-label="BRO GANG"><i class="fas fa-bolt"></i></a>
    <a href="https://progroupai.created.app/" target="_blank" rel="noopener" aria-label="Pro AI"><i class="fas fa-robot"></i></a>
    <a href="https://nexasearch.pages.dev/" target="_blank" rel="noopener" aria-label="Nexa Search"><i class="fas fa-magnifying-glass"></i></a>
    <a href="mailto:pglove@atomicmail.io" aria-label="Email"><i class="fas fa-envelope"></i></a>
  </div>
  <nav class="footer-links" aria-label="Footer">
    <a href="/#download"><span class="tr">Download<span class="hi">डाउनलोड</span></span></a>
    <a href="/#roadmap"><span class="tr">Roadmap<span class="hi">रोडमैप</span></span></a>
    <a href="/#ecosystem"><span class="tr">Ecosystem<span class="hi">पारिस्थितिकी तंत्र</span></span></a>
    <a href="/#credits"><span class="tr">Credits<span class="hi">श्रेय</span></span></a>
    <a href="/v1.0.4/"><span class="tr">v1.0.4 Archive<span class="hi">v1.0.4 आर्काइव</span></span></a>
    <a href="/privacy/"><span class="tr">Privacy Policy<span class="hi">गोपनीयता नीति</span></span></a>
    <a href="/terms/"><span class="tr">Terms &amp; Conditions<span class="hi">नियम एवं शर्तें</span></span></a>
    <a href="mailto:pglove@atomicmail.io">pglove@atomicmail.io</a>
  </nav>
  <p style="margin-top:1.2rem;font-size:.76rem;max-width:720px;margin-left:auto;margin-right:auto">
    <span class="tr">Pokemon and all related trademarks belong to The Pokémon Company. Made in India &#127471;&#127467; for the world, for next zen internet exploration.<span class="hi hi-long">पोकेमॉन और उससे जुड़े सभी ट्रेडमार्क The Pokémon Company के हैं। भारत में बना, दुनिया के लिए — अगली पीढ़ी की इंटरनेट खोज के लिए।</span></span>
  </p>
</footer>

</body>
</html>
'@

# ---------------------------------------------------------------------------
$pages = @()

$pages += @{
  file    = "extensions.html"
  canon   = "https://pglove.jo3.org/extensions.html"
  title   = "PGlove Extensions - Pokemon, Minecraft, GTA 6, Vice City Themes | PGlove"
  desc    = "PGlove browser themes and add-ons. Pokemon theme (archived v1.0.4), Minecraft in development, GTA 6 and Vice City paused. Built for Tauri 2, Rust and WebView2."
  keys    = "PGlove extensions, PGlove themes, Pokemon browser theme, Minecraft browser theme, GTA 6 browser theme, Vice City browser theme, BRO GANG"
  active  = "/extensions.html"
  crumb   = "Extensions"
  schemaType = "CollectionPage"
  aboutVersion = "1.0.4"
  tag     = "<span class=`"tr`">Extensions<span class=`"hi`">एक्सटेंशन</span></span>"
  h1      = "<span class=`"tr`">PGlove Extensions<span class=`"hi`">पीग्लव एक्सटेंशन</span></span>"
  sub     = "<span class=`"tr`">Themes and add-ons for every engine we ship. Status is honest - one shipped, one in development, two paused.<span class=`"hi hi-long`">हर इंजन के लिए थीम और ऐड-ऑन। स्थिति ईमानदार है — एक जारी, एक विकास में, दो रुके हुए।</span></span>"
  body    = @'

  <h2 class="block-title"><span class="tr">Shipped<span class="hi">जारी</span></span></h2>
  <p class="block-sub"><span class="tr">Themes that exist today and can be installed right now.<span class="hi">आज मौजूद थीम जिन्हें अभी इंस्टॉल किया जा सकता है।</span></span></p>
  <div class="grid">
    <a class="card c-archived" href="/v1.0.4/">
      <span class="badge b-orange"><span class="tr">Archived<span class="hi">संग्रहीत</span></span></span>
      <span class="card-ico">&#129408;</span>
      <h3><span class="tr">Pokemon Theme<span class="hi">पोकेमॉन थीम</span></span></h3>
      <p><span class="tr">The v1.0.4 signature release. Poke ball UI, 151 hand-drawn 8-bit icons, nostalgic sounds, and six type-based colour schemes. Built with Tauri 2, Rust and WebView2.<span class="hi hi-long">v1.0.4 की सिग्नेचर रिलीज़। पोकेबॉल UI, 151 हाथ से बने 8-बिट आइकन, नॉस्टैल्जिक ध्वनियाँ और छह टाइप-आधारित कलर स्कीम। Tauri 2, Rust और WebView2 के साथ बनी।</span></span></p>
      <div class="card-actions">
        <span class="btn btn-orange btn-sm"><i class="fas fa-box-archive"></i> <span class="tr">Open archive<span class="hi">आर्काइव खोलें</span></span></span>
        <span class="btn btn-ghost btn-sm"><i class="fab fa-github"></i> <span class="tr">Source<span class="hi">सोर्स</span></span></span>
      </div>
    </a>
  </div>

  <h2 class="block-title"><span class="tr">In development<span class="hi">विकास में</span></span></h2>
  <p class="block-sub"><span class="tr">Started, but waiting on funding before they can ship.<span class="hi">शुरू किए गए, लेकिन जारी होने से पहले फंडिंग की प्रतीक्षा में हैं।</span></span></p>
  <div class="grid">
    <a class="card c-dev" href="/#roadmap">
      <span class="badge b-purple"><span class="tr">v1.0.5 - In Development<span class="hi">v1.0.5 - विकास में</span></span></span>
      <span class="card-ico">&#9934;&#65039;</span>
      <h3>Minecraft</h3>
      <p><span class="tr">Blocky green palette, pixel-perfect chrome, and crafting-flavoured sidebar. Planned for v1.0.5.<span class="hi">ब्लॉकी हरी पैलेट, पिक्सल-परफेक्ट क्रोम और क्राफ्टिंग-स्टाइल साइडबार। v1.0.5 के लिए योजित।</span></span></p>
      <div class="card-actions"><span class="btn btn-outline btn-sm"><i class="fas fa-road"></i> <span class="tr">See roadmap<span class="hi">रोडमैप देखें</span></span></span></div>
    </a>
  </div>

  <h2 class="block-title"><span class="tr">Paused<span class="hi">रुके हुए</span></span></h2>
  <p class="block-sub"><span class="tr">Designed on paper, not yet built. Picking these up needs funding.<span class="hi">कागज़ पर डिज़ाइन किए गए, अभी बनाए नहीं गए। इन्हें शुरू करने के लिए फंडिंग चाहिए।</span></span></p>
  <div class="grid">
    <a class="card c-paused" href="/#roadmap">
      <span class="badge b-grey"><span class="tr">v1.0.6 - Paused<span class="hi">v1.0.6 - रुका हुआ</span></span></span>
      <span class="card-ico">&#127961;&#65039;</span>
      <h3>GTA 6</h3>
      <p><span class="tr">Leonida-inspired neon and sunset palette. Planned for v1.0.6.<span class="hi">लियोनिडा से प्रेरित नियॉन और सनसेट पैलेट। v1.0.6 के लिए योजित।</span></span></p>
      <div class="card-actions"><span class="btn btn-ghost btn-sm"><i class="fas fa-road"></i> <span class="tr">See roadmap<span class="hi">रोडमैप देखें</span></span></span></div>
    </a>
    <a class="card c-paused" href="/#roadmap">
      <span class="badge b-grey"><span class="tr">v1.0.7 - Paused<span class="hi">v1.0.7 - रुका हुआ</span></span></span>
      <span class="card-ico">&#127752;</span>
      <h3>Vice City</h3>
      <p><span class="tr">Neon-soaked retro theme with synthwave chrome. Planned for v1.0.7.<span class="hi">सिंथवेव क्रोम के साथ नीयन-युक्त रेट्रो थीम। v1.0.7 के लिए योजित।</span></span></p>
      <div class="card-actions"><span class="btn btn-ghost btn-sm"><i class="fas fa-road"></i> <span class="tr">See roadmap<span class="hi">रोडमैप देखें</span></span></span></div>
    </a>
  </div>

  <div class="note">
    <b><span class="tr">Want to build your own?<span class="hi">अपनी थीम बनाना चाहते हैं?</span></span></b>
    <span class="tr">PGlove is BSD 3-Clause licensed and the engine is the theme layer, so you can replace the entire look rather than restyle one stylesheet. Fork the repo and open a pull request.<span class="hi hi-long">पीग्लव BSD 3-Clause लाइसेंस प्राप्त है और इंजन ही थीम लेयर है, इसलिए आप एक स्टाइलशीट बदलने के बजाय पूरा लुक बदल सकते हैं। रिपॉज़िटरी फोर्क करें और पुल रिक्वेस्ट खोलें।</span></span>
    <div class="card-actions">
      <a href="https://github.com/TechAdityaBRO/PGlove" class="btn btn-primary btn-sm" target="_blank" rel="noopener"><i class="fab fa-github"></i> Fork on GitHub</a>
      <a href="https://codeberg.org/TechAditya/PGlove/" class="btn btn-ghost btn-sm" target="_blank" rel="noopener"><i class="fas fa-code-branch"></i> Codeberg</a>
    </div>
  </div>

  <h2 class="block-title"><span class="tr">How a theme is put together<span class="hi">एक थीम कैसे बनती है</span></span></h2>
  <p class="block-sub"><span class="tr">Every PGlove theme replaces the same four layers. This is why a new one is a focused job rather than a rewrite.<span class="hi">हर पीग्लव थीम एक ही चार परतें बदलती है। इसीलिए नई थीम एक दोबारा लिखना नहीं, एक सीमित काम है।</span></span></p>
  <div class="grid">
    <div class="card c-default">
      <span class="card-ico">&#127912;</span>
      <h3><span class="tr">Colour system<span class="hi">कलर सिस्टम</span></span></h3>
      <p><span class="tr">A defined palette mapped onto the engine's CSS custom properties. This is the layer you see most, and the one that decides whether a theme feels coherent or noisy.<span class="hi">इंजन की CSS कस्टम प्रॉपर्टीज पर मैप किया गया तय पैलेट। यही वह परत है जो सबसे ज़्यादा दिखती है, और तय करती है कि थीम सुसंगत लगेगी या बेतरतीब।</span></span></p>
    </div>
    <div class="card c-default">
      <span class="card-ico">&#128444;</span>
      <h3><span class="tr">Icon set<span class="hi">आइकन सेट</span></span></h3>
      <p><span class="tr">A complete hand-drawn set covering every browser action, drawn in one consistent style. Gaps are the usual reason a theme looks unfinished, so this is the longest single task.<span class="hi">हर ब्राउज़र क्रिया के लिए एक पूरा हाथ से बना सेट, एक ही शैली में। कमी ही वह आम वजह है जिससे थीम अधूरी लगती है, इसलिए यही सबसे लंबा अकेला काम है।</span></span></p>
    </div>
    <div class="card c-default">
      <span class="card-ico">&#128266;</span>
      <h3><span class="tr">Sound design<span class="hi">साउंड डिज़ाइन</span></span></h3>
      <p><span class="tr">Optional audio for events like opening a tab or completing a search, kept off by default. Every theme ships its own rather than reusing a shared pack, so it has to be produced from scratch.<span class="hi">टैब खोलने या सर्च पूरी होने जैसी घटनाओं के लिए वैकल्पिक ऑडियो, जो डिफ़ॉल्ट रूप से बंद रहता है। हर थीम अपना साउंड लाती है, साझा पैक नहीं, इसलिए शुरू से बनाना पड़ता है।</span></span></p>
    </div>
    <div class="card c-default">
      <span class="card-ico">&#128202;</span>
      <h3><span class="tr">Regression pass<span class="hi">रिग्रेशन पास</span></span></h3>
      <p><span class="tr">Checking every screen against the new palette for contrast failures and unreadable states. Unglamorous, and the reason finished themes stay usable rather than merely pretty.<span class="hi">हर स्क्रीन को नई पैलेट के साथ कंट्रास्ट फेल्योर और अपठनीय स्थितियों के लिए जाँचना। निष्प्रभावी काम, लेकिन इसीलिए पूरी थीमें इस्तेमाल योग्य रहती हैं, सिर्फ सुंदर नहीं।</span></span></p>
    </div>
  </div>

  <h2 class="block-title"><span class="tr">Choosing where to start<span class="hi">कहाँ से शुरू करें</span></span></h2>
  <div class="grid narrow">
    <div class="card c-live">
      <h3><span class="tr">Just want a browser?<span class="hi">बस एक ब्राउज़र चाहिए?</span></span></h3>
      <p><span class="tr">Install stable v1.0.3 and use it as your daily driver. It is the tested build and the one with no known data-loss issues.<span class="hi">स्थिर v1.0.3 इंस्टॉल करें और इसे रोज़ के ब्राउज़र की तरह इस्तेमाल करें। यह टेस्ट की गई बिल्ड है और इसमें डेटा-हानि की कोई ज्ञात समस्या नहीं है।</span></span></p>
      <div class="card-actions">
        <a href="/#download" class="btn btn-primary btn-sm"><i class="fas fa-download"></i> <span class="tr">Get v1.0.3<span class="hi">v1.0.3 लें</span></span></a>
      </div>
    </div>
    <div class="card c-archived">
      <h3><span class="tr">Want the Pokemon theme?<span class="hi">पोकेमॉन थीम चाहिए?</span></span></h3>
      <p><span class="tr">The v1.0.4 archive is permanently available with its source. Treat the packages as preserved artifacts rather than maintained releases.<span class="hi">v1.0.4 आर्काइव उसके सोर्स के साथ स्थायी रूप से उपलब्ध है। पैकेजों को अनुरक्षित रिलीज़ नहीं, सुरक्षित रखे गए कलाकृत मानें।</span></span></p>
      <div class="card-actions">
        <a href="/v1.0.4/" class="btn btn-outline btn-sm"><i class="fas fa-box-archive"></i> <span class="tr">Open archive<span class="hi">आर्काइव खोलें</span></span></a>
      </div>
    </div>
    <div class="card c-paused">
      <h3><span class="tr">Waiting on Minecraft, GTA 6 or Vice City?<span class="hi">Minecraft, GTA 6 या Vice City का इंतज़ार है?</span></span></h3>
      <p><span class="tr">Those three are designed but paused pending funding. There is no schedule to wait for, so funding is the only real unblock.<span class="hi">तीनों डिज़ाइन किए जा चुके हैं लेकिन फंडिंग की प्रतीक्षा में रुके हैं। इंतज़ार करने के लिए कोई समय-सारणी नहीं है, इसलिए फंडिंग ही असली रुकावट है।</span></span></p>
      <div class="card-actions">
        <a href="/roadmap.html" class="btn btn-ghost btn-sm"><i class="fas fa-road"></i> <span class="tr">See roadmap<span class="hi">रोडमैप देखें</span></span></a>
        <a href="/support.html" class="btn btn-ghost btn-sm"><i class="fas fa-heart"></i> <span class="tr">Support us<span class="hi">सहायता करें</span></span></a>
      </div>
    </div>
  </div>
'@
}

$pages += @{
  file    = "features.html"
  canon   = "https://pglove.jo3.org/features.html"
  title   = "PGlove Features - A Real Tauri 2 Browser, Privacy First | PGlove"
  desc    = "PGlove browser features: real Tauri 2 and Rust core instead of an Electron wrapper, per-tab WebView2 isolation, no telemetry, themeable engine, featherweight 4 GB footprint, made in India."
  keys    = "PGlove features, Tauri 2 browser, Rust browser, WebView2 per-tab isolation, privacy browser, no telemetry, open source browser, Made in India"
  active  = "/features.html"
  crumb   = "Features"
  schemaType = "WebPage"
  aboutVersion = ""
  tag     = "<span class=`"tr`">Features<span class=`"hi`">विशेषताएँ</span></span>"
  h1      = "<span class=`"tr`">Why PGlove<span class=`"hi`">पीग्लव क्यों</span></span>"
  sub     = "<span class=`"tr`">Six reasons this browser is different. No marketing fluff - just what is actually in the build.<span class=`"hi hi-long`">छह कारण यह ब्राउज़र अलग है। कोई मार्केटिंग नहीं — बस वही जो बिल्ड में सचमुच है।</span></span>"
  body    = @'

  <h2 class="block-title"><span class="tr">Under the hood<span class="hi">अंदर से</span></span></h2>
  <p class="block-sub"><span class="tr">The parts that make PGlove behave differently from the browsers it replaces.<span class="hi">वे हिस्से जो पीग्लव को उन ब्राउज़रों से अलग बनाते हैं जिनकी यह जगह लेता है।</span></span></p>
  <div class="grid">
    <div class="card c-default">
      <span class="card-ico">&#9889;</span>
      <h3><span class="tr">Real Tauri 2 core<span class="hi">असली Tauri 2 कोर</span></span></h3>
      <p><span class="tr">A genuine Rust backend, not an Electron wrapper. Small binary, fast cold start, and memory that scales with your tabs instead of the runtime.<span class="hi">असली Rust बैकएंड, Electron रैपर नहीं। छोटा बाइनरी, तेज़ कॉल्ड स्टार्ट, और मेमोरी जो रनटाइम के बजाय आपके टैब के साथ बढ़ती है।</span></span></p>
      <div class="code-block">Tauri 2 &middot; Rust &middot; WebView2</div>
    </div>
    <div class="card c-default">
      <span class="card-ico">&#128194;</span>
      <h3><span class="tr">Per-tab isolation<span class="hi">प्रति-टैब आइसोलेशन</span></span></h3>
      <p><span class="tr">Every tab is its own WebView2 instance with genuine per-tab history, so one bad page cannot reach into another tab's session.<span class="hi">हर टैब अपना WebView2 इंस्टेंस है, असली प्रति-टैब हिस्ट्री के साथ, इसलिए कोई बुरा पेज दूसरे टैब के सेशन तक नहीं पहुँच सकता।</span></span></p>
    </div>
    <div class="card c-dev">
      <span class="card-ico">&#127912;</span>
      <h3><span class="tr">Themeable core<span class="hi">थीम योग्य कोर</span></span></h3>
      <p><span class="tr">The engine is the theme layer. Swap the whole look, not one stylesheet - which is how the Pokemon, Minecraft, GTA 6 and Vice City themes work.<span class="hi">इंजन ही थीम लेयर है। पूरा लुक बदलें, सिर्फ एक स्टाइलशीट नहीं - यही पोकेमॉन, Minecraft, GTA 6 और Vice City थीम का तरीका है।</span></span></p>
      <div class="card-actions">
        <a href="/extensions.html" class="btn btn-outline btn-sm"><i class="fas fa-palette"></i> <span class="tr">Extensions<span class="hi">एक्सटेंशन</span></span></a>
      </div>
    </div>
  </div>

  <h2 class="block-title"><span class="tr">What you get<span class="hi">आपको क्या मिलता है</span></span></h2>
  <p class="block-sub"><span class="tr">The practical side: what PGlove does with your data, and what hardware it asks of you.<span class="hi">व्यावहारिक पक्ष: पीग्लव आपके डेटा के साथ क्या करता है, और कितने हार्डवेयर की माँग करता है।</span></span></p>
  <div class="grid">
    <div class="card c-live">
      <span class="card-ico">&#128274;</span>
      <h3><span class="tr">Privacy first<span class="hi">प्राइवेसी पहले</span></span></h3>
      <p><span class="tr">No telemetry, no analytics, no tracking pixels, and no data sold. Your browsing history is written to your own disk and never transmitted to us.<span class="hi">कोई टेलीमेट्री नहीं, कोई एनालिटिक्स नहीं, कोई ट्रैकिंग पिक्सेल नहीं, और डेटा बेचा नहीं जाता। आपकी हिस्ट्री आपकी डिस्क पर लिखी जाती है और हमें कभी नहीं भेजी जाती।</span></span></p>
      <div class="card-actions">
        <a href="/privacy/" class="btn btn-ghost btn-sm"><i class="fas fa-shield-halved"></i> <span class="tr">Privacy Policy<span class="hi">गोपनीयता नीति</span></span></a>
      </div>
    </div>
    <div class="card c-archived">
      <span class="card-ico">&#129718;</span>
      <h3><span class="tr">Featherweight<span class="hi">पंखों जितनी हल्की</span></span></h3>
      <p><span class="tr">Runs happily on 4 GB RAM and integrated Intel UHD Graphics 600 - the same machine this project was written on.<span class="hi">4 GB रैम और इंटीग्रेटेड Intel UHD Graphics 600 पर आराम से चलती है - वही मशीन जिस पर यह प्रोजेक्ट लिखा गया।</span></span></p>
    </div>
    <div class="card c-done">
      <span class="card-ico">&#127471;&#127479;</span>
      <h3><span class="tr">Made in India for the world<span class="hi">भारत में बना, दुनिया के लिए</span></span></h3>
      <p><span class="tr">Designed, written, and shipped from India for everyone, for next zen internet exploration.<span class="hi">पूरी दुनिया के लिए भारत से डिज़ाइन, लिखा और रिलीज़ किया गया - अगली पीढ़ी की इंटरनेट खोज के लिए।</span></span></p>
    </div>
  </div>

  <div class="note info">
    <b><span class="tr">Experimental by design.<span class="hi">डिज़ाइन से ही प्रयोगात्मक।</span></span></b>
    <span class="tr">PGlove calls itself experimental because it is. Nighty builds are unstable and may lose data. Keep backups of anything you cannot afford to lose.<span class="hi hi-long">पीग्लव खुद को प्रयोगात्मक कहता है क्योंकि यह सच है। नाइटी बिल्ड अस्थिर हैं और डेटा खो सकते हैं। जो कुछ भी आप नहीं खोना चाहेंगे, उसका बैकअप रखें।</span></span>
    <div class="card-actions">
      <a href="/#download" class="btn btn-primary btn-sm"><i class="fas fa-download"></i> <span class="tr">Get stable v1.0.3<span class="hi">स्थिर v1.0.3 लें</span></span></a>
      <a href="/terms/" class="btn btn-ghost btn-sm"><i class="fas fa-file-contract"></i> <span class="tr">Terms<span class="hi">नियम</span></span></a>
    </div>
  </div>
'@
}

$pages += @{
  file    = "roadmap.html"
  canon   = "https://pglove.jo3.org/roadmap.html"
  title   = "PGlove Roadmap - v1.0.3 Live, v1.0.4 Archived, v1.0.5-7 Paused | PGlove"
  desc    = "PGlove browser roadmap with honest status. v1.0.3 is the stable release, v1.0.4 Pokemon theme is archived, and v1.0.5, v1.0.6 and v1.0.7 are paused pending funding."
  keys    = "PGlove roadmap, PGlove v1.0.3, PGlove v1.0.4, PGlove v1.0.5, PGlove release history, browser funding"
  active  = "/roadmap.html"
  crumb   = "Roadmap"
  schemaType = "WebPage"
  aboutVersion = "1.0.3"
  tag     = "<span class=`"tr`">Roadmap<span class=`"hi`">रोडमैप</span></span>"
  h1      = "<span class=`"tr`">Where PGlove is going<span class=`"hi`">पीग्लव कहाँ जा रहा है</span></span>"
  sub     = "<span class=`"tr`">Honest status. No fake dates, no vapourware. If a version is paused, it says paused.<span class=`"hi hi-long`">ईमानदार स्थिति। कोई नकली तारीख नहीं, कोई वेपरवेयर नहीं। यदि कोई संस्करण रुका हुआ है, तो यहाँ रुका हुआ लिखा है।</span></span>"
  body    = @'

  <h2 class="block-title"><span class="tr">Release history<span class="hi">रिलीज़ इतिहास</span></span></h2>
  <p class="block-sub"><span class="tr">Every version, what it did, and what happened to it. Nothing here is aspirational.<span class="hi">हर संस्करण, उसने क्या किया, और उसका क्या हुआ। यहाँ कुछ भी कल्पना नहीं है।</span></span></p>
  <div class="road">
    <div class="road-item done">
      <div class="road-head">
        <span class="road-ver">v1.0.3</span>
        <span class="road-name"><span class="tr">Stable<span class="hi">स्थिर</span></span></span>
        <span class="badge b-green"><span class="tr">Live<span class="hi">लाइव</span></span></span>
      </div>
      <p><span class="tr">The current stable release and the one we recommend. Built on a real Tauri 2 and Rust core with per-tab WebView2 isolation, and the first build to ship without telemetry. Available on NPM, NuGet, Winget (pending), itch.io and the Internet Archive. <a href="/#download" style="color:#ab7bff">Download it &rarr;</a><span class="hi hi-long">वर्तमान स्थिर रिलीज़ और वही जिसकी हम सिफ़ारिश करते हैं। असली Tauri 2 और Rust कोर पर बनी, प्रति-टैब WebView2 आइसोलेशन के साथ, और टेलीमेट्री के बिना जाने वाली पहली बिल्ड। NPM, NuGet, Winget (लंबित), itch.io और Internet Archive पर उपलब्ध। <a href="/#download" style="color:#ab7bff">डाउनलोड करें &rarr;</a></span></span></p>
    </div>
    <div class="road-item arch">
      <div class="road-head">
        <span class="road-ver">v1.0.4</span>
        <span class="road-name"><span class="tr">Pokemon Theme<span class="hi">पोकेमॉन थीम</span></span></span>
        <span class="badge b-orange"><span class="tr">Archived<span class="hi">संग्रहीत</span></span></span>
      </div>
      <p><span class="tr">The Pokemon theme shipped, then was archived so the source stays available permanently. Poke ball UI, 151 hand-drawn 8-bit icons, nostalgic sounds and six type-based colour schemes. Built with Tauri 2, Rust and WebView2 by Aditya Kumar Sethi and Darshil Sharma. <a href="/v1.0.4/" style="color:#ab7bff">Open the archive &rarr;</a><span class="hi hi-long">पोकेमॉन थीम जारी हुई, फिर आर्काइव कर दी गई ताकि सोर्स हमेशा के लिए उपलब्ध रहे। पोकेबॉल UI, 151 हाथ से बने 8-बिट आइकन, नॉस्टैल्जिक ध्वनियाँ और छह टाइप-आधारित कलर स्कीम। आदित्य कुमार सेठी और दर्शील शर्मा द्वारा Tauri 2, Rust और WebView2 के साथ निर्मित। <a href="/v1.0.4/" style="color:#ab7bff">आर्काइव खोलें &rarr;</a></span></span></p>
    </div>
    <div class="road-item paused">
      <div class="road-head">
        <span class="road-ver">v1.0.5</span>
        <span class="road-name">Minecraft</span>
        <span class="badge b-grey"><span class="tr">Paused - Funding<span class="hi">रुका हुआ - फंडिंग</span></span></span>
      </div>
      <p><span class="tr">Designed but not started. Blocky green palette, pixel-perfect chrome, and a crafting-flavoured sidebar. Nothing is in progress.<span class="hi">डिज़ाइन किए गए लेकिन शुरू नहीं किए। ब्लॉकी हरी पैलेट, पिक्सल-परफेक्ट क्रोम और क्राफ्टिंग-स्टाइल साइडबार। कोई काम प्रगति पर नहीं।</span></span></p>
    </div>
    <div class="road-item paused">
      <div class="road-head">
        <span class="road-ver">v1.0.6</span>
        <span class="road-name">GTA 6</span>
        <span class="badge b-grey"><span class="tr">Paused - Funding<span class="hi">रुका हुआ - फंडिंग</span></span></span>
      </div>
      <p><span class="tr">Designed but not started. Leonida-inspired neon and sunset palette. Nothing is in progress.<span class="hi">डिज़ाइन किए गए लेकिन शुरू नहीं किए। लियोनिडा से प्रेरित नियॉन और सनसेट पैलेट। कोई काम प्रगति पर नहीं।</span></span></p>
    </div>
    <div class="road-item paused">
      <div class="road-head">
        <span class="road-ver">v1.0.7</span>
        <span class="road-name">Vice City</span>
        <span class="badge b-grey"><span class="tr">Paused - Funding<span class="hi">रुका हुआ - फंडिंग</span></span></span>
      </div>
      <p><span class="tr">Designed but not started. Neon-soaked retro theme with synthwave chrome. Nothing is in progress.<span class="hi">डिज़ाइन किए गए लेकिन शुरू नहीं किए। सिंथवेव क्रोम के साथ नीयन-युक्त रेट्रो थीम। कोई काम प्रगति पर नहीं।</span></span></p>
    </div>
  </div>

  <h2 class="block-title"><span class="tr">Why development stopped<span class="hi">विकास क्यों रुका</span></span></h2>
  <p class="block-sub"><span class="tr">The honest answer, because vague roadmaps waste everyone's time.<span class="hi">सीधा जवाब, क्योंकि अस्पष्ट रोडमैप सबका समय बर्बाद करते हैं।</span></span></p>
  <div class="grid">
    <div class="card c-default">
      <span class="card-ico">&#128176;</span>
      <h3><span class="tr">No revenue, no sponsors<span class="hi">न आय, न स्पॉन्सर</span></span></h3>
      <p><span class="tr">PGlove has no ads, no sponsor deals, no paid tier and no paywall. There is no income attached to the project, so the releases after v1.0.4 need money to exist at all.<span class="hi">पीग्लव में कोई विज्ञापन नहीं, कोई स्पॉन्सर डील नहीं, कोई पेड टियर नहीं और कोई पेवॉल नहीं। प्रोजेक्ट से कोई आय नहीं जुड़ी है, इसलिए v1.0.4 के बाद की रिलीज़ के लिए पैसा चाहिए।</span></span></p>
    </div>
    <div class="card c-default">
      <span class="card-ico">&#9203;</span>
      <h3><span class="tr">Built on donated hardware<span class="hi">दान किए हार्डवेयर पर बना</span></span></h3>
      <p><span class="tr">Development happens on a 4 GB machine with a Tiny 10 LTSC install and integrated Intel UHD Graphics 600. That is enough to build and test, but not enough to run everything at once.<span class="hi">विकास 4 GB मशीन पर होता है, जिसमें Tiny 10 LTSC इंस्टॉल और इंटीग्रेटेड Intel UHD Graphics 600 है। बनाने और जाँचने के लिए पर्याप्त, लेकिन सब कुछ एक साथ चलाने के लिए नहीं।</span></span></p>
    </div>
    <div class="card c-archived">
      <span class="card-ico">&#9989;</span>
      <h3><span class="tr">Paused, not abandoned<span class="hi">रुका हुआ, छोड़ा नहीं</span></span></h3>
      <p><span class="tr">The source for every version is public and the v1.0.4 archive is permanent. If funding arrives, work resumes exactly where it stopped - nothing has to be rewritten.<span class="hi">हर संस्करण का सोर्स सार्वजनिक है और v1.0.4 आर्काइव स्थायी है। फंडिंग मिलने पर काम ठीक वहीं से शुरू होगा जहाँ रुका - कुछ भी दोबारा लिखने की ज़रूरत नहीं।</span></span></p>
    </div>
  </div>

  <h2 class="block-title"><span class="tr">What funding would unlock<span class="hi">फंडिंग से क्या खुलेगा</span></span></h2>
  <div class="grid">
    <div class="card c-dev">
      <span class="card-ico">&#128640;</span>
      <h3><span class="tr">Theme production<span class="hi">थीम निर्माण</span></span></h3>
      <p><span class="tr">Each theme needs a full icon set, sound design, colour system and regression pass. That is the single largest cost per release.<span class="hi">हर थीम के लिए पूरा आइकन सेट, साउंड डिज़ाइन, कलर सिस्टम और रिग्रेशन टेस्ट चाहिए। यही हर रिलीज़ की सबसे बड़ी लागत है।</span></span></p>
    </div>
    <div class="card c-dev">
      <span class="card-ico">&#129438;</span>
      <h3><span class="tr">Signed Windows builds<span class="hi">साइन किए Windows बिल्ड</span></span></h3>
      <p><span class="tr">A code-signing certificate removes the SmartScreen warning that currently appears on first launch. This is a fixed annual fee.<span class="hi">कोड-साइनिंग सर्टिफिकेट वह SmartScreen चेतावनी हटा देता है जो पहली बार लॉन्च पर आती है। यह एक निश्चित वार्षिक शुल्क है।</span></span></p>
    </div>
    <div class="card c-dev">
      <span class="card-ico">&#128187;</span>
      <h3><span class="tr">Test hardware<span class="hi">टेस्ट हार्डवेयर</span></span></h3>
      <p><span class="tr">Testing only on one machine hides bugs that appear on other GPUs, RAM configurations and screen sizes.<span class="hi">सिर्फ एक मशीन पर टेस्ट करने से दूसरे GPU, RAM कॉन्फ़िगरेशन और स्क्रीन साइज़ पर आने वाले बग छिप जाते हैं।</span></span></p>
    </div>
  </div>

  <div class="note">
    <b><span class="tr">Funding is the only blocker.<span class="hi">फंडिंग ही एकमात्र अड़चन है।</span></span></b>
    <span class="tr">v1.0.5 through v1.0.7 are paused, not abandoned. Bitcoin donations on the support page go straight toward resuming development.<span class="hi hi-long">v1.0.5 से v1.0.7 तक रुके हैं, छोड़े नहीं गए। सपोर्ट पेज पर बिटकॉइन दान सीधे विकास फिर शुरू करने के लिए जाता है।</span></span>
    <div class="card-actions">
      <a href="/support.html" class="btn btn-orange btn-sm"><i class="fas fa-heart"></i> <span class="tr">Support the project<span class="hi">प्रोजेक्ट सहायता करें</span></span></a>
      <a href="https://github.com/TechAdityaBRO/PGlove/issues" class="btn btn-ghost btn-sm" target="_blank" rel="noopener"><i class="fab fa-github"></i> <span class="tr">Open an issue<span class="hi">इश्यू खोलें</span></span></a>
    </div>
  </div>
'@
}

$pages += @{
  file    = "support.html"
  canon   = "https://pglove.jo3.org/support.html"
  title   = "PGlove Support - Community, Email, GitHub Issues, Bitcoin Donations | PGlove"
  desc    = "Get help with PGlove. Join the community on Proton Meet, Slack or Matrix, email pglove@atomicmail.io, open a GitHub issue, or support development with a Bitcoin donation."
  keys    = "PGlove support, PGlove help, PGlove community, PGlove Matrix, PGlove Slack, PGlove email support, PGlove donate"
  active  = "/support.html"
  crumb   = "Support"
  schemaType = "ContactPage"
  aboutVersion = ""
  tag     = "<span class=`"tr`">Support<span class=`"hi`">सहायता</span></span>"
  h1      = "<span class=`"tr`">Get help<span class=`"hi`">मदद लें</span></span>"
  sub     = "<span class=`"tr`">Bug reports, build questions, funding questions - pick whichever channel suits you.<span class=`"hi hi-long`">बग रिपोर्ट, बिल्ड से जुड़े सवाल, फंडिंग - जो चैनल आपको ठीक लगे चुनें।</span></span>"
  body    = @'

  <h2 class="block-title"><span class="tr">Community rooms<span class="hi">सामुदायिक कमरे</span></span></h2>
  <p class="block-sub"><span class="tr">Live dev sessions, async discussion, and encrypted chat.<span class="hi">लाइव डेव सेशन, एसिंक चर्चा और एन्क्रिप्टेड चैट।</span></span></p>
  <div class="grid">
    <a class="card community-card proton" href="https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H" target="_blank" rel="noopener">
      <span class="badge b-purple">Proton Meet</span>
      <span class="card-ico">&#128249;</span>
      <h3><span class="tr">Proton Meet<span class="hi">प्रोटोन मीट</span></span></h3>
      <p><span class="tr">End-to-end encrypted video room for live dev sessions.<span class="hi">लाइव डेव सेशन के लिए एंड-टू-एंड एन्क्रिप्टेड वीडियो रूम।</span></span></p>
    </a>
    <a class="card community-card slack" href="https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw" target="_blank" rel="noopener">
      <span class="badge b-purple">Slack</span>
      <span class="card-ico">&#128172;</span>
      <h3>Slack</h3>
      <p><span class="tr">Async discussions, bug reports, and feature requests in the #pglovebrowser workspace.<span class="hi">#pglovebrowser वर्कस्पेस में एसिंक चर्चा, बग रिपोर्ट और फीचर रिक्वेस्ट।</span></span></p>
    </a>
    <a class="card community-card matrix" href="https://matrix.to/#/#pglove:matrix.org" target="_blank" rel="noopener">
      <span class="badge b-matrix">Matrix</span>
      <span class="card-ico">&#128172;&#65039;</span>
      <h3>Matrix</h3>
      <p><span class="tr">Decentralized, federated, encrypted. Join #pglove:matrix.org on any client.<span class="hi">विकेंद्रीकृत, फेडरेटेड, एन्क्रिप्टेड। किसी भी क्लाइंट पर #pglove:matrix.org से जुड़ें।</span></span></p>
    </a>
  </div>

  <h2 class="block-title"><span class="tr">Direct contact<span class="hi">सीधा संपर्क</span></span></h2>
  <div class="grid narrow">
    <div class="card c-default">
      <span class="card-ico">&#9993;</span>
      <h3><span class="tr">Email<span class="hi">ईमेल</span></span></h3>
      <p><span class="tr">Slowest but most thorough. Good for detailed bug reports with logs.<span class="hi">सबसे धीमा लेकिन सबसे पूरा। लॉग के साथ विस्तृत बग रिपोर्ट के लिए अच्छा।</span></span></p>
      <div class="code-block">pglove@atomicmail.io</div>
      <div class="card-actions">
        <a href="mailto:pglove@atomicmail.io" class="btn btn-primary btn-sm"><i class="fas fa-envelope"></i> <span class="tr">Write to us<span class="hi">हमें लिखें</span></span></a>
      </div>
    </div>
    <div class="card c-default">
      <span class="card-ico"><i class="fab fa-github"></i></span>
      <h3>GitHub Issues</h3>
      <p><span class="tr">Fastest for reproducible bugs. Search first - someone may have hit it already.<span class="hi">दोहराने योग्य बग के लिए सबसे तेज़। पहले खोजें - हो सकता है किसी को पहले ही मिला हो।</span></span></p>
      <div class="card-actions">
        <a href="https://github.com/TechAdityaBRO/PGlove/issues" class="btn btn-ghost btn-sm" target="_blank" rel="noopener"><i class="fas fa-bug"></i> <span class="tr">Open an issue<span class="hi">इश्यू खोलें</span></span></a>
        <a href="https://github.com/TechAdityaBRO/PGlove/blob/main/LICENSE" class="btn btn-ghost btn-sm" target="_blank" rel="noopener"><i class="fas fa-scale-balanced"></i> BSD 3-Clause</a>
      </div>
    </div>
  </div>

  <h2 class="block-title">&#8383; <span class="tr">Donate<span class="hi">दान करें</span></span></h2>
  <p class="block-sub"><span class="tr">No ads, no sponsors, no paywall. Donations are what unblock v1.0.5 through v1.0.7.<span class="hi">कोई विज्ञापन नहीं, कोई स्पॉन्सर नहीं, कोई पेवॉल नहीं। दान ही v1.0.5 से v1.0.7 का रास्ता खोलते हैं।</span></span></p>
  <div class="grid narrow">
    <div class="card c-archived">
      <span class="card-ico">&#8383;</span>
      <h3><span class="tr">Bitcoin Address 1<span class="hi">बिटकॉइन पता 1</span></span></h3>
      <div class="donate-address">bc1q705nev4a38jg09kqxkljm7kn9xt4ntkvcxfe9w</div>
    </div>
    <div class="card c-archived">
      <span class="card-ico">&#8383;</span>
      <h3><span class="tr">Bitcoin Address 2<span class="hi">बिटकॉइन पता 2</span></span></h3>
      <div class="donate-address">bc1q85a6fdkkcd3m75lmx202acvswqmxpwl9j2pxwh</div>
    </div>
  </div>
  <div class="note info">
    <span class="tr">Both addresses are public and we cannot see, link, or trace a donation to you. Wallet addresses are for the project, not for individuals.<span class="hi hi-long">दोनों पते सार्वजनिक हैं और हम दान को आपसे जोड़ या ट्रेस नहीं कर सकते। वॉलेट पते प्रोजेक्ट के लिए हैं, व्यक्तियों के लिए नहीं।</span></span>
  </div>

  <h2 class="block-title"><span class="tr">Before you ask<span class="hi">सवाल पूछने से पहले</span></span></h2>
  <p class="block-sub"><span class="tr">The five questions that come up most often, answered properly instead of by a link.<span class="hi">सबसे ज़्यादा पूछे जाने वाले पाँच सवाल, लिंक भेजने के बजाय सही जवाब के साथ।</span></span></p>
  <div class="grid">
    <div class="card c-default">
      <h3><span class="tr">What are the system requirements?<span class="hi">सिस्टम आवश्यकताएँ क्या हैं?</span></span></h3>
      <p><span class="tr">Windows 10 or later, 64-bit, with the WebView2 Runtime. Most Windows 10 and 11 installs already ship it, but if the app opens to a blank window that is the first thing to check. Around 500 MB of free disk space is enough.<span class="hi">Windows 10 या बाद का, 64-बिट, WebView2 Runtime के साथ। अधिकांश Windows 10 और 11 इंस्टॉल में यह पहले से होता है, लेकिन ऐप खुलकर सफ़ेद स्क्रीन दिखे तो पहले यही देखें। लगभग 500 MB फ्री डिस्क स्पेस काफ़ी है।</span></span></p>
    </div>
    <div class="card c-default">
      <h3><span class="tr">Windows says SmartScreen blocked it. Is it safe?<span class="hi">Windows ने SmartScreen से रोका है। क्या यह सुरक्षित है?</span></span></h3>
      <p><span class="tr">Yes. The builds are not code-signed yet, which is a known cost gap listed on the roadmap, not a malware signal. Choose More info then Run anyway. We would rather pay for a signing certificate than ask you to trust an unsigned binary blindly.<span class="hi">हाँ। बिल्ड्स अभी कोड-साइन नहीं हैं, जो रोडमैप में दर्ज एक ज्ञात लागत का अंतर है, मैलवेयर का संकेत नहीं। More info चुनें फिर Run anyway दबाएँ। हम अनसाइन्ड बाइनरी पर अंधेक्षे से भरोसा करने के बजाय साइनिंग सर्टिफिकेट खरीदना पसंद करते हैं।</span></span></p>
    </div>
    <div class="card c-default">
      <h3><span class="tr">Is Nighty safe to use?<span class="hi">क्या Nighty सुरक्षित है?</span></span></h3>
      <p><span class="tr">Nighty builds are unstable by definition and can lose data. Use them for testing, never as your only browser. If you need something dependable, take stable v1.0.3.<span class="hi">Nighty बिल्ड स्वयं की परिभाषा से अस्थिर हैं और डेटा खो सकते हैं। इन्हें टेस्टिंग के लिए इस्तेमाल करें, अपना एकमात्र ब्राउज़र कभी नहीं। भरोसेमंद चाहिए तो स्थिर v1.0.3 लें।</span></span></p>
    </div>
    <div class="card c-default">
      <h3><span class="tr">What data does PGlove collect?<span class="hi">पीग्लव कौन-सा डेटा जुटाता है?</span></span></h3>
      <p><span class="tr">None. No telemetry, no analytics, no crash reporting, no tracking pixels. Your history is stored on your own disk. The full breakdown is on the <a href="/privacy/">privacy policy</a> page.<span class="hi">कोई नहीं। न टेलीमेट्री, न एनालिटिक्स, न क्रैश रिपोर्टिंग, न ट्रैकिंग पिक्सेल। आपकी हिस्ट्री आपकी अपनी डिस्क पर रहती है। पूरी जानकारी <a href="/privacy/">गोपनीयता नीति</a> पेज पर है।</span></span></p>
    </div>
    <div class="card c-default">
      <h3><span class="tr">Can I build it myself?<span class="hi">क्या मैं इसे खुद बना सकता हूँ?</span></span></h3>
      <p><span class="tr">Yes, and that is the point of the BSD 3-Clause licence. Clone the repository, follow the build instructions, and you own your build completely. Fork it, change the theme layer, open a pull request if you think others would want it.<span class="hi">हाँ, और यही BSD 3-Clause लाइसेंस का मकसद है। रिपॉज़िटरी क्लोन करें, बिल्ड निर्देशों का पालन करें, और आपका बिल्ड पूरी तरह आपका है। फोर्क करें, थीम लेयर बदलें, और अगर लगे कि दूसरों को भी चाहिए तो पुल रिक्वेस्ट खोलें।</span></span></p>
    </div>
    <div class="card c-default">
      <h3><span class="tr">How do I report a bug properly?<span class="hi">बग सही तरीके से कैसे रिपोर्ट करें?</span></span></h3>
      <p><span class="tr">Search the existing issues first, then open a new one with your PGlove version, Windows build, the exact steps to reproduce, and what you expected to happen. Logs and screenshots turn a two-week thread into a same-day fix.<span class="hi">पहले मौजूदा इश्यू देखें, फिर नया खोलें और उसमें अपना PGlove वर्जन, Windows बिल्ड, दोहराने के सटीक कदम, और आपकी अपेक्षा बताएं। लॉग और स्क्रीनशॉट दो हफ्ते की चर्चा को एक ही दिन में ठीक करा देते हैं।</span></span></p>
    </div>
  </div>
'@
}

# ---------------------------------------------------------------------------
# JSON-LD
# Sub-pages previously shipped with no structured data at all, which is why
# only the home page ever validated. Each page now emits a WebPage plus a
# BreadcrumbList, and every page that discusses a specific release also
# references the canonical SoftwareApplication on the home page rather than
# redeclaring it.
# ---------------------------------------------------------------------------
function New-JsonLd {
  param(
    [string]$Url,
    [string]$Title,
    [string]$Desc,
    [string]$Crumb,
    [string]$Type = 'WebPage',
    [string]$AboutVersion = ''
  )

  # JSON string escaping. Built by concatenation rather than -f: a .NET format
  # string rejects bare "{" as an invalid format item, and PowerShell has no
  # \" escape inside single-quoted strings, so -f was the wrong tool twice over.
  function JEsc([string]$s) {
    if ($null -eq $s) { return '' }
    $s = $s.Replace('\', '\\')
    $s = $s.Replace('"', '\"')
    $s = $s.Replace("`r", '')
    $s = $s.Replace("`n", '\n')
    return $s
  }

  $nl = "`n"
  $parts = @()

  $parts += '    { "@type": "' + (JEsc $Type) + '",' +
            ' "@id": "' + (JEsc $Url) + '#webpage",' +
            ' "url": "' + (JEsc $Url) + '",' +
            ' "name": "' + (JEsc $Title) + '",' +
            ' "description": "' + (JEsc $Desc) + '",' +
            ' "inLanguage": "en",' +
            ' "isPartOf": { "@id": "https://pglove.jo3.org/#website" },' +
            ' "about": { "@id": "https://pglove.jo3.org/#app" } }'

  $c1 = '      { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://pglove.jo3.org/" }'
  $c2 = '      { "@type": "ListItem", "position": 2, "name": "' + (JEsc $Crumb) + '", "item": "' + (JEsc $Url) + '" }'
  $parts += '    { "@type": "BreadcrumbList", "itemListElement": [' + $nl + $c1 + ',' + $nl + $c2 + $nl + '    ] }'

  if ($AboutVersion) {
    $parts += '    { "@type": "SoftwareVersion",' +
              ' "softwareVersion": "' + (JEsc $AboutVersion) + '",' +
              ' "softwareRequirements": "Windows 10 or later, 64-bit, with WebView2 Runtime",' +
              ' "url": "https://pglove.jo3.org/roadmap.html" }'
  }

  $body = $parts -join (',' + $nl)
  return '{' + $nl +
         '  "@context": "https://schema.org",' + $nl +
         '  "@graph": [' + $nl +
         $body + $nl +
         '  ]' + $nl +
         '}'
}

# ---------------------------------------------------------------------------
foreach ($p in $pages) {
  $jsonld = New-JsonLd -Url $p.canon -Title $p.title -Desc $p.desc -Crumb $p.crumb `
                       -Type $p.schemaType -AboutVersion $p.aboutVersion
  $html = $HEAD.Replace("__TITLE__", $p.title).Replace("__DESC__", $p.desc).Replace("__KEYS__", $p.keys).
                Replace("__CANON__", $p.canon).Replace("__ACTIVE__", $p.active).
                Replace("__TAG__", $p.tag).Replace("__H1__", $p.h1).
                Replace("__SUB__", $p.sub).Replace("__BODY__", $p.body).
                Replace("__JSONLD__", $jsonld)
  $out = Join-Path $root $p.file
  [System.IO.File]::WriteAllText($out, $html, (New-Object System.Text.UTF8Encoding $false))
  Write-Output ("wrote {0,-18} {1,7} bytes" -f $p.file, (Get-Item $out).Length)
}
Write-Output "SUBPAGES DONE"

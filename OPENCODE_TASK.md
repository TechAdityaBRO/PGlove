# 🚀 OPENCODE FULL TASK — PGlove Website Rebuild + SEO + i18n + Ecosystem + Docs

**Task ID:** PGLOVE-FULL-REBUILD-v3
**Priority:** Critical
**Repo:** https://github.com/TechAdityaBRO/PGlove
**Live site:** https://pglove.jo3.org
**Contact:** pglovebrowser@proton.me
**Tagline:** Made in India for the world — for next zen internet exploration
**Signature:** The PGlove Browser by Aditya Kumar Sethi & Team (BRO GANG & D1M Studios)

> **This is the single, complete instruction file.** Everything — website, SEO, languages,
> README, 404, clean URLs, logo GIF, credits, ecosystem, privacy, terms, commit badge,
> socials, and push — lives in this one file. Nothing else is needed.

---

## 📖 TABLE OF CONTENTS

1.  [PHASE 0 — Read Before Acting](#phase-0)
2.  [PHASE 1 — Full Website Rebuild](#phase-1)
3.  [PHASE 2 — Hindi Translations](#phase-2)
4.  [PHASE 3 — Next-Level SEO](#phase-3)
5.  [PHASE 4 — SEO Files](#phase-4)
6.  [PHASE 5 — Clean URLs (no .html)](#phase-5)
7.  [PHASE 6 — Logo GIF + Loading Screen](#phase-6)
8.  [PHASE 7 — Credits Section](#phase-7)
9.  [PHASE 8 — Ecosystem Section](#phase-8)
10. [PHASE 9 — Commit Info Badge](#phase-9)
11. [PHASE 10 — Privacy Policy Update](#phase-10)
12. [PHASE 11 — Terms & Conditions](#phase-11)
13. [PHASE 12 — Upgrade README.md](#phase-12)
14. [PHASE 13 — Upgrade 404.html](#phase-13)
15. [PHASE 14 — Social Links](#phase-14)
16. [PHASE 15 — Push to GitHub](#phase-15)
17. [Guard Rails](#guard-rails)
18. [Done Means](#done-means)
19. [Reference Links](#reference-links)

---

<a name="phase-0"></a>

## PHASE 0 — READ BEFORE ACTING

**BEFORE any code changes**, do these steps in order.

### 0.1 — Fetch and read current repo

```
https://github.com/TechAdityaBRO/PGlove
```

Read in priority order:

1. `README.md`
2. `index.html`
3. `404.html`
4. `privacy.html` / `privacy-policy.html` (if exists)
5. Any `*.html`, `*.css`, `*.js` at root
6. `.github/workflows/*.yml`
7. `package.json`
8. `LICENSE` (needed for Terms phase)
9. `.git/HEAD` (current branch)

### 0.2 — Check live site

```
https://pglove.jo3.org
```

List every section you see.

### 0.3 — Check Bro Gang site (i18n reference)

```
https://brogang.techaditya.workers.dev
```

Observe **Hindi hover tooltips** — every English label is wrapped in:

```html
<span class="tr">English<span class="hi">हिंदी</span></span>
```

On cursor hover, a purple tooltip appears above with the Hindi text.

### 0.4 — Check archived v1.0.4

```
https://github.com/TechAdityaBRO/PGlove-Pokemon-Rust
```

### 0.5 — Check Nexa Search

```
https://nexasearch.pages.dev
```

### 0.6 — Report findings

Before editing, output:

- Files found
- Sections on live site
- Sections missing or broken
- Any errors

**Only after this report**, proceed to PHASE 1.

---

<a name="phase-1"></a>

## PHASE 1 — FULL WEBSITE REBUILD

Rebuild `index.html` as a **single-file, next-level website**.

### Theme

- **Purple & blue** deep space aesthetic
- Keep brand colors unchanged

```css
:root {
  --purple-500: #6d28d9;
  --purple-400: #8b4dff;
  --purple-300: #ab7bff;
  --blue-500: #3b82f6;
  --blue-600: #2563eb;
  --cyan-400: #22d3ee;
  --cyan-300: #67e8f9;
  --bg-1: #0a0420;
  --bg-0: #05010f;
  --text: #e8e4f5;
  --text-dim: #b8aee0;
  --text-muted: #7a6fa5;
  --border: rgba(139, 77, 255, 0.18);
  --border-strong: rgba(139, 77, 255, 0.35);
  --ease: cubic-bezier(0.22, 1, 0.36, 1);
}
```

### All Sections Required (17 — do not omit any)

| # | Section | Content |
|---|---------|---------|
| 1 | Navbar | Sticky, glass morphism, gradient logo GIF |
| 2 | Hero | "A Browser With A New Generation" + v1.0.3 badge + 3 CTAs |
| 3 | v1.0.4 Archived Notice | Link to PGlove-Pokemon-Rust, funding note |
| 4 | Nexa Search | Feature box, cyan theme |
| 5 | Download | 4 cards (Stable NPM, NuGet, Nighty, Winget) |
| 6 | Roadmap | v1.0.4 archived, v1.0.5–7 paused |
| 7 | Codeberg | Repo, SSH clone, Releases |
| 8 | Community | Proton Meet + Slack + **Matrix** (3 cards) |
| 9 | Bitcoin Donate | 2 QR codes + 2 BTC addresses |
| 10 | Why PGlove | 6 feature cards |
| 11 | **Ecosystem** (NEW) | BRO GANG AI, BRO GANG, Pro AI, PGlove, PGlove Extensions |
| 12 | Supported By | Cloudflare, Google Fonts, GitHub, Archive, DeepSeek, DNSExit |
| 13 | **Credits** (NEW) | Full credit block + hardware story + infra + legal |
| 14 | Team | Aditya, Bro Gang, ProGroupco, D1M Studios |
| 15 | BroGangMC Server | Java + Bedrock info |
| 16 | CTA | GitHub + Codeberg + Nexa Search + Archived |
| 17 | Footer | All links + commit badge + socials + Matrix |

### Real URLs (use these exact strings — no placeholders)

| Element | URL |
|---------|-----|
| NPM Stable | https://github.com/TechAdityaBRO/PGlove/pkgs/npm/pglove-stable |
| NuGet | https://github.com/TechAdityaBRO/PGlove/pkgs/nuget/PGloveCore |
| Nighty EXE | https://archive.org/download/pglove-installers/PGlove-Installers.exe |
| Itch.io | https://progroupco.itch.io/pglove |
| Winget PR | https://github.com/microsoft/winget-pkgs/pull/421311 |
| Codeberg | https://codeberg.org/TechAditya/PGlove/ |
| GitHub Main | https://github.com/TechAdityaBRO/PGlove |
| GitHub Archive | https://github.com/TechAdityaBRO/PGlove-Pokemon-Rust |
| Nexa Search | https://nexasearch.pages.dev/ |
| **Matrix** | https://matrix.to/#/#pglove:matrix.org |
| Proton Meet | https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H |
| Slack | https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw |
| Email | pglovebrowser@proton.me |
| BRO GANG AI | https://brogang.techaditya.workers.dev |
| BRO GANG | https://brogang.techaditya.workers.dev |
| Pro AI | https://progroupai.created.app/ |
| Git SCM | https://git-scm.com/ |
| BTC 1 | bc1q705nev4a38jg09kqxkljm7kn9xt4ntkvcxfe9w |
| BTC 2 | bc1q85a6fdkkcd3m75lmx202acvswqmxpwl9j2pxwh |

### Community Section — 3 Cards

```html
<a href="https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H"
   target="_blank" rel="noopener" class="community-card proton">
  <div class="community-icon"><i class="fas fa-video"></i></div>
  <h3>Proton Meet</h3>
  <p>Encrypted video room for live dev sessions.</p>
  <span class="community-link">Join Room <i class="fas fa-arrow-right"></i></span>
</a>

<a href="https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw"
   target="_blank" rel="noopener" class="community-card slack">
  <div class="community-icon"><i class="fab fa-slack"></i></div>
  <h3>Slack</h3>
  <p>Async discussions, bug reports, feature requests.</p>
  <span class="community-link">Join Workspace <i class="fas fa-arrow-right"></i></span>
</a>

<a href="https://matrix.to/#/#pglove:matrix.org"
   target="_blank" rel="noopener" class="community-card matrix">
  <div class="community-icon"><i class="fas fa-comments"></i></div>
  <h3>Matrix</h3>
  <p>Decentralized, encrypted chat. Join the room.</p>
  <span class="community-link">Join Room <i class="fas fa-arrow-right"></i></span>
</a>
```

### Matrix CSS (brand color `#0dbd8b`)

```css
.community-card.matrix::before {
  background: linear-gradient(90deg, #0dbd8b, #1a9e74);
}
.community-card.matrix .community-icon {
  background: linear-gradient(135deg,
    rgba(13, 189, 139, 0.2), rgba(26, 158, 116, 0.2));
  border: 1px solid rgba(13, 189, 139, 0.4);
  color: #0dbd8b;
}
```

---

<a name="phase-2"></a>

## PHASE 2 — HINDI TRANSLATIONS (hover tooltips)

Replicate the exact Bro Gang i18n pattern.

### 2.1 — Devanagari font in `<head>`

```html
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Devanagari:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### 2.2 — Tooltip CSS

```css
.tr { position: relative; display: inline-block; }
.tr .hi {
  position: absolute;
  top: -2.4em;
  left: 50%;
  transform: translateX(-50%) translateY(8px) scale(0.9);
  background: var(--purple-500);
  color: #fff;
  font-family: 'Noto Sans Devanagari', sans-serif;
  font-size: 0.82rem;
  font-weight: 500;
  padding: 8px 18px;
  border-radius: 8px;
  white-space: nowrap;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.3s ease, transform 0.3s ease;
  z-index: 100;
  box-shadow: 0 0 20px rgba(109, 40, 217, 0.5);
}
.tr .hi::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 50%;
  transform: translateX(-50%);
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid var(--purple-500);
}
.tr:hover .hi {
  opacity: 1;
  transform: translateX(-50%) translateY(0) scale(1);
}
/* Disable on touch devices */
@media (hover: none) { .tr .hi { display: none; } }
```

### 2.3 — Wrap every English label

```html
<span class="tr">English<span class="hi">हिंदी</span></span>
```

### 2.4 — Translation Table (use these exact values)

| English | Hindi |
|---------|-------|
| PGlove | पीग्लव |
| Download | डाउनलोड |
| Features | विशेषताएँ |
| Roadmap | रोडमैप |
| Community | समुदाय |
| Donate | दान करें |
| Stable Release | स्थिर रिलीज़ |
| Nighty Build | नाइटी बिल्ड |
| NuGet | नुगेट |
| Winget | विंगेट |
| Archived | संग्रहीत |
| In Development | विकास में |
| Paused | रुका हुआ |
| Join Room | कमरे में शामिल हों |
| Made in India | भारत में निर्मित |
| Made in India for the world | भारत में बना, दुनिया के लिए |
| A Browser With A New Generation | एक नई पीढ़ी का ब्राउज़र |
| Built for the brave | बहादुरों के लिए बनाया गया |
| Search the web. Find the signal. | वेब खोजें। संकेत खोजें। |
| Get PGlove | पीग्लव प्राप्त करें |
| View on GitHub | GitHub पर देखें |
| View on Codeberg | Codeberg पर देखें |
| Documentation | दस्तावेज़ीकरण |
| Support | सहायता |
| Team | टीम |
| Ecosystem | पारिस्थितिकी तंत्र |
| Credits | श्रेय |
| Server | सर्वर |
| Online | ऑनलाइन |
| Version | संस्करण |
| Players | खिलाड़ी |
| Contact | संपर्क करें |
| Home | होम |
| Privacy Policy | गोपनीयता नीति |
| Terms & Conditions | नियम एवं शर्तें |
| Chief Developer | मुख्य डेवलपर |
| Chief Chairman | मुख्य अध्यक्ष |
| Producer | निर्माता |
| Production | निर्माण |
| Built on Small Hardware | छोटे हार्डवेयर पर बना |
| Next zen internet exploration | अगली पीढ़ी की इंटरनेट खोज |
| Back | वापस |
| Next | आगे |
| Previous | पिछला |

**Apply `.tr` wrapping to:** nav links, hero CTAs, section titles, buttons, card
headings, footer links, badges.

---

<a name="phase-3"></a>

## PHASE 3 — NEXT-LEVEL SEO

Add **all** of the following to `<head>`.

### 3.1 — Basic meta

```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PGlove — A Browser With A New Generation | Experimental Browser for Developers</title>
<meta name="description" content="PGlove is an experimental desktop browser built with Tauri 2 (Rust + WebView2). Stable v1.0.3 available. Pokémon theme v1.0.4 archived. Made in India for the world for next zen internet exploration by BRO GANG & D1M Studios.">
<meta name="keywords" content="PGlove, PGlove Browser, Tauri Browser, Rust Browser, WebView2, BRO GANG, D1M Studios, Aditya Kumar Sethi, Darshil Sharma, Nimay Ahirwar, experimental browser, developer browser, Nexa Search, Made in India">
<meta name="author" content="Aditya Kumar Sethi (TechAdityaBRO)">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="language" content="English">
<meta name="revisit-after" content="7 days">
<meta name="theme-color" content="#0a0420">
<meta name="copyright" content="Copyright © 2022-2026 BRO GANG Studios & D1M Studios. Pokémon trademarks belong to The Pokémon Company.">
```

### 3.2 — Canonical & hreflang

```html
<link rel="canonical" href="https://pglove.jo3.org/">
<link rel="alternate" hreflang="en" href="https://pglove.jo3.org/">
<link rel="alternate" hreflang="hi" href="https://pglove.jo3.org/hi/">
<link rel="alternate" hreflang="x-default" href="https://pglove.jo3.org/">
```

### 3.3 — Open Graph

```html
<meta property="og:type" content="website">
<meta property="og:site_name" content="PGlove">
<meta property="og:title" content="PGlove — A Browser With A New Generation">
<meta property="og:description" content="Experimental desktop browser built with Tauri 2. Made in India for the world.">
<meta property="og:url" content="https://pglove.jo3.org/">
<meta property="og:image" content="https://pglove.jo3.org/og-image.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="PGlove Browser">
<meta property="og:locale" content="en_US">
<meta property="og:locale:alternate" content="hi_IN">
```

### 3.4 — Twitter Card

```html
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="PGlove — A Browser With A New Generation">
<meta name="twitter:description" content="Experimental desktop browser built with Tauri 2.">
<meta name="twitter:image" content="https://pglove.jo3.org/og-image.png">
<meta name="twitter:image:alt" content="PGlove Browser">
<meta name="twitter:site" content="@TechAdityaBRO">
<meta name="twitter:creator" content="@TechAdityaBRO">
```

### 3.5 — JSON-LD structured data

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "SoftwareApplication",
      "@id": "https://pglove.jo3.org/#software",
      "name": "PGlove",
      "alternateName": "PGlove Browser",
      "applicationCategory": "BrowserApplication",
      "operatingSystem": "Windows 10, Windows 11",
      "softwareVersion": "1.0.3",
      "description": "Experimental desktop browser built with Tauri 2 (Rust + WebView2).",
      "url": "https://pglove.jo3.org/",
      "downloadUrl": "https://archive.org/download/pglove-installers/PGlove-Installers.exe",
      "author": { "@id": "https://pglove.jo3.org/#org" },
      "offers": { "@type": "Offer", "price": "0", "priceCurrency": "USD" }
    },
    {
      "@type": "Organization",
      "@id": "https://pglove.jo3.org/#org",
      "name": "BRO GANG Studios",
      "alternateName": ["D1M Studios", "BRO GANG", "ProGroupco"],
      "url": "https://pglove.jo3.org/",
      "foundingDate": "2022",
      "founder": [
        { "@type": "Person", "name": "Aditya Kumar Sethi", "url": "https://github.com/TechAdityaBRO" },
        { "@type": "Person", "name": "Nimay Ahirwar" },
        { "@type": "Person", "name": "Darshil Sharma" }
      ],
      "sameAs": [
        "https://github.com/TechAdityaBRO/PGlove",
        "https://codeberg.org/TechAditya/PGlove/",
        "https://progroupco.itch.io/pglove",
        "https://brogang.techaditya.workers.dev",
        "https://progroupai.created.app/"
      ],
      "contactPoint": {
        "@type": "ContactPoint",
        "email": "pglovebrowser@proton.me",
        "contactType": "customer support"
      }
    },
    {
      "@type": "WebSite",
      "@id": "https://pglove.jo3.org/#website",
      "url": "https://pglove.jo3.org/",
      "name": "PGlove",
      "publisher": { "@id": "https://pglove.jo3.org/#org" },
      "inLanguage": "en-US"
    },
    {
      "@type": "BreadcrumbList",
      "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://pglove.jo3.org/" },
        { "@type": "ListItem", "position": 2, "name": "Download", "item": "https://pglove.jo3.org/#download" },
        { "@type": "ListItem", "position": 3, "name": "Roadmap", "item": "https://pglove.jo3.org/#roadmap" },
        { "@type": "ListItem", "position": 4, "name": "Ecosystem", "item": "https://pglove.jo3.org/#ecosystem" },
        { "@type": "ListItem", "position": 5, "name": "Credits", "item": "https://pglove.jo3.org/#credits" }
      ]
    }
  ]
}
</script>
```

### 3.6 — Performance hints

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="dns-prefetch" href="https://github.com">
<link rel="dns-prefetch" href="https://codeberg.org">
<link rel="dns-prefetch" href="https://archive.org">
<link rel="dns-prefetch" href="https://api.qrserver.com">
```

### 3.7 — Favicon & manifest

```html
<link rel="icon" type="image/png" href="/favicon.png">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="manifest" href="/manifest.json">
```

---

<a name="phase-4"></a>

## PHASE 4 — SEO FILES

Create these files at repo root.

### 4.1 — `robots.txt`

```text
User-agent: *
Allow: /
Disallow: /api/
Disallow: /*?

User-agent: Googlebot
Allow: /

User-agent: Bingbot
Allow: /

User-agent: Twitterbot
Allow: /

Sitemap: https://pglove.jo3.org/sitemap.xml
Crawl-delay: 1
```

### 4.2 — `sitemap.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <url>
    <loc>https://pglove.jo3.org/</loc>
    <lastmod>2026-09-26</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
    <xhtml:link rel="alternate" hreflang="en" href="https://pglove.jo3.org/"/>
    <xhtml:link rel="alternate" hreflang="hi" href="https://pglove.jo3.org/hi/"/>
  </url>
  <url>
    <loc>https://pglove.jo3.org/v1.0.4</loc>
    <lastmod>2026-09-26</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://pglove.jo3.org/privacy</loc>
    <lastmod>2026-09-26</lastmod>
    <changefreq>yearly</changefreq>
    <priority>0.3</priority>
  </url>
  <url>
    <loc>https://pglove.jo3.org/terms</loc>
    <lastmod>2026-09-26</lastmod>
    <changefreq>yearly</changefreq>
    <priority>0.3</priority>
  </url>
</urlset>
```

### 4.3 — `humans.txt`

```text
/* TEAM */
  Chief Developer: Aditya Kumar Sethi (TechAdityaBRO)
  GitHub: github.com/TechAdityaBRO
  Email: pglovebrowser@proton.me

  Pokemon Extension Dev Team:
    - Aditya Kumar Sethi
    - Darshil Sharma

  BRO GANG Team:
    - Aditya Kumar Sethi
    - Nimay Ahirwar
    - Rakesh Sarkar

  D1M Studios Chairman: Darshil Sharma
  BRO GANG Chairmans: Aditya Kumar Sethi & Nimay Ahirwar
  Producer: Aditya Kumar Sethi & Team
  Production: BRO GANG Studios & D1M Studios

/* SITE */
  Last update: 2026/09/26
  Language: English + Hindi
  Doctype: HTML5
  Standards: HTML5, CSS3, ES6
  Components: Tauri 2, Rust, WebView2
  Debugging & Front-end: OpenCode from Anomalyco

/* HARDWARE */
  Built on:
    - 4 GB RAM
    - Tiny 10 LTSC
    - Intel UHD Graphics 600
    - Intel Celeron
  Message: small hardware can make big changes

/* PROJECT */
  PGlove — A Browser With A New Generation
  Stable: v1.0.3
  Archived: v1.0.4 (Pokemon Theme, Rust/Tauri)

/* INFRASTRUCTURE */
  Git: https://git-scm.com/
  Git hosts: Codeberg & GitHub
  Hosting: Cloudflare, GitHub Pages
  Subdomain: DNSExit, Cloudflare Workers, Cloudflare Pages, GitHub Pages
  Auth: Auth0

/* TRADEMARKS */
  Pokemon: (c) The Pokemon Company
  All licenses, trademarks belong to their respective companies.

/* CONTACT */
  Email: pglovebrowser@proton.me
  Matrix: https://matrix.to/#/#pglove:matrix.org
  Proton Meet: https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H
  Slack: https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw
```

### 4.4 — `manifest.json`

```json
{
  "name": "PGlove — A Browser With A New Generation",
  "short_name": "PGlove",
  "description": "Experimental desktop browser built with Tauri 2. Made in India for the world.",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#0a0420",
  "theme_color": "#6d28d9",
  "icons": [
    { "src": "/icon-192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "/icon-512.png", "sizes": "512x512", "type": "image/png" }
  ]
}
```

### 4.5 — `security.txt` (place at **BOTH** root and `.well-known/`)

```text
Contact: mailto:pglovebrowser@proton.me
Expires: 2027-12-31T23:59:59.000Z
Preferred-Languages: en, hi
Canonical: https://pglove.jo3.org/.well-known/security.txt
Policy: https://pglove.jo3.org/privacy
```

### 4.6 — `_headers` (Cloudflare Pages)

```text
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: camera=(), microphone=(), geolocation=()
  Strict-Transport-Security: max-age=31536000; includeSubDomains

/sitemap.xml
  Content-Type: application/xml
  Cache-Control: public, max-age=86400

/robots.txt
  Content-Type: text/plain
  Cache-Control: public, max-age=86400

/manifest.json
  Content-Type: application/manifest+json
```

### 4.7 — `_redirects` (Cloudflare Pages — clean URLs)

```text
/v1.0.4       /v1.0.4.html    200
/privacy      /privacy.html   200
/terms        /terms.html     200
/download     /#download      301
/roadmap      /#roadmap       301
/ecosystem    /#ecosystem     301
/credits      /#credits       301
```

---

<a name="phase-5"></a>

## PHASE 5 — CLEAN URLs (no `.html`)

**All internal links must use clean URLs.**

| ❌ Wrong | ✅ Correct |
|----------|------------|
| pglove.jo3.org/v1.0.4.html | pglove.jo3.org/v1.0.4 |
| pglove.jo3.org/privacy.html | pglove.jo3.org/privacy |
| pglove.jo3.org/terms.html | pglove.jo3.org/terms |

### Implementation

1. Keep `.html` files on disk (Cloudflare Pages serves them)
2. Add `_redirects` file (Phase 4.7) — clean → `.html` with status `200`
3. Update **ALL** internal links in `index.html`, `404.html`, `privacy.html`,
   `terms.html`, `v1.0.4.html`

```html
<!-- WRONG -->
<a href="/pglovev1.0.4.html">View v1.0.4</a>

<!-- CORRECT -->
<a href="/v1.0.4">View v1.0.4</a>
```

4. Rename `pglovev1.0.4.html` → `v1.0.4.html` (cleaner base name)

### Test both URLs

- `https://pglove.jo3.org/v1.0.4` ✅ (canonical)
- `https://pglove.jo3.org/v1.0.4.html` ✅ (still works, no 404)

---

<a name="phase-6"></a>

## PHASE 6 — LOGO GIF + LOADING SCREEN

Use the **same logo GIF** on the loading screen, navbar, footer, and 404.

### 6.1 — Loading screen

Replace any CSS-spinner loader with the actual PGlove logo GIF.

```html
<div class="loader" id="loader">
  <img src="/logo.gif" alt="PGlove" class="loader-logo" width="120" height="120"
       onerror="this.src='/logo.png'">
  <div class="loader-text">PGlove</div>
  <div class="loader-progress"><div class="loader-progress-inner"></div></div>
</div>
```

```css
.loader-logo {
  width: 120px;
  height: 120px;
  object-fit: contain;
  animation: logoBounce 1.4s ease-in-out infinite;
  filter: drop-shadow(0 0 40px rgba(139, 77, 255, 0.6));
}
@keyframes logoBounce {
  0%, 100% { transform: translateY(0) scale(1); }
  50% { transform: translateY(-10px) scale(1.05); }
}
```

### 6.2 — Logo in navbar

```html
<a href="/" class="nav-brand">
  <img src="/logo.gif" alt="PGlove" width="34" height="34" class="brand-mark"
       onerror="this.src='/logo.png'">
  <span>PGlove</span>
</a>
```

### 6.3 — Logo in footer + hero badge

Also use `/logo.gif` in the footer brand and the hero badge (optional).
`og:image` still points to `/og-image.png` (static 1200×630).

### 6.4 — Fallback

```html
<img src="/logo.gif" onerror="this.src='/logo.png'" alt="PGlove">
```

---

<a name="phase-7"></a>

## PHASE 7 — CREDITS SECTION (new)

Add a new section `#credits` before the footer.

### 7.1 — Full markup

```html
<section class="section" id="credits">
  <div class="section-inner reveal">
    <div class="section-header">
      <div class="section-tag">🎬 Credits</div>
      <h2 class="section-title">
        <span class="tr">Credits<span class="hi">श्रेय</span></span>
      </h2>
      <p class="section-sub">
        <span class="tr">
          The PGlove Browser by Aditya Kumar Sethi &amp; Team
          (BRO GANG &amp; D1M Studios)
        <span class="hi">
          पीग्लव ब्राउज़र — आदित्य कुमार सेठी और टीम
          (ब्रो गैंग और D1M स्टूडियोज़)
        </span></span>
      </p>
    </div>

    <div class="credits-grid">

      <div class="credit-card">
        <div class="credit-role">👨‍💻 Chief Developer</div>
        <div class="credit-name">Aditya Kumar Sethi</div>
        <div class="credit-meta">BRO GANG · D1M Studios</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">⚡ Pokémon Extension Dev Team</div>
        <div class="credit-name">Aditya Kumar Sethi · Darshil Sharma</div>
        <div class="credit-meta">v1.0.4 Pokémon Theme (archived)</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">🎬 Production</div>
        <div class="credit-name">BRO GANG Studios &amp; D1M Studios</div>
        <div class="credit-meta">Joint production</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">🎥 Producer</div>
        <div class="credit-name">Aditya Kumar Sethi &amp; Team</div>
        <div class="credit-meta">Executive producer</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">⚡ BRO GANG Team</div>
        <div class="credit-name">
          Aditya Kumar Sethi · Nimay Ahirwar · Rakesh Sarkar
        </div>
        <div class="credit-meta">Core team</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">🏛 D1M Studios Chairman</div>
        <div class="credit-name">Darshil Sharma</div>
        <div class="credit-meta">Founder &amp; Chairman</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">⚡ BRO GANG Chairmans</div>
        <div class="credit-name">Aditya Kumar Sethi · Nimay Ahirwar</div>
        <div class="credit-meta">Co-chairmen</div>
      </div>

      <div class="credit-card">
        <div class="credit-role">🐛 Debugging &amp; Frontend</div>
        <div class="credit-name">OpenCode from Anomalyco</div>
        <div class="credit-meta">AI-assisted development</div>
      </div>

    </div>

    <!-- Hardware story -->
    <div class="hardware-box">
      <div class="hardware-icon">💻</div>
      <div class="hardware-title">
        <span class="tr">
          Built on Small Hardware
        <span class="hi">छोटे हार्डवेयर पर बना</span></span>
      </div>
      <p class="hardware-story">
        <span class="tr">
          This full project was made on just <strong>4 GB RAM</strong>,
          <strong>Tiny 10 LTSC</strong>, some <strong>Intel UHD Graphics 600</strong>,
          and an <strong>Intel Celeron</strong> — to say that
          <em>small hardware can make big changes.</em>
        <span class="hi">
          यह पूरा प्रोजेक्ट केवल <strong>4 GB RAM</strong>,
          <strong>Tiny 10 LTSC</strong>, <strong>Intel UHD Graphics 600</strong>,
          और <strong>Intel Celeron</strong> पर बनाया गया —
          यह कहने के लिए कि <em>छोटा हार्डवेयर बड़े बदलाव ला सकता है।</em>
        </span></span>
      </p>
    </div>

    <!-- Infrastructure & legal -->
    <div class="infra-box">
      <div class="infra-row">
        <span class="infra-label">Git Support</span>
        <span class="infra-value">
          <a href="https://git-scm.com/" target="_blank" rel="noopener">git-scm.com</a>
        </span>
      </div>
      <div class="infra-row">
        <span class="infra-label">Git Hosts</span>
        <span class="infra-value">Codeberg &amp; GitHub</span>
      </div>
      <div class="infra-row">
        <span class="infra-label">Hosting</span>
        <span class="infra-value">Cloudflare · GitHub Pages</span>
      </div>
      <div class="infra-row">
        <span class="infra-label">Subdomains</span>
        <span class="infra-value">DNSExit · Cloudflare Workers · Cloudflare Pages · GitHub Pages</span>
      </div>
      <div class="infra-row">
        <span class="infra-label">Authentication</span>
        <span class="infra-value">Auth0</span>
      </div>
    </div>

    <!-- Legal -->
    <div class="legal-box">
      <p class="legal-text">
        Pokémon and all related trademarks, characters, and imagery
        belong to <strong>The Pokémon Company</strong>.
        All licenses and trademarks mentioned belong to their
        respective companies and organisations.
      </p>
      <p class="legal-tagline">
        🇮🇳 Made in India for the world<br>
        for next zen internet exploration.
      </p>
    </div>

  </div>
</section>
```

### 7.2 — Credits CSS

```css
.credits-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.3rem;
  margin-bottom: 2.5rem;
}
.credit-card {
  background: linear-gradient(160deg,
    rgba(30, 16, 84, 0.6) 0%, rgba(20, 10, 56, 0.85) 100%);
  border: 1px solid var(--border);
  border-radius: 16px;
  padding: 1.5rem 1.4rem;
  transition: all 0.4s var(--ease);
  backdrop-filter: blur(10px);
}
.credit-card:hover {
  transform: translateY(-4px);
  border-color: var(--border-strong);
  box-shadow: 0 15px 40px rgba(109, 40, 217, 0.2);
}
.credit-role {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.68rem;
  letter-spacing: 1px;
  text-transform: uppercase;
  color: var(--purple-300);
  margin-bottom: 0.6rem;
}
.credit-name {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 1.05rem;
  font-weight: 700;
  color: var(--text);
  line-height: 1.4;
  margin-bottom: 0.3rem;
}
.credit-meta { font-size: 0.78rem; color: var(--text-muted); }

.hardware-box {
  background: linear-gradient(135deg,
    rgba(139, 77, 255, 0.12), rgba(37, 99, 235, 0.08));
  border: 1px solid var(--border-strong);
  border-radius: 20px;
  padding: 2rem 1.8rem;
  text-align: center;
  margin-bottom: 2rem;
}
.hardware-icon { font-size: 2.5rem; margin-bottom: 0.8rem; }
.hardware-title {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 1.2rem;
  font-weight: 700;
  color: var(--text);
  margin-bottom: 0.8rem;
}
.hardware-story {
  color: var(--text-dim);
  font-size: 0.92rem;
  line-height: 1.7;
  max-width: 640px;
  margin: 0 auto;
}
.hardware-story strong { color: var(--purple-300); }
.hardware-story em { color: var(--cyan-300); font-style: italic; }

.infra-box {
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid var(--border);
  border-radius: 16px;
  padding: 1.5rem;
  margin-bottom: 2rem;
}
.infra-row {
  display: flex;
  justify-content: space-between;
  padding: 0.6rem 0;
  border-bottom: 1px dashed rgba(139, 77, 255, 0.15);
  font-size: 0.85rem;
  flex-wrap: wrap;
  gap: 0.5rem;
}
.infra-row:last-child { border-bottom: none; }
.infra-label {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.72rem;
  letter-spacing: 1px;
  text-transform: uppercase;
  color: var(--text-muted);
}
.infra-value { color: var(--text-dim); }
.infra-value a { color: var(--cyan-300); text-decoration: none; }

.legal-box {
  text-align: center;
  padding: 1.5rem;
  background: rgba(0, 0, 0, 0.25);
  border-radius: 16px;
  border: 1px solid var(--border);
}
.legal-text {
  font-size: 0.82rem;
  color: var(--text-muted);
  line-height: 1.7;
  margin-bottom: 0.8rem;
}
.legal-text strong { color: var(--text-dim); }
.legal-tagline {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 1rem;
  font-weight: 600;
  color: var(--purple-300);
  letter-spacing: 0.5px;
}
```

---

<a name="phase-8"></a>

## PHASE 8 — ECOSYSTEM SECTION (new)

Add a new section `#ecosystem` **before** Credits.

```html
<section class="section" id="ecosystem">
  <div class="section-inner reveal">
    <div class="section-header">
      <div class="section-tag">🌐 Ecosystem</div>
      <h2 class="section-title">
        <span class="tr">The PGlove Ecosystem<span class="hi">पीग्लव पारिस्थितिकी तंत्र</span></span>
      </h2>
      <p class="section-sub">
        <span class="tr">Every project under the BRO GANG &amp; D1M Studios umbrella.<span class="hi">ब्रो गैंग और D1M स्टूडियोज़ के अंतर्गत हर प्रोजेक्ट।</span></span>
      </p>
    </div>

    <div class="ecosystem-grid">
      <a href="https://brogang.techaditya.workers.dev" target="_blank" rel="noopener" class="eco-card">
        <div class="eco-icon">⚡</div>
        <h3>BRO GANG AI</h3>
        <p>Next-gen AI assistant powered by Cloudflare Workers AI.</p>
        <span class="eco-link">brogang.techaditya.workers.dev</span>
      </a>

      <a href="https://brogang.techaditya.workers.dev" target="_blank" rel="noopener" class="eco-card">
        <div class="eco-icon">👥</div>
        <h3>BRO GANG</h3>
        <p>Community founded in 2022. Gaming, tech, culture.</p>
        <span class="eco-link">brogang.techaditya.workers.dev</span>
      </a>

      <a href="https://progroupai.created.app/" target="_blank" rel="noopener" class="eco-card">
        <div class="eco-icon">🤖</div>
        <h3>Pro AI</h3>
        <p>AI assistant for everyone, built by the team.</p>
        <span class="eco-link">progroupai.created.app</span>
      </a>

      <a href="https://pglove.jo3.org" target="_blank" rel="noopener" class="eco-card">
        <div class="eco-icon">🌐</div>
        <h3>PGlove</h3>
        <p>The experimental browser. Stable v1.0.3 available.</p>
        <span class="eco-link">pglove.jo3.org</span>
      </a>

      <a href="/v1.0.4" class="eco-card">
        <div class="eco-icon">📦</div>
        <h3>PGlove Extensions</h3>
        <p>Pokémon theme (archived) + Minecraft, GTA 6, Vice City (paused).</p>
        <span class="eco-link">View archive →</span>
      </a>
    </div>
  </div>
</section>
```

### Ecosystem CSS

```css
.ecosystem-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1.3rem;
}
.eco-card {
  background: linear-gradient(160deg,
    rgba(30, 16, 84, 0.6) 0%, rgba(20, 10, 56, 0.85) 100%);
  border: 1px solid var(--border);
  border-radius: 18px;
  padding: 1.6rem 1.4rem;
  text-decoration: none;
  color: inherit;
  transition: all 0.4s var(--ease);
  display: block;
}
.eco-card:hover {
  transform: translateY(-6px);
  border-color: var(--purple-400);
  box-shadow: 0 20px 50px rgba(109, 40, 217, 0.25);
}
.eco-icon { font-size: 1.8rem; margin-bottom: 0.8rem; }
.eco-card h3 {
  font-family: 'Space Grotesk', sans-serif;
  font-size: 1.05rem;
  font-weight: 700;
  color: var(--text);
  margin-bottom: 0.5rem;
}
.eco-card p {
  color: var(--text-dim);
  font-size: 0.85rem;
  line-height: 1.6;
  margin-bottom: 0.8rem;
}
.eco-link {
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.72rem;
  color: var(--cyan-300);
  letter-spacing: 0.3px;
}
```

---

<a name="phase-9"></a>

## PHASE 9 — COMMIT INFO BADGE (new)

Every push must display the **commit number (short SHA) + commit name** on the website.

### 9.1 — Build-time injection (preferred)

```yaml
# .github/workflows/deploy.yml
- name: Generate commit info
  run: |
    echo "COMMIT_HASH=$(git rev-parse --short HEAD)" >> $GITHUB_ENV
    echo "COMMIT_MSG=$(git log -1 --pretty=%s)" >> $GITHUB_ENV
    echo "COMMIT_DATE=$(git log -1 --pretty=%cd --date=short)" >> $GITHUB_ENV
```

### 9.2 — Badge markup

```html
<div class="commit-badge">
  <span class="commit-label">Latest build</span>
  <a href="https://github.com/TechAdityaBRO/PGlove/commit/COMMIT_HASH"
     target="_blank" rel="noopener" class="commit-link">
    <code>COMMIT_HASH</code>
  </a>
  <span class="commit-msg">COMMIT_MSG</span>
  <span class="commit-date">COMMIT_DATE</span>
</div>
```

### 9.3 — JS fallback (GitHub API)

If build-time injection is not possible:

```html
<div class="commit-badge" id="commitBadge">
  <span class="commit-label">Latest build</span>
  <span id="commitInfo">Loading…</span>
</div>

<script>
fetch('https://api.github.com/repos/TechAdityaBRO/PGlove/commits/main')
  .then(r => r.json())
  .then(data => {
    const hash = data.sha.slice(0, 7);
    const msg = data.commit.message.split('\n')[0];
    const url = `https://github.com/TechAdityaBRO/PGlove/commit/${data.sha}`;
    document.getElementById('commitInfo').innerHTML =
      `<a href="${url}" target="_blank" rel="noopener"><code>${hash}</code></a> · ${msg}`;
  })
  .catch(() => {
    document.getElementById('commitInfo').textContent = 'Unavailable';
  });
</script>
```

### 9.4 — CSS

```css
.commit-badge {
  display: inline-flex;
  align-items: center;
  gap: 0.6rem;
  padding: 0.5rem 1rem;
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid var(--border);
  border-radius: 999px;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.7rem;
  color: var(--text-muted);
  margin: 1rem auto 0;
}
.commit-label { text-transform: uppercase; letter-spacing: 1px; }
.commit-link code {
  background: rgba(139, 77, 255, 0.15);
  padding: 2px 6px;
  border-radius: 4px;
  color: var(--purple-300);
}
.commit-msg { color: var(--text-dim); }
.commit-date { color: var(--text-muted); opacity: 0.7; }
```

---

<a name="phase-10"></a>

## PHASE 10 — PRIVACY POLICY UPDATE

Update `privacy.html` (create if missing). Clean URL: `/privacy`.

Required sections:

1. **Introduction** — who we are, contact email
2. **Data We Collect** — nothing beyond Auth0 login (name, email, avatar)
3. **Third-Party Services** — Cloudflare, GitHub, Codeberg, Archive.org, Auth0, Matrix, Nexa Search
4. **Cookies & Storage** — `localStorage` for session, no tracking pixels
5. **Your Rights** — GDPR-style rights (access, deletion, portability)
6. **Contact** — pglovebrowser@proton.me
7. **Changes** — date last updated
8. **Governing Law** — India

Use the same purple/blue theme + `.tr` translations on section headers.

---

<a name="phase-11"></a>

## PHASE 11 — TERMS & CONDITIONS (new)

Create `terms.html`. Clean URL: `/terms`.

Required sections:

1. **Acceptance of Terms**
2. **License** — PGlove is open source (check repo `LICENSE`: MIT / Apache-2.0 / GPL-3.0)
3. **Acceptable Use** — no illegal use, no reverse-engineering the WebView2 core
4. **Intellectual Property** — your code, Pokémon trademarks (© The Pokémon Company), etc.
5. **Third-Party Services** — same list as privacy
6. **Warranty Disclaimer** — "software provided as-is, no warranty"
7. **Limitation of Liability**
8. **Changes to Terms**
9. **Contact** — pglovebrowser@proton.me
10. **Governing Law** — India

Same theme + `.tr` translations.

---

<a name="phase-12"></a>

## PHASE 12 — UPGRADE `README.md`

Completely rewrite `README.md` at repo root. **Do not delete useful existing content —
upgrade it.**

```markdown
<div align="center">
  <img src="https://pglove.jo3.org/logo.gif" width="120" alt="PGlove"/>
  <h1>PGlove</h1>
  <p><em>A Browser With A New Generation</em></p>

  <a href="https://pglove.jo3.org"><img src="https://img.shields.io/badge/Website-pglove.jo3.org-6d28d9?style=for-the-badge"/></a>
  <a href="https://github.com/TechAdityaBRO/PGlove-Pokemon-Rust"><img src="https://img.shields.io/badge/v1.0.4-Archived-fb923c?style=for-the-badge"/></a>
  <a href="https://codeberg.org/TechAditya/PGlove/"><img src="https://img.shields.io/badge/Mirror-Codeberg-3b82f6?style=for-the-badge"/></a>
</div>

---

## ⚠️ Archive Notice

**v1.0.4 (Pokémon Theme)** was built with Tauri 2, Rust, and WebView2.
Due to **funding constraints**, active development is **paused**.

The full source is available forever at:
**[github.com/TechAdityaBRO/PGlove-Pokemon-Rust](https://github.com/TechAdityaBRO/PGlove-Pokemon-Rust)**

> The roadmap for v1.0.5 (Minecraft), v1.0.6 (GTA 6), and v1.0.7
> (Vice City) is paused until funding returns. Bitcoin donations welcome.

---

## 🌐 Live Site

**https://pglove.jo3.org**

Clean URLs: `/v1.0.4` · `/privacy` · `/terms`

---

## 📦 Install

### Stable (NPM)

```bash
npm install @techadityabro/pglove-stable
```

### NuGet

```bash
dotnet add package PGloveCore
```

### Winget

```bash
winget install TechAditya.PGlove
```

### Nighty (unstable)

[Download from Archive.org](https://archive.org/download/pglove-installers/PGlove-Installers.exe)

### Itch.io

[progroupco.itch.io/pglove](https://progroupco.itch.io/pglove)

---

## 🛠 Tech Stack

- **Tauri 2** (Rust + WebView2)
- Every tab is its own embedded WebView2 — real per-tab history
- **Frontend:** plain HTML/CSS/JS, bundled with esbuild
- **Backend:** Rust

---

## 🏗 Build From Source

```bash
npm install
npm run dev          # dev mode
npm run tauri build  # NSIS installer
```

**Requirements:** Rust (MSVC), Visual Studio Build Tools
("Desktop development with C++"), WebView2 Runtime, Node.js 18+

---

## 🌐 Ecosystem

| Project | Link |
|---------|------|
| BRO GANG AI | https://brogang.techaditya.workers.dev |
| BRO GANG | https://brogang.techaditya.workers.dev |
| Pro AI | https://progroupai.created.app/ |
| PGlove | https://pglove.jo3.org |
| PGlove Extensions | https://pglove.jo3.org/v1.0.4 |
| Nexa Search | https://nexasearch.pages.dev |

---

## 💬 Community

- **Matrix:** [#pglove:matrix.org](https://matrix.to/#/#pglove:matrix.org)
- **Slack:** [Join workspace](https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw)
- **Proton Meet:** [Join room](https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H)
- **Email:** pglovebrowser@proton.me

---

## 💰 Donate

Bitcoin (BTC):

```
bc1q705nev4a38jg09kqxkljm7kn9xt4ntkvcxfe9w
bc1q85a6fdkkcd3m75lmx202acvswqmxpwl9j2pxwh
```

Every satoshi helps resume development.

---

## 🎬 Credits

**The PGlove Browser by Aditya Kumar Sethi & Team (BRO GANG & D1M Studios)**

- **Chief Developer:** Aditya Kumar Sethi
- **Pokémon Extension Dev Team:** Aditya Kumar Sethi, Darshil Sharma
- **Production:** BRO GANG Studios & D1M Studios
- **Producer:** Aditya Kumar Sethi & Team
- **BRO GANG Team:** Aditya Kumar Sethi, Nimay Ahirwar, Rakesh Sarkar
- **D1M Studios Chairman:** Darshil Sharma
- **BRO GANG Chairmans:** Aditya Kumar Sethi & Nimay Ahirwar
- **Debugging & Frontend:** OpenCode from Anomalyco

### 💻 Built on Small Hardware

This full project was made on just **4 GB RAM**, **Tiny 10 LTSC**, some
**Intel UHD Graphics 600**, and an **Intel Celeron** — to say that
*small hardware can make big changes.*

### 🧰 Infrastructure

| Role | Tool |
|------|------|
| Git Support | [git-scm.com](https://git-scm.com/) |
| Git Hosts | Codeberg & GitHub |
| Hosting | Cloudflare · GitHub Pages |
| Subdomain | DNSExit · Cloudflare Workers · Cloudflare Pages · GitHub Pages |
| Authentication | Auth0 |

---

## ⚖️ Legal

- Pokémon and all related trademarks belong to **The Pokémon Company**.
- All licenses and trademarks mentioned belong to their respective owners.
- **Made in India 🇮🇳 for the world** for next zen internet exploration.

---

## 📄 Documentation

- [Privacy Policy](https://pglove.jo3.org/privacy)
- [Terms & Conditions](https://pglove.jo3.org/terms)
- [v1.0.4 Archive](https://pglove.jo3.org/v1.0.4)
- [security.txt](https://pglove.jo3.org/.well-known/security.txt)

---

## 📜 License

[Add your license badge here — MIT / Apache 2.0 / GPL-3.0 — read the repo LICENSE file]
```

---

<a name="phase-13"></a>

## PHASE 13 — UPGRADE `404.html`

Completely rewrite `404.html` to match the site theme.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 — Page Not Found | PGlove</title>
  <meta name="description" content="Page not found on pglove.jo3.org. Head back to PGlove — A Browser With A New Generation.">
  <meta name="robots" content="noindex">
  <link rel="icon" type="image/png" href="/favicon.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Devanagari:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --purple-500: #6d28d9;
      --purple-400: #8b4dff;
      --purple-300: #ab7bff;
      --blue-500: #3b82f6;
      --cyan-400: #22d3ee;
      --cyan-300: #67e8f9;
      --bg-1: #0a0420;
      --text: #e8e4f5;
      --text-dim: #b8aee0;
      --text-muted: #7a6fa5;
      --border: rgba(139, 77, 255, 0.18);
      --ease: cubic-bezier(0.22, 1, 0.36, 1);
    }
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Inter', system-ui, sans-serif;
      background: var(--bg-1);
      color: var(--text);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem;
      text-align: center;
      background-image:
        radial-gradient(circle at 20% 10%, rgba(109, 40, 217, 0.25), transparent 45%),
        radial-gradient(circle at 80% 80%, rgba(37, 99, 235, 0.20), transparent 45%);
    }
    .container { max-width: 640px; }
    .logo {
      width: 100px;
      height: 100px;
      margin: 0 auto 1.5rem;
      animation: float 3s ease-in-out infinite;
      filter: drop-shadow(0 0 40px rgba(139, 77, 255, 0.6));
    }
    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-12px); }
    }
    .code {
      font-family: 'Space Grotesk', sans-serif;
      font-size: clamp(4rem, 12vw, 8rem);
      font-weight: 800;
      letter-spacing: -0.05em;
      background: linear-gradient(135deg, #fff 0%, var(--purple-300) 40%, var(--cyan-400) 100%);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      line-height: 1;
      margin-bottom: 1rem;
    }
    h1 {
      font-family: 'Space Grotesk', sans-serif;
      font-size: clamp(1.4rem, 4vw, 2rem);
      font-weight: 700;
      margin-bottom: 0.8rem;
    }
    p { color: var(--text-dim); font-size: 1rem; margin-bottom: 2rem; line-height: 1.7; }
    .buttons { display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; }
    .btn {
      display: inline-flex; align-items: center; gap: 10px;
      padding: 0.9rem 1.6rem; border-radius: 12px;
      font-size: 0.88rem; font-weight: 600;
      text-decoration: none; transition: all 0.3s var(--ease);
    }
    .btn-primary {
      background: linear-gradient(135deg, var(--purple-500), var(--blue-500));
      color: #fff; box-shadow: 0 8px 30px rgba(109, 40, 217, 0.4);
    }
    .btn-primary:hover { transform: translateY(-3px); }
    .btn-secondary {
      background: rgba(139, 77, 255, 0.08);
      color: var(--purple-300); border: 1px solid var(--border);
    }
    .btn-secondary:hover { background: rgba(139, 77, 255, 0.15); transform: translateY(-3px); }
    .foot { margin-top: 2.5rem; font-size: 0.75rem; color: var(--text-muted); }
  </style>
</head>
<body>
  <div class="container">
    <img src="/logo.gif" alt="PGlove" class="logo" onerror="this.src='/logo.png'">
    <div class="code">404</div>
    <h1>Signal lost in the void.</h1>
    <p>
      The page you're looking for doesn't exist, was moved, or is still
      being built. Even browsers break sometimes — that's the point.
    </p>
    <div class="buttons">
      <a href="/" class="btn btn-primary"><i class="fas fa-home"></i> Back to PGlove</a>
      <a href="https://github.com/TechAdityaBRO/PGlove/issues"
         class="btn btn-secondary" target="_blank" rel="noopener">
        <i class="fab fa-github"></i> Report Broken Link
      </a>
    </div>
    <div class="foot">🇮🇳 Made in India for the world — BRO GANG &amp; D1M Studios</div>
  </div>
</body>
</html>
```

---

<a name="phase-14"></a>

## PHASE 14 — SOCIAL LINKS

Add a social icons row in the footer (before the commit badge).

```html
<div class="social-row">
  <a href="https://github.com/TechAdityaBRO/PGlove" target="_blank" rel="noopener" aria-label="GitHub"><i class="fab fa-github"></i></a>
  <a href="https://codeberg.org/TechAditya/PGlove/" target="_blank" rel="noopener" aria-label="Codeberg"><i class="fas fa-code-branch"></i></a>
  <a href="https://progroupco.itch.io/pglove" target="_blank" rel="noopener" aria-label="Itch.io"><i class="fab fa-itch-io"></i></a>
  <a href="https://matrix.to/#/#pglove:matrix.org" target="_blank" rel="noopener" aria-label="Matrix"><i class="fas fa-comments"></i></a>
  <a href="https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw" target="_blank" rel="noopener" aria-label="Slack"><i class="fab fa-slack"></i></a>
  <a href="https://brogang.techaditya.workers.dev" target="_blank" rel="noopener" aria-label="BRO GANG"><i class="fas fa-bolt"></i></a>
  <a href="https://progroupai.created.app/" target="_blank" rel="noopener" aria-label="Pro AI"><i class="fas fa-robot"></i></a>
  <a href="mailto:pglovebrowser@proton.me" aria-label="Email"><i class="fas fa-envelope"></i></a>
</div>
```

```css
.social-row {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin: 1.5rem 0;
  flex-wrap: wrap;
}
.social-row a {
  width: 42px; height: 42px;
  border-radius: 12px;
  background: rgba(139, 77, 255, 0.08);
  border: 1px solid var(--border);
  display: flex; align-items: center; justify-content: center;
  color: var(--purple-300);
  text-decoration: none;
  font-size: 1.1rem;
  transition: all 0.3s var(--ease);
}
.social-row a:hover {
  background: rgba(139, 77, 255, 0.2);
  transform: translateY(-3px);
  color: var(--cyan-300);
  box-shadow: 0 8px 20px rgba(109, 40, 217, 0.3);
}
```

---

<a name="phase-15"></a>

## PHASE 15 — PUSH TO GITHUB

### 15.1 — Stage files

```bash
git status
git add index.html
git add 404.html
git add v1.0.4.html
git add privacy.html
git add terms.html
git add README.md
git add robots.txt sitemap.xml humans.txt manifest.json security.txt
git add .well-known/security.txt
git add _headers _redirects
git add logo.gif logo.png favicon.png og-image.png
git add OPENCODE_TASK.md
```

### 15.2 — Commit

```bash
git commit -m "feat(web): full rebuild — SEO, i18n, ecosystem, credits, docs

- Full index.html rebuild with purple/blue theme (17 sections)
- Added Hindi hover translations (Bro Gang pattern)
- Added next-level SEO: meta, OG, Twitter Card, JSON-LD
- Added robots.txt, sitemap.xml, humans.txt, manifest.json, security.txt
- Added _headers + _redirects for Cloudflare Pages
- Clean URLs (no .html extension): /v1.0.4, /privacy, /terms
- Added Ecosystem section (BRO GANG AI, BRO GANG, Pro AI, PGlove, Extensions)
- Added Credits section with hardware story + infrastructure + legal
- Added commit info badge (auto-updates on every push)
- Added social row (GitHub, Codeberg, Itch, Matrix, Slack, BRO GANG, Pro AI, Email)
- Logo GIF on loading screen + navbar + footer + 404
- Upgraded README.md with full credits + ecosystem + docs
- Upgraded 404.html with brand theme
- New privacy.html + terms.html
- Contact email: pglovebrowser@proton.me"
```

### 15.3 — Push

```bash
# If origin not set:
git remote add origin https://github.com/TechAdityaBRO/PGlove.git

# If branch is not main:
git branch -M main

# Push
git push origin main
```

### 15.4 — If auth fails

```bash
gh auth login
# or
git remote set-url origin https://<YOUR_PAT>@github.com/TechAdityaBRO/PGlove.git
git push origin main
```

**Never commit the PAT.** Use `gh auth login` or the git credential store.

---

<a name="guard-rails"></a>

## 🛡️ GUARD RAILS — DO NOT

- ❌ Do NOT delete useful existing `README.md` content — **upgrade** it
- ❌ Do NOT change the PGlove logo or brand colors
- ❌ Do NOT remove the v1.0.4 archive notice
- ❌ Do NOT remove the Nexa Search section
- ❌ Do NOT change the Bitcoin addresses
- ❌ Do NOT remove the Proton Meet, Slack, or Matrix links
- ❌ Do NOT commit secrets, tokens, or API keys
- ❌ Do NOT force-push (`git push -f`)
- ❌ Do NOT touch the PGlove-Pokemon-Rust repo
- ❌ Do NOT create files outside the repo root (except `.well-known/`)
- ❌ Do NOT break the mobile responsive layout
- ❌ Do NOT use `.html` in internal links (use clean URLs)
- ❌ Do NOT remove existing `404.html` content without replacing it

---

<a name="done-means"></a>

## ✅ DONE MEANS

Report back with:

### Files

- **Files created** — list with line counts
- **Files modified** — list with diff summary
- **Files renamed** — e.g. `pglovev1.0.4.html` → `v1.0.4.html`

### Sections (all 17 required)

- [ ] Navbar (i18n)
- [ ] Hero
- [ ] v1.0.4 Archived Notice
- [ ] Nexa Search
- [ ] Download (4 cards)
- [ ] Roadmap
- [ ] Codeberg
- [ ] Community (3 links incl. Matrix)
- [ ] Bitcoin Donate (2 QR)
- [ ] Why PGlove (6 cards)
- [ ] Ecosystem (new)
- [ ] Supported By
- [ ] Credits (new)
- [ ] Team
- [ ] BroGangMC Server
- [ ] CTA
- [ ] Footer (+ commit badge + socials)

### i18n

- Translation count — how many `.tr` spans added

### SEO

- SEO checklist — meta, OG, Twitter Card, JSON-LD, sitemap, robots, hreflang

### Clean URLs

- `/v1.0.4` works, no `.html` needed; `.html` still works

### Docs

- `README.md` — new content preview
- `404.html` — new content preview
- `privacy.html` + `terms.html` — confirm created

### Git

- Git commit hash (SHA)
- Live URL check — https://pglove.jo3.org/ reflects changes (after auto-deploy, ~60s)

### Errors

- Any errors — exact output

---

<a name="reference-links"></a>

## 🔗 REFERENCE LINKS

| Resource | URL |
|----------|-----|
| Main repo | https://github.com/TechAdityaBRO/PGlove |
| Archived v1.0.4 | https://github.com/TechAdityaBRO/PGlove-Pokemon-Rust |
| Codeberg mirror | https://codeberg.org/TechAditya/PGlove/ |
| Live site | https://pglove.jo3.org |
| Nexa Search | https://nexasearch.pages.dev |
| BRO GANG AI | https://brogang.techaditya.workers.dev |
| BRO GANG | https://brogang.techaditya.workers.dev |
| Pro AI | https://progroupai.created.app/ |
| Git SCM | https://git-scm.com/ |
| NPM Stable | https://github.com/TechAdityaBRO/PGlove/pkgs/npm/pglove-stable |
| NuGet | https://github.com/TechAdityaBRO/PGlove/pkgs/nuget/PGloveCore |
| Winget PR | https://github.com/microsoft/winget-pkgs/pull/421311 |
| Itch.io | https://progroupco.itch.io/pglove |
| Archive.org | https://archive.org/download/pglove-installers/PGlove-Installers.exe |
| Email | pglovebrowser@proton.me |
| Matrix | https://matrix.to/#/#pglove:matrix.org |
| Proton Meet | https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H |
| Slack | https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw |

---

## 🎬 EXECUTION ORDER

1. **Phase 0** — Read state, report findings
2. **Phase 1** — Build `index.html` (17 sections)
3. **Phase 2** — Hindi i18n tooltips
4. **Phase 3** — SEO meta + JSON-LD
5. **Phase 4** — SEO files (robots, sitemap, humans, manifest, security, headers, redirects)
6. **Phase 5** — Clean URLs
7. **Phase 6** — Logo GIF (loader, navbar, footer, 404)
8. **Phase 7** — Credits section
9. **Phase 8** — Ecosystem section
10. **Phase 9** — Commit badge
11. **Phase 10** — Privacy policy
12. **Phase 11** — Terms & conditions
13. **Phase 12** — Upgrade `README.md`
14. **Phase 13** — Upgrade `404.html`
15. **Phase 14** — Social links
16. **Phase 15** — Push to GitHub
17. **Report** — full checklist back to the user

**Begin.**

---

## 📁 HOW TO USE

### 1. Clone the repo first

```bash
git clone https://github.com/TechAdityaBRO/PGlove.git
cd PGlove
```

### 2. Copy this file into the repo root

```
PGlove/
├── index.html
├── 404.html
├── README.md
├── OPENCODE_TASK.md   ← this file
└── ...
```

### 3. Run OpenCode

**Option A — direct prompt**

```bash
opencode --prompt OPENCODE_TASK.md
```

**Option B — via stdin**

```bash
opencode < OPENCODE_TASK.md
```

**Option C — copy-paste** the whole markdown into OpenCode's chat.

---

## 🧾 WHAT IT DOES

| Phase | Action |
|-------|--------|
| 0 | Reads current repo + live site + i18n reference |
| 1 | Rebuilds `index.html` (17 sections) |
| 2 | Hindi hover tooltips on every label |
| 3 | Full SEO meta + Open Graph + Twitter Card + JSON-LD |
| 4 | 7 site files (robots, sitemap, humans, manifest, security, headers, redirects) |
| 5 | Clean URLs — `/v1.0.4`, not `/v1.0.4.html` |
| 6 | Logo GIF on loading screen + navbar + footer + 404 |
| 7 | Credits section (Chief Dev, Pokémon team, D1M, hardware story, infra, legal) |
| 8 | Ecosystem section (BRO GANG AI, BRO GANG, Pro AI, PGlove, Extensions) |
| 9 | Commit info badge (SHA + message + date, auto-updates) |
| 10 | Privacy policy update |
| 11 | Terms & conditions (new) |
| 12 | Upgrades `README.md` |
| 13 | Upgrades `404.html` |
| 14 | Social links row |
| 15 | Pushes to GitHub with a detailed commit message |

## 🔐 SAFETY

| Feature | Purpose |
|---------|---------|
| Phase 0 read-first | No blind edits |
| Guard rails | Prevents accidental damage |
| Explicit URLs | No placeholders |
| Clean URL rules | Clear what's wrong vs. right |
| Done Means checklist | Forces verification before claiming success |
| No force-push | Protects history |

---

**Made in India 🇮🇳 for the world — for next zen internet exploration.**
**The PGlove Browser by Aditya Kumar Sethi & Team (BRO GANG & D1M Studios)**

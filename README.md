<div align="center">

# PGlove

### A Browser With A New Generation

**Made in India 🇮🇳 for the world, for next zen internet exploration.**

<p>
  <a href="https://pglove.jo3.org/"><b>Website</b></a> ·
  <a href="https://progroupco.itch.io/pglove"><b>itch.io</b></a> ·
  <a href="https://github.com/TechAdityaBRO/PGlove/releases"><b>Releases</b></a> ·
  <a href="https://codeberg.org/TechAditya/PGlove/"><b>Codeberg Mirror</b></a> ·
  <a href="https://pglove.jo3.org/support.html"><b>Support</b></a>
</p>

<img src="https://img.shields.io/github/v/release/TechAdityaBRO/PGlove?include_prereleases&sort=date&display_name=tag&style=social" alt="Latest release">
<img src="https://img.shields.io/github/license/TechAdityaBRO/PGlove?style=social&label=License" alt="License">
<img src="https://img.shields.io/github/stars/TechAdityaBRO/PGlove?style=social" alt="Stars">
<img src="https://img.shields.io/github/forks/TechAdityaBRO/PGlove?style=social" alt="Forks">
<img src="https://img.shields.io/github/last-commit/TechAdityaBRO/PGlove?style=social" alt="Last commit">

<img src="logo.gif" width="160" alt="PGlove logo" onerror="this.src='logo.png'">

</div>

---

## What is PGlove?

PGlove is an **experimental browser** built around a genuine **Tauri 2 + Rust** core rather
than an Electron wrapper. Every tab is its own WebView2 instance with real per-tab history, and
the whole thing runs comfortably on a 4 GB machine with integrated graphics.

It is **BSD 3-Clause** licensed, has **no telemetry, no analytics, no tracking pixels**, and is
developed in the open by a small team. It is also honest about where it is: stable `v1.0.3` ships
today, `v1.0.4` is archived, and `v1.0.5`–`v1.0.7` are paused pending funding.

> **Experimental by design.** Nighty builds are unstable and may lose data. Back up anything you
> cannot afford to lose.

## Releases

| Version | Theme | Status |
| --- | --- | --- |
| `v1.0.3` | Core browser | 🟢 **Stable — recommended** |
| `v1.0.4` | Pokémon | 🟠 **Archived** — source preserved at [PGlove-Pokemon-Rust](https://github.com/TechAdityaBRO/PGlove-Pokemon-Rust) |
| `v1.0.5` | Minecraft | ⚪ Paused — funding |
| `v1.0.6` | GTA 6 | ⚪ Paused — funding |
| `v1.0.7` | Vice City | ⚪ Paused — funding |

See the [roadmap](https://pglove.jo3.org/roadmap.html) for the full history.

## Get PGlove

- 🌐 [Download from the website](https://pglove.jo3.org/#download)
- 📦 [NPM — `pglove-stable`](https://github.com/TechAdityaBRO/PGlove/pkgs/npm/pglove-stable)
- 📦 [NuGet — `PGloveCore`](https://github.com/TechAdityaBRO/PGlove/pkgs/nuget/PGloveCore)
- 🕹️ [itch.io](https://progroupco.itch.io/pglove)
- 🗄️ [Internet Archive](https://archive.org/)

## Why PGlove

- ⚡ **Real Tauri 2 core** — a genuine Rust backend, small binary, fast cold start.
- 📄 **Per-tab isolation** — each tab is an independent WebView2 instance with genuine history.
- 🔒 **Privacy first** — no telemetry, no analytics, nothing sold. History stays on your disk.
- 🎨 **Themeable core** — the engine *is* the theme layer, so themes replace the whole look.
- 🪶 **Featherweight** — happy on 4 GB RAM and Intel UHD Graphics 600.
- 🇮🇳 **Made in India for the world.**

Read more on the [features page](https://pglove.jo3.org/features.html).

## Themes / Extensions

| Theme | Version | Status |
| --- | --- | --- |
| Pokémon | `v1.0.4` | [Archived](https://pglove.jo3.org/v1.0.4/) |
| Minecraft | `v1.0.5` | In development |
| GTA 6 | `v1.0.6` | Paused — funding |
| Vice City | `v1.0.7` | Paused — funding |

Full details on the [extensions page](https://pglove.jo3.org/extensions.html).

## Community

- 💬 [Matrix](https://matrix.to/#/#pglove:matrix.org) — decentralized, federated, encrypted
- 💼 [Slack](https://join.slack.com/t/pglovebrowser/shared_invite/zt-4b78o71fo-LvyQ3u8uNQJjGd7M0Hoqqw)
- 📹 [Proton Meet](https://meet.proton.me/join/id-2TF92J77T0#pwd-i3LWO2keD76H) — live dev sessions
- 🐛 [GitHub Issues](https://github.com/TechAdityaBRO/PGlove/issues) — reproducible bugs
- ✉️ [pglove@atomicmail.io](mailto:pglove@atomicmail.io)

## Support the project

There are no ads, no sponsors, and no paywall. Donations are what unblock `v1.0.5`–`v1.0.7`.

```
bc1q705nev4a38jg09kqxkljm7kn9xt4ntkvcxfe9w
bc1q85a6fdkkcd3m75lmx202acvswqmxpwl9j2pxwh
```

Both addresses are public and cannot be linked or traced to a donor. See the
[support page](https://pglove.jo3.org/support.html).

## Ecosystem

| Project | Link |
| --- | --- |
| BRO GANG AI | [brogang.techaditya.workers.dev](https://brogang.techaditya.workers.dev) |
| BRO GANG | [brogang.techaditya.workers.dev](https://brogang.techaditya.workers.dev) |
| Pro AI | [progroupai.created.app](https://progroupai.created.app/) |
| PGlove | [pglove.jo3.org](https://pglove.jo3.org/) |
| PGlove Extensions | [pglove.jo3.org/extensions.html](https://pglove.jo3.org/extensions.html) |
| Nexa Search | [nexasearch.pages.dev](https://nexasearch.pages.dev/) |

---

## About this repository

This repo is the **website and distribution** for PGlove — not the browser engine itself.

| Path | What it is |
| --- | --- |
| `index.html` | The entire single-page site (17 sections) |
| `features.html` `extensions.html` `roadmap.html` `support.html` | Supporting sub-pages |
| `v1.0.4/index.html` | Archived Pokémon theme release page |
| `privacy/index.html` `terms/index.html` | Legal pages at clean URLs |
| `404.html` | Branded not-found page |
| `manifest.json` `robots.txt` `sitemap.xml` `humans.txt` `browserconfig.xml` | Site metadata |
| `.well-known/security.txt` | RFC 9116 security contact |
| `logo.gif` `logo.png` `icon-*.png` `apple-touch-icon.png` `favicon.png` `og-image.png` | Brand assets |
| `tools/` | Reproducible generators for the assets and sub-pages |

### Regenerating

Everything under `tools/` is deterministic — no hand-editing of generated output.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\tools\make-assets.ps1     # PNGs + og-image
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\tools\make-gif.ps1        # logo.gif
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\tools\make-subpages.ps1   # the four sub-pages
```

> The scripts are saved **UTF-8 with BOM**. Windows PowerShell 5.1 reads `.ps1` files as
> ANSI without a BOM and will mangle the Hindi text, so keep the BOM.

### Tech

Hand-written HTML, CSS and JavaScript. No framework, no bundler, no build step, no runtime
dependency. Hindi tooltips use the `.tr` / `.hi` pattern and are disabled on touch devices via
`@media (hover:none)`.

Hosted on **GitHub Pages** behind Cloudflare DNS, with the custom domain in `CNAME` and `.nojekyll`
present.

## Credits

- **Chief Developer** — Aditya Kumar Sethi
- **Pokémon Extension Dev Team** — Aditya Kumar Sethi & Darshil Sharma
- **Production** — BRO GANG Studios & D1M Studios
- **Debugging & frontend** — [OpenCode](https://opencode.ai) by Anomalyco
- **Version control** — [Git](https://git-scm.com), on GitHub and Codeberg
- **Hosting & CDN** — GitHub Pages + Cloudflare
- **Authentication** — Auth0

> Pokémon and all related trademarks belong to **The Pokémon Company**.
> PGlove is an unaffiliated fan project and is not endorsed by them.

## License

[BSD 3-Clause](LICENSE) © Aditya Kumar Sethi, BRO GANG Studios & D1M Studios.

# CLAUDE.md — Underdog City site

Dark-fantasy transmedia project (music + story + lore). Album **THRONE AT THE
BOTTOM** drops **07.31.2026** via DistroKid. Live at
[theunderdogcity.com](https://theunderdogcity.com).

## ⚠️ Read before touching anything

1. **`underdog-city-v5` is no longer connected to git.** Shawn disconnected the
   integration entirely on 2026-07-25. Merging to `main` does **not** deploy
   anything. `theunderdogcity.com` serves the 2026-07-14 CLI deploy
   (`dpl_GdoLNK4tk8pYhyDxJ8HRPmB7uLHN`) and is live and working.

   _Earlier versions of this file carried a long "the failing production build
   is load-bearing, do not fix it" warning. That trap is gone — disconnecting
   removed it at the source. Nothing in this repo can reach the live site now._

2. **This code is NOT what's live — and that gap is now the whole risk.** The
   live site is the July 14 CLI deploy. This copy came from the `SBB` repo, last
   committed July 10. Reconnecting git before reconciling would publish this
   older copy over the working site. Known missing vs. live:
   - Nav routes **Serial / Community / The Halo** (this copy has only `/`,
     `/music`, `/vault`)
   - "Choose a door / Enter the City" 3-card grid on the homepage
   - "Cenotaph Records" footer
   - Recovery path: Vercel dashboard → `underdog-city-v5` → the July 14
     production deployment → **Source** tab has the deployed files. Reconcile
     into this app, _then_ reconnect the Vercel project to git so this never
     happens again. Order matters; reconnecting first is the mistake.

## Stack & structure

Next.js (App Router) + Tailwind v4, TypeScript strict. No database — email
capture posts to **Beehiiv** (`POST /api/subscribe`, honeypot + rate limiting;
returns 503 until env vars are set). Analytics: Plausible (env-gated).

- `src/app/` — routes (`/`, `/music`, `/vault`, `api/subscribe`)
- `src/content/` — site copy incl. `novel.ts` (staged web-serial prose, no route yet)
- `src/components/` — `Nav`, `Countdown`, `EmailCapture`
- `docs/` — **the content library**: `story-bible.md` (canon), the tracklist,
  `song-themes.md`, `anime-visual-kit.md`, and the Suno / songwriting / Claude
  Code playbooks. The launch-planning docs (rollout, unified launch plan, tease
  calendar, welcome emails, content log, release + YouTube playbooks) were
  **deleted 2026-07-25** — over-planned, never used. Don't recreate them.
- `.claude/skills/post/` — `/post` skill: drafts one ready-to-shoot short-form post

## Commands

```sh
npm install
cp .env.example .env   # Beehiiv keys + site URL + launch date
npm run dev            # local
npm run build          # must pass before any PR
npm run lint
```

Env vars (see `.env.example`): `BEEHIIV_API_KEY`, `BEEHIIV_PUBLICATION_ID`,
`NEXT_PUBLIC_SITE_URL`, `NEXT_PUBLIC_PLAUSIBLE_DOMAIN`, `NEXT_PUBLIC_LAUNCH_DATE`.

## Deployment (current reality, not aspiration)

- Vercel project **`underdog-city-v5`** holds `theunderdogcity.com` + `www`.
- **Not connected to git.** Shawn disconnected it 2026-07-25. This repo has no
  path to production right now — nothing here can deploy by accident.
- What's serving is the **2026-07-14 CLI deploy**, `READY` and healthy.
- Note the live build reports `Detected Next.js version: 15.5.20`; this repo
  pins `next@^16.2.6`. The drift is real and worth knowing about during any
  reconcile.
- Order of operations whenever git deploys are wanted back: reconcile the
  July-14 source **first** (`CLEANUP_CHECKLIST.md` B1), _then_ reconnect git
  with Root Directory = `apps/underdog-city` and a build command that matches
  the reconciled app. Any other order publishes the stale copy over a working
  site.

## Rules

- Stay on canon: `docs/story-bible.md` is the source of truth for lore.
- Nothing publishes, posts, or ships live without Shawn's explicit approval.
- No secrets in the repo; Beehiiv keys live in Vercel env vars only.

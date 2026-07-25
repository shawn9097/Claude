# CLAUDE.md — Underdog City site

Dark-fantasy transmedia project (music + story + lore). Album **THRONE AT THE
BOTTOM** drops **07.31.2026** via DistroKid. Live at
[theunderdogcity.com](https://theunderdogcity.com).

## ⚠️ Read before touching anything

1. **Launch freeze: no changes to the live Vercel project (`underdog-city-v5`)
   before 2026-08-01.** The album fires on 07.31 whether we're ready or not, and
   every CTA points at this site.
2. **This code is NOT exactly what's live.** The live site is a July 14 CLI
   deploy (`vercel deploy` from some machine — no git connection). This copy
   came from the `SBB` repo, last committed July 10. Known missing vs. live:
   - Nav routes **Serial / Community / The Halo** (this copy has only `/`,
     `/music`, `/vault`)
   - "Choose a door / Enter the City" 3-card grid on the homepage
   - "Cenotaph Records" footer
   - Recovery path: Vercel dashboard → `underdog-city-v5` → the July 14
     production deployment → **Source** tab has the deployed files. Reconcile
     into this app after 8/1, then connect the Vercel project to git so this
     never happens again.

## Stack & structure

Next.js (App Router) + Tailwind v4, TypeScript strict. No database — email
capture posts to **Beehiiv** (`POST /api/subscribe`, honeypot + rate limiting;
returns 503 until env vars are set). Analytics: Plausible (env-gated).

- `src/app/` — routes (`/`, `/music`, `/vault`, `api/subscribe`)
- `src/content/` — site copy incl. `novel.ts` (staged web-serial prose, no route yet)
- `src/components/` — `Nav`, `Countdown`, `EmailCapture`
- `docs/` — **the content library**: `story-bible.md` (canon), launch plans,
  content calendar, playbooks (Suno, YouTube, release), tracklist, content log
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
- All its deploys so far are CLI deploys — **not connected to this repo**.
- After 8/1: reconcile the July-14 source (see warning above), point
  `underdog-city-v5` at this repo with Root Directory `apps/underdog-city`,
  and retire CLI deploys.

## Rules

- Stay on canon: `docs/story-bible.md` is the source of truth for lore.
- Nothing publishes, posts, or ships live without Shawn's explicit approval.
- No secrets in the repo; Beehiiv keys live in Vercel env vars only.

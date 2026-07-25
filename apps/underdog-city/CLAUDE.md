# CLAUDE.md — Underdog City site

Dark-fantasy transmedia project (music + story + lore). Album **THRONE AT THE
BOTTOM** drops **07.31.2026** via DistroKid. Live at
[theunderdogcity.com](https://theunderdogcity.com).

## 🛑 STOP — the failing production build is load-bearing. Do not fix it.

**`underdog-city-v5` IS already connected to `shawn9097/Claude`, production
branch `main`.** Verified against the Vercel API 2026-07-25. Every merge to
`main` fires a **production** build of the live album site. This contradicts
what earlier versions of these docs (and `CLEANUP_CHECKLIST.md` B2) claimed —
they said the connection didn't exist yet. It does.

Those production builds are **failing**, and that failure is the only thing
keeping the live site up:

- Merge of PR #4 → production build `dpl_Ca2N5Psp8eiqefp73FnqkxuUsTfe`,
  2026-07-25 04:37 UTC, **ERROR**.
- The live site is still `dpl_GdoLNK4tk8pYhyDxJ8HRPmB7uLHN` — the **2026-07-14
  02:28 UTC CLI deploy**, still `READY` and still serving, because Vercel keeps
  the last good production deployment when a new build fails.
- Cause: the project's dashboard **Build Command override** is
  `node scripts/fetch-assets.mjs && next build`. This repo has
  `scripts/make-assets.mjs` — no `fetch-assets.mjs` anywhere. Filename
  mismatch, nothing more.

**If you "fix" that filename, the build succeeds and deploys THIS copy over
`theunderdogcity.com`** — silently replacing the live site with the older
version described below, days before the album drops. The red X is a
safety net. Leave it red until `CLEANUP_CHECKLIST.md` B1 (reconcile the
July-14 source) is actually done. Any change here needs Shawn's explicit
approval — hard rule #3.

## ⚠️ Read before touching anything

1. **Launch freeze: no changes to the live Vercel project (`underdog-city-v5`)
   before 2026-08-01.** The album fires on 07.31 whether we're ready or not, and
   every CTA points at this site. Note the freeze is **not** actually enforced —
   see the STOP block above; merges to `main` already trigger production builds.
2. **This code is NOT exactly what's live.** The live site is the July 14 CLI
   deploy. This copy came from the `SBB` repo, last committed July 10. Known
   missing vs. live:
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
- It **is** connected to `shawn9097/Claude`, production branch `main`, Root
  Directory `apps/underdog-city` (the monorepo path resolves correctly — the
  build reaches `next build` and only trips on the asset-script filename).
  Verified via the Vercel API 2026-07-25.
- What's **serving** is still the 2026-07-14 CLI deploy, because every
  git-triggered production build since has errored. See the STOP block above.
- Order of operations after 8/1: reconcile the July-14 source **first**
  (`CLEANUP_CHECKLIST.md` B1), _then_ fix the build command, _then_ let git
  deploys take over. Doing those in any other order publishes the stale copy.

## Rules

- Stay on canon: `docs/story-bible.md` is the source of truth for lore.
- Nothing publishes, posts, or ships live without Shawn's explicit approval.
- No secrets in the repo; Beehiiv keys live in Vercel env vars only.

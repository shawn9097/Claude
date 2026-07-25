# Cleanup checklist — Vercel + GitHub dashboards

Steps **Shawn has to click through** — none of these can be done by Claude's
tools (no API for Vercel project archival/domain removal or GitHub repo
archiving). Do them in order; each one says why it's safe.

Two rules baked into the ordering:

1. **Nothing touches the `underdog-city-v5` Vercel project before 08/01.**
   The album fires 07.31 and every CTA lands on that site.
2. **Archive, never delete.** Everything below is reversible.

---

## 🛑 Correction — 2026-07-25: rule 1 is already being violated

This checklist assumed `underdog-city-v5` was CLI-only and that connecting it
to git was a future step (B2). **It is already connected** to
`shawn9097/Claude` with production branch `main` — verified via the Vercel API
2026-07-25. The merge of PR #4 fired a **production** build at 04:37 UTC that
ended in **ERROR** (`dpl_Ca2N5Psp8eiqefp73FnqkxuUsTfe`).

`theunderdogcity.com` is fine right now — it still serves the 2026-07-14 CLI
deploy (`dpl_GdoLNK4tk8pYhyDxJ8HRPmB7uLHN`, `READY`), because Vercel keeps the
last good production deployment when a build fails.

**The failing build is the safety net. Do not fix it before B1.** Two settings
are wrong, and both would have to be corrected for a git build to succeed:
Root Directory is unset (so the build runs at the repo root, which has no
`package.json`), and the Build Command override calls
`scripts/fetch-assets.mjs` while this repo has `scripts/make-assets.mjs`.

Fixing only the build command fails differently and harmlessly. Fixing both —
**exactly what B2 below used to instruct** — turns the build green and
publishes the _older_ git copy over the live site, days before launch. B1
(recover the true source) must land first. See `apps/underdog-city/CLAUDE.md`.

Needs a decision from Shawn: leave it red through launch (safe, ugly), or
disconnect the git integration until 08/01 (safest, one dashboard click,
removes the trap entirely).

---

## A. Safe now (before 07/31)

- [ ] **A0. Confirm a stranger can load theunderdogcity.com.**
      Private/incognito window, or your phone on cellular with wifi off. You
      should get the site itself — no login screen, no "Authentication
      Required", no redirect containing `_vercel_share`.
      _If it asks for a login: Vercel → `underdog-city-v5` → Settings →
      Deployment Protection → turn it off for Production._
      _Why this is first: it's 30 seconds and it's the only item where the
      failure mode is "nobody can reach the site on launch night." Claude
      can't check this — outbound requests from the cloud session are blocked
      by network policy, so this one genuinely needs your eyes._

- [ ] **A1. Remove the stale apex claim.**
      Vercel → `underdogcity` (the OLD project, not v5) → Settings → Domains →
      remove `theunderdogcity.com`.
      _Why safe: verified 07/25 — `underdog-city-v5` holds **both**
      `theunderdogcity.com` and `www.theunderdogcity.com`, and its latest
      production deploy is READY. The old project holds only the bare apex,
      and its "live" flag is false. Removing it deletes a leftover claim, not
      the live binding._
      **Before you click, sanity-check on the v5 project's Domains page that
      both `theunderdogcity.com` and `www.theunderdogcity.com` are listed
      there.** If they're not, stop — don't remove anything, tell Claude.
      After removing, re-run A0.

- [ ] **A2. Archive the three domain-less Vercel projects.**
      Vercel → Settings → Advanced → Archive (or pause), for:
      `underdogcity-suite`, `underdogcity-woms`, `underdogcity-jnkx`.
      _Why safe: no custom domains, nothing points at them._

- [ ] **A3. Archive the dead GitHub repos.**
      GitHub → repo → Settings → Danger Zone → "Archive this repository", for:
      `UC`, `Underdog-City`, `Underdog`, `A1`, `test`, `UnderdogCityV5`.
      _Why safe: none serve a deploy. `UnderdogCityV5` sounds scary but
      contains only a README — the live site never came from it (it's fed by
      CLI deploys). Archiving is read-only, reversible, and no default-branch
      fixes are needed on archived repos._

- [x] **A4. Merge the consolidation PR** (the one that added `apps/` to
      `shawn9097/Claude`). Everything in section B depends on the apps living
      in `main`. — **Done:** PR #3 merged 2026-07-25 03:39 UTC (`a9d9249`).

- [ ] **A5. Repoint the `warmside` Vercel project.**
      Vercel → `warmside` → Settings → Git → disconnect `shawn9097/SBB`,
      connect `shawn9097/Claude`; Settings → General → Root Directory =
      `apps/warmside`; Production Branch = `main`.
      _Why safe: warmside.app currently serves a stale build and every new
      build fails anyway — this can only make things better, and it doesn't
      touch Underdog City. Existing env vars on the project survive the
      repoint._
      Then trigger a deploy and confirm warmside.app still loads.

- [ ] **A6. Archive the `SBB` GitHub repo** — only AFTER A5 succeeds.
      _Its two jobs (host Warmside builds, hold the UC source) are both done:
      Warmside builds from the monorepo now, and the UC app + docs + /post
      skill were copied into `apps/underdog-city`._

## B. After 08/01 (Underdog City)

- [ ] **B1. Recover the live site's true source.**
      Vercel → `underdog-city-v5` → Deployments → the July 14 production
      deployment → **Source** tab. That's the only copy of what's actually
      live (the git copy in `apps/underdog-city` is 4 days older — missing the
      Serial / Community / The Halo routes, the "Choose a door" grid, and the
      Cenotaph Records footer). Download it / point a Claude session at it to
      reconcile into `apps/underdog-city`.

- [ ] **B2. ~~Connect `underdog-city-v5` to git.~~ Already connected — fix the
      build command instead.**
      The connection exists (`shawn9097/Claude`, Production Branch `main`).
      What's left is two settings, and doing them is what arms the trap — so
      only after B1: set **Root Directory** = `apps/underdog-city` (currently
      unset), and change the **Build Command** override from
      `node scripts/fetch-assets.mjs && next build` to match whatever the
      reconciled app actually ships (plain `next build` works for this repo).
      **Only after B1.** Until then the failing build is deliberately
      protecting the live site — see the correction block at the top.

- [ ] **B3. Archive the old `underdogcity` Vercel project** (apex was already
      removed in A1; nothing references it anymore).

## C. Explicitly NOT on the list

- **`luke-mcbroom-personal-training` repo — do not archive.** Cloudflare Pages
  still deploys lukemcbroom.com from its `main`. It stays until/unless
  Cloudflare is repointed at the monorepo (optional, zero urgency).
- **Supabase — leave both projects as they are.** `Warmside` is
  ACTIVE_HEALTHY and in use. `underdog-city` is paused and that's fine: the
  live UC site doesn't use Supabase at all (email capture goes to Beehiiv).
- **Anything on `underdog-city-v5` before 08/01.**

---

## Verified state (checked 2026-07-25 via the Vercel API)

Six Vercel projects, five of them Underdog City. Use the IDs to make sure
you're on the right project page before changing anything.

| Project              | ID                                 | Custom domains                                    | Latest deploy        |
| -------------------- | ---------------------------------- | ------------------------------------------------- | -------------------- |
| `underdog-city-v5`   | `prj_UcAU0EuSePQSNmw7rS4EviuaV8lh` | `theunderdogcity.com` + `www.theunderdogcity.com` | READY (production)   |
| `underdogcity` (old) | `prj_LcFmKYNZ535JQCUJtMPGX7o9VkWe` | `theunderdogcity.com` ← **stale claim, A1**       | READY, `live: false` |
| `warmside`           | `prj_qHAh2s9c06Gn4OiqSQGqFYqABqQp` | `warmside.app` + `www.warmside.app`               | **ERROR**            |
| `underdogcity-suite` | `prj_4d5eWoGoZOX4ZtAAFBJBGOgH2FPJ` | none                                              | —                    |
| `underdogcity-woms`  | `prj_KP5B0KAStK3MYui37L6Fftk07Ygc` | none                                              | —                    |
| `underdogcity-jnkx`  | `prj_zLWrhhCmPk7pGkmYdhD7ECeXhJm3` | none                                              | —                    |

Two things this confirms: the apex really is claimed by two projects (A1 is
real, not theoretical), and the `warmside` project's most recent build still
ends in ERROR — nothing new can ship from it until A5.

# Cleanup checklist — Vercel + GitHub dashboards

Steps **Shawn has to click through** — none of these can be done by Claude's
tools (no API for Vercel project archival/domain removal or GitHub repo
archiving). Do them in order; each one says why it's safe.

Two rules baked into the ordering:

1. **Nothing touches the `underdog-city-v5` Vercel project before 08/01.**
   The album fires 07.31 and every CTA lands on that site.
2. **Archive, never delete.** Everything below is reversible.

---

## A. Safe now (before 07/31)

- [ ] **A1. Remove the stale apex claim.**
      Vercel → `underdogcity` (the OLD project, not v5) → Settings → Domains →
      remove `theunderdogcity.com`.
      _Why safe: `underdog-city-v5` is what actually serves the domain; this
      only deletes the old project's leftover claim, so launch night can't
      coin-flip to a dead project._

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

- [ ] **A4. Merge the consolidation PR** (the one that added `apps/` to
      `shawn9097/Claude`). Everything in section B depends on the apps living
      in `main`.

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

- [ ] **B2. Connect `underdog-city-v5` to git.**
      Settings → Git → connect `shawn9097/Claude`, Root Directory =
      `apps/underdog-city`, Production Branch = `main`.
      _After this, pushes deploy the site and CLI-deploy drift can't happen
      again._

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

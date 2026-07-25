# CLAUDE.md — lukemcbroom.com

Lead-gen site for Luke McBroom Personal Training (Cookeville, TN). One static
HTML file, no build step. **Lowest-maintenance thing in the workspace — keep it
that way on purpose.**

## Policy: leave it alone

Don't touch this unless Shawn (or a client request via Shawn) asks for a
specific change. It is intentionally not part of any daily workflow.

## Deployment — important

**Cloudflare Pages still deploys from the ORIGINAL repo**
(`shawn9097/luke-mcbroom-personal-training`, `main` branch) — **not** from this
monorepo copy. Editing here does nothing to the live site until either:

1. the change is also pushed to that original repo's `main` (needs Shawn's
   approval — that's a live publish), or
2. Cloudflare Pages is repointed at this monorepo (dashboard-only change).

Until repointing happens, treat this copy as the working mirror and the old
repo as the deploy target. **Do not archive the old repo** while Cloudflare
still deploys from it.

## Files

- `index.html` — the entire site (HTML, CSS, JS inline)
- Booking: Cal.com (`shawn-walker-i93wbl/15min`); email capture: Mailchimp
  (placeholder, not wired)

## Preview

Open `index.html` in a browser. That's it.

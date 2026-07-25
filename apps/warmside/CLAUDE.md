# CLAUDE.md — Warmside

## What Warmside is

An automated **estimate follow-up SaaS for contractors**. A contractor BCCs their
outgoing estimate to a per-account inbound address (Postmark); Warmside then runs
a **5-touch SMS + email follow-up sequence** to nudge the prospect, with **Stripe**
billing on a **Supabase** (Postgres) backend. Built with Next.js (App Router) +
TypeScript + Tailwind v4, targeting Vercel.

> **Status: live but frozen.** [warmside.app](https://warmside.app) serves a
> stale-but-working build. The Vercel project `warmside` is currently wired to
> the wrong repo (`shawn9097/SBB`), so its last ~20 builds all failed
> (`Cannot find module '@/components/Nav'` — it's typechecking SBB's embedded
> Underdog City subapp, not this code). **Nothing new can ship until the Vercel
> project is repointed at this repo with Root Directory `apps/warmside`** —
> that's a dashboard change, tracked in the cleanup checklist.
>
> This copy came from `shawn9097/Warmside` (the clean July 10 split out of the
> former SBB monorepo). Lowest priority of the three apps; not ready for market
> yet.

## Structure

- **`src/app/`** — pages + API routes:
  - `api/inbound-email` — Postmark inbound webhook (ingest a BCC'd estimate → job)
  - `api/inbound-sms` — Twilio inbound webhook (replies / STOP)
  - `api/cron` — daily tick that advances due follow-up steps (see `vercel.json`)
  - `api/stripe` — Stripe webhook (billing lifecycle)
  - `api/close-job` — mark a job closed / stop its sequence
- **`src/lib/`** — integrations: `supabase.ts`, `resend.ts` (email), `twilio.ts`
  (SMS), `stripe.ts` (billing), `claude.ts` (Anthropic — voice/niche detection),
  and `sequences.ts` (the 5-touch follow-up logic).
- **`src/types/`** — shared TypeScript types.
- **`supabase/migrations/`** — database schema (`001_initial_schema.sql`).
- **`vercel.json`** — one cron: `/api/cron` daily at 09:00.

## Setup

```sh
npm install
cp .env.example .env   # fill in the keys below, then:
npm run dev
```

> **Build gotcha:** `npm run build` fails without env vars set
> (`Error: supabaseUrl is required`) because `src/lib/supabase.ts` creates its
> client at module scope during page-data collection. Locally, export
> placeholder values (or fill `.env`) before building; on Vercel the project's
> env vars cover it.

Key env vars (see `.env.example`): Supabase URL + anon/service keys; Stripe
secret / webhook / price IDs; Twilio SID / token / number; Resend key; Postmark
tokens; `ANTHROPIC_API_KEY`; plus `NEXT_PUBLIC_APP_URL`, `INBOUND_EMAIL_DOMAIN`,
and `CRON_SECRET`.

## Rules

- **No secrets in the repo** — keys live only in environment variables. Never
  commit `.env`.
- Validate input at webhook boundaries (verify Postmark / Stripe / Twilio
  signatures before acting).
- Keep changes minimal and scoped; clear commit messages.
- Never use `--no-verify` or disable TLS / unset the proxy.

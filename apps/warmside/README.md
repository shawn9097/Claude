# Warmside

Automated **estimate follow-up SaaS for contractors** — a contractor BCCs a sent
estimate (Postmark inbound), and Warmside runs a 5-touch SMS + email sequence to
follow up automatically. Stripe billing, Supabase Postgres, Next.js (App Router)
+ TypeScript + Tailwind v4.

> **Dormant scaffold — not deployed.** Split out of the former `shawn9097/SBB`
> monorepo, where it lived at the repo root next to the (now separate) Underdog
> City project.

## Stack

- **Next.js 16** (App Router) · React 19 · TypeScript · Tailwind v4
- **Supabase** (Postgres) — schema in `supabase/migrations/`
- **Twilio** (SMS) · **Resend** (email) · **Postmark** (inbound BCC)
- **Stripe** (billing) · **Anthropic** (voice / niche detection)
- Deploy target: **Vercel** (daily cron in `vercel.json`)

## Getting started

```sh
npm install
cp .env.example .env   # fill in the keys (see below)
npm run dev
```

## Environment

See `.env.example`. Groups: Supabase, Stripe, Twilio, Resend, Postmark, Anthropic,
plus app config (`NEXT_PUBLIC_APP_URL`, `INBOUND_EMAIL_DOMAIN`, `CRON_SECRET`).

## How it works

1. A contractor BCCs their estimate to a per-account inbound address →
   `POST /api/inbound-email` (Postmark) creates a job.
2. `src/lib/sequences.ts` schedules a 5-touch SMS + email follow-up cadence.
3. `POST /api/cron` (daily at 09:00 via `vercel.json`) advances any due steps.
4. Prospect replies land at `POST /api/inbound-sms` (Twilio);
   `POST /api/close-job` stops a sequence when a job closes.
5. `POST /api/stripe` handles the billing lifecycle.

## Status

Never deployed — treat this as a starting point, not a running product.

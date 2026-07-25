# Luke McBroom Personal Training

Lead-generating website for [Luke McBroom Personal Training](https://lukemcbroompersonaltraining.com) — a personal training & nutrition coaching practice based in Cookeville, TN.

## Stack

- **Hosting:** Cloudflare Pages (deploys automatically from this repo's `main` branch)
- **DNS:** Cloudflare
- **Booking:** Cal.com (`shawn-walker-i93wbl/15min`)
- **Email capture:** Mailchimp (placeholder — to be wired)
- **Build:** None. Single-page static HTML.

## Files

- `index.html` — the entire site (HTML, CSS, JS in one file)
- `README.md` — this file

## Local preview

Just open `index.html` in any browser. There's no build step.

## Deployment

Pushes to `main` auto-deploy via Cloudflare Pages — no manual deploy needed.

## To do

- [ ] Wire real Mailchimp form action URL (currently a placeholder that fails gracefully)
- [ ] Add Luke's phone number to schema and contact section
- [ ] Add transformation photos to testimonials section
- [ ] Set up email automation: send "Fat Loss Blueprint" PDF to new subscribers automatically

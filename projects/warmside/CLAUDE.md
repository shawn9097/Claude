# Warmside

warmside.app — "Where good deals come home." **Shawn built this with Claude. It is not launched.**

The blocker is not the code and not the marketing. Shawn's words: _"I can't confidently push products/services that I don't understand."_ He doesn't feel he understands what he built well enough to sell it. Everything in this folder should serve that, not route around it.

## What it does

SaaS for residential service contractors (roofing, HVAC, and similar). It follows up automatically on estimates that went quiet.

- The contractor BCCs their estimate to `you@inbound.warmside.app` — works alongside Jobber, AccuLynx, JobNimbus, or plain Gmail. No migration, no new system to learn.
- Warmside then runs **5 touches over 21 days**: day 0 SMS, day 3 SMS, day 7 email, day 14 SMS, day 21 email.
- The sequence **stops the moment the customer replies.**

## The pitch as it stands on the site

- 48% of contractors never follow up on an estimate at all.
- The 8% who keep following up close roughly 2× more.
- A roofer doing 25 estimates a month is leaving about $8,400/month on the table.
- 30-day guarantee: recover at least one job or full refund.

**These numbers need sourcing before anyone says them out loud.** Not knowing where a stat came from is part of what makes a pitch feel unsafe to deliver.

## How to help here

The gap is understanding, so the job is explanation, not output. Concretely:

- **Explain it back to him at the level he asks for**, and check he can restate it. Don't produce polished marketing copy for something he can't yet defend in a conversation.
- **Walk the actual path of one estimate** through the system — what happens, in order, in plain words. Where does the SMS come from, what number does it show, what happens if the customer replies "stop", what does the contractor see.
- **Name the failure modes honestly.** Where does it break, what would a skeptical contractor poke at, what can't it do yet. Confidence comes from knowing the edges, not from believing it's perfect.
- **Don't let "learn more" become the permanent task.** The real fix is one real contractor using it. Steer toward that.

## Hard stop

Nothing here goes live, gets deployed, gets emailed, or gets posted without Shawn saying so explicitly. That applies double while he's still deciding whether he stands behind it.

## Open

- Where does the code live? It isn't in this repo yet.
- Is it actually deployable today, or is there work left?
- Where did the stats come from?
- Is there one contractor he could put on it free to see it work?

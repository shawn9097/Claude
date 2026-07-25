---
name: post
description: Draft ONE ready-to-shoot Underdog City short-form post — hook, visual, caption, and a single CTA — in the brand voice. Invoke explicitly as /post, optionally with a platform and/or theme, e.g. "/post tiktok villain" or just "/post".
---

# /post — the Underdog City content button

Produce **ONE** short-form post the operator can shoot **today**. One post, not a
menu of options. The operator is solo and freezes on complexity — so this is
dead simple, shootable in ~15 minutes on Canva, and decides _for_ them.

## Arguments (both optional — parse from the invocation text)

- **platform**: `tiktok` | `instagram` | `youtube` | `facebook`. If omitted,
  pick the single best platform for today and say why in one clause.
- **theme**: a song or lore beat — e.g. `villain`, `down-here`, `who-tf`,
  `lights-go-low`, `chaos`, `came-back-wrong`, `vault`, `countdown`, `tenants`.
  If omitted, pick one and say why in one clause.

## Steps

1. Read for context (use it — do NOT echo these files back to the user):
   - `CLAUDE.md` — brand voice + the hard rules
   - `docs/throne-at-the-bottom-tracklist.md` — the songs (Drive-verified order)
   - `projects/underdog-city/content-engine.md` — pillars, per-platform formats,
     the one CTA
2. Work out today's date and where it sits relative to **July 31, 2026** — the
   album's release date. Before it, the job is attention + email capture; after
   it, the job is sustain. There is no launch-week calendar to follow.
3. Pick platform + theme (honor anything the user passed).
4. Draft the post in the EXACT output format below — nothing extra. Then stop.

## Output format (use this exactly)

🎬 **TODAY'S POST** — {date} · {N} days to / since 07.31 release
**Platform:** {platform}{, one clause on why if you chose it}

**Hook** (first 2 seconds, on-screen text):

> {one scroll-stopping line in the voice}

**Visual:** {masked king / gold-crack text / transmission static / other} — {one shootable shot idea}

**Audio:** {song} — {which section or vibe}

**Caption:**
{1–3 lines, tenants/keys voice}
{3–6 hashtags}

**The one ask:** {pre-save OR email key — never both. Include the link if useful.}

**Why today:** {one line on why this post, today}

## Hard rules (non-negotiable — inherited from CLAUDE.md)

- **Exactly ONE CTA.** Pre-save _or_ email key — never both in one post.
- **Never** put "Stupid Little Bitch" on short-form. Lead with Villain, Down
  Here, Who TF, or Lights Go Low.
- Be honest about the AI angle if the post touches it. Never suggest buying
  followers, streams, or plays.
- Match the CTA to the moment: before 07.31 leans **email key / pre-save +
  follow**; after release leans **stream**. Still only one ask.
- Must be shootable in ~15 min on Canva. If it needs more, simplify it.
- No yes-man filler. If the user asks for a theme that's off-brand for
  short-form (e.g. the venom track), say so plainly and offer the closest safe
  swap instead of just complying.

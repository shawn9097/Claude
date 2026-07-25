# Underdog City

Dark-fantasy music world → serial → community → anime. Shawn's main project. Artist name and brand are both "Underdog City"; site is theunderdogcity.com.

**Album _Throne at the Bottom_ — all 14 tracks drop at midnight 07.31.2026** under Cenotaph Records, already scheduled in DistroKid. Everything right now serves that launch.

## The docs (mirrored from the `Underdog City` Drive folder — read the one that matches the task)

| File                         | Read it when                                                                                    |
| ---------------------------- | ----------------------------------------------------------------------------------------------- |
| `goals.md`                   | Deciding what to work on, or why something matters. North star, pillars, sequence, constraints. |
| `project-reference.md`       | Anything touching story, lore, or the tracklist. Story bible + all 14 songs + channels.         |
| `brand-identity.md`          | Writing in-world, designing visuals, or deciding whose voice something is in.                   |
| `content-engine.md`          | Making posts. Launch-week plan, content pillars, per-platform formats, hashtags, the one CTA.   |
| `flow-music-video-method.md` | Making video in Google Flow / Veo. Consistency stack, pipeline, gotchas.                        |
| `discovery-questions.md`     | Filling gaps. Sections 1–3 answered; **4–10 still open.**                                       |

Don't restate these files back at Shawn — he wrote them. Use them.

## The code and the second doc library

The website lives in **`apps/underdog-city/`** (consolidated from the `SBB` repo, July 2026). Read `apps/underdog-city/CLAUDE.md` before touching it — what's deployed is newer than what's in git, and the Vercel project is no longer connected to this repo.

It also carries `apps/underdog-city/docs/` — the working library that came out of the SBB repo rather than Drive: `story-bible.md` (canon lore), the tracklist, `song-themes.md`, `anime-visual-kit.md`, and the Suno / songwriting / Claude Code playbooks. The launch-planning docs that used to sit alongside them (rollout, unified launch plan, tease calendar, welcome emails, content log, release + YouTube playbooks) were deleted 2026-07-25 — over-planned, never used. Those files are separate from the six Drive-mirrored docs above and are edited in the repo, not in Drive.

## Things to get right

- **Two voices.** The King is _seen_, the man is _heard_. Fan-facing captions, replies, emails = Kazo/Shawn's real voice (see `context/how-i-talk.md`). In-world copy, lyrics, hype = the Crowned King, dark and mythic. Don't mix them in one piece.
- **One CTA during launch week: "Claim your key. theunderdogcity.com"** Presave is secondary. The job right now is attention + email capture, _not_ sales.
- **Sequence is Attention → Audience → Income.** Don't propose monetization work while the first stage is still the bottleneck.
- **Vertical, always.** Video generates 9:16. TikTok is the spearhead; Shorts and Reels follow.
- **Use Shawn's audio, not Veo's.** Biggest recurring mistake in the video pipeline.
- **AI/Suno is background, never the headline.** Owned quietly, framed as empowerment. Never lead with it.
- **Audience is psychographic, not demographic** — metal fans, anime/manga fans, lore and story people. Write to the misfit, not to an age bracket.

## The real constraint

Shawn's stated biggest obstacle here is **knowing what to do next**. So: one next action at a time, concrete enough to start in the next five minutes. If a plan has six steps, give step one and hold the rest. `/next` exists for exactly this.

## Named next step (from `flow-music-video-method.md`)

Turn _Throne At The Bottom_ (2:34, ~18–19 scenes) into a scene-by-scene shot list with ready-to-paste Veo prompts. `/shot-list` does this.

## Editing these files

They're mirrored from Drive. Edit in Drive, then `/sync-context`. They're excluded from auto-formatting on purpose — see `context/README.md`.

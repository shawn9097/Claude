---
name: shot-list
description: Turn a song, scene, or story beat into a scene-by-scene shot list with ready-to-paste Google Flow / Veo prompts. Use for music videos, animated sequences, or any AI video generation work.
---

# /shot-list — song in, Veo prompts out

Shawn generates video in **Google Flow (Veo 3.1)**. Clips run about 8 seconds, so a 2:34 song is roughly 18–19 scenes. The output of this skill is something he can paste straight into Flow, one scene at a time, without thinking.

## Read first

- `projects/underdog-city/flow-music-video-method.md` — the full pipeline and every gotcha. This is the authority; if it disagrees with anything below, it wins.
- `projects/underdog-city/project-reference.md` — lore and the song's actual meaning. Don't invent story.
- `projects/underdog-city/brand-identity.md` — how Kazo and the Crowned King each look. Getting these confused breaks the whole video.

Ask for the lyrics if they aren't in the repo yet. Don't guess at them.

## Non-negotiables

- **9:16 vertical.** Everything, always. TikTok is the spearhead.
- **Use Shawn's audio, not Veo's.** Generate silent or discard generated audio. This is the mistake that has cost the most time.
- **Consistency stack** — every prompt carries these:
  - Kazo locked as an **Ingredient / Character Lock**, referenced by name, never re-described from scratch
  - one style phrase, identical in every prompt: _"dark-fantasy anime, neon-and-gold palette, high contrast, volumetric light, cinematic"_
  - **last frame of scene N becomes the start frame of scene N+1** — say so explicitly in the handoff line
  - Scene Builder + "Jump To" for stitching

## Build the list

1. **Map lyrics to time.** Break the song into ~8s blocks. Note the timestamp range and the lyric or instrumental moment in each.
2. **Assign story beats.** The video should track the song's emotional arc, not illustrate lines literally. Mark where the King appears versus the man — that contrast usually _is_ the video.
3. **Write each scene** in this format:

```
### Scene 7 — 0:48–0:56
**Lyric/moment:** "..."
**Beat:** what changes here, one line
**Start frame:** last frame of Scene 6 (describe it in 5–10 words)
**Prompt:**
[Kazo ingredient] <subject and action>, <camera move>, <lighting>, dark-fantasy anime, neon-and-gold palette, high contrast, volumetric light, cinematic, 9:16 vertical
**Ends on:** what the final frame should hold, so Scene 8 can pick it up
```

4. **Flag anything needing a Nano Banana keyframe** — a specific pose or composition Veo won't reliably hit from text alone.
5. **Close with a shot count, an estimated generation pass count, and the single first action** (usually: lock the ingredients, then generate Scene 1).

## Keep it usable

Deliver it as a file in the project folder — `projects/<name>/shot-lists/<song>.md` — not as a wall of chat. He'll be working off it in another window with Flow open.

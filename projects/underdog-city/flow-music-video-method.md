# Underdog City — Music Video Production Method (Google Flow)

How to build a cohesive, character-consistent music video in Flow where **every ~8-second scene doubles as a standalone short.** Build once, harvest ~18 shorts + one full video.

## The core reality
Veo generates **short clips (~8s each)**. A music video is just many short clips that look like *one world*. The entire game is three things:
1. **Consistency** — same character, style, and world across every clip.
2. **Continuity** — clips flow into each other instead of jump-cutting.
3. **Your audio** — your actual song, not Veo's AI-generated sound.

Flow has a specific feature for each. This is the stack you were missing.

---

## The Consistency Stack (this is the part you've been stuck on)

**1. Lock the character as an Ingredient ("Character Lock").**
Upload your **Kazo reference images** (portrait + body — you already made these) and lock them as an *Ingredient*. Veo then carries his face and clothing across every shot. This is THE fix for "clip 7 looks like a different guy." Lock it once, reuse it in every scene.

**2. Lock the style + world.**
Build a small set of locked world references (the Halo, the neon undercity, the ruined cathedral throne room) and keep **one consistent style phrase in every prompt** — e.g., *"dark-fantasy anime, neon-and-gold palette, high contrast, volumetric light, cinematic."* Same phrase every time = same visual language.

**3. Continuity between clips — "Frames to Video."**
Feed the **last frame of clip N as the start frame of clip N+1.** The next clip literally begins where the last one ended → seamless flow instead of a hard cut.

**4. Assemble with Scene Builder + "Jump To."**
Move your good clips into **Scene Builder**; the **"Jump To"** feature uses Gemini to read the end of the previous clip and generate a seamless next one. This is how you chain 8-second pieces into a full-length video.

---

## Flow Tools — bake the brand into machinery (Ultra unlock)
Flow Tools (launched ~May 2026): Google presets + a community gallery + **create-your-own** by describing what you want in plain English (Flow's agents build it). Creating/remixing requires a Google AI subscription — covered by Ultra.

Why it matters here: consistency stops being a per-prompt fight and becomes a **reusable button**:
- **"Underdog City look" tool** — a style/post layer applying the visual signature (dark-fantasy anime, neon-gold palette, high contrast, volumetric light) to any clip. Kills style drift across scenes and songs.
- **"Gleam" tool** — the kintsugi gold-cracks-on-skin effect as a dedicated tool, so the magic system looks identical everywhere.
- **Remix community tools** (e.g., glitch/grade tools like pixelBento) instead of building from scratch.
- Later: publishing a UC tool publicly = discovery content in itself (others push their work through your world's look).

Pipeline note: build/lock the look tool early in the pilot, then reuse it for all 14 songs.

## The Pipeline (repeatable, every song)
1. **Lock ingredients** — character (Kazo) + style/world refs. Done once, reused all project.
2. **Storyboard from the lyrics** — break the song into sections, one visual beat per ~8s scene. *(I build this for you.)*
3. **Keyframes (optional)** — use Nano Banana to nail a strong start image for a scene before animating.
4. **Generate each scene** in Veo with the locked ingredients + your style phrase.
5. **Continuity** — last-frame → next start-frame between scenes.
6. **Assemble** in Scene Builder to full length.
7. **Export** the clips.

---

## The one big gotcha — YOUR audio, not Veo's
Veo 3.1 generates its own native audio. For a music video you **don't want that** — you want *Throne At The Bottom*. So:
- Generate the **visuals only**; ignore/mute Veo's audio.
- In a video editor, lay the finished visuals over the **real track** and cut scene changes **to the beat**.
- Flow is the visual factory. Final music-sync happens in the edit.

## Aspect ratio — recommend 9:16 vertical
Your discovery is short-form-first, and you want each scene to be a native short. So **generate everything vertical (9:16).** The "music video" becomes a vertical video (totally normal on YouTube/TikTok now), and every scene drops straight into TikTok/Reels/Shorts with no cropping. One format, both jobs. *(Optional later: a 16:9 cut for a traditional YouTube upload.)*

---

## Consistency Checklist / Troubleshooting
- Same **character Ingredient** locked in *every* generation.
- Same **style phrase** in *every* prompt.
- **Last-frame → first-frame** for continuity between scenes.
- Character drifting? Regenerate with the Ingredient re-emphasized, or swap in a cleaner reference image.
- Generate **2–3 takes per scene**, keep the best. Budget for throwaways — that's normal.

---

## Pilot: Throne At The Bottom (2:34 ≈ ~18–19 scenes)
Next step: turn the song into a **scene-by-scene shot list** — one ~8s visual beat per lyric section (Intro → Verse 1 → Chorus → Verse 2 → Chorus → Bridge), each with a ready-to-paste Veo prompt anchored on Kazo, the Crowned King myth, and the world. Generate them one at a time, in order, using this method. Result: the first full music video **and** ~18 shorts from a single build.

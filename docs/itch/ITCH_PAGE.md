# itch.io page kit: The Weight of the Crown

Live page: https://marysue.itch.io/the-weight-of-the-crown

Everything below is ready to paste into the itch.io **Edit game** form, top to bottom.
All art is in this folder. Rebuild it with `python docs/itch/make_itch_art.py` from the project root.

---

## Basics

| Field | Value |
|---|---|
| **Title** | The Weight of the Crown |
| **Project URL** | `the-weight-of-the-crown` (already set) |
| **Short description / tagline** | You took the throne. Now hold it for 365 days. |
| **Classification** | Games |
| **Kind of project** | Downloadable |
| **Release status** | Released |
| **Pricing** | No payments (or "$0 or donate") |

## Uploads

- `TheWeightOfTheCrown-windows.zip`, platform **Windows**. It's the launcher's **Export** build, zipped (see the README). Upload it, then delete the old build from the uploads list (or tick **Hide this file**), so nobody downloads the jam version by mistake.

## Trailer

Paste `https://www.youtube.com/watch?v=_gAcZbwmUVY` into **Gameplay video or trailer** on the Edit game page. itch then shows the video at the top of the page.

The trailer's end card says "Play in your browser", but this page is a Windows download. If that matters to you, say "Download for Windows" in the YouTube description.

---

## Description (paste into the description editor)

> **King Edwin is dead. You killed him.**
>
> You are Gregor, the usurper, and Loria is yours for as long as you can hold it. The realm is still bleeding: plague in the streets, empty granaries, soldiers waiting on pay, and a church that hasn't decided whether your crown is holy or cursed. Every morning brings another petitioner and another crisis.
>
> ### How it plays
> Courtiers and commoners come before the throne, one a day, with problems only a monarch can answer. Every answer moves nine pillars of power:
>
> - **People**: will the commons riot or kneel?
> - **Church**: does heaven bless your reign?
> - **Army**: who guards the throne when pay runs out?
> - **Treasury**: gold buys time, and debt buys graves.
> - **Health**: plague does not respect usurpers.
> - **Loyalty**: your court smiles until it doesn't.
> - **Nobility**: the great houses decide whether your bloodline counts.
> - **Food**: hungry subjects do not want speeches.
> - **Succession**: without an heir, every lord plans your funeral.
>
> Let any pillar fall and your reign ends, each with its own grim reckoning.
>
> ### A year of intertwined stories
> Survive 365 days while story arcs run alongside each other: the old king's household, intrigue behind the tapestries, merchant guilds and northern envoys, church tax wars, plague cures, great-house feuds, secret chambers, and the ghost of a royal nephew in the fog. Mid-arc choices shape outcomes you don't see until the finale tells you what the realm believes about you.
>
> New pillars unlock as the year goes on. Spend scarce advisor actions when you can afford them, and watch coherent rule pay off, or a crown pulled in every direction come apart.
>
> ### Features
> - Branching narrative with persistent story arcs and reactive dialogue
> - Illustrated characters, cutscenes with slow camera push-ins, and a unique death screen for every fallen pillar
> - Hover an answer to see which pillars it will move
> - A torchlit hall that fills with embers and smoke as the realm nears ruin
> - English and Russian
> - Save and continue, and chase your longest reign
> - A Reduce effects option for fewer particles and gentler shake and flashes
>
> ### How to play
> Click to answer. Hold the right mouse button to skip a cutscene. Esc pauses.
>
> ### Install
> Unzip the download and run `run.bat`. Needs 64-bit Windows 10 or 11. If SmartScreen warns about an unknown publisher, choose **More info → Run anyway**.
>
> Made for **[EdenSpark Game Jam #2](https://itch.io/jam/edenspark-game-jam-2)**. Theme: **Mass Control**.
>
> *You did not inherit this kingdom. You took it. Now prove you can hold it.*

---

## Images

| Slot | File | Notes |
|---|---|---|
| **Cover image** | `cover.png` (630 × 500) | Animated: `cover.gif`. Torchlight, dust in the window light, and a glint on the crown. |
| **Screenshots** | `screenshots/01_main_menu.jpg` … `05_reign_ends.jpg` | Upload in number order. Fresh captures of the current build (see below). Replace the jam-build screenshots on the page with these. |
| **Gameplay GIF** (optional) | `gameplay.gif` (560 px, 37 s, 6.3 MB) | Add it as a screenshot, or put it at the top of the description. |
| **Trailer** | On YouTube: https://youtu.be/_gAcZbwmUVY (source file: `../trailer/the_weight_of_the_crown_trailer.mp4`, 1080p, 40 s) | See **Trailer** above. Music: "Kingdom of Shadows" by AlkaKrab (credit appreciated, so keep it in the video description). |

The GIFs start on a finished frame, so if itch ever flattens one to a still it still looks right.

### Screenshots

| File | What it shows |
|---|---|
| `01_main_menu.jpg` | The main menu: the usurper on his throne |
| `02_intro_cutscene.jpg` | The intro: Estedor burning, with the narrator |
| `03_court_dialogue.jpg` | Day 1: Old Advisor Edric asks how the court should read you, with four answers |
| `04_petitioner.jpg` | Day 2: General Rudolf wants the army paid, with a choice highlighted |
| `05_reign_ends.jpg` | A death screen: the coffers ran dry and your creditors called their due |

These were captured in the editor at 2560 × 1365, from the current build. The menu and death screen show a "Longest reign" of 12 days from the capture run.

---

## Metadata

| Field | Value |
|---|---|
| **Genre** | Strategy (the page currently says Puzzle) |
| **Tags** (up to 10) | `kingdom-management`, `medieval`, `narrative`, `choices-matter`, `story-rich`, `strategy`, `singleplayer`, `2d`, `dark`, `jam` |
| **Made with** | EdenSpark |
| **Average session** | About a half-hour |
| **Languages** | English, Russian |
| **Inputs** | Mouse |
| **Multiplayer** | None |
| **Player count** | Singleplayer |

---

## Theme (open the game page and click **Edit theme**)

The idea: a dark stone hall lit by torches, with the game's gold and parchment on top.

### COLOR
| Field | Value | Why |
|---|---|---|
| **BG** | `#1A120C` | The dark of the page tile. |
| **BG 2** | `#2A1E15` | Slightly lighter brown, so the content column reads as a panel. |
| **Text** | `#F2E3C2` | The game's parchment. |
| **Link** | `#FFD175` | The game's gold. |

**More options…** under COLOR, where shown:
| Field | Value |
|---|---|
| Button color | `#FFD175` |
| Button text | `#1A120C` |
| Border color | `#4A3524` |

### TEXT
| Field | Value |
|---|---|
| **Font** | **Merriweather** (the game's dialogue font) if it's in the list, otherwise **Lora**. |
| **Header font** (More options) | **UnifrakturMaguntia** or **Pirata One** if listed, to echo the game's blackletter. Otherwise **Cinzel**. |
| **Header color** | `#FFD175` |
| **Size** | Large |

### LAYOUT
| Field | Value |
|---|---|
| **Screenshots** | Auto. The screenshots are wide, so the default row works. |

### IMAGES
| Slot | File | Settings |
|---|---|---|
| **Banner** | `banner.gif` (still: `banner.png`), 960 × 300 | Align: center. It replaces the plain title text at the top of the page. |
| **Background** | `page_bg.gif` (still: `page_bg.png`), 512 × 512 | Repeat: **tile** (both ways), position top-left. It tiles seamlessly, with slow rising embers. |

There is no embed background: the game is a download, not a browser game.

itch has been known to flatten some animated GIF banners to one frame, so check the live page after uploading.

---

## Before you publish

1. **AI disclosure: your call.** itch asks whether a project uses generative AI. The game's code was written with an AI assistant, and this page's art was assembled by script from the game's own artwork. Answer to fit the jam's rules and what you know about how the game's illustrations were made.
2. **Credits.** The README now credits the asset packs (UI frames, stat icons, ember and smoke sprites) and the trailer music. Add anyone else (voice, music, art) here and in the description before publishing.

# The Weight of the Crown

<p align="center">
  <img src="docs/itch/banner.gif" width="960" alt="The usurper on the throne of Loria, lit by torches, beside the title The Weight of the Crown">
</p>

You usurped Estedor's throne. Now balance factions, control the masses, and survive the crown's weight through 365 days of rule.

**[Download for Windows on itch.io →](https://marysue.itch.io/the-weight-of-the-crown)** · **[Watch the trailer on YouTube →](https://youtu.be/_gAcZbwmUVY)**

<p align="center">
  <a href="https://youtu.be/_gAcZbwmUVY"><img src="docs/trailer/thumbnail.jpg" width="720" alt="Watch the 40-second trailer of The Weight of the Crown on YouTube"></a>
</p>

## About

King Edwin is dead. You — Gregor, the usurper — sit on the throne of Loria while the realm still bleeds from plague, empty granaries, unpaid soldiers, and a church that cannot decide whether your crown is holy or cursed. Every morning brings another petitioner, another crisis, another chance to buy peace at a price you cannot afford twice.

<p align="center">
  <img src="docs/itch/gameplay.gif" width="560" alt="Gameplay: the main menu, the intro, the old advisor's first question, petitioners pleading at court, and the reign ending when the treasury runs dry">
</p>

**What you'll do**

- **Rule day by day** — courtiers and commoners bring dilemmas only a monarch can answer
- **Balance nine pillars of power** — People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, and Succession. New pillars join the burden as the year goes on.
- **Survive intertwined story arcs** — the old king's household, church tax wars, merchant guilds, plague cures, great-house feuds, and more
- **Use advisor actions** — spend scarce resources when you can afford them, and watch synergies reward coherent rule — or punish a crown pulled in every direction at once

**Features**

- Branching narrative with persistent story arcs and reactive dialogue
- Illustrated characters and cutscenes with slow camera push-ins, gilded frames, and drifting embers
- A torchlit hall that fills with embers and smoke as the realm nears ruin
- Hover an answer to see which pillars it will move before you commit
- A unique death screen for every pillar that falls
- Reign milestones every 30 days, and a short introduction each time a new pillar unlocks
- English and Russian
- Save and continue — chase your longest reign
- A **Reduce effects** option for fewer particles and gentler shake and flashes

## Screenshots

<table>
<tr>
<td width="50%">
<img src="docs/itch/screenshots/01_main_menu.jpg" alt="Main menu" />
<p align="center"><b>Main menu</b> — The throne awaits. Your reign begins with a coup already behind you and a kingdom already against you.</p>
</td>
<td width="50%">
<img src="docs/itch/screenshots/03_court_dialogue.jpg" alt="Court dialogue" />
<p align="center"><b>Court dialogue</b> — Petitioners arrive with problems, flattery, and threats. Every answer shifts the realm.</p>
</td>
</tr>
<tr>
<td width="50%">
<img src="docs/itch/screenshots/02_intro_cutscene.jpg" alt="Cutscene" />
<p align="center"><b>Cutscenes</b> — Illustrated story beats mark the turning points of your rule.</p>
</td>
<td width="50%">
<img src="docs/itch/screenshots/05_reign_ends.jpg" alt="A death screen: the treasury ran dry" />
<p align="center"><b>The reign ends</b> — Let one pillar fall and the crown ends up in the gutter. Every pillar has its own grim reckoning.</p>
</td>
</tr>
</table>

## How to play

| Input | Action |
| --- | --- |
| Left click | Answer petitioners, use the menus and advisor actions |
| Hover an answer | Highlight the pillars it affects |
| Hold right mouse button | Skip a cutscene |
| Space / Enter | Advance a cutscene, close pop-ups |
| Esc | Pause, close the Advisor and About panels |

## Download

Get the Windows build from **[itch.io](https://marysue.itch.io/the-weight-of-the-crown)**:

1. Download `TheWeightOfTheCrown-windows.zip` and unzip it anywhere.
2. Open the folder and run `run.bat`.
3. If Windows SmartScreen warns about an unknown publisher, choose **More info → Run anyway**.

You need a 64-bit Windows 10 or 11 PC. Your progress and settings are saved between sessions.

## EdenSpark Game Jam #2

This game was created for **[EdenSpark Game Jam #2](https://itch.io/jam/edenspark-game-jam-2)**, hosted by EdenSpark. The jam ran from June 1 to June 15, 2026. The theme was **Mass Control** — controlling crowds, balancing weight and pressure, or any metaphor your design could reach.

*The Weight of the Crown* takes that theme literally and politically: you seized a kingdom by force, and now you must control the masses, the factions, and the crushing weight of every choice that keeps you on the throne.

## Credits

| Role | Name |
| --- | --- |
| Game designer / programmer | Viktar Syanau (MarySue) |

- Trailer music: "Kingdom of Shadows" by AlkaKrab, from the Flameheart Dark Fantasy Music Pack
- UI frames and buttons: Pixel RPG Dialogue UI Resource Pack
- Stat icons: Fantasy Grimoire UI (Pixel Magic Book UI)
- Ember and smoke sprites: VFX Collector Pack by Fellor / BitBlast Studio
- Character voices: reused from the author's game [Am I Approved?](https://github.com/MarySueXLsD/Am-I-Approved-web-game)

## Development

Built with **[EdenSpark](https://edenspark.io)** using **Gen2 daScript** (Daslang).

**Requirements:** [EdenSpark Launcher](https://edenspark.io) with this project opened from the Eden projects folder.

**Open the project**

1. Install EdenSpark Launcher
2. Clone this repository into your Eden projects directory
3. Open the project from the launcher and press Play

Game logic lives in `main.das` (engine entry) and `scripts/das/` modules organized by domain (`core/`, `data/`, `arcs/`, `gameplay/`, `localization/`, `ui/`). See `docs/MODULES.md` for the full layout and where every added asset came from. Python scripts under `tools/` and `scripts/` support dialogue generation and content pipelines.

**Paid asset packs:** the UI frames, stat icons, and particle sprites listed in Credits come from paid packs whose licences don't allow sharing the raw files, so this repository doesn't include them (the stat icons in `static/Top_Bar` are the older originals). Copy them from your own copies of the packs to the paths in `docs/MODULES.md`.

**Release build:** on the game's page in EdenSpark Launcher, click **Export** (the archive icon). The launcher writes a standalone build to `.project/standalone_<engine version>`. Zip the contents of that folder for itch.io. Both are ignored by git.

**itch.io page:** the page texts, theme colours and upload settings are in `docs/itch/ITCH_PAGE.md`. The cover, banner and page background (PNG and animated GIF) are rebuilt from the game's own art with `python docs/itch/make_itch_art.py`.

**Project ID:** `019eab54-61cf-7c88-a293-0fa895edb23b`

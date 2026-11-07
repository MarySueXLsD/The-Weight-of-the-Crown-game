# Module reference

All game modules live under `scripts/das/`. `require scripts/das/...` paths resolve via `plugin.das_project` (`DAS_PAK_ROOT = "./"`).

## Entry

| File | Responsibility |
|------|----------------|
| `main.das` | `on_initialize` / `on_update` / `on_resolution_changed` / `on_exit`, cheat commands, thin orchestration |

## scripts/das/core/

| File | Responsibility |
|------|----------------|
| `constants.das` | Layout, stat, screen-phase, and UI tuning constants |
| `game_state.das` | Shared mutable runtime state (screen phase, dialogue phase, NodeIds, kingdom stats) |
| `layout.das` | Resolution helpers (`ui_w`, `ui_h`, `screen_w`, anchor helpers) |
| `dialogue_types.das` | Dialogue node / choice struct types |
| `text_utils.das` | Text measurement and wrapping helpers |
| `dialogue_ids.das` | Dialogue string id constants |

## scripts/das/data/

| File | Responsibility |
|------|----------------|
| `encounters_en.das` / `encounters_ru.das` | Core encounter dialogue pools (bilingual) |
| `encounters_nobility_*.das` | Nobility-stat encounter pools |
| `encounters_loyalty_*.das` | Loyalty-stat encounter pools |
| `encounters_succession_*.das` | Succession-stat encounter pools |
| `opening_week_encounters_*.das` | First-week scripted encounters |

## scripts/das/arcs/

| File | Responsibility |
|------|----------------|
| `arc_engine.das` | Arc encounter dispatch and beat progression |
| `arc_state.das` | Per-arc runtime flags and counters |
| `arc_schedule.das` | Day windows and arc availability |
| `arc_effects.das` | Stat / flag side effects from arc beats |
| `arc_prompts.das` | Generated arc prompt metadata |
| `arc_encounters_en.das` / `arc_encounters_ru.das` | Arc encounter dialogue content |
| `arc_routing.das` | Arc selection and cross-arc routing |
| `arc_characters.das` | Arc-specific character bindings |
| `*_arc.das` | Individual story arc registration stubs (14 arcs) |

## scripts/das/gameplay/

| File | Responsibility |
|------|----------------|
| `question_pools.das` | Daily encounter selection and pool routing |
| `pool_prompts.das` | Pool prompt helpers |
| `questions.das` | Question / encounter metadata |
| `opening_week.das` | First-week scripted flow |
| `defeat.das` | Defeat conditions and peasant dialogue data |
| `ashford.das` | Ashford intro encounter |
| `edric_opener.das` | Edric opening encounter |
| `advisor_actions.das` | Advisor action definitions and availability |
| `stat_synergies.das` | Cross-stat synergy bonuses |
| `stat_unlocks.das` / `stat_unlock_intro.das` | Stat unlock thresholds and intro beats |
| `court_characters.das` / `characters.das` | Court character data |
| `game_save.das` | Save / load and options persistence |

## scripts/das/localization/

| File | Responsibility |
|------|----------------|
| `localization.das` | UI string lookup |
| `localization_dialogue.das` | Dialogue string lookup |
| `tooltips.das` | Stat and UI tooltip text |

## scripts/das/ui/

| File | Responsibility |
|------|----------------|
| `ui_state.das` | UI-only NodeIds, textures, and handles (cutscene nodes, advisor popup, audio handles) |
| `ui_flow.das` | Screen and pause-state queries (`is_game_paused`, `is_dialogue_input_blocked`, ...) |
| `ui_theme.das` | Look of the UI: Pixel RPG Dialogue UI kit sprites (panels, buttons, laurel choices, corners, ribbons) plus generated bars, gradients and pills |
| `juice.das` | Presentation only: UI particles, screen shake, flashes, floating numbers, banner, synthesized SFX, gibberish dialogue voices. Requires nothing from the other UI code |
| `game_ui.das` | All screens, flow, and components: menus, HUD, dialogue, cutscenes, advisor shop, defeat, bootstrap |

`game_ui.das` is one module on purpose. These screens call each other in a cycle, and Daslang modules cannot require each other cyclically, so splitting them needs the cycle broken first. Sections are marked with `// ----- name -----` comments.

## Assets added after the jam

| Path | Source |
|------|--------|
| `static/Voice/blah_*.wav` | Gibberish voice clips from the author's own project, Am_I_Approved (`static/Audio/Ambient`) |
| `static/UI/Kit/*.png` | Pixel RPG Dialogue UI Resource Pack v1.2, from the author's asset library. The three `choice*.png` are scaled to half size |
| `static/FX/fire_*.png`, `smoke_*.png` | Fire_v1 and Smoke_v1 sequences from VFX Collector Pack by Fellor / BitBlast Studio. Commercial use allowed; no standalone redistribution |
| `static/SFX/ui_click.wav`, `ui_hover.wav` | `Button Click` and `Button Navigating Sound` from the author's Environment SFX pack. Not played at the moment, since clicks and hovers are silent |
| `static/Top_Bar/stat_*.png` | Stat icons from the Pixel Magic Book UI pack (`Icons/128`): shirt, chalice, sword, chest, potion, shield, necklace, bread, crown |
| `static/Main Menu/logo_splash.png` | The studio logo with its black background turned into transparency, so embers can drift behind it |
| `static/Advisor_actions/*.png` | Original advisor art rebuilt by `tools/stylize_advisor_art.py` so the set shares one faceted look |
| `static/Top_Bar/stat_*_outline.png` | Each stat icon's silhouette grown by 5 px, drawn behind the icon as its outline (dark at rest, pulsing gold when a hovered choice affects that stat) |
| `static/Death_Screens/death_*.png` | Built by `tools/compose_death_screens.py` from the game's own cutscene backgrounds and character art, one per cause of defeat |

## Development notes

- The editor does not watch files it did not see at startup. After adding a new `.das` file, change `main.das` as well to trigger a reload.
- Stat introductions (Church day 30, Peasantry 89, Great Houses 175, Court Loyalty 260, Succession 320) use a pop-up, not a cutscene: `begin_stat_unlock_popup` in `game_ui.das`. The old cutscene code is still there but nothing calls it for stats.
- `Reign milestones`: every 30 days, and on day 365, advisor cooldowns reset. The banner plays when the next visitor arrives, since these days can open a cutscene.
- Test with `DEBUG_MUTE_ALL_AUDIO = true` in `constants.das`; it silences all game audio without touching saved volumes.
- Clicking or hovering UI elements, decision sounds and the arrival bell are silent by design: `juice_play_sfx` ignores `JUICE_SFX_CLICK` and `JUICE_SFX_HOVER`, and the choice, stat and fatal-choice hooks no longer play anything. Dialogue voices play at `JUICE_VOICE_VOLUME` (0.5).
- Cutscene pictures push in slowly (`CUTSCENE_KEN_BURNS_*`). The push restarts whenever an image node's texture changes. The death art is cover-fitted to the screen and pushes in too (`DEATH_SCREEN_*`).
- `CharacterHover` re-applies the visitor's tint every frame from `characterRevealT`. Anything that lightens or darkens the visitor must set `characterRevealT`, not only call `apply_character_image_color`.
- Keys in the MCP `input_sequence` tool are numeric `KeyCode` values: Escape is 1, Return 28, Space 57. Key names are ignored.
- `tools/split_main_das.py` produced the module split that could not compile. It is kept for history; do not re-run it.

## Tooling

Python generators and audit scripts write to paths under `scripts/das/` via `scripts/python/lib/project_paths.py`.

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
| `ui_flow.das` | Screen-phase query helpers (`is_game_paused`, `is_on_main_menu`, cutscene-active checks) |
| `ui_common.das` | Fonts, button factories, shared visual helpers |
| `audio.das` | Background music, intro cutscene SFX, volume sync |
| `menus.das` | Pause menu, main-menu options panel, settings save/load |
| `character_profile.das` | Character profile panel layout and content |
| `cutscenes.das` | Startup splash, intro cutscene, Ashford and stat-unlock cutscenes |
| `dialogue.das` | Dialogue UI, choices, typewriter, character enter/exit, camera zoom |
| `hud.das` | Stat bars, advisor popup, info tooltips, day/nickname display |
| `death.das` | Defeat flow and death screen |
| `bootstrap.das` | `load_resources`, `build_ui`, staged bootstrap loading |
| `hover_components.das` | Component classes for hover, input, and per-frame UI flows |

## Tooling

Python generators and audit scripts write to paths under `scripts/das/` via `scripts/python/lib/project_paths.py`.

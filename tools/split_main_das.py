#!/usr/bin/env python3
"""Split main.das into scripts/das/ui/ modules (one-time refactor helper)."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MAIN = ROOT / "main.das"
UI_DIR = ROOT / "scripts" / "das" / "ui"

BASE_REQUIRES = [
    "require engine.core",
    "require strings",
    "require scripts/das/core/constants",
    "require scripts/das/core/game_state",
    "require scripts/das/core/layout",
    "require scripts/das/core/dialogue_types",
    "require scripts/das/core/text_utils",
    "require scripts/das/gameplay/questions",
    "require scripts/das/gameplay/court_characters",
    "require scripts/das/gameplay/question_pools",
    "require scripts/das/gameplay/characters",
    "require scripts/das/gameplay/defeat",
    "require scripts/das/gameplay/ashford",
    "require scripts/das/gameplay/edric_opener",
    "require scripts/das/gameplay/stat_synergies",
    "require scripts/das/gameplay/stat_unlocks",
    "require scripts/das/gameplay/stat_unlock_intro",
    "require scripts/das/arcs/arc_engine",
    "require scripts/das/arcs/arc_state",
    "require scripts/das/gameplay/advisor_actions",
    "require scripts/das/localization/localization public",
    "require scripts/das/localization/localization_dialogue public",
    "require scripts/das/core/dialogue_ids",
    "require scripts/das/gameplay/game_save",
]

MODULE_EXTRA_REQUIRES: dict[str, list[str]] = {
    "ui_state": [],
    "ui_common": ["require scripts/das/ui/ui_state"],
    "audio": ["require scripts/das/ui/ui_state", "require scripts/das/ui/ui_flow"],
    "menus": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/audio",
    ],
    "character_profile": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
    ],
    "cutscenes": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/audio",
    ],
    "dialogue": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/cutscenes",
    ],
    "hud": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/menus",
        "require scripts/das/gameplay/advisor_actions",
    ],
    "death": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/dialogue",
    ],
    "bootstrap": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/audio",
        "require scripts/das/ui/menus",
        "require scripts/das/ui/character_profile",
        "require scripts/das/ui/cutscenes",
        "require scripts/das/ui/dialogue",
        "require scripts/das/ui/hud",
        "require scripts/das/ui/death",
        "require scripts/das/ui/hover_components",
    ],
    "hover_components": [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/menus",
        "require scripts/das/ui/character_profile",
        "require scripts/das/ui/hud",
        "require scripts/das/ui/dialogue",
        "require scripts/das/ui/cutscenes",
    ],
    "ui_flow": ["require scripts/das/ui/ui_state"],
}

PREFIX_TO_MODULE = [
    ("intro_", "cutscenes"),
    ("startup", "cutscenes"),
    ("splash_", "cutscenes"),
    ("ashford_", "cutscenes"),
    ("church_cutscene", "cutscenes"),
    ("stat_unlock_cutscene", "cutscenes"),
    ("ensure_intro", "cutscenes"),
    ("apply_loaded_intro", "cutscenes"),
    ("build_startup", "cutscenes"),
    ("build_intro", "cutscenes"),
    ("start_startup", "cutscenes"),
    ("start_intro", "cutscenes"),
    ("finish_startup", "cutscenes"),
    ("debug_start_in_game", "cutscenes"),
    ("skip_entire_cutscene", "cutscenes"),
    ("tick_intro", "cutscenes"),
    ("refresh_intro", "cutscenes"),
    ("set_intro", "cutscenes"),
    ("apply_intro", "cutscenes"),
    ("update_intro", "cutscenes"),
    ("update_ashford", "cutscenes"),
    ("background_music", "audio"),
    ("intro_cutscene_music", "audio"),
    ("intro_battle_sfx", "audio"),
    ("intro_war", "audio"),
    ("intro_sword", "audio"),
    ("intro_start_seq10", "audio"),
    ("intro_stop_", "audio"),
    ("should_play_", "audio"),
    ("fade_in_background", "audio"),
    ("fade_out_background", "audio"),
    ("sync_background", "audio"),
    ("sync_intro_cutscene", "audio"),
    ("load_background_music", "audio"),
    ("load_intro_cutscene_music", "audio"),
    ("load_intro_battle", "audio"),
    ("splash_seconds", "audio"),
    ("apply_settings_", "menus"),
    ("options_", "menus"),
    ("main_menu_options", "menus"),
    ("on_options_", "menus"),
    ("save_game_options", "menus"),
    ("load_game_options", "menus"),
    ("quit_application", "menus"),
    ("menu_panel", "menus"),
    ("menu_open", "menus"),
    ("open_pause", "menus"),
    ("close_pause", "menus"),
    ("reset_pause", "menus"),
    ("toggle_menu", "menus"),
    ("update_menu_slide", "menus"),
    ("apply_menu_", "menus"),
    ("refresh_main_menu", "menus"),
    ("refresh_pause_menu", "menus"),
    ("refresh_options", "menus"),
    ("refresh_advisor_button", "menus"),
    ("on_menu_", "menus"),
    ("on_main_menu_", "menus"),
    ("main_menu_button", "menus"),
    ("apply_main_menu_layout", "menus"),
    ("build_main_menu_options", "menus"),
    ("character_profile", "character_profile"),
    ("profile_", "character_profile"),
    ("open_character_profile", "character_profile"),
    ("close_character_profile", "character_profile"),
    ("reset_character_profile", "character_profile"),
    ("strip_leading_spaces", "character_profile"),
    ("split_profile_description", "character_profile"),
    ("on_character_profile", "character_profile"),
    ("advisor_", "hud"),
    ("build_advisor", "hud"),
    ("apply_advisor", "hud"),
    ("open_advisor", "hud"),
    ("close_advisor", "hud"),
    ("reset_advisor", "hud"),
    ("process_advisor", "hud"),
    ("execute_advisor", "hud"),
    ("show_advisor", "hud"),
    ("hide_advisor", "hud"),
    ("try_begin_advisor", "hud"),
    ("is_mouse_over_advisor", "hud"),
    ("can_open_advisor", "hud"),
    ("can_execute_advisor", "hud"),
    ("can_hover_advisor", "hud"),
    ("bind_advisor", "hud"),
    ("wire_advisor", "hud"),
    ("update_advisor", "hud"),
    ("load_advisor", "hud"),
    ("info_tooltip", "hud"),
    ("stat_bar", "hud"),
    ("top_bar", "hud"),
    ("bottom_bar", "hud"),
    ("apply_top_bar", "hud"),
    ("apply_bottom_bar", "hud"),
    ("update_day_text", "hud"),
    ("update_nickname", "hud"),
    ("sync_stat", "hud"),
    ("update_stat", "hud"),
    ("create_solid_stat", "hud"),
    ("on_info_", "hud"),
    ("on_stat_", "hud"),
    ("on_advisor_", "hud"),
    ("on_advisor_popup_global", "hud"),
    ("resize_info_tooltip", "hud"),
    ("position_info_tooltip", "hud"),
    ("show_info_tooltip", "hud"),
    ("hide_info_tooltip", "hud"),
    ("clear_info_hover", "hud"),
    ("set_info_hover", "hud"),
    ("defeat_", "death"),
    ("death_", "death"),
    ("begin_defeat", "death"),
    ("start_defeat", "death"),
    ("hide_death", "death"),
    ("set_death", "death"),
    ("update_death", "death"),
    ("ensure_death", "death"),
    ("on_try_again", "death"),
    ("reset_game", "death"),
    ("dialogue_", "dialogue"),
    ("select_choice", "dialogue"),
    ("typewriter", "dialogue"),
    ("prompt_", "dialogue"),
    ("build_dialogue", "dialogue"),
    ("build_encounter_prompt", "dialogue"),
    ("clear_dialogue", "dialogue"),
    ("set_dialogue", "dialogue"),
    ("refresh_active_dialogue", "dialogue"),
    ("character_", "dialogue"),
    ("incoming_", "dialogue"),
    ("parallel_", "dialogue"),
    ("cancel_parallel", "dialogue"),
    ("complete_parallel", "dialogue"),
    ("begin_parallel", "dialogue"),
    ("zoom_ui", "dialogue"),
    ("camera_zoom", "dialogue"),
    ("apply_camera", "dialogue"),
    ("start_camera", "dialogue"),
    ("compute_dialogue", "dialogue"),
    ("set_character_offset", "dialogue"),
    ("apply_character", "dialogue"),
    ("refresh_character", "dialogue"),
    ("roll_next", "dialogue"),
    ("prepare_character", "dialogue"),
    ("reset_character_transform", "dialogue"),
    ("reset_character_visual", "dialogue"),
    ("start_character", "dialogue"),
    ("update_parallel", "dialogue"),
    ("can_click_character", "dialogue"),
    ("choice_has", "dialogue"),
    ("deltas_have", "dialogue"),
    ("compute_synergy", "dialogue"),
    ("get_hovered_choice", "dialogue"),
    ("apply_choice", "dialogue"),
    ("advance_day", "dialogue"),
    ("start_same_visitor", "dialogue"),
    ("start_ashford", "dialogue"),
    ("start_stat_intro", "dialogue"),
    ("apply_current_encounter", "dialogue"),
    ("hide_dialogue_ui", "dialogue"),
    ("show_dialogue", "dialogue"),
    ("mark_dialogue", "dialogue"),
    ("apply_dialogue", "dialogue"),
    ("layout_dialogue", "dialogue"),
    ("try_advance", "dialogue"),
    ("on_choice_", "dialogue"),
    ("is_in_defeat_flow", "ui_flow"),
    ("is_dialogue_input_blocked", "ui_flow"),
    ("is_pause_menu_open", "ui_flow"),
    ("is_character_profile_open", "ui_flow"),
    ("is_advisor_popup_open", "ui_flow"),
    ("is_on_main_menu", "ui_flow"),
    ("is_startup_splash_active", "ui_flow"),
    ("is_intro_cutscene_active", "ui_flow"),
    ("is_ashford_cutscene_active", "ui_flow"),
    ("is_stat_unlock_cutscene_active", "ui_flow"),
    ("is_story_cutscene_active", "ui_flow"),
    ("is_continue_fade_active", "ui_flow"),
    ("is_game_paused", "ui_flow"),
    ("can_skip_game_animations", "ui_flow"),
    ("is_main_menu_options_open", "ui_flow"),
    ("is_new_game_intro_cutscene_active", "ui_flow"),
    ("ui_box_border", "ui_common"),
    ("answer_button", "ui_common"),
    ("choice_menu_button", "ui_common"),
    ("measure_choice_menu", "ui_common"),
    ("compute_character_rest_offset", "ui_common"),
    ("apply_default_font", "ui_common"),
    ("apply_ui_font", "ui_common"),
    ("apply_language_button", "ui_common"),
    ("apply_name_font", "ui_common"),
    ("apply_plain_font", "ui_common"),
    ("apply_dialogue_font", "ui_common"),
    ("apply_choice_font", "ui_common"),
    ("set_button_label", "ui_common"),
    ("refresh_all_localized", "ui_common"),
    ("refresh_all_ui_fonts", "ui_common"),
    ("sync_button_label", "ui_common"),
    ("configure_button", "ui_common"),
    ("configure_royal", "ui_common"),
    ("configure_body_button", "ui_common"),
    ("create_menu_button", "ui_common"),
    ("create_pause_menu_button", "ui_common"),
    ("move_toward", "ui_common"),
    ("answer_button_fill", "ui_common"),
    ("set_ui_button", "ui_common"),
    ("compute_answer_button", "ui_common"),
    ("configure_choice_menu", "ui_common"),
    ("layout_choice_button", "ui_common"),
    ("create_choice_button", "ui_common"),
    ("apply_menu_button_visual", "ui_common"),
    ("apply_main_menu_button_visual", "ui_common"),
    ("set_node_ui", "ui_common"),
    ("pack_pixel", "ui_common"),
    ("smoothstep_f", "ui_common"),
    ("frac_f", "ui_common"),
    ("menu_button_texture", "ui_common"),
    ("create_menu_button_shine", "ui_common"),
    ("setup_main_menu_button", "ui_common"),
    ("main_menu_background_zoom", "ui_common"),
    ("apply_main_menu_background", "ui_common"),
    ("update_main_menu_button_shine", "ui_common"),
    ("layout_centered_answer", "ui_common"),
    ("configure_single_line", "ui_common"),
    ("configure_info_hover", "ui_common"),
    ("configure_answer_button", "ui_common"),
    ("create_answer_button", "ui_common"),
    ("set_anchor_insets", "ui_common"),
    ("set_frame_width", "ui_common"),
    ("try_again_button", "ui_common"),
    ("language_button_font", "ui_common"),
    ("load_menu_button_textures", "bootstrap"),
    ("load_resources", "bootstrap"),
    ("advance_bootstrap", "bootstrap"),
    ("finish_game_bootstrap", "bootstrap"),
    ("build_ui", "bootstrap"),
    ("build_character", "bootstrap"),
    ("build_incoming", "bootstrap"),
    ("build_dialogue_ui", "bootstrap"),
    ("build_character_profile_ui", "bootstrap"),
    ("build_main_menu_ui", "bootstrap"),
    ("build_info_tooltip", "bootstrap"),
    ("wire_ui_event", "bootstrap"),
    ("wire_advisor_action", "bootstrap"),
    ("load_court_character", "bootstrap"),
    ("court_portrait_texture", "bootstrap"),
    ("warm_character", "bootstrap"),
    ("load_record_days", "bootstrap"),
    ("refresh_save_availability", "bootstrap"),
    ("texture_path_for", "bootstrap"),
    ("query_character_visual", "bootstrap"),
    ("update_character_texture_aspect", "bootstrap"),
    ("character_idx_for_texture", "character_profile"),
]

EXACT_MODULE = {
    "StartupSplashFlow": "hover_components",
    "ContinueFadeFlow": "hover_components",
    "IntroCutsceneFlow": "hover_components",
    "CharacterSlide": "hover_components",
    "DialogueFlow": "hover_components",
    "DefeatFlow": "hover_components",
    "ParallelHandoffFlow": "hover_components",
    "CharacterVisualPrep": "hover_components",
    "CameraZoom": "hover_components",
    "StatBarDisplay": "hover_components",
    "MenuInput": "hover_components",
    "DialogueLayout": "hover_components",
    "AnswerChoiceHover": "hover_components",
    "MainMenuButtonHover": "hover_components",
    "MenuButtonHover": "hover_components",
    "CharacterProfileButtonHover": "hover_components",
    "MainMenuOptionsButtonHover": "hover_components",
    "InfoTooltipDisplay": "hover_components",
    "AdvisorIconHover": "hover_components",
    "AdvisorActionCardHover": "hover_components",
    "CharacterHover": "hover_components",
    "CharacterClick": "hover_components",
}


def assign_module(name: str, is_class: bool) -> str:
    if is_class:
        return EXACT_MODULE.get(name, "hover_components")
    for prefix, mod in PREFIX_TO_MODULE:
        if name.startswith(prefix) or name == prefix.rstrip("_"):
            return mod
    return "bootstrap"


def parse_main(text: str):
    lines = text.splitlines(keepends=True)
    requires: list[str] = []
    vars_block: list[str] = []
    items: list[tuple[str, str, list[str]]] = []  # kind, name, lines

    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith("require "):
            requires.append(line)
            i += 1
            continue
        if line.startswith("var ") and not items:
            while i < len(lines) and (lines[i].startswith("var ") or (vars_block and lines[i].strip() == "")):
                if lines[i].startswith("var "):
                    vars_block.append(lines[i])
                elif vars_block and lines[i].strip() == "":
                    vars_block.append(lines[i])
                i += 1
            continue
        if line.startswith("[export]") or line.startswith("[cheat]"):
            i += 1
            continue
        m = re.match(r"^(def|class)\s+(\w+)", line)
        if m:
            kind, name = m.group(1), m.group(2)
            block = [line]
            i += 1
            while i < len(lines):
                nxt = lines[i]
                if nxt.startswith("def ") or nxt.startswith("class ") or nxt.startswith("[export]") or nxt.startswith("[cheat]"):
                    break
                block.append(nxt)
                i += 1
            items.append((kind, name, block))
            continue
        i += 1

    keep_in_main: list[str] = []
    exports_cheats: list[str] = []
    i = 0
    while i < len(lines):
        if lines[i].startswith("[export]") or lines[i].startswith("[cheat]"):
            block = [lines[i]]
            i += 1
            if i < len(lines) and lines[i].startswith("def "):
                block.append(lines[i])
                i += 1
                while i < len(lines) and not lines[i].startswith("def ") and not lines[i].startswith("class ") and not lines[i].startswith("[export]") and not lines[i].startswith("[cheat]"):
                    block.append(lines[i])
                    i += 1
                exports_cheats.extend(block)
                continue
        if lines[i].startswith("def on_advisor_popup_global_mouse_click"):
            block = [lines[i]]
            i += 1
            while i < len(lines) and not lines[i].startswith("def ") and not lines[i].startswith("class ") and not lines[i].startswith("[export]") and not lines[i].startswith("[cheat]"):
                block.append(lines[i])
                i += 1
            keep_in_main.extend(block)
            continue
        i += 1

    return requires, vars_block, items, exports_cheats, keep_in_main


def make_public_def(block: list[str]) -> list[str]:
    out = []
    for line in block:
        if line.startswith("def ") and " public" not in line.split("{")[0]:
            line = line.replace("def ", "def public ", 1)
        out.append(line)
    return out


def make_public_var(line: str) -> str:
    stripped = line.lstrip()
    if stripped.startswith("var public ") or stripped.startswith("var private "):
        return line
    return line.replace("var ", "var public ", 1)


def nl(s: str) -> str:
    return s if s.endswith("\n") else s + "\n"


def write_module(name: str, vars_lines: list[str], func_blocks: list[list[str]]) -> None:
    path = UI_DIR / f"{name}.das"
    extra = MODULE_EXTRA_REQUIRES.get(name, [])
    req_lines = list(BASE_REQUIRES)
    for r in extra:
        if r not in req_lines:
            req_lines.append(r)
    parts: list[str] = []
    for r in req_lines:
        parts.append(nl(r))
    parts.append("\n")
    parts.append(nl(f"module {name} public"))
    parts.append("\n")
    if vars_lines and name == "ui_state":
        for v in vars_lines:
            if v.strip():
                parts.append(make_public_var(v) if v.strip().startswith("var ") else v)
            else:
                parts.append(v)
        parts.append("\n")
    for block in func_blocks:
        parts.extend(make_public_def(block))
        if not block[-1].endswith("\n\n"):
            parts.append("\n")
    path.write_text("".join(parts), encoding="utf-8")
    print(f"wrote {path.relative_to(ROOT)} ({len(func_blocks)} items)")


MAIN_KEEP_NAMES = {"on_advisor_popup_global_mouse_click"}


def main() -> None:
    text = MAIN.read_text(encoding="utf-8")
    requires, vars_block, items, exports_cheats, keep_in_main = parse_main(text)

    modules: dict[str, list[list[str]]] = {k: [] for k in MODULE_EXTRA_REQUIRES}
    for kind, name, block in items:
        if name in MAIN_KEEP_NAMES:
            keep_in_main.extend(block)
            continue
        mod = assign_module(name, kind == "class")
        modules.setdefault(mod, []).append(block)

    write_module("ui_state", vars_block, [])
    for mod, blocks in modules.items():
        if mod == "ui_state":
            continue
        write_module(mod, [], blocks)

    ui_requires = [
        "require scripts/das/ui/ui_state",
        "require scripts/das/ui/ui_flow",
        "require scripts/das/ui/ui_common",
        "require scripts/das/ui/audio",
        "require scripts/das/ui/menus",
        "require scripts/das/ui/character_profile",
        "require scripts/das/ui/cutscenes",
        "require scripts/das/ui/dialogue",
        "require scripts/das/ui/hud",
        "require scripts/das/ui/death",
        "require scripts/das/ui/bootstrap",
        "require scripts/das/ui/hover_components",
    ]
    main_parts: list[str] = []
    for r in BASE_REQUIRES + ui_requires:
        main_parts.append(nl(r))
    main_parts.append("\n")
    main_parts.extend(exports_cheats)
    if keep_in_main:
        if exports_cheats and not exports_cheats[-1].endswith("\n\n"):
            main_parts.append("\n")
        main_parts.extend(keep_in_main)
    if not main_parts[-1].endswith("\n"):
        main_parts.append("\n")
    MAIN.write_text("".join(main_parts), encoding="utf-8")
    line_count = MAIN.read_text(encoding="utf-8").count("\n") + 1
    print(f"slim main.das: {line_count} lines")


if __name__ == "__main__":
    main()

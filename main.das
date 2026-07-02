require engine.core
require strings
require scripts/das/core/constants
require scripts/das/core/game_state
require scripts/das/core/layout
require scripts/das/core/dialogue_types
require scripts/das/core/text_utils
require scripts/das/gameplay/questions
require scripts/das/gameplay/court_characters
require scripts/das/gameplay/question_pools
require scripts/das/gameplay/characters
require scripts/das/gameplay/defeat
require scripts/das/gameplay/ashford
require scripts/das/gameplay/edric_opener
require scripts/das/gameplay/stat_synergies
require scripts/das/gameplay/stat_unlocks
require scripts/das/gameplay/stat_unlock_intro
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_state
require scripts/das/gameplay/advisor_actions
require scripts/das/localization/localization public
require scripts/das/localization/localization_dialogue public
require scripts/das/core/dialogue_ids
require scripts/das/gameplay/game_save
require scripts/das/ui/ui_state
require scripts/das/ui/ui_flow
require scripts/das/ui/ui_common
require scripts/das/ui/audio
require scripts/das/ui/menus
require scripts/das/ui/character_profile
require scripts/das/ui/cutscenes
require scripts/das/ui/dialogue
require scripts/das/ui/hud
require scripts/das/ui/death
require scripts/das/ui/bootstrap
require scripts/das/ui/hover_components

[cheat]
def jump_day(day : int) {
    currentDay = clamp(day, 1, 365)
    if (currentDay >= STAT_PEOPLE_UNLOCK_DAY) {
        statUnlocked[STAT_PEOPLE_IDX] = true
    }
    if (currentDay >= STAT_NOBILITY_UNLOCK_DAY) {
        statUnlocked[STAT_RICH_LOVE_IDX] = true
    }
    if (currentDay >= STAT_LOYALTY_UNLOCK_DAY) {
        statUnlocked[STAT_LOYALTY_IDX] = true
    }
    if (currentDay >= STAT_SUCCESSION_UNLOCK_DAY) {
        statUnlocked[STAT_SUCCESSION_IDX] = true
    }
    update_day_text()
    setup_encounter_for_day(currentDay)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


[cheat]
def fire_arc_beat(arcId : int; beatIdx : int) {
    begin_arc_encounter(arcId, beatIdx)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


[cheat]
def jump_day_30() {
    currentDay = 30
    update_day_text()
    setup_encounter_for_day(currentDay)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


[cheat]
def jump_day_90() {
    currentDay = 90
    statUnlocked[STAT_PEOPLE_IDX] = true
    update_day_text()
    setup_encounter_for_day(currentDay)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


[cheat]
def jump_day_175() {
    currentDay = 175
    statUnlocked[STAT_RICH_LOVE_IDX] = true
    update_day_text()
    setup_encounter_for_day(currentDay)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


[cheat]
def fire_household_finale() {
    currentDay = 86
    begin_arc_encounter(ARC_HOUSEHOLD, 7)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


[export]
def on_initialize() {
    refresh_layout_resolution()
    reset_arc_state()
    reset_kingdom_stats()
    reset_stat_anim_state()
    setup_encounter_for_day(1)
    pendingNextNodeIdx = NO_NEXT_NODE
    reset_used_encounter_flags()
    reset_court_characters_met()
    reset_character_question_cooldowns()

    cameraNode = create_node(NodeData(name = "camera"))
    add_component(cameraNode, new Camera(backgroundColor = BG_COLOR))

    create_render_settings()

    add_and_activate_action_set("reigns", {
        "choice1" => Action(
            buttonActions = ButtonAction(
                keyboardButtons = [KeyboardButtonInput(idx = KeyCode._1)]
            )
        ),
        "choice2" => Action(
            buttonActions = ButtonAction(
                keyboardButtons = [KeyboardButtonInput(idx = KeyCode._2)]
            )
        ),
        "choice3" => Action(
            buttonActions = ButtonAction(
                keyboardButtons = [KeyboardButtonInput(idx = KeyCode._3)]
            )
        ),
        "choice4" => Action(
            buttonActions = ButtonAction(
                keyboardButtons = [KeyboardButtonInput(idx = KeyCode._4)]
            )
        ),
        "choice5" => Action(
            buttonActions = ButtonAction(
                keyboardButtons = [KeyboardButtonInput(idx = KeyCode._5)]
            )
        ),
    })

    show_mouse_cursor(true)

    bootstrapLoadStep = 0
    gameBootstrapComplete = false
    if (DEBUG_SKIP_TO_GAME_SCREEN) {
        load_resources()
        debug_start_in_game()
    } else {
        logoTexture = request_texture(LOGO_TEXTURE_PATH)
        build_startup_splash_ui()
        start_startup_splash()
    }
}


[export]
def on_update() {
    advisorActionClickHandledThisFrame = false
    let dt = get_delta_time()
    update_menu_slide(dt)
    update_character_profile_slide(dt)
    update_advisor_popup_slide(dt)
    update_main_menu_options_slide(dt)
    process_advisor_popup_input()

    if (is_in_defeat_flow() && defeatPhase != DEFEAT_PEASANT_DIALOGUE) {
        return
    }
    if (is_dialogue_input_blocked()) {
        return
    }
    if (is_game_paused()) {
        return
    }
    if (dialogPhase != DIALOG_CHOOSING) {
        return
    }
    let choiceCount = visible_choice_count(get_current_dialogue_node())
    if (is_action_just_pressed("choice1") && choiceCount > 0) {
        select_choice(0)
    } elif (is_action_just_pressed("choice2") && choiceCount > 1) {
        select_choice(1)
    } elif (is_action_just_pressed("choice3") && choiceCount > 2) {
        select_choice(2)
    } elif (is_action_just_pressed("choice4") && choiceCount > 3) {
        select_choice(3)
    } elif (is_action_just_pressed("choice5") && choiceCount > 4) {
        select_choice(4)
    }
}


[export]
def on_resolution_changed(res : int2) {
    refresh_layout_resolution()
    if (!uiCanvas.isAlive) {
        return
    }
    set_frame_size(uiCanvas, float2(res))
    if (backgroundNode.isAlive) {
        set_frame_size(backgroundNode, float2(res))
    }
    if (menuOverlay.isAlive) {
        set_frame_size(menuOverlay, float2(res))
    }
    if (mainMenuOptionsOverlay.isAlive) {
        set_frame_size(mainMenuOptionsOverlay, float2(res))
    }
    if (mainMenuOptionsPanelNode.isAlive) {
        apply_main_menu_options_layout()
    }
    if (characterProfileOverlay.isAlive) {
        set_frame_size(characterProfileOverlay, float2(res))
    }
    if (advisorPopupOverlay.isAlive) {
        set_frame_size(advisorPopupOverlay, float2(res))
    }
    if (menuPanelNode.isAlive) {
        apply_menu_layout()
    }
    if (characterProfilePanelNode.isAlive) {
        apply_character_profile_layout()
    }
    if (advisorPopupPanelNode.isAlive) {
        apply_advisor_popup_layout()
    }
    if (deathFadeOverlay.isAlive) {
        set_frame_size(deathFadeOverlay, float2(res))
    }
    if (startupSplashRoot.isAlive) {
        apply_startup_splash_layout()
    }
    if (introFadeOverlay.isAlive || introCutsceneRoot.isAlive) {
        apply_intro_cutscene_layout()
    }
    if (introCutsceneSkipRoot.isAlive) {
        apply_intro_cutscene_skip_layout()
    }
    if (deathScreenNode.isAlive) {
        set_frame_size(deathScreenNode, float2(res))
    }
    if (zoomRoot.isAlive) {
        set_frame_size(zoomRoot, float2(res))
    }
    apply_top_bar_layout()
    apply_bottom_bar_layout()
    apply_advisor_icon_layout()
    apply_menu_layout()
    apply_main_menu_layout()
    apply_character_layout()
    apply_death_summary_layout()
    apply_info_tooltip_layout()
    mark_dialogue_layout_dirty()
    if (hoveredInfoTarget != INFO_HOVER_NONE && infoTooltipRoot.isAlive && infoTooltipRoot.isActive) {
        position_info_tooltip(hoveredInfoTarget)
    }
    apply_camera_zoom()
}


[export]
def on_exit() {
    save_game_options()
}


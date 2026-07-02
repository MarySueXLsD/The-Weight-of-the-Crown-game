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
require scripts/das/ui/dialogue

module death public

def public on_try_again_click(evt : UIMouseEvent) {
    clear_game_save()
    deferCharacterEnter = false
    reset_game()
    screenPhase = SCREEN_PLAYING
    sync_stat_bar_children()
    apply_screen_visibility()
    save_game_progress(main_question_id(currentEncounterIdx, currentNodeIdx))
}



def public update_death_summary_text() {
    if (!deathSummaryTextNode.isAlive) {
        return
    }
    deathSummaryTextNode?.UIText.text = format_death_summary_text()
    if (deathRecordTextNode.isAlive) {
        deathRecordTextNode?.UIText.text = format_death_record_text()
    }
    apply_death_summary_layout()
}



def public set_death_summary_alpha(alpha : float) {
    let a = clamp(alpha, 0.0, 1.0)
    if (deathSummaryBorderNode.isAlive) {
        set_image_color(deathSummaryBorderNode, float4(UI_BOX_BORDER_COLOR.x, UI_BOX_BORDER_COLOR.y, UI_BOX_BORDER_COLOR.z, a))
    }
    if (deathSummaryBoxNode.isAlive) {
        set_image_color(deathSummaryBoxNode, float4(DEATH_SUMMARY_BOX_BG_COLOR.x, DEATH_SUMMARY_BOX_BG_COLOR.y, DEATH_SUMMARY_BOX_BG_COLOR.z, a))
    }
    if (deathSummaryTextNode.isAlive) {
        let col = deathSummaryTextNode?.UIText.color
        deathSummaryTextNode?.UIText.color = float4(col.x, col.y, col.z, a)
    }
    if (deathRecordTextNode.isAlive) {
        let col = deathRecordTextNode?.UIText.color
        deathRecordTextNode?.UIText.color = float4(col.x, col.y, col.z, a)
    }
    if (tryAgainButtonNode.isAlive) {
        set_image_color(tryAgainButtonNode, float4(UI_BOX_BORDER_COLOR.x, UI_BOX_BORDER_COLOR.y, UI_BOX_BORDER_COLOR.z, a))
        let fill = answer_button_fill(tryAgainButtonNode)
        if (fill.isAlive) {
            var fillCol = ANSWER_BUTTON_COLOR
            fillCol.w = a * ANSWER_BUTTON_IDLE_ALPHA
            set_image_color(fill, fillCol)
            let col = fill?.UIText.color
            fill?.UIText.color = float4(col.x, col.y, col.z, a)
        }
    }
}



def public set_death_fade_alpha(alpha : float) {
    let a = clamp(alpha, 0.0, 1.0)
    if (deathFadeOverlay.isAlive) {
        set_image_color(deathFadeOverlay, float4(0.0, 0.0, 0.0, a))
    }
    if (deathScreenNode.isAlive) {
        set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, a))
    }
}



def public hide_death_ui() {
    if (deathFadeOverlay.isAlive) {
        deathFadeOverlay.isActive = false
    }
    if (deathScreenNode.isAlive) {
        deathScreenNode.isActive = false
    }
    if (deathSummaryRoot.isAlive) {
        deathSummaryRoot.isActive = false
    }
    set_death_fade_alpha(0.0)
    set_death_summary_alpha(0.0)
}



def public begin_defeat_after_exit() {
    defeatPhase = DEFEAT_WAIT_EXIT
}



def public start_defeat_encounter() {
    defeatPhase = DEFEAT_PEASANT_DIALOGUE
    currentNodeIdx = 0
    pendingNextNodeIdx = NO_NEXT_NODE
    let statIdx = (defeatStatIdx >= 0) ? defeatStatIdx : STAT_GOLD_IDX
    let visitorIdx = get_defeat_visitor_index(statIdx)
    characterTexture = visitorTextures[visitorIdx]
    update_character_texture_aspect(characterTexture)
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}



def public start_defeat_fade_out() {
    ensure_death_screen_textures_loaded()
    defeatPhase = DEFEAT_FADE_OUT
    defeatFadeT = 0.0
    deathSummaryFadeT = 0.0
    deathSummaryTimer = 0.0
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    try_update_record_days(currentDay)
    update_death_summary_text()
    if (deathFadeOverlay.isAlive) {
        deathFadeOverlay.isActive = true
    }
    if (deathScreenNode.isAlive) {
        let statIdx = (defeatStatIdx >= 0) ? defeatStatIdx : STAT_GOLD_IDX
        deathScreenNode?.UIImage.textureId = deathScreenTextures[statIdx]
        deathScreenNode.isActive = false
    }
    if (deathSummaryRoot.isAlive) {
        deathSummaryRoot.isActive = false
    }
    set_death_fade_alpha(0.0)
    set_death_summary_alpha(0.0)
}



def public reset_game() {
    let savedRecord = recordDays
    reset_kingdom_stats()
    reset_stat_anim_state()
    currentDay = 1
    playerNickname = default_nickname()
    recordDays = savedRecord
    setup_encounter_for_day(currentDay)
    pendingNextNodeIdx = NO_NEXT_NODE
    queuedNextEncounterIdx = -1
    reset_used_encounter_flags()
    reset_court_characters_met()
    reset_character_question_cooldowns()
    ashfordIntroduced = false
    ashfordCutsceneActive = false
    statUnlockCutsceneActive = false
    statUnlockCutsceneStatIdx = -1
    characterExitFinished = false
    zoomOutFinished = false
    continueFadePhase = CONTINUE_FADE_NONE
    continueFadeT = 0.0
    usingAshfordDebutEncounter = false
    usingArcEncounter = false
    usingStatUnlockEncounter = false
    statUnlockEncounterKind = -1
    activeArcId = ARC_NONE
    activeArcBeatIdx = -1
    queuedNextArcId = ARC_NONE
    queuedNextArcBeatIdx = -1
    reset_arc_state()
    reset_stat_unlocks()
    if (introCutscenePhase != INTRO_NONE) {
        introCutscenePhase = INTRO_NONE
        introCutsceneT = 0.0
        introFadeAlpha = 0.0
        if (introFadeOverlay.isAlive) {
            introFadeOverlay.isActive = false
            set_intro_fade_alpha(0.0)
        }
        if (introCutsceneRoot.isAlive) {
            introCutsceneRoot.isActive = false
        }
    }
    defeatPhase = DEFEAT_NONE
    defeatStatIdx = -1
    defeatFadeT = 0.0
    deathSummaryFadeT = 0.0
    deathSummaryTimer = 0.0
    menuOpen = false
    reset_pause_menu_state()
    reset_character_profile_state()
    reset_advisor_popup_state()
    hide_death_ui()
    update_day_text()
    update_nickname_text()
    cancel_parallel_handoff()
    reset_character_visual_prep()
    reset_character_transform()
    apply_current_encounter_character()
    roll_next_incoming_character_texture()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    cameraZoomPhase = CAM_ZOOM_IDLE
    cameraZoomT = 0.0
    apply_camera_zoom()
    update_stat_bar_anims(0.0)
    sync_stat_bar_children()
    if (deferCharacterEnter) {
        prepare_character_offscreen()
        if (characterRoot.isAlive) {
            characterRoot.isActive = false
        }
        deferCharacterEnter = false
    } else {
        start_character_enter()
    }
}



def public ensure_death_screen_textures_loaded() {
    if (deathScreenTexturesLoaded) {
        return
    }
    for (i in range(STAT_COUNT)) {
        deathScreenTextures[i] = request_texture(get_defeat_screen_texture_path(i))
    }
    deathScreenTexturesLoaded = true
}




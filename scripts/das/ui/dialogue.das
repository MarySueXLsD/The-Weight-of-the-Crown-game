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
require scripts/das/ui/cutscenes

module dialogue public

def public apply_character_profile_overlay_from_open_amount() {
    if (!characterProfileOverlay.isAlive) {
        return
    }
    let alpha = character_profile_open_amount() * MENU_OVERLAY_COLOR.w
    set_image_color(characterProfileOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, alpha))
}



def public character_idx_for_texture(tex : TextureId) : int {
    if (tex == kingTexture) {
        return CHARACTER_KING_IDX
    }
    if (tex == peasantTexture) {
        return 4
    }
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        if (tex == visitorTextures[i]) {
            return i
        }
    }
    return -1
}



def public apply_character_profile_layout() {
    if (!characterProfilePanelNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let pad = ui_h(CHARACTER_PROFILE_PADDING)
    let spacing = ui_h(CHARACTER_PROFILE_SPACING)
    let panelW = ui_w(CHARACTER_PROFILE_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border

    set_text_font_size(characterProfileLikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))
    set_text_font_size(characterProfileDislikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))

    let textW = character_profile_content_text_width(innerW)
    let bodyH = compute_character_profile_body_height(innerW)
    let contentH = bodyH + 2.0 * pad
    if (characterProfileContentNode.isAlive) {
        set_spacing(characterProfileContentNode, spacing)
        set_padding(characterProfileContentNode, float4(pad, pad, pad, pad))
        set_alignment(characterProfileContentNode, LayoutAlignment.TopLeft)
        set_frame_size(characterProfileContentNode, float2(innerW, contentH))
        characterProfileContentNode?.UIVerticalLayout.childForceExpandWidth = true
        characterProfileContentNode?.UIVerticalLayout.childForceExpandHeight = false
    }
    if (characterProfileInnerNode.isAlive) {
        set_frame_size(characterProfileInnerNode, float2(innerW, contentH))
        set_frame_pos(characterProfileInnerNode, float2(border, border))
        set_image_color(characterProfileInnerNode, CHARACTER_PROFILE_INNER_BG_COLOR)
    }
    if (characterProfilePanelNode.isAlive) {
        set_image_color(characterProfilePanelNode, CHARACTER_PROFILE_BORDER_COLOR)
    }
    set_frame_size(characterProfilePanelNode, float2(panelW, contentH + 2.0 * border))
    set_frame_pivot(characterProfilePanelNode, float2(0.0, 0.0))
    let btnInnerH = ui_h(CHARACTER_PROFILE_BUTTON_HEIGHT)
    let btnOuterW = compute_profile_okay_button_outer_width()
    apply_menu_button_layout(characterProfileOkayButtonNode, btnOuterW, btnInnerH, ANSWER_FONT_SIZE, false, float2(0.5, 1.0))
    if (characterProfileOkayRowNode.isAlive) {
        var rowH = characterProfileOkayButtonNode?.UIFrame.size.y
        if (rowH <= 0.0) {
            rowH = menu_button_outer_height(btnInnerH)
        }
        set_frame_size(characterProfileOkayRowNode, float2(textW, rowH))
    }
    if (is_character_profile_open()) {
        set_character_profile_slide_x(characterProfileSlideX)
        apply_character_profile_overlay_from_open_amount()
    }
}



def public can_click_character() : bool {
    if (is_game_paused() || is_in_defeat_flow()) {
        return false
    }
    if (dialogPhase == DIALOG_IDLE || dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
        return false
    }
    if (characterAnimPhase != CHARACTER_ANIM_IDLE) {
        return false
    }
    if (cameraZoomPhase != CAM_ZOOM_IDLE) {
        return false
    }
    if (!characterRoot.isAlive || !characterRoot.isActive) {
        return false
    }
    return characterHoverT > 0.01
}



def public apply_dialogue_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.fontId = dialogueFont
}



def public apply_choice_font(node : NodeId) {
    apply_dialogue_font(node)
}



def public clear_dialogue_branch_response() {
    dialogueBranchResponseText = ""
    mark_dialogue_layout_dirty()
    if (!questionResponseNode.isAlive) {
        return
    }
    questionResponseNode.isActive = false
    questionResponseNode?.UIText.text = ""
}



def public set_dialogue_branch_response(responseText : string) {
    dialogueBranchResponseText = responseText
    mark_dialogue_layout_dirty()
    if (!questionResponseNode.isAlive) {
        return
    }
    if (length(responseText) == 0) {
        clear_dialogue_branch_response()
        return
    }
    questionResponseNode.isActive = true
    questionResponseNode?.UIText.text = responseText
}



def public refresh_active_dialogue_text() {
    if (dialogPhase == DIALOG_IDLE && defeatPhase != DEFEAT_PEASANT_DIALOGUE) {
        return
    }
    let node = get_current_dialogue_node()
    update_dialogue_speaker_name()
    if (dialogPhase == DIALOG_TYPEWRITER) {
        if (typewriterKind == TYPEWRITER_PROMPT) {
            typewriterFullText = build_dialogue_prompt_text(typewriterPromptPrefix, node.prompt)
        } elif (lastSelectedChoiceIdx >= 0 && lastSelectedChoiceIdx < visible_choice_count(node)) {
            typewriterFullText = node.choices[lastSelectedChoiceIdx].response
        }
        typewriterCharCount = min(typewriterCharCount, typewriter_text_length(typewriterFullText))
        questionTextNode?.UIText.text = typewriter_text_slice(typewriterFullText, typewriterCharCount)
    } elif (dialogPhase == DIALOG_CHOOSING) {
        clear_dialogue_branch_response()
        questionTextNode?.UIText.text = build_dialogue_prompt_text(typewriterPromptPrefix, node.prompt)
        mark_dialogue_layout_dirty()
    } elif (dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
        clear_dialogue_branch_response()
        if (lastSelectedChoiceIdx >= 0 && lastSelectedChoiceIdx < visible_choice_count(node)) {
            questionTextNode?.UIText.text = node.choices[lastSelectedChoiceIdx].response
        }
    }
    apply_dialogue_layout()
}



def public roll_next_incoming_character_texture() {
    refresh_next_visitor_preview()
}



def public incoming_character_body_path() : string {
    if (queuedNextEncounterIdx < 0) {
        return ""
    }
    let charIdx = get_encounter_character_idx(queuedNextEncounterIdx)
    if (charIdx < 0 || charIdx >= COURT_CHARACTER_COUNT) {
        return ""
    }
    return COURT_BODY_PATHS[charIdx]
}



def public advance_day_only() {
    currentDay++
    update_day_text()
    advisorActionUsedToday = false
    tick_advisor_cooldowns()
}



def public apply_current_encounter_character() {
    if (usingStatUnlockEncounter) {
        apply_court_character_texture(currentCourtCharacterIdx)
        return
    }
    if (usingArcEncounter) {
        apply_court_character_texture(get_arc_character_idx(activeArcId, activeArcBeatIdx))
        return
    }
    if (is_edric_day_one_encounter(currentEncounterIdx)) {
        apply_court_character_texture(CHAR_EDRIC)
        return
    }
    apply_court_character_texture(get_encounter_character_idx(currentEncounterIdx))
}



def public advance_day_and_begin_pending_cutscene() : bool {
    advance_day_only()
    let statIdx = get_stat_unlock_cutscene_stat_for_day(currentDay)
    if (statIdx >= 0) {
        if (queuedNextEncounterIdx < 0) {
            queue_forced_encounter(pick_encounter_for_day(currentDay))
        }
        save_game_progress(cutscene_resume_id_for_stat(statIdx))
        begin_stat_unlock_cutscene(statIdx)
        return true
    }
    advance_to_next_encounter()
    return false
}



def public start_same_visitor_encounter() {
    if (will_cutscene_after_day_advance()) {
        dialogPhase = DIALOG_POST_RESPONSE_HOLD
        postResponseHoldTimer = POST_RESPONSE_HOLD_DURATION
        return
    }
    append_same_visitor_prompt(get_current_dialogue_node().prompt)
}



def public character_mouse_local_xy() : float2 {
    var mouseLocal : float3
    if (!get_ui_mouse_position(characterImageNode, mouseLocal)) {
        return float2(-1.0, -1.0)
    }
    let charSize = character_size()
    let pivot = characterImageNode?.UIFrame.pivot
    return float2(
        mouseLocal.x + charSize.x * pivot.x,
        mouseLocal.y + charSize.y * pivot.y
    )
}



def public choice_has_stat_change(choice : DialogueChoice) : bool {
    return deltas_have_stat_change(choice.statDeltas)
}



def public deltas_have_stat_change(deltas : int[STAT_COUNT]) : bool {
    for (i in range(STAT_COUNT)) {
        if (statUnlocked[i] && deltas[i] != 0) {
            return true
        }
    }
    return false
}



def public compute_synergy_modified_deltas(base : int[STAT_COUNT]) : int[STAT_COUNT] {
    var deltas = copy_stat_deltas(base)
    apply_choice_penalty_multiplier(deltas)
    apply_synergy_modifiers(deltas)
    return mask_deltas_to_unlocked_stats(deltas)
}



def public get_hovered_choice_modified_deltas() : int[STAT_COUNT] {
    if (hoveredChoice < 0) {
        return copy_stat_deltas(NO_STAT_CHANGE)
    }
    let node = get_current_dialogue_node()
    if (hoveredChoice >= visible_choice_count(node)) {
        return copy_stat_deltas(NO_STAT_CHANGE)
    }
    return compute_synergy_modified_deltas(node.choices[hoveredChoice].statDeltas)
}



def public apply_choice_stat_deltas(deltas : int[STAT_COUNT]) {
    for (i in range(STAT_COUNT)) {
        kingdomStats[i] = clamp_stat(kingdomStats[i] + deltas[i])
    }
}



def public character_size() : float2 {
    let resY = float(get_resolution().y)
    let height = resY * CHARACTER_HEIGHT_SCREEN_RATIO
    let width = height * characterTextureAspect
    return float2(width, height)
}



def public incoming_character_size() : float2 {
    let resY = float(get_resolution().y)
    let height = resY * CHARACTER_HEIGHT_SCREEN_RATIO
    let width = height * incomingTextureAspect
    return float2(width, height)
}



def public incoming_enter_start_offset() : float {
    let charW = incoming_character_size().x
    return -screen_w() * 0.5 - charW * 0.5
}



def public cancel_parallel_handoff() {
    parallelHandoffActive = false
    incomingEnterFinished = false
    if (incomingVisitorRoot.isAlive) {
        incomingVisitorRoot.isActive = false
    }
}



def public begin_parallel_incoming_visitor(tex : TextureId) {
    if (!incomingVisitorRoot.isAlive || tex == characterTexture) {
        return
    }
    incomingVisitorTexture = tex
    let path = texture_path_for(tex)
    let layout = query_character_visual_layout(path)
    if (!layout.valid) {
        return
    }
    incomingTextureAspect = layout.aspect
    incomingTextureUvRegion = layout.uvRegion
    layout_incoming_visitor()
    incomingVisitorImageNode?.UIImage.textureId = tex
    incomingVisitorSilhouetteNode?.UIImage.textureId = tex
    incomingAnimOffsetX = incoming_enter_start_offset()
    incomingWalkBobTimer = 0.0
    parallelHandoffActive = true
    incomingEnterFinished = false
    incomingVisitorRoot.isActive = true
    set_incoming_visitor_offset(incomingAnimOffsetX)
    apply_incoming_silhouette(0.0)
}



def public update_parallel_incoming_visitor(dt : float) {
    if (!parallelHandoffActive || incomingEnterFinished) {
        return
    }
    incomingAnimOffsetX += ui_w(CHARACTER_ANIM_ENTER_SPEED) * dt
    incomingWalkBobTimer += dt
    let bobPhase = cos(incomingWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
    let bobY = character_walk_bob_offset_y(bobPhase)
    apply_incoming_silhouette(0.0)
    let restX = compute_character_rest_offset_x()
    if (incomingAnimOffsetX >= restX) {
        incomingAnimOffsetX = restX
        set_incoming_visitor_offset(restX)
        incomingEnterFinished = true
        try_advance_to_wait()
    } else {
        set_incoming_visitor_offset(incomingAnimOffsetX, bobY)
    }
}



def public complete_parallel_handoff() {
    if (usingAshfordDebutEncounter) {
        usingAshfordDebutEncounter = false
    }
    if (usingStatUnlockEncounter) {
        clear_stat_unlock_encounter_mode()
    }
    if (usingArcEncounter) {
        clear_arc_encounter_mode()
    }
    if (advance_day_and_begin_pending_cutscene()) {
        cancel_parallel_handoff()
        return
    }
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    characterAnimOffsetX = compute_character_rest_offset_x()
    characterRestOffsetX = characterAnimOffsetX
    characterAnimPhase = CHARACTER_ANIM_REVEAL
    characterRevealT = 0.0
    characterWalkBobTimer = 0.0
    characterBreathTimer = 0.0
    set_character_offset(characterAnimOffsetX)
    apply_character_image_color(0.0)
    if (characterRoot.isAlive) {
        characterRoot.isActive = true
    }
    roll_next_incoming_character_texture()
    cancel_parallel_handoff()
}



def public zoom_ui_scale() : float {
    return lerp(CAMERA_ZOOM_OUT_SCALE, CAMERA_ZOOM_IN_SCALE, cameraZoomT)
}



def public character_image_top_right_screen() : float2 {
    let charSize = character_size()
    let res = float2(screen_w(), screen_h())
    // Anchor dialogue to the standing rest pose, not the breathing bob.
    let localTopRight = float2(
        res.x * 0.5 + characterAnimOffsetX + charSize.x * 0.5,
        res.y - charSize.y
    )
    return transform_zoom_local_to_screen(localTopRight)
}



def public compute_dialogue_left() : float {
    return character_image_top_right_screen().x + ui_w(DIALOGUE_CHARACTER_GAP_X)
}



def public compute_dialogue_top() : float {
    return character_image_top_right_screen().y + ui_h(DIALOGUE_CHARACTER_GAP_Y)
}



def public character_enter_start_offset() : float {
    let charW = character_size().x
    // Right edge of character at screen left (x = 0).
    return -screen_w() * 0.5 - charW * 0.5
}



def public character_exit_end_offset() : float {
    let charW = character_size().x
    // Walk fully past the left edge before exit completes.
    return -screen_w() * 0.5 - charW * 0.5 - ui_w(CHARACTER_EXIT_EXTRA_OFFSET)
}



def public character_exit_fade_t(offsetX : float) : float {
    let startX = characterRestOffsetX
    let endX = character_exit_end_offset()
    let span = startX - endX
    if (span <= 0.001) {
        return 0.0
    }
    return clamp((offsetX - endX) / span, 0.0, 1.0)
}



def public compute_dialogue_width() : float {
    let left = max(compute_dialogue_left(), 0.0)
    let available = screen_w() - left - ui_w(DIALOGUE_SCREEN_MARGIN_DESIGN)
    return max(available, ui_w(80.0))
}



def public set_dialogue_anchor(left : float; top : float) {
    get_component(dialogueRoot) $(var anchor : UIAnchor?) {
        anchor.left = left
        anchor.top = top
    }
}



def public mark_dialogue_layout_dirty() {
    dialogueLayoutDirty = true
}



def public apply_dialogue_layout() {
    if (!dialogueRoot.isAlive) {
        return
    }
    let dialogueW = compute_dialogue_width()

    set_dialogue_anchor(compute_dialogue_left(), compute_dialogue_top())
    set_frame_width(dialogueRoot, dialogueW)
    apply_question_box_layout(dialogueW)
    if (dialogPhase == DIALOG_CHOOSING) {
        layout_visible_choice_buttons(dialogueW)
    }
    dialogueLayoutDirty = false
}



def public apply_character_image_top_clip(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    set_anchor_insets(node, 0.0, ui_h(CHARACTER_RENDER_TOP_CLIP))
}



def public apply_character_layout() {
    let charSize = character_size()
    let newRest = compute_character_rest_offset_x()

    if (characterAnimPhase == CHARACTER_ANIM_IDLE) {
        characterRestOffsetX = newRest
        characterAnimOffsetX = newRest
        set_character_offset(newRest)
    } elif (abs(characterRestOffsetX) > 0.001) {
        let scale = newRest / characterRestOffsetX
        characterAnimOffsetX *= scale
        characterRestOffsetX = newRest
        set_character_offset(characterAnimOffsetX)
    } else {
        characterRestOffsetX = newRest
    }

    if (characterRoot.isAlive) {
        set_frame_size(characterRoot, charSize)
        set_frame_pos(characterRoot, float2(0.0, 0.0))
        sync_character_image_size(characterImageNode, charSize)
        sync_character_image_size(characterSilhouetteOverlay, charSize)
    }

    apply_dialogue_layout()
}



def public apply_camera_zoom() {
    let scale = zoom_ui_scale()
    zoomRoot.localScale = float3(scale, scale, 1.0)
    if (dialogueRoot.isAlive && dialogueRoot.isActive) {
        mark_dialogue_layout_dirty()
    }
}



def public character_walk_bob_offset_y(bobPhase : float) : float {
    // Snap to whole pixels so sub-pixel bob does not shimmer the top scanline.
    return floor(-bobPhase * ui_h(CHARACTER_WALK_BOB_AMPLITUDE) + 0.5)
}



def public set_character_offset(offsetX : float; offsetY : float = 0.0) {
    if (!characterRoot.isAlive) {
        return
    }
    characterAnimOffsetY = offsetY
    characterLastBreathOffsetY = offsetY
    get_component(characterRoot) $(var anchor : UIAnchor?) {
        anchor.left = offsetX
        // Bottom-anchored (anchor y = 1.0): vertical inset uses top, not bottom.
        // Snap Y to whole pixels so sub-pixel motion does not shimmer the top scanline.
        anchor.top = -floor(offsetY + 0.5)
    }
}



def public apply_character_breath() {
    characterBreathTimer += get_delta_time()
    let breathY = sin(characterBreathTimer * CHARACTER_BREATH_BOB_FREQ * PI * 2.0) * ui_h(CHARACTER_BREATH_BOB_AMPLITUDE)
    // Snap to whole pixels so sub-pixel bob does not shimmer the top scanline.
    let snappedY = floor(breathY + 0.5)
    if (snappedY == characterLastBreathOffsetY) {
        return
    }
    characterLastBreathOffsetY = snappedY
    set_character_offset(characterAnimOffsetX, snappedY)
}



def public apply_character_image_color(revealT : float) {
    if (!characterImageNode.isAlive) {
        return
    }
    let hoverT = clamp(characterHoverT, 0.0, 1.0)
    let tint = lerp(1.0, CHARACTER_HOVER_GRAY_TINT, hoverT)
    set_image_color(characterImageNode, float4(tint, tint, tint, 1.0))
    if (!characterSilhouetteOverlay.isAlive) {
        return
    }
    let t = clamp(revealT, 0.0, 1.0)
    if (t >= 1.0) {
        characterSilhouetteOverlay.isActive = false
        return
    }
    characterSilhouetteOverlay.isActive = true
    // Opaque black veil over the solid sprite; fades out during reveal.
    let overlayAlpha = 1.0 - t
    let overlayRgb = lerp(0.0, CHARACTER_SILHOUETTE_FADE_RGB, t)
    set_image_color(characterSilhouetteOverlay, float4(overlayRgb, overlayRgb, overlayRgb, overlayAlpha))
}



def public prepare_character_offscreen() {
    characterAnimOffsetX = character_enter_start_offset()
    characterRevealT = 0.0
    set_character_offset(characterAnimOffsetX)
    apply_character_image_color(0.0)
}



def public try_advance_to_wait() {
    if (!characterExitFinished || !zoomOutFinished) {
        return
    }
    if (defeatPhase == DEFEAT_WAIT_FADE) {
        characterExitFinished = false
        zoomOutFinished = false
        start_defeat_fade_out()
        return
    }
    if (parallelHandoffActive) {
        if (!incomingEnterFinished) {
            return
        }
        characterExitFinished = false
        zoomOutFinished = false
        complete_parallel_handoff()
        return
    }
    characterExitFinished = false
    zoomOutFinished = false
    start_character_wait()
}



def public hide_dialogue_ui() {
    dialogueRoot.isActive = false
    questionBorderNode.isActive = false
    answerRoot.isActive = false
    clear_dialogue_branch_response()
}



def public build_encounter_prompt_text(basePrompt : string) : string {
    if (usingAshfordDebutEncounter || defeatPhase != DEFEAT_NONE) {
        return basePrompt
    }
    let charIdx = currentCourtCharacterIdx
    if (encounter_has_built_in_intro()) {
        if (charIdx >= 0 && charIdx < COURT_CHARACTER_COUNT) {
            courtCharactersMet[charIdx] = true
        }
        return basePrompt
    }
    if (charIdx < 0 || charIdx >= COURT_CHARACTER_COUNT) {
        return basePrompt
    }
    if (courtCharactersMet[charIdx]) {
        return basePrompt
    }
    courtCharactersMet[charIdx] = true
    let intro = get_court_character_intro(charIdx)
    if (length(intro) == 0) {
        return basePrompt
    }
    return "{intro} {basePrompt}"
}



def public build_dialogue_prompt_text(responsePrefix : string; basePrompt : string) : string {
    let prompt = build_encounter_prompt_text(basePrompt)
    if (length(responsePrefix) == 0) {
        return prompt
    }
    return "{responsePrefix} {prompt}"
}



def public select_choice(choiceIdx : int) {
    if (is_dialogue_input_blocked() || is_game_paused() || dialogPhase != DIALOG_CHOOSING) {
        return
    }
    let node = get_current_dialogue_node()
    if (choiceIdx < 0 || choiceIdx >= visible_choice_count(node)) {
        return
    }
    let choice = node.choices[choiceIdx]
    lastSelectedChoiceIdx = choiceIdx
    pendingNextNodeIdx = choice.nextNodeIdx
    let questionId = get_current_question_id()
    let choiceReplyId = get_reply_id_for_choice(choiceIdx)
    append_reply_to_history(questionId, choiceReplyId)
    hoveredChoice = HOVER_NONE
    apply_encounter_nickname_change(currentEncounterIdx, choiceIdx)
    if (is_edric_day_one_encounter(currentEncounterIdx)) {
        apply_edric_day_one_choice(currentNodeIdx, choiceIdx)
    }
    if (usingArcEncounter) {
        apply_arc_choice_effects(activeArcId, activeArcBeatIdx, choiceIdx)
    }
    if (usingStatUnlockEncounter && statUnlockEncounterKind == 0 && currentNodeIdx == 0) {
        apply_people_unlock_tone(choiceIdx)
    }
    update_nickname_text()
    pendingChoiceDeltas = compute_synergy_modified_deltas(choice.statDeltas)
    hasPendingChoiceDeltas = true
    let defeatingStat = find_defeating_stat_idx_from_deltas(pendingChoiceDeltas)
    if (deltas_have_stat_change(pendingChoiceDeltas)) {
        start_stat_confirm_anims_from_deltas(pendingChoiceDeltas)
    }
    if (defeatingStat >= 0) {
        defeatStatIdx = defeatingStat
        begin_defeat_after_exit()
    }
    answerRoot.isActive = false
    if (pendingNextNodeIdx != NO_NEXT_NODE) {
        clear_dialogue_branch_response()
        let responsePrefix = choice.response
        currentNodeIdx = pendingNextNodeIdx
        pendingNextNodeIdx = NO_NEXT_NODE
        save_game_progress(get_current_question_id())
        start_prompt_typewriter(responsePrefix)
    } elif (length(choice.response) == 0) {
        clear_dialogue_branch_response()
        typewriterPromptPrefix = ""
        dialogPhase = DIALOG_POST_RESPONSE_HOLD
        postResponseHoldTimer = POST_RESPONSE_HOLD_DURATION
    } else {
        clear_dialogue_branch_response()
        typewriterPromptPrefix = ""
        begin_typewriter(choice.response, TYPEWRITER_RESPONSE)
    }
}



def public reset_character_transform() {
    characterAnimOffsetX = characterRestOffsetX
    characterAnimOffsetY = 0.0
    characterAnimPhase = CHARACTER_ANIM_IDLE
    characterWalkBobTimer = 0.0
    characterBreathTimer = 0.0
    characterRevealT = 1.0
    set_character_offset(characterRestOffsetX)
    apply_character_image_color(1.0)
}



def public start_camera_zoom_out() {
    cameraZoomPhase = CAM_ZOOM_OUT
}



def public start_camera_zoom_in() {
    if (cameraZoomPhase == CAM_ZOOM_IN) {
        return
    }
    cameraZoomT = 0.0
    cameraZoomPhase = CAM_ZOOM_IN
}



def public start_stat_intro_encounter(statIdx : int) {
    usingAshfordDebutEncounter = false
    apply_encounter_after_stat_cutscene(statIdx)
    apply_current_encounter_character()
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    save_game_progress(get_current_question_id())
    start_character_enter()
}



def public start_ashford_debut_encounter() {
    ashfordIntroduced = true
    usingAshfordDebutEncounter = true
    characterTexture = visitorTextures[VISITOR_LADY_ASHFORD_IDX]
    update_character_texture_aspect(characterTexture)
    currentNodeIdx = 0
    pendingNextNodeIdx = NO_NEXT_NODE
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    if (characterRoot.isAlive) {
        characterRoot.isActive = true
    }
    roll_next_incoming_character_texture()
    save_game_progress(ashford_question_id(currentNodeIdx))
    apply_screen_visibility()
    start_character_enter()
}



def public start_character_wait() {
    if (defeatPhase == DEFEAT_WAIT_EXIT) {
        start_defeat_encounter()
        return
    }
    if (usingAshfordDebutEncounter) {
        usingAshfordDebutEncounter = false
    }
    if (advance_day_and_begin_pending_cutscene()) {
        return
    }
    apply_current_encounter_character()
    roll_next_incoming_character_texture()
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    save_game_progress(main_question_id(currentEncounterIdx, currentNodeIdx))
    start_character_enter()
}



def public start_character_enter() {
    if (characterRoot.isAlive) {
        characterRoot.isActive = true
    }
    characterAnimOffsetX = character_enter_start_offset()
    characterAnimPhase = CHARACTER_ANIM_ENTER
    characterWalkBobTimer = 0.0
    characterBreathTimer = 0.0
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    characterRevealT = 0.0
    apply_character_image_color(0.0)
    set_character_offset(characterAnimOffsetX)
}



def public start_character_exit() {
    mark_encounter_character_cooldown()
    refresh_next_visitor_preview()
    cancel_parallel_handoff()
    characterExitFinished = false
    zoomOutFinished = false
    characterAnimOffsetX = characterRestOffsetX
    characterWalkBobTimer = 0.0
    characterBreathTimer = 0.0
    set_character_offset(characterAnimOffsetX)
    start_camera_zoom_out()
    characterRevealT = 1.0
    characterAnimPhase = CHARACTER_ANIM_EXIT
    if (defeatPhase == DEFEAT_NONE && nextVisitorTexture != characterTexture && !will_cutscene_after_day_advance()) {
        begin_parallel_incoming_visitor(nextVisitorTexture)
    }
}



def public refresh_character_visuals() {
    if (!characterImageNode.isAlive) {
        return
    }
    let path = texture_path_for(characterTexture)
    if (!apply_character_visual(path)) {
        update_character_texture_aspect(characterTexture)
    }
    characterImageNode?.UIImage.textureId = characterTexture
    if (characterSilhouetteOverlay.isAlive) {
        characterSilhouetteOverlay?.UIImage.textureId = characterTexture
    }
    apply_character_layout()
    if (characterAnimPhase == CHARACTER_ANIM_ENTER || characterAnimPhase == CHARACTER_ANIM_REVEAL || characterAnimPhase == CHARACTER_ANIM_HIDE || characterAnimPhase == CHARACTER_ANIM_EXIT) {
        apply_character_image_color(characterRevealT)
    } else {
        apply_character_image_color(1.0)
    }
}



def public build_dialogue_ui() {
    let dialogueW = compute_dialogue_width()
    let border = ui_box_border()
    let padding = ui_h(DIALOGUE_BOX_PADDING)
    let innerW = dialogueW - 2.0 * border
    let textW = innerW - 2.0 * padding

    questionNameNode = text("")
    questionNameNode.name = "questionNameNode"
    set_text_font_size(questionNameNode, ui_h(DIALOGUE_NAME_FONT_SIZE))
    set_text_color(questionNameNode, DIALOGUE_NAME_COLOR)
    apply_name_font(questionNameNode)
    configure_single_line_text(questionNameNode)
    set_frame_width(questionNameNode, textW)
    questionNameNode?.UIText.horAlignment = TextHorAlignment.Left
    questionNameNode?.UIText.vertAlignment = TextVertAlignment.Top
    questionNameNode?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(questionNameNode, float2(0.0, 0.0))

    questionResponseNode = text("")
    questionResponseNode.name = "questionResponseNode"
    set_text_font_size(questionResponseNode, ui_h(DIALOGUE_BRANCH_RESPONSE_FONT_SIZE))
    set_text_color(questionResponseNode, DIALOGUE_BRANCH_RESPONSE_COLOR)
    apply_dialogue_font(questionResponseNode)
    set_frame_width(questionResponseNode, textW)
    questionResponseNode?.UIText.fontScaling = false
    questionResponseNode?.UIText.autoResizeFrame = true
    questionResponseNode?.UIText.wordWrapping = true
    questionResponseNode?.UIText.horAlignment = TextHorAlignment.Left
    questionResponseNode?.UIText.vertAlignment = TextVertAlignment.Top
    questionResponseNode?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(questionResponseNode, float2(0.0, 0.0))
    questionResponseNode.isActive = false

    questionTextNode = text("")
    questionTextNode.name = "questionTextNode"
    set_text_font_size(questionTextNode, ui_h(QUESTION_FONT_SIZE))
    set_text_color(questionTextNode, DIALOGUE_TEXT_COLOR)
    apply_dialogue_font(questionTextNode)
    set_frame_width(questionTextNode, textW)
    questionTextNode?.UIText.fontScaling = false
    questionTextNode?.UIText.autoResizeFrame = true
    questionTextNode?.UIText.wordWrapping = true
    questionTextNode?.UIText.horAlignment = TextHorAlignment.Left
    questionTextNode?.UIText.vertAlignment = TextVertAlignment.Top
    questionTextNode?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(questionTextNode, float2(0.0, 0.0))

    questionContentNode = vbox([questionNameNode, questionResponseNode, questionTextNode])
    questionContentNode.name = "questionContentNode"
    set_spacing(questionContentNode, ui_h(DIALOGUE_NAME_SPACING))
    set_padding(questionContentNode, float4(padding, padding, padding, padding))
    set_alignment(questionContentNode, LayoutAlignment.TopLeft)
    set_frame_pivot(questionContentNode, float2(0.0, 0.0))

    questionBoxNode = panel(float2(innerW, 80.0), [questionContentNode])
    questionBoxNode.name = "questionBoxNode"
    set_image_color(questionBoxNode, DIALOGUE_BOX_BG_COLOR)
    set_alignment(questionBoxNode, LayoutAlignment.TopLeft)
    set_frame_pivot(questionBoxNode, float2(0.0, 0.0))

    questionBorderNode = panel(float2(dialogueW, 86.0), [questionBoxNode])
    questionBorderNode.name = "questionBorderNode"
    set_image_color(questionBorderNode, UI_BOX_BORDER_COLOR)
    set_alignment(questionBorderNode, LayoutAlignment.TopLeft)
    set_frame_pivot(questionBorderNode, float2(0.0, 0.0))
    set_frame_pos(questionBoxNode, float2(border, border))

    let buttonW = compute_answer_button_width(dialogueW)
    var choiceButtons : array<NodeId>
    for (i in range(MAX_CHOICES)) {
        let btn = create_choice_button("", buttonW)
        choiceButtonNodes[i] = btn
        choiceButtonNodes[i].name = "choiceButton_{i}"
        push(choiceButtons, btn)
    }
    answerRoot = vbox(choiceButtons)
    answerRoot.name = "answerRoot"
    set_spacing(answerRoot, ui_h(ANSWER_SPACING))
    set_alignment(answerRoot, LayoutAlignment.TopLeft)
    set_frame_pivot(answerRoot, float2(0.0, 0.0))
    layout_visible_choice_buttons(dialogueW)

    dialogueRoot = vbox([questionBorderNode, answerRoot])
    dialogueRoot.name = "dialogueRoot"
    set_spacing(dialogueRoot, ui_h(DIALOGUE_ANSWER_SPACING))
    set_alignment(dialogueRoot, LayoutAlignment.TopLeft)
    set_frame_width(dialogueRoot, dialogueW)
    set_parent(dialogueRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(dialogueRoot, float2(0.0, 0.0))
    set_frame_pivot(dialogueRoot, float2(0.0, 0.0))
    set_dialogue_anchor(compute_dialogue_left(), compute_dialogue_top())
    set_image_color(dialogueRoot, float4(0.0, 0.0, 0.0, 0.0))
    apply_question_box_layout(dialogueW)

    hide_dialogue_ui()
}



def public on_choice_0_click(evt : UIMouseEvent) {
    select_choice(0)
}



def public on_choice_1_click(evt : UIMouseEvent) {
    select_choice(1)
}



def public on_choice_2_click(evt : UIMouseEvent) {
    select_choice(2)
}



def public on_choice_3_click(evt : UIMouseEvent) {
    select_choice(3)
}



def public on_choice_4_click(evt : UIMouseEvent) {
    select_choice(4)
}



def public on_choice_0_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 0
    }
}



def public on_choice_1_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 1
    }
}



def public on_choice_2_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 2
    }
}



def public on_choice_3_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 3
    }
}



def public on_choice_4_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 4
    }
}



def public on_choice_0_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 0) {
        hoveredChoice = HOVER_NONE
    }
}



def public on_choice_1_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 1) {
        hoveredChoice = HOVER_NONE
    }
}



def public on_choice_2_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 2) {
        hoveredChoice = HOVER_NONE
    }
}



def public on_choice_3_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 3) {
        hoveredChoice = HOVER_NONE
    }
}



def public on_choice_4_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 4) {
        hoveredChoice = HOVER_NONE
    }
}




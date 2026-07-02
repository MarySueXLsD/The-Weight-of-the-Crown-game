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

module ui_common public

def public ui_box_border() : float {
    return ui_h(UI_BOX_BORDER)
}



def public answer_button_height() : float {
    return ui_h(ANSWER_BUTTON_HEIGHT)
}



def public choice_menu_button_min_height() : float {
    return ui_h(TOP_BAR_PAUSE_BUTTON_HEIGHT)
}



def public measure_choice_menu_button_height(fillNode : NodeId; text : string; buttonOuterWidth : float) : float {
    let border = ui_box_border()
    let innerW = buttonOuterWidth - 2.0 * border
    let minH = choice_menu_button_min_height()
    if (length(text) == 0) {
        return minH
    }
    if (fillNode.isAlive) {
        apply_choice_font(fillNode)
        fillNode?.UIText.fontSize = ui_h(ANSWER_FONT_SIZE)
        fillNode?.UIText.text = text
        fillNode?.UIText.fontScaling = false
        fillNode?.UIText.wordWrapping = true
        fillNode?.UIText.autoResizeFrame = true
        set_frame_width(fillNode, innerW)
        let textH = fillNode?.UIText.size.y
        fillNode?.UIText.autoResizeFrame = false
        if (textH > 0.0) {
            return max(minH, textH)
        }
    }
    return max(minH, estimate_wrapped_text_height(ANSWER_FONT_SIZE, text, innerW))
}



def public compute_character_rest_offset_x() : float {
    return ui_w(CHARACTER_CENTER_DESIGN_X) - screen_w() * 0.5
}



def public apply_default_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    if (is_russian()) {
        node?.UIText.fontId = uiFont
    } else {
        node?.UIText.fontId = FontId()
    }
}



def public apply_ui_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    if (is_russian()) {
        node?.UIText.fontId = uiFont
    } else {
        node?.UIText.fontId = gameFont
    }
}



def public language_button_font_size() : float {
    if (is_russian()) {
        return OPTIONS_CONTROL_FONT_SIZE + 1.0
    }
    return OPTIONS_CONTROL_FONT_SIZE
}



def public apply_language_button_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    // Language names use native scripts (e.g. "Русский"); always use the Cyrillic-capable font.
    node?.UIText.fontId = uiFont
    node?.UIText.fontSize = ui_h(language_button_font_size())
}



def public apply_name_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    if (is_russian()) {
        node?.UIText.fontId = russianDialogueFont
    } else {
        node?.UIText.fontId = gameFont
    }
}



def public apply_plain_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.fontId = FontId()
}



def public set_button_label_text(btnBorderNode : NodeId; buttonText : string) {
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        fill?.UIText.text = buttonText
    }
}



def public refresh_all_localized_ui() {
    refresh_all_ui_fonts()
    refresh_main_menu_button_labels()
    refresh_pause_menu_button_labels()
    refresh_advisor_button_label()
    refresh_options_ui_labels()
    update_day_text()
    if (is_auto_localized_nickname(playerNickname)) {
        if (playerNickname == "The Saint" || playerNickname == "Святоша") {
            playerNickname = nickname_saint()
        } elif (playerNickname == "The Demander" || playerNickname == "Требователь") {
            playerNickname = nickname_demander()
        } else {
            playerNickname = default_nickname()
        }
        update_nickname_text()
    }
    if (characterProfileAnimPhase != PROFILE_ANIM_IDLE) {
        update_character_profile_content(currentCharacterProfileIdx)
        apply_character_profile_layout()
    }
    if (advisorPopupAnimPhase != ADVISOR_ANIM_IDLE) {
        apply_advisor_popup_layout()
        refresh_advisor_action_slots()
    }
    if (pendingAdvisorActionIdx >= 0 && advisorConfirmOverlay.isAlive && advisorConfirmOverlay.isActive) {
        let confirmIdx = pendingAdvisorActionIdx
        advisorConfirmTitleNode?.UIText.text = advisor_confirm_title()
        advisorConfirmBodyNode?.UIText.text = advisor_action_description(confirmIdx)
        advisorConfirmPreviewNode?.UIText.text = format_advisor_action_preview(advisor_action_preview_deltas(confirmIdx))
    }
    if (hoveredInfoTarget != INFO_HOVER_NONE) {
        update_info_tooltip_content()
        apply_info_tooltip_layout()
        position_info_tooltip(hoveredInfoTarget)
    }
    update_death_summary_text()
    refresh_intro_name_text()
    refresh_intro_replica_text()
    refresh_intro_cutscene_skip_text()
    if (introCutsceneSkipRoot.isAlive) {
        apply_intro_cutscene_skip_layout()
    }
    refresh_active_dialogue_text()
}



def public refresh_all_ui_fonts() {
    apply_ui_font(dayTextNode)
    apply_ui_font(nicknameTextNode)
    apply_name_font(questionNameNode)
    apply_dialogue_font(questionTextNode)
    if (questionResponseNode.isAlive) {
        apply_dialogue_font(questionResponseNode)
    }
    apply_dialogue_font(infoTooltipTitleNode)
    apply_dialogue_font(infoTooltipBodyNode)
    apply_dialogue_font(infoTooltipInfluenceHeaderNode)
    apply_dialogue_font(infoTooltipInfluenceBuffNode)
    apply_dialogue_font(infoTooltipInfluenceDebuffNode)
    apply_dialogue_font(infoTooltipActiveHeaderNode)
    apply_dialogue_font(infoTooltipActiveBuffNode)
    apply_dialogue_font(infoTooltipActiveDebuffNode)
    apply_name_font(introCutsceneNameNode)
    apply_dialogue_font(introCutsceneReplicaNode)
    apply_dialogue_font(introCutsceneSkipTextNode)
    apply_ui_font(deathSummaryTextNode)
    apply_ui_font(deathRecordTextNode)
    if (mainMenuOptionsTitleNode.isAlive) {
        apply_ui_font(mainMenuOptionsTitleNode)
    }
    if (mainMenuOptionsVersionTextNode.isAlive) {
        apply_ui_font(mainMenuOptionsVersionTextNode)
    }
    if (mainMenuOptionsMasterLabelNode.isAlive) {
        apply_ui_font(mainMenuOptionsMasterLabelNode)
    }
    if (mainMenuOptionsMusicLabelNode.isAlive) {
        apply_ui_font(mainMenuOptionsMusicLabelNode)
    }
    if (mainMenuOptionsLanguageLabelNode.isAlive) {
        apply_ui_font(mainMenuOptionsLanguageLabelNode)
    }
    if (mainMenuOptionsFullscreenLabelNode.isAlive) {
        apply_ui_font(mainMenuOptionsFullscreenLabelNode)
    }
    if (mainMenuOptionsLanguageEnglishBtn.isAlive) {
        apply_language_button_font(answer_button_fill(mainMenuOptionsLanguageEnglishBtn))
    }
    if (mainMenuOptionsLanguageRussianBtn.isAlive) {
        apply_language_button_font(answer_button_fill(mainMenuOptionsLanguageRussianBtn))
    }
    if (mainMenuOptionsFullscreenToggleNode.isAlive) {
        apply_ui_font(answer_button_fill(mainMenuOptionsFullscreenToggleNode))
    }
    for (i in range(MAIN_MENU_BUTTON_COUNT)) {
        let fill = answer_button_fill(mainMenuButtonNodes[i])
        if (fill.isAlive) {
            apply_ui_font(fill)
        }
    }
    if (menuButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(menuButtonNode))
    }
    if (advisorButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(advisorButtonNode))
    }
    if (menuContinueButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(menuContinueButtonNode))
    }
    if (menuOptionsButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(menuOptionsButtonNode))
    }
    if (menuExitButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(menuExitButtonNode))
    }
    if (mainMenuOptionsBackButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(mainMenuOptionsBackButtonNode))
    }
    if (characterProfileOkayButtonNode.isAlive) {
        apply_default_font(answer_button_fill(characterProfileOkayButtonNode))
    }
    if (tryAgainButtonNode.isAlive) {
        apply_default_font(answer_button_fill(tryAgainButtonNode))
    }
    apply_ui_font(characterProfileTitleNode)
    apply_ui_font(advisorPopupTitleNode)
    apply_ui_font(advisorPopupStatusNode)
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (advisorActionTitleNodes[i].isAlive) {
            apply_ui_font(advisorActionTitleNodes[i])
        }
        if (advisorActionDescNodes[i].isAlive) {
            apply_ui_font(advisorActionDescNodes[i])
        }
        if (advisorActionEffectMinusNodes[i].isAlive) {
            apply_ui_font(advisorActionEffectMinusNodes[i])
        }
        if (advisorActionEffectPlusNodes[i].isAlive) {
            apply_ui_font(advisorActionEffectPlusNodes[i])
        }
        if (advisorActionEffectEmptyNodes[i].isAlive) {
            apply_ui_font(advisorActionEffectEmptyNodes[i])
        }
    }
    if (advisorConfirmTitleNode.isAlive) {
        apply_ui_font(advisorConfirmTitleNode)
    }
    if (advisorConfirmBodyNode.isAlive) {
        apply_ui_font(advisorConfirmBodyNode)
    }
    if (advisorConfirmPreviewNode.isAlive) {
        apply_ui_font(advisorConfirmPreviewNode)
    }
    apply_dialogue_font(characterProfileDescBesideNode)
    apply_dialogue_font(characterProfileDescBelowNode)
    apply_plain_font(characterProfileLikesNode)
    apply_plain_font(characterProfileDislikesNode)
    for (i in range(MAX_CHOICES)) {
        let fill = answer_button_fill(choiceButtonNodes[i])
        if (fill.isAlive) {
            apply_choice_font(fill)
        }
    }
}



def public sync_button_label_frame(btnNode : NodeId; labelSize : float2) {
    if (!btnNode.isAlive) {
        return
    }
    set_frame_size(btnNode, labelSize)
    btnNode?.UIText.size = labelSize
    btnNode?.UIText.localPosition2D = float2(0.0, 0.0)
}



def public configure_button_text_layout(btnNode : NodeId; wordWrap : bool) {
    btnNode?.UIText.fontScaling = false
    btnNode?.UIText.autoResizeFrame = false
    btnNode?.UIText.wordWrapping = wordWrap
    btnNode?.UIText.horAlignment = TextHorAlignment.Center
    btnNode?.UIText.vertAlignment = TextVertAlignment.Middle
    btnNode?.UIText.pivot = float2(0.0, 0.0)
}



def public configure_royal_button_text(btnNode : NodeId) {
    apply_ui_font(btnNode)
    configure_button_text_layout(btnNode, false)
}



def public configure_body_button_text(btnNode : NodeId) {
    configure_button_text_layout(btnNode, true)
}



def public create_menu_button(buttonText : string; buttonOuterWidth : float = -1.0; innerHeight : float = -1.0; useRoyalFont : bool = true; fontSizeDesign : float = -1.0) : NodeId {
    let border = ui_box_border()
    let outerW = (buttonOuterWidth > 0.0) ? buttonOuterWidth : ui_w(120.0)
    let btnH = (innerHeight > 0.0) ? innerHeight : ui_h(52.0)
    let innerW = outerW - 2.0 * border
    let labelSize = (fontSizeDesign > 0.0) ? fontSizeDesign : ((useRoyalFont) ? MENU_BUTTON_FONT_SIZE : ANSWER_FONT_SIZE)
    let fillNode = panel(float2(innerW, btnH), [])
    fillNode.name = "btn_{buttonText}_fill"
    set_frame_pivot(fillNode, float2(0.0, 0.0))
    set_image_color(fillNode, ANSWER_BUTTON_COLOR)
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = buttonText,
        fontSize = ui_h(labelSize),
        color = TEXT_COLOR
    ))
    sync_button_label_frame(fillNode, float2(innerW, btnH))
    if (useRoyalFont) {
        configure_royal_button_text(fillNode)
    } else {
        configure_body_button_text(fillNode)
    }

    let outerH = btnH + 2.0 * border
    let borderNode = panel(float2(outerW, outerH), [fillNode])
    borderNode.name = "btn_{buttonText}"
    set_frame_pivot(borderNode, float2(0.5, 0.5))
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}



def public create_pause_menu_button(buttonText : string; enabled : bool; buttonOuterWidth : float; innerHeight : float; useRoyalFont : bool = true; fontSizeDesign : float = -1.0) : NodeId {
    let borderNode = create_menu_button(buttonText, buttonOuterWidth, innerHeight, useRoyalFont, fontSizeDesign)
    let fill = answer_button_fill(borderNode)
    if (fill.isAlive) {
        set_ui_button_interactable(fill, enabled)
        if (!enabled) {
            set_image_color(fill, MENU_DISABLED_BUTTON_COLOR)
            fill?.UIText.color = MENU_DISABLED_TEXT_COLOR
        }
    }
    return borderNode
}



def public move_toward(current, target : float; maxDelta : float) : float {
    if (current < target) {
        return min(current + maxDelta, target)
    }
    return max(current - maxDelta, target)
}



def public answer_button_fill(btnBorderNode : NodeId) : NodeId {
    if (!btnBorderNode.isAlive) {
        return NodeId()
    }
    return get_child(btnBorderNode, 0)
}



def public set_ui_button_interactable(fillNode : NodeId; interactable : bool) {
    if (!fillNode.isAlive) {
        return
    }
    get_component(fillNode) $(var btn : UIButton?) {
        btn.interactable = interactable
    }
}



def public compute_answer_button_width(dialogueW : float) : float {
    return dialogueW
}



def public configure_choice_menu_button_text(btnNode : NodeId) {
    configure_answer_button_text(btnNode)
}



def public layout_choice_button(btnBorderNode : NodeId; buttonOuterWidth : float; innerHeight : float) {
    apply_menu_button_layout(btnBorderNode, buttonOuterWidth, innerHeight, ANSWER_FONT_SIZE, false, float2(0.0, 0.0))
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        configure_choice_menu_button_text(fill)
    }
}



def public create_choice_button(buttonText : string; buttonWidth : float) : NodeId {
    return create_menu_button(buttonText, buttonWidth, choice_menu_button_min_height(), false, ANSWER_FONT_SIZE)
}



def public apply_main_menu_button_visual(btnBorderNode : NodeId; hoverT : float; enabled : bool) {
    if (!btnBorderNode.isAlive) {
        return
    }
    let fill : NodeId = answer_button_fill(btnBorderNode)
    if (!fill.isAlive) {
        return
    }
    set_ui_button_interactable(fill, enabled)
    if (!enabled) {
        set_image_color(fill, MAIN_MENU_DISABLED_BUTTON_COLOR)
        fill?.UIText.color = MENU_DISABLED_TEXT_COLOR
        return
    }
    fill?.UIText.color = TEXT_COLOR
    let scale = lerp(1.0, ANSWER_HOVER_SCALE, hoverT)
    btnBorderNode.localScale = float3(scale, scale, 1.0)
    fill.localScale = float3(1.0, 1.0, 1.0)
    var col = lerp(MAIN_MENU_BUTTON_COLOR, MAIN_MENU_BUTTON_HOVER_COLOR, hoverT)
    col.w = lerp(ANSWER_BUTTON_IDLE_ALPHA, ANSWER_HOVER_ALPHA, hoverT)
    set_image_color(fill, col)
}



def public set_node_ui_texture(node : NodeId; tex : TextureId) {
    if (!node.isAlive) {
        return
    }
    get_component(node) $(var img : UIImage?) {
        img.textureId = tex
    }
}



def public set_node_ui_image_size(node : NodeId; size : float2) {
    if (!node.isAlive) {
        return
    }
    get_component(node) $(var img : UIImage?) {
        img.size = size
    }
}



def public set_node_ui_image_pivot(node : NodeId; pivot : float2) {
    if (!node.isAlive) {
        return
    }
    get_component(node) $(var img : UIImage?) {
        img.pivot = pivot
    }
}



def public set_node_ui_uv_region(node : NodeId; region : float4) {
    if (!node.isAlive) {
        return
    }
    get_component(node) $(var img : UIImage?) {
        img.uvRegion = region
    }
}



def public pack_pixel_rgba(r, g, b, a : int) : uint {
    return (uint(a) << 24u) | (uint(r) << 16u) | (uint(g) << 8u) | uint(b)
}



def public smoothstep_f(edge0, edge1, x : float) : float {
    let t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0)
    return t * t * (3.0 - 2.0 * t)
}



def public frac_f(x : float) : float {
    return x - floor(x)
}



def public menu_button_texture_declaration() : TextureDeclaration {
    return TextureDeclaration(
        filter = TextureFilter.Bilinear,
        addressing = TextureAddress.Clamp,
        generateMipLevels = false
    )
}



def public create_menu_button_shine_texture() : TextureId {
    let w = 32
    let h = 64
    var bmp <- Bitmap(w, h)
    bmp.pixels |> resize(w * h)
    for (y in range(h)) {
        let v = float(y) / float(h - 1)
        let vFade = saturate(1.0 - abs(v - 0.5) * 1.35)
        for (x in range(w)) {
            let u = float(x) / float(w - 1)
            let band = smoothstep_f(0.0, 0.18, u) * (1.0 - smoothstep_f(0.18, 0.75, u))
            let a = band * vFade
            let alpha = int(clamp(a * 255.0, 0.0, 255.0))
            bmp.pixels[y * w + x] = pack_pixel_rgba(255, 248, 220, alpha)
        }
    }
    return create_texture(bmp, menu_button_texture_declaration())
}



def public setup_main_menu_button_decoration(borderNode : NodeId; buttonIdx : int) {
    let fill : NodeId = answer_button_fill(borderNode)
    if (!fill.isAlive) {
        return
    }
    let shineNode = panel(float2(32.0, 32.0), [])
    shineNode.name = "mainMenuButtonShine_{buttonIdx}"
    set_node_ui_texture(shineNode, menuButtonShineTexture)
    set_image_color(shineNode, MENU_BUTTON_SHINE_COLOR)
    set_frame_pivot(shineNode, float2(0.0, 0.0))
    set_node_ui_image_pivot(shineNode, float2(0.0, 0.0))
    set_parent(shineNode, fill, AddChildStrategy.KeepLocalTransform)
    set_frame_pos(shineNode, float2(0.0, 0.0))
    mainMenuButtonShineNodes[buttonIdx] = shineNode
}



def public main_menu_background_zoom_scale() : float {
    let phase = sin(mainMenuDecorTime * PI * 2.0 / MAIN_MENU_BACKGROUND_ZOOM_CYCLE)
    return lerp(MAIN_MENU_BACKGROUND_ZOOM_MIN, MAIN_MENU_BACKGROUND_ZOOM_MAX, (phase + 1.0) * 0.5)
}



def public apply_main_menu_background_zoom() {
    if (!mainMenuBackgroundZoomRoot.isAlive) {
        return
    }
    let scale = main_menu_background_zoom_scale()
    mainMenuBackgroundZoomRoot.localScale = float3(scale, scale, 1.0)
}



def public update_main_menu_button_shine(buttonIdx : int; innerW : float; innerH : float; hoverT : float; enabled : bool) {
    let shine : NodeId = mainMenuButtonShineNodes[buttonIdx]
    if (!shine.isAlive) {
        return
    }
    if (!enabled) {
        set_image_color(shine, float4(MENU_BUTTON_SHINE_COLOR.x, MENU_BUTTON_SHINE_COLOR.y, MENU_BUTTON_SHINE_COLOR.z, 0.0))
        return
    }
    set_frame_size(shine, float2(innerW, innerH))
    set_node_ui_image_size(shine, float2(innerW, innerH))
    set_frame_pos(shine, float2(0.0, 0.0))
    let cycleLen = MENU_BUTTON_SHINE_SWEEP_DURATION + MENU_BUTTON_SHINE_PAUSE_DURATION
    let cycleT = frac_f((mainMenuDecorTime + float(buttonIdx) * 0.37) / cycleLen) * cycleLen
    if (cycleT >= MENU_BUTTON_SHINE_SWEEP_DURATION) {
        set_image_color(shine, float4(MENU_BUTTON_SHINE_COLOR.x, MENU_BUTTON_SHINE_COLOR.y, MENU_BUTTON_SHINE_COLOR.z, 0.0))
        return
    }
    let sweepT = cycleT / MENU_BUTTON_SHINE_SWEEP_DURATION
    let uOff = lerp(MENU_BUTTON_SHINE_UV_START, MENU_BUTTON_SHINE_UV_END, sweepT)
    set_node_ui_uv_region(shine, float4(uOff, 0.0, 1.0, 1.0))
    let shineAlpha = MENU_BUTTON_SHINE_COLOR.w * lerp(1.0, 1.0 + MENU_BUTTON_SHINE_HOVER_BOOST, hoverT)
    set_image_color(shine, float4(MENU_BUTTON_SHINE_COLOR.x, MENU_BUTTON_SHINE_COLOR.y, MENU_BUTTON_SHINE_COLOR.z, shineAlpha))
}



def public layout_centered_answer_button(btnBorderNode : NodeId; buttonWidth : float) {
    let border = ui_box_border()
    let btnH = answer_button_height()
    let innerW = buttonWidth - 2.0 * border
    let outerH = btnH + 2.0 * border
    set_frame_size(btnBorderNode, float2(buttonWidth, outerH))
    set_frame_pivot(btnBorderNode, float2(0.5, 0.5))
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        set_frame_pivot(fill, float2(0.0, 0.0))
        set_frame_pos(fill, float2(border, border))
        sync_button_label_frame(fill, float2(innerW, btnH))
    }
}



def public configure_single_line_text(node : NodeId) {
    node?.UIText.fontScaling = false
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = false
}



def public configure_info_hover_target(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    add_component(node, new UIButton())
}



def public set_anchor_insets(node : NodeId; left : float = 0.0; top : float = 0.0) {
    get_component(node) $(var anchor : UIAnchor?) {
        anchor.left = left
        anchor.top = top
    }
}



def public configure_answer_button_text(btnNode : NodeId) {
    configure_body_button_text(btnNode)
    btnNode?.UIText.vertAlignment = TextVertAlignment.Top
    apply_choice_font(btnNode)
}



def public create_answer_button(buttonText : string; buttonWidth : float) : NodeId {
    let border = ui_box_border()
    let btnH = answer_button_height()
    let innerW = buttonWidth - 2.0 * border
    let fillSize = float2(innerW, btnH)
    let fillNode = panel(fillSize, [])
    fillNode.name = "answerBtn_{buttonText}_fill"
    set_frame_pivot(fillNode, float2(0.0, 0.0))
    set_image_color(fillNode, ANSWER_BUTTON_COLOR)
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = buttonText,
        fontSize = ui_h(ANSWER_FONT_SIZE),
        color = TEXT_COLOR
    ))
    sync_button_label_frame(fillNode, fillSize)
    configure_answer_button_text(fillNode)

    let outerH = btnH + 2.0 * border
    let borderNode = panel(float2(buttonWidth, outerH), [fillNode])
    borderNode.name = "answerBtn_{buttonText}"
    set_frame_pivot(borderNode, float2(0.0, 0.0))
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}



def public try_again_button_height() : float {
    return answer_button_height() + 2.0 * ui_box_border()
}



def public set_frame_width(node : NodeId; width : float) {
    get_component(node) $(var frame : UIFrame?) {
        frame.size = float2(width, frame.size.y)
    }
}




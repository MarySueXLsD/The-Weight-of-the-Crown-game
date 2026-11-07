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
require scripts/das/arcs/arc_effects
require scripts/das/gameplay/advisor_actions
require scripts/das/localization/localization public
require scripts/das/localization/localization_dialogue public
require scripts/das/core/dialogue_ids
require scripts/das/gameplay/game_save
require scripts/das/ui/ui_state
require scripts/das/ui/ui_flow
require scripts/das/ui/juice
require scripts/das/ui/ui_theme

module game_ui public

let public {
    REIGN_MILESTONE_INTERVAL = 30
    JUICE_DANGER_STAT_THRESHOLD = 20.0
    OPTIONS_SAVE_FORMAT = 3
    STAT_ICON_TINT_ALPHA = 0.15
    BUTTON_LABEL_DROP = 0.09
    ADVISOR_CHIP_ICON_SCALE = 1.75
    TOP_INFO_CHIP_COUNT = 4
    TOP_INFO_CENTER_X = 700.0
    TOP_INFO_CENTER_WIDTH = 400.0
    TOP_INFO_CHIPS_START_X = 908.0
    TOP_INFO_CHIP_WIDTH = 196.0
    TOP_INFO_LABEL_FONT_SIZE = 20.0
    TOP_INFO_VALUE_FONT_SIZE = 27.0
    TOP_INFO_REFRESH_SECONDS = 0.25
    REIGN_TOTAL_DAYS = 365
    REIGN_SEASON_DAYS = 92
    MENU_TITLE_FONT_SIZE = 84.0
    MENU_RECORD_FONT_SIZE = 32.0
    CELEBRATION_NONE = 0
    CELEBRATION_MILESTONE = 1
    CELEBRATION_RECORD = 2
}

var private optionsSliderSyncing = false
var private optionsSliderRedrawFrames = 0
var private splashBackLayerNode : NodeId
var private splashFrontLayerNode : NodeId
var private introSkipPlateNode : NodeId
var private introSkipHeadNode : NodeId
var private introSkipSparkTimer = 0.0
var private introSkipSawInput = false
var private introSkipHintLive = false
var private menuTitleNode : NodeId
var private menuTitleShadowNode : NodeId
var private menuTitleRuleNode : NodeId
var private menuRecordNode : NodeId
var private statPlateNode : NodeId
var private topInfoCenterTextNode : NodeId
var private topInfoProgressTrackNode : NodeId
var private topInfoProgressFillNode : NodeId
var private topInfoChipLabelNodes : NodeId[TOP_INFO_CHIP_COUNT]
var private topInfoChipValueNodes : NodeId[TOP_INFO_CHIP_COUNT]
var private topInfoChipRuleNodes : NodeId[TOP_INFO_CHIP_COUNT]
var private topInfoRefreshTimer = 0.0
var private choiceCursorNodes : NodeId[MAX_CHOICES]
var private choiceCursorTime = 0.0
var private statOutlineTextures : TextureId[STAT_COUNT]
var private characterEnterStartX = 0.0
var private characterEnterT = 0.0
var private deathScreenMotionT = 0.0
var private introKenBurnsNodes : array<NodeId>
var private introKenBurnsBase : array<float4>
var private introKenBurnsTex : array<TextureId>
var private introKenBurnsAge : array<float>
var private introKenBurnsDir : array<float>
var private introKenBurnsFlip = 1.0
var private tryAgainHovered = false
var private aboutOverlayNode : NodeId
var private aboutPanelNode : NodeId
var private aboutRibbonNode : NodeId
var private aboutTitleNode : NodeId
var private aboutRuleNode : NodeId
var private aboutBodyNode : NodeId
var private aboutCreditsNode : NodeId
var private aboutCloseNode : NodeId
var private aboutCloseHovered = false
var private aboutCloseHoverT = 0.0
var private aboutOpenT = 0.0
var private aboutOpen = false
var private statIntroPopupStatIdx = -1
var private statPopupOverlayNode : NodeId
var private statPopupPanelNode : NodeId
var private statPopupRibbonNode : NodeId
var private statPopupTitleNode : NodeId
var private statPopupIconNode : NodeId
var private statPopupLeadNode : NodeId
var private statPopupBodyNode : NodeId
var private statPopupButtonNode : NodeId
var private statPopupButtonHovered = false
var private statPopupButtonHoverT = 0.0
var private statPopupOpenT = 0.0
var private juiceLastHoveredChoice = -1
var private juicePendingCelebration = CELEBRATION_NONE
var private optionsReduceEffectsToggleNode : NodeId
var private optionsReduceEffectsLabelNode : NodeId

// ----- ui_common -----
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
    juice_apply_fonts()
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
        apply_ui_font(answer_button_fill(characterProfileOkayButtonNode))
    }
    if (tryAgainButtonNode.isAlive) {
        apply_ui_font(answer_button_fill(tryAgainButtonNode))
    }
    apply_ui_font(characterProfileTitleNode)
    apply_ui_font(advisorPopupTitleNode)
    apply_ui_font(advisorPopupStatusNode)
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (advisorActionTitleNodes[i].isAlive) {
            apply_ui_font(advisorActionTitleNodes[i])
        }
        if (advisorActionDescNodes[i].isAlive) {
            apply_dialogue_font(advisorActionDescNodes[i])
        }
        if (advisorActionEffectMinusNodes[i].isAlive) {
            apply_dialogue_font(advisorActionEffectMinusNodes[i])
        }
        if (advisorActionEffectPlusNodes[i].isAlive) {
            apply_dialogue_font(advisorActionEffectPlusNodes[i])
        }
        if (advisorActionEffectEmptyNodes[i].isAlive) {
            apply_dialogue_font(advisorActionEffectEmptyNodes[i])
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
    apply_dialogue_font(characterProfileLikesNode)
    apply_dialogue_font(characterProfileDislikesNode)
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
    btnNode?.UIText.localPosition2D = float2(0.0, max(1.0, labelSize.y * BUTTON_LABEL_DROP))
}



def public configure_button_text_layout(btnNode : NodeId; wordWrap : bool) {
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
    theme_style_button_shape(borderNode, fillNode)
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
        theme_apply_disabled_button(fill)
        return
    }
    let scale = lerp(1.0, ANSWER_HOVER_SCALE, hoverT)
    btnBorderNode.localScale = float3(scale, scale, 1.0)
    fill.localScale = float3(1.0, 1.0, 1.0)
    theme_apply_dark_button(fill, hoverT)
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
    theme_style_button_shape(borderNode, fillNode)
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


// ----- game_audio -----
def public background_music_base_volume() : float {
    if (screenPhase == SCREEN_MAIN_MENU) {
        return BACKGROUND_MUSIC_MENU_VOLUME
    }
    return BACKGROUND_MUSIC_GAME_VOLUME
}



def public background_music_target_volume() : float {
    return background_music_base_volume() * settingsMusicVolume * juice_master_volume()
}



def public load_intro_cutscene_music() {
    if (introCutsceneMusicLoaded) {
        return
    }
    introCutsceneMusicSound = request_sound(INTRO_CUTSCENE_MUSIC_PATH)
    introCutsceneMusicLoaded = true
}



def public should_play_intro_cutscene_music() : bool {
    if (!is_new_game_intro_cutscene_active()) {
        return false
    }
    return introCutscenePhase != INTRO_FADE_OUT && introCutscenePhase != INTRO_UNFADE
}



def public sync_intro_cutscene_music() {
    let wantMusic = should_play_intro_cutscene_music()
    if (wantMusic) {
        if (!introCutsceneMusicDesired) {
            introCutsceneMusicDesired = true
            fade_in_intro_cutscene_music()
        }
    } elif (introCutsceneMusicDesired) {
        introCutsceneMusicDesired = false
        fade_out_intro_cutscene_music()
    }
}



def public load_background_music() {
    if (backgroundMusicLoaded) {
        return
    }
    backgroundMusicSound = request_sound(BACKGROUND_MUSIC_PATH)
    backgroundMusicLoaded = true
}



def public should_play_startup_splash_music() : bool {
    if (startupSplashPhase == SPLASH_FADE_IN_MENU) {
        return true
    }
    if (startupSplashPhase == SPLASH_NONE) {
        return false
    }
    return splash_seconds_until_menu_fade_in() <= SPLASH_MUSIC_BEFORE_MENU
}



def public should_play_background_music() : bool {
    if (is_intro_cutscene_active()) {
        if (is_new_game_intro_cutscene_active() && (introCutscenePhase == INTRO_FADE_OUT || introCutscenePhase == INTRO_UNFADE)) {
            return true
        }
        return false
    }
    if (is_continue_fade_active()) {
        return false
    }
    if (is_startup_splash_active()) {
        return should_play_startup_splash_music()
    }
    return screenPhase == SCREEN_MAIN_MENU || screenPhase == SCREEN_PLAYING
}



def public fade_in_background_music() {
    load_background_music()
    if (!valid(backgroundMusicHandle) || !is_playing(backgroundMusicHandle)) {
        backgroundMusicHandle = play_sound_loop(backgroundMusicSound)
        set_volume(backgroundMusicHandle, 0.0, 0.0)
    }
    set_volume(backgroundMusicHandle, background_music_target_volume(), BACKGROUND_MUSIC_FADE_DURATION)
}



def public fade_out_background_music() {
    if (!valid(backgroundMusicHandle) || !is_playing(backgroundMusicHandle)) {
        return
    }
    stop(backgroundMusicHandle, BACKGROUND_MUSIC_FADE_DURATION)
}



def public sync_background_music() {
    let wantMusic = should_play_background_music()
    let context = (wantMusic ? screenPhase : -1)
    if (wantMusic) {
        if (!backgroundMusicDesired || context != backgroundMusicContext) {
            backgroundMusicDesired = true
            backgroundMusicContext = context
            fade_in_background_music()
        }
    } elif (backgroundMusicDesired) {
        backgroundMusicDesired = false
        backgroundMusicContext = -1
        fade_out_background_music()
    }
}



def public load_intro_battle_sfx() {
    if (introBattleSfxLoaded) {
        return
    }
    introWarHornSound = request_sound(INTRO_WAR_HORN_PATH)
    introSwordFightSound = request_sound(INTRO_SWORD_FIGHT_PATH)
    introBattleSfxLoaded = true
}


// ----- menus -----
def public toggle_menu() {
    if (is_pause_menu_open()) {
        close_pause_menu()
    } elif (!is_character_profile_open() && !is_advisor_popup_open()) {
        open_pause_menu()
    }
}



def public menu_panel_outer_width() : float {
    if (menuPanelNode.isAlive) {
        return menuPanelNode?.UIFrame.size.x
    }
    return ui_w(MENU_PANEL_WIDTH)
}



def public menu_panel_slide_rest_x() : float {
    return 0.0
}



def public menu_panel_slide_hidden_left_x() : float {
    let panelW = menu_panel_outer_width()
    return -(screen_w() + panelW) * 0.5
}



def public menu_panel_slide_hidden_right_x() : float {
    let panelW = menu_panel_outer_width()
    return (screen_w() + panelW) * 0.5
}



def public menu_panel_slide_speed() : float {
    let travel = screen_w() + ui_w(MENU_PANEL_WIDTH) * 2.0
    return travel / MENU_SLIDE_DURATION
}



def public menu_panel_outer_height() : float {
    if (menuPanelNode.isAlive) {
        return menuPanelNode?.UIFrame.size.y
    }
    let border = ui_box_border()
    let menuPad = ui_h(MENU_PANEL_PADDING)
    let btnH = ui_h(MENU_PANEL_BUTTON_HEIGHT)
    let btnSpacing = ui_h(MENU_PANEL_BUTTON_SPACING)
    return btnH * 3.0 + btnSpacing * 2.0 + menuPad * 2.0 + 2.0 * border
}



def public menu_panel_centered_top_left(slideX : float) : float2 {
    let panelW = menu_panel_outer_width()
    let panelH = menu_panel_outer_height()
    let topLeftX = screen_w() * 0.5 - panelW * 0.5 + slideX
    let topLeftY = screen_h() * 0.5 - panelH * 0.5
    return float2(topLeftX, topLeftY)
}



def public menu_open_amount() : float {
    let x = menuPanelSlideX
    let rest = menu_panel_slide_rest_x()
    let hiddenLeft = menu_panel_slide_hidden_left_x()
    let hiddenRight = menu_panel_slide_hidden_right_x()
    if (x <= rest) {
        let openSpan = rest - hiddenLeft
        if (openSpan <= 0.0) {
            return 0.0
        }
        return clamp((x - hiddenLeft) / openSpan, 0.0, 1.0)
    }
    let closeSpan = hiddenRight - rest
    if (closeSpan <= 0.0) {
        return 0.0
    }
    return clamp(1.0 - (x - rest) / closeSpan, 0.0, 1.0)
}



def public apply_menu_overlay_from_open_amount() {
    if (!menuOverlay.isAlive) {
        return
    }
    let alpha = menu_open_amount() * MENU_OVERLAY_COLOR.w
    set_image_color(menuOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, alpha))
}



def public update_menu_slide(dt : float) {
    if (menuAnimPhase == MENU_ANIM_IDLE) {
        return
    }
    let speed = menu_panel_slide_speed()
    menuPanelSlideX = move_toward(menuPanelSlideX, menuPanelSlideTargetX, speed * dt)
    set_menu_panel_slide_x(menuPanelSlideX)
    apply_menu_overlay_from_open_amount()
    if (menuAnimPhase == MENU_ANIM_OPENING) {
        if (abs(menuPanelSlideX - menuPanelSlideTargetX) < 1.0) {
            menuPanelSlideX = menuPanelSlideTargetX
            set_menu_panel_slide_x(menuPanelSlideX)
            menuAnimPhase = MENU_ANIM_OPEN
            menuOpen = true
        }
        return
    }
    if (menuAnimPhase == MENU_ANIM_CLOSING) {
        if (abs(menuPanelSlideX - menuPanelSlideTargetX) < 1.0) {
            reset_pause_menu_state()
        }
    }
}



def public open_pause_menu() {
    if (is_pause_menu_open() || is_character_profile_open() || is_advisor_popup_open() || is_in_defeat_flow()) {
        return
    }
    hide_info_tooltip()
    menuAnimPhase = MENU_ANIM_OPENING
    menuOpen = false
    menuPanelSlideX = menu_panel_slide_hidden_left_x()
    menuPanelSlideTargetX = menu_panel_slide_rest_x()
    menuOverlay.isActive = true
    menuPanelNode.isActive = true
    set_menu_panel_slide_x(menuPanelSlideX)
    apply_menu_overlay_from_open_amount()
}



def public close_pause_menu() {
    if (menuAnimPhase == MENU_ANIM_IDLE || menuAnimPhase == MENU_ANIM_CLOSING) {
        return
    }
    menuAnimPhase = MENU_ANIM_CLOSING
    menuOpen = false
    menuPanelSlideTargetX = menu_panel_slide_hidden_right_x()
}



def public reset_pause_menu_state() {
    menuAnimPhase = MENU_ANIM_IDLE
    menuOpen = false
    menuPanelSlideX = menu_panel_slide_hidden_left_x()
    menuPanelSlideTargetX = menu_panel_slide_rest_x()
    menuContinueButtonHovered = false
    menuContinueButtonHoverT = 0.0
    menuExitButtonHovered = false
    menuExitButtonHoverT = 0.0
    if (menuOverlay.isAlive) {
        menuOverlay.isActive = false
        set_image_color(menuOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    }
    if (menuPanelNode.isAlive) {
        menuPanelNode.isActive = false
        set_menu_panel_slide_x(menuPanelSlideX)
    }
    if (menuContinueButtonNode.isAlive) {
        apply_menu_button_visual(menuContinueButtonNode, 0.0, true)
    }
    if (menuExitButtonNode.isAlive) {
        apply_menu_button_visual(menuExitButtonNode, 0.0, true)
    }
}



def public options_language_locale(idx : int) : string {
    if (idx == 1) {
        return "ru"
    }
    return "en"
}



def public apply_settings_master_volume(vol : float) {
    strudel_volume(vol)
    apply_settings_music_volume(settingsMusicVolume)
}



def public apply_settings_music_volume(vol : float) {
    if (valid(backgroundMusicHandle) && is_playing(backgroundMusicHandle)) {
        set_volume(backgroundMusicHandle, background_music_target_volume(), BACKGROUND_MUSIC_FADE_DURATION)
    }
    if (valid(introCutsceneMusicHandle) && is_playing(introCutsceneMusicHandle)) {
        set_volume(introCutsceneMusicHandle, intro_cutscene_music_target_volume(), BACKGROUND_MUSIC_FADE_DURATION)
    }
}



def public apply_settings_locale(idx : int) {
    settingsLanguageIdx = clamp(idx, 0, OPTIONS_LANGUAGE_COUNT - 1)
    refresh_all_localized_ui()
}



def public apply_settings_fullscreen(enabled : bool) {
    exec_cheat("app.mcp_call", "set_fullscreen", enabled)
}



def public quit_application() {
    save_game_options()
    exec_cheat("app.mcp_call", "game_play", false)
}



def public save_game_options() {
    var storage : GenericStorage
    set(storage, "format", OPTIONS_SAVE_FORMAT)
    set(storage, "master", settingsMasterVolume)
    set(storage, "music", settingsMusicVolume)
    set(storage, "fullscreen", settingsFullscreen)
    set(storage, "reduceEffects", juiceReduceEffects)
    set(storage, "language", settingsLanguageIdx)
    save_storage(storage, OPTIONS_STORAGE_KEY)
}



def public load_game_options() {
    load_storage(OPTIONS_STORAGE_KEY) $(var storage : GenericStorage#) {
        settingsMasterVolume = get_or(storage, "master", 1.0)
        settingsMusicVolume = get_or(storage, "music", 1.0)
        if (get_or(storage, "format", 0) < OPTIONS_SAVE_FORMAT) {
            if (settingsMasterVolume <= 0.0) {
                settingsMasterVolume = 1.0
            }
            if (settingsMusicVolume <= 0.0) {
                settingsMusicVolume = 1.0
            }
        }
        settingsFullscreen = get_or(storage, "fullscreen", false)
        juiceReduceEffects = get_or(storage, "reduceEffects", false)
        settingsLanguageIdx = clamp(get_or(storage, "language", OPTIONS_DEFAULT_LANGUAGE_IDX), 0, OPTIONS_LANGUAGE_COUNT - 1)
    }
    apply_settings_master_volume(settingsMasterVolume)
    apply_settings_music_volume(settingsMusicVolume)
    if (OPTIONS_FULLSCREEN_ENABLED) {
        apply_settings_fullscreen(settingsFullscreen)
    } else {
        settingsFullscreen = false
    }
    apply_settings_locale(settingsLanguageIdx)
}



def public options_label_font_size() : float {
    if (is_russian()) {
        return OPTIONS_LABEL_FONT_SIZE_RU
    }
    return OPTIONS_LABEL_FONT_SIZE
}



def public options_label_width() : float {
    if (is_russian()) {
        return OPTIONS_LABEL_WIDTH_RU
    }
    return OPTIONS_LABEL_WIDTH
}



def public options_control_column_width() : float {
    if (is_russian()) {
        return OPTIONS_SLIDER_WIDTH_RU
    }
    return OPTIONS_SLIDER_WIDTH
}



def public options_control_fill(btnBorderNode : NodeId) : NodeId {
    if (!btnBorderNode.isAlive) {
        return NodeId()
    }
    return get_child(btnBorderNode, 0)
}



def public on_options_language_change(index : int) {
    settingsLanguageIdx = clamp(index, 0, OPTIONS_LANGUAGE_COUNT - 1)
    apply_settings_locale(settingsLanguageIdx)
    update_options_language_button_visuals()
    save_game_options()
}



def public on_options_fullscreen_change(value : bool) {
    if (!OPTIONS_FULLSCREEN_ENABLED) {
        return
    }
    settingsFullscreen = value
    apply_settings_fullscreen(value)
    update_options_fullscreen_toggle_visual()
    save_game_options()
}



def public main_menu_options_panel_outer_width() : float {
    if (mainMenuOptionsPanelNode.isAlive) {
        return mainMenuOptionsPanelNode?.UIFrame.size.x
    }
    return ui_w(OPTIONS_PANEL_WIDTH)
}



def public main_menu_options_panel_outer_height() : float {
    if (mainMenuOptionsPanelNode.isAlive) {
        return mainMenuOptionsPanelNode?.UIFrame.size.y
    }
    return compute_main_menu_options_content_height() + 2.0 * ui_box_border()
}



def public main_menu_options_panel_slide_rest_x() : float {
    return 0.0
}



def public main_menu_options_panel_slide_hidden_left_x() : float {
    let panelW = main_menu_options_panel_outer_width()
    return -(screen_w() + panelW) * 0.5
}



def public main_menu_options_panel_slide_hidden_right_x() : float {
    let panelW = main_menu_options_panel_outer_width()
    return (screen_w() + panelW) * 0.5
}



def public main_menu_options_panel_slide_speed() : float {
    let travel = screen_w() + main_menu_options_panel_outer_width() * 2.0
    return travel / MENU_SLIDE_DURATION
}



def public main_menu_options_panel_centered_top_left(slideX : float) : float2 {
    let panelW = main_menu_options_panel_outer_width()
    let panelH = main_menu_options_panel_outer_height()
    let topLeftX = screen_w() * 0.5 - panelW * 0.5 + slideX
    let topLeftY = screen_h() * 0.5 - panelH * 0.5
    return float2(topLeftX, topLeftY)
}



def public main_menu_options_open_amount() : float {
    let x = mainMenuOptionsSlideX
    let rest = main_menu_options_panel_slide_rest_x()
    let hiddenLeft = main_menu_options_panel_slide_hidden_left_x()
    let hiddenRight = main_menu_options_panel_slide_hidden_right_x()
    if (x <= rest) {
        let openSpan = rest - hiddenLeft
        if (openSpan <= 0.0) {
            return 0.0
        }
        return clamp((x - hiddenLeft) / openSpan, 0.0, 1.0)
    }
    let closeSpan = hiddenRight - rest
    if (closeSpan <= 0.0) {
        return 0.0
    }
    return clamp(1.0 - (x - rest) / closeSpan, 0.0, 1.0)
}



def public on_options_master_volume_change(value : float) {
    if (optionsSliderSyncing || !is_main_menu_options_open()) {
        return
    }
    settingsMasterVolume = value
    apply_settings_master_volume(value)
    save_game_options()
}



def public on_options_music_volume_change(value : float) {
    if (optionsSliderSyncing || !is_main_menu_options_open()) {
        return
    }
    settingsMusicVolume = value
    apply_settings_music_volume(value)
    save_game_options()
}



def public build_main_menu_options_ui() {
    let res = float2(get_resolution())
    mainMenuOptionsOverlay = panel(res, [])
    mainMenuOptionsOverlay.name = "mainMenuOptionsOverlay"
    set_parent(mainMenuOptionsOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuOptionsOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_image_color(mainMenuOptionsOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    add_component(mainMenuOptionsOverlay, new UIButton())
    mainMenuOptionsOverlay.isActive = false

    let border = ui_box_border()
    let pad = ui_h(OPTIONS_PANEL_PADDING)
    let panelW = ui_w(OPTIONS_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    let spacing = ui_h(OPTIONS_ROW_SPACING)
    let rowH = ui_h(OPTIONS_ROW_HEIGHT)
    let titleH = ui_h(OPTIONS_TITLE_FONT_SIZE + 12.0)
    let versionH = ui_h(OPTIONS_VERSION_FONT_SIZE + 8.0)
    let btnH = ui_h(OPTIONS_BUTTON_HEIGHT)
    let buttonW = innerW - 2.0 * pad
    let contentH = compute_main_menu_options_content_height()

    mainMenuOptionsTitleNode = text(options_title())
    mainMenuOptionsTitleNode.name = "mainMenuOptionsTitleNode"
    set_text_font_size(mainMenuOptionsTitleNode, ui_h(OPTIONS_TITLE_FONT_SIZE))
    set_text_color(mainMenuOptionsTitleNode, OPTIONS_TEXT_COLOR)
    apply_ui_font(mainMenuOptionsTitleNode)
    mainMenuOptionsTitleNode?.UIText.autoResizeFrame = true
    mainMenuOptionsTitleNode?.UIText.horAlignment = TextHorAlignment.Center
    set_frame_size(mainMenuOptionsTitleNode, float2(innerW - 2.0 * pad, titleH))

    mainMenuOptionsMasterSliderNode = horizontal_slider(@(value : float) {
        on_options_master_volume_change(value)
    })
    mainMenuOptionsMasterSliderNode.name = "mainMenuOptionsMasterSliderNode"
    mainMenuOptionsMusicSliderNode = horizontal_slider(@(value : float) {
        on_options_music_volume_change(value)
    })
    mainMenuOptionsMusicSliderNode.name = "mainMenuOptionsMusicSliderNode"
    init_options_slider(mainMenuOptionsMasterSliderNode, settingsMasterVolume)
    init_options_slider(mainMenuOptionsMusicSliderNode, settingsMusicVolume)
    mainMenuOptionsMasterLabelNode = create_options_label(options_master())
    mainMenuOptionsMasterLabelNode.name = "mainMenuOptionsMasterLabelNode"
    mainMenuOptionsMusicLabelNode = create_options_label(options_music())
    mainMenuOptionsMusicLabelNode.name = "mainMenuOptionsMusicLabelNode"
    let masterRow = create_options_slider_row(mainMenuOptionsMasterLabelNode, mainMenuOptionsMasterSliderNode)
    masterRow.name = "mainMenuOptionsMasterRow"
    let musicRow = create_options_slider_row(mainMenuOptionsMusicLabelNode, mainMenuOptionsMusicSliderNode)
    musicRow.name = "mainMenuOptionsMusicRow"

    let fullscreenRow = create_options_fullscreen_row()
    fullscreenRow.name = "mainMenuOptionsFullscreenRow"
    // A permanently disabled control is noise; show the row only when the option works.
    fullscreenRow.isActive = OPTIONS_FULLSCREEN_ENABLED
    let reduceEffectsRow = create_options_reduce_effects_row()
    mainMenuOptionsLanguageRowNode = create_options_language_row()
    mainMenuOptionsLanguageRowNode.name = "mainMenuOptionsLanguageRowNode"

    mainMenuOptionsVersionTextNode = text(options_version())
    mainMenuOptionsVersionTextNode.name = "mainMenuOptionsVersionTextNode"
    set_text_font_size(mainMenuOptionsVersionTextNode, ui_h(OPTIONS_VERSION_FONT_SIZE))
    set_text_color(mainMenuOptionsVersionTextNode, OPTIONS_TEXT_COLOR)
    apply_ui_font(mainMenuOptionsVersionTextNode)
    mainMenuOptionsVersionTextNode?.UIText.autoResizeFrame = true
    mainMenuOptionsVersionTextNode?.UIText.wordWrapping = false
    mainMenuOptionsVersionTextNode?.UIText.horAlignment = TextHorAlignment.Center
    set_frame_size(mainMenuOptionsVersionTextNode, float2(innerW - 2.0 * pad, versionH))

    mainMenuOptionsBackButtonNode = create_pause_menu_button(menu_back(), true, buttonW, btnH, true, OPTIONS_BUTTON_FONT_SIZE)
    mainMenuOptionsBackButtonNode.name = "mainMenuOptionsBackButtonNode"

    mainMenuOptionsContentNode = vbox([
        mainMenuOptionsTitleNode,
        masterRow,
        musicRow,
        fullscreenRow,
        reduceEffectsRow,
        mainMenuOptionsLanguageRowNode,
        mainMenuOptionsVersionTextNode,
        mainMenuOptionsBackButtonNode
    ])
    mainMenuOptionsContentNode.name = "mainMenuOptionsContentNode"
    set_spacing(mainMenuOptionsContentNode, spacing)
    set_alignment(mainMenuOptionsContentNode, LayoutAlignment.MiddleCenter)
    set_padding(mainMenuOptionsContentNode, float4(pad, pad, pad, pad))
    set_frame_pivot(mainMenuOptionsContentNode, float2(0.0, 0.0))
    set_frame_size(mainMenuOptionsContentNode, float2(innerW, contentH))
    mainMenuOptionsContentNode?.UIVerticalLayout.childForceExpandWidth = true
    mainMenuOptionsContentNode?.UIVerticalLayout.childForceExpandHeight = false

    mainMenuOptionsInnerNode = panel(float2(innerW, contentH), [mainMenuOptionsContentNode])
    mainMenuOptionsInnerNode.name = "mainMenuOptionsInnerNode"
    set_image_color(mainMenuOptionsInnerNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(mainMenuOptionsInnerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(mainMenuOptionsInnerNode, float2(0.0, 0.0))

    mainMenuOptionsPanelNode = panel(float2(panelW, contentH + 2.0 * border), [mainMenuOptionsInnerNode])
    mainMenuOptionsPanelNode.name = "mainMenuOptionsPanelNode"
    set_image_color(mainMenuOptionsPanelNode, UI_BOX_BORDER_COLOR)
    set_alignment(mainMenuOptionsPanelNode, LayoutAlignment.TopLeft)
    set_frame_pos(mainMenuOptionsInnerNode, float2(border, border))
    set_frame_pivot(mainMenuOptionsPanelNode, float2(0.0, 0.0))
    set_parent(mainMenuOptionsPanelNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    mainMenuOptionsSlideX = main_menu_options_panel_slide_hidden_left_x()
    set_main_menu_options_slide_x(mainMenuOptionsSlideX)
    mainMenuOptionsPanelNode.isActive = false
}



def public refresh_main_menu_button_labels() {
    refresh_menu_title_text()
    set_button_label_text(mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX], menu_continue())
    set_button_label_text(mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX], menu_new_game())
    set_button_label_text(mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX], menu_options())
    set_button_label_text(mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX], menu_about())
    set_button_label_text(mainMenuButtonNodes[MAIN_MENU_EXIT_IDX], menu_exit())
}



def public refresh_pause_menu_button_labels() {
    set_button_label_text(menuButtonNode, menu_pause())
    set_button_label_text(menuContinueButtonNode, menu_continue())
    set_button_label_text(menuOptionsButtonNode, menu_options())
    set_button_label_text(menuExitButtonNode, menu_exit())
}



def public refresh_advisor_button_label() {
    if (advisorPopupTitleNode.isAlive) {
        advisorPopupTitleNode?.UIText.text = advisor_panel_title()
    }
    set_button_label_text(advisorButtonNode, advisor_bar_button())
}



def public refresh_options_ui_labels() {
    if (optionsReduceEffectsLabelNode.isAlive) {
        optionsReduceEffectsLabelNode?.UIText.text = options_reduce_effects()
        apply_options_label_layout(optionsReduceEffectsLabelNode)
    }
    if (mainMenuOptionsTitleNode.isAlive) {
        mainMenuOptionsTitleNode?.UIText.text = options_title()
    }
    if (mainMenuOptionsMasterLabelNode.isAlive) {
        mainMenuOptionsMasterLabelNode?.UIText.text = options_master()
    }
    if (mainMenuOptionsMusicLabelNode.isAlive) {
        mainMenuOptionsMusicLabelNode?.UIText.text = options_music()
    }
    if (mainMenuOptionsLanguageLabelNode.isAlive) {
        mainMenuOptionsLanguageLabelNode?.UIText.text = options_language()
    }
    if (mainMenuOptionsFullscreenLabelNode.isAlive) {
        mainMenuOptionsFullscreenLabelNode?.UIText.text = options_fullscreen()
    }
    apply_options_rows_layout()
    if (mainMenuOptionsLanguageEnglishBtn.isAlive) {
        set_button_label_text(mainMenuOptionsLanguageEnglishBtn, options_lang_english())
    }
    if (mainMenuOptionsLanguageRussianBtn.isAlive) {
        set_button_label_text(mainMenuOptionsLanguageRussianBtn, options_lang_russian())
    }
    if (mainMenuOptionsBackButtonNode.isAlive) {
        set_button_label_text(mainMenuOptionsBackButtonNode, menu_back())
    }
    if (mainMenuOptionsVersionTextNode.isAlive) {
        mainMenuOptionsVersionTextNode?.UIText.text = options_version()
    }
    if (characterProfileOkayButtonNode.isAlive) {
        set_button_label_text(characterProfileOkayButtonNode, menu_okay())
    }
    if (tryAgainButtonNode.isAlive) {
        set_button_label_text(tryAgainButtonNode, try_again())
    }
}



def public is_choice_button(btnBorderNode : NodeId) : bool {
    for (i in range(MAX_CHOICES)) {
        if (choiceButtonNodes[i] == btnBorderNode) {
            return true
        }
    }
    return false
}



def public is_dark_theme_button(btnBorderNode : NodeId) : bool {
    return (btnBorderNode == menuButtonNode || btnBorderNode == advisorButtonNode
        || btnBorderNode == menuContinueButtonNode || btnBorderNode == menuOptionsButtonNode || btnBorderNode == menuExitButtonNode
        || btnBorderNode == mainMenuOptionsBackButtonNode)
}



def public apply_menu_button_visual(btnBorderNode : NodeId; hoverT : float; enabled : bool) {
    if (!btnBorderNode.isAlive || !enabled) {
        return
    }
    let fill = answer_button_fill(btnBorderNode)
    if (!fill.isAlive) {
        return
    }
    // Choice rows sit near the right edge and grow from their left corner, so they only swell slightly.
    let hoverScale = is_choice_button(btnBorderNode) ? CHOICE_HOVER_SCALE : ANSWER_HOVER_SCALE
    let scale = lerp(1.0, hoverScale, hoverT)
    btnBorderNode.localScale = float3(scale, scale, 1.0)
    fill.localScale = float3(1.0, 1.0, 1.0)
    if (is_dark_theme_button(btnBorderNode)) {
        theme_apply_dark_button(fill, hoverT)
    } elif (is_choice_button(btnBorderNode)) {
        theme_apply_choice_button(fill, hoverT)
    } else {
        theme_apply_light_button(fill, hoverT)
    }
}



def public on_menu_button_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (is_in_defeat_flow()) {
        return
    }
    toggle_menu()
}



def public on_menu_options_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    open_main_menu_options()
}



def public on_menu_continue_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    close_pause_menu()
}



def public on_menu_exit_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_pause_menu_open()) {
        return
    }
    return_to_main_menu()
}



def public on_menu_exit_mouse_over(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    if (is_pause_menu_open()) {
        menuExitButtonHovered = true
    }
}



def public on_menu_exit_mouse_out(evt : UIMouseEvent) {
    menuExitButtonHovered = false
}



def public on_menu_button_mouse_over(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    if (!is_in_defeat_flow()) {
        menuButtonHovered = true
    }
}



def public on_menu_button_mouse_out(evt : UIMouseEvent) {
    menuButtonHovered = false
}



def public on_menu_continue_mouse_over(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    if (is_pause_menu_open()) {
        menuContinueButtonHovered = true
    }
}



def public on_menu_continue_mouse_out(evt : UIMouseEvent) {
    menuContinueButtonHovered = false
}



def public on_menu_overlay_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    close_pause_menu()
}



def public main_menu_button_width() : float {
    let pad = ui_w(MAIN_MENU_BOTTOM_PADDING)
    let spacing = ui_w(MAIN_MENU_BUTTON_SPACING)
    let available = screen_w() - 2.0 * pad - spacing * float(MAIN_MENU_BUTTON_COUNT - 1)
    return max(available / float(MAIN_MENU_BUTTON_COUNT), ui_w(120.0))
}



def public apply_main_menu_layout() {
    if (!mainMenuRoot.isAlive) {
        return
    }
    apply_menu_title_layout()
    let res = float2(get_resolution())
    let barH = ui_h(MAIN_MENU_BOTTOM_BAR_HEIGHT)
    let btnH = ui_h(MAIN_MENU_BUTTON_HEIGHT)
    let btnW = main_menu_button_width()
    let btnSpacing = ui_w(MAIN_MENU_BUTTON_SPACING)
    let rowW = btnW * float(MAIN_MENU_BUTTON_COUNT) + btnSpacing * float(MAIN_MENU_BUTTON_COUNT - 1)
    let rowH = menu_button_outer_height(btnH)

    set_frame_size(mainMenuRoot, res)
    if (mainMenuBackgroundZoomRoot.isAlive) {
        set_frame_size(mainMenuBackgroundZoomRoot, res)
    }
    if (mainMenuBackgroundNode.isAlive) {
        set_frame_size(mainMenuBackgroundNode, res)
        mainMenuBackgroundNode?.UIImage.size = res
        mainMenuBackgroundNode?.UIImage.uvRegion = intro_cover_uv_for(res, mainMenuBackgroundTextureAspect)
    }
    if (mainMenuBottomBarRoot.isAlive) {
        set_frame_size(mainMenuBottomBarRoot, float2(res.x, barH))
    }
    if (mainMenuBottomBarBorderNode.isAlive) {
        set_frame_size(mainMenuBottomBarBorderNode, float2(res.x, ui_box_border()))
    }
    if (mainMenuButtonsRowNode.isAlive) {
        set_spacing(mainMenuButtonsRowNode, btnSpacing)
        set_frame_size(mainMenuButtonsRowNode, float2(rowW, rowH))
    }
    for (i in range(MAIN_MENU_BUTTON_COUNT)) {
        apply_menu_button_layout(mainMenuButtonNodes[i], btnW, btnH, MENU_BUTTON_FONT_SIZE, true, float2(0.5, 0.5))
    }
}



def public on_main_menu_continue_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_on_main_menu() || is_intro_cutscene_active() || !hasSaveGame || is_continue_fade_active()) {
        return
    }
    begin_continue_from_menu()
}



def public on_main_menu_about_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_on_main_menu() || is_intro_cutscene_active() || is_main_menu_options_open()) {
        return
    }
    open_about_panel()
}



def public on_main_menu_new_game_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_on_main_menu() || is_intro_cutscene_active() || is_continue_fade_active()) {
        return
    }
    launch_new_game()
}



def public on_main_menu_options_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_on_main_menu() || is_intro_cutscene_active()) {
        return
    }
    open_main_menu_options()
}



def public on_main_menu_options_overlay_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    close_main_menu_options()
}



def public on_main_menu_options_panel_click(evt : UIMouseEvent) {
    pass
}



def public on_main_menu_options_back_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    close_main_menu_options()
}



def public on_main_menu_options_back_mouse_over(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    if (is_main_menu_options_open()) {
        mainMenuOptionsBackButtonHovered = true
    }
}



def public on_main_menu_options_back_mouse_out(evt : UIMouseEvent) {
    mainMenuOptionsBackButtonHovered = false
}



def public on_main_menu_exit_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_on_main_menu() || is_intro_cutscene_active()) {
        return
    }
    quit_application()
}



def public on_main_menu_button_0_mouse_over(evt : UIMouseEvent) {
    if (is_main_menu_button_enabled(0)) {
        juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    }
    if (is_on_main_menu()) {
        mainMenuButtonHovered[0] = true
    }
}



def public on_main_menu_button_1_mouse_over(evt : UIMouseEvent) {
    if (is_main_menu_button_enabled(1)) {
        juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    }
    if (is_on_main_menu()) {
        mainMenuButtonHovered[1] = true
    }
}



def public on_main_menu_button_2_mouse_over(evt : UIMouseEvent) {
    if (is_main_menu_button_enabled(2)) {
        juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    }
    if (is_on_main_menu()) {
        mainMenuButtonHovered[2] = true
    }
}



def public on_main_menu_button_3_mouse_over(evt : UIMouseEvent) {
    if (is_main_menu_button_enabled(3)) {
        juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    }
    if (is_on_main_menu()) {
        mainMenuButtonHovered[3] = true
    }
}



def public on_main_menu_button_4_mouse_over(evt : UIMouseEvent) {
    if (is_main_menu_button_enabled(4)) {
        juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    }
    if (is_on_main_menu()) {
        mainMenuButtonHovered[4] = true
    }
}



def public on_main_menu_button_0_mouse_out(evt : UIMouseEvent) {
    mainMenuButtonHovered[0] = false
}



def public on_main_menu_button_1_mouse_out(evt : UIMouseEvent) {
    mainMenuButtonHovered[1] = false
}



def public on_main_menu_button_2_mouse_out(evt : UIMouseEvent) {
    mainMenuButtonHovered[2] = false
}



def public on_main_menu_button_3_mouse_out(evt : UIMouseEvent) {
    mainMenuButtonHovered[3] = false
}



def public on_main_menu_button_4_mouse_out(evt : UIMouseEvent) {
    mainMenuButtonHovered[4] = false
}



def public apply_menu_button_layout(btnBorderNode : NodeId; buttonOuterWidth : float; innerHeight : float; fontSizeDesign : float = MENU_BUTTON_FONT_SIZE; useRoyalFont : bool = true; framePivot : float2 = float2(0.5, 0.5)) {
    if (!btnBorderNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let innerW = buttonOuterWidth - 2.0 * border
    let outerH = menu_button_outer_height(innerHeight)
    set_frame_size(btnBorderNode, float2(buttonOuterWidth, outerH))
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        let labelSize = float2(innerW, innerHeight)
        set_frame_pivot(fill, float2(0.0, 0.0))
        set_frame_pos(fill, float2(border, border))
        sync_button_label_frame(fill, labelSize)
        set_text_font_size(fill, ui_h(fontSizeDesign))
        if (useRoyalFont) {
            configure_royal_button_text(fill)
        } else {
            configure_body_button_text(fill)
        }
    }
    set_frame_pivot(btnBorderNode, framePivot)
}



def public apply_menu_layout() {
    if (!menuPanelNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let menuPad = ui_h(MENU_PANEL_PADDING)
    let btnH = ui_h(MENU_PANEL_BUTTON_HEIGHT)
    let btnSpacing = ui_h(MENU_PANEL_BUTTON_SPACING)
    let panelW = ui_w(MENU_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    let buttonW = innerW - 2.0 * menuPad
    let btnOuterH = menu_button_outer_height(btnH)
    let contentH = btnOuterH * 3.0 + btnSpacing * 2.0 + menuPad * 2.0
    let innerH = contentH
    let outerH = innerH + 2.0 * border
    set_frame_size(menuPanelNode, float2(panelW, outerH))
    set_frame_pivot(menuPanelNode, float2(0.0, 0.0))
    set_alignment(menuPanelNode, LayoutAlignment.TopLeft)
    if (menuPanelInnerNode.isAlive) {
        set_frame_size(menuPanelInnerNode, float2(innerW, innerH))
        set_frame_pos(menuPanelInnerNode, float2(border, border))
        set_frame_pivot(menuPanelInnerNode, float2(0.0, 0.0))
        set_alignment(menuPanelInnerNode, LayoutAlignment.TopLeft)
    }
    if (menuPanelContentNode.isAlive) {
        set_spacing(menuPanelContentNode, btnSpacing)
        set_padding(menuPanelContentNode, float4(menuPad, menuPad, menuPad, menuPad))
        set_alignment(menuPanelContentNode, LayoutAlignment.MiddleCenter)
        set_frame_size(menuPanelContentNode, float2(innerW, innerH))
        set_frame_pos(menuPanelContentNode, float2(0.0, 0.0))
        set_frame_pivot(menuPanelContentNode, float2(0.0, 0.0))
        menuPanelContentNode?.UIVerticalLayout.childForceExpandWidth = true
        menuPanelContentNode?.UIVerticalLayout.childForceExpandHeight = false
    }
    apply_menu_button_layout(menuContinueButtonNode, buttonW, btnH)
    apply_menu_button_layout(menuOptionsButtonNode, buttonW, btnH)
    apply_menu_button_layout(menuExitButtonNode, buttonW, btnH)
    if (is_pause_menu_open()) {
        set_menu_panel_slide_x(menuPanelSlideX)
        apply_menu_overlay_from_open_amount()
    }
}


// ----- character_profile -----
def public character_profile_panel_outer_width() : float {
    if (characterProfilePanelNode.isAlive) {
        return characterProfilePanelNode?.UIFrame.size.x
    }
    return ui_w(CHARACTER_PROFILE_PANEL_WIDTH)
}



def public character_profile_panel_slide_rest_x() : float {
    return 0.0
}



def public character_profile_panel_slide_hidden_left_x() : float {
    let panelW = character_profile_panel_outer_width()
    return -(screen_w() + panelW) * 0.5
}



def public character_profile_panel_slide_hidden_right_x() : float {
    let panelW = character_profile_panel_outer_width()
    return (screen_w() + panelW) * 0.5
}



def public character_profile_panel_slide_speed() : float {
    let travel = screen_w() + character_profile_panel_outer_width() * 2.0
    return travel / POPUP_SLIDE_DURATION
}



def public character_profile_panel_outer_height() : float {
    if (characterProfilePanelNode.isAlive) {
        return characterProfilePanelNode?.UIFrame.size.y
    }
    return ui_h(600.0)
}



def public character_profile_panel_centered_top_left(slideX : float) : float2 {
    let panelW = character_profile_panel_outer_width()
    let panelH = character_profile_panel_outer_height()
    let topLeftX = screen_w() * 0.5 - panelW * 0.5 + slideX
    let topLeftY = screen_h() * 0.5 - panelH * 0.5
    return float2(topLeftX, topLeftY)
}



def public character_profile_open_amount() : float {
    let x = characterProfileSlideX
    let rest = character_profile_panel_slide_rest_x()
    let hiddenLeft = character_profile_panel_slide_hidden_left_x()
    let hiddenRight = character_profile_panel_slide_hidden_right_x()
    if (x <= rest) {
        let openSpan = rest - hiddenLeft
        if (openSpan <= 0.0) {
            return 0.0
        }
        return clamp((x - hiddenLeft) / openSpan, 0.0, 1.0)
    }
    let closeSpan = hiddenRight - rest
    if (closeSpan <= 0.0) {
        return 0.0
    }
    return clamp(1.0 - (x - rest) / closeSpan, 0.0, 1.0)
}



def public character_profile_content_text_width(innerW : float) : float {
    let pad = ui_h(CHARACTER_PROFILE_PADDING)
    return innerW - 2.0 * pad
}



def public profile_portrait_size() : float {
    return ui_h(CHARACTER_PROFILE_PORTRAIT_SIZE)
}



def public profile_portrait_width() : float {
    return profile_portrait_size()
}



def public profile_portrait_height() : float {
    return profile_portrait_size()
}



def public profile_portrait_frame_inset() : float {
    return ui_w(CHARACTER_PROFILE_PORTRAIT_INSET)
}



def public profile_portrait_frame_border() : float {
    return ui_w(CHARACTER_PROFILE_PORTRAIT_BORDER)
}



def public profile_portrait_frame_width() : float {
    return profile_portrait_width() + 2.0 * (profile_portrait_frame_inset() + profile_portrait_frame_border())
}



def public profile_portrait_frame_height() : float {
    return profile_portrait_height() + 2.0 * (profile_portrait_frame_inset() + profile_portrait_frame_border())
}



def public profile_text_line_height(fontSize : float) : float {
    if (fontSize == ANSWER_FONT_SIZE) {
        return ui_h(fontSize)
    }
    if (fontSize == CHARACTER_PROFILE_BODY_FONT_SIZE) {
        return ui_h(fontSize * CHARACTER_PROFILE_BODY_LINE_HEIGHT)
    }
    if (fontSize == CHARACTER_PROFILE_TRAIT_FONT_SIZE) {
        return ui_h(fontSize * 1.2)
    }
    return ui_h(fontSize * 1.15)
}



def public profile_text_char_width(fontSize : float) : float {
    if (fontSize == ANSWER_FONT_SIZE) {
        return max(1.0, ui_w(fontSize * ANSWER_FONT_CHAR_WIDTH_RATIO))
    }
    if (fontSize == CHARACTER_PROFILE_BODY_FONT_SIZE) {
        return max(1.0, ui_w(fontSize * CHARACTER_PROFILE_BODY_CHAR_WIDTH))
    }
    if (fontSize == CHARACTER_PROFILE_TRAIT_FONT_SIZE) {
        return max(1.0, ui_w(fontSize * CHARACTER_PROFILE_TRAIT_CHAR_WIDTH))
    }
    return max(1.0, ui_w(fontSize * 0.48))
}



def public profile_text_frame_height(node : NodeId; text : string; textW : float; fontSize : float) : float {
    if (!node.isAlive || length(text) == 0) {
        return 0.0
    }
    let measured = measure_profile_text_block_height(node, text, textW, fontSize)
    if (measured <= 0.0) {
        return 0.0
    }
    return measured + ui_h(fontSize * CHARACTER_PROFILE_TEXT_HEIGHT_PAD)
}



def public strip_leading_spaces(text : string) : string {
    var result = text
    while (length(result) > 0 && starts_with(result, " ")) {
        result = slice(result, 1, length(result))
    }
    return result
}



def public split_profile_description(fullText : string; besideW : float; maxBesideH : float) {
    characterProfileDescBesideText = ""
    characterProfileDescBelowText = ""
    if (length(fullText) == 0) {
        return
    }
    if (maxBesideH <= 0.0) {
        characterProfileDescBelowText = fullText
        return
    }
    if (measure_profile_beside_fit_height(fullText, besideW) <= maxBesideH) {
        characterProfileDescBesideText = fullText
        return
    }
    var cursor = 0
    var lastGoodEnd = 0
    while (cursor < length(fullText)) {
        let nextEnd = find_next_profile_word_end(fullText, cursor)
        if (nextEnd <= cursor) {
            break
        }
        let candidate = slice(fullText, 0, nextEnd)
        let candidateH = measure_profile_beside_fit_height(candidate, besideW)
        if (candidateH > maxBesideH) {
            break
        }
        lastGoodEnd = nextEnd
        cursor = nextEnd
    }
    if (lastGoodEnd <= 0) {
        characterProfileDescBelowText = fullText
        return
    }
    if (lastGoodEnd >= length(fullText)) {
        characterProfileDescBesideText = fullText
        return
    }
    characterProfileDescBesideText = strip_leading_spaces(slice(fullText, 0, lastGoodEnd))
    characterProfileDescBelowText = strip_leading_spaces(slice(fullText, lastGoodEnd, length(fullText)))
}



def public open_character_profile() {
    if (is_character_profile_open() || is_advisor_popup_open() || is_pause_menu_open() || is_in_defeat_flow()) {
        return
    }
    if (!can_click_character()) {
        return
    }
    let idx = currentCourtCharacterIdx
    if (idx < 0) {
        return
    }
    hide_info_tooltip()
    clear_advisor_icon_hover()
    currentCharacterProfileIdx = idx
    update_character_profile_content(idx)
    apply_character_profile_layout()
    characterProfileAnimPhase = PROFILE_ANIM_OPENING
    characterProfileSlideX = character_profile_panel_slide_hidden_left_x()
    characterProfileSlideTargetX = character_profile_panel_slide_rest_x()
    characterProfileOverlay.isActive = true
    characterProfilePanelNode.isActive = true
    set_character_profile_slide_x(characterProfileSlideX)
    apply_character_profile_overlay_from_open_amount()
}



def public close_character_profile() {
    if (characterProfileAnimPhase == PROFILE_ANIM_IDLE || characterProfileAnimPhase == PROFILE_ANIM_CLOSING) {
        return
    }
    characterProfileAnimPhase = PROFILE_ANIM_CLOSING
    characterProfileSlideTargetX = character_profile_panel_slide_hidden_right_x()
}



def public reset_character_profile_state() {
    characterProfileAnimPhase = PROFILE_ANIM_IDLE
    characterProfileSlideX = character_profile_panel_slide_hidden_left_x()
    characterProfileSlideTargetX = character_profile_panel_slide_rest_x()
    characterProfileOkayHovered = false
    characterProfileOkayHoverT = 0.0
    if (characterProfileOverlay.isAlive) {
        characterProfileOverlay.isActive = false
        set_image_color(characterProfileOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    }
    if (characterProfilePanelNode.isAlive) {
        characterProfilePanelNode.isActive = false
        set_character_profile_slide_x(characterProfileSlideX)
    }
    if (characterProfileOkayButtonNode.isAlive) {
        apply_profile_okay_button_visual(0.0)
    }
}



def public on_character_profile_overlay_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    close_character_profile()
}



def public on_character_profile_panel_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    pass
}



def public on_character_profile_okay_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    close_character_profile()
}



def public on_character_profile_okay_mouse_over(evt : UIMouseEvent) {
    if (is_character_profile_open()) {
        characterProfileOkayHovered = true
    }
}



def public on_character_profile_okay_mouse_out(evt : UIMouseEvent) {
    characterProfileOkayHovered = false
}


// ----- cutscenes -----
def public intro_cutscene_music_target_volume() : float {
    return INTRO_CUTSCENE_MUSIC_VOLUME * settingsMusicVolume * juice_master_volume()
}



def public splash_seconds_until_menu_fade_in() : float {
    if (startupSplashPhase == SPLASH_BLACK_HOLD) {
        return (SPLASH_BLACK_HOLD_DURATION - startupSplashT) + SPLASH_FADE_IN_LOGO_DURATION + SPLASH_HOLD_LOGO_DURATION
    }
    if (startupSplashPhase == SPLASH_FADE_IN_LOGO) {
        return (1.0 - startupSplashT) * SPLASH_FADE_IN_LOGO_DURATION + SPLASH_HOLD_LOGO_DURATION
    }
    if (startupSplashPhase == SPLASH_HOLD_LOGO) {
        return SPLASH_HOLD_LOGO_DURATION - startupSplashT
    }
    return 0.0
}



def public update_intro_texture_aspect() {
    get_texture_size(introCutsceneTexture) $(size : int2) {
        if (size.y > 0) {
            introTextureAspect = float(size.x) / float(size.y)
        }
    }
}



def public update_ashford_cutscene_texture_aspect() {
    get_texture_size(ashfordCutsceneTexture) $(size : int2) {
        if (size.y > 0) {
            ashfordCutsceneTextureAspect = float(size.x) / float(size.y)
            introTextureAspect = ashfordCutsceneTextureAspect
        }
    }
}



def public update_intro_texture3_aspect() {
    get_texture_size(introCutsceneTexture3) $(size : int2) {
        if (size.y > 0) {
            introTextureAspect3 = float(size.x) / float(size.y)
        }
    }
}



def public update_intro_texture4_aspect() {
    get_texture_size(introCutsceneTexture4) $(size : int2) {
        if (size.y > 0) {
            introTextureAspect4 = float(size.x) / float(size.y)
        }
    }
}



def public update_intro_texture2_aspect() {
    get_texture_size(introCutsceneTexture2) $(size : int2) {
        if (size.y > 0) {
            introTextureAspect2 = float(size.x) / float(size.y)
        }
    }
}



def public update_intro_texture5_aspect() {
    get_texture_size(introCutsceneTexture5) $(size : int2) {
        if (size.y > 0) {
            introTextureAspect5 = float(size.x) / float(size.y)
        }
    }
}



def public update_intro_texture6_aspect() {
    get_texture_size(introCutsceneTexture6) $(size : int2) {
        if (size.y > 0) {
            introTextureAspect6 = float(size.x) / float(size.y)
        }
    }
}



def public update_intro_texture_aspect_for(tex : TextureId) : float {
    var aspect = 1.0
    get_texture_size(tex) $(size : int2) {
        if (size.y > 0) {
            aspect = float(size.x) / float(size.y)
        }
    }
    return aspect
}



def public update_intro_texture7_aspect() {
    introTextureAspect7 = update_intro_texture_aspect_for(introCutsceneTexture7)
}

def public update_intro_texture8_aspect() {
    introTextureAspect8 = update_intro_texture_aspect_for(introCutsceneTexture8)
}

def public update_intro_texture9_aspect() {
    introTextureAspect9 = update_intro_texture_aspect_for(introCutsceneTexture9)
}

def public update_intro_texture10_aspect() {
    introTextureAspect10 = update_intro_texture_aspect_for(introCutsceneTexture10)
}

def public update_intro_texture11_aspect() {
    introTextureAspect11 = update_intro_texture_aspect_for(introCutsceneTexture11)
}

def public update_intro_texture12_aspect() {
    introTextureAspect12 = update_intro_texture_aspect_for(introCutsceneTexture12)
}

def public update_intro_texture13_aspect() {
    introTextureAspect13 = update_intro_texture_aspect_for(introCutsceneTexture13)
}

def public update_intro_texture14_aspect() {
    introTextureAspect14 = update_intro_texture_aspect_for(introCutsceneTexture14)
}

def public update_intro_texture15_aspect() {
    introTextureAspect15 = update_intro_texture_aspect_for(introCutsceneTexture15)
}

def public update_intro_texture16_aspect() {
    introTextureAspect16 = update_intro_texture_aspect_for(introCutsceneTexture16)
}



def public intro_set_main_texture(tex : TextureId; aspect : float) {
    introCutsceneImageNode?.UIImage.textureId = tex
    introActiveMainTextureAspect = aspect
}



def public intro_image_rect() : float4 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let top = screen_h() * INTRO_IMAGE_EDGE_PADDING_RATIO
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI) {
        let inner = introMultiSeq2InnerSize
        return float4(padX, top, inner.x, inner.y)
    }
    if (introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        let inner = introScene3Seq7InnerSize
        return float4(padX, intro_scene3_seq7_base_pos().y, inner.x, inner.y)
    }
    let bottom = screen_h() * introActiveBottomYRatio
    let width = screen_w() - 2.0 * padX
    let height = bottom - top
    return float4(padX, top, width, height)
}



def public intro_image_bevel_thickness() : float {
    return ui_h(INTRO_IMAGE_BEVEL_SIZE)
}



def public intro_image_shadow_offset() : float {
    return ui_h(INTRO_IMAGE_SHADOW_OFFSET)
}



def public intro_image_inner_size() : float2 {
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI) {
        return introMultiSeq2InnerSize
    }
    if (introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        return introScene3Seq7InnerSize
    }
    let rect = intro_image_rect()
    return float2(rect.z, rect.w)
}



def public intro_image_frame_outer_size() : float2 {
    let inner = intro_image_inner_size()
    let bevel = intro_image_bevel_thickness()
    let shadow = intro_image_shadow_offset()
    return inner + float2(bevel + shadow * 0.55, bevel + shadow * 0.65)
}



def public intro_cover_uv_for(inner : float2; textureAspect : float; verticalAnchor : float = 0.5) : float4 {
    if (inner.y <= 0.0 || textureAspect <= 0.0) {
        return float4(0.0, 0.0, 1.0, 1.0)
    }
    let boxAspect = inner.x / inner.y
    let anchor = clamp(verticalAnchor, 0.0, 1.0)
    if (boxAspect > textureAspect) {
        let uvH = textureAspect / boxAspect
        let uvY = (1.0 - uvH) * (1.0 - anchor)
        return float4(0.0, uvY, 1.0, uvH)
    }
    let uvW = boxAspect / textureAspect
    let uvX = (1.0 - uvW) * 0.5
    return float4(uvX, 0.0, uvW, 1.0)
}



def public intro_contain_uv_for(inner : float2; textureAspect : float) : float4 {
    if (inner.y <= 0.0 || textureAspect <= 0.0) {
        return float4(0.0, 0.0, 1.0, 1.0)
    }
    let boxAspect = inner.x / inner.y
    if (boxAspect > textureAspect) {
        let uvW = textureAspect / boxAspect
        let uvX = (1.0 - uvW) * 0.5
        return float4(uvX, 0.0, uvW, 1.0)
    }
    let uvH = boxAspect / textureAspect
    let uvY = (1.0 - uvH) * 0.5
    return float4(0.0, uvY, 1.0, uvH)
}



def public intro_texture_fit_uv(inner : float2; textureAspect : float) : float4 {
    if (inner.y <= 0.0 || textureAspect <= 0.0) {
        return float4(0.0, 0.0, 1.0, 1.0)
    }
    let boxAspect = inner.x / inner.y
    if (abs(boxAspect - textureAspect) < 0.02) {
        return float4(0.0, 0.0, 1.0, 1.0)
    }
    return intro_contain_uv_for(inner, textureAspect)
}



def public intro_fit_width_uv(inner : float2; textureAspect : float) : float4 {
    if (inner.y <= 0.0 || textureAspect <= 0.0) {
        return float4(0.0, 0.0, 1.0, 1.0)
    }
    let naturalH = inner.x / textureAspect
    if (naturalH <= inner.y) {
        return float4(0.0, 0.0, 1.0, 1.0)
    }
    let uvH = inner.y * textureAspect / inner.x
    let uvY = (1.0 - uvH) * 0.5
    return float4(0.0, uvY, 1.0, uvH)
}



def public intro_image_cover_uv() : float4 {
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI) {
        return intro_cover_uv_for(introMultiSeq2InnerSize, introTextureAspect2)
    }
    if (introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        return intro_cover_uv_for(introScene3Seq7InnerSize, introActiveMainTextureAspect, INTRO_SCENE3_SEQ7_UV_Y_ANCHOR)
    }
    return intro_cover_uv_for(intro_image_inner_size(), introActiveMainTextureAspect)
}



def public intro_frame_extra_x() : float {
    let bevel = intro_image_bevel_thickness()
    let shadow = intro_image_shadow_offset()
    return bevel + shadow * 0.55
}



def public intro_frame_extra_y() : float {
    let bevel = intro_image_bevel_thickness()
    let shadow = intro_image_shadow_offset()
    return bevel + shadow * 0.65
}



def public intro_frame_outer_size_for(inner : float2) : float2 {
    return inner + float2(intro_frame_extra_x(), intro_frame_extra_y())
}



def public intro_multi_content_width() : float {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    return screen_w() - 2.0 * padX
}



def public intro_multi_text_top_y() : float {
    return screen_h() * (1.0 - INTRO_MULTI_TEXT_AREA_RATIO)
}



def public intro_multi_top_row_y() : float {
    return screen_h() * INTRO_IMAGE_EDGE_PADDING_RATIO
}



def public intro_multi_bottom_row_y() : float {
    let top = intro_multi_top_row_y()
    let rowGap = ui_h(INTRO_CORNER_ROW_GAP)
    let topRowOuterH = intro_frame_outer_size_for(introMultiSeq2InnerSize).y
    return top + topRowOuterH + rowGap
}



def public intro_update_multi_layout_metrics() {
    let topPad = intro_multi_top_row_y()
    let contentW = intro_multi_content_width()
    let colGap = ui_h(INTRO_CORNER_PAIR_GAP)
    let rowGap = ui_h(INTRO_CORNER_ROW_GAP)
    let textTop = intro_multi_text_top_y()
    let textSpacing = ui_h(INTRO_TEXT_SPACING)
    let gridBottom = textTop - textSpacing
    let gridH = gridBottom - topPad - rowGap
    let topRowH = gridH * INTRO_MULTI_TOP_ROW_HEIGHT_RATIO
    let botRowH = gridH - topRowH

    let topSlotW = (contentW - colGap) * 0.5
    introMultiSeq2InnerSize = float2(topSlotW, topRowH)
    introCorner3InnerSize = float2(topSlotW, topRowH)

    let botAvailW = contentW - 2.0 * colGap
    let weightSum = INTRO_MULTI_BOTTOM_WEIGHT_4 + INTRO_MULTI_BOTTOM_WEIGHT_5 + INTRO_MULTI_BOTTOM_WEIGHT_6
    introCorner4InnerSize = float2(botAvailW * INTRO_MULTI_BOTTOM_WEIGHT_4 / weightSum, botRowH)
    introCorner5InnerSize = float2(botAvailW * INTRO_MULTI_BOTTOM_WEIGHT_5 / weightSum, botRowH)
    introCorner6InnerSize = float2(botAvailW * INTRO_MULTI_BOTTOM_WEIGHT_6 / weightSum, botRowH)
}



def public intro_update_scene3_layout_metrics() {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let topPad = screen_h() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let contentW = screen_w() - 2.0 * padX
    let textTop = screen_h() * (1.0 - INTRO_MULTI_TEXT_AREA_RATIO)
    let gridBottom = textTop - ui_h(INTRO_TEXT_SPACING)
    let availH = gridBottom - topPad
    let colGap = ui_h(INTRO_CORNER_PAIR_GAP)
    let availW = contentW - colGap
    let sumRatio = INTRO_SCENE3_SEQ7_WIDTH_RATIO + INTRO_SCENE3_SEQ8_WIDTH_RATIO
    introScene3Seq7InnerSize = float2(availW * INTRO_SCENE3_SEQ7_WIDTH_RATIO / sumRatio, availH)
    introScene3Seq8InnerSize = float2(availW * INTRO_SCENE3_SEQ8_WIDTH_RATIO / sumRatio, availH)
}



def public intro_scene3_seq7_base_pos() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    return float2(padX, screen_h() * INTRO_IMAGE_EDGE_PADDING_RATIO)
}



def public intro_scene3_seq8_base_pos() : float2 {
    let base = intro_scene3_seq7_base_pos()
    let colGap = ui_h(INTRO_CORNER_PAIR_GAP)
    let seq7OuterX = intro_frame_outer_size_for(introScene3Seq7InnerSize).x
    return float2(base.x + seq7OuterX + colGap, base.y)
}



def public intro_scene3_seq8_hidden_left_x() : float {
    return intro_seq_hidden_left_x(intro_scene3_seq8_base_pos(), introScene3Seq8InnerSize)
}



def public intro_scene3_seq8_slide_speed() : float {
    return -intro_scene3_seq8_hidden_left_x() / INTRO_SLIDE_DURATION
}



def public intro_seq3_slide_is_scene3_pair() : bool {
    return introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR
}



def public intro_text_top_below_main() : float {
    let rect = intro_image_rect()
    return rect.y + intro_image_frame_outer_size().y + ui_h(INTRO_TEXT_SPACING)
}



def public intro_text_width() : float {
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI || introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        return intro_multi_content_width()
    }
    return intro_image_rect().z
}



def public intro_text_top_left() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let offsetY = ui_h(INTRO_TEXT_TOP_OFFSET)
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI || introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        return float2(padX, intro_multi_text_top_y() + offsetY)
    }
    return float2(padX, intro_text_top_below_main() + offsetY)
}



def public intro_replica_frame_height() : float {
    let textTop = intro_text_top_left().y
    let nameH = ui_h(DIALOGUE_NAME_FONT_SIZE * 1.15)
    let spacing = ui_h(INTRO_TEXT_SPACING)
    let belowText = screen_h() - textTop
    return max(ui_h(INTRO_REPLIC_FONT_SIZE * 2.0), belowText - nameH - spacing)
}



def public intro_seq_hidden_left_x(base : float2; inner : float2) : float {
    return -(base.x + intro_frame_outer_size_for(inner).x)
}



def public intro_seq3_hidden_left_x() : float {
    return intro_seq_hidden_left_x(intro_seq3_base_pos(), introCorner3InnerSize)
}



def public intro_seq4_hidden_left_x() : float {
    return intro_seq_hidden_left_x(intro_seq4_base_pos(), introCorner4InnerSize)
}



def public intro_seq5_hidden_left_x() : float {
    return intro_seq_hidden_left_x(intro_seq5_base_pos(), introCorner5InnerSize)
}



def public intro_seq6_hidden_left_x() : float {
    return intro_seq_hidden_left_x(intro_seq6_base_pos(), introCorner6InnerSize)
}



def public intro_corner_slide_speed() : float {
    return -intro_seq3_hidden_left_x() / INTRO_SLIDE_DURATION
}



def public intro_seq4_slide_speed() : float {
    return -intro_seq4_hidden_left_x() / INTRO_SLIDE_DURATION
}



def public intro_seq5_slide_speed() : float {
    return -intro_seq5_hidden_left_x() / INTRO_SLIDE_DURATION
}



def public intro_seq6_slide_speed() : float {
    return -intro_seq6_hidden_left_x() / INTRO_SLIDE_DURATION
}



def public intro_seq2_base_pos() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    return float2(padX, intro_multi_top_row_y())
}



def public intro_seq3_base_pos() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let colGap = ui_h(INTRO_CORNER_PAIR_GAP)
    let seq2OuterX = intro_frame_outer_size_for(introMultiSeq2InnerSize).x
    return float2(padX + seq2OuterX + colGap, intro_multi_top_row_y())
}



def public intro_seq4_base_pos() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    return float2(padX, intro_multi_bottom_row_y())
}



def public intro_seq5_base_pos() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let colGap = ui_h(INTRO_CORNER_PAIR_GAP)
    let seq4OuterX = intro_frame_outer_size_for(introCorner4InnerSize).x
    return float2(padX + seq4OuterX + colGap, intro_multi_bottom_row_y())
}



def public intro_seq6_base_pos() : float2 {
    let padX = screen_w() * INTRO_IMAGE_EDGE_PADDING_RATIO
    let colGap = ui_h(INTRO_CORNER_PAIR_GAP)
    let seq4OuterX = intro_frame_outer_size_for(introCorner4InnerSize).x
    let seq5OuterX = intro_frame_outer_size_for(introCorner5InnerSize).x
    return float2(padX + seq4OuterX + colGap + seq5OuterX + colGap, intro_multi_bottom_row_y())
}



def public intro_image_hidden_left_x() : float {
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI) {
        return intro_seq_hidden_left_x(intro_seq2_base_pos(), introMultiSeq2InnerSize)
    }
    if (introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        return intro_seq_hidden_left_x(intro_scene3_seq7_base_pos(), introScene3Seq7InnerSize)
    }
    let rect = intro_image_rect()
    return -(rect.x + intro_image_frame_outer_size().x)
}



def public intro_image_slide_speed() : float {
    return -intro_image_hidden_left_x() / INTRO_SLIDE_DURATION
}



def public intro_name_hidden_left_x() : float {
    return -(screen_w() + intro_text_width())
}



def public intro_exit_hidden_right_x() : float {
    return screen_w() + intro_text_width()
}



def public intro_name_slide_speed() : float {
    return (screen_w() + intro_text_width()) / INTRO_SLIDE_DURATION
}



def public intro_exit_slide_speed() : float {
    return intro_exit_hidden_right_x() / INTRO_SLIDE_DURATION
}



def public intro_cutscene_advance_input_pressed() : bool {
    for (cmd in get_input_command_buffer()) {
        if (cmd is RawMouseInputEvent) {
            let mouse = cmd as RawMouseInputEvent
            if (mouse.kind == RawMouseInputEventKind.MouseDown && is_cutscene_advance_mouse_button(mouse.buttonIdx)) {
                return true
            }
        }
        if (cmd is RawKeyboardInputEvent) {
            let key = cmd as RawKeyboardInputEvent
            if (key.kind == RawKeyboardInputEventKind.KeyDown && is_cutscene_advance_key_idx(key.buttonIdx)) {
                return true
            }
        }
    }
    return false
}



def public intro_any_input_pressed() : bool {
    return intro_cutscene_advance_input_pressed()
}



def public intro_cutscene_skip_visible() : bool {
    return introCutscenePhase != INTRO_NONE && is_story_cutscene_active()
}



def public intro_cutscene_exit_fade_duration() : float {
    if (introSkipExitPending) {
        return CUTSCENE_SKIP_EXIT_FADE_DURATION
    }
    return INTRO_FADE_DURATION
}



def public intro_cutscene_exit_unfade_duration() : float {
    if (introSkipExitPending) {
        return CUTSCENE_SKIP_EXIT_UNFADE_DURATION
    }
    return INTRO_FADE_DURATION
}



def public intro_cutscene_skip_hint_active() : bool {
    return intro_cutscene_skip_visible() && !introSkipExitPending
}



def public set_intro_cutscene_skip_visible(visible : bool) {
    if (introCutsceneSkipRoot.isAlive) {
        introCutsceneSkipRoot.isActive = visible
    }
}



def public intro_cutscene_skip_hint_text() : string {
    return cutscene_skip_hint()
}



def public update_intro_cutscene_skip_input_state() {
    introSkipSawInput = false
    for (cmd in get_input_command_buffer()) {
        // A key, click, scroll or real mouse movement counts as the player being active.
        if (cmd is RawKeyboardInputEvent) {
            introSkipSawInput = true
        }
        if (cmd is RawMouseInputEvent) {
            let mouse = cmd as RawMouseInputEvent
            if (mouse.kind != RawMouseInputEventKind.MouseMove || length(mouse.deltaPosition) > 0.5) {
                introSkipSawInput = true
            }
            if (mouse.buttonIdx != MouseButton.Right) {
                continue
            }
            if (mouse.kind == RawMouseInputEventKind.MouseDown) {
                introCutsceneSkipRightMouseDown = true
            } elif (mouse.kind == RawMouseInputEventKind.MouseUp) {
                introCutsceneSkipRightMouseDown = false
            }
        }
    }
}



def public intro_cutscene_skip_input_active() : bool {
    return introCutsceneSkipRightMouseDown || introSkipSawInput
}



def public apply_intro_cutscene_skip_alpha() {
    let a = introCutsceneSkipAlpha * CUTSCENE_SKIP_HINT_MAX_ALPHA
    if (introCutsceneSkipTextNode.isAlive) {
        set_text_color(introCutsceneSkipTextNode, float4(
            CUTSCENE_SKIP_HINT_COLOR.x,
            CUTSCENE_SKIP_HINT_COLOR.y,
            CUTSCENE_SKIP_HINT_COLOR.z,
            CUTSCENE_SKIP_HINT_COLOR.w * a))
    }
    if (introCutsceneSkipBarBgNode.isAlive) {
        set_image_color(introCutsceneSkipBarBgNode, float4(
            CUTSCENE_SKIP_BAR_BG_COLOR.x,
            CUTSCENE_SKIP_BAR_BG_COLOR.y,
            CUTSCENE_SKIP_BAR_BG_COLOR.z,
            CUTSCENE_SKIP_BAR_BG_COLOR.w * a))
    }
    if (introSkipPlateNode.isAlive) {
        set_image_color(introSkipPlateNode, float4(1.0, 1.0, 1.0, a))
    }
    if (introSkipHeadNode.isAlive) {
        set_image_color(introSkipHeadNode, float4(1.0, 0.86, 0.5, a))
    }
    if (introCutsceneSkipBarFillNode.isAlive) {
        set_image_color(introCutsceneSkipBarFillNode, float4(
            CUTSCENE_SKIP_BAR_FILL_COLOR.x,
            CUTSCENE_SKIP_BAR_FILL_COLOR.y,
            CUTSCENE_SKIP_BAR_FILL_COLOR.z,
            CUTSCENE_SKIP_BAR_FILL_COLOR.w * a))
    }
}



def public tick_intro_cutscene_skip_hint_visibility(dt : float) {
    if (!intro_cutscene_skip_hint_active()) {
        introCutsceneSkipAlpha = 0.0
        introCutsceneSkipIdleT = CUTSCENE_SKIP_HINT_IDLE_HIDE_DELAY
        apply_intro_cutscene_skip_alpha()
        set_intro_cutscene_skip_visible(false)
        return
    }

    update_intro_cutscene_skip_input_state()
    if (intro_cutscene_skip_input_active() || is_intro_cutscene_skip_hold_pressed()) {
        introCutsceneSkipIdleT = 0.0
    }
    // The cutscene code can call this several times a frame; the timer and fade run
    // once per frame in update_intro_skip_hint_fade.
    introSkipHintLive = true
}


def public update_intro_skip_hint_fade(dt : float) {
    if (!introSkipHintLive) {
        return
    }
    introSkipHintLive = false
    let holding = is_intro_cutscene_skip_hold_pressed()
    if (!holding) {
        introCutsceneSkipIdleT += dt
    }
    let wantVisible = holding || introCutsceneSkipIdleT < CUTSCENE_SKIP_HINT_IDLE_HIDE_DELAY
    let targetAlpha = (wantVisible ? 1.0 : 0.0)
    let fadeSpeed = (targetAlpha > introCutsceneSkipAlpha) ? (1.0 / CUTSCENE_SKIP_HINT_FADE_IN_DURATION) : (1.0 / CUTSCENE_SKIP_HINT_FADE_DURATION)
    introCutsceneSkipAlpha = move_toward(introCutsceneSkipAlpha, targetAlpha, fadeSpeed * dt)
    if (introCutsceneSkipAlpha > 0.001) {
        apply_intro_cutscene_skip_layout()
    }
    apply_intro_cutscene_skip_alpha()
    set_intro_cutscene_skip_visible(introCutsceneSkipAlpha > 0.001)
}



def public refresh_intro_cutscene_skip_text() {
    if (!introCutsceneSkipTextNode.isAlive) {
        return
    }
    get_component(introCutsceneSkipTextNode) $(var txt : UIText?) {
        if (txt != null) {
            txt.text = intro_cutscene_skip_hint_text()
        }
    }
}



def public update_intro_cutscene_skip_bar(progress : float) {
    if (!introCutsceneSkipBarFillNode.isAlive || !introCutsceneSkipBarBgNode.isAlive) {
        return
    }
    let t = clamp(progress, 0.0, 1.0)
    let barW = introCutsceneSkipBarBgNode?.UIFrame.size.x
    let barH = introCutsceneSkipBarBgNode?.UIFrame.size.y
    let fillW = barW * t
    set_frame_pos(introCutsceneSkipBarFillNode, float2(0.0, 0.0))
    set_frame_size(introCutsceneSkipBarFillNode, float2(fillW, barH))
    introCutsceneSkipBarFillNode?.UIImage.size = float2(fillW, barH)
    introCutsceneSkipBarFillNode.isActive = fillW > 0.5
    if (!introSkipHeadNode.isAlive) {
        return
    }
    // A glowing tip marks progress and throws sparks while the button is held.
    let holding = t > 0.001
    introSkipHeadNode.isActive = holding
    if (holding) {
        let glow = barH * 3.6
        set_frame_size(introSkipHeadNode, float2(glow, glow))
        introSkipHeadNode?.UIImage.size = float2(glow, glow)
        set_frame_pos(introSkipHeadNode, float2(barW * t, barH * 0.5))
        introSkipSparkTimer -= get_delta_time()
        if (introSkipSparkTimer <= 0.0) {
            introSkipSparkTimer = 0.045
            fx_gold_burst(juice_node_center(introSkipHeadNode), 1, 0.45)
        }
    }
}



def public intro_cutscene_skip_text_size() : float2 {
    if (!introCutsceneSkipTextNode.isAlive) {
        return float2(0.0, 0.0)
    }
    var textW = introCutsceneSkipTextNode?.UIFrame.size.x
    var textH = introCutsceneSkipTextNode?.UIText.size.y
    if (textH <= 0.0) {
        textH = introCutsceneSkipTextNode?.UIFrame.size.y
    }
    if (textW <= 0.0) {
        textW = ui_w(CUTSCENE_SKIP_BAR_MIN_WIDTH)
    }
    return float2(textW, textH)
}



def public apply_intro_cutscene_skip_layout() {
    if (!introCutsceneSkipRoot.isAlive) {
        return
    }
    let barH = ui_h(CUTSCENE_SKIP_BAR_HEIGHT)
    let gap = ui_h(CUTSCENE_SKIP_TEXT_BAR_GAP)
    let padX = ui_w(26.0)
    let padY = ui_h(18.0)

    set_text_font_size(introCutsceneSkipTextNode, ui_h(CUTSCENE_SKIP_HINT_FONT_SIZE))
    apply_dialogue_font(introCutsceneSkipTextNode)
    refresh_intro_cutscene_skip_text()
    var textSize = intro_cutscene_skip_text_size()
    // The label sizes itself a frame after its text changes; take whichever is wider.
    textSize.x = max(textSize.x, introCutsceneSkipTextNode?.UIFrame.size.x)

    let plateSize = float2(textSize.x + 2.0 * padX, textSize.y + gap + barH + 2.0 * padY)
    if (introSkipPlateNode.isAlive) {
        set_frame_pivot(introSkipPlateNode, float2(1.0, 1.0))
        set_frame_pos(introSkipPlateNode, float2(0.0, 0.0))
        set_frame_size(introSkipPlateNode, plateSize)
        introSkipPlateNode?.UIImage.size = plateSize
    }
    set_frame_pivot(introCutsceneSkipTextNode, float2(1.0, 1.0))
    set_frame_pos(introCutsceneSkipTextNode, float2(-padX, -(padY + barH + gap)))

    set_frame_size(introCutsceneSkipBarBgNode, float2(textSize.x, barH))
    introCutsceneSkipBarBgNode?.UIImage.size = float2(textSize.x, barH)
    set_frame_pivot(introCutsceneSkipBarBgNode, float2(1.0, 1.0))
    set_frame_pos(introCutsceneSkipBarBgNode, float2(-padX, -padY))
    set_frame_pivot(introCutsceneSkipBarFillNode, float2(0.0, 0.0))
    set_frame_pos(introCutsceneSkipBarFillNode, float2(0.0, 0.0))
    set_frame_size(introCutsceneSkipBarFillNode, float2(textSize.x, barH))
    introCutsceneSkipBarFillNode?.UIImage.size = float2(textSize.x, barH)

    set_frame_pivot(introCutsceneSkipRoot, float2(1.0, 1.0))
    // Anchored to the corner, so the margin has to be an inset; a frame position is ignored.
    set_anchor_insets(introCutsceneSkipRoot, -ui_w(CUTSCENE_SKIP_PADDING_RIGHT), -ui_h(CUTSCENE_SKIP_PADDING_BOTTOM))
    update_intro_cutscene_skip_bar(introCutsceneSkipHoldT / CUTSCENE_SKIP_HOLD_DURATION)
    apply_intro_cutscene_skip_alpha()
}



def public skip_entire_cutscene() {
    intro_stop_dialogue_audio()
    intro_stop_battle_sfx()
    reset_intro_cutscene_skip_hold()
    introCutsceneSkipAlpha = 0.0
    apply_intro_cutscene_skip_alpha()
    set_intro_cutscene_skip_visible(false)
    introSkipExitPending = true
    introCutscenePhase = INTRO_FADE_OUT
    introCutsceneT = 0.0
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = true
    }
    apply_screen_visibility()
}



def public tick_intro_cutscene_skip_hold(dt : float) : bool {
    tick_intro_cutscene_skip_hint_visibility(dt)
    if (!intro_cutscene_skip_hint_active()) {
        reset_intro_cutscene_skip_hold()
        return false
    }
    if (is_intro_cutscene_skip_hold_pressed()) {
        introCutsceneSkipHoldT += dt
        update_intro_cutscene_skip_bar(introCutsceneSkipHoldT / CUTSCENE_SKIP_HOLD_DURATION)
        if (introCutsceneSkipHoldT >= CUTSCENE_SKIP_HOLD_DURATION) {
            skip_entire_cutscene()
            return true
        }
    } else {
        reset_intro_cutscene_skip_hold()
    }
    return false
}



def public intro_current_replic() : string {
    if (ashfordCutsceneActive) {
        return get_ashford_cutscene_body()
    }
    if (statUnlockCutsceneActive) {
        if (statUnlockCutsceneStatIdx == STAT_CHURCH_IDX) {
            return get_church_cutscene_replica(introDialogueBeat)
        }
        return get_stat_unlock_cutscene_body(statUnlockCutsceneStatIdx)
    }
    return intro_dialogue_replic(introDialogueBeat)
}



def public refresh_intro_replica_text() {
    if (!introCutsceneReplicaNode.isAlive) {
        return
    }
    introCutsceneReplicaNode?.UIText.text = typewriter_text_slice(intro_current_replic(), introTypewriterCharCount)
}



def public refresh_intro_name_text() {
    if (!introCutsceneNameNode.isAlive) {
        return
    }
    if (ashfordCutsceneActive) {
        introCutsceneNameNode?.UIText.text = get_ashford_cutscene_title()
    } elif (statUnlockCutsceneActive) {
        introCutsceneNameNode?.UIText.text = get_stat_unlock_cutscene_title(statUnlockCutsceneStatIdx)
    } else {
        introCutsceneNameNode?.UIText.text = intro_dialogue_name(introDialogueBeat)
    }
}



def public start_intro_typewriter() {
    introTypewriterCharCount = 0
    introTypewriterAccumulator = 0.0
    refresh_intro_replica_text()
}



def public intro_snap_main_image_in_place() {
    introCutsceneSlideX = 0.0
    introPictureSlideDone = true
    apply_intro_slide_positions()
}



def public intro_snap_main_image_offscreen_exit() {
    introCutsceneSlideX = intro_exit_hidden_right_x()
    apply_intro_slide_positions()
}



def public intro_snap_name_in_place() {
    introNameSlideX = 0.0
    apply_intro_slide_positions()
}



def public intro_snap_seq3_in_place() {
    introSeq3SlideX = 0.0
    introSeq3SlideDone = true
    apply_intro_slide_positions()
}



def public intro_snap_seq4_in_place() {
    introSeq4SlideX = 0.0
    introSeq4SlideDone = true
    apply_intro_slide_positions()
}



def public intro_snap_seq5_in_place() {
    introSeq5SlideX = 0.0
    introSeq5SlideDone = true
    apply_intro_slide_positions()
}



def public intro_snap_seq6_in_place() {
    introSeq6SlideX = 0.0
    introSeq6SlideDone = true
    apply_intro_slide_positions()
}



def public intro_begin_name_slide_for_current_beat() {
    introCutsceneT = 0.0
    introNameSlideX = intro_name_hidden_left_x()
    refresh_intro_name_text()
    set_intro_text_visible(true)
    apply_intro_slide_positions()
}



def public intro_begin_replica_immediately_for_current_beat() {
    introCutscenePhase = INTRO_TYPEWRITER
    introDialogueSubPhase = INTRO_DIALOGUE_TYPEWRITER
    introCutsceneT = 0.0
    refresh_intro_name_text()
    intro_snap_name_in_place()
    apply_intro_cutscene_layout()
    intro_start_dialogue_audio_for_beat(introDialogueBeat)
    start_intro_typewriter()
    set_intro_text_visible(true)
    apply_intro_slide_positions()
}



def public intro_begin_dialogue_beat_immediately(beat : int) {
    begin_intro_dialogue_beat(beat, true)
    introCutscenePhase = INTRO_DIALOGUE
    apply_intro_cutscene_layout()
    set_intro_text_visible(true)
    apply_intro_slide_positions()
}



def public intro_battle_sfx_target_volume() : float {
    return INTRO_BATTLE_SFX_VOLUME * settingsMusicVolume * juice_master_volume()
}



def public intro_start_seq10_battle_sfx() {
    load_intro_battle_sfx()
    if (!valid(introWarHornHandle) || !is_playing(introWarHornHandle)) {
        introWarHornHandle = play_sound(introWarHornSound)
        set_volume(introWarHornHandle, intro_battle_sfx_target_volume(), 0.0)
    }
    if (!valid(introSwordFightHandle) || !is_playing(introSwordFightHandle)) {
        introSwordFightHandle = play_sound_loop(introSwordFightSound)
        set_volume(introSwordFightHandle, intro_battle_sfx_target_volume(), 0.0)
    }
}



def public intro_stop_sword_fight_sfx() {
    if (valid(introSwordFightHandle)) {
        stop(introSwordFightHandle)
    }
}



def public intro_stop_battle_sfx() {
    if (valid(introWarHornHandle)) {
        stop(introWarHornHandle)
    }
    intro_stop_sword_fight_sfx()
}



def public intro_begin_black_pause_before_edwin_death() {
    intro_stop_sword_fight_sfx()
    set_intro_text_visible(false)
    set_intro_image_visible(false)
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = true
    }
    set_intro_fade_alpha(1.0)
    introCutscenePhase = INTRO_BLACK_PAUSE
    introCutsceneT = 0.0
}



def public intro_leave_black_pause_and_begin_edwin_shake() {
    set_intro_fade_alpha(0.0)
    set_intro_image_visible(true)
    intro_begin_shake_transition(
        introCutsceneTexture14, introTextureAspect14,
        introCutsceneTexture15, introTextureAspect15,
        INTRO_POST_SHAKE_ACTION_DIALOGUE_23
    )
}



def public intro_beat_has_dialogue_audio(beat : int) : bool {
    return beat >= 0 && beat < INTRO_DIALOGUE_BEAT_COUNT && intro_dialogue_sound_path(beat) != ""
}



def public intro_stop_dialogue_audio() {
    if (valid(introDialogueSoundHandle)) {
        stop(introDialogueSoundHandle)
    }
}



def public intro_start_dialogue_audio_for_beat(beat : int) {
    intro_stop_dialogue_audio()
    if (statUnlockCutsceneActive && statUnlockCutsceneStatIdx == STAT_CHURCH_IDX) {
        if (beat < 0 || beat >= CHURCH_CUTSCENE_SOUND_COUNT) {
            return
        }
        if (church_cutscene_sound_path(beat) == "") {
            return
        }
        introDialogueSoundHandle = play_sound(churchCutsceneSounds[beat])
        set_volume(introDialogueSoundHandle, juice_master_volume())
        return
    }
    if (!intro_beat_has_dialogue_audio(beat)) {
        return
    }
    introDialogueSoundHandle = play_sound(introDialogueSounds[beat])
    set_volume(introDialogueSoundHandle, juice_master_volume())
}



def public intro_is_dialogue_audio_playing() : bool {
    return valid(introDialogueSoundHandle) && is_playing(introDialogueSoundHandle)
}



def public intro_begin_typewriter_for_current_beat() {
    intro_snap_name_in_place()
    introCutsceneT = 0.0
    intro_start_dialogue_audio_for_beat(introDialogueBeat)
    start_intro_typewriter()
}



def public set_intro_image_visible(visible : bool) {
    if (introCutsceneImageFrameNode.isAlive) {
        introCutsceneImageFrameNode.isActive = visible
    }
}



def public set_intro_text_visible(visible : bool) {
    if (introCutsceneTextColumnNode.isAlive) {
        introCutsceneTextColumnNode.isActive = visible
    }
}



def public set_intro_seq3_visible(visible : bool) {
    introSeq3Visible = visible
    if (introCutsceneImage3FrameNode.isAlive) {
        introCutsceneImage3FrameNode.isActive = visible
    }
}



def public set_intro_seq4_visible(visible : bool) {
    introSeq4Visible = visible
    if (introCutsceneImage4FrameNode.isAlive) {
        introCutsceneImage4FrameNode.isActive = visible
    }
}



def public set_intro_seq5_visible(visible : bool) {
    introSeq5Visible = visible
    if (introCutsceneImage5FrameNode.isAlive) {
        introCutsceneImage5FrameNode.isActive = visible
    }
}



def public set_intro_seq6_visible(visible : bool) {
    introSeq6Visible = visible
    if (introCutsceneImage6FrameNode.isAlive) {
        introCutsceneImage6FrameNode.isActive = visible
    }
}



def public apply_intro_image_frame_layout() {
    apply_framed_image_layout(
        introCutsceneImageFrameNode,
        introCutsceneImageShadowNode,
        introCutsceneImageNode,
        introCutsceneImageBevelBottomNode,
        introCutsceneImageBevelRightNode,
        intro_image_inner_size(),
        intro_image_cover_uv()
    )
}



def public apply_intro_corner3_layout() {
    var inner = introCorner3InnerSize
    var aspect = introTextureAspect3
    var uvRegion : float4
    if (intro_seq3_slide_is_scene3_pair()) {
        inner = introScene3Seq8InnerSize
        aspect = introTextureAspect8
        uvRegion = intro_cover_uv_for(inner, aspect, INTRO_SCENE3_SEQ8_UV_Y_ANCHOR)
    } else {
        uvRegion = intro_cover_uv_for(inner, aspect)
    }
    apply_framed_image_layout(
        introCutsceneImage3FrameNode,
        introCutsceneImage3ShadowNode,
        introCutsceneImage3Node,
        introCutsceneImage3BevelBottomNode,
        introCutsceneImage3BevelRightNode,
        inner,
        uvRegion
    )
}



def public apply_intro_corner4_layout() {
    let inner = introCorner4InnerSize
    apply_framed_image_layout(
        introCutsceneImage4FrameNode,
        introCutsceneImage4ShadowNode,
        introCutsceneImage4Node,
        introCutsceneImage4BevelBottomNode,
        introCutsceneImage4BevelRightNode,
        inner,
        intro_cover_uv_for(inner, introTextureAspect4)
    )
}



def public apply_intro_corner5_layout() {
    let inner = introCorner5InnerSize
    apply_framed_image_layout(
        introCutsceneImage5FrameNode,
        introCutsceneImage5ShadowNode,
        introCutsceneImage5Node,
        introCutsceneImage5BevelBottomNode,
        introCutsceneImage5BevelRightNode,
        inner,
        intro_cover_uv_for(inner, introTextureAspect5)
    )
}



def public apply_intro_corner6_layout() {
    let inner = introCorner6InnerSize
    apply_framed_image_layout(
        introCutsceneImage6FrameNode,
        introCutsceneImage6ShadowNode,
        introCutsceneImage6Node,
        introCutsceneImage6BevelBottomNode,
        introCutsceneImage6BevelRightNode,
        inner,
        intro_cover_uv_for(inner, introTextureAspect6)
    )
}



def public apply_intro_image_position() {
    if (!introCutsceneImageFrameNode.isAlive) {
        return
    }
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI) {
        let base = intro_seq2_base_pos()
        set_frame_pos(introCutsceneImageFrameNode, base + float2(introCutsceneSlideX + introShakeOffsetX, introShakeOffsetY))
    } elif (introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        let base = intro_scene3_seq7_base_pos()
        set_frame_pos(introCutsceneImageFrameNode, base + float2(introCutsceneSlideX + introShakeOffsetX, introShakeOffsetY))
    } else {
        let rect = intro_image_rect()
        set_frame_pos(introCutsceneImageFrameNode, float2(rect.x + introCutsceneSlideX + introShakeOffsetX, rect.y + introShakeOffsetY))
    }
    apply_intro_image_frame_layout()
}



def public apply_intro_text_position() {
    if (!introCutsceneTextColumnNode.isAlive) {
        return
    }
    let base = intro_text_top_left()
    var imageSlideX = 0.0
    if (introCutsceneLayoutMode == INTRO_LAYOUT_SEQ1) {
        let textActive = introCutsceneTextColumnNode.isActive
        if (!textActive || introCutscenePhase == INTRO_SLIDE_OUT) {
            imageSlideX = introCutsceneSlideX
        }
    }
    set_frame_pos(introCutsceneTextColumnNode, base + float2(imageSlideX + introNameSlideX, 0.0))
}



def public apply_intro_corner_positions() {
    if (introSeq3Visible && introCutsceneImage3FrameNode.isAlive) {
        var base : float2
        if (intro_seq3_slide_is_scene3_pair()) {
            base = intro_scene3_seq8_base_pos()
        } else {
            base = intro_seq3_base_pos()
        }
        set_frame_pos(introCutsceneImage3FrameNode, base + float2(introSeq3SlideX, 0.0))
        apply_intro_corner3_layout()
    }
    if (introSeq4Visible && introCutsceneImage4FrameNode.isAlive) {
        let base = intro_seq4_base_pos()
        set_frame_pos(introCutsceneImage4FrameNode, base + float2(introSeq4SlideX, 0.0))
        apply_intro_corner4_layout()
    }
    if (introSeq5Visible && introCutsceneImage5FrameNode.isAlive) {
        let base = intro_seq5_base_pos()
        set_frame_pos(introCutsceneImage5FrameNode, base + float2(introSeq5SlideX, 0.0))
        apply_intro_corner5_layout()
    }
    if (introSeq6Visible && introCutsceneImage6FrameNode.isAlive) {
        let base = intro_seq6_base_pos()
        set_frame_pos(introCutsceneImage6FrameNode, base + float2(introSeq6SlideX, 0.0))
        apply_intro_corner6_layout()
    }
}



def public apply_intro_slide_positions() {
    apply_intro_image_position()
    apply_intro_corner_positions()
    apply_intro_text_position()
}



def public set_intro_fade_alpha(alpha : float) {
    introFadeAlpha = clamp(alpha, 0.0, 1.0)
    if (introFadeOverlay.isAlive) {
        set_image_color(introFadeOverlay, float4(0.0, 0.0, 0.0, introFadeAlpha))
    }
}



def public apply_intro_cutscene_layout() {
    if (!introCutsceneRoot.isAlive) {
        return
    }
    if (introCutsceneLayoutMode == INTRO_LAYOUT_MULTI) {
        intro_update_multi_layout_metrics()
    } elif (introCutsceneLayoutMode == INTRO_LAYOUT_SCENE3_PAIR) {
        intro_update_scene3_layout_metrics()
    }
    let res = float2(get_resolution())
    set_frame_size(introCutsceneRoot, res)
    if (introCutsceneBgNode.isAlive) {
        set_frame_size(introCutsceneBgNode, res)
    }
    if (introFadeOverlay.isAlive) {
        set_frame_size(introFadeOverlay, res)
    }

    let textW = intro_text_width()
    if (introCutsceneNameNode.isAlive) {
        set_text_font_size(introCutsceneNameNode, ui_h(DIALOGUE_NAME_FONT_SIZE))
        apply_name_font(introCutsceneNameNode)
        set_frame_width(introCutsceneNameNode, textW)
    }
    if (introCutsceneReplicaNode.isAlive) {
        set_text_font_size(introCutsceneReplicaNode, ui_h(INTRO_REPLIC_FONT_SIZE))
        set_text_color(introCutsceneReplicaNode, DIALOGUE_TEXT_COLOR)
        apply_dialogue_font(introCutsceneReplicaNode)
        configure_intro_replica_text(introCutsceneReplicaNode, textW)
    }
    if (introCutsceneTextColumnNode.isAlive) {
        let textTop = intro_text_top_left().y
        set_frame_size(introCutsceneTextColumnNode, float2(textW, screen_h() - textTop))
        configure_intro_replica_text(introCutsceneReplicaNode, textW)
    }
    apply_intro_slide_positions()
}



def public build_startup_splash_ui() {
    let res = float2(get_resolution())
    uiCanvas = canvas(res)
    uiCanvas.name = "uiCanvas"

    startupSplashRoot = panel(res, [])
    startupSplashRoot.name = "startupSplashRoot"
    set_image_color(startupSplashRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(startupSplashRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(startupSplashRoot, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)

    startupSplashBgNode = panel(res, [])
    startupSplashBgNode.name = "startupSplashBgNode"
    set_image_color(startupSplashBgNode, float4(0.0, 0.0, 0.0, 1.0))
    set_parent(startupSplashBgNode, startupSplashRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(startupSplashBgNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    splashBackLayerNode = juice_create_ambient_layer(startupSplashRoot, "juiceSplashBack", JUICE_AMBIENT_SPLASH_BACK)

    startupSplashLogoNode = panel(float2(640.0, 360.0), [])
    startupSplashLogoNode.name = "startupSplashLogoNode"
    startupSplashLogoNode?.UIImage.textureId = logoTexture
    startupSplashLogoNode?.UIImage.pivot = float2(0.0, 0.0)
    set_image_color(startupSplashLogoNode, float4(1.0, 1.0, 1.0, 1.0))
    set_frame_pivot(startupSplashLogoNode, float2(0.0, 0.0))
    set_parent(startupSplashLogoNode, startupSplashRoot, AddChildStrategy.KeepLocalTransform)
    startupSplashLogoNode.isActive = false
    splashFrontLayerNode = juice_create_ambient_layer(startupSplashRoot, "juiceSplashFront", JUICE_AMBIENT_SPLASH_FRONT)

    startupSplashOverlayNode = panel(res, [])
    startupSplashOverlayNode.name = "startupSplashOverlayNode"
    set_image_color(startupSplashOverlayNode, float4(0.0, 0.0, 0.0, 1.0))
    set_parent(startupSplashOverlayNode, startupSplashRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(startupSplashOverlayNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)

    apply_startup_splash_layout()
    add_component(uiCanvas, new StartupSplashFlow())
}



def public start_startup_splash() {
    startupSplashPhase = SPLASH_BLACK_HOLD
    startupSplashT = 0.0
    set_startup_splash_overlay_alpha(1.0)
    set_startup_splash_logo_visible(false)
    if (startupSplashRoot.isAlive) {
        startupSplashRoot.isActive = true
    }
    apply_screen_visibility()
}



def public debug_start_in_game() {
    startupSplashPhase = SPLASH_NONE
    startupSplashT = 0.0
    if (startupSplashRoot.isAlive) {
        startupSplashRoot.isActive = false
    }
    set_startup_splash_overlay_alpha(0.0)
    set_startup_splash_bg_alpha(0.0)
    introCutscenePhase = INTRO_NONE
    screenPhase = SCREEN_PLAYING
    deferCharacterEnter = false
    reset_game()
    apply_screen_visibility()
}



def public finish_startup_splash() {
    startupSplashPhase = SPLASH_NONE
    startupSplashT = 0.0
    if (startupSplashRoot.isAlive) {
        startupSplashRoot.isActive = false
    }
    set_startup_splash_overlay_alpha(0.0)
    set_startup_splash_bg_alpha(0.0)
    refresh_save_availability()
    apply_screen_visibility()
    apply_main_menu_layout()
}



def public build_intro_cutscene_ui() {
    let res = float2(get_resolution())

    introCutsceneRoot = panel(res, [])
    introCutsceneRoot.name = "introCutsceneRoot"
    set_image_color(introCutsceneRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(introCutsceneRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(introCutsceneRoot, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    introCutsceneRoot.isActive = false

    introCutsceneBgNode = panel(res, [])
    introCutsceneBgNode.name = "introCutsceneBgNode"
    set_image_color(introCutsceneBgNode, INTRO_CUTSCENE_BG_COLOR)
    set_parent(introCutsceneBgNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(introCutsceneBgNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)

    introCutsceneImageFrameNode = panel(float2(640.0, 420.0), [])
    introCutsceneImageFrameNode.name = "introCutsceneImageFrameNode"
    set_image_color(introCutsceneImageFrameNode, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneImageFrameNode, float2(0.0, 0.0))
    set_parent(introCutsceneImageFrameNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    introCutsceneImageFrameNode.isActive = false

    introCutsceneImageShadowNode = panel(float2(640.0, 400.0), [])
    introCutsceneImageShadowNode.name = "introCutsceneImageShadowNode"
    set_image_color(introCutsceneImageShadowNode, INTRO_IMAGE_SHADOW_COLOR)
    set_frame_pivot(introCutsceneImageShadowNode, float2(0.0, 0.0))
    set_parent(introCutsceneImageShadowNode, introCutsceneImageFrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImageNode = panel(float2(640.0, 400.0), [])
    introCutsceneImageNode.name = "introCutsceneImageNode"
    introCutsceneImageNode?.UIImage.textureId = introCutsceneTexture
    introActiveMainTextureAspect = introTextureAspect
    set_image_color(introCutsceneImageNode, float4(1.0, 1.0, 1.0, 1.0))
    introCutsceneImageNode?.UIImage.pivot = float2(0.0, 0.0)
    set_frame_pivot(introCutsceneImageNode, float2(0.0, 0.0))
    set_parent(introCutsceneImageNode, introCutsceneImageFrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImageBevelBottomNode = panel(float2(640.0, 8.0), [])
    introCutsceneImageBevelBottomNode.name = "introCutsceneImageBevelBottomNode"
    set_image_color(introCutsceneImageBevelBottomNode, INTRO_IMAGE_BEVEL_DARK_COLOR)
    set_frame_pivot(introCutsceneImageBevelBottomNode, float2(0.0, 0.0))
    set_parent(introCutsceneImageBevelBottomNode, introCutsceneImageFrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImageBevelRightNode = panel(float2(8.0, 400.0), [])
    introCutsceneImageBevelRightNode.name = "introCutsceneImageBevelRightNode"
    set_image_color(introCutsceneImageBevelRightNode, INTRO_IMAGE_BEVEL_DARKER_COLOR)
    set_frame_pivot(introCutsceneImageBevelRightNode, float2(0.0, 0.0))
    set_parent(introCutsceneImageBevelRightNode, introCutsceneImageFrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage3FrameNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage3FrameNode.name = "introCutsceneImage3FrameNode"
    set_image_color(introCutsceneImage3FrameNode, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneImage3FrameNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage3FrameNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    introCutsceneImage3FrameNode.isActive = false

    introCutsceneImage3ShadowNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage3ShadowNode.name = "introCutsceneImage3ShadowNode"
    set_image_color(introCutsceneImage3ShadowNode, INTRO_IMAGE_SHADOW_COLOR)
    set_frame_pivot(introCutsceneImage3ShadowNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage3ShadowNode, introCutsceneImage3FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage3Node = panel(float2(200.0, 200.0), [])
    introCutsceneImage3Node.name = "introCutsceneImage3Node"
    introCutsceneImage3Node?.UIImage.textureId = introCutsceneTexture3
    set_image_color(introCutsceneImage3Node, float4(1.0, 1.0, 1.0, 1.0))
    introCutsceneImage3Node?.UIImage.pivot = float2(0.0, 0.0)
    set_frame_pivot(introCutsceneImage3Node, float2(0.0, 0.0))
    set_parent(introCutsceneImage3Node, introCutsceneImage3FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage3BevelBottomNode = panel(float2(200.0, 8.0), [])
    introCutsceneImage3BevelBottomNode.name = "introCutsceneImage3BevelBottomNode"
    set_image_color(introCutsceneImage3BevelBottomNode, INTRO_IMAGE_BEVEL_DARK_COLOR)
    set_frame_pivot(introCutsceneImage3BevelBottomNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage3BevelBottomNode, introCutsceneImage3FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage3BevelRightNode = panel(float2(8.0, 200.0), [])
    introCutsceneImage3BevelRightNode.name = "introCutsceneImage3BevelRightNode"
    set_image_color(introCutsceneImage3BevelRightNode, INTRO_IMAGE_BEVEL_DARKER_COLOR)
    set_frame_pivot(introCutsceneImage3BevelRightNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage3BevelRightNode, introCutsceneImage3FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage4FrameNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage4FrameNode.name = "introCutsceneImage4FrameNode"
    set_image_color(introCutsceneImage4FrameNode, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneImage4FrameNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage4FrameNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    introCutsceneImage4FrameNode.isActive = false

    introCutsceneImage4ShadowNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage4ShadowNode.name = "introCutsceneImage4ShadowNode"
    set_image_color(introCutsceneImage4ShadowNode, INTRO_IMAGE_SHADOW_COLOR)
    set_frame_pivot(introCutsceneImage4ShadowNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage4ShadowNode, introCutsceneImage4FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage4Node = panel(float2(200.0, 200.0), [])
    introCutsceneImage4Node.name = "introCutsceneImage4Node"
    introCutsceneImage4Node?.UIImage.textureId = introCutsceneTexture4
    set_image_color(introCutsceneImage4Node, float4(1.0, 1.0, 1.0, 1.0))
    introCutsceneImage4Node?.UIImage.pivot = float2(0.0, 0.0)
    set_frame_pivot(introCutsceneImage4Node, float2(0.0, 0.0))
    set_parent(introCutsceneImage4Node, introCutsceneImage4FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage4BevelBottomNode = panel(float2(200.0, 8.0), [])
    introCutsceneImage4BevelBottomNode.name = "introCutsceneImage4BevelBottomNode"
    set_image_color(introCutsceneImage4BevelBottomNode, INTRO_IMAGE_BEVEL_DARK_COLOR)
    set_frame_pivot(introCutsceneImage4BevelBottomNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage4BevelBottomNode, introCutsceneImage4FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage4BevelRightNode = panel(float2(8.0, 200.0), [])
    introCutsceneImage4BevelRightNode.name = "introCutsceneImage4BevelRightNode"
    set_image_color(introCutsceneImage4BevelRightNode, INTRO_IMAGE_BEVEL_DARKER_COLOR)
    set_frame_pivot(introCutsceneImage4BevelRightNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage4BevelRightNode, introCutsceneImage4FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage5FrameNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage5FrameNode.name = "introCutsceneImage5FrameNode"
    set_image_color(introCutsceneImage5FrameNode, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneImage5FrameNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage5FrameNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    introCutsceneImage5FrameNode.isActive = false

    introCutsceneImage5ShadowNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage5ShadowNode.name = "introCutsceneImage5ShadowNode"
    set_image_color(introCutsceneImage5ShadowNode, INTRO_IMAGE_SHADOW_COLOR)
    set_frame_pivot(introCutsceneImage5ShadowNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage5ShadowNode, introCutsceneImage5FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage5Node = panel(float2(200.0, 200.0), [])
    introCutsceneImage5Node.name = "introCutsceneImage5Node"
    introCutsceneImage5Node?.UIImage.textureId = introCutsceneTexture5
    set_image_color(introCutsceneImage5Node, float4(1.0, 1.0, 1.0, 1.0))
    introCutsceneImage5Node?.UIImage.pivot = float2(0.0, 0.0)
    set_frame_pivot(introCutsceneImage5Node, float2(0.0, 0.0))
    set_parent(introCutsceneImage5Node, introCutsceneImage5FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage5BevelBottomNode = panel(float2(200.0, 8.0), [])
    introCutsceneImage5BevelBottomNode.name = "introCutsceneImage5BevelBottomNode"
    set_image_color(introCutsceneImage5BevelBottomNode, INTRO_IMAGE_BEVEL_DARK_COLOR)
    set_frame_pivot(introCutsceneImage5BevelBottomNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage5BevelBottomNode, introCutsceneImage5FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage5BevelRightNode = panel(float2(8.0, 200.0), [])
    introCutsceneImage5BevelRightNode.name = "introCutsceneImage5BevelRightNode"
    set_image_color(introCutsceneImage5BevelRightNode, INTRO_IMAGE_BEVEL_DARKER_COLOR)
    set_frame_pivot(introCutsceneImage5BevelRightNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage5BevelRightNode, introCutsceneImage5FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage6FrameNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage6FrameNode.name = "introCutsceneImage6FrameNode"
    set_image_color(introCutsceneImage6FrameNode, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneImage6FrameNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage6FrameNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    introCutsceneImage6FrameNode.isActive = false

    introCutsceneImage6ShadowNode = panel(float2(200.0, 200.0), [])
    introCutsceneImage6ShadowNode.name = "introCutsceneImage6ShadowNode"
    set_image_color(introCutsceneImage6ShadowNode, INTRO_IMAGE_SHADOW_COLOR)
    set_frame_pivot(introCutsceneImage6ShadowNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage6ShadowNode, introCutsceneImage6FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage6Node = panel(float2(200.0, 200.0), [])
    introCutsceneImage6Node.name = "introCutsceneImage6Node"
    introCutsceneImage6Node?.UIImage.textureId = introCutsceneTexture6
    set_image_color(introCutsceneImage6Node, float4(1.0, 1.0, 1.0, 1.0))
    introCutsceneImage6Node?.UIImage.pivot = float2(0.0, 0.0)
    set_frame_pivot(introCutsceneImage6Node, float2(0.0, 0.0))
    set_parent(introCutsceneImage6Node, introCutsceneImage6FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage6BevelBottomNode = panel(float2(200.0, 8.0), [])
    introCutsceneImage6BevelBottomNode.name = "introCutsceneImage6BevelBottomNode"
    set_image_color(introCutsceneImage6BevelBottomNode, INTRO_IMAGE_BEVEL_DARK_COLOR)
    set_frame_pivot(introCutsceneImage6BevelBottomNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage6BevelBottomNode, introCutsceneImage6FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneImage6BevelRightNode = panel(float2(8.0, 200.0), [])
    introCutsceneImage6BevelRightNode.name = "introCutsceneImage6BevelRightNode"
    set_image_color(introCutsceneImage6BevelRightNode, INTRO_IMAGE_BEVEL_DARKER_COLOR)
    set_frame_pivot(introCutsceneImage6BevelRightNode, float2(0.0, 0.0))
    set_parent(introCutsceneImage6BevelRightNode, introCutsceneImage6FrameNode, AddChildStrategy.KeepLocalTransform)

    introCutsceneNameNode = text(intro_dialogue_name(0))
    introCutsceneNameNode.name = "introCutsceneNameNode"
    set_text_font_size(introCutsceneNameNode, ui_h(DIALOGUE_NAME_FONT_SIZE))
    set_text_color(introCutsceneNameNode, DIALOGUE_NAME_COLOR)
    apply_name_font(introCutsceneNameNode)
    configure_single_line_text(introCutsceneNameNode)
    introCutsceneNameNode?.UIText.horAlignment = TextHorAlignment.Left
    introCutsceneNameNode?.UIText.vertAlignment = TextVertAlignment.Top

    introCutsceneReplicaNode = text("")
    introCutsceneReplicaNode.name = "introCutsceneReplicaNode"
    set_text_font_size(introCutsceneReplicaNode, ui_h(INTRO_REPLIC_FONT_SIZE))
    set_text_color(introCutsceneReplicaNode, DIALOGUE_TEXT_COLOR)
    apply_dialogue_font(introCutsceneReplicaNode)
    configure_intro_replica_text(introCutsceneReplicaNode, intro_text_width())

    introCutsceneTextColumnNode = vbox([introCutsceneNameNode, introCutsceneReplicaNode])
    introCutsceneTextColumnNode.name = "introCutsceneTextColumnNode"
    set_spacing(introCutsceneTextColumnNode, ui_h(8.0))
    set_alignment(introCutsceneTextColumnNode, LayoutAlignment.TopLeft)
    set_frame_pivot(introCutsceneTextColumnNode, float2(0.0, 0.0))

    set_parent(introCutsceneTextColumnNode, introCutsceneRoot, AddChildStrategy.KeepLocalTransform)
    introCutsceneTextColumnNode.isActive = false

    introFadeOverlay = panel(res, [])
    introFadeOverlay.name = "introFadeOverlay"
    set_image_color(introFadeOverlay, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(introFadeOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(introFadeOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    introFadeOverlay.isActive = false

    introCutsceneSkipTextNode = text(intro_cutscene_skip_hint_text())
    introCutsceneSkipTextNode.name = "introCutsceneSkipTextNode"
    set_text_font_size(introCutsceneSkipTextNode, ui_h(CUTSCENE_SKIP_HINT_FONT_SIZE))
    set_text_color(introCutsceneSkipTextNode, CUTSCENE_SKIP_HINT_COLOR)
    apply_dialogue_font(introCutsceneSkipTextNode)
    introCutsceneSkipTextNode?.UIText.autoResizeFrame = true
    introCutsceneSkipTextNode?.UIText.wordWrapping = false
    introCutsceneSkipTextNode?.UIText.horAlignment = TextHorAlignment.Right

    let skipBarH = ui_h(CUTSCENE_SKIP_BAR_HEIGHT)
    introCutsceneSkipBarFillNode = panel(float2(0.0, skipBarH), [])
    introCutsceneSkipBarFillNode.name = "introCutsceneSkipBarFillNode"
    set_image_color(introCutsceneSkipBarFillNode, CUTSCENE_SKIP_BAR_FILL_COLOR)
    set_frame_pivot(introCutsceneSkipBarFillNode, float2(0.0, 0.0))

    introCutsceneSkipBarBgNode = panel(float2(ui_w(CUTSCENE_SKIP_BAR_MIN_WIDTH), skipBarH), [introCutsceneSkipBarFillNode])
    introCutsceneSkipBarBgNode.name = "introCutsceneSkipBarBgNode"
    set_image_color(introCutsceneSkipBarBgNode, CUTSCENE_SKIP_BAR_BG_COLOR)
    set_frame_pivot(introCutsceneSkipBarBgNode, float2(1.0, 1.0))
    theme_set_image(introCutsceneSkipBarBgNode, THEME_TEX_PILL, CUTSCENE_SKIP_BAR_BG_COLOR)
    theme_set_image(introCutsceneSkipBarFillNode, THEME_TEX_PILL, CUTSCENE_SKIP_BAR_FILL_COLOR)
    introSkipHeadNode = panel(float2(1.0, 1.0), [])
    introSkipHeadNode.name = "introSkipHeadNode"
    introSkipHeadNode?.UIImage.textureId = juice_glow_texture()
    set_frame_pivot(introSkipHeadNode, float2(0.5, 0.5))
    set_parent(introSkipHeadNode, introCutsceneSkipBarBgNode, AddChildStrategy.KeepLocalTransform)
    introSkipHeadNode.isActive = false

    introCutsceneSkipRoot = panel(float2(0.0, 0.0), [])
    introCutsceneSkipRoot.name = "introCutsceneSkipRoot"
    set_image_color(introCutsceneSkipRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneSkipRoot, float2(1.0, 1.0))
    introSkipPlateNode = panel(float2(1.0, 1.0), [])
    introSkipPlateNode.name = "introSkipPlateNode"
    theme_set_kit(introSkipPlateNode, KIT_PANEL_DARK)
    set_parent(introSkipPlateNode, introCutsceneSkipRoot, AddChildStrategy.KeepLocalTransform)
    set_parent(introCutsceneSkipTextNode, introCutsceneSkipRoot, AddChildStrategy.KeepLocalTransform)
    set_parent(introCutsceneSkipBarBgNode, introCutsceneSkipRoot, AddChildStrategy.KeepLocalTransform)
    set_parent(introCutsceneSkipRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(introCutsceneSkipRoot, float2(1.0, 1.0))
    introCutsceneSkipRoot.isActive = false
    apply_intro_cutscene_skip_layout()

    introCutsceneSlideX = 0.0
    introNameSlideX = intro_name_hidden_left_x()
    apply_intro_cutscene_layout()
}



def public start_intro_cutscene() {
    ensure_intro_cutscene_assets_loaded()
    intro_stop_dialogue_audio()
    intro_stop_battle_sfx()
    introSuppressTypewriterSkip = false
    reset_intro_cutscene_skip_ui()
    introCutscenePhase = INTRO_FADE_TO_BLACK
    introCutsceneT = 0.0
    introCutsceneSlideX = 0.0
    introPictureSlideDone = false
    introNameSlideX = intro_name_hidden_left_x()
    introTypewriterCharCount = 0
    introTypewriterAccumulator = 0.0
    introCutsceneLayoutMode = INTRO_LAYOUT_SEQ1
    introActiveBottomYRatio = INTRO_IMAGE_BOTTOM_Y_RATIO
    introDialogueBeat = 0
    introDialogueSubPhase = INTRO_DIALOGUE_NAME_SLIDE
    introSeq3SlideX = 0.0
    introSeq4SlideX = 0.0
    introSeq5SlideX = 0.0
    introSeq6SlideX = 0.0
    introSeq3SlideDone = false
    introSeq4SlideDone = false
    introSeq5SlideDone = false
    introSeq6SlideDone = false
    introSeq3Visible = false
    introSeq4Visible = false
    introSeq5Visible = false
    introSeq6Visible = false
    introStorySceneIdx = INTRO_STORY_SCENE_NONE
    introSlideTargetBeat = 0
    intro_reset_shake_state()
    introCutsceneImageNode?.UIImage.textureId = introCutsceneTexture
    introActiveMainTextureAspect = introTextureAspect
    update_intro_texture_aspect()
    set_intro_image_visible(false)
    set_intro_text_visible(false)
    set_intro_seq3_visible(false)
    set_intro_seq4_visible(false)
    set_intro_seq5_visible(false)
    set_intro_seq6_visible(false)
    refresh_intro_name_text()
    refresh_intro_replica_text()
    apply_intro_slide_positions()
    set_intro_fade_alpha(0.0)
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = true
    }
    apply_screen_visibility()
}



def public stat_unlock_cutscene_texture(statIdx : int) : TextureId {
    if (statIdx == STAT_CHURCH_IDX) {
        return churchCutsceneTexture
    }
    if (statIdx == STAT_PEOPLE_IDX) {
        return introCutsceneTexture3
    }
    if (statIdx == STAT_RICH_LOVE_IDX) {
        return introCutsceneTexture2
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return introCutsceneTexture4
    }
    return introCutsceneTexture5
}



def public apply_loaded_intro_textures() {
    update_intro_texture_aspect()
    update_intro_texture2_aspect()
    update_intro_texture3_aspect()
    update_intro_texture4_aspect()
    update_intro_texture5_aspect()
    update_intro_texture6_aspect()
    update_intro_texture7_aspect()
    update_intro_texture8_aspect()
    update_intro_texture9_aspect()
    update_intro_texture10_aspect()
    update_intro_texture11_aspect()
    update_intro_texture12_aspect()
    update_intro_texture13_aspect()
    update_intro_texture14_aspect()
    update_intro_texture15_aspect()
    update_intro_texture16_aspect()
    if (introCutsceneImageNode.isAlive) {
        introCutsceneImageNode?.UIImage.textureId = introCutsceneTexture
    introActiveMainTextureAspect = introTextureAspect
    }
    if (introCutsceneImage3Node.isAlive) {
        introCutsceneImage3Node?.UIImage.textureId = introCutsceneTexture3
    }
    if (introCutsceneImage4Node.isAlive) {
        introCutsceneImage4Node?.UIImage.textureId = introCutsceneTexture4
    }
    if (introCutsceneImage5Node.isAlive) {
        introCutsceneImage5Node?.UIImage.textureId = introCutsceneTexture5
    }
    if (introCutsceneImage6Node.isAlive) {
        introCutsceneImage6Node?.UIImage.textureId = introCutsceneTexture6
    }
}



def public ensure_intro_cutscene_assets_loaded() {
    if (introCutsceneAssetsLoaded) {
        return
    }
    ashfordCutsceneTexture = request_texture(ASHFORD_CUTSCENE_TEXTURE_PATH)
    introCutsceneTexture = request_texture(INTRO_TEXTURE_PATH_SEQ1)
    introCutsceneTexture2 = request_texture(INTRO_TEXTURE_PATH_SEQ2)
    introCutsceneTexture3 = request_texture(INTRO_TEXTURE_PATH_SEQ3)
    introCutsceneTexture4 = request_texture(INTRO_TEXTURE_PATH_SEQ4)
    introCutsceneTexture5 = request_texture(INTRO_TEXTURE_PATH_SEQ5)
    introCutsceneTexture6 = request_texture(INTRO_TEXTURE_PATH_SEQ6)
    introCutsceneTexture7 = request_texture(INTRO_TEXTURE_PATH_SEQ7)
    introCutsceneTexture8 = request_texture(INTRO_TEXTURE_PATH_SEQ8)
    introCutsceneTexture9 = request_texture(INTRO_TEXTURE_PATH_SEQ9)
    introCutsceneTexture10 = request_texture(INTRO_TEXTURE_PATH_SEQ10)
    introCutsceneTexture11 = request_texture(INTRO_TEXTURE_PATH_SEQ11)
    introCutsceneTexture12 = request_texture(INTRO_TEXTURE_PATH_SEQ12)
    introCutsceneTexture13 = request_texture(INTRO_TEXTURE_PATH_SEQ13)
    introCutsceneTexture14 = request_texture(INTRO_TEXTURE_PATH_SEQ14)
    introCutsceneTexture15 = request_texture(INTRO_TEXTURE_PATH_SEQ15)
    introCutsceneTexture16 = request_texture(INTRO_TEXTURE_PATH_SEQ16)
    churchCutsceneTexture = request_texture(CHURCH_CUTSCENE_TEXTURE_PATH)
    for (i in range(INTRO_DIALOGUE_BEAT_COUNT)) {
        if (intro_dialogue_sound_path(i) != "") {
            introDialogueSounds[i] = request_sound(intro_dialogue_sound_path(i))
        }
    }
    for (i in range(CHURCH_CUTSCENE_SOUND_COUNT)) {
        if (church_cutscene_sound_path(i) != "") {
            churchCutsceneSounds[i] = request_sound(church_cutscene_sound_path(i))
        }
    }
    load_intro_cutscene_music()
    load_intro_battle_sfx()
    introCutsceneAssetsLoaded = true
    apply_loaded_intro_textures()
}



def public intro_tick_typewriter(dt : float) : bool {
    if (introSuppressTypewriterSkip) {
        introSuppressTypewriterSkip = false
    } elif (intro_any_input_pressed()) {
        finish_intro_typewriter()
        return true
    }
    let totalChars = typewriter_text_length(intro_current_replic())
    introTypewriterAccumulator += INTRO_TYPEWRITER_CHARS_PER_SEC * dt
    while (introTypewriterCharCount < totalChars && introTypewriterAccumulator >= 1.0) {
        introTypewriterCharCount++
        introTypewriterAccumulator -= 1.0
    }
    refresh_intro_replica_text()
    return introTypewriterCharCount >= totalChars
}



def public intro_tick_post_text_wait(dt : float) : bool {
    if (intro_any_input_pressed()) {
        if (intro_beat_has_dialogue_audio(introDialogueBeat)) {
            intro_stop_dialogue_audio()
        }
        introSuppressTypewriterSkip = true
        return true
    }
    if (intro_beat_has_dialogue_audio(introDialogueBeat) && intro_is_dialogue_audio_playing()) {
        return false
    }
    introCutsceneT += dt
    return introCutsceneT >= INTRO_POST_TEXT_WAIT_DURATION
}



def public intro_clear_multi_corner_images() {
    set_intro_seq3_visible(false)
    set_intro_seq4_visible(false)
    set_intro_seq5_visible(false)
    set_intro_seq6_visible(false)
    introSeq3SlideX = 0.0
    introSeq4SlideX = 0.0
    introSeq5SlideX = 0.0
    introSeq6SlideX = 0.0
    introSeq3SlideDone = false
    introSeq4SlideDone = false
    introSeq5SlideDone = false
    introSeq6SlideDone = false
}



def public intro_reset_shake_state() {
    introShakeT = 0.0
    introShakeOffsetX = 0.0
    introShakeOffsetY = 0.0
    introPostShakeAction = INTRO_POST_SHAKE_ACTION_NONE
}



def public intro_tick_shake_offset(dt : float) {
    introShakeT += dt
    if (introShakeT >= INTRO_SHAKE_DURATION) {
        introShakeOffsetX = 0.0
        introShakeOffsetY = 0.0
        return
    }
    let decay = 1.0 - introShakeT / INTRO_SHAKE_DURATION
    let amp = ui_w(INTRO_SHAKE_AMPLITUDE) * decay
    let freq = 28.0
    introShakeOffsetX = sin(introShakeT * freq * PI * 2.0) * amp
    introShakeOffsetY = cos(introShakeT * freq * 1.3 * PI * 2.0) * amp * 0.6
}



def public intro_begin_single_image_scene(sceneIdx : int; tex : TextureId; aspect : float; beat : int) {
    introStorySceneIdx = sceneIdx
    introCutsceneLayoutMode = INTRO_LAYOUT_SEQ1
    introActiveBottomYRatio = INTRO_IMAGE_BOTTOM_Y_RATIO
    intro_clear_multi_corner_images()
    set_intro_image_visible(false)
    intro_set_main_texture(tex, aspect)
    introCutsceneSlideX = intro_image_hidden_left_x()
    introPictureSlideDone = false
    introSlideTargetBeat = beat
    introCutscenePhase = INTRO_PICTURE_WAIT
    introCutsceneT = 0.0
    set_intro_text_visible(false)
    set_intro_image_visible(true)
    apply_intro_cutscene_layout()
}



def public intro_begin_scene3() {
    set_intro_text_visible(false)
    intro_clear_multi_corner_images()
    set_intro_image_visible(false)
    introStorySceneIdx = INTRO_STORY_SCENE_3
    introCutsceneLayoutMode = INTRO_LAYOUT_SCENE3_PAIR
    intro_update_scene3_layout_metrics()
    intro_set_main_texture(introCutsceneTexture7, introTextureAspect7)
    introCutsceneImage3Node?.UIImage.textureId = introCutsceneTexture8
    introCutsceneSlideX = intro_image_hidden_left_x()
    introPictureSlideDone = false
    introSlideTargetBeat = 17
    introCutscenePhase = INTRO_PICTURE_WAIT
    introCutsceneT = 0.0
    set_intro_image_visible(true)
    apply_intro_cutscene_layout()
}



def public intro_begin_scene3_seq8_slide() {
    set_intro_text_visible(false)
    introSlideTargetBeat = 19
    introCutscenePhase = INTRO_SEQ3_SLIDE_IN
    introCutsceneT = 0.0
    introSeq3SlideDone = false
    introSeq3SlideX = intro_scene3_seq8_hidden_left_x()
    set_intro_seq3_visible(true)
    apply_intro_cutscene_layout()
}



def public intro_begin_scene4() {
    intro_begin_single_image_scene(INTRO_STORY_SCENE_4, introCutsceneTexture9, introTextureAspect9, 23)
}



def public intro_begin_scene5() {
    intro_start_seq10_battle_sfx()
    intro_begin_single_image_scene(INTRO_STORY_SCENE_5, introCutsceneTexture10, introTextureAspect10, 25)
}



def public intro_begin_scene6() {
    intro_begin_single_image_scene(INTRO_STORY_SCENE_6, introCutsceneTexture13, introTextureAspect13, 28)
}



def public intro_begin_scene7() {
    intro_begin_single_image_scene(INTRO_STORY_SCENE_7, introCutsceneTexture16, introTextureAspect16, 33)
}



def public intro_begin_shake_transition(fromTex : TextureId; fromAspect : float; toTex : TextureId; toAspect : float; postAction : int) {
    set_intro_text_visible(false)
    intro_reset_shake_state()
    intro_set_main_texture(fromTex, fromAspect)
    introShakeToTexture = toTex
    introShakeToAspect = toAspect
    introPostShakeAction = postAction
    introCutscenePhase = INTRO_IMAGE_SHAKE
    introCutsceneT = 0.0
    apply_intro_cutscene_layout()
}



def public intro_finish_shake_transition() {
    let postAction = introPostShakeAction
    introShakeT = 0.0
    introShakeOffsetX = 0.0
    introShakeOffsetY = 0.0
    introPostShakeAction = INTRO_POST_SHAKE_ACTION_NONE
    intro_set_main_texture(introShakeToTexture, introShakeToAspect)
    apply_intro_cutscene_layout()
    if (postAction == INTRO_POST_SHAKE_ACTION_SCENE_6) {
        introCutscenePhase = INTRO_POST_SHAKE_WAIT
        introCutsceneT = 0.0
    } elif (postAction == INTRO_POST_SHAKE_ACTION_DIALOGUE_23) {
        begin_intro_dialogue_beat(29, true)
        introCutscenePhase = INTRO_DIALOGUE
        set_intro_text_visible(true)
        apply_intro_slide_positions()
    }
}



def public intro_seq3_slide_target_beat() : int {
    if (intro_seq3_slide_is_scene3_pair()) {
        return introSlideTargetBeat
    }
    return 7
}



def public intro_seq3_slide_speed_for_current() : float {
    if (intro_seq3_slide_is_scene3_pair()) {
        return intro_scene3_seq8_slide_speed()
    }
    return intro_corner_slide_speed()
}



def public intro_seq3_hidden_left_x_for_current() : float {
    if (intro_seq3_slide_is_scene3_pair()) {
        return intro_scene3_seq8_hidden_left_x()
    }
    return intro_seq3_hidden_left_x()
}



def public intro_advance_after_dialogue_wait() {
    let beat = introDialogueBeat
    if (beat >= 2 && beat < 6) {
        begin_intro_dialogue_beat(beat + 1, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 6) {
        set_intro_text_visible(false)
        introCutscenePhase = INTRO_SEQ3_SLIDE_IN
        introCutsceneT = 0.0
        introSeq3SlideDone = false
        intro_update_multi_layout_metrics()
        introSeq3SlideX = intro_seq3_hidden_left_x()
        set_intro_seq3_visible(true)
        apply_intro_cutscene_layout()
        return
    }
    if (beat == 7) {
        begin_intro_dialogue_beat(8, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 8) {
        set_intro_text_visible(false)
        introCutscenePhase = INTRO_SEQ4_APPEAR
        introCutsceneT = 0.0
        introSeq4SlideDone = false
        intro_update_multi_layout_metrics()
        introSeq4SlideX = intro_seq4_hidden_left_x()
        set_intro_seq4_visible(true)
        apply_intro_cutscene_layout()
        return
    }
    if (beat == 9) {
        begin_intro_dialogue_beat(10, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 10) {
        set_intro_text_visible(false)
        introCutscenePhase = INTRO_SEQ5_APPEAR
        introCutsceneT = 0.0
        introSeq5SlideDone = false
        intro_update_multi_layout_metrics()
        introSeq5SlideX = intro_seq5_hidden_left_x()
        set_intro_seq5_visible(true)
        apply_intro_cutscene_layout()
        return
    }
    if (beat == 11) {
        begin_intro_dialogue_beat(12, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 12) {
        set_intro_text_visible(false)
        introCutscenePhase = INTRO_SEQ6_APPEAR
        introCutsceneT = 0.0
        introSeq6SlideDone = false
        intro_update_multi_layout_metrics()
        introSeq6SlideX = intro_seq6_hidden_left_x()
        set_intro_seq6_visible(true)
        apply_intro_cutscene_layout()
        return
    }
    if (beat == 13) {
        begin_intro_dialogue_beat(14, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 14) {
        begin_intro_dialogue_beat(15, false)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 15) {
        begin_intro_dialogue_beat(16, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 16) {
        intro_begin_scene3()
        return
    }
    if (beat == 17) {
        begin_intro_dialogue_beat(18, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 18) {
        intro_begin_scene3_seq8_slide()
        return
    }
    if (beat >= 19 && beat <= 21) {
        begin_intro_dialogue_beat(beat + 1, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 22) {
        intro_begin_scene4()
        return
    }
    if (beat == 23) {
        begin_intro_dialogue_beat(24, false)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 24) {
        intro_begin_scene5()
        return
    }
    if (beat >= 25 && beat <= 26) {
        begin_intro_dialogue_beat(beat + 1, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 27) {
        intro_begin_shake_transition(
            introCutsceneTexture11, introTextureAspect11,
            introCutsceneTexture12, introTextureAspect12,
            INTRO_POST_SHAKE_ACTION_SCENE_6
        )
        return
    }
    if (beat == 28) {
        intro_begin_black_pause_before_edwin_death()
        return
    }
    if (beat >= 29 && beat <= 31) {
        begin_intro_dialogue_beat(beat + 1, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 32) {
        intro_begin_scene7()
        return
    }
    if (beat >= 33 && beat <= 38) {
        begin_intro_dialogue_beat(beat + 1, true)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    if (beat == 39) {
        begin_intro_dialogue_beat(40, false)
        introCutscenePhase = INTRO_DIALOGUE
        return
    }
    introCutscenePhase = INTRO_FADE_OUT
    introCutsceneT = 0.0
}


// ----- dialogue -----
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
    juice_on_day_advanced()
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
        begin_stat_unlock_popup(statIdx)
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
    if (!zoomRoot.isAlive) {
        return
    }
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
    juice_on_choice_selected(choiceIdx)
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
        juice_on_fatal_choice(defeatingStat)
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
    characterEnterStartX = characterAnimOffsetX
    characterEnterT = 0.0
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


// ----- hud -----
def public info_tooltip_full_text(target : int) : string {
    var text = info_tooltip_title(target, playerNickname, currentDay, kingdomStats)
    let body = info_tooltip_body(target, currentDay)
    if (length(body) > 0) {
        text = "{text}\n{body}"
    }
    if (!is_stat_info_hover_target(target)) {
        return text
    }
    let statIdx = target - INFO_HOVER_STAT_BASE
    text = "{text}\n{stat_tooltip_influences_header()}"
    text = "{text}\n{stat_tooltip_influence_buff_line(statIdx)}"
    text = "{text}\n{stat_tooltip_influence_debuff_line(statIdx)}"
    if (stat_tooltip_has_active_modifiers(statIdx)) {
        text = "{text}\n{stat_tooltip_active_header()}"
        let activeBuff = stat_tooltip_active_buff_line(statIdx)
        let activeDebuff = stat_tooltip_active_debuff_line(statIdx)
        if (length(activeBuff) > 0) {
            text = "{text}\n{activeBuff}"
        }
        if (length(activeDebuff) > 0) {
            text = "{text}\n{activeDebuff}"
        }
    }
    return text
}



def public update_stat_synergy_tooltip_sections(statIdx : int) {
    set_info_tooltip_section(infoTooltipInfluenceHeaderNode, true, stat_tooltip_influences_header())
    set_info_tooltip_section(infoTooltipInfluenceBuffNode, true, stat_tooltip_influence_buff_line(statIdx))
    set_info_tooltip_section(infoTooltipInfluenceDebuffNode, true, stat_tooltip_influence_debuff_line(statIdx))
    if (!stat_tooltip_has_active_modifiers(statIdx)) {
        set_info_tooltip_section(infoTooltipActiveHeaderNode, false, "")
        set_info_tooltip_section(infoTooltipActiveBuffNode, false, "")
        set_info_tooltip_section(infoTooltipActiveDebuffNode, false, "")
        return
    }
    set_info_tooltip_section(infoTooltipActiveHeaderNode, true, stat_tooltip_active_header())
    let activeBuff = stat_tooltip_active_buff_line(statIdx)
    let activeDebuff = stat_tooltip_active_debuff_line(statIdx)
    set_info_tooltip_section(infoTooltipActiveBuffNode, length(activeBuff) > 0, activeBuff)
    set_info_tooltip_section(infoTooltipActiveDebuffNode, length(activeDebuff) > 0, activeDebuff)
}



def public info_tooltip_layout_signature(target : int) : string {
    return info_tooltip_full_text(target)
}



def public info_tooltip_screen_pos_x_for_stat(statIdx : int) : float {
    let columnW = stat_column_width()
    let gap = ui_w(STAT_COLUMN_GAP)
    let barLeft = screen_w() * 0.5 - stat_bar_total_width() * 0.5
    var x = barLeft
    for (i in range(STAT_MAIN_COUNT)) {
        let idx = STAT_BAR_DISPLAY_ORDER[i]
        if (!statUnlocked[idx]) {
            continue
        }
        if (idx == statIdx) {
            return x + columnW * 0.5
        }
        x += columnW + gap
    }
    if (statIdx == STAT_SUCCESSION_IDX && statUnlocked[STAT_SUCCESSION_IDX]) {
        let dividerGap = ui_w(STAT_BAR_DIVIDER_GAP)
        let dividerW = ui_w(STAT_BAR_DIVIDER_WIDTH)
        x += dividerGap + dividerW + dividerGap
        return x + columnW * 0.5
    }
    return barLeft + columnW * 0.5
}



def public info_tooltip_screen_pos_y_below_top_bar() : float {
    return ui_h(TOP_BAR_HEIGHT) + ui_h(INFO_TOOLTIP_OFFSET_Y)
}



def public info_tooltip_screen_pos_y_above_bottom_bar() : float {
    return screen_h() - ui_h(BOTTOM_BAR_HEIGHT) - ui_h(INFO_TOOLTIP_ABOVE_OFFSET)
}



def public position_info_tooltip(target : int) {
    if (!infoTooltipRoot.isAlive) {
        return
    }
    infoTooltipRoot.set_parent(uiCanvas, AddChildStrategy.KeepLocalTransform)
    if (is_stat_info_hover_target(target)) {
        set_frame_pivot(infoTooltipRoot, float2(0.5, 1.0))
        let statIdx = target - INFO_HOVER_STAT_BASE
        let centerX = clamp_info_tooltip_center_x(info_tooltip_screen_pos_x_for_stat(statIdx))
        let posY = info_tooltip_screen_pos_y_above_bottom_bar()
        set_frame_pos(infoTooltipRoot, float2(centerX, posY))
        return
    }
    set_frame_pivot(infoTooltipRoot, float2(0.5, 0.0))
    let offsetY = ui_h(INFO_TOOLTIP_OFFSET_Y)
    var pos = float2(0.0, ui_h(TOP_BAR_HEIGHT) + offsetY)
    if (target == INFO_HOVER_DAY) {
        let anchor = dayTextNode
        if (anchor.isAlive) {
            let frameSize = anchor?.UIFrame.size
            let anchorCenterX = ui_w(TOP_BAR_HORIZONTAL_PADDING) + frameSize.x * 0.5
            pos = float2(clamp_info_tooltip_center_x(anchorCenterX), pos.y)
        }
    } elif (target == INFO_HOVER_NICKNAME) {
        let daySize = dayTextNode?.UIFrame.size
        let nickSize = nicknameTextNode?.UIFrame.size
        let anchorCenterX = ui_w(TOP_BAR_HORIZONTAL_PADDING) + daySize.x + ui_w(TOP_BAR_LEFT_INFO_SPACING) + nickSize.x * 0.5
        pos = float2(clamp_info_tooltip_center_x(anchorCenterX), pos.y)
    }
    set_frame_pos(infoTooltipRoot, pos)
}



def public show_info_tooltip(target : int) {
    if (is_game_paused() || is_in_defeat_flow()) {
        return
    }
    hoveredInfoTarget = target
    update_info_tooltip_content()
    apply_info_tooltip_layout()
    position_info_tooltip(target)
    infoTooltipRoot.isActive = true
}



def public hide_info_tooltip() {
    hoveredInfoTarget = INFO_HOVER_NONE
    if (!infoTooltipRoot.isAlive) {
        return
    }
    infoTooltipRoot.isActive = false
    infoTooltipRoot.set_parent(uiCanvas, AddChildStrategy.KeepLocalTransform)
}



def public clear_info_hover_if(target : int) {
    if (hoveredInfoTarget == target) {
        hide_info_tooltip()
    }
}



def public set_info_hover_stat(statIdx : int) {
    if (is_game_paused() || is_in_defeat_flow()) {
        return
    }
    show_info_tooltip(INFO_HOVER_STAT_BASE + statIdx)
}



def public on_advisor_button_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (is_advisor_popup_open()) {
        close_advisor_popup()
        return
    }
    if (!can_open_advisor_popup()) {
        return
    }
    open_advisor_popup()
}



def public on_advisor_button_mouse_over(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    if (can_open_advisor_popup() || is_advisor_popup_open()) {
        advisorButtonHovered = true
    }
}



def public on_advisor_button_mouse_out(evt : UIMouseEvent) {
    advisorButtonHovered = false
}



def public on_info_day_mouse_over(evt : UIMouseEvent) {
    show_info_tooltip(INFO_HOVER_DAY)
}



def public on_info_day_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_DAY)
}



def public on_info_nickname_mouse_over(evt : UIMouseEvent) {
    show_info_tooltip(INFO_HOVER_NICKNAME)
}



def public on_info_nickname_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_NICKNAME)
}



def public on_stat_0_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(0)
}



def public on_stat_1_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(1)
}



def public on_stat_2_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(2)
}



def public on_stat_3_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(3)
}



def public on_stat_4_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(4)
}



def public on_stat_5_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(5)
}



def public on_stat_6_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(6)
}



def public on_stat_7_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(7)
}



def public on_stat_8_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(8)
}



def public on_stat_0_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 0)
}



def public on_stat_1_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 1)
}



def public on_stat_2_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 2)
}



def public on_stat_3_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 3)
}



def public on_stat_4_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 4)
}



def public on_stat_5_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 5)
}



def public on_stat_6_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 6)
}



def public on_stat_7_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 7)
}



def public on_stat_8_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 8)
}



def public update_advisor_icon_visibility() {
    if (!advisorHudIconNode.isAlive) {
        return
    }
    advisorHudIconNode.isActive = is_advisor_hud_enabled() && is_gameplay_hud_visible()
    if (!advisorHudIconNode.isActive) {
        advisorHudIconHovered = false
        apply_advisor_icon_visual()
        if (is_advisor_popup_open()) {
            reset_advisor_popup_state()
        }
    }
}



def public update_day_text() {
    if (!dayTextNode.isAlive) {
        return
    }
    dayTextNode?.UIText.text = day_label(currentDay)
}



def public update_nickname_text() {
    if (!nicknameTextNode.isAlive) {
        return
    }
    nicknameTextNode?.UIText.text = playerNickname
}



def public apply_top_bar_layout() {
    let resX = screen_w()
    let barH = ui_h(TOP_BAR_HEIGHT)
    if (topBarRoot.isAlive) {
        set_frame_size(topBarRoot, float2(resX, barH))
    }
    if (topBarBorderNode.isAlive) {
        set_frame_size(topBarBorderNode, float2(resX, ui_box_border()))
    }
    if (topBarLeftInfoNode.isAlive) {
        set_frame_size(topBarLeftInfoNode, float2(ui_w(TOP_BAR_LEFT_INFO_WIDTH), barH))
        set_anchor_insets(topBarLeftInfoNode, ui_w(TOP_BAR_HORIZONTAL_PADDING), 0.0)
        set_spacing(topBarLeftInfoNode, ui_w(TOP_BAR_LEFT_INFO_SPACING))
    }
    if (menuButtonNode.isAlive) {
        set_anchor_insets(menuButtonNode, -ui_w(TOP_BAR_PAUSE_MARGIN), 0.0)
        apply_menu_button_layout(menuButtonNode, ui_w(TOP_BAR_PAUSE_BUTTON_WIDTH), ui_h(TOP_BAR_PAUSE_BUTTON_HEIGHT), TOP_BAR_PAUSE_BUTTON_FONT_SIZE, true, float2(1.0, 0.5))
    }
    if (dayTextNode.isAlive) {
        set_text_font_size(dayTextNode, ui_h(DAY_FONT_SIZE))
    }
    if (nicknameTextNode.isAlive) {
        set_text_font_size(nicknameTextNode, ui_h(NICKNAME_FONT_SIZE))
    }
    apply_top_info_layout()
}



def public apply_bottom_bar_layout() {
    let resX = screen_w()
    let barH = ui_h(BOTTOM_BAR_HEIGHT)
    if (statPlateNode.isAlive && statBarRoot.isAlive) {
        let plate = float2(statBarRoot?.UIFrame.size.x + ui_w(64.0), barH - ui_h(16.0))
        set_frame_size(statPlateNode, plate)
        statPlateNode?.UIImage.size = plate
    }
    if (bottomBarRoot.isAlive) {
        set_frame_size(bottomBarRoot, float2(resX, barH))
    }
    if (bottomBarBorderNode.isAlive) {
        set_frame_size(bottomBarBorderNode, float2(resX, ui_box_border()))
    }
    if (advisorButtonNode.isAlive) {
        set_anchor_insets(advisorButtonNode, -ui_w(BOTTOM_BAR_ADVISOR_MARGIN), 0.0)
        apply_menu_button_layout(advisorButtonNode, ui_w(BOTTOM_BAR_ADVISOR_BUTTON_WIDTH), ui_h(BOTTOM_BAR_ADVISOR_BUTTON_HEIGHT), BOTTOM_BAR_ADVISOR_BUTTON_FONT_SIZE, true, float2(1.0, 0.5))
    }
    apply_stat_bar_layout()
}



def public can_open_advisor_popup() : bool {
    if (is_advisor_popup_open() || is_pause_menu_open() || is_character_profile_open() || is_in_defeat_flow() || is_on_main_menu()) {
        return false
    }
    return bottomBarRoot.isAlive && bottomBarRoot.isActive
}



def public can_hover_advisor_icon() : bool {
    return is_advisor_hud_enabled() && advisorHudIconNode.isAlive && advisorHudIconNode.isActive && !is_on_main_menu() && !is_pause_menu_open() && !is_in_defeat_flow() && !is_character_profile_open() && !is_advisor_popup_open()
}



def public load_advisor_icon_alpha_pixels() {
    advisorIconAlphaWidth = 0
    advisorIconAlphaHeight = 0
    advisorIconAlphaPixels |> clear()
    get_image_content(ADVISOR_ICON_TEXTURE_PATH) $(var bitmap : Bitmap) {
        advisorIconAlphaWidth = bitmap.w
        advisorIconAlphaHeight = bitmap.h
        let pixelCount = bitmap.w * bitmap.h
        advisorIconAlphaPixels |> resize(pixelCount)
        for (i in range(pixelCount)) {
            advisorIconAlphaPixels[i] = bitmap.pixels[i]
        }
    }
}



def public advisor_icon_mouse_local_xy() : float2 {
    var mouseLocal : float3
    if (!get_ui_mouse_position(advisorHudIconNode, mouseLocal)) {
        return float2(-1.0, -1.0)
    }
    let iconSize = advisorHudIconNode?.UIFrame.size
    let pivot = advisorHudIconNode?.UIFrame.pivot
    return float2(
        mouseLocal.x + iconSize.x * pivot.x,
        mouseLocal.y + iconSize.y * pivot.y
    )
}



def public is_mouse_over_advisor_icon_opaque() : bool {
    if (!can_hover_advisor_icon()) {
        return false
    }
    if (advisorIconAlphaWidth <= 0 || advisorIconAlphaHeight <= 0 || length(advisorIconAlphaPixels) == 0) {
        return false
    }
    if (!is_mouse_inside_frame(advisorHudIconNode?.UIFrame)) {
        return false
    }
    let local = advisor_icon_mouse_local_xy()
    let iconSize = advisorHudIconNode?.UIFrame.size
    if (local.x < 0.0 || local.y < 0.0 || local.x > iconSize.x || local.y > iconSize.y) {
        return false
    }
    let px = clamp(int((local.x / iconSize.x) * float(advisorIconAlphaWidth)), 0, advisorIconAlphaWidth - 1)
    let py = clamp(int((local.y / iconSize.y) * float(advisorIconAlphaHeight)), 0, advisorIconAlphaHeight - 1)
    let idx = py * advisorIconAlphaWidth + px
    let alpha = int((advisorIconAlphaPixels[idx] >> 24u) & 0xFFu)
    return is_character_pixel_opaque(alpha)
}



def public is_mouse_over_advisor_icon() : bool {
    return is_mouse_over_advisor_icon_opaque()
}



def public apply_advisor_icon_visual() {
    if (!advisorHudIconNode.isAlive) {
        return
    }
    let tex = advisorHudIconHovered ? advisorHudIconHoverTexture : advisorHudIconTexture
    set_node_ui_texture(advisorHudIconNode, tex)
}



def public apply_advisor_icon_layout() {
    if (!advisorHudIconNode.isAlive) {
        return
    }
    let size = ui_size(float2(ADVISOR_ICON_SIZE, ADVISOR_ICON_SIZE))
    set_frame_size(advisorHudIconNode, size)
    set_node_ui_image_size(advisorHudIconNode, size)
    set_frame_pos(advisorHudIconNode, float2(-ui_w(ADVISOR_ICON_PADDING_RIGHT), -ui_h(ADVISOR_ICON_PADDING_BOTTOM)))
    set_anchor_insets(advisorHudIconNode, -ui_w(ADVISOR_ICON_PADDING_RIGHT), -ui_h(ADVISOR_ICON_PADDING_BOTTOM))
}



def public build_advisor_hud_icon() {
    let advisorSize = ui_size(float2(ADVISOR_ICON_SIZE, ADVISOR_ICON_SIZE))
    advisorHudIconNode = panel(advisorSize, [])
    advisorHudIconNode.name = "advisorHudIconNode"
    advisorHudIconHovered = false
    apply_advisor_icon_visual()
    configure_stat_icon(advisorHudIconNode)
    configure_info_hover_target(advisorHudIconNode)
    set_parent(advisorHudIconNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(advisorHudIconNode, float2(1.0, 1.0))
    set_frame_pivot(advisorHudIconNode, float2(1.0, 1.0))
    apply_advisor_icon_layout()
}



def public update_advisor_character_texture_aspect(tex : TextureId) {
    get_texture_size(tex) $(size : int2) {
        if (size.y > 0) {
            advisorCharacterTextureAspect = float(size.x) / float(size.y)
        }
    }
}



def public advisor_portrait_max_size() : float2 {
    return float2(ui_w(ADVISOR_PANEL_PORTRAIT_WIDTH), ui_h(ADVISOR_PANEL_PORTRAIT_HEIGHT))
}



def public advisor_portrait_display_size() : float2 {
    let maxSize = advisor_portrait_max_size()
    let aspect = advisorCharacterTextureAspect
    if (maxSize.y <= 0.0 || aspect <= 0.0) {
        return maxSize
    }
    let boxAspect = maxSize.x / maxSize.y
    if (boxAspect > aspect) {
        let h = maxSize.y
        return float2(h * aspect, h)
    }
    let w = maxSize.x
    return float2(w, w / aspect)
}



def public advisor_popup_panel_width() : float {
    let designW = ui_w(ADVISOR_PANEL_WIDTH)
    let portraitReserve = max(0.0, advisor_portrait_display_size().x - ui_w(ADVISOR_PANEL_PORTRAIT_OVERLAP))
    let margin = ui_w(32.0)
    let maxW = screen_w() - margin * 2.0 - portraitReserve
    return max(ui_w(480.0), min(designW, maxW))
}



def public advisor_popup_panel_outer_width() : float {
    if (advisorPopupPanelNode.isAlive) {
        return advisorPopupPanelNode?.UIFrame.size.x
    }
    return advisor_popup_panel_width()
}



def public advisor_popup_panel_outer_height() : float {
    if (advisorPopupPanelNode.isAlive) {
        return advisorPopupPanelNode?.UIFrame.size.y
    }
    return advisor_popup_content_height() + 2.0 * ui_box_border()
}



def public advisor_action_row_count() : int {
    return (MAX_ADVISOR_ACTIONS + ADVISOR_PANEL_GRID_COLS - 1) / ADVISOR_PANEL_GRID_COLS
}



def public advisor_popup_grid_content_width(innerW : float) : float {
    let pad = ui_h(ADVISOR_PANEL_PADDING)
    let leftPad = ui_w(ADVISOR_PANEL_CONTENT_LEFT_PAD)
    return innerW - leftPad - pad - pad
}



def public advisor_popup_scroll_content_width(gridContentW : float) : float {
    return max(gridContentW - ui_w(ADVISOR_PANEL_SCROLLBAR_WIDTH), ui_w(200.0))
}



def public advisor_popup_card_size(contentW : float) : float2 {
    let gap = ui_w(ADVISOR_PANEL_GRID_GAP)
    let cardW = (contentW - gap) / float(ADVISOR_PANEL_GRID_COLS)
    let cardH = ui_h(ADVISOR_ACTION_CARD_HEIGHT)
    return float2(cardW, cardH)
}



def public advisor_action_effect_line_height() : float {
    return ui_h(ADVISOR_ACTION_EFFECT_FONT_SIZE * ADVISOR_ACTION_EFFECT_LINE_HEIGHT_SCALE)
}



def public advisor_action_effect_block_height(hasMinus : bool; hasPlus : bool) : float {
    let lineH = advisor_action_effect_line_height()
    let gap = ui_h(ADVISOR_ACTION_EFFECT_LINE_SPACING)
    if (hasMinus && hasPlus) {
        return lineH * 2.0 + gap
    }
    if (hasMinus || hasPlus) {
        return lineH
    }
    return lineH
}



def public advisor_action_desc_text_height(innerH : float) : float {
    let pad = ui_h(ADVISOR_ACTION_CARD_INNER_PAD)
    let titleH = ui_h(ADVISOR_ACTION_TITLE_FONT_SIZE)
    let effectBlockH = advisor_action_effect_block_height(true, true)
    let titleDescGap = ui_h(ADVISOR_ACTION_TITLE_DESC_SPACING)
    let descEffectGap = ui_h(ADVISOR_ACTION_DESC_EFFECT_SPACING)
    let reserved = 2.0 * pad + titleH + titleDescGap + descEffectGap + effectBlockH + ui_h(20.0)
    return max(innerH - reserved, ui_h(48.0))
}



def public apply_advisor_card_desc_layout(node : NodeId; textW : float; textH : float) {
    if (!node.isAlive) {
        return
    }
    set_frame_size(node, float2(textW, textH))
    node?.UIText.size = float2(textW, textH)
}



def public advisor_popup_grid_total_height(contentW : float) : float {
    let cardSize = advisor_popup_card_size(contentW)
    let rowGap = ui_h(ADVISOR_PANEL_GRID_GAP)
    let rows = advisor_action_row_count()
    return float(rows) * cardSize.y + float(rows - 1) * rowGap
}



def public advisor_popup_scroll_viewport_height() : float {
    let topBarH = ui_h(TOP_BAR_HEIGHT)
    let bottomBarH = ui_h(BOTTOM_BAR_HEIGHT)
    let pad = ui_h(ADVISOR_PANEL_PADDING)
    let titleH = ui_h(ADVISOR_PANEL_TITLE_FONT_SIZE)
    let titleSpacing = ui_h(ADVISOR_PANEL_TITLE_SPACING)
    let border = ui_box_border()
    let reserved = topBarH + bottomBarH + pad * 2.0 + titleH + titleSpacing + border * 2.0 + ui_h(32.0)
    let available = screen_h() - reserved
    let design = ui_h(ADVISOR_PANEL_SCROLL_VIEWPORT_HEIGHT)
    return max(ui_h(200.0), min(design, available))
}



def public advisor_popup_content_height() : float {
    let pad = ui_h(ADVISOR_PANEL_PADDING)
    let titleH = ui_h(ADVISOR_PANEL_TITLE_FONT_SIZE)
    let titleSpacing = ui_h(ADVISOR_PANEL_TITLE_SPACING)
    let scrollH = advisor_popup_scroll_viewport_height()
    return pad + titleH + titleSpacing + scrollH + pad
}



def public advisor_popup_slide_rest_x() : float {
    return 0.0
}



def public advisor_popup_slide_hidden_right_x() : float {
    let panelW = advisor_popup_panel_outer_width()
    return (screen_w() + panelW) * 0.5
}



def public advisor_popup_slide_speed() : float {
    let travel = screen_w() + advisor_popup_panel_outer_width() * 2.0
    return travel / POPUP_SLIDE_DURATION
}



def public advisor_popup_panel_centered_top_left(slideX : float) : float2 {
    let panelW = advisor_popup_panel_outer_width()
    let panelH = advisor_popup_panel_outer_height()
    let topLeftX = screen_w() * 0.5 - panelW * 0.5 + slideX
    let topBarH = ui_h(TOP_BAR_HEIGHT)
    let bottomBarH = ui_h(BOTTOM_BAR_HEIGHT)
    let topLeftY = topBarH + (screen_h() - topBarH - bottomBarH) * 0.5 - panelH * 0.5
    return float2(topLeftX, topLeftY)
}



def public advisor_popup_open_amount() : float {
    let x = advisorPopupSlideX
    let rest = advisor_popup_slide_rest_x()
    let hiddenRight = advisor_popup_slide_hidden_right_x()
    let closeSpan = hiddenRight - rest
    if (closeSpan <= 0.0) {
        return 0.0
    }
    return clamp(1.0 - (x - rest) / closeSpan, 0.0, 1.0)
}



def public apply_advisor_popup_overlay_from_open_amount() {
    if (!advisorPopupOverlay.isAlive) {
        return
    }
    let alpha = advisor_popup_open_amount() * MENU_OVERLAY_COLOR.w
    set_image_color(advisorPopupOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, alpha))
}



def public update_advisor_popup_slide(dt : float) {
    if (advisorPopupAnimPhase == ADVISOR_ANIM_IDLE) {
        return
    }
    let speed = advisor_popup_slide_speed()
    advisorPopupSlideX = move_toward(advisorPopupSlideX, advisorPopupSlideTargetX, speed * dt)
    set_advisor_popup_slide_x(advisorPopupSlideX)
    apply_advisor_popup_overlay_from_open_amount()
    if (advisorPopupAnimPhase == ADVISOR_ANIM_OPENING) {
        if (abs(advisorPopupSlideX - advisorPopupSlideTargetX) < 1.0) {
            advisorPopupSlideX = advisorPopupSlideTargetX
            set_advisor_popup_slide_x(advisorPopupSlideX)
            advisorPopupAnimPhase = ADVISOR_ANIM_OPEN
        }
        return
    }
    if (advisorPopupAnimPhase == ADVISOR_ANIM_CLOSING) {
        if (abs(advisorPopupSlideX - advisorPopupSlideTargetX) < 1.0) {
            reset_advisor_popup_state()
        }
    }
}



def public apply_advisor_popup_portrait_layout(panelPos : float2) {
    if (!advisorPopupPortraitNode.isAlive) {
        return
    }
    let panelH = advisor_popup_panel_outer_height()
    let displaySize = advisor_portrait_display_size()
    let overlap = ui_w(ADVISOR_PANEL_PORTRAIT_OVERLAP)
    let posX = panelPos.x - displaySize.x + overlap
    let posY = panelPos.y + panelH - displaySize.y
    set_frame_size(advisorPopupPortraitNode, displaySize)
    advisorPopupPortraitNode?.UIImage.size = displaySize
    advisorPopupPortraitNode?.UIImage.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    set_frame_pos(advisorPopupPortraitNode, float2(posX, posY))
}



def public advisor_popup_grid_row_count() : int {
    if (!advisorPopupGridNode.isAlive) {
        return 0
    }
    return length(advisorPopupGridNode.get_children())
}



def public advisor_popup_grid_needs_rebuild() : bool {
    if (!advisorPopupGridNode.isAlive) {
        return true
    }
    if (advisor_popup_grid_row_count() != advisor_action_row_count()) {
        return true
    }
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (!advisorActionSlotFillNodes[i].isAlive || !advisorActionOverlayNodes[i].isAlive || !advisorActionEffectRowNodes[i].isAlive || !advisorActionHitNodes[i].isAlive) {
            return true
        }
    }
    return false
}



def public update_advisor_scroll_ranges() {
    if (!advisorPopupScrollAreaNode.isAlive || !advisorPopupScrollContentNode.isAlive) {
        return
    }
    advisorPopupScrollAreaNode?.UIScrollArea.content = advisorPopupScrollContentNode?.UIFrame
    advisorPopupScrollAreaNode?.UIScrollArea.maskArea = advisorPopupScrollAreaNode?.UIMask
    if (advisorPopupScrollBarNode.isAlive) {
        advisorPopupScrollAreaNode?.UIScrollArea.verticalScrollbar = advisorPopupScrollBarNode?.UIVerticalScrollbar
    }
    advisorPopupScrollAreaNode?.UIScrollArea.updateScrollbarRanges()
    advisorPopupScrollAreaNode?.UIScrollArea.invalidate()
}



def public build_advisor_scrollbar(scrollNode : NodeId; viewportH : float) : NodeId {
    let barW = ui_w(ADVISOR_PANEL_SCROLLBAR_WIDTH)
    let barNode = panel(float2(barW, viewportH), [])
    barNode.name = "advisorScrollBar"
    set_frame_pivot(barNode, float2(1.0, 0.0))
    set_image_color(barNode, float4(0.10, 0.08, 0.06, 0.55))
    add_component(barNode, new UIVerticalScrollbar())
    barNode?.UIVerticalScrollbar.interactable = true

    let handleW = max(barW - ui_w(4.0), ui_w(6.0))
    let handleNode = panel(float2(handleW, ui_h(56.0)), [])
    handleNode.name = "advisorScrollBarHandle"
    set_frame_pivot(handleNode, float2(0.5, 0.5))
    set_image_color(handleNode, float4(0.68, 0.58, 0.42, 0.95))
    handleNode.set_parent(barNode, AddChildStrategy.KeepLocalTransform)
    set_frame_pos(handleNode, float2(barW * 0.5, viewportH * 0.25))

    barNode?.UIVerticalScrollbar.handle = handleNode?.UIFrame
    barNode.set_parent(scrollNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(barNode, float2(1.0, 0.0), float2(1.0, 1.0))
    set_frame_pos(barNode, float2(0.0, 0.0))
    return barNode
}



def public build_advisor_popup_scroll_area(contentW : float; viewportH : float) : NodeId {
    let scrollContentW = advisor_popup_scroll_content_width(contentW)
    let scrollNode = panel(float2(contentW, viewportH), [])
    scrollNode.name = "advisorPopupScrollArea"
    set_frame_pivot(scrollNode, float2(0.0, 0.0))
    set_image_color(scrollNode, DEATH_SUMMARY_BOX_BG_COLOR)
    add_component(scrollNode, new UIMask())
    scrollNode?.UIMask.enabled = true
    scrollNode?.UIMask.showMaskSource = true
    add_component(scrollNode, new UIScrollArea())
    scrollNode?.UIScrollArea.scrollDirection = ScrollDirection.Vertical
    scrollNode?.UIScrollArea.scrollSpeed = 25.0
    scrollNode?.UIScrollArea.enableOverscroll = false
    scrollNode?.UIScrollArea.enableInertia = false

    advisorPopupScrollContentNode = panel(float2(scrollContentW, viewportH), [])
    advisorPopupScrollContentNode.name = "advisorPopupScrollContentNode"
    set_frame_pivot(advisorPopupScrollContentNode, float2(0.0, 0.0))
    set_image_color(advisorPopupScrollContentNode, float4(0.0, 0.0, 0.0, 0.0))
    advisorPopupScrollContentNode.set_parent(scrollNode, AddChildStrategy.KeepLocalTransform)
    set_frame_pos(advisorPopupScrollContentNode, float2(0.0, 0.0))

    advisorPopupScrollBarNode = build_advisor_scrollbar(scrollNode, viewportH)
    advisorPopupScrollBarNode.name = "advisorPopupScrollBarNode"
    scrollNode?.UIScrollArea.content = advisorPopupScrollContentNode?.UIFrame
    scrollNode?.UIScrollArea.maskArea = scrollNode?.UIMask
    scrollNode?.UIScrollArea.verticalScrollbar = advisorPopupScrollBarNode?.UIVerticalScrollbar
    return scrollNode
}



def public apply_advisor_popup_layout() {
    if (!advisorPopupPanelNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let panelW = advisor_popup_panel_width()
    let innerW = panelW - 2.0 * border
    let pad = ui_h(ADVISOR_PANEL_PADDING)
    let leftPad = ui_w(ADVISOR_PANEL_CONTENT_LEFT_PAD)
    let contentW = advisor_popup_grid_content_width(innerW)
    let scrollContentW = advisor_popup_scroll_content_width(contentW)
    rebuild_advisor_popup_grid_if_needed(scrollContentW)
    let cardSize = advisor_popup_card_size(scrollContentW)
    let gridW = scrollContentW
    let gridH = advisor_popup_grid_total_height(scrollContentW)
    let scrollH = advisor_popup_scroll_viewport_height()
    let titleSpacing = ui_h(ADVISOR_PANEL_TITLE_SPACING)
    let titleH = layout_advisor_title_row(contentW)
    let contentH = pad + titleH + titleSpacing + scrollH + pad
    let panelH = contentH + 2.0 * border

    if (advisorPopupScrollAreaNode.isAlive) {
        set_frame_size(advisorPopupScrollAreaNode, float2(contentW, scrollH))
    }
    if (advisorPopupScrollContentNode.isAlive) {
        set_frame_size(advisorPopupScrollContentNode, float2(scrollContentW, gridH))
    }
    if (advisorPopupScrollBarNode.isAlive) {
        set_frame_size(advisorPopupScrollBarNode, float2(ui_w(ADVISOR_PANEL_SCROLLBAR_WIDTH), scrollH))
    }
    if (advisorPopupGridNode.isAlive) {
        set_frame_size(advisorPopupGridNode, float2(gridW, gridH))
        for (i in range(MAX_ADVISOR_ACTIONS)) {
            layout_advisor_action_card(i, cardSize)
        }
        for (row in range(advisor_action_row_count())) {
            let rowNode = get_child(advisorPopupGridNode, row)
            if (rowNode.isAlive) {
                set_frame_size(rowNode, float2(gridW, cardSize.y))
            }
        }
    }
    update_advisor_scroll_ranges()
    if (advisorPopupContentNode.isAlive) {
        set_padding(advisorPopupContentNode, float4(leftPad + pad, pad, pad, pad))
        set_spacing(advisorPopupContentNode, titleSpacing)
        set_frame_size(advisorPopupContentNode, float2(innerW, contentH))
    }
    if (advisorPopupInnerNode.isAlive) {
        set_frame_size(advisorPopupInnerNode, float2(innerW, contentH))
        set_frame_pos(advisorPopupInnerNode, float2(border, border))
    }
    set_frame_size(advisorPopupPanelNode, float2(panelW, panelH))
    set_frame_pivot(advisorPopupPanelNode, float2(0.0, 0.0))

    if (advisorPopupPanelNode.isAlive) {
        set_advisor_popup_slide_x(advisorPopupSlideX)
    }

    if (is_advisor_popup_open()) {
        apply_advisor_popup_overlay_from_open_amount()
    }
}



def public can_execute_advisor_actions() : bool {
    if (!is_advisor_popup_open() || is_in_defeat_flow()) {
        return false
    }
    if (advisorPopupAnimPhase == ADVISOR_ANIM_CLOSING) {
        return false
    }
    // is_game_paused() is true while the advisor popup is open — do not use it here.
    if (is_startup_splash_active() || is_on_main_menu() || is_pause_menu_open() || is_character_profile_open() || is_story_cutscene_active() || is_continue_fade_active()) {
        return false
    }
    return true
}



def public show_advisor_popup_status(message : string) {
    if (length(message) == 0 || !advisorPopupStatusNode.isAlive) {
        return
    }
    advisorPopupStatusNode?.UIText.text = message
    advisorPopupStatusNode.isActive = true
    if (is_advisor_popup_open()) {
        apply_advisor_popup_layout()
    }
}



def public advisor_action_effect_part_color(delta : int; hoverT : float) : float4 {
    var col = (delta > 0) ? STAT_FLASH_POSITIVE_COLOR : STAT_FLASH_NEGATIVE_COLOR
    if (delta > 0) {
        col = lerp(col, float4(0.55, 1.0, 0.62, 1.0), hoverT * 0.35)
    } else {
        col = lerp(col, float4(1.0, 0.45, 0.40, 1.0), hoverT * 0.35)
    }
    return col
}



def public build_advisor_effect_line_node(container : NodeId; lineWidth : float; lineHeight : float) : NodeId {
    let lineNode = text("")
    lineNode.name = "advisorEffectLine"
    configure_advisor_card_line_text(lineNode)
    lineNode?.UIText.autoResizeFrame = false
    lineNode?.UIText.wordWrapping = true
    lineNode?.UIText.horAlignment = TextHorAlignment.Left
    lineNode?.UIText.vertAlignment = TextVertAlignment.Top
    lineNode?.UIText.size = float2(lineWidth, lineHeight)
    set_frame_size(lineNode, float2(lineWidth, lineHeight))
    set_frame_pivot(lineNode, float2(0.0, 0.0))
    lineNode.set_parent(container, AddChildStrategy.KeepLocalTransform)
    lineNode.isActive = false
    return lineNode
}



def public update_advisor_effect_line_text(lineNode : NodeId; lineText : string; deltaSign : int; hoverT : float; enabled : bool; fontSize : float; lineWidth : float; lineHeight : float; yOffset : float) {
    if (!lineNode.isAlive) {
        return
    }
    if (length(lineText) == 0) {
        lineNode.isActive = false
        return
    }
    lineNode.isActive = true
    if (lineNode?.UIText.text != lineText) {
        lineNode?.UIText.text = lineText
    }
    set_text_font_size(lineNode, fontSize)
    let alpha = enabled ? 1.0 : ADVISOR_ACTION_DISABLED_ALPHA
    let partCol = advisor_action_effect_part_color(deltaSign, hoverT)
    set_text_color(lineNode, float4(partCol.x, partCol.y, partCol.z, alpha))
    lineNode?.UIText.size = float2(lineWidth, lineHeight)
    set_frame_size(lineNode, float2(lineWidth, lineHeight))
    set_frame_pos(lineNode, float2(0.0, yOffset))
}



def public update_advisor_action_texture_aspect(actionIdx : int; tex : TextureId) {
    get_texture_size(tex) $(size : int2) {
        if (size.y > 0) {
            advisorActionTextureAspects[actionIdx] = float(size.x) / float(size.y)
        }
    }
}



def public apply_advisor_action_image_cover(actionIdx : int; innerW : float; innerH : float) {
    let node = advisorActionImageNodes[actionIdx]
    if (!node.isAlive) {
        return
    }
    let inner = float2(innerW, innerH)
    set_frame_size(node, inner)
    set_node_ui_image_size(node, inner)
    set_node_ui_texture(node, advisorActionTextures[actionIdx])
    set_node_ui_uv_region(node, intro_cover_uv_for(inner, advisorActionTextureAspects[actionIdx]))
}



def public is_mouse_over_advisor_action_card(actionIdx : int) : bool {
    let border = advisorActionSlotNodes[actionIdx]
    let fill = advisorActionSlotFillNodes[actionIdx]
    if (!border.isAlive || !border.isActive || !fill.isAlive || !fill.isActive) {
        return false
    }
    return is_mouse_inside_frame(fill?.UIFrame)
}



def public bind_advisor_action_hit_click(actionIdx : int) {
    let hit = advisorActionHitNodes[actionIdx]
    if (!hit.isAlive) {
        return
    }
    hit?.UIButton.onClick = @() {
        try_begin_advisor_action(actionIdx)
    }
    set_ui_button_interactable(hit, true)
}



def public is_mouse_over_advisor_popup_panel_area() : bool {
    if (!advisorPopupPanelNode.isAlive || !advisorPopupPanelNode.isActive) {
        return false
    }
    return is_mouse_inside_frame(advisorPopupPanelNode?.UIFrame)
}



def public is_mouse_over_advisor_popup_portrait_area() : bool {
    if (!advisorPopupPortraitNode.isAlive || !advisorPopupPortraitNode.isActive) {
        return false
    }
    return is_mouse_inside_frame(advisorPopupPortraitNode?.UIFrame)
}



def public advisor_popup_left_mouse_down() : bool {
    for (cmd in get_input_command_buffer()) {
        if (cmd is RawMouseInputEvent) {
            let mouse = cmd as RawMouseInputEvent
            if (mouse.kind == RawMouseInputEventKind.MouseDown && mouse.buttonIdx == MouseButton.Left) {
                return true
            }
        }
    }
    return false
}



def public process_advisor_popup_input() {
    if (!is_advisor_popup_open() || advisorPopupAnimPhase == ADVISOR_ANIM_CLOSING) {
        return
    }
    if (!advisorPopupOverlay.isAlive || !advisorPopupOverlay.isActive) {
        return
    }
    if (!advisor_popup_left_mouse_down()) {
        return
    }

    if (can_execute_advisor_actions()) {
        for (i in range(MAX_ADVISOR_ACTIONS)) {
            if (!is_mouse_over_advisor_action_card(i)) {
                continue
            }
            try_begin_advisor_action(i)
            return
        }
    }

    if (!is_mouse_over_advisor_popup_panel_area() && !is_mouse_over_advisor_popup_portrait_area()) {
        if (advisorConfirmOverlay.isAlive && advisorConfirmOverlay.isActive) {
            hide_advisor_confirm()
        } else {
            close_advisor_popup()
        }
    }
}



def public apply_advisor_action_card_visual(actionIdx : int; hoverT : float; enabled : bool) {
    let fill = advisorActionSlotFillNodes[actionIdx]
    let border = advisorActionSlotNodes[actionIdx]
    if (!fill.isAlive) {
        return
    }
    let alpha = enabled ? 1.0 : ADVISOR_ACTION_DISABLED_ALPHA
    set_image_color(fill, float4(0.0, 0.0, 0.0, ADVISOR_ACTION_FILL_HIT_ALPHA * alpha))
    if (border.isAlive) {
        border.localScale = float3(1.0, 1.0, 1.0)
        let borderCol = UI_BOX_BORDER_COLOR
        set_image_color(border, float4(borderCol.x, borderCol.y, borderCol.z, borderCol.w * alpha))
    }
    if (advisorActionImageNodes[actionIdx].isAlive) {
        set_image_color(advisorActionImageNodes[actionIdx], float4(1.0, 1.0, 1.0, alpha))
    }
    if (advisorActionOverlayNodes[actionIdx].isAlive) {
        var overlayCol = lerp(ADVISOR_ACTION_OVERLAY_IDLE_COLOR, ADVISOR_ACTION_OVERLAY_HOVER_COLOR, hoverT)
        overlayCol.w *= alpha
        set_image_color(advisorActionOverlayNodes[actionIdx], overlayCol)
    }
    let textAlpha = alpha
    if (advisorActionTitleNodes[actionIdx].isAlive) {
        var titleCol = ADVISOR_ACTION_TITLE_COLOR
        titleCol = lerp(titleCol, float4(1.0, 1.0, 1.0, 1.0), hoverT * 0.35)
        advisorActionTitleNodes[actionIdx]?.UIText.color = float4(titleCol.x, titleCol.y, titleCol.z, textAlpha)
        advisorActionTitleNodes[actionIdx]?.UIText.wordWrapping = false
    }
    if (advisorActionDescNodes[actionIdx].isAlive) {
        var descCol = ADVISOR_ACTION_DESC_COLOR
        descCol = lerp(descCol, float4(1.0, 0.98, 0.92, 1.0), hoverT * 0.25)
        advisorActionDescNodes[actionIdx]?.UIText.color = float4(descCol.x, descCol.y, descCol.z, textAlpha)
    }
    let deltas = advisor_action_preview_deltas(actionIdx)
    refresh_advisor_action_effect_row(actionIdx, deltas, hoverT, enabled)
}



def public build_advisor_action_slot(actionIdx : int; cardSize : float2) : NodeId {
    let inset = ui_w(2.0)
    let innerW = cardSize.x - inset * 2.0
    let innerH = cardSize.y - inset * 2.0
    let pad = ui_h(ADVISOR_ACTION_CARD_INNER_PAD)
    let textW = innerW - 2.0 * pad
    let deltas = advisor_action_preview_deltas(actionIdx)

    advisorActionImageNodes[actionIdx] = panel(float2(innerW, innerH), [])
    advisorActionImageNodes[actionIdx].name = "advisorActionImage_{actionIdx}"
    set_image_color(advisorActionImageNodes[actionIdx], float4(1.0, 1.0, 1.0, 1.0))
    advisorActionImageNodes[actionIdx]?.UIImage.pivot = float2(0.0, 0.0)
    set_frame_pivot(advisorActionImageNodes[actionIdx], float2(0.0, 0.0))
    apply_advisor_action_image_cover(actionIdx, innerW, innerH)

    advisorActionOverlayNodes[actionIdx] = panel(float2(innerW, innerH), [])
    advisorActionOverlayNodes[actionIdx].name = "advisorActionOverlay_{actionIdx}"
    set_frame_pivot(advisorActionOverlayNodes[actionIdx], float2(0.0, 0.0))
    set_image_color(advisorActionOverlayNodes[actionIdx], ADVISOR_ACTION_OVERLAY_IDLE_COLOR)

    advisorActionTitleNodes[actionIdx] = text(advisor_action_title(actionIdx))
    advisorActionTitleNodes[actionIdx].name = "advisorActionTitle_{actionIdx}"
    set_text_font_size(advisorActionTitleNodes[actionIdx], ui_h(ADVISOR_ACTION_TITLE_FONT_SIZE))
    set_text_color(advisorActionTitleNodes[actionIdx], ADVISOR_ACTION_TITLE_COLOR)
    configure_advisor_card_title_text(advisorActionTitleNodes[actionIdx])
    set_frame_width(advisorActionTitleNodes[actionIdx], textW)

    advisorActionDescNodes[actionIdx] = text(advisor_action_description(actionIdx))
    advisorActionDescNodes[actionIdx].name = "advisorActionDesc_{actionIdx}"
    set_text_font_size(advisorActionDescNodes[actionIdx], ui_h(ADVISOR_ACTION_DESC_FONT_SIZE))
    set_text_color(advisorActionDescNodes[actionIdx], ADVISOR_ACTION_DESC_COLOR)
    configure_advisor_card_desc_text(advisorActionDescNodes[actionIdx])
    let descH = advisor_action_desc_text_height(innerH)
    apply_advisor_card_desc_layout(advisorActionDescNodes[actionIdx], textW, descH)

    let effectBlockH = advisor_action_effect_block_height(true, true)
    advisorActionEffectRowNodes[actionIdx] = panel(float2(textW, effectBlockH), [])
    advisorActionEffectRowNodes[actionIdx].name = "advisorActionEffectRow_{actionIdx}"
    set_image_color(advisorActionEffectRowNodes[actionIdx], float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(advisorActionEffectRowNodes[actionIdx], float2(0.0, 0.0))
    let effectLineH = advisor_action_effect_line_height()
    advisorActionEffectMinusNodes[actionIdx] = build_advisor_effect_line_node(advisorActionEffectRowNodes[actionIdx], textW, effectLineH)
    advisorActionEffectMinusNodes[actionIdx].name = "advisorActionEffectMinus_{actionIdx}"
    advisorActionEffectPlusNodes[actionIdx] = build_advisor_effect_line_node(advisorActionEffectRowNodes[actionIdx], textW, effectLineH)
    advisorActionEffectPlusNodes[actionIdx].name = "advisorActionEffectPlus_{actionIdx}"
    advisorActionEffectEmptyNodes[actionIdx] = build_advisor_effect_line_node(advisorActionEffectRowNodes[actionIdx], textW, effectLineH)
    advisorActionEffectEmptyNodes[actionIdx].name = "advisorActionEffectEmpty_{actionIdx}"
    refresh_advisor_action_effect_row(actionIdx, deltas, 0.0, true)

    let bodyCol = vbox([advisorActionDescNodes[actionIdx], advisorActionEffectRowNodes[actionIdx]])
    bodyCol.name = "advisorActionBodyCol_{actionIdx}"
    set_spacing(bodyCol, ui_h(ADVISOR_ACTION_DESC_EFFECT_SPACING))
    set_alignment(bodyCol, LayoutAlignment.TopLeft)
    bodyCol?.UIVerticalLayout.childForceExpandWidth = false
    bodyCol?.UIVerticalLayout.childForceExpandHeight = false
    set_frame_pivot(bodyCol, float2(0.0, 0.0))
    set_frame_size(bodyCol, float2(innerW, innerH))

    let textCol = vbox([advisorActionTitleNodes[actionIdx], bodyCol])
    textCol.name = "advisorActionTextCol_{actionIdx}"
    set_spacing(textCol, ui_h(ADVISOR_ACTION_TITLE_DESC_SPACING))
    set_alignment(textCol, LayoutAlignment.TopLeft)
    textCol?.UIVerticalLayout.childForceExpandWidth = false
    textCol?.UIVerticalLayout.childForceExpandHeight = false
    set_padding(textCol, float4(pad, pad, pad, pad))
    set_frame_pivot(textCol, float2(0.0, 0.0))
    set_frame_size(textCol, float2(innerW, innerH))

    let fillNode = panel(float2(innerW, innerH), [])
    fillNode.name = "advisorActionFill_{actionIdx}"
    set_frame_pivot(fillNode, float2(0.0, 0.0))
    set_image_color(fillNode, float4(0.0, 0.0, 0.0, ADVISOR_ACTION_FILL_HIT_ALPHA))

    advisorActionImageNodes[actionIdx].set_parent(fillNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(advisorActionImageNodes[actionIdx], TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    advisorActionOverlayNodes[actionIdx].set_parent(fillNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(advisorActionOverlayNodes[actionIdx], TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    textCol.set_parent(fillNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(textCol, TOP_LEFT_ANCHOR)
    set_frame_pos(textCol, float2(0.0, 0.0))

    advisorActionHitNodes[actionIdx] = panel(float2(innerW, innerH), [])
    advisorActionHitNodes[actionIdx].name = "advisorActionHit_{actionIdx}"
    set_frame_pivot(advisorActionHitNodes[actionIdx], float2(0.0, 0.0))
    set_image_color(advisorActionHitNodes[actionIdx], float4(0.0, 0.0, 0.0, ADVISOR_ACTION_FILL_HIT_ALPHA))
    add_component(advisorActionHitNodes[actionIdx], new UIButton())
    advisorActionHitNodes[actionIdx].set_parent(fillNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(advisorActionHitNodes[actionIdx], TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    bind_advisor_action_hit_click(actionIdx)

    let borderNode = panel(cardSize, [fillNode])
    borderNode.name = "advisorActionSlot_{actionIdx}"
    set_frame_pivot(borderNode, float2(0.0, 0.0))
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pos(fillNode, float2(inset, inset))
    advisorActionSlotNodes[actionIdx] = borderNode
    advisorActionSlotFillNodes[actionIdx] = fillNode
    advisorActionHovered[actionIdx] = false
    advisorActionHoverT[actionIdx] = 0.0
    apply_advisor_action_card_visual(actionIdx, 0.0, true)
    return borderNode
}



def public hide_advisor_confirm() {
    pendingAdvisorActionIdx = -1
    if (advisorConfirmOverlay.isAlive) {
        advisorConfirmOverlay.isActive = false
    }
}



def public apply_advisor_confirm_layout() {
    if (!advisorConfirmPanelNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let panelW = ui_w(ADVISOR_CONFIRM_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    let padding = ui_h(DEATH_SUMMARY_BOX_PADDING)
    let textW = innerW - 2.0 * padding
    set_text_font_size(advisorConfirmTitleNode, ui_h(ADVISOR_CONFIRM_TITLE_FONT_SIZE))
    set_text_font_size(advisorConfirmBodyNode, ui_h(ADVISOR_CONFIRM_BODY_FONT_SIZE))
    set_text_font_size(advisorConfirmPreviewNode, ui_h(ADVISOR_CONFIRM_BODY_FONT_SIZE))
    set_frame_width(advisorConfirmTitleNode, textW)
    set_frame_width(advisorConfirmBodyNode, textW)
    set_frame_width(advisorConfirmPreviewNode, textW)
    let buttonW = (textW - ui_w(16.0)) * 0.5
    layout_centered_answer_button(advisorConfirmYesNode, buttonW)
    layout_centered_answer_button(advisorConfirmNoNode, buttonW)
    let yesFill = answer_button_fill(advisorConfirmYesNode)
    let noFill = answer_button_fill(advisorConfirmNoNode)
    if (yesFill.isAlive) {
        yesFill?.UIText.fontSize = ui_h(ADVISOR_CONFIRM_BUTTON_FONT_SIZE)
        yesFill?.UIText.text = advisor_confirm_yes()
    }
    if (noFill.isAlive) {
        noFill?.UIText.fontSize = ui_h(ADVISOR_CONFIRM_BUTTON_FONT_SIZE)
        noFill?.UIText.text = advisor_confirm_no()
    }
    let titleH = max(advisorConfirmTitleNode?.UIFrame.size.y, ui_h(ADVISOR_CONFIRM_TITLE_FONT_SIZE + 8.0))
    let bodyH = max(advisorConfirmBodyNode?.UIFrame.size.y, ui_h(ADVISOR_CONFIRM_BODY_FONT_SIZE + 8.0))
    let previewH = max(advisorConfirmPreviewNode?.UIFrame.size.y, ui_h(ADVISOR_CONFIRM_BODY_FONT_SIZE + 8.0))
    let buttonH = try_again_button_height()
    let spacing = ui_h(16.0)
    let contentH = titleH + bodyH + previewH + buttonH + spacing * 3.0 + 2.0 * padding
    set_spacing(advisorConfirmContentNode, spacing)
    set_padding(advisorConfirmContentNode, float4(padding, padding, padding, padding))
    set_frame_size(advisorConfirmContentNode, float2(innerW, contentH))
    set_frame_size(advisorConfirmInnerNode, float2(innerW, contentH))
    set_frame_pos(advisorConfirmInnerNode, float2(border, border))
    set_frame_size(advisorConfirmPanelNode, float2(panelW, contentH + 2.0 * border))
}



def public show_advisor_confirm(actionIdx : int) {
    if (actionIdx < 0 || actionIdx >= MAX_ADVISOR_ACTIONS) {
        return
    }
    if (!is_advisor_action_available(actionIdx) || !can_execute_advisor_actions()) {
        return
    }
    pendingAdvisorActionIdx = actionIdx
    let deltas = advisor_action_preview_deltas(actionIdx)
    advisorConfirmTitleNode?.UIText.text = advisor_confirm_title()
    advisorConfirmBodyNode?.UIText.text = advisor_action_description(actionIdx)
    advisorConfirmPreviewNode?.UIText.text = format_advisor_action_preview(deltas)
    apply_advisor_confirm_layout()
    advisorConfirmOverlay.isActive = true
}



def public execute_advisor_action(actionIdx : int) {
    if (actionIdx < 0 || actionIdx >= MAX_ADVISOR_ACTIONS) {
        return
    }
    if (advisorActionClickHandledThisFrame) {
        return
    }
    if (!is_advisor_action_available(actionIdx) || !can_execute_advisor_actions()) {
        return
    }
    advisorActionClickHandledThisFrame = true
    juice_on_advisor_purchase(actionIdx)
    let deltas = advisor_action_apply_deltas(actionIdx)
    begin_advisor_action_cooldown(actionIdx)
    hide_advisor_confirm()
    close_advisor_popup()
    if (deltas_have_stat_change(deltas)) {
        start_stat_confirm_anims_from_deltas(deltas)
    }
}



def public build_advisor_confirm_ui() {
    let border = ui_box_border()
    let panelW = ui_w(ADVISOR_CONFIRM_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    advisorConfirmTitleNode = text(advisor_confirm_title())
    advisorConfirmTitleNode.name = "advisorConfirmTitleNode"
    set_text_color(advisorConfirmTitleNode, float4(1.0, 1.0, 1.0, 1.0))
    configure_profile_title_text(advisorConfirmTitleNode)
    advisorConfirmBodyNode = text("")
    advisorConfirmBodyNode.name = "advisorConfirmBodyNode"
    set_text_color(advisorConfirmBodyNode, TEXT_COLOR)
    configure_body_button_text(advisorConfirmBodyNode)
    advisorConfirmPreviewNode = text("")
    advisorConfirmPreviewNode.name = "advisorConfirmPreviewNode"
    set_text_color(advisorConfirmPreviewNode, float4(0.85, 0.78, 0.55, 1.0))
    configure_body_button_text(advisorConfirmPreviewNode)
    let buttonW = innerW * 0.42
    advisorConfirmYesNode = create_answer_button(advisor_confirm_yes(), buttonW)
    advisorConfirmYesNode.name = "advisorConfirmYesNode"
    advisorConfirmNoNode = create_answer_button(advisor_confirm_no(), buttonW)
    advisorConfirmNoNode.name = "advisorConfirmNoNode"
    let buttonRow = hbox([advisorConfirmYesNode, advisorConfirmNoNode])
    buttonRow.name = "advisorConfirmButtonRow"
    set_spacing(buttonRow, ui_w(16.0))
    set_alignment(buttonRow, LayoutAlignment.MiddleCenter)
    advisorConfirmContentNode = vbox([advisorConfirmTitleNode, advisorConfirmBodyNode, advisorConfirmPreviewNode, buttonRow])
    advisorConfirmContentNode.name = "advisorConfirmContentNode"
    set_alignment(advisorConfirmContentNode, LayoutAlignment.TopLeft)
    advisorConfirmInnerNode = panel(float2(innerW, 200.0), [advisorConfirmContentNode])
    advisorConfirmInnerNode.name = "advisorConfirmInnerNode"
    set_image_color(advisorConfirmInnerNode, DEATH_SUMMARY_BOX_BG_COLOR)
    advisorConfirmPanelNode = panel(float2(panelW, 220.0), [advisorConfirmInnerNode])
    advisorConfirmPanelNode.name = "advisorConfirmPanelNode"
    set_image_color(advisorConfirmPanelNode, UI_BOX_BORDER_COLOR)
    add_component(advisorConfirmPanelNode, new UIButton())
    advisorConfirmOverlay = panel(float2(screen_w(), screen_h()), [advisorConfirmPanelNode])
    advisorConfirmOverlay.name = "advisorConfirmOverlay"
    set_image_color(advisorConfirmOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.55))
    set_parent(advisorConfirmOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(advisorConfirmPanelNode, float2(0.5, 0.5))
    set_frame_pivot(advisorConfirmPanelNode, float2(0.5, 0.5))
    advisorConfirmOverlay.isActive = false
    apply_advisor_confirm_layout()
}



def public build_advisor_popup_grid(contentW : float) : NodeId {
    let cardSize = advisor_popup_card_size(contentW)
    let gap = ui_w(ADVISOR_PANEL_GRID_GAP)
    let rowGap = ui_h(ADVISOR_PANEL_GRID_GAP)
    let gridW = contentW
    let gridH = advisor_popup_grid_total_height(contentW)
    let rows = advisor_action_row_count()
    var rowNodes : array<NodeId>
    for (row in range(rows)) {
        var colNodes : array<NodeId>
        for (col in range(ADVISOR_PANEL_GRID_COLS)) {
            let slotIdx = row * ADVISOR_PANEL_GRID_COLS + col
            if (slotIdx >= MAX_ADVISOR_ACTIONS) {
                continue
            }
            let slot = build_advisor_action_slot(slotIdx, cardSize)
            set_frame_pivot(slot, float2(0.0, 0.0))
            push(colNodes, slot)
        }
        let rowNode = hbox(colNodes)
        rowNode.name = "advisorPopupGridRow_{row}"
        set_spacing(rowNode, gap)
        set_alignment(rowNode, LayoutAlignment.TopLeft)
        set_frame_pivot(rowNode, float2(0.0, 0.0))
        set_frame_size(rowNode, float2(gridW, cardSize.y))
        rowNode?.UIHorizontalLayout.childForceExpandWidth = false
        rowNode?.UIHorizontalLayout.childForceExpandHeight = false
        push(rowNodes, rowNode)
    }
    let grid = vbox(rowNodes)
    grid.name = "advisorPopupGrid"
    set_spacing(grid, rowGap)
    set_alignment(grid, LayoutAlignment.TopLeft)
    set_frame_pivot(grid, float2(0.0, 0.0))
    set_frame_size(grid, float2(gridW, gridH))
    grid?.UIVerticalLayout.childForceExpandWidth = false
    grid?.UIVerticalLayout.childForceExpandHeight = false
    return grid
}



def public build_advisor_popup_ui() {
    update_advisor_character_texture_aspect(advisorCharacterTexture)
    let border = ui_box_border()
    let panelW = advisor_popup_panel_width()
    let innerW = panelW - 2.0 * border
    let portraitSize = advisor_portrait_display_size()

    advisorPopupTitleNode = text(advisor_panel_title())
    advisorPopupTitleNode.name = "advisorPopupTitleNode"
    set_text_font_size(advisorPopupTitleNode, ui_h(ADVISOR_PANEL_TITLE_FONT_SIZE))
    set_text_color(advisorPopupTitleNode, float4(1.0, 1.0, 1.0, 1.0))
    configure_profile_title_text(advisorPopupTitleNode)
    advisorPopupTitleNode?.UIText.wordWrapping = false
    advisorPopupTitleNode?.UIText.autoResizeFrame = true

    advisorPopupStatusNode = text("")
    advisorPopupStatusNode.name = "advisorPopupStatusNode"
    set_text_font_size(advisorPopupStatusNode, ui_h(ADVISOR_PANEL_STATUS_FONT_SIZE))
    set_text_color(advisorPopupStatusNode, ADVISOR_ACTION_DESC_COLOR)
    configure_advisor_status_text(advisorPopupStatusNode)
    advisorPopupStatusNode.isActive = false

    advisorPopupTitleRowNode = hbox([advisorPopupTitleNode, advisorPopupStatusNode])
    advisorPopupTitleRowNode.name = "advisorPopupTitleRowNode"
    set_spacing(advisorPopupTitleRowNode, ui_w(ADVISOR_PANEL_TITLE_ROW_GAP))
    set_alignment(advisorPopupTitleRowNode, LayoutAlignment.MiddleLeft)
    advisorPopupTitleRowNode?.UIHorizontalLayout.childForceExpandWidth = false
    advisorPopupTitleRowNode?.UIHorizontalLayout.childForceExpandHeight = false
    set_frame_pivot(advisorPopupTitleRowNode, float2(0.0, 0.0))

    let contentW = advisor_popup_grid_content_width(innerW)
    let scrollContentW = advisor_popup_scroll_content_width(contentW)
    let scrollH = advisor_popup_scroll_viewport_height()
    advisorPopupScrollAreaNode = build_advisor_popup_scroll_area(contentW, scrollH)
    advisorPopupScrollAreaNode.name = "advisorPopupScrollAreaNode"
    advisorPopupGridNode = build_advisor_popup_grid(scrollContentW)
    advisorPopupGridNode.name = "advisorPopupGridNode"
    set_frame_pivot(advisorPopupGridNode, float2(0.0, 0.0))
    advisorPopupGridNode.set_parent(advisorPopupScrollContentNode, AddChildStrategy.KeepLocalTransform)
    set_frame_pos(advisorPopupGridNode, float2(0.0, 0.0))

    advisorPopupContentNode = vbox([advisorPopupTitleRowNode, advisorPopupScrollAreaNode])
    advisorPopupContentNode.name = "advisorPopupContentNode"
    set_spacing(advisorPopupContentNode, ui_h(ADVISOR_PANEL_TITLE_SPACING))
    set_alignment(advisorPopupContentNode, LayoutAlignment.TopLeft)
    set_frame_pivot(advisorPopupContentNode, float2(0.0, 0.0))
    advisorPopupContentNode?.UIVerticalLayout.childForceExpandWidth = false
    advisorPopupContentNode?.UIVerticalLayout.childForceExpandHeight = false

    let pad = ui_h(ADVISOR_PANEL_PADDING)
    let leftPad = ui_w(ADVISOR_PANEL_CONTENT_LEFT_PAD)
    let titleH = ui_h(ADVISOR_PANEL_TITLE_FONT_SIZE)
    let contentH = pad + titleH + ui_h(ADVISOR_PANEL_TITLE_SPACING) + scrollH + pad
    set_padding(advisorPopupContentNode, float4(leftPad + pad, pad, pad, pad))
    set_frame_size(advisorPopupContentNode, float2(innerW, contentH))

    advisorPopupInnerNode = panel(float2(innerW, contentH), [advisorPopupContentNode])
    advisorPopupInnerNode.name = "advisorPopupInnerNode"
    set_image_color(advisorPopupInnerNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(advisorPopupInnerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(advisorPopupInnerNode, float2(0.0, 0.0))
    set_frame_pos(advisorPopupInnerNode, float2(border, border))

    advisorPopupPanelNode = panel(float2(panelW, contentH + 2.0 * border), [advisorPopupInnerNode])
    advisorPopupPanelNode.name = "advisorPopupPanelNode"
    set_image_color(advisorPopupPanelNode, UI_BOX_BORDER_COLOR)
    set_alignment(advisorPopupPanelNode, LayoutAlignment.TopLeft)
    set_frame_pivot(advisorPopupPanelNode, float2(0.0, 0.0))
    set_parent(advisorPopupPanelNode, advisorPopupOverlay, AddChildStrategy.KeepLocalTransform)

    advisorPopupPortraitNode = panel(portraitSize, [])
    advisorPopupPortraitNode.name = "advisorPopupPortraitNode"
    advisorPopupPortraitNode?.UIImage.textureId = advisorCharacterTexture
    advisorPopupPortraitNode?.UIImage.size = portraitSize
    advisorPopupPortraitNode?.UIImage.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    set_image_color(advisorPopupPortraitNode, float4(1.0, 1.0, 1.0, 1.0))
    set_frame_pivot(advisorPopupPortraitNode, float2(0.0, 0.0))
    set_parent(advisorPopupPortraitNode, advisorPopupOverlay, AddChildStrategy.KeepLocalTransform)

    advisorPopupSlideX = advisor_popup_slide_hidden_right_x()
    set_advisor_popup_slide_x(advisorPopupSlideX)
    apply_advisor_popup_layout()
    wire_advisor_action_event_listeners()
    advisorPopupPanelNode.isActive = false
    advisorPopupPortraitNode.isActive = false
    build_advisor_confirm_ui()
}



def public open_advisor_popup() {
    if (!can_open_advisor_popup()) {
        return
    }
    hide_info_tooltip()
    clear_advisor_icon_hover()
    hide_advisor_confirm()
    clear_advisor_popup_status()
    advisorPopupAnimPhase = ADVISOR_ANIM_OPENING
    advisorPopupSlideX = advisor_popup_slide_hidden_right_x()
    advisorPopupSlideTargetX = advisor_popup_slide_rest_x()
    advisorPopupOverlay.isActive = true
    advisorPopupPanelNode.isActive = true
    advisorPopupPortraitNode.isActive = true
    apply_advisor_popup_layout()
    wire_advisor_action_listeners()
    refresh_advisor_action_slots()
    if (advisorPopupScrollAreaNode.isAlive) {
        advisorPopupScrollAreaNode?.UIScrollArea.scrollToTop()
    }
    set_advisor_popup_slide_x(advisorPopupSlideX)
    apply_advisor_popup_overlay_from_open_amount()
}



def public close_advisor_popup() {
    if (advisorPopupAnimPhase == ADVISOR_ANIM_IDLE || advisorPopupAnimPhase == ADVISOR_ANIM_CLOSING) {
        return
    }
    advisorPopupAnimPhase = ADVISOR_ANIM_CLOSING
    advisorPopupSlideTargetX = advisor_popup_slide_hidden_right_x()
}



def public reset_advisor_popup_state() {
    hide_advisor_confirm()
    clear_advisor_popup_status()
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        advisorActionHovered[i] = false
        advisorActionHoverT[i] = 0.0
    }
    advisorPopupAnimPhase = ADVISOR_ANIM_IDLE
    advisorPopupSlideX = advisor_popup_slide_hidden_right_x()
    advisorPopupSlideTargetX = advisor_popup_slide_rest_x()
    if (advisorPopupOverlay.isAlive) {
        advisorPopupOverlay.isActive = false
        set_image_color(advisorPopupOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    }
    if (advisorPopupPanelNode.isAlive) {
        advisorPopupPanelNode.isActive = false
        set_advisor_popup_slide_x(advisorPopupSlideX)
    }
    if (advisorPopupPortraitNode.isAlive) {
        advisorPopupPortraitNode.isActive = false
    }
}



def public show_advisor_action_blocked_feedback(actionIdx : int) {
    juice_play_sfx(JUICE_SFX_DENIED, 0.8)
    show_advisor_popup_status(advisor_action_disabled_reason(actionIdx))
}



def public try_begin_advisor_action(actionIdx : int) {
    if (!can_execute_advisor_actions()) {
        return
    }
    if (!is_advisor_action_available(actionIdx)) {
        show_advisor_action_blocked_feedback(actionIdx)
        return
    }
    execute_advisor_action(actionIdx)
}



def public on_advisor_action_click(evt : UIMouseEvent) {
    stop_propagation(evt)
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (evt.currentTarget == advisorActionHitNodes[i]) {
            try_begin_advisor_action(i)
            return
        }
    }
}



def public on_advisor_action_mouse_over(evt : UIMouseEvent) {
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (evt.currentTarget == advisorActionHitNodes[i]) {
            advisorActionHovered[i] = true
            return
        }
    }
}



def public on_advisor_action_mouse_out(evt : UIMouseEvent) {
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (evt.currentTarget == advisorActionHitNodes[i]) {
            advisorActionHovered[i] = false
            return
        }
    }
}



def public on_advisor_confirm_yes_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (pendingAdvisorActionIdx >= 0) {
        execute_advisor_action(pendingAdvisorActionIdx)
    }
}



def public on_advisor_confirm_no_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    hide_advisor_confirm()
}



def public on_advisor_confirm_overlay_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    hide_advisor_confirm()
}



def public on_advisor_confirm_panel_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    pass
}



def public on_advisor_popup_overlay_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (evt.target != advisorPopupOverlay) {
        return
    }
    if (advisorConfirmOverlay.isAlive && advisorConfirmOverlay.isActive) {
        hide_advisor_confirm()
        return
    }
    close_advisor_popup()
}



def public on_advisor_popup_panel_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    pass
}



def public on_advisor_icon_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (is_advisor_popup_open()) {
        close_advisor_popup()
        return
    }
    if (!can_click_advisor_icon()) {
        return
    }
    open_advisor_popup()
}



def public update_stat_unlock_cutscene_texture_aspect(statIdx : int) {
    let tex = stat_unlock_cutscene_texture(statIdx)
    get_texture_size(tex) $(size : int2) {
        if (size.y > 0) {
            statUnlockCutsceneTextureAspect = float(size.x) / float(size.y)
            introTextureAspect = statUnlockCutsceneTextureAspect
        }
    }
}



def public stat_bar_outer_width() : float {
    return stat_icon_side() * STAT_BAR_WIDTH_RATIO
}



def public stat_bar_outer_height() : float {
    return ui_h(STAT_BAR_HEIGHT)
}



def public update_stat_confirm_anim(statIdx : int; dt : float) {
    let phase = statConfirmPhase[statIdx]
    if (phase == STAT_CONFIRM_IDLE) {
        statFillDisplayed[statIdx] = float(kingdomStats[statIdx])
        return
    }
    statConfirmTimer[statIdx] += dt
    if (phase == STAT_CONFIRM_FLASH) {
        statFlashT[statIdx] = 1.0
        if (statConfirmTimer[statIdx] >= STAT_CONFIRM_FLASH_DURATION) {
            statConfirmPhase[statIdx] = STAT_CONFIRM_FILL
            statConfirmTimer[statIdx] = 0.0
        }
        return
    }
    if (phase == STAT_CONFIRM_FILL) {
        let t = clamp(statConfirmTimer[statIdx] / STAT_CONFIRM_FILL_DURATION, 0.0, 1.0)
        statFillDisplayed[statIdx] = lerp(statFillFrom[statIdx], statFillTo[statIdx], t)
        statFlashT[statIdx] = 1.0
        if (t >= 1.0) {
            kingdomStats[statIdx] = clamp_stat(int(statFillTo[statIdx]))
            statFillDisplayed[statIdx] = statFillTo[statIdx]
            statConfirmPhase[statIdx] = STAT_CONFIRM_COLOR
            statConfirmTimer[statIdx] = 0.0
        }
        return
    }
    if (phase == STAT_CONFIRM_COLOR) {
        let t = clamp(statConfirmTimer[statIdx] / STAT_CONFIRM_COLOR_DURATION, 0.0, 1.0)
        statFlashT[statIdx] = 1.0 - t
        statFillDisplayed[statIdx] = statFillTo[statIdx]
        if (t >= 1.0) {
            statFlashT[statIdx] = 0.0
            statConfirmPhase[statIdx] = STAT_CONFIRM_SHRINK
            statConfirmTimer[statIdx] = 0.0
        }
        return
    }
    if (phase == STAT_CONFIRM_SHRINK) {
        statFlashT[statIdx] = 0.0
        statFillDisplayed[statIdx] = statFillTo[statIdx]
        if (statConfirmTimer[statIdx] >= STAT_CONFIRM_SHRINK_DURATION) {
            statConfirmPhase[statIdx] = STAT_CONFIRM_IDLE
            statConfirmTimer[statIdx] = 0.0
        }
    }
}



def public update_stat_bar_anims(dt : float) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice >= 0 && !is_game_paused()) {
        statHoverBlinkTime += dt
    } else {
        statHoverBlinkTime = 0.0
    }
    for (i in range(STAT_COUNT)) {
        if (statUnlockRevealT[i] < 1.0) {
            statUnlockRevealT[i] = min(1.0, statUnlockRevealT[i] + dt / STAT_UNLOCK_REVEAL_DURATION)
        }
        update_stat_confirm_anim(i, dt)
        let phase = statConfirmPhase[i]
        if (phase == STAT_CONFIRM_SHRINK) {
            let t = clamp(statConfirmTimer[i] / STAT_CONFIRM_SHRINK_DURATION, 0.0, 1.0)
            statEmphasisT[i] = 1.0 - t
        } else {
            let target = stat_emphasis_target(i)
            statEmphasisT[i] = move_toward(statEmphasisT[i], target, STAT_EMPHASIS_LERP_SPEED * dt)
        }
        statChoiceHoverT[i] = move_toward(statChoiceHoverT[i], stat_hover_target(i), STAT_EMPHASIS_LERP_SPEED * dt)
        if (!statUnlocked[i]) {
            continue
        }
        let needsLayout = stat_needs_layout_update(i)
        let needsColor = stat_needs_color_update(i)
        if (!needsLayout && !needsColor) {
            continue
        }
        if (needsLayout) {
            apply_stat_column_layout(i)
        }
        if (needsColor) {
            apply_stat_column_colors(i)
        }
    }
}



def public stat_bar_total_width() : float {
    var width = stat_main_group_width()
    if (statUnlocked[STAT_SUCCESSION_IDX]) {
        let gap = ui_w(STAT_COLUMN_GAP)
        width += gap + ui_w(STAT_BAR_DIVIDER_WIDTH) + gap + stat_column_width()
    }
    return width
}



def public sync_stat_bar_children() {
    if (!statBarRoot.isAlive) {
        return
    }
    for (i in range(STAT_COUNT)) {
        park_stat_bar_node(statColumnNodes[i])
    }
    park_stat_bar_node(statBarDividerNode)
    var childOrder : array<NodeId>
    for (i in range(STAT_MAIN_COUNT)) {
        let idx = STAT_BAR_DISPLAY_ORDER[i]
        let column = statColumnNodes[idx]
        if (!column.isAlive) {
            continue
        }
        if (statUnlocked[idx]) {
            show_stat_bar_node(column)
            push(childOrder, column)
        } else {
            park_stat_bar_node(column)
        }
    }
    if (statBarDividerNode.isAlive) {
        if (statUnlocked[STAT_SUCCESSION_IDX]) {
            show_stat_bar_node(statBarDividerNode)
        } else {
            park_stat_bar_node(statBarDividerNode)
        }
    }
    let successionColumn = statColumnNodes[STAT_SUCCESSION_IDX]
    if (successionColumn.isAlive) {
        if (statUnlocked[STAT_SUCCESSION_IDX]) {
            show_stat_bar_node(successionColumn)
            push(childOrder, statBarDividerNode)
            push(childOrder, successionColumn)
        } else {
            park_stat_bar_node(successionColumn)
        }
    }
    for (node in childOrder) {
        if (node.isAlive) {
            node.set_parent(statBarRoot, AddChildStrategy.KeepLocalTransform)
        }
    }
    apply_stat_bar_layout()
}



def public info_tooltip_section_height(node : NodeId; textW : float; sectionTopGap : float = 0.0) : float {
    if (!node.isAlive || !node.isActive) {
        return 0.0
    }
    let text = node?.UIText.text
    let textH = measure_profile_text_block_height(node, text, textW, INFO_TOOLTIP_FONT_SIZE)
    if (textH <= 0.0) {
        return 0.0
    }
    return textH + sectionTopGap
}



def public create_solid_stat_bar_texture() : TextureId {
    var pixels : array<uint>
    pixels |> resize(1)
    pixels[0] = 0xFFFFFFFFu
    return create_texture(1, 1, pixels, TextureDeclaration(
        filter = TextureFilter.Point,
        addressing = TextureAddress.Clamp,
        generateMipLevels = false
    ))
}



def public wire_advisor_action_listeners() {
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        bind_advisor_action_hit_click(i)
    }
}



def public wire_advisor_action_event_listeners() {
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        let hit = advisorActionHitNodes[i]
        if (!hit.isAlive) {
            continue
        }
        add_ui_event_listener(hit, UIMouseEventType.MouseClick, @@on_advisor_action_click)
        add_ui_event_listener(hit, UIMouseEventType.MouseOver, @@on_advisor_action_mouse_over)
        add_ui_event_listener(hit, UIMouseEventType.MouseOut, @@on_advisor_action_mouse_out)
    }
}



def public on_advisor_popup_global_mouse_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
    if (!is_advisor_popup_open() || advisorPopupAnimPhase == ADVISOR_ANIM_CLOSING) {
        return
    }
    if (!can_execute_advisor_actions()) {
        return
    }
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        if (!is_mouse_over_advisor_action_card(i)) {
            continue
        }
        stop_propagation(evt)
        try_begin_advisor_action(i)
        return
    }
}


def public resize_info_tooltip_panel() {
    apply_info_tooltip_layout()
}


// ----- death -----
def public on_try_again_click(evt : UIMouseEvent) {
    juice_play_sfx(JUICE_SFX_CLICK, 0.8, 0.06)
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
        // Crimson with gold lettering, parchment on hover, like the other buttons.
        let hovered = tryAgainHovered && a > 0.5
        theme_set_kit(tryAgainButtonNode, hovered ? KIT_BUTTON_WHITE : KIT_BUTTON_RED, float4(1.0, 1.0, 1.0, a))
        let fill = answer_button_fill(tryAgainButtonNode)
        if (fill.isAlive) {
            set_image_color(fill, float4(0.0, 0.0, 0.0, 0.0))
            let textCol = hovered ? KIT_TEXT_ON_PARCHMENT : KIT_TEXT_ON_RED
            fill?.UIText.color = float4(textCol.x, textCol.y, textCol.z, a)
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
    tryAgainHovered = false
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
    juice_on_defeat_fade()
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


// ----- bootstrap -----
def public set_menu_panel_slide_x(slideX : float) {
    menuPanelSlideX = slideX
    if (!menuPanelNode.isAlive) {
        return
    }
    let pos = menu_panel_centered_top_left(slideX)
    set_frame_pos(menuPanelNode, pos)
}



def public set_character_profile_slide_x(slideX : float) {
    characterProfileSlideX = slideX
    if (!characterProfilePanelNode.isAlive) {
        return
    }
    set_frame_pos(characterProfilePanelNode, character_profile_panel_centered_top_left(slideX))
}



def public update_character_profile_slide(dt : float) {
    if (characterProfileAnimPhase == PROFILE_ANIM_IDLE) {
        return
    }
    let speed = character_profile_panel_slide_speed()
    characterProfileSlideX = move_toward(characterProfileSlideX, characterProfileSlideTargetX, speed * dt)
    set_character_profile_slide_x(characterProfileSlideX)
    apply_character_profile_overlay_from_open_amount()
    if (characterProfileAnimPhase == PROFILE_ANIM_OPENING) {
        if (abs(characterProfileSlideX - characterProfileSlideTargetX) < 1.0) {
            characterProfileSlideX = characterProfileSlideTargetX
            set_character_profile_slide_x(characterProfileSlideX)
            characterProfileAnimPhase = PROFILE_ANIM_OPEN
        }
        return
    }
    if (characterProfileAnimPhase == PROFILE_ANIM_CLOSING) {
        if (abs(characterProfileSlideX - characterProfileSlideTargetX) < 1.0) {
            reset_character_profile_state()
        }
    }
}



def public compute_profile_okay_button_outer_width() : float {
    let border = ui_box_border()
    let padX = ui_w(36.0)
    let glyphW = ui_w(MENU_BUTTON_FONT_SIZE * 0.5)
    let textW = glyphW * 4.0
    let innerW = max(ui_w(CHARACTER_PROFILE_OKAY_BUTTON_WIDTH), textW + padX)
    return innerW + 2.0 * border
}



def public apply_profile_portrait_layout(portraitW : float; portraitH : float) {
    let inset = profile_portrait_frame_inset()
    let border = profile_portrait_frame_border()
    let frameW = portraitW + 2.0 * (inset + border)
    let frameH = portraitH + 2.0 * (inset + border)
    if (characterProfilePortraitFrameNode.isAlive) {
        set_frame_size(characterProfilePortraitFrameNode, float2(frameW, frameH))
    }
    if (characterProfilePortraitInsetNode.isAlive) {
        set_frame_pos(characterProfilePortraitInsetNode, float2(border, border))
        set_frame_size(characterProfilePortraitInsetNode, float2(frameW - 2.0 * border, frameH - 2.0 * border))
    }
    if (characterProfilePortraitNode.isAlive) {
        set_frame_pos(characterProfilePortraitNode, float2(inset, inset))
        set_frame_size(characterProfilePortraitNode, float2(portraitW, portraitH))
        characterProfilePortraitNode?.UIImage.size = float2(portraitW, portraitH)
    }
}



def public apply_profile_text_frame(node : NodeId; text : string; textW : float; fontSize : float) : float {
    let frameH = profile_text_frame_height(node, text, textW, fontSize)
    if (!node.isAlive || frameH <= 0.0) {
        return 0.0
    }
    set_frame_size(node, float2(textW, frameH))
    return frameH
}



def public advance_profile_wrap_index(text : string; startIdx : int; textW : float; fontSize : float) : int {
    if (startIdx >= length(text)) {
        return length(text)
    }
    let charsPerLine = max(1, int(textW / profile_text_char_width(fontSize)))
    var endIdx = startIdx + charsPerLine
    if (endIdx >= length(text)) {
        return length(text)
    }
    let chunk = slice(text, startIdx, endIdx)
    let lastSpace = rfind(chunk, " ")
    if (lastSpace > 0) {
        endIdx = startIdx + lastSpace
    }
    return endIdx
}



def public estimate_wrapped_text_height(fontSize : float; text : string; textW : float) : float {
    if (length(text) == 0) {
        return 0.0
    }
    let lineH = profile_text_line_height(fontSize)
    var lines = 0
    var idx = 0
    while (idx < length(text)) {
        idx = advance_profile_wrap_index(text, idx, textW, fontSize)
        lines++
    }
    return float(lines) * lineH
}



def public measure_profile_text_block_height(node : NodeId; text : string; textW : float; fontSize : float) : float {
    if (!node.isAlive || length(text) == 0) {
        return 0.0
    }
    node?.UIText.text = text
    set_frame_width(node, textW)
    let textH = node?.UIText.size.y
    if (textH > 0.0) {
        return textH
    }
    let frameH = node?.UIFrame.size.y
    if (frameH > 0.0) {
        return frameH
    }
    return estimate_wrapped_text_height(fontSize, text, textW)
}



def public find_next_profile_word_end(text : string; fromIdx : int) : int {
    if (fromIdx >= length(text)) {
        return length(text)
    }
    var idx = fromIdx
    while (idx < length(text) && slice(text, idx, idx + 1) == " ") {
        idx++
    }
    if (idx >= length(text)) {
        return length(text)
    }
    while (idx < length(text) && slice(text, idx, idx + 1) != " ") {
        idx++
    }
    return idx
}



def public measure_profile_beside_fit_height(text : string; textW : float) : float {
    if (!characterProfileDescBesideNode.isAlive || length(text) == 0) {
        return 0.0
    }
    let measured = profile_text_frame_height(characterProfileDescBesideNode, text, textW, CHARACTER_PROFILE_BODY_FONT_SIZE)
    let est = estimate_wrapped_text_height(CHARACTER_PROFILE_BODY_FONT_SIZE, text, textW)
    if (est <= 0.0) {
        return measured
    }
    if (measured <= 0.0) {
        return est + ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE * CHARACTER_PROFILE_TEXT_HEIGHT_PAD)
    }
    if (measured > est * 1.08) {
        return est + ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE * CHARACTER_PROFILE_TEXT_HEIGHT_PAD)
    }
    return measured
}



def public update_character_profile_content(idx : int) {
    if (idx < 0) {
        return
    }
    if (idx >= COURT_CHARACTER_COUNT) {
        if (idx >= CHARACTER_COUNT) {
            return
        }
        let profile = get_character_profile(idx)
        if (characterProfilePortraitNode.isAlive) {
            characterProfilePortraitNode?.UIImage.textureId = portraitTextures[idx]
            characterProfilePortraitNode?.UIImage.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
        }
        if (characterProfileTitleNode.isAlive) {
            characterProfileTitleNode?.UIText.text = profile.name
        }
        characterProfileDescriptionFullText = profile.description
        if (characterProfileLikesNode.isAlive) {
            characterProfileLikesNode?.UIText.text = likes_label(profile.likes)
        }
        if (characterProfileDislikesNode.isAlive) {
            characterProfileDislikesNode?.UIText.text = dislikes_label(profile.dislikes)
        }
        return
    }
    if (characterProfilePortraitNode.isAlive) {
        characterProfilePortraitNode?.UIImage.textureId = courtPortraitTextures[idx]
        characterProfilePortraitNode?.UIImage.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    }
    if (characterProfileTitleNode.isAlive) {
        characterProfileTitleNode?.UIText.text = get_court_character_name(idx)
    }
    characterProfileDescriptionFullText = get_court_character_description(idx)
    if (characterProfileLikesNode.isAlive) {
        characterProfileLikesNode?.UIText.text = likes_label(get_court_character_likes(idx))
    }
    if (characterProfileDislikesNode.isAlive) {
        characterProfileDislikesNode?.UIText.text = dislikes_label(get_court_character_dislikes(idx))
    }
}



def public layout_character_profile_header(textW : float; portraitFrameW : float; portraitFrameH : float; besideW : float; spacing : float) : float {
    set_text_font_size(characterProfileTitleNode, ui_h(CHARACTER_PROFILE_TITLE_FONT_SIZE))
    set_text_font_size(characterProfileDescBesideNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))

    let titleText = characterProfileTitleNode?.UIText.text
    let titleH = apply_profile_text_frame(characterProfileTitleNode, titleText, besideW, CHARACTER_PROFILE_TITLE_FONT_SIZE)

    let besideLineH = profile_text_line_height(CHARACTER_PROFILE_BODY_FONT_SIZE)
    let besideDescMaxH = max(0.0, portraitFrameH - titleH - spacing) + besideLineH * CHARACTER_PROFILE_BESIDE_EXTRA_LINES
    split_profile_description(characterProfileDescriptionFullText, besideW, besideDescMaxH)
    let besideText = characterProfileDescBesideText

    var besideDescH = 0.0
    if (characterProfileDescBesideNode.isAlive) {
        characterProfileDescBesideNode?.UIText.text = besideText
        characterProfileDescBesideNode.isActive = length(besideText) > 0
        if (length(besideText) > 0) {
            besideDescH = apply_profile_text_frame(characterProfileDescBesideNode, besideText, besideW, CHARACTER_PROFILE_BODY_FONT_SIZE)
        }
    }

    let textColumnH = titleH + ((besideDescH > 0.0) ? spacing + besideDescH : 0.0)
    var headerH : float = portraitFrameH
    if (textColumnH > headerH) {
        headerH = textColumnH
    }

    let portraitW = profile_portrait_width()
    let portraitH = profile_portrait_height()
    apply_profile_portrait_layout(portraitW, portraitH)
    if (characterProfilePortraitFrameNode.isAlive) {
        set_frame_size(characterProfilePortraitFrameNode, float2(portraitFrameW, portraitFrameH))
    }
    if (characterProfileTextColumnNode.isAlive) {
        set_frame_size(characterProfileTextColumnNode, float2(besideW, textColumnH))
    }
    if (characterProfileHeaderNode.isAlive) {
        set_frame_size(characterProfileHeaderNode, float2(textW, headerH))
    }
    return headerH
}



def public compute_character_profile_body_height(innerW : float) : float {
    let spacing = ui_h(CHARACTER_PROFILE_SPACING)
    let textW = character_profile_content_text_width(innerW)
    let portraitFrameW = profile_portrait_frame_width()
    let portraitFrameH = profile_portrait_frame_height()
    let headerGap = ui_w(CHARACTER_PROFILE_HEADER_GAP)
    let besideW = textW - portraitFrameW - headerGap

    let headerH = layout_character_profile_header(textW, portraitFrameW, portraitFrameH, besideW, spacing)

    set_text_font_size(characterProfileDescBelowNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))
    let belowText = characterProfileDescBelowText
    if (characterProfileDescBelowNode.isAlive) {
        characterProfileDescBelowNode?.UIText.text = belowText
        characterProfileDescBelowNode.isActive = length(belowText) > 0
    }
    let belowDescH = apply_profile_text_frame(characterProfileDescBelowNode, belowText, textW, CHARACTER_PROFILE_BODY_FONT_SIZE)

    let dividerH = ui_h(CHARACTER_PROFILE_DIVIDER_HEIGHT)
    if (characterProfileDividerNode.isAlive) {
        set_frame_size(characterProfileDividerNode, float2(textW, dividerH))
    }

    let likesText = characterProfileLikesNode?.UIText.text
    let dislikesText = characterProfileDislikesNode?.UIText.text
    let likesH = apply_profile_text_frame(characterProfileLikesNode, likesText, textW, CHARACTER_PROFILE_TRAIT_FONT_SIZE)
    let dislikesH = apply_profile_text_frame(characterProfileDislikesNode, dislikesText, textW, CHARACTER_PROFILE_TRAIT_FONT_SIZE)
    let btnH = menu_button_outer_height(ui_h(CHARACTER_PROFILE_BUTTON_HEIGHT))
    let bottomSlack = ui_h(CHARACTER_PROFILE_BOTTOM_SLACK)
    // Profile vbox always has 6 children (desc-below may be empty but still present).
    let spacingTotal = spacing * 5.0
    return headerH + belowDescH + dividerH + likesH + dislikesH + btnH + spacingTotal + bottomSlack
}



def public apply_profile_okay_button_visual(hoverT : float) {
    let btn = characterProfileOkayButtonNode
    if (!btn.isAlive) {
        return
    }
    btn.localScale = float3(1.0, 1.0, 1.0)
    let fill = answer_button_fill(btn)
    if (!fill.isAlive) {
        return
    }
    fill.localScale = float3(1.0, 1.0, 1.0)
    var col = lerp(ANSWER_BUTTON_COLOR, ANSWER_BUTTON_HOVER_COLOR, hoverT)
    col.w = lerp(ANSWER_BUTTON_IDLE_ALPHA, ANSWER_HOVER_ALPHA, hoverT)
    set_image_color(fill, col)
}



def public fade_in_intro_cutscene_music() {
    load_intro_cutscene_music()
    if (!valid(introCutsceneMusicHandle) || !is_playing(introCutsceneMusicHandle)) {
        introCutsceneMusicHandle = play_sound_loop(introCutsceneMusicSound)
        set_volume(introCutsceneMusicHandle, 0.0, 0.0)
    }
    set_volume(introCutsceneMusicHandle, intro_cutscene_music_target_volume(), BACKGROUND_MUSIC_FADE_DURATION)
}



def public fade_out_intro_cutscene_music() {
    if (!valid(introCutsceneMusicHandle) || !is_playing(introCutsceneMusicHandle)) {
        return
    }
    stop(introCutsceneMusicHandle, BACKGROUND_MUSIC_FADE_DURATION)
}



def public configure_options_label_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = false
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Middle
}



def public apply_options_label_layout(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    set_text_font_size(node, ui_h(options_label_font_size()))
    set_frame_size(node, float2(ui_w(options_label_width()), ui_h(OPTIONS_ROW_HEIGHT)))
}



def public create_options_label(labelText : string) : NodeId {
    let node = text(labelText)
    node.name = "optionsLabel"
    set_text_color(node, OPTIONS_TEXT_COLOR)
    configure_options_label_text(node)
    apply_options_label_layout(node)
    apply_ui_font(node)
    return node
}



def public configure_options_control_text(btnNode : NodeId) {
    btnNode?.UIText.autoResizeFrame = false
    btnNode?.UIText.wordWrapping = false
    btnNode?.UIText.horAlignment = TextHorAlignment.Center
    btnNode?.UIText.vertAlignment = TextVertAlignment.Middle
    btnNode?.UIText.pivot = float2(0.0, 0.0)
}



def public sync_options_control_label_frame(btnNode : NodeId; labelSize : float2) {
    set_frame_size(btnNode, labelSize)
    btnNode?.UIText.size = labelSize
    btnNode?.UIText.localPosition2D = float2(0.0, 0.0)
}



def public apply_options_mini_button_selected(btnBorderNode : NodeId; selected : bool) {
    if (!btnBorderNode.isAlive) {
        return
    }
    let fill = options_control_fill(btnBorderNode)
    if (fill.isAlive) {
        set_ui_button_interactable(fill, true)
        theme_apply_selected_control(fill, selected)
    }
}



def public update_options_fullscreen_toggle_visual() {
    if (!mainMenuOptionsFullscreenToggleNode.isAlive) {
        return
    }
    let fill = options_control_fill(mainMenuOptionsFullscreenToggleNode)
    if (!fill.isAlive) {
        return
    }
    set_ui_button_interactable(fill, OPTIONS_FULLSCREEN_ENABLED)
    if (!OPTIONS_FULLSCREEN_ENABLED) {
        fill?.UIText.text = ""
        set_image_color(fill, THEME_BUTTON_DISABLED)
        fill?.UIText.color = THEME_TEXT_DISABLED
        return
    }
    fill?.UIText.text = (settingsFullscreen) ? "X" : ""
    theme_apply_selected_control(fill, settingsFullscreen)
}



def public update_options_language_button_visuals() {
    apply_options_mini_button_selected(mainMenuOptionsLanguageEnglishBtn, settingsLanguageIdx == 0)
    apply_options_mini_button_selected(mainMenuOptionsLanguageRussianBtn, settingsLanguageIdx == 1)
}



def public create_options_language_button(buttonText : string; langIdx : int) : NodeId {
    let border = ui_box_border()
    let outerW = ui_w(OPTIONS_LANGUAGE_BUTTON_WIDTH)
    let innerH = ui_h(OPTIONS_ROW_HEIGHT) - ui_h(8.0)
    let innerW = outerW - 2.0 * border
    let fillNode = panel(float2(innerW, innerH), [])
    fillNode.name = "optionsLangBtn_{langIdx}_fill"
    set_image_color(fillNode, OPTIONS_CONTROL_BG_COLOR)
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = buttonText,
        fontSize = ui_h(language_button_font_size()),
        color = OPTIONS_CONTROL_TEXT_COLOR
    ))
    configure_options_control_text(fillNode)
    sync_options_control_label_frame(fillNode, float2(innerW, innerH))
    apply_language_button_font(fillNode)
    fillNode?.UIButton.onClick = @() {
        on_options_language_change(langIdx)
    }
    let outerH = innerH + 2.0 * border
    let borderNode = panel(float2(outerW, outerH), [fillNode])
    borderNode.name = "optionsLangBtn_{langIdx}"
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pivot(borderNode, float2(0.0, 0.5))
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}



def public create_options_toggle_box() : NodeId {
    let border = ui_box_border()
    let boxSize = ui_h(OPTIONS_CHECKBOX_SIZE)
    let innerW = boxSize
    let innerH = boxSize
    let fillNode = panel(float2(innerW, innerH), [])
    fillNode.name = "optionsFullscreenToggle_fill"
    set_image_color(fillNode, OPTIONS_CONTROL_BG_COLOR)
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = "",
        fontSize = ui_h(OPTIONS_TOGGLE_FONT_SIZE),
        color = OPTIONS_CONTROL_TEXT_COLOR
    ))
    configure_options_control_text(fillNode)
    sync_options_control_label_frame(fillNode, float2(innerW, innerH))
    apply_ui_font(fillNode)
    set_ui_button_interactable(fillNode, OPTIONS_FULLSCREEN_ENABLED)
    fillNode?.UIButton.onClick = @() {
        on_options_fullscreen_change(!settingsFullscreen)
    }
    let outerW = innerW + 2.0 * border
    let outerH = innerH + 2.0 * border
    let borderNode = panel(float2(outerW, outerH), [fillNode])
    borderNode.name = "optionsFullscreenToggle"
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pivot(borderNode, float2(0.0, 0.5))
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}



def public create_options_language_row() : NodeId {
    mainMenuOptionsLanguageLabelNode = create_options_label(options_language())
    mainMenuOptionsLanguageLabelNode.name = "mainMenuOptionsLanguageLabelNode"
    mainMenuOptionsLanguageEnglishBtn = create_options_language_button(options_lang_english(), 0)
    mainMenuOptionsLanguageEnglishBtn.name = "mainMenuOptionsLanguageEnglishBtn"
    mainMenuOptionsLanguageRussianBtn = create_options_language_button(options_lang_russian(), 1)
    mainMenuOptionsLanguageRussianBtn.name = "mainMenuOptionsLanguageRussianBtn"
    let buttonsRow = hbox([mainMenuOptionsLanguageEnglishBtn, mainMenuOptionsLanguageRussianBtn])
    buttonsRow.name = "mainMenuOptionsLanguageButtonsRow"
    set_spacing(buttonsRow, ui_w(OPTIONS_LANGUAGE_BUTTON_SPACING))
    set_alignment(buttonsRow, LayoutAlignment.MiddleLeft)
    let row = hbox([mainMenuOptionsLanguageLabelNode, buttonsRow])
    row.name = "mainMenuOptionsLanguageRow"
    set_spacing(row, ui_w(OPTIONS_ROW_LABEL_GAP))
    set_alignment(row, LayoutAlignment.MiddleLeft)
    set_frame_size(row, float2(ui_w(OPTIONS_ROW_WIDTH), ui_h(OPTIONS_ROW_HEIGHT)))
    row?.UIHorizontalLayout.childForceExpandWidth = false
    row?.UIHorizontalLayout.childForceExpandHeight = false
    update_options_language_button_visuals()
    return row
}



def public create_options_fullscreen_row() : NodeId {
    mainMenuOptionsFullscreenLabelNode = create_options_label(options_fullscreen())
    mainMenuOptionsFullscreenLabelNode.name = "mainMenuOptionsFullscreenLabelNode"
    if (!OPTIONS_FULLSCREEN_ENABLED) {
        set_text_color(mainMenuOptionsFullscreenLabelNode, MENU_DISABLED_TEXT_COLOR)
    }
    mainMenuOptionsFullscreenToggleNode = create_options_toggle_box()
    mainMenuOptionsFullscreenToggleNode.name = "mainMenuOptionsFullscreenToggleNode"
    update_options_fullscreen_toggle_visual()
    let slotSpacer = panel(float2(1.0, ui_h(OPTIONS_ROW_HEIGHT)), [])
    slotSpacer.name = "mainMenuOptionsFullscreenSlotSpacer"
    set_image_color(slotSpacer, float4(0.0, 0.0, 0.0, 0.0))
    mainMenuOptionsFullscreenSlotNode = hbox([slotSpacer, mainMenuOptionsFullscreenToggleNode])
    mainMenuOptionsFullscreenSlotNode.name = "mainMenuOptionsFullscreenSlotNode"
    set_alignment(mainMenuOptionsFullscreenSlotNode, LayoutAlignment.MiddleLeft)
    set_frame_size(mainMenuOptionsFullscreenSlotNode, float2(ui_w(options_control_column_width()), ui_h(OPTIONS_ROW_HEIGHT)))
    mainMenuOptionsFullscreenSlotNode?.UIHorizontalLayout.childForceExpandWidth = false
    mainMenuOptionsFullscreenSlotNode?.UIHorizontalLayout.childForceExpandHeight = false
    let row = hbox([mainMenuOptionsFullscreenLabelNode, mainMenuOptionsFullscreenSlotNode])
    row.name = "mainMenuOptionsFullscreenRow"
    set_spacing(row, ui_w(OPTIONS_ROW_LABEL_GAP))
    set_alignment(row, LayoutAlignment.MiddleLeft)
    set_frame_size(row, float2(ui_w(OPTIONS_ROW_WIDTH), ui_h(OPTIONS_ROW_HEIGHT)))
    row?.UIHorizontalLayout.childForceExpandWidth = false
    row?.UIHorizontalLayout.childForceExpandHeight = false
    return row
}



def public compute_main_menu_options_content_height() : float {
    let pad = ui_h(OPTIONS_PANEL_PADDING)
    let spacing = ui_h(OPTIONS_ROW_SPACING)
    let rowH = ui_h(OPTIONS_ROW_HEIGHT)
    let titleH = ui_h(OPTIONS_TITLE_FONT_SIZE + 12.0)
    let versionH = ui_h(OPTIONS_VERSION_FONT_SIZE + 8.0)
    let btnOuterH = menu_button_outer_height(ui_h(OPTIONS_BUTTON_HEIGHT))
    let settingsRows = OPTIONS_FULLSCREEN_ENABLED ? 5.0 : 4.0
    return titleH + rowH * settingsRows + versionH + btnOuterH + spacing * 7.0 + pad * 2.0
}



def public init_options_slider(node : NodeId; initialValue : float) {
    if (!node.isAlive) {
        return
    }
    set_frame_size(node, float2(ui_w(options_control_column_width()), ui_h(OPTIONS_SLIDER_HEIGHT)))
    optionsSliderSyncing = true
    get_component(node) $(var slider : UIHorizontalSlider?) {
        slider.minValue = 0.0
        slider.maxValue = 1.0
        slider.value = initialValue + ((initialValue >= 0.5) ? -0.001 : 0.001)
        slider.value = initialValue
    }
    optionsSliderSyncing = false
}



def public create_options_slider_row(labelNode : NodeId; sliderNode : NodeId) : NodeId {
    let row = hbox([labelNode, sliderNode])
    row.name = "optionsSliderRow"
    set_spacing(row, ui_w(OPTIONS_ROW_LABEL_GAP))
    set_alignment(row, LayoutAlignment.MiddleLeft)
    set_frame_size(row, float2(ui_w(OPTIONS_ROW_WIDTH), ui_h(OPTIONS_ROW_HEIGHT)))
    row?.UIHorizontalLayout.childForceExpandWidth = false
    row?.UIHorizontalLayout.childForceExpandHeight = false
    return row
}



def public sync_options_ui_from_settings() {
    init_options_slider(mainMenuOptionsMasterSliderNode, settingsMasterVolume)
    init_options_slider(mainMenuOptionsMusicSliderNode, settingsMusicVolume)
    update_options_fullscreen_toggle_visual()
    update_options_language_button_visuals()
    if (mainMenuOptionsVersionTextNode.isAlive) {
        mainMenuOptionsVersionTextNode?.UIText.text = options_version()
    }
}



def public set_main_menu_options_slide_x(slideX : float) {
    mainMenuOptionsSlideX = slideX
    if (!mainMenuOptionsPanelNode.isAlive) {
        return
    }
    set_frame_pos(mainMenuOptionsPanelNode, main_menu_options_panel_centered_top_left(slideX))
}



def public apply_main_menu_options_overlay_from_open_amount() {
    if (!mainMenuOptionsOverlay.isAlive) {
        return
    }
    let alpha = main_menu_options_open_amount() * MENU_OVERLAY_COLOR.w
    set_image_color(mainMenuOptionsOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, alpha))
}



def public update_main_menu_options_slide(dt : float) {
    if (mainMenuOptionsAnimPhase == MENU_ANIM_IDLE) {
        return
    }
    let speed = main_menu_options_panel_slide_speed()
    mainMenuOptionsSlideX = move_toward(mainMenuOptionsSlideX, mainMenuOptionsSlideTargetX, speed * dt)
    set_main_menu_options_slide_x(mainMenuOptionsSlideX)
    apply_main_menu_options_overlay_from_open_amount()
    if (mainMenuOptionsAnimPhase == MENU_ANIM_OPENING) {
        if (abs(mainMenuOptionsSlideX - mainMenuOptionsSlideTargetX) < 1.0) {
            mainMenuOptionsSlideX = main_menu_options_panel_slide_rest_x()
            mainMenuOptionsSlideTargetX = main_menu_options_panel_slide_rest_x()
            set_main_menu_options_slide_x(mainMenuOptionsSlideX)
            mainMenuOptionsAnimPhase = MENU_ANIM_OPEN
        }
        return
    }
    if (mainMenuOptionsAnimPhase == MENU_ANIM_CLOSING) {
        if (abs(mainMenuOptionsSlideX - mainMenuOptionsSlideTargetX) < 1.0) {
            reset_main_menu_options_state()
        }
    }
}



def public open_main_menu_options() {
    if ((!is_on_main_menu() && !is_pause_menu_open()) || is_main_menu_options_open()) {
        return
    }
    optionsSliderRedrawFrames = 3
    mainMenuOptionsAnimPhase = MENU_ANIM_OPENING
    mainMenuOptionsSlideX = main_menu_options_panel_slide_hidden_left_x()
    mainMenuOptionsSlideTargetX = main_menu_options_panel_slide_rest_x()
    sync_options_ui_from_settings()
    if (mainMenuOptionsOverlay.isAlive) {
        mainMenuOptionsOverlay.isActive = true
    }
    if (mainMenuOptionsPanelNode.isAlive) {
        mainMenuOptionsPanelNode.isActive = true
    }
    set_main_menu_options_slide_x(mainMenuOptionsSlideX)
    apply_main_menu_options_overlay_from_open_amount()
}



def public close_main_menu_options() {
    if (mainMenuOptionsAnimPhase == MENU_ANIM_IDLE || mainMenuOptionsAnimPhase == MENU_ANIM_CLOSING) {
        return
    }
    mainMenuOptionsAnimPhase = MENU_ANIM_CLOSING
    mainMenuOptionsSlideTargetX = main_menu_options_panel_slide_hidden_right_x()
}



def public reset_main_menu_options_state() {
    mainMenuOptionsAnimPhase = MENU_ANIM_IDLE
    mainMenuOptionsSlideX = main_menu_options_panel_slide_hidden_left_x()
    mainMenuOptionsSlideTargetX = main_menu_options_panel_slide_rest_x()
    mainMenuOptionsBackButtonHovered = false
    mainMenuOptionsBackButtonHoverT = 0.0
    if (mainMenuOptionsOverlay.isAlive) {
        mainMenuOptionsOverlay.isActive = false
        set_image_color(mainMenuOptionsOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    }
    if (mainMenuOptionsPanelNode.isAlive) {
        mainMenuOptionsPanelNode.isActive = false
        set_main_menu_options_slide_x(mainMenuOptionsSlideX)
    }
    if (mainMenuOptionsBackButtonNode.isAlive) {
        apply_menu_button_visual(mainMenuOptionsBackButtonNode, 0.0, true)
    }
}



def public apply_main_menu_options_layout() {
    if (!mainMenuOptionsPanelNode.isAlive) {
        return
    }
    let res = float2(get_resolution())
    let border = ui_box_border()
    let pad = ui_h(OPTIONS_PANEL_PADDING)
    let panelW = ui_w(OPTIONS_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    let spacing = ui_h(OPTIONS_ROW_SPACING)
    let btnH = ui_h(OPTIONS_BUTTON_HEIGHT)
    let buttonW = innerW - 2.0 * pad
    let contentH = compute_main_menu_options_content_height()
    let outerH = contentH + 2.0 * border

    if (mainMenuOptionsOverlay.isAlive) {
        set_frame_size(mainMenuOptionsOverlay, res)
    }
    set_frame_size(mainMenuOptionsPanelNode, float2(panelW, outerH))
    set_frame_pivot(mainMenuOptionsPanelNode, float2(0.0, 0.0))
    set_alignment(mainMenuOptionsPanelNode, LayoutAlignment.TopLeft)
    if (mainMenuOptionsInnerNode.isAlive) {
        set_frame_size(mainMenuOptionsInnerNode, float2(innerW, contentH))
        set_frame_pos(mainMenuOptionsInnerNode, float2(border, border))
    }
    if (mainMenuOptionsContentNode.isAlive) {
        set_spacing(mainMenuOptionsContentNode, spacing)
        set_padding(mainMenuOptionsContentNode, float4(pad, pad, pad, pad))
        set_frame_size(mainMenuOptionsContentNode, float2(innerW, contentH))
        mainMenuOptionsContentNode?.UIVerticalLayout.childForceExpandWidth = true
        mainMenuOptionsContentNode?.UIVerticalLayout.childForceExpandHeight = false
    }
    apply_menu_button_layout(mainMenuOptionsBackButtonNode, buttonW, btnH, OPTIONS_BUTTON_FONT_SIZE)
    init_options_slider(mainMenuOptionsMasterSliderNode, settingsMasterVolume)
    init_options_slider(mainMenuOptionsMusicSliderNode, settingsMusicVolume)
    if (mainMenuOptionsLanguageRowNode.isAlive) {
        set_frame_size(mainMenuOptionsLanguageRowNode, float2(ui_w(OPTIONS_ROW_WIDTH), ui_h(OPTIONS_ROW_HEIGHT)))
    }
    if (mainMenuOptionsFullscreenToggleNode.isAlive) {
        set_frame_size(mainMenuOptionsFullscreenToggleNode, float2(ui_h(OPTIONS_CHECKBOX_SIZE) + 2.0 * border, ui_h(OPTIONS_CHECKBOX_SIZE) + 2.0 * border))
    }
    if (mainMenuOptionsAnimPhase != MENU_ANIM_IDLE) {
        set_main_menu_options_slide_x(mainMenuOptionsSlideX)
        apply_main_menu_options_overlay_from_open_amount()
    }
}



def public apply_options_rows_layout() {
    apply_options_label_layout(mainMenuOptionsMasterLabelNode)
    apply_options_label_layout(mainMenuOptionsMusicLabelNode)
    apply_options_label_layout(mainMenuOptionsLanguageLabelNode)
    apply_options_label_layout(mainMenuOptionsFullscreenLabelNode)
    init_options_slider(mainMenuOptionsMasterSliderNode, settingsMasterVolume)
    init_options_slider(mainMenuOptionsMusicSliderNode, settingsMusicVolume)
    if (mainMenuOptionsFullscreenSlotNode.isAlive) {
        set_frame_size(mainMenuOptionsFullscreenSlotNode, float2(ui_w(options_control_column_width()), ui_h(OPTIONS_ROW_HEIGHT)))
    }
}



def public configure_info_tooltip_section_node(node : NodeId; textW : float; color : float4) {
    if (!node.isAlive) {
        return
    }
    set_text_color(node, color)
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    node?.UIText.localPosition2D = float2(0.0, 0.0)
    set_frame_pivot(node, float2(0.0, 0.0))
    set_frame_width(node, textW)
}



def public set_info_tooltip_section(node : NodeId; visible : bool; text : string) {
    if (!node.isAlive) {
        return
    }
    let show = visible && length(text) > 0
    node.isActive = show
    node?.UIText.text = (show ? text : "")
}



def public hide_stat_synergy_tooltip_sections() {
    set_info_tooltip_section(infoTooltipInfluenceHeaderNode, false, "")
    set_info_tooltip_section(infoTooltipInfluenceBuffNode, false, "")
    set_info_tooltip_section(infoTooltipInfluenceDebuffNode, false, "")
    set_info_tooltip_section(infoTooltipActiveHeaderNode, false, "")
    set_info_tooltip_section(infoTooltipActiveBuffNode, false, "")
    set_info_tooltip_section(infoTooltipActiveDebuffNode, false, "")
}



def public update_info_tooltip_content() {
    if (!infoTooltipTitleNode.isAlive || !infoTooltipBodyNode.isAlive) {
        return
    }
    if (hoveredInfoTarget == INFO_HOVER_NONE) {
        return
    }
    let title = info_tooltip_title(hoveredInfoTarget, playerNickname, currentDay, kingdomStats)
    let body = info_tooltip_body(hoveredInfoTarget, currentDay)
    set_info_tooltip_section(infoTooltipTitleNode, true, title)
    set_info_tooltip_section(infoTooltipBodyNode, length(body) > 0, body)
    if (!is_stat_info_hover_target(hoveredInfoTarget)) {
        hide_stat_synergy_tooltip_sections()
        return
    }
    let statIdx = hoveredInfoTarget - INFO_HOVER_STAT_BASE
    update_stat_synergy_tooltip_sections(statIdx)
}



def public is_stat_info_hover_target(target : int) : bool {
    return target >= INFO_HOVER_STAT_BASE && target < INFO_HOVER_STAT_BASE + STAT_COUNT
}



def public clamp_info_tooltip_center_x(centerX : float) : float {
    if (!infoTooltipRoot.isAlive) {
        return centerX
    }
    let halfW = infoTooltipRoot?.UIFrame.size.x * 0.5
    let margin = ui_w(INFO_TOOLTIP_SCREEN_MARGIN)
    return clamp(centerX, halfW + margin, screen_w() - halfW - margin)
}



def public update_main_menu_background_texture_aspect() {
    get_texture_size(mainMenuBackgroundTexture) $(size : int2) {
        if (size.y > 0) {
            mainMenuBackgroundTextureAspect = float(size.x) / float(size.y)
        }
    }
}



def public configure_intro_replica_text(node : NodeId; columnW : float) {
    let textW = intro_replica_width(columnW)
    let textH = intro_replica_frame_height()
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(node, float2(0.0, 0.0))
    set_frame_size(node, float2(textW, textH))
    node?.UIText.size = float2(textW, textH)
}



def public is_cutscene_advance_key_idx(keyIdx : KeyCode) : bool {
    return keyIdx == KeyCode.Space || keyIdx == KeyCode.Return
}



def public is_cutscene_advance_mouse_button(buttonIdx : MouseButton) : bool {
    return buttonIdx == MouseButton.Left
}



def public is_intro_cutscene_skip_hold_pressed() : bool {
    return introCutsceneSkipRightMouseDown
}



def public reset_intro_cutscene_skip_hold() {
    introCutsceneSkipHoldT = 0.0
    introCutsceneSkipRightMouseDown = false
    introCutsceneSkipInputHoldCount = 0
    update_intro_cutscene_skip_bar(0.0)
}



def public reset_intro_cutscene_skip_ui() {
    reset_intro_cutscene_skip_hold()
    introCutsceneSkipAlpha = 0.0
    introCutsceneSkipIdleT = CUTSCENE_SKIP_HINT_IDLE_HIDE_DELAY
    introSkipExitPending = false
    apply_intro_cutscene_skip_alpha()
    set_intro_cutscene_skip_visible(false)
}



def public finish_intro_typewriter() {
    introTypewriterCharCount = typewriter_text_length(intro_current_replic())
    refresh_intro_replica_text()
}



def public begin_intro_dialogue_beat(beat : int; skipNameSlide : bool) {
    introDialogueBeat = beat
    refresh_intro_name_text()
    introTypewriterCharCount = 0
    introTypewriterAccumulator = 0.0
    refresh_intro_replica_text()
    introCutsceneT = 0.0
    if (skipNameSlide) {
        introDialogueSubPhase = INTRO_DIALOGUE_TYPEWRITER
        introNameSlideX = 0.0
        intro_begin_typewriter_for_current_beat()
    } else {
        introDialogueSubPhase = INTRO_DIALOGUE_NAME_SLIDE
        introNameSlideX = intro_name_hidden_left_x()
    }
}



def public apply_framed_image_layout(frameNode, shadowNode, imageNode, bevelBottomNode, bevelRightNode : NodeId; inner : float2; coverUv : float4) {
    if (!frameNode.isAlive) {
        return
    }
    let bevel = intro_image_bevel_thickness()
    let shadow = intro_image_shadow_offset()
    let frameOuter = inner + float2(bevel + shadow * 0.55, bevel + shadow * 0.65)

    set_frame_size(frameNode, frameOuter)
    if (shadowNode.isAlive) {
        set_frame_pos(shadowNode, float2(shadow * 0.42, shadow * 0.52))
        set_frame_size(shadowNode, inner)
        set_image_color(shadowNode, INTRO_IMAGE_SHADOW_COLOR)
    }
    if (imageNode.isAlive) {
        set_frame_pos(imageNode, float2(0.0, 0.0))
        set_frame_size(imageNode, inner)
        imageNode?.UIImage.size = inner
        imageNode?.UIImage.uvRegion = intro_ken_burns_register(imageNode, coverUv)
    }
    if (bevelBottomNode.isAlive) {
        set_frame_pos(bevelBottomNode, float2(0.0, inner.y))
        set_frame_size(bevelBottomNode, float2(inner.x + bevel, bevel))
        set_image_color(bevelBottomNode, INTRO_IMAGE_BEVEL_DARK_COLOR)
    }
    if (bevelRightNode.isAlive) {
        set_frame_pos(bevelRightNode, float2(inner.x, 0.0))
        set_frame_size(bevelRightNode, float2(bevel, inner.y))
        set_image_color(bevelRightNode, INTRO_IMAGE_BEVEL_DARKER_COLOR)
    }
}



def public set_startup_splash_overlay_alpha(alpha : float) {
    if (startupSplashOverlayNode.isAlive) {
        set_image_color(startupSplashOverlayNode, float4(0.0, 0.0, 0.0, clamp(alpha, 0.0, 1.0)))
    }
}



def public set_startup_splash_bg_alpha(alpha : float) {
    if (startupSplashBgNode.isAlive) {
        let a = clamp(alpha, 0.0, 1.0)
        set_image_color(startupSplashBgNode, float4(0.0, 0.0, 0.0, a))
    }
}



def public set_startup_splash_logo_visible(visible : bool) {
    if (startupSplashLogoNode.isAlive) {
        startupSplashLogoNode.isActive = visible
    }
}



def public apply_startup_splash_layout() {
    if (!startupSplashRoot.isAlive) {
        return
    }
    let res = float2(get_resolution())
    set_frame_size(startupSplashRoot, res)
    if (startupSplashBgNode.isAlive) {
        set_frame_size(startupSplashBgNode, res)
    }
    if (startupSplashOverlayNode.isAlive) {
        set_frame_size(startupSplashOverlayNode, res)
    }
    if (!startupSplashLogoNode.isAlive) {
        return
    }
    get_texture_size(logoTexture) $(size : int2) {
        if (size.y > 0) {
            let aspect = float(size.x) / float(size.y)
            let maxW = res.x * SPLASH_LOGO_MAX_WIDTH_RATIO
            let maxH = res.y * SPLASH_LOGO_MAX_HEIGHT_RATIO
            var logoW = maxW
            var logoH = logoW / aspect
            if (logoH > maxH) {
                logoH = maxH
                logoW = logoH * aspect
            }
            set_frame_size(startupSplashLogoNode, float2(logoW, logoH))
            set_frame_pivot(startupSplashLogoNode, float2(0.0, 0.0))
            set_frame_pos(startupSplashLogoNode, float2((res.x - logoW) * 0.5, (res.y - logoH) * 0.5))
            startupSplashLogoNode?.UIImage.pivot = float2(0.0, 0.0)
        }
    }
}



def public prepare_intro_seq2() {
    introCutsceneLayoutMode = INTRO_LAYOUT_MULTI
    introCutsceneImageNode?.UIImage.textureId = introCutsceneTexture2
    introActiveMainTextureAspect = introTextureAspect2
    update_intro_texture2_aspect()
    intro_update_multi_layout_metrics()
    introCutsceneSlideX = intro_seq_hidden_left_x(intro_seq2_base_pos(), introMultiSeq2InnerSize)
    introPictureSlideDone = false
    set_intro_seq3_visible(false)
    set_intro_seq4_visible(false)
    set_intro_seq5_visible(false)
    set_intro_seq6_visible(false)
    introSeq3SlideX = 0.0
    introSeq4SlideX = 0.0
    introSeq5SlideX = 0.0
    introSeq6SlideX = 0.0
    introSeq3SlideDone = false
    introSeq4SlideDone = false
    introSeq5SlideDone = false
    introSeq6SlideDone = false
    set_intro_text_visible(false)
    introNameSlideX = intro_name_hidden_left_x()
    apply_intro_cutscene_layout()
}



def public finish_intro_cutscene() {
    intro_stop_dialogue_audio()
    intro_stop_battle_sfx()
    reset_intro_cutscene_skip_ui()
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
    screenPhase = SCREEN_PLAYING
    setup_encounter_for_day(currentDay)
    usingAshfordDebutEncounter = false
    sync_stat_bar_children()
    apply_current_encounter_character()
    roll_next_incoming_character_texture()
    save_game_progress(main_question_id(currentEncounterIdx, currentNodeIdx))
    apply_screen_visibility()
    start_character_enter()
}



def public is_gameplay_hud_visible() : bool {
    let onMenu = is_on_main_menu()
    let splash = is_startup_splash_active()
    let intro = is_intro_cutscene_active()
    let storyCutsceneFade = (ashfordCutsceneActive || statUnlockCutsceneActive) && (introCutscenePhase == INTRO_FADE_TO_BLACK || introCutscenePhase == INTRO_UNFADE)
    let showGame = (!onMenu && !intro && !splash) || storyCutsceneFade
    return showGame || introCutscenePhase == INTRO_UNFADE || continueFadePhase == CONTINUE_FADE_IN
}



def public is_advisor_hud_enabled() : bool {
    return ADVISOR_HUD_ENABLED
}



def public apply_screen_visibility() {
    let onMenu = is_on_main_menu()
    let splash = is_startup_splash_active()
    let intro = is_intro_cutscene_active()
    let showMenu = onMenu && (!splash || startupSplashPhase == SPLASH_FADE_IN_MENU) && (!intro || introCutscenePhase == INTRO_FADE_TO_BLACK)
    let gameplayVisible = is_gameplay_hud_visible()
    if (mainMenuRoot.isAlive) {
        mainMenuRoot.isActive = showMenu
    }
    if (startupSplashRoot.isAlive) {
        startupSplashRoot.isActive = splash
    }
    if (zoomRoot.isAlive) {
        zoomRoot.isActive = gameplayVisible
    }
    if (topBarRoot.isAlive) {
        topBarRoot.isActive = gameplayVisible
    }
    if (bottomBarRoot.isAlive) {
        bottomBarRoot.isActive = gameplayVisible
    }
    update_advisor_icon_visibility()
    if (introCutsceneRoot.isAlive) {
        let showCutscene = intro && introCutscenePhase != INTRO_FADE_TO_BLACK && introCutscenePhase != INTRO_UNFADE
        introCutsceneRoot.isActive = showCutscene
    }
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = intro || is_continue_fade_active()
    }
    if (dialogueRoot.isAlive && (onMenu || intro)) {
        dialogueRoot.isActive = false
    }
    hide_info_tooltip()
    if (!onMenu) {
        reset_main_menu_options_state()
    }
    if (onMenu) {
        reset_pause_menu_state()
        reset_character_profile_state()
        reset_advisor_popup_state()
        for (i in range(MAIN_MENU_BUTTON_COUNT)) {
            mainMenuButtonHovered[i] = false
            mainMenuButtonHoverT[i] = 0.0
        }
    }
    sync_background_music()
    sync_intro_cutscene_music()
}



def public compute_save_resume_id() : int {
    if (ashfordCutsceneActive) {
        return RESUME_ASHFORD_CUTSCENE
    }
    if (statUnlockCutsceneActive) {
        return cutscene_resume_id_for_stat(statUnlockCutsceneStatIdx)
    }
    if (statIntroPopupOpen) {
        return cutscene_resume_id_for_stat(statIntroPopupStatIdx)
    }
    return get_current_question_id()
}



def public save_current_game_snapshot() {
    if (screenPhase != SCREEN_PLAYING || defeatPhase != DEFEAT_NONE) {
        return
    }
    if (is_intro_cutscene_active()) {
        return
    }
    save_game_progress(compute_save_resume_id())
}



def public return_to_main_menu() {
    if (is_on_main_menu()) {
        return
    }
    save_current_game_snapshot()
    reset_pause_menu_state()
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
    deferCharacterEnter = true
    reset_game()
    refresh_save_availability()
    screenPhase = SCREEN_MAIN_MENU
    apply_screen_visibility()
    apply_main_menu_layout()
}



def public launch_new_game() {
    clear_game_save()
    deferCharacterEnter = true
    reset_game()
    start_intro_cutscene()
}



def public continue_saved_game_setup() : bool {
    if (!load_and_apply_game_progress()) {
        return false
    }
    reset_pause_menu_state()
    introCutscenePhase = INTRO_NONE
    introCutsceneT = 0.0
    if (introCutsceneRoot.isAlive) {
        introCutsceneRoot.isActive = false
    }
    defeatPhase = DEFEAT_NONE
    defeatStatIdx = -1
    hide_death_ui()
    menuOpen = false
    reset_character_profile_state()
    reset_advisor_popup_state()
    cancel_parallel_handoff()
    cameraZoomPhase = CAM_ZOOM_IDLE
    cameraZoomT = 0.0
    apply_camera_zoom()
    update_day_text()
    update_nickname_text()
    sync_stat_bar_children()

    let resumeId = get_loaded_next_resume_id()
    if (!is_cutscene_resume_id(resumeId)) {
        if (is_ashford_question_id(resumeId) || usingAshfordDebutEncounter) {
            ashfordIntroduced = true
            usingAshfordDebutEncounter = true
            characterTexture = visitorTextures[VISITOR_LADY_ASHFORD_IDX]
            currentNodeIdx = resumeId - ASHFORD_QUESTION_ID_BASE
            pendingNextNodeIdx = NO_NEXT_NODE
        } else {
            currentCourtCharacterIdx = get_encounter_character_idx(currentEncounterIdx)
            apply_court_character_texture(currentCourtCharacterIdx)
            roll_next_incoming_character_texture()
        }
        if (usingAshfordDebutEncounter) {
            update_character_texture_aspect(characterTexture)
        }
        refresh_character_visuals()
        prepare_character_offscreen()
        characterAnimPhase = CHARACTER_ANIM_HIDE
        hide_dialogue_ui()
        dialogPhase = DIALOG_IDLE
        if (characterRoot.isAlive) {
            characterRoot.isActive = true
        }
    }
    return true
}



def public finish_continue_loaded_game(skipEntryFade : bool = false) {
    let resumeId = get_loaded_next_resume_id()
    if (resumeId == RESUME_ASHFORD_CUTSCENE || is_stat_unlock_cutscene_resume_id(resumeId)) {
        let statIdx = stat_idx_for_cutscene_resume_id(resumeId)
        deferCharacterEnter = false
        begin_stat_unlock_popup(statIdx)
        return
    }
    deferCharacterEnter = false
    start_character_enter()
}



def public cancel_continue_fade() {
    continueFadePhase = CONTINUE_FADE_NONE
    continueFadeT = 0.0
    set_intro_fade_alpha(0.0)
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = false
    }
    apply_screen_visibility()
}



def public begin_continue_from_menu() {
    if (!is_on_main_menu() || is_intro_cutscene_active() || !hasSaveGame || is_continue_fade_active()) {
        return
    }
    continueFadePhase = CONTINUE_FADE_OUT
    continueFadeT = 0.0
    set_intro_fade_alpha(0.0)
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = true
    }
    apply_screen_visibility()
}



def public on_continue_fade_out_complete() {
    if (!continue_saved_game_setup()) {
        cancel_continue_fade()
        return
    }
    screenPhase = SCREEN_PLAYING
    let resumeId = get_loaded_next_resume_id()
    if (is_cutscene_resume_id(resumeId)) {
        continueFadePhase = CONTINUE_FADE_NONE
        continueFadeT = 0.0
        set_intro_fade_alpha(1.0)
        finish_continue_loaded_game(true)
        apply_screen_visibility()
        return
    }
    apply_screen_visibility()
    continueFadePhase = CONTINUE_FADE_IN
    continueFadeT = 0.0
}



def public on_continue_fade_in_complete() {
    continueFadePhase = CONTINUE_FADE_NONE
    continueFadeT = 0.0
    set_intro_fade_alpha(0.0)
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = false
    }
    finish_continue_loaded_game()
    apply_screen_visibility()
}



def public continue_saved_game() {
    if (!continue_saved_game_setup()) {
        return
    }
    introFadeAlpha = 0.0
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = false
        set_intro_fade_alpha(0.0)
    }
    screenPhase = SCREEN_PLAYING
    apply_screen_visibility()
    finish_continue_loaded_game()
}



def public is_main_menu_button_enabled(idx : int) : bool {
    if (idx == MAIN_MENU_CONTINUE_IDX) {
        return hasSaveGame
    }
    if (idx == MAIN_MENU_NEW_GAME_IDX || idx == MAIN_MENU_OPTIONS_IDX || idx == MAIN_MENU_ABOUT_IDX) {
        return true
    }
    return false
}



def public set_menu_open(open : bool) {
    if (open) {
        open_pause_menu()
    } else {
        close_pause_menu()
    }
}



def public get_current_dialogue_node() : DialogueNode {
    if (defeatPhase == DEFEAT_PEASANT_DIALOGUE) {
        let statIdx = (defeatStatIdx >= 0) ? defeatStatIdx : STAT_GOLD_IDX
        return get_defeat_dialogue_node(statIdx, currentNodeIdx)
    }
    if (usingAshfordDebutEncounter) {
        return get_ashford_debut_dialogue_node(currentNodeIdx)
    }
    if (usingStatUnlockEncounter) {
        return get_stat_unlock_dialogue_node(currentNodeIdx)
    }
    if (usingArcEncounter) {
        return resolve_arc_dialogue_node(activeArcId, activeArcBeatIdx, currentNodeIdx)
    }
    if (is_edric_day_one_encounter(currentEncounterIdx)) {
        return get_edric_day_one_dialogue_node(currentNodeIdx)
    }
    return get_dialogue_node(currentEncounterIdx, currentNodeIdx)
}



def public is_visitor_index_allowed(idx : int) : bool {
    if (idx == VISITOR_LADY_ASHFORD_IDX && !is_lady_ashford_visitor_allowed()) {
        return false
    }
    return true
}



def public pick_random_visitor_texture() : TextureId {
    var allowed : array<int>
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        if (is_visitor_index_allowed(i)) {
            push(allowed, i)
        }
    }
    if (length(allowed) == 0) {
        return visitorTextures[0]
    }
    let pick = allowed[random_range(0, length(allowed) - 1)]
    return visitorTextures[pick]
}



def public refresh_next_visitor_preview() {
    if (queuedNextArcId >= 0) {
        let charIdx = get_arc_character_idx(queuedNextArcId, queuedNextArcBeatIdx)
        nextVisitorTexture = courtBodyTextures[charIdx >= 0 && charIdx < COURT_CHARACTER_COUNT ? charIdx : CHAR_EDRIC]
        warm_character_visual(COURT_BODY_PATHS[charIdx >= 0 && charIdx < COURT_CHARACTER_COUNT ? charIdx : CHAR_EDRIC])
        return
    }
    let encIdx = queue_next_day_encounter_preview(currentDay + 1)
    if (encIdx < 0) {
        return
    }
    let charIdx = get_encounter_character_idx(encIdx)
    nextVisitorTexture = courtBodyTextures[charIdx]
    warm_character_visual(COURT_BODY_PATHS[charIdx])
}



def public apply_court_character_texture(charIdx : int) {
    var idx = charIdx
    if (idx < 0 || idx >= COURT_CHARACTER_COUNT) {
        idx = CHAR_EDRIC
    }
    currentCourtCharacterIdx = idx
    characterTexture = courtBodyTextures[idx]
    let bodyPath = COURT_BODY_PATHS[idx]
    warm_character_visual(bodyPath)
    warm_character_alpha(bodyPath)
    update_character_texture_aspect(characterTexture)
}



def public append_same_visitor_prompt(additionalPrompt : string) {
    let prefix = typewriterFullText
    typewriterFullText = "{prefix}\n{same_visitor_bridge_text()}\n{additionalPrompt}"
    typewriterCharCount = typewriter_text_length(prefix)
    typewriterAccumulator = 0.0
    typewriterKind = TYPEWRITER_PROMPT
    dialogPhase = DIALOG_TYPEWRITER
    answerRoot.isActive = false
    apply_dialogue_layout()
}



def public texture_path_for(tex : TextureId) : string {
    if (tex == kingTexture) {
        return KING_TEXTURE_PATH
    }
    if (tex == peasantTexture) {
        return PEASANT_TEXTURE_PATH
    }
    for (i in range(COURT_CHARACTER_COUNT)) {
        if (tex == courtBodyTextures[i]) {
            return COURT_BODY_PATHS[i]
        }
    }
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        if (tex == visitorTextures[i]) {
            return VISITOR_TEXTURE_PATHS[i]
        }
    }
    return KING_TEXTURE_PATH
}



def public update_character_texture_aspect(tex : TextureId) {
    let path = texture_path_for(tex)
    load_character_alpha_pixels(path)
    if (apply_character_visual(path)) {
        return
    }
    get_texture_size(tex) $(size : int2) {
        characterTextureAspect = float(size.x) / float(size.y)
        characterTextureUvRegion = float4(0.0, 0.0, 1.0, 1.0)
    }
}



def public is_mouse_over_bottom_bar() : bool {
    if (!bottomBarRoot.isAlive || !bottomBarRoot.isActive) {
        return false
    }
    return is_mouse_inside_frame(bottomBarRoot?.UIFrame)
}



def public is_mouse_over_character_frame() : bool {
    if (!characterImageNode.isAlive || !characterRoot.isAlive || !characterRoot.isActive) {
        return false
    }
    if (is_mouse_over_bottom_bar()) {
        return false
    }
    if (is_game_paused() || is_in_defeat_flow()) {
        return false
    }
    if (is_character_profile_open() || is_advisor_popup_open()) {
        return false
    }
    if (characterAnimPhase == CHARACTER_ANIM_EXIT || characterAnimPhase == CHARACTER_ANIM_HIDE) {
        return false
    }
    return is_mouse_inside_frame(characterImageNode?.UIFrame)
}



def public is_mouse_over_character_opaque() : bool {
    if (!is_mouse_over_character_frame()) {
        return false
    }
    if (characterAlphaWidth <= 0 || characterAlphaHeight <= 0 || length(characterAlphaPixels) == 0) {
        return false
    }

    let local = character_mouse_local_xy()
    let charSize = character_size()
    if (local.x < 0.0 || local.y < 0.0 || local.x > charSize.x || local.y > charSize.y) {
        return false
    }

    let u = characterTextureUvRegion.x + (local.x / charSize.x) * characterTextureUvRegion.z
    let v = characterTextureUvRegion.y + (local.y / charSize.y) * characterTextureUvRegion.w
    let px = clamp(int(u * float(characterAlphaWidth)), 0, characterAlphaWidth - 1)
    let py = clamp(int(v * float(characterAlphaHeight)), 0, characterAlphaHeight - 1)
    let idx = py * characterAlphaWidth + px
    return is_character_pixel_opaque(pixel_alpha(characterAlphaPixels[idx]))
}



def public current_character_reveal_t() : float {
    if (characterAnimPhase == CHARACTER_ANIM_IDLE) {
        return 1.0
    }
    return characterRevealT
}



def public format_death_summary_text() : string {
    if (defeatStatIdx >= 0) {
        return format_defeat_summary_text(defeatStatIdx, currentDay)
    }
    return death_summary_generic(currentDay)
}



def public format_death_record_text() : string {
    return death_record_text(recordDays)
}



def public menu_button_outer_height(innerHeight : float) : float {
    return innerHeight + 2.0 * ui_box_border()
}



def public clear_advisor_icon_hover() {
    if (!advisorHudIconHovered) {
        return
    }
    advisorHudIconHovered = false
    apply_advisor_icon_visual()
}



def public set_advisor_popup_slide_x(slideX : float) {
    advisorPopupSlideX = slideX
    if (!advisorPopupPanelNode.isAlive) {
        return
    }
    let panelPos = advisor_popup_panel_centered_top_left(slideX)
    set_frame_pos(advisorPopupPanelNode, panelPos)
    apply_advisor_popup_portrait_layout(panelPos)
}



def public rebuild_advisor_popup_grid_if_needed(contentW : float) {
    if (!advisorPopupScrollContentNode.isAlive) {
        return
    }
    if (!advisor_popup_grid_needs_rebuild()) {
        return
    }
    if (advisorPopupGridNode.isAlive) {
        remove_node(advisorPopupGridNode)
    }
    advisorPopupGridNode = build_advisor_popup_grid(contentW)
    advisorPopupGridNode.set_parent(advisorPopupScrollContentNode, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(advisorPopupGridNode, float2(0.0, 0.0))
    set_frame_pos(advisorPopupGridNode, float2(0.0, 0.0))
    wire_advisor_action_listeners()
    wire_advisor_action_event_listeners()
}



def public configure_advisor_card_title_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = false
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    apply_ui_font(node)
}



def public configure_advisor_card_desc_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    apply_dialogue_font(node)
}



def public configure_advisor_card_line_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    apply_dialogue_font(node)
}



def public configure_advisor_status_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Middle
    node?.UIText.pivot = float2(0.0, 0.5)
    set_frame_pivot(node, float2(0.0, 0.5))
    apply_ui_font(node)
}



def public clear_advisor_popup_status() {
    if (!advisorPopupStatusNode.isAlive) {
        return
    }
    advisorPopupStatusNode?.UIText.text = ""
    advisorPopupStatusNode.isActive = false
}



def public layout_advisor_title_row(contentW : float) : float {
    if (!advisorPopupTitleRowNode.isAlive || !advisorPopupTitleNode.isAlive) {
        return ui_h(ADVISOR_PANEL_TITLE_FONT_SIZE)
    }
    let titleFontSize = ui_h(ADVISOR_PANEL_TITLE_FONT_SIZE)
    let statusFontSize = ui_h(ADVISOR_PANEL_STATUS_FONT_SIZE)
    let titleGap = ui_w(ADVISOR_PANEL_TITLE_ROW_GAP)
    set_text_font_size(advisorPopupTitleNode, titleFontSize)
    advisorPopupTitleNode?.UIText.wordWrapping = false
    advisorPopupTitleNode?.UIText.autoResizeFrame = true
    var titleW = advisorPopupTitleNode?.UIFrame.size.x
    if (titleW <= 0.0) {
        titleW = titleFontSize * 3.5
    }
    var titleRowH = max(advisorPopupTitleNode?.UIFrame.size.y, titleFontSize)
    if (advisorPopupStatusNode.isAlive && advisorPopupStatusNode.isActive && length(advisorPopupStatusNode?.UIText.text) > 0) {
        set_text_font_size(advisorPopupStatusNode, statusFontSize)
        let statusW = max(contentW - titleW - titleGap, ui_w(160.0))
        set_frame_width(advisorPopupStatusNode, statusW)
        titleRowH = max(titleRowH, max(advisorPopupStatusNode?.UIFrame.size.y, statusFontSize))
    }
    set_frame_size(advisorPopupTitleRowNode, float2(contentW, titleRowH))
    return titleRowH
}



def public clear_ui_node_children(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    var inscope children = node.get_children()
    for (child in children) {
        remove_node(child)
    }
}



def public refresh_advisor_action_effect_row(actionIdx : int; deltas : int[STAT_COUNT]; hoverT : float; enabled : bool) {
    let container = advisorActionEffectRowNodes[actionIdx]
    if (!container.isAlive) {
        return
    }
    let fontSize = ui_h(ADVISOR_ACTION_EFFECT_FONT_SIZE)
    let lineHeight = advisor_action_effect_line_height()
    let lineGap = ui_h(ADVISOR_ACTION_EFFECT_LINE_SPACING)
    var lineWidth = container?.UIFrame.size.x
    if (lineWidth <= 0.0) {
        lineWidth = ui_w(ADVISOR_PANEL_WIDTH * 0.35)
    }

    let minusText = format_advisor_effect_line(deltas, true)
    let plusText = format_advisor_effect_line(deltas, false)
    let hasMinus = length(minusText) > 0
    let hasPlus = length(plusText) > 0
    let blockH = advisor_action_effect_block_height(hasMinus, hasPlus)
    set_frame_size(container, float2(lineWidth, blockH))
    set_image_color(container, float4(0.0, 0.0, 0.0, 0.0))

    update_advisor_effect_line_text(advisorActionEffectMinusNodes[actionIdx], minusText, -1, hoverT, enabled, fontSize, lineWidth, lineHeight, 0.0)
    update_advisor_effect_chips(advisorActionEffectMinusNodes[actionIdx], deltas, -1, hoverT, enabled, fontSize, lineWidth, lineHeight)

    let plusYOffset = hasMinus ? (lineHeight + lineGap) : 0.0
    update_advisor_effect_line_text(advisorActionEffectPlusNodes[actionIdx], plusText, 1, hoverT, enabled, fontSize, lineWidth, lineHeight, plusYOffset)
    update_advisor_effect_chips(advisorActionEffectPlusNodes[actionIdx], deltas, 1, hoverT, enabled, fontSize, lineWidth, lineHeight)

    let emptyNode = advisorActionEffectEmptyNodes[actionIdx]
    if (!hasMinus && !hasPlus) {
        let emptyText = format_advisor_action_preview(deltas)
        let alpha = enabled ? 1.0 : ADVISOR_ACTION_DISABLED_ALPHA
        if (emptyNode.isAlive) {
            emptyNode.isActive = true
            if (emptyNode?.UIText.text != emptyText) {
                emptyNode?.UIText.text = emptyText
            }
            set_text_font_size(emptyNode, fontSize)
            set_text_color(emptyNode, float4(ADVISOR_ACTION_DESC_COLOR.x, ADVISOR_ACTION_DESC_COLOR.y, ADVISOR_ACTION_DESC_COLOR.z, alpha))
            emptyNode?.UIText.size = float2(lineWidth, lineHeight)
            set_frame_size(emptyNode, float2(lineWidth, lineHeight))
            set_frame_pos(emptyNode, float2(0.0, 0.0))
        }
        if (advisorActionEffectMinusNodes[actionIdx].isAlive) {
            advisorActionEffectMinusNodes[actionIdx].isActive = false
        }
        if (advisorActionEffectPlusNodes[actionIdx].isAlive) {
            advisorActionEffectPlusNodes[actionIdx].isActive = false
        }
    } elif (emptyNode.isAlive) {
        emptyNode.isActive = false
    }
}



def public layout_advisor_action_card(actionIdx : int; cardSize : float2) {
    let border = advisorActionSlotNodes[actionIdx]
    let fill = advisorActionSlotFillNodes[actionIdx]
    if (!border.isAlive || !fill.isAlive) {
        return
    }
    let inset = ui_w(2.0)
    let innerW = cardSize.x - inset * 2.0
    let innerH = cardSize.y - inset * 2.0
    let pad = ui_h(ADVISOR_ACTION_CARD_INNER_PAD)
    let textW = innerW - 2.0 * pad
    set_frame_size(border, cardSize)
    border.localScale = float3(1.0, 1.0, 1.0)
    set_frame_size(fill, float2(innerW, innerH))
    set_frame_pos(fill, float2(inset, inset))
    if (advisorActionImageNodes[actionIdx].isAlive) {
        apply_advisor_action_image_cover(actionIdx, innerW, innerH)
    }
    if (advisorActionOverlayNodes[actionIdx].isAlive) {
        set_frame_size(advisorActionOverlayNodes[actionIdx], float2(innerW, innerH))
        set_frame_pos(advisorActionOverlayNodes[actionIdx], float2(0.0, 0.0))
    }
    if (advisorActionTitleNodes[actionIdx].isAlive) {
        set_text_font_size(advisorActionTitleNodes[actionIdx], ui_h(ADVISOR_ACTION_TITLE_FONT_SIZE))
        set_frame_width(advisorActionTitleNodes[actionIdx], textW)
        advisorActionTitleNodes[actionIdx]?.UIText.wordWrapping = false
        advisorActionTitleNodes[actionIdx]?.UIText.autoResizeFrame = false
    }
    if (advisorActionDescNodes[actionIdx].isAlive) {
        set_text_font_size(advisorActionDescNodes[actionIdx], ui_h(ADVISOR_ACTION_DESC_FONT_SIZE))
        let descH = advisor_action_desc_text_height(innerH)
        apply_advisor_card_desc_layout(advisorActionDescNodes[actionIdx], textW, descH)
        advisorActionDescNodes[actionIdx]?.UIText.autoResizeFrame = false
        advisorActionDescNodes[actionIdx]?.UIText.wordWrapping = true
        let bodyCol = advisorActionDescNodes[actionIdx].parent
        if (bodyCol.isAlive) {
            set_spacing(bodyCol, ui_h(ADVISOR_ACTION_DESC_EFFECT_SPACING))
        }
    }
    if (advisorActionEffectRowNodes[actionIdx].isAlive) {
        let effectBlockH = advisor_action_effect_block_height(true, true)
        set_frame_size(advisorActionEffectRowNodes[actionIdx], float2(textW, effectBlockH))
    }
    if (advisorActionHitNodes[actionIdx].isAlive) {
        set_frame_size(advisorActionHitNodes[actionIdx], float2(innerW, innerH))
    }
}



def public refresh_advisor_action_slots() {
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        let fill = advisorActionSlotFillNodes[i]
        if (!fill.isAlive) {
            continue
        }
        let available = is_advisor_action_available(i) && can_execute_advisor_actions()
        if (advisorActionTitleNodes[i].isAlive) {
            advisorActionTitleNodes[i]?.UIText.text = advisor_action_title(i)
        }
        if (advisorActionDescNodes[i].isAlive) {
            advisorActionDescNodes[i]?.UIText.text = advisor_action_description(i)
        }
        apply_advisor_action_card_visual(i, advisorActionHoverT[i], available)
        if (advisorActionHitNodes[i].isAlive) {
            set_ui_button_interactable(advisorActionHitNodes[i], can_execute_advisor_actions())
        }
    }
}



def public can_click_advisor_icon() : bool {
    if (!can_hover_advisor_icon()) {
        return false
    }
    return advisorHudIconHovered
}



def public apply_death_summary_layout() {
    if (!deathSummaryContentNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let boxW = ui_w(DEATH_SUMMARY_BOX_WIDTH)
    let padding = ui_h(DEATH_SUMMARY_BOX_PADDING)
    let innerW = boxW - 2.0 * border
    let textW = innerW - 2.0 * padding
    set_text_font_size(deathSummaryTextNode, ui_h(DEATH_SUMMARY_FONT_SIZE))
    set_text_font_size(deathRecordTextNode, ui_h(DEATH_RECORD_FONT_SIZE))
    set_frame_width(deathSummaryTextNode, textW)
    set_frame_width(deathRecordTextNode, textW)
    let buttonH = try_again_button_height()
    let tryAgainW = ui_w(TRY_AGAIN_BUTTON_WIDTH)
    layout_centered_answer_button(tryAgainButtonNode, tryAgainW)
    let tryAgainFill = answer_button_fill(tryAgainButtonNode)
    if (tryAgainFill.isAlive) {
        tryAgainFill?.UIText.fontSize = ui_h(ANSWER_FONT_SIZE)
        // A one-line label, centred like the other buttons rather than top-aligned like a choice.
        configure_royal_button_text(tryAgainFill)
    }
    if (tryAgainRowNode.isAlive) {
        set_frame_size(tryAgainRowNode, float2(textW, buttonH))
    }
    let summaryH = max(deathSummaryTextNode?.UIFrame.size.y, ui_h(DEATH_SUMMARY_FONT_SIZE + 12.0))
    let recordH = max(deathRecordTextNode?.UIFrame.size.y, ui_h(DEATH_RECORD_FONT_SIZE + 12.0))
    let spacing = ui_h(20.0)
    let spacingTotal = spacing * 2.0
    let contentH = summaryH + recordH + buttonH + spacingTotal + 2.0 * padding + ui_h(DEATH_SUMMARY_EXTRA_PADDING)
    set_spacing(deathSummaryContentNode, spacing)
    set_padding(deathSummaryContentNode, float4(padding, padding, padding, padding))
    set_frame_size(deathSummaryContentNode, float2(innerW, contentH))
    set_frame_size(deathSummaryBoxNode, float2(innerW, contentH))
    set_frame_pos(deathSummaryBoxNode, float2(border, border))
    set_frame_size(deathSummaryBorderNode, float2(boxW, contentH + 2.0 * border))
}



def public set_incoming_visitor_offset(offsetX : float; offsetY : float = 0.0) {
    if (!incomingVisitorRoot.isAlive) {
        return
    }
    get_component(incomingVisitorRoot) $(var anchor : UIAnchor?) {
        anchor.left = offsetX
        anchor.top = -floor(offsetY + 0.5)
    }
}



def public apply_incoming_silhouette(revealT : float) {
    if (!incomingVisitorSilhouetteNode.isAlive) {
        return
    }
    let t = clamp(revealT, 0.0, 1.0)
    if (t >= 1.0) {
        incomingVisitorSilhouetteNode.isActive = false
        return
    }
    incomingVisitorSilhouetteNode.isActive = true
    let overlayAlpha = 1.0 - t
    let overlayRgb = lerp(0.0, CHARACTER_SILHOUETTE_FADE_RGB, t)
    set_image_color(incomingVisitorSilhouetteNode, float4(overlayRgb, overlayRgb, overlayRgb, overlayAlpha))
}



def public layout_incoming_visitor() {
    if (!incomingVisitorRoot.isAlive) {
        return
    }
    let charSize = incoming_character_size()
    set_frame_size(incomingVisitorRoot, charSize)
    if (incomingVisitorImageNode.isAlive) {
        incomingVisitorImageNode?.UIImage.size = charSize
        incomingVisitorImageNode?.UIImage.uvRegion = incomingTextureUvRegion
        apply_character_image_top_clip(incomingVisitorImageNode)
    }
    if (incomingVisitorSilhouetteNode.isAlive) {
        incomingVisitorSilhouetteNode?.UIImage.size = charSize
        incomingVisitorSilhouetteNode?.UIImage.uvRegion = incomingTextureUvRegion
        apply_character_image_top_clip(incomingVisitorSilhouetteNode)
    }
}



def public transform_zoom_local_to_screen(localPos : float2) : float2 {
    let center = float2(screen_w(), screen_h()) * 0.5
    let scale = zoom_ui_scale()
    return center + (localPos - center) * scale
}



def public get_dialogue_speaker_name() : string {
    if (defeatPhase == DEFEAT_PEASANT_DIALOGUE) {
        let idx = character_idx_for_texture(characterTexture)
        if (idx >= 0) {
            return get_character_profile(idx).name
        }
        return ""
    }
    if (usingAshfordDebutEncounter) {
        return get_character_profile(VISITOR_LADY_ASHFORD_IDX).name
    }
    return get_court_character_name(currentCourtCharacterIdx)
}



def public update_dialogue_speaker_name() {
    if (!questionNameNode.isAlive) {
        return
    }
    questionNameNode?.UIText.text = get_dialogue_speaker_name()
}



def public sync_question_response_parent() {
    if (!questionResponseNode.isAlive || !questionContentNode.isAlive || !questionBorderNode.isAlive) {
        return
    }
    let showResponse = questionResponseNode.isActive && length(dialogueBranchResponseText) > 0
    if (showResponse) {
        add_child(questionContentNode, questionResponseNode, 1, AddChildStrategy.KeepLocalTransform)
    } elif (questionResponseNode.parent == questionContentNode) {
        questionResponseNode.set_parent(questionBorderNode, AddChildStrategy.KeepLocalTransform)
    }
}



def public apply_question_box_layout(dialogueW : float) {
    if (!questionBorderNode.isAlive) {
        return
    }
    sync_question_response_parent()
    let border = ui_box_border()
    let padding = ui_h(DIALOGUE_BOX_PADDING)
    let innerW = dialogueW - 2.0 * border
    let textW = innerW - 2.0 * padding

    set_text_font_size(questionNameNode, ui_h(DIALOGUE_NAME_FONT_SIZE))
    questionNameNode?.UIText.autoResizeFrame = true
    questionNameNode?.UIText.wordWrapping = false
    set_frame_width(questionNameNode, textW)
    var nameH = questionNameNode?.UIFrame.size.y
    if (nameH <= 0.0 && length(questionNameNode?.UIText.text) > 0) {
        nameH = ui_h(DIALOGUE_NAME_FONT_SIZE)
    }

    var responseH = 0.0
    if (questionResponseNode.isAlive && questionResponseNode.isActive && length(dialogueBranchResponseText) > 0 && questionResponseNode.parent == questionContentNode) {
        set_text_font_size(questionResponseNode, ui_h(DIALOGUE_BRANCH_RESPONSE_FONT_SIZE))
        questionResponseNode?.UIText.autoResizeFrame = true
        questionResponseNode?.UIText.wordWrapping = true
        set_frame_width(questionResponseNode, textW)
        responseH = questionResponseNode?.UIFrame.size.y
    }

    set_text_font_size(questionTextNode, ui_h(QUESTION_FONT_SIZE))
    questionTextNode?.UIText.autoResizeFrame = true
    questionTextNode?.UIText.wordWrapping = true
    set_frame_width(questionTextNode, textW)
    var textH = questionTextNode?.UIFrame.size.y
    if (textH <= 0.0 && length(questionTextNode?.UIText.text) > 0) {
        textH = ui_h(QUESTION_FONT_SIZE)
    }

    let spacing = ui_h(DIALOGUE_NAME_SPACING)
    var bodyH = 0.0
    var visibleBlocks = 0
    if (nameH > 0.0) {
        bodyH += nameH
        visibleBlocks++
    }
    if (responseH > 0.0) {
        bodyH += responseH
        visibleBlocks++
    }
    if (textH > 0.0) {
        bodyH += textH
        visibleBlocks++
    }
    if (visibleBlocks > 1) {
        bodyH += spacing * float(visibleBlocks - 1)
    }
    let contentH = bodyH + 2.0 * padding

    set_padding(questionContentNode, float4(padding, padding, padding, padding))
    set_frame_size(questionContentNode, float2(innerW, contentH))
    set_frame_size(questionBoxNode, float2(innerW, contentH))
    set_frame_pos(questionBoxNode, float2(border, border))
    set_frame_size(questionBorderNode, float2(dialogueW, contentH + 2.0 * border))
}



def public layout_visible_choice_buttons(dialogueW : float) {
    let node = get_current_dialogue_node()
    let count = visible_choice_count(node)
    let buttonW = compute_answer_button_width(dialogueW)
    let answerSpacing = ui_h(ANSWER_SPACING)
    var totalH = 0.0
    for (i in range(count)) {
        let btn = choiceButtonNodes[i]
        let fill = answer_button_fill(btn)
        let choiceText = node.choices[i].choiceText
        if (fill.isAlive && fill?.UIText.text != choiceText) {
            fill?.UIText.text = choiceText
            choiceButtonCachedText[i] = choiceText
        }
        let innerH = measure_choice_menu_button_height(fill, choiceText, buttonW)
        choiceButtonCachedHeights[i] = innerH
        totalH += menu_button_outer_height(innerH)
        if (i < count - 1) {
            totalH += answerSpacing
        }
    }
    set_spacing(answerRoot, answerSpacing)
    set_frame_size(answerRoot, float2(dialogueW, totalH))
    for (i in range(MAX_CHOICES)) {
        let btn = choiceButtonNodes[i]
        if (!btn.isAlive) {
            continue
        }
        if (i < count) {
            btn.isActive = true
            layout_choice_button(btn, buttonW, choiceButtonCachedHeights[i])
        } else {
            btn.isActive = false
        }
    }
}


var statHoverBlinkTime = 0.0



def public sync_character_image_size(node : NodeId; charSize : float2) {
    if (!node.isAlive) {
        return
    }
    set_frame_size(node, charSize)
    node?.UIImage.size = charSize
    node.localScale = float3(1.0, 1.0, 1.0)
    node?.UIImage.uvRegion = characterTextureUvRegion
    apply_character_image_top_clip(node)
}



def public reset_choice_hover_state() {
    hoveredChoice = HOVER_NONE
    for (i in range(MAX_CHOICES)) {
        choiceHoverT[i] = 0.0
        let btn = choiceButtonNodes[i]
        if (btn.isAlive) {
            apply_menu_button_visual(btn, 0.0, true)
        }
    }
}



def public show_answer_buttons() {
    reset_choice_hover_state()
    answerRoot.isActive = true
    mark_dialogue_layout_dirty()
    apply_dialogue_layout()
}



def public begin_typewriter(bodyText : string; kind : int) {
    typewriterKind = kind
    typewriterFullText = bodyText
    typewriterCharCount = 0
    typewriterAccumulator = 0.0
    update_dialogue_speaker_name()
    questionTextNode?.UIText.text = ""
    apply_dialogue_layout()
    dialogueRoot.isActive = true
    questionBorderNode.isActive = true
    answerRoot.isActive = false
    dialogPhase = DIALOG_TYPEWRITER
}



def public start_prompt_typewriter(responsePrefix : string = "") {
    lastSelectedChoiceIdx = -1
    typewriterPromptPrefix = responsePrefix
    let node = get_current_dialogue_node()
    begin_typewriter(build_dialogue_prompt_text(typewriterPromptPrefix, node.prompt), TYPEWRITER_PROMPT)
}



def public start_typewriter() {
    if (dialogPhase != DIALOG_IDLE) {
        return
    }
    pendingNextNodeIdx = NO_NEXT_NODE
    clear_dialogue_branch_response()
    start_prompt_typewriter()
}



def public finish_typewriter() {
    questionTextNode?.UIText.text = typewriterFullText
    if (typewriterKind == TYPEWRITER_PROMPT) {
        dialogPhase = DIALOG_CHOOSING
        show_answer_buttons()
        return
    }
    if (typewriterKind == TYPEWRITER_RESPONSE) {
        if (pendingNextNodeIdx != NO_NEXT_NODE) {
            let responsePrefix = typewriterFullText
            clear_dialogue_branch_response()
            currentNodeIdx = pendingNextNodeIdx
            pendingNextNodeIdx = NO_NEXT_NODE
            let nextQuestionId = get_current_question_id()
            save_game_progress(nextQuestionId)
            start_prompt_typewriter(responsePrefix)
        } else {
            clear_dialogue_branch_response()
            dialogPhase = DIALOG_POST_RESPONSE_HOLD
            postResponseHoldTimer = POST_RESPONSE_HOLD_DURATION
        }
    }
}



def public finish_post_response_hold() {
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    if (defeatPhase == DEFEAT_PEASANT_DIALOGUE) {
        defeatPhase = DEFEAT_WAIT_FADE
        start_character_exit()
    } else {
        start_character_exit()
    }
}



def public finish_camera_zoom_in() {
    cameraZoomT = 1.0
    apply_camera_zoom()
    cameraZoomPhase = CAM_ZOOM_IDLE
    if (dialogPhase == DIALOG_IDLE) {
        start_typewriter()
    }
}



def public begin_ashford_cutscene(skipEntryFade : bool = false) {
    ensure_intro_cutscene_assets_loaded()
    hide_dialogue_ui()
    cancel_parallel_handoff()
    reset_intro_cutscene_skip_ui()
    if (characterRoot.isAlive && characterAnimPhase != CHARACTER_ANIM_EXIT) {
        characterRoot.isActive = false
    }
    cameraZoomT = 0.0
    cameraZoomPhase = CAM_ZOOM_IDLE
    apply_camera_zoom()
    ashfordCutsceneActive = true
    introCutscenePhase = (skipEntryFade ? INTRO_SCENE_WAIT : INTRO_FADE_TO_BLACK)
    introCutsceneT = 0.0
    introCutsceneSlideX = 0.0
    introPictureSlideDone = false
    introNameSlideX = intro_name_hidden_left_x()
    introTypewriterCharCount = 0
    introTypewriterAccumulator = 0.0
    introCutsceneLayoutMode = INTRO_LAYOUT_SEQ1
    introActiveBottomYRatio = INTRO_IMAGE_BOTTOM_Y_RATIO
    introDialogueBeat = 0
    introDialogueSubPhase = INTRO_DIALOGUE_NAME_SLIDE
    introSeq3SlideX = 0.0
    introSeq4SlideX = 0.0
    introSeq5SlideX = 0.0
    introSeq6SlideX = 0.0
    introSeq3SlideDone = false
    introSeq4SlideDone = false
    introSeq5SlideDone = false
    introSeq6SlideDone = false
    introSeq3Visible = false
    introSeq4Visible = false
    introSeq5Visible = false
    introSeq6Visible = false
    introCutsceneImageNode?.UIImage.textureId = ashfordCutsceneTexture
    update_ashford_cutscene_texture_aspect()
    set_intro_image_visible(false)
    set_intro_text_visible(false)
    set_intro_seq3_visible(false)
    set_intro_seq4_visible(false)
    set_intro_seq5_visible(false)
    set_intro_seq6_visible(false)
    refresh_intro_name_text()
    refresh_intro_replica_text()
    apply_intro_slide_positions()
    set_intro_fade_alpha((skipEntryFade ? 1.0 : 0.0))
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = true
    }
    apply_intro_cutscene_layout()
    apply_screen_visibility()
}



def public begin_stat_unlock_cutscene(statIdx : int; skipEntryFade : bool = false) {
    ensure_intro_cutscene_assets_loaded()
    hide_dialogue_ui()
    cancel_parallel_handoff()
    reset_intro_cutscene_skip_ui()
    if (characterRoot.isAlive && characterAnimPhase != CHARACTER_ANIM_EXIT) {
        characterRoot.isActive = false
    }
    cameraZoomT = 0.0
    cameraZoomPhase = CAM_ZOOM_IDLE
    apply_camera_zoom()
    statUnlockCutsceneActive = true
    statUnlockCutsceneStatIdx = statIdx
    introCutscenePhase = (skipEntryFade ? INTRO_SCENE_WAIT : INTRO_FADE_TO_BLACK)
    introCutsceneT = 0.0
    introCutsceneSlideX = 0.0
    introPictureSlideDone = false
    introNameSlideX = intro_name_hidden_left_x()
    introTypewriterCharCount = 0
    introTypewriterAccumulator = 0.0
    introCutsceneLayoutMode = INTRO_LAYOUT_SEQ1
    introActiveBottomYRatio = INTRO_IMAGE_BOTTOM_Y_RATIO
    introDialogueBeat = 0
    introDialogueSubPhase = INTRO_DIALOGUE_NAME_SLIDE
    introSeq3SlideX = 0.0
    introSeq4SlideX = 0.0
    introSeq5SlideX = 0.0
    introSeq6SlideX = 0.0
    introSeq3SlideDone = false
    introSeq4SlideDone = false
    introSeq5SlideDone = false
    introSeq6SlideDone = false
    introSeq3Visible = false
    introSeq4Visible = false
    introSeq5Visible = false
    introSeq6Visible = false
    introCutsceneImageNode?.UIImage.textureId = stat_unlock_cutscene_texture(statIdx)
    update_stat_unlock_cutscene_texture_aspect(statIdx)
    set_intro_image_visible(false)
    set_intro_text_visible(false)
    set_intro_seq3_visible(false)
    set_intro_seq4_visible(false)
    set_intro_seq5_visible(false)
    set_intro_seq6_visible(false)
    refresh_intro_name_text()
    refresh_intro_replica_text()
    apply_intro_slide_positions()
    set_intro_fade_alpha((skipEntryFade ? 1.0 : 0.0))
    if (introFadeOverlay.isAlive) {
        introFadeOverlay.isActive = true
    }
    apply_intro_cutscene_layout()
    apply_screen_visibility()
}



def public resume_day_visitor_after_cutscene() {
    apply_current_encounter_character()
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    save_game_progress(get_current_question_id())
    start_character_enter()
}



def public finish_stat_unlock_cutscene() {
    let statIdx = statUnlockCutsceneStatIdx
    reset_intro_cutscene_skip_ui()
    statUnlockCutsceneActive = false
    statUnlockCutsceneStatIdx = -1
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
    cameraZoomT = 0.0
    cameraZoomPhase = CAM_ZOOM_IDLE
    apply_camera_zoom()
    unlock_stat_with_reveal(statIdx)
    sync_stat_bar_children()
    apply_screen_visibility()
    if (statIdx == STAT_RICH_LOVE_IDX) {
        start_ashford_debut_encounter()
    } else {
        start_stat_intro_encounter(statIdx)
    }
}



def public finish_ashford_cutscene() {
    reset_intro_cutscene_skip_ui()
    ashfordCutsceneActive = false
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
    cameraZoomT = 0.0
    cameraZoomPhase = CAM_ZOOM_IDLE
    apply_camera_zoom()
    unlock_stat_with_reveal(STAT_RICH_LOVE_IDX)
    sync_stat_bar_children()
    apply_screen_visibility()
    start_ashford_debut_encounter()
}



def public finish_character_enter_slide() {
    characterAnimOffsetX = characterRestOffsetX
    characterWalkBobTimer = 0.0
    set_character_offset(characterRestOffsetX)
    characterRevealT = CHARACTER_ENTER_LIGHT_START
    characterAnimPhase = CHARACTER_ANIM_REVEAL
    apply_character_image_color(CHARACTER_ENTER_LIGHT_START)
    juice_on_character_arrived()
}



def public finish_character_reveal() {
    // Skipping the walk-in jumps straight here, so make sure a pending banner still plays.
    juice_play_pending_celebration()
    characterRevealT = 1.0
    apply_character_image_color(1.0)
    characterAnimPhase = CHARACTER_ANIM_IDLE
    characterBreathTimer = 0.0
    start_camera_zoom_in()
}



def public finish_character_enter() {
    characterAnimOffsetX = characterRestOffsetX
    characterWalkBobTimer = 0.0
    characterBreathTimer = 0.0
    set_character_offset(characterRestOffsetX)
    characterRevealT = 1.0
    apply_character_image_color(1.0)
    characterAnimPhase = CHARACTER_ANIM_IDLE
    finish_camera_zoom_in()
}



def public finish_character_exit() {
    characterAnimOffsetX = character_exit_end_offset()
    set_character_offset(characterAnimOffsetX)
    characterAnimPhase = CHARACTER_ANIM_IDLE
    characterWalkBobTimer = 0.0
    characterRevealT = 0.0
    apply_character_image_color(0.0)
    if (parallelHandoffActive && characterRoot.isAlive) {
        characterRoot.isActive = false
    }
    characterExitFinished = true
    try_advance_to_wait()
}



def public finish_parallel_incoming_enter() {
    if (!parallelHandoffActive || incomingEnterFinished) {
        return
    }
    incomingAnimOffsetX = compute_character_rest_offset_x()
    set_incoming_visitor_offset(incomingAnimOffsetX)
    incomingEnterFinished = true
    try_advance_to_wait()
}



def public stat_icon_side() : float {
    let maxSide = ui_h(BOTTOM_BAR_HEIGHT - STAT_BAR_HEIGHT - STAT_ICON_LAYOUT_PAD)
    return maxSide * STAT_ICON_SIZE_RATIO
}



def public stat_column_width() : float {
    return max(stat_icon_side(), stat_bar_outer_width())
}



def public stat_icon_to_bar_gap() : float {
    let available = ui_h(BOTTOM_BAR_HEIGHT) - stat_icon_side() - stat_bar_outer_height()
    let requested = ui_h(STAT_BAR_GAP)
    return min(requested, max(0.0, available))
}



def public stat_icon_drop_room() : float {
    return ui_h(STAT_EMPHASIS_DROP)
}



def public stat_column_size() : float2 {
    return float2(stat_column_width(), ui_h(BOTTOM_BAR_HEIGHT))
}



def public configure_stat_icon(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIImage.color = float4(1.0, 1.0, 1.0, 1.0)
    node?.UIImage.pivot = float2(0.5, 0.5)
    node?.UIImage.localPosition2D = float2(0.0, 0.0)
}



def public configure_stat_icon_mask(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIImage.pivot = float2(0.5, 0.5)
    node?.UIImage.localPosition2D = float2(0.0, 0.0)
    var hasMask = false
    get_component(node) $(var existing : UIMask?) {
        hasMask = existing != null
    }
    if (!hasMask) {
        add_component(node, new UIMask())
    }
    get_component(node) $(var mask : UIMask?) {
        if (mask != null) {
            mask.enabled = true
            mask.showMaskSource = true
        }
    }
}



def public configure_stat_icon_color_fill(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIImage.textureId = statBarFillTexture
    node?.UIImage.pivot = float2(0.5, 0.5)
    node?.UIImage.localPosition2D = float2(0.0, 0.0)
}



def public configure_stat_icon_outline(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIImage.pivot = float2(0.5, 0.5)
    node?.UIImage.localPosition2D = float2(0.0, 0.0)
}



def public dim_stat_icon_tint_color(col : float4) : float4 {
    let rgb = float3(col.x, col.y, col.z) * STAT_ICON_COLOR_BRIGHTNESS
    return float4(rgb, col.w)
}



def public stat_fill_color_for_percent(percent : float) : float4 {
    let p = clamp(percent, 0.0, float(STAT_MAX))
    if (p <= 0.0) {
        return float4(0.0, 0.0, 0.0, 0.0)
    }
    if (p < 1.0) {
        return lerp(float4(0.0, 0.0, 0.0, 0.0), STAT_FLASH_NEGATIVE_COLOR, p)
    }
    if (p <= 50.0) {
        let t = (p - 1.0) / 49.0
        return lerp(STAT_FLASH_NEGATIVE_COLOR, STAT_BAR_MID_COLOR, t)
    }
    let t = (p - 50.0) / 50.0
    return lerp(STAT_BAR_MID_COLOR, STAT_FLASH_POSITIVE_COLOR, t)
}



def public layout_stat_bar_fill_value(statIdx : int; value : float) {
    let fillNode = statBarFillNodes[statIdx]
    if (!fillNode.isAlive) {
        return
    }
    let barW = stat_bar_outer_width()
    let barH = stat_bar_outer_height()
    let fillWidth = barW * (clamp(value, 0.0, float(STAT_MAX)) / float(STAT_MAX))
    set_frame_size(fillNode, float2(max(fillWidth, ui_w(2.0)), barH))
}



def public stat_icon_tint_color_for_percent(percent : float) : float4 {
    let p = clamp(percent, 0.0, float(STAT_MAX))
    if (p <= 50.0) {
        let t = p / 50.0
        return lerp(STAT_FLASH_NEGATIVE_COLOR, STAT_BAR_MID_COLOR, t)
    }
    let t = (p - 50.0) / 50.0
    return lerp(STAT_BAR_MID_COLOR, STAT_FLASH_POSITIVE_COLOR, t)
}



def public stat_display_tint_color(statIdx : int) : float4 {
    let baseCol = stat_fill_color_for_percent(statFillDisplayed[statIdx])
    let flashCol = statFlashPositive[statIdx] ? STAT_FLASH_POSITIVE_COLOR : STAT_FLASH_NEGATIVE_COLOR
    let t = clamp(statFlashT[statIdx], 0.0, 1.0)
    return lerp(baseCol, flashCol, t)
}



def public stat_column_fill_value(statIdx : int) : float {
    if (statConfirmPhase[statIdx] != STAT_CONFIRM_IDLE) {
        return statFillDisplayed[statIdx]
    }
    return float(kingdomStats[statIdx])
}



def public apply_stat_fill_color(statIdx : int) {
    let fillNode = statBarFillNodes[statIdx]
    if (!fillNode.isAlive) {
        return
    }
    set_image_color(fillNode, stat_display_tint_color(statIdx))
}



def public stat_hover_outline_blink_white() : bool {
    let ticks = int(floor(statHoverBlinkTime * STAT_HOVER_OUTLINE_BLINK_HZ))
    return (ticks & 1) == 0
}



def public stat_hover_outline_color() : float4 {
    // A steady gold glow that breathes, instead of blinking black and white.
    let pulse = 0.72 + 0.28 * sin(statHoverBlinkTime * STAT_ICON_HOVER_PULSE_SPEED)
    return float4(1.0, 0.84, 0.3, pulse)
}



def public apply_stat_icon_color(statIdx : int) {
    let icon = statIconWrapNodes[statIdx]
    if (icon.isAlive) {
        icon?.UIImage.color = float4(1.0, 1.0, 1.0, 1.0)
    }
    let outline = statIconOutlineNodes[statIdx]
    if (outline.isAlive) {
        var outlineCol = float4(0.0, 0.0, 0.0, STAT_ICON_OUTLINE_ALPHA)
        if (stat_hover_target(statIdx) > 0.0) {
            outlineCol = stat_hover_outline_color()
        }
        set_image_color(outline, outlineCol)
    }
    let colorFill = statIconColorFillNodes[statIdx]
    if (!colorFill.isAlive) {
        return
    }
    let baseCol = stat_icon_tint_color_for_percent(float(statFillDisplayed[statIdx]))
    let flashCol = statFlashPositive[statIdx] ? STAT_FLASH_POSITIVE_COLOR : STAT_FLASH_NEGATIVE_COLOR
    let flashT = clamp(statFlashT[statIdx], 0.0, 1.0)
    let tintCol = dim_stat_icon_tint_color(lerp(baseCol, flashCol, flashT))
    set_image_color(colorFill, float4(tintCol.x, tintCol.y, tintCol.z, STAT_ICON_TINT_ALPHA + (1.0 - STAT_ICON_TINT_ALPHA) * 0.6 * flashT))
}



def public stat_hover_target(statIdx : int) : float {
    if (dialogPhase != DIALOG_CHOOSING || is_game_paused()) {
        return 0.0
    }
    if (hoveredChoice < 0) {
        return 0.0
    }
    let node = get_current_dialogue_node()
    if (hoveredChoice >= visible_choice_count(node)) {
        return 0.0
    }
    let modified = get_hovered_choice_modified_deltas()
    if (!statUnlocked[statIdx] || modified[statIdx] == 0) {
        return 0.0
    }
    return 1.0
}



def public stat_info_hover_target(statIdx : int) : float {
    if (is_game_paused() || is_in_defeat_flow() || !statUnlocked[statIdx]) {
        return 0.0
    }
    if (hoveredInfoTarget == INFO_HOVER_STAT_BASE + statIdx) {
        return 1.0
    }
    return 0.0
}



def public stat_emphasis_target(statIdx : int) : float {
    let phase = statConfirmPhase[statIdx]
    if (phase == STAT_CONFIRM_FLASH || phase == STAT_CONFIRM_FILL || phase == STAT_CONFIRM_COLOR) {
        return 1.0
    }
    if (phase == STAT_CONFIRM_SHRINK) {
        let t = clamp(statConfirmTimer[statIdx] / STAT_CONFIRM_SHRINK_DURATION, 0.0, 1.0)
        return 1.0 - t
    }
    return stat_info_hover_target(statIdx)
}



def public apply_stat_icon_visual(statIdx : int) {
    let icon = statIconWrapNodes[statIdx]
    if (!icon.isAlive) {
        return
    }
    let emphasis = statEmphasisT[statIdx]
    let scaleT = max(emphasis, statChoiceHoverT[statIdx])
    let revealT = clamp(statUnlockRevealT[statIdx], 0.0, 1.0)
    let revealScale = lerp(0.25, 1.0, revealT * revealT * (3.0 - 2.0 * revealT))
    let scale = lerp(1.0, STAT_EMPHASIS_SCALE, scaleT) * revealScale
    let drop = lerp(0.0, stat_icon_drop_room(), emphasis)
    icon.localScale = float3(scale, scale, 1.0)
    icon?.UIImage.localPosition2D = float2(0.0, -drop)
    let outlineScale = scale * STAT_ICON_OUTLINE_SCALE
    let outline = statIconOutlineNodes[statIdx]
    if (outline.isAlive) {
        outline.localScale = float3(outlineScale, outlineScale, 1.0)
        outline?.UIImage.localPosition2D = float2(0.0, -drop)
    }
    let colorFill = statIconColorFillNodes[statIdx]
    if (colorFill.isAlive) {
        colorFill?.UIImage.localPosition2D = float2(0.0, -drop)
    }
}



def public apply_stat_column_layout(statIdx : int) {
    apply_stat_icon_visual(statIdx)
    layout_stat_bar_fill_value(statIdx, stat_column_fill_value(statIdx))
    statLastAppliedFillValue[statIdx] = stat_column_fill_value(statIdx)
}



def public apply_stat_column_colors(statIdx : int) {
    apply_stat_icon_color(statIdx)
    apply_stat_fill_color(statIdx)
}



def public stat_needs_layout_update(statIdx : int) : bool {
    if (!statUnlocked[statIdx]) {
        return false
    }
    if (statUnlockRevealT[statIdx] < 0.999) {
        return true
    }
    if (abs(statEmphasisT[statIdx] - stat_emphasis_target(statIdx)) > 0.001) {
        return true
    }
    if (abs(statChoiceHoverT[statIdx] - stat_hover_target(statIdx)) > 0.001) {
        return true
    }
    let fillVal = stat_column_fill_value(statIdx)
    if (abs(statLastAppliedFillValue[statIdx] - fillVal) > 0.01) {
        return true
    }
    return false
}



def public stat_needs_color_update(statIdx : int) : bool {
    if (!statUnlocked[statIdx]) {
        return false
    }
    if (stat_needs_layout_update(statIdx)) {
        return true
    }
    if (statConfirmPhase[statIdx] != STAT_CONFIRM_IDLE) {
        return true
    }
    if (statFlashT[statIdx] > 0.001) {
        return true
    }
    if (stat_hover_target(statIdx) > 0.0) {
        return true
    }
    if (stat_info_hover_target(statIdx) > 0.0) {
        return true
    }
    return false
}



def public apply_stat_column_visual(statIdx : int) {
    apply_stat_column_layout(statIdx)
    apply_stat_column_colors(statIdx)
}



def public stat_icon_bar_spacing() : float {
    let barGap = stat_icon_to_bar_gap()
    return max(0.0, barGap - ui_h(STAT_ICON_OFFSET_Y))
}



def public start_stat_confirm_anims_from_deltas(deltas : int[STAT_COUNT]) {
    for (i in range(STAT_COUNT)) {
        if (deltas[i] == 0 || !statUnlocked[i]) {
            continue
        }
        let fromVal = float(kingdomStats[i])
        let toVal = float(clamp_stat(kingdomStats[i] + deltas[i]))
        statFillFrom[i] = fromVal
        statFillTo[i] = toVal
        statFillDisplayed[i] = fromVal
        statFlashPositive[i] = toVal > fromVal
        statFlashT[i] = 1.0
        statConfirmTimer[i] = 0.0
        statConfirmPhase[i] = STAT_CONFIRM_FLASH
    }
    juice_on_stat_deltas(deltas)
}




def public layout_stat_column_positions(statIdx : int; columnH : float; iconSize : float2; barH : float; icon : NodeId; barWrapper : NodeId) {
    let spacing = stat_icon_bar_spacing()
    let barLift = ui_h(STAT_BAR_OFFSET_FROM_BOTTOM)
    let iconTop = columnH - barH - spacing - iconSize.y + ui_h(STAT_ICON_OFFSET_DOWN)
    let outline = statIconOutlineNodes[statIdx]
    if (outline.isAlive) {
        set_frame_size(outline, iconSize)
        outline?.UIImage.size = iconSize
        outline?.UIImage.textureId = stat_outline_texture(statIdx)
        set_anchor_insets(outline, 0.0, iconTop)
        outline.localScale = float3(STAT_ICON_OUTLINE_SCALE, STAT_ICON_OUTLINE_SCALE, 1.0)
    }
    if (icon.isAlive) {
        set_frame_size(icon, iconSize)
        icon?.UIImage.size = iconSize
        set_anchor_insets(icon, 0.0, iconTop)
    }
    if (barWrapper.isAlive) {
        set_anchor_insets(barWrapper, 0.0, -barLift)
    }
}



def public layout_stat_bar_stack(columnW : float; barStack : NodeId) {
    if (!barStack.isAlive) {
        return
    }
    set_frame_pivot(barStack, float2(0.5, 0.0))
    set_frame_pos(barStack, float2(columnW * 0.5, 0.0))
}



def public stat_main_group_width() : float {
    let count = count_unlocked_main_stats()
    if (count <= 0) {
        return 0.0
    }
    let columnSize = stat_column_size()
    let statGap = ui_w(STAT_COLUMN_GAP)
    return columnSize.x * float(count) + statGap * float(count - 1)
}



def public park_stat_bar_node(node : NodeId) {
    if (!node.isAlive || !statColumnHiddenRoot.isAlive) {
        return
    }
    if (node.parent == statBarRoot) {
        node.set_parent(statColumnHiddenRoot, AddChildStrategy.KeepLocalTransform)
    }
    node.isActive = false
    node.localScale = float3(0.0, 0.0, 1.0)
}



def public show_stat_bar_node(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node.isActive = true
    node.localScale = float3(1.0, 1.0, 1.0)
}



def public apply_stat_column_layout(statIdx : int; columnSize : float2; iconSize : float2; columnW : float; barW : float; barH : float) {
    let column = statColumnNodes[statIdx]
    if (!column.isAlive) {
        return
    }
    let icon = statIconWrapNodes[statIdx]
    let barWrapper = get_child(column, 2)
    set_frame_size(column, columnSize)
    if (icon.isAlive) {
        icon?.UIImage.textureId = statTextures[statIdx]
        configure_stat_icon(icon)
        let outline = statIconOutlineNodes[statIdx]
        if (outline.isAlive) {
            configure_stat_icon_outline(outline)
        }
        let colorFill = statIconColorFillNodes[statIdx]
        if (colorFill.isAlive) {
            set_frame_size(colorFill, iconSize)
            configure_stat_icon_color_fill(colorFill)
        }
    }
    if (barWrapper.isAlive) {
        set_frame_size(barWrapper, float2(columnW, barH))
        let barStack = get_child(barWrapper, 0)
        if (barStack.isAlive) {
            set_frame_size(barStack, float2(barW, barH))
            let track = statBarTrackNodes[statIdx]
            if (track.isAlive) {
                set_frame_size(track, float2(barW, barH))
            }
            layout_stat_bar_stack(columnW, barStack)
        }
    }
    layout_stat_column_positions(statIdx, columnSize.y, iconSize, barH, icon, barWrapper)
    apply_stat_column_visual(statIdx)
}



def public apply_stat_bar_layout() {
    if (!statBarRoot.isAlive) {
        return
    }
    let iconSide = stat_icon_side()
    let iconSize = float2(iconSide, iconSide)
    let barW = stat_bar_outer_width()
    let barH = stat_bar_outer_height()
    let columnW = stat_column_width()
    let columnSize = stat_column_size()
    set_spacing(statBarRoot, ui_w(STAT_COLUMN_GAP))
    set_frame_size(statBarRoot, float2(stat_bar_total_width(), columnSize.y))
    for (i in range(STAT_MAIN_COUNT)) {
        let idx = STAT_BAR_DISPLAY_ORDER[i]
        if (statUnlocked[idx]) {
            apply_stat_column_layout(idx, columnSize, iconSize, columnW, barW, barH)
        }
    }
    if (statBarDividerNode.isAlive && statUnlocked[STAT_SUCCESSION_IDX]) {
        set_frame_size(statBarDividerNode, float2(ui_w(STAT_BAR_DIVIDER_WIDTH), ui_h(STAT_BAR_DIVIDER_HEIGHT)))
    }
    if (statUnlocked[STAT_SUCCESSION_IDX]) {
        apply_stat_column_layout(STAT_SUCCESSION_IDX, columnSize, iconSize, columnW, barW, barH)
    }
}



def public create_stat_column(statIdx : int) : NodeId {
    let iconSide = stat_icon_side()
    let iconSize = float2(iconSide, iconSide)
    let barW = stat_bar_outer_width()
    let barH = stat_bar_outer_height()
    let barGap = stat_icon_to_bar_gap()
    let columnW = stat_column_width()
    let columnSize = stat_column_size()

    let column = panel(columnSize, [])
    column.name = "statColumn_{statIdx}"
    set_image_color(column, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(column, float2(0.5, 0.5))

    let iconOutline = panel(iconSize, [])
    iconOutline.name = "statIconOutline_{statIdx}"
    iconOutline?.UIImage.textureId = stat_outline_texture(statIdx)
    configure_stat_icon_outline(iconOutline)
    iconOutline.set_parent(column, AddChildStrategy.KeepLocalTransform)
    add_anchor(iconOutline, float2(0.5, 0.0))
    set_frame_pivot(iconOutline, float2(0.5, 0.0))
    statIconOutlineNodes[statIdx] = iconOutline

    let icon = panel(iconSize, [])
    icon.name = "statIcon_{statIdx}"
    icon?.UIImage.textureId = statTextures[statIdx]
    configure_stat_icon(icon)
    configure_stat_icon_mask(icon)
    icon.set_parent(column, AddChildStrategy.KeepLocalTransform)
    add_anchor(icon, float2(0.5, 0.0))
    set_frame_pivot(icon, float2(0.5, 0.0))

    let iconColorFill = panel(iconSize, [])
    iconColorFill.name = "statIconColorFill_{statIdx}"
    configure_stat_icon_color_fill(iconColorFill)
    set_parent(iconColorFill, icon, AddChildStrategy.KeepLocalTransform)
    add_anchor(iconColorFill, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    statIconColorFillNodes[statIdx] = iconColorFill

    let barTrack = panel(float2(barW, barH), [])
    barTrack.name = "statBarTrack_{statIdx}"
    barTrack?.UIImage.textureId = statBarTrackTexture
    set_image_color(barTrack, STAT_BAR_TRACK_COLOR)
    set_frame_pivot(barTrack, float2(0.0, 0.0))
    statBarTrackNodes[statIdx] = barTrack

    let barFill = panel(float2(barW * 0.5, barH), [])
    barFill.name = "statBarFill_{statIdx}"
    barFill?.UIImage.textureId = statBarFillTexture
    set_image_color(barFill, stat_fill_color_for_percent(float(kingdomStats[statIdx])))
    set_frame_pivot(barFill, float2(0.0, 0.0))
    statBarFillNodes[statIdx] = barFill

    let barStack = panel(float2(barW, barH), [barTrack, barFill])
    barStack.name = "statBarStack_{statIdx}"
    set_image_color(barStack, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(barStack, float2(0.0, 0.0))

    let barWrapper = panel(float2(columnW, barH), [barStack])
    barWrapper.name = "statBarWrapper_{statIdx}"
    set_image_color(barWrapper, float4(0.0, 0.0, 0.0, 0.0))
    layout_stat_bar_stack(columnW, barStack)

    barWrapper.set_parent(column, AddChildStrategy.KeepLocalTransform)
    add_anchor(barWrapper, float2(0.5, 1.0))
    set_frame_pivot(barWrapper, float2(0.5, 1.0))
    layout_stat_column_positions(statIdx, columnSize.y, iconSize, barH, icon, barWrapper)

    statColumnNodes[statIdx] = column
    statIconWrapNodes[statIdx] = icon
    statFillDisplayed[statIdx] = float(kingdomStats[statIdx])
    configure_info_hover_target(column)
    return column
}



def public build_character() {
    let charSize = character_size()
    characterRestOffsetX = compute_character_rest_offset_x()

    characterRoot = panel(charSize, [])
    characterRoot.name = "characterRoot"
    set_image_color(characterRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(characterRoot, zoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterRoot, float2(0.5, 1.0))
    set_frame_pivot(characterRoot, float2(0.5, 1.0))
    set_frame_pos(characterRoot, float2(0.0, 0.0))
    set_character_offset(characterRestOffsetX)
    add_component(characterRoot, new CharacterSlide())
    add_component(characterRoot, new CharacterHover())

    characterImageNode = panel(charSize, [])
    characterImageNode.name = "characterImageNode"
    characterImageNode?.UIImage.textureId = characterTexture
    characterImageNode?.UIImage.size = charSize
    characterImageNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(characterImageNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(characterImageNode, characterRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterImageNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    apply_character_image_top_clip(characterImageNode)

    characterSilhouetteOverlay = panel(charSize, [])
    characterSilhouetteOverlay.name = "characterSilhouetteOverlay"
    characterSilhouetteOverlay?.UIImage.textureId = characterTexture
    characterSilhouetteOverlay?.UIImage.size = charSize
    characterSilhouetteOverlay?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(characterSilhouetteOverlay, float4(0.0, 0.0, 0.0, 1.0))
    set_parent(characterSilhouetteOverlay, characterRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterSilhouetteOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    apply_character_image_top_clip(characterSilhouetteOverlay)
    characterSilhouetteOverlay.isActive = false
}



def public build_incoming_visitor() {
    let charSize = character_size()
    incomingVisitorRoot = panel(charSize, [])
    incomingVisitorRoot.name = "incomingVisitorRoot"
    set_image_color(incomingVisitorRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(incomingVisitorRoot, zoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(incomingVisitorRoot, float2(0.5, 1.0))
    set_frame_pivot(incomingVisitorRoot, float2(0.5, 1.0))
    set_frame_pos(incomingVisitorRoot, float2(0.0, 0.0))
    incomingVisitorRoot.isActive = false

    incomingVisitorImageNode = panel(charSize, [])
    incomingVisitorImageNode.name = "incomingVisitorImageNode"
    incomingVisitorImageNode?.UIImage.textureId = characterTexture
    incomingVisitorImageNode?.UIImage.size = charSize
    incomingVisitorImageNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(incomingVisitorImageNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(incomingVisitorImageNode, incomingVisitorRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(incomingVisitorImageNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    apply_character_image_top_clip(incomingVisitorImageNode)

    incomingVisitorSilhouetteNode = panel(charSize, [])
    incomingVisitorSilhouetteNode.name = "incomingVisitorSilhouetteNode"
    incomingVisitorSilhouetteNode?.UIImage.textureId = characterTexture
    incomingVisitorSilhouetteNode?.UIImage.size = charSize
    incomingVisitorSilhouetteNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(incomingVisitorSilhouetteNode, float4(0.0, 0.0, 0.0, 1.0))
    set_parent(incomingVisitorSilhouetteNode, incomingVisitorRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(incomingVisitorSilhouetteNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    apply_character_image_top_clip(incomingVisitorSilhouetteNode)
    incomingVisitorSilhouetteNode.isActive = false
}



def public layout_info_tooltip_section_node(node : NodeId; textW : float; sectionTopGap : float = 0.0) {
    if (!node.isAlive || !node.isActive) {
        return
    }
    set_text_font_size(node, ui_h(INFO_TOOLTIP_FONT_SIZE))
    set_frame_width(node, textW)
    let text = node?.UIText.text
    let textH = measure_profile_text_block_height(node, text, textW, INFO_TOOLTIP_FONT_SIZE)
    if (sectionTopGap > 0.0 && textH > 0.0) {
        set_frame_size(node, float2(textW, textH + sectionTopGap))
        node?.UIText.localPosition2D = float2(0.0, sectionTopGap)
    } else {
        node?.UIText.localPosition2D = float2(0.0, 0.0)
    }
}



def public compute_info_tooltip_content_height(textW : float) : float {
    let pad = ui_h(INFO_TOOLTIP_PADDING)
    let sectionGap = ui_h(INFO_TOOLTIP_SECTION_GAP)
    layout_info_tooltip_section_node(infoTooltipTitleNode, textW)
    layout_info_tooltip_section_node(infoTooltipBodyNode, textW)
    layout_info_tooltip_section_node(infoTooltipInfluenceHeaderNode, textW, sectionGap)
    layout_info_tooltip_section_node(infoTooltipInfluenceBuffNode, textW)
    layout_info_tooltip_section_node(infoTooltipInfluenceDebuffNode, textW)
    layout_info_tooltip_section_node(infoTooltipActiveHeaderNode, textW, sectionGap)
    layout_info_tooltip_section_node(infoTooltipActiveBuffNode, textW)
    layout_info_tooltip_section_node(infoTooltipActiveDebuffNode, textW)
    var textH = 0.0
    textH += info_tooltip_section_height(infoTooltipTitleNode, textW)
    textH += info_tooltip_section_height(infoTooltipBodyNode, textW)
    textH += info_tooltip_section_height(infoTooltipInfluenceHeaderNode, textW, sectionGap)
    textH += info_tooltip_section_height(infoTooltipInfluenceBuffNode, textW)
    textH += info_tooltip_section_height(infoTooltipInfluenceDebuffNode, textW)
    textH += info_tooltip_section_height(infoTooltipActiveHeaderNode, textW, sectionGap)
    textH += info_tooltip_section_height(infoTooltipActiveBuffNode, textW)
    textH += info_tooltip_section_height(infoTooltipActiveDebuffNode, textW)
    return 2.0 * pad + textH
}



def public apply_info_tooltip_layout() {
    if (!infoTooltipBoxNode.isAlive || !infoTooltipContentNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let pad = ui_h(INFO_TOOLTIP_PADDING)
    let innerW = ui_w(INFO_TOOLTIP_WIDTH) - 2.0 * border
    let textW = innerW - 2.0 * pad
    let contentH = compute_info_tooltip_content_height(textW)
    set_padding(infoTooltipContentNode, float4(pad, pad, pad, pad))
    set_spacing(infoTooltipContentNode, 0.0)
    set_alignment(infoTooltipContentNode, LayoutAlignment.TopLeft)
    set_frame_pos(infoTooltipContentNode, float2(0.0, 0.0))
    set_frame_pivot(infoTooltipContentNode, float2(0.0, 0.0))
    set_frame_size(infoTooltipContentNode, float2(innerW, contentH))
    infoTooltipContentNode?.UIVerticalLayout.childForceExpandWidth = false
    infoTooltipContentNode?.UIVerticalLayout.childForceExpandHeight = false
    set_alignment(infoTooltipBoxNode, LayoutAlignment.TopLeft)
    set_frame_pos(infoTooltipBoxNode, float2(border, border))
    set_frame_pivot(infoTooltipBoxNode, float2(0.0, 0.0))
    set_frame_size(infoTooltipBoxNode, float2(innerW, contentH))
    set_alignment(infoTooltipRoot, LayoutAlignment.TopLeft)
    set_frame_size(infoTooltipRoot, float2(ui_w(INFO_TOOLTIP_WIDTH), contentH + 2.0 * border))
}



def public build_info_tooltip_section_node(textW : float; color : float4) : NodeId {
    let node = text("")
    node.name = "infoTooltipSection"
    set_text_font_size(node, ui_h(INFO_TOOLTIP_FONT_SIZE))
    configure_info_tooltip_section_node(node, textW, color)
    apply_dialogue_font(node)
    return node
}



def public build_info_tooltip_ui() {
    let border = ui_box_border()
    let pad = ui_h(INFO_TOOLTIP_PADDING)
    let innerW = ui_w(INFO_TOOLTIP_WIDTH) - 2.0 * border
    let textW = innerW - 2.0 * pad

    infoTooltipTitleNode = build_info_tooltip_section_node(textW, INFO_TOOLTIP_TITLE_COLOR)
    infoTooltipTitleNode.name = "infoTooltipTitleNode"
    infoTooltipBodyNode = build_info_tooltip_section_node(textW, INFO_TOOLTIP_BODY_COLOR)
    infoTooltipBodyNode.name = "infoTooltipBodyNode"
    infoTooltipInfluenceHeaderNode = build_info_tooltip_section_node(textW, INFO_TOOLTIP_INFLUENCE_HEADER_COLOR)
    infoTooltipInfluenceHeaderNode.name = "infoTooltipInfluenceHeaderNode"
    infoTooltipInfluenceBuffNode = build_info_tooltip_section_node(textW, STAT_FLASH_POSITIVE_COLOR)
    infoTooltipInfluenceBuffNode.name = "infoTooltipInfluenceBuffNode"
    infoTooltipInfluenceDebuffNode = build_info_tooltip_section_node(textW, STAT_FLASH_NEGATIVE_COLOR)
    infoTooltipInfluenceDebuffNode.name = "infoTooltipInfluenceDebuffNode"
    infoTooltipActiveHeaderNode = build_info_tooltip_section_node(textW, INFO_TOOLTIP_INFLUENCE_HEADER_COLOR)
    infoTooltipActiveHeaderNode.name = "infoTooltipActiveHeaderNode"
    infoTooltipActiveBuffNode = build_info_tooltip_section_node(textW, STAT_FLASH_POSITIVE_COLOR)
    infoTooltipActiveBuffNode.name = "infoTooltipActiveBuffNode"
    infoTooltipActiveDebuffNode = build_info_tooltip_section_node(textW, STAT_FLASH_NEGATIVE_COLOR)
    infoTooltipActiveDebuffNode.name = "infoTooltipActiveDebuffNode"

    infoTooltipContentNode = vbox([
        infoTooltipTitleNode,
        infoTooltipBodyNode,
        infoTooltipInfluenceHeaderNode,
        infoTooltipInfluenceBuffNode,
        infoTooltipInfluenceDebuffNode,
        infoTooltipActiveHeaderNode,
        infoTooltipActiveBuffNode,
        infoTooltipActiveDebuffNode
    ])
    infoTooltipContentNode.name = "infoTooltipContentNode"
    set_spacing(infoTooltipContentNode, 0.0)
    set_alignment(infoTooltipContentNode, LayoutAlignment.TopLeft)
    set_padding(infoTooltipContentNode, float4(pad, pad, pad, pad))
    set_frame_pivot(infoTooltipContentNode, float2(0.0, 0.0))
    infoTooltipContentNode?.UIVerticalLayout.childForceExpandWidth = false
    infoTooltipContentNode?.UIVerticalLayout.childForceExpandHeight = false

    infoTooltipBoxNode = panel(float2(innerW, ui_h(80.0)), [infoTooltipContentNode])
    infoTooltipBoxNode.name = "infoTooltipBoxNode"
    set_image_color(infoTooltipBoxNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(infoTooltipBoxNode, LayoutAlignment.TopLeft)
    set_frame_pivot(infoTooltipBoxNode, float2(0.0, 0.0))

    infoTooltipRoot = panel(float2(ui_w(INFO_TOOLTIP_WIDTH), ui_h(84.0)), [infoTooltipBoxNode])
    infoTooltipRoot.name = "infoTooltipRoot"
    set_image_color(infoTooltipRoot, UI_BOX_BORDER_COLOR)
    set_alignment(infoTooltipRoot, LayoutAlignment.TopLeft)
    set_frame_pos(infoTooltipBoxNode, float2(border, border))
    set_frame_pivot(infoTooltipRoot, float2(0.5, 0.0))
    set_parent(infoTooltipRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    infoTooltipRoot.isActive = false
    hide_stat_synergy_tooltip_sections()
}



def public configure_profile_body_text(node : NodeId) {
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(node, float2(0.0, 0.0))
}



def public configure_profile_title_text(node : NodeId) {
    apply_ui_font(node)
    configure_profile_body_text(node)
}



def public build_character_profile_ui() {
    let border = ui_box_border()
    let panelW = ui_w(CHARACTER_PROFILE_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    let portraitW = profile_portrait_width()
    let portraitH = profile_portrait_height()
    let portraitFrameW = profile_portrait_frame_width()
    let portraitFrameH = profile_portrait_frame_height()
    let btnH = ui_h(CHARACTER_PROFILE_BUTTON_HEIGHT)

    characterProfilePortraitNode = panel(float2(portraitW, portraitH), [])
    characterProfilePortraitNode.name = "characterProfilePortraitNode"
    characterProfilePortraitNode?.UIImage.textureId = portraitTextures[0]
    characterProfilePortraitNode?.UIImage.size = float2(portraitW, portraitH)
    characterProfilePortraitNode?.UIImage.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    set_image_color(characterProfilePortraitNode, float4(1.0, 1.0, 1.0, 1.0))
    set_frame_pivot(characterProfilePortraitNode, float2(0.0, 0.0))

    characterProfilePortraitInsetNode = panel(float2(portraitFrameW, portraitFrameH), [characterProfilePortraitNode])
    characterProfilePortraitInsetNode.name = "characterProfilePortraitInsetNode"
    set_image_color(characterProfilePortraitInsetNode, CHARACTER_PROFILE_PORTRAIT_INSET_COLOR)
    set_alignment(characterProfilePortraitInsetNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfilePortraitInsetNode, float2(0.0, 0.0))

    characterProfilePortraitFrameNode = panel(float2(portraitFrameW, portraitFrameH), [characterProfilePortraitInsetNode])
    characterProfilePortraitFrameNode.name = "characterProfilePortraitFrameNode"
    set_image_color(characterProfilePortraitFrameNode, CHARACTER_PROFILE_PORTRAIT_BORDER_COLOR)
    set_alignment(characterProfilePortraitFrameNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfilePortraitFrameNode, float2(0.0, 0.0))
    apply_profile_portrait_layout(portraitW, portraitH)

    characterProfileTitleNode = text("")
    characterProfileTitleNode.name = "characterProfileTitleNode"
    set_text_font_size(characterProfileTitleNode, ui_h(CHARACTER_PROFILE_TITLE_FONT_SIZE))
    set_text_color(characterProfileTitleNode, CHARACTER_PROFILE_TITLE_COLOR)
    configure_profile_title_text(characterProfileTitleNode)

    characterProfileDescBesideNode = text("")
    characterProfileDescBesideNode.name = "characterProfileDescBesideNode"
    set_text_font_size(characterProfileDescBesideNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))
    set_text_color(characterProfileDescBesideNode, CHARACTER_PROFILE_BODY_COLOR)
    configure_profile_body_text(characterProfileDescBesideNode)
    apply_dialogue_font(characterProfileDescBesideNode)

    characterProfileDescBelowNode = text("")
    characterProfileDescBelowNode.name = "characterProfileDescBelowNode"
    set_text_font_size(characterProfileDescBelowNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))
    set_text_color(characterProfileDescBelowNode, CHARACTER_PROFILE_BODY_COLOR)
    configure_profile_body_text(characterProfileDescBelowNode)
    apply_dialogue_font(characterProfileDescBelowNode)

    characterProfileTextColumnNode = vbox([characterProfileTitleNode, characterProfileDescBesideNode])
    characterProfileTextColumnNode.name = "characterProfileTextColumnNode"
    set_spacing(characterProfileTextColumnNode, ui_h(CHARACTER_PROFILE_SPACING))
    set_alignment(characterProfileTextColumnNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileTextColumnNode, float2(0.0, 0.0))
    characterProfileTextColumnNode?.UIVerticalLayout.childForceExpandWidth = true
    characterProfileTextColumnNode?.UIVerticalLayout.childForceExpandHeight = false

    characterProfileHeaderNode = hbox([characterProfilePortraitFrameNode, characterProfileTextColumnNode])
    characterProfileHeaderNode.name = "characterProfileHeaderNode"
    set_spacing(characterProfileHeaderNode, ui_w(CHARACTER_PROFILE_HEADER_GAP))
    set_alignment(characterProfileHeaderNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileHeaderNode, float2(0.0, 0.0))
    characterProfileHeaderNode?.UIHorizontalLayout.childForceExpandWidth = false
    characterProfileHeaderNode?.UIHorizontalLayout.childForceExpandHeight = false

    characterProfileLikesNode = text("")
    characterProfileLikesNode.name = "characterProfileLikesNode"
    set_text_font_size(characterProfileLikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))
    set_text_color(characterProfileLikesNode, float4(0.55, 0.88, 0.45, 1.0))
    configure_profile_body_text(characterProfileLikesNode)
    apply_dialogue_font(characterProfileLikesNode)

    characterProfileDislikesNode = text("")
    characterProfileDislikesNode.name = "characterProfileDislikesNode"
    set_text_font_size(characterProfileDislikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))
    set_text_color(characterProfileDislikesNode, float4(0.92, 0.45, 0.38, 1.0))
    configure_profile_body_text(characterProfileDislikesNode)
    apply_dialogue_font(characterProfileDislikesNode)

    characterProfileDividerNode = panel(float2(innerW, ui_h(CHARACTER_PROFILE_DIVIDER_HEIGHT)), [])
    characterProfileDividerNode.name = "characterProfileDividerNode"
    set_image_color(characterProfileDividerNode, CHARACTER_PROFILE_DIVIDER_COLOR)
    set_alignment(characterProfileDividerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileDividerNode, float2(0.0, 0.0))

    let okayBtnW = compute_profile_okay_button_outer_width()
    characterProfileOkayButtonNode = create_pause_menu_button(menu_okay(), true, okayBtnW, btnH, false)
    characterProfileOkayButtonNode.name = "characterProfileOkayButtonNode"

    characterProfileOkayRowNode = hbox([characterProfileOkayButtonNode])
    characterProfileOkayRowNode.name = "characterProfileOkayRowNode"
    set_alignment(characterProfileOkayRowNode, LayoutAlignment.MiddleCenter)
    set_frame_pivot(characterProfileOkayRowNode, float2(0.0, 0.0))
    characterProfileOkayRowNode?.UIHorizontalLayout.childForceExpandWidth = false
    characterProfileOkayRowNode?.UIHorizontalLayout.childForceExpandHeight = false

    characterProfileContentNode = vbox([
        characterProfileHeaderNode,
        characterProfileDescBelowNode,
        characterProfileDividerNode,
        characterProfileLikesNode,
        characterProfileDislikesNode,
        characterProfileOkayRowNode
    ])
    characterProfileContentNode.name = "characterProfileContentNode"
    set_spacing(characterProfileContentNode, ui_h(CHARACTER_PROFILE_SPACING))
    set_alignment(characterProfileContentNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileContentNode, float2(0.0, 0.0))
    characterProfileContentNode?.UIVerticalLayout.childForceExpandWidth = true
    characterProfileContentNode?.UIVerticalLayout.childForceExpandHeight = false

    let pad = ui_h(CHARACTER_PROFILE_PADDING)
    let bodyH = compute_character_profile_body_height(innerW)
    let contentH = bodyH + 2.0 * pad
    set_padding(characterProfileContentNode, float4(pad, pad, pad, pad))
    set_frame_size(characterProfileContentNode, float2(innerW, contentH))
    characterProfileInnerNode = panel(float2(innerW, contentH), [characterProfileContentNode])
    characterProfileInnerNode.name = "characterProfileInnerNode"
    set_image_color(characterProfileInnerNode, CHARACTER_PROFILE_INNER_BG_COLOR)
    set_alignment(characterProfileInnerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileInnerNode, float2(0.0, 0.0))
    set_frame_pos(characterProfileInnerNode, float2(border, border))

    characterProfilePanelNode = panel(float2(panelW, contentH + 2.0 * border), [characterProfileInnerNode])
    characterProfilePanelNode.name = "characterProfilePanelNode"
    set_image_color(characterProfilePanelNode, CHARACTER_PROFILE_BORDER_COLOR)
    set_alignment(characterProfilePanelNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfilePanelNode, float2(0.0, 0.0))
    add_component(characterProfilePanelNode, new UIButton())
    set_parent(characterProfilePanelNode, characterProfileOverlay, AddChildStrategy.KeepLocalTransform)
    characterProfileSlideX = character_profile_panel_slide_hidden_left_x()
    set_character_profile_slide_x(characterProfileSlideX)
    characterProfilePanelNode.isActive = false
}



def public build_main_menu_ui() {
    let res = float2(get_resolution())
    let barH = ui_h(MAIN_MENU_BOTTOM_BAR_HEIGHT)
    let btnH = ui_h(MAIN_MENU_BUTTON_HEIGHT)
    let btnW = main_menu_button_width()
    let btnSpacing = ui_w(MAIN_MENU_BUTTON_SPACING)
    let rowH = menu_button_outer_height(btnH)

    mainMenuRoot = panel(res, [])
    mainMenuRoot.name = "mainMenuRoot"
    set_image_color(mainMenuRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(mainMenuRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuRoot, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_frame_pivot(mainMenuRoot, float2(0.5, 0.5))

    mainMenuBackgroundZoomRoot = panel(res, [])
    mainMenuBackgroundZoomRoot.name = "mainMenuBackgroundZoomRoot"
    set_image_color(mainMenuBackgroundZoomRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(mainMenuBackgroundZoomRoot, mainMenuRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuBackgroundZoomRoot, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_frame_pivot(mainMenuBackgroundZoomRoot, float2(0.5, 0.5))

    mainMenuBackgroundNode = panel(res, [])
    mainMenuBackgroundNode.name = "mainMenuBackgroundNode"
    mainMenuBackgroundNode?.UIImage.textureId = mainMenuBackgroundTexture
    set_image_color(mainMenuBackgroundNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(mainMenuBackgroundNode, mainMenuBackgroundZoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuBackgroundNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    juice_create_room_vignette(mainMenuBackgroundZoomRoot)
    juice_create_ambient_layer(mainMenuBackgroundZoomRoot, "juiceMenuFireLayer", JUICE_AMBIENT_MENU)

    mainMenuBottomBarRoot = panel(float2(res.x, barH), [])
    mainMenuBottomBarRoot.name = "mainMenuBottomBarRoot"
    set_image_color(mainMenuBottomBarRoot, TOP_BAR_BG_COLOR)
    set_parent(mainMenuBottomBarRoot, mainMenuRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuBottomBarRoot, float2(0.0, 1.0), float2(1.0, 1.0))
    set_frame_pivot(mainMenuBottomBarRoot, float2(0.5, 1.0))

    mainMenuBottomBarBorderNode = panel(float2(res.x, ui_box_border()), [])
    mainMenuBottomBarBorderNode.name = "mainMenuBottomBarBorderNode"
    set_image_color(mainMenuBottomBarBorderNode, UI_BOX_BORDER_COLOR)
    set_parent(mainMenuBottomBarBorderNode, mainMenuBottomBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuBottomBarBorderNode, float2(0.0, 0.0), float2(1.0, 0.0))
    set_frame_pivot(mainMenuBottomBarBorderNode, float2(0.5, 0.0))

    mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX] = create_pause_menu_button(menu_continue(), hasSaveGame, btnW, btnH)
    mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX].name = "mainMenuButton_continue"
    mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX] = create_pause_menu_button(menu_new_game(), true, btnW, btnH)
    mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX].name = "mainMenuButton_newGame"
    mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX] = create_pause_menu_button(menu_options(), true, btnW, btnH)
    mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX].name = "mainMenuButton_options"
    mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX] = create_pause_menu_button(menu_about(), true, btnW, btnH)
    mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX].name = "mainMenuButton_about"
    mainMenuButtonNodes[MAIN_MENU_EXIT_IDX] = create_pause_menu_button(menu_exit(), false, btnW, btnH)
    mainMenuButtonNodes[MAIN_MENU_EXIT_IDX].name = "mainMenuButton_exit"
    for (i in range(MAIN_MENU_BUTTON_COUNT)) {
        setup_main_menu_button_decoration(mainMenuButtonNodes[i], i)
    }

    let rowW = btnW * float(MAIN_MENU_BUTTON_COUNT) + btnSpacing * float(MAIN_MENU_BUTTON_COUNT - 1)
    mainMenuButtonsRowNode = hbox([
        mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX],
        mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX],
        mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX],
        mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX],
        mainMenuButtonNodes[MAIN_MENU_EXIT_IDX]
    ])
    mainMenuButtonsRowNode.name = "mainMenuButtonsRowNode"
    set_spacing(mainMenuButtonsRowNode, btnSpacing)
    set_alignment(mainMenuButtonsRowNode, LayoutAlignment.MiddleCenter)
    set_frame_size(mainMenuButtonsRowNode, float2(rowW, rowH))
    set_frame_pivot(mainMenuButtonsRowNode, float2(0.5, 0.5))
    set_parent(mainMenuButtonsRowNode, mainMenuBottomBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(mainMenuButtonsRowNode, float2(0.5, 0.5))
}



def public build_ui() {
    let res = float2(get_resolution())
    if (!uiCanvas.isAlive) {
        uiCanvas = canvas(res)
        uiCanvas.name = "uiCanvas"
    } else {
        set_frame_size(uiCanvas, res)
        uiCanvas.name = "uiCanvas"
    }

    zoomRoot = panel(res, [])
    zoomRoot.name = "zoomRoot"
    set_parent(zoomRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(zoomRoot, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_frame_pivot(zoomRoot, float2(0.5, 0.5))

    backgroundNode = panel(res, [])
    backgroundNode.name = "backgroundNode"
    backgroundNode?.UIImage.textureId = backgroundTexture
    set_image_color(backgroundNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(backgroundNode, zoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(backgroundNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    juice_create_room_vignette(zoomRoot)
    juice_create_ambient_layer(zoomRoot, "juiceHallLayer", JUICE_AMBIENT_HALL)

    build_character()
    build_incoming_visitor()
    build_dialogue_ui()

    topBarRoot = panel(float2(res.x, ui_h(TOP_BAR_HEIGHT)), [])
    topBarRoot.name = "topBarRoot"
    set_image_color(topBarRoot, TOP_BAR_BG_COLOR)
    set_parent(topBarRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(topBarRoot, float2(0.0, 0.0), float2(1.0, 0.0))
    set_frame_pivot(topBarRoot, float2(0.5, 0.0))

    bottomBarRoot = panel(float2(res.x, ui_h(BOTTOM_BAR_HEIGHT)), [])
    bottomBarRoot.name = "bottomBarRoot"
    set_image_color(bottomBarRoot, TOP_BAR_BG_COLOR)
    set_parent(bottomBarRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(bottomBarRoot, float2(0.0, 1.0), float2(1.0, 1.0))
    set_frame_pivot(bottomBarRoot, float2(0.5, 1.0))

    statColumnHiddenRoot = panel(float2(0.0, 0.0), [])
    statColumnHiddenRoot.name = "statColumnHiddenRoot"
    set_image_color(statColumnHiddenRoot, float4(0.0, 0.0, 0.0, 0.0))
    statColumnHiddenRoot.isActive = false
    set_parent(statColumnHiddenRoot, bottomBarRoot, AddChildStrategy.KeepLocalTransform)

    for (i in range(STAT_COUNT)) {
        create_stat_column(i)
        let column = statColumnNodes[i]
        if (column.isAlive) {
            column.set_parent(statColumnHiddenRoot, AddChildStrategy.KeepLocalTransform)
            column.isActive = false
            column.localScale = float3(0.0, 0.0, 1.0)
        }
    }
    statBarDividerNode = panel(float2(ui_w(STAT_BAR_DIVIDER_WIDTH), ui_h(STAT_BAR_DIVIDER_HEIGHT)), [])
    statBarDividerNode.name = "statBarDividerNode"
    set_image_color(statBarDividerNode, STAT_BAR_DIVIDER_COLOR)
    statBarDividerNode.isActive = false
    set_parent(statBarDividerNode, statColumnHiddenRoot, AddChildStrategy.KeepLocalTransform)

    statPlateNode = panel(float2(1.0, 1.0), [])
    statPlateNode.name = "statPlateNode"
    theme_set_image(statPlateNode, THEME_TEX_PILL, float4(0.03, 0.02, 0.015, 0.42), THEME_PILL_GRID)
    set_parent(statPlateNode, bottomBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(statPlateNode, float2(0.5, 0.5))
    set_frame_pivot(statPlateNode, float2(0.5, 0.5))

    let columnSize = stat_column_size()
    statBarRoot = hbox([])
    statBarRoot.name = "statBarRoot"
    set_spacing(statBarRoot, ui_w(STAT_COLUMN_GAP))
    set_alignment(statBarRoot, LayoutAlignment.MiddleCenter)
    set_frame_size(statBarRoot, float2(stat_bar_total_width(), columnSize.y))
    set_parent(statBarRoot, bottomBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(statBarRoot, float2(0.5, 0.5))
    set_frame_pivot(statBarRoot, float2(0.5, 0.5))
    reset_stat_unlocks()
    sync_stat_bar_children()

    bottomBarBorderNode = panel(float2(res.x, ui_box_border()), [])
    bottomBarBorderNode.name = "bottomBarBorderNode"
    set_image_color(bottomBarBorderNode, UI_BOX_BORDER_COLOR)
    set_parent(bottomBarBorderNode, bottomBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(bottomBarBorderNode, float2(0.0, 0.0), float2(1.0, 0.0))
    set_frame_pivot(bottomBarBorderNode, float2(0.5, 0.0))

    advisorButtonNode = create_menu_button(advisor_bar_button(), ui_w(BOTTOM_BAR_ADVISOR_BUTTON_WIDTH), ui_h(BOTTOM_BAR_ADVISOR_BUTTON_HEIGHT), true, BOTTOM_BAR_ADVISOR_BUTTON_FONT_SIZE)
    advisorButtonNode.name = "advisorButtonNode"
    set_parent(advisorButtonNode, bottomBarRoot, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(advisorButtonNode, float2(1.0, 0.5))
    set_frame_pos(advisorButtonNode, float2(-ui_w(BOTTOM_BAR_ADVISOR_MARGIN), 0.0))
    add_anchor(advisorButtonNode, float2(1.0, 0.5))
    set_anchor_insets(advisorButtonNode, -ui_w(BOTTOM_BAR_ADVISOR_MARGIN), 0.0)

    dayTextNode = text(day_label(1))
    dayTextNode.name = "dayTextNode"
    set_text_font_size(dayTextNode, ui_h(DAY_FONT_SIZE))
    set_text_color(dayTextNode, float4(1.0, 1.0, 1.0, 1.0))
    apply_ui_font(dayTextNode)
    configure_single_line_text(dayTextNode)
    configure_info_hover_target(dayTextNode)

    nicknameTextNode = text(default_nickname())
    nicknameTextNode.name = "nicknameTextNode"
    set_text_font_size(nicknameTextNode, ui_h(NICKNAME_FONT_SIZE))
    set_text_color(nicknameTextNode, float4(0.85, 0.78, 0.65, 1.0))
    apply_ui_font(nicknameTextNode)
    configure_single_line_text(nicknameTextNode)
    configure_info_hover_target(nicknameTextNode)

    topBarLeftInfoNode = hbox([dayTextNode, nicknameTextNode])
    topBarLeftInfoNode.name = "topBarLeftInfoNode"
    set_spacing(topBarLeftInfoNode, ui_w(TOP_BAR_LEFT_INFO_SPACING))
    set_alignment(topBarLeftInfoNode, LayoutAlignment.MiddleLeft)
    set_frame_size(topBarLeftInfoNode, float2(ui_w(TOP_BAR_LEFT_INFO_WIDTH), ui_h(TOP_BAR_HEIGHT)))
    set_parent(topBarLeftInfoNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(topBarLeftInfoNode, float2(0.0, 0.5))
    set_frame_pos(topBarLeftInfoNode, float2(ui_w(TOP_BAR_HORIZONTAL_PADDING), 0.0))
    add_anchor(topBarLeftInfoNode, float2(0.0, 0.5))
    set_anchor_insets(topBarLeftInfoNode, ui_w(TOP_BAR_HORIZONTAL_PADDING), 0.0)

    menuButtonNode = create_menu_button(menu_pause(), ui_w(TOP_BAR_PAUSE_BUTTON_WIDTH), ui_h(TOP_BAR_PAUSE_BUTTON_HEIGHT), true, TOP_BAR_PAUSE_BUTTON_FONT_SIZE)
    menuButtonNode.name = "menuButtonNode"
    set_parent(menuButtonNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(menuButtonNode, float2(1.0, 0.5))
    set_frame_pos(menuButtonNode, float2(-ui_w(TOP_BAR_PAUSE_MARGIN), 0.0))
    add_anchor(menuButtonNode, float2(1.0, 0.5))
    set_anchor_insets(menuButtonNode, -ui_w(TOP_BAR_PAUSE_MARGIN), 0.0)

    topBarBorderNode = panel(float2(res.x, ui_box_border()), [])
    topBarBorderNode.name = "topBarBorderNode"
    set_image_color(topBarBorderNode, UI_BOX_BORDER_COLOR)
    set_parent(topBarBorderNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(topBarBorderNode, float2(0.0, 1.0), float2(1.0, 1.0))
    set_frame_pivot(topBarBorderNode, float2(0.5, 1.0))

    build_top_info()
    build_advisor_hud_icon()

    menuOverlay = panel(res, [])
    menuOverlay.name = "menuOverlay"
    set_parent(menuOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(menuOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_image_color(menuOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    add_component(menuOverlay, new UIButton())
    menuOverlay.isActive = false

    let menuBorder = ui_box_border()
    let menuPad = ui_h(MENU_PANEL_PADDING)
    let panelW = ui_w(MENU_PANEL_WIDTH)
    let innerW = panelW - 2.0 * menuBorder
    let btnH = ui_h(MENU_PANEL_BUTTON_HEIGHT)
    let btnSpacing = ui_h(MENU_PANEL_BUTTON_SPACING)
    let buttonW = innerW - 2.0 * menuPad
    let btnOuterH = menu_button_outer_height(btnH)
    let contentH = btnOuterH * 3.0 + btnSpacing * 2.0 + menuPad * 2.0

    menuContinueButtonNode = create_pause_menu_button(menu_continue(), true, buttonW, btnH)
    menuContinueButtonNode.name = "menuContinueButtonNode"
    menuOptionsButtonNode = create_pause_menu_button(menu_options(), true, buttonW, btnH)
    menuOptionsButtonNode.name = "menuOptionsButtonNode"
    menuExitButtonNode = create_pause_menu_button(menu_exit(), true, buttonW, btnH)
    menuExitButtonNode.name = "menuExitButtonNode"
    menuPanelContentNode = vbox([menuContinueButtonNode, menuOptionsButtonNode, menuExitButtonNode])
    menuPanelContentNode.name = "menuPanelContentNode"
    set_spacing(menuPanelContentNode, btnSpacing)
    set_alignment(menuPanelContentNode, LayoutAlignment.MiddleCenter)
    set_padding(menuPanelContentNode, float4(menuPad, menuPad, menuPad, menuPad))
    set_frame_pivot(menuPanelContentNode, float2(0.0, 0.0))
    set_frame_size(menuPanelContentNode, float2(innerW, contentH))
    menuPanelContentNode?.UIVerticalLayout.childForceExpandWidth = true
    menuPanelContentNode?.UIVerticalLayout.childForceExpandHeight = false

    menuPanelInnerNode = panel(float2(innerW, contentH), [menuPanelContentNode])
    menuPanelInnerNode.name = "menuPanelInnerNode"
    set_image_color(menuPanelInnerNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(menuPanelInnerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(menuPanelInnerNode, float2(0.0, 0.0))

    menuPanelNode = panel(float2(panelW, contentH + 2.0 * menuBorder), [menuPanelInnerNode])
    menuPanelNode.name = "menuPanelNode"
    set_image_color(menuPanelNode, UI_BOX_BORDER_COLOR)
    set_alignment(menuPanelNode, LayoutAlignment.TopLeft)
    set_frame_pos(menuPanelInnerNode, float2(menuBorder, menuBorder))
    set_frame_pivot(menuPanelNode, float2(0.0, 0.0))
    set_parent(menuPanelNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    menuPanelSlideX = menu_panel_slide_hidden_left_x()
    set_menu_panel_slide_x(menuPanelSlideX)
    menuPanelNode.isActive = false

    characterProfileOverlay = panel(res, [])
    characterProfileOverlay.name = "characterProfileOverlay"
    set_parent(characterProfileOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterProfileOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_image_color(characterProfileOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    add_component(characterProfileOverlay, new UIButton())
    characterProfileOverlay.isActive = false

    build_character_profile_ui()

    advisorPopupOverlay = panel(res, [])
    advisorPopupOverlay.name = "advisorPopupOverlay"
    set_parent(advisorPopupOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(advisorPopupOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_image_color(advisorPopupOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    advisorPopupOverlay.isActive = false
    build_advisor_popup_ui()

    deathFadeOverlay = panel(res, [])
    deathFadeOverlay.name = "deathFadeOverlay"
    set_image_color(deathFadeOverlay, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(deathFadeOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(deathFadeOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    deathFadeOverlay.isActive = false

    deathScreenNode = panel(res, [])
    deathScreenNode.name = "deathScreenNode"
    deathScreenNode?.UIImage.textureId = backgroundTexture
    set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, 0.0))
    set_parent(deathScreenNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(deathScreenNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    juice_create_ambient_layer(deathScreenNode, "juiceAshLayer", JUICE_AMBIENT_ASH)
    deathScreenNode.isActive = false

    deathSummaryTextNode = text("")
    deathSummaryTextNode.name = "deathSummaryTextNode"
    set_text_font_size(deathSummaryTextNode, ui_h(DEATH_SUMMARY_FONT_SIZE))
    set_text_color(deathSummaryTextNode, float4(1.0, 1.0, 1.0, 0.0))
    apply_ui_font(deathSummaryTextNode)
    deathSummaryTextNode?.UIText.autoResizeFrame = true
    deathSummaryTextNode?.UIText.wordWrapping = true
    deathSummaryTextNode?.UIText.horAlignment = TextHorAlignment.Center

    deathRecordTextNode = text("")
    deathRecordTextNode.name = "deathRecordTextNode"
    set_text_font_size(deathRecordTextNode, ui_h(DEATH_RECORD_FONT_SIZE))
    set_text_color(deathRecordTextNode, float4(0.85, 0.85, 0.85, 0.0))
    apply_ui_font(deathRecordTextNode)
    deathRecordTextNode?.UIText.autoResizeFrame = true
    deathRecordTextNode?.UIText.wordWrapping = true
    deathRecordTextNode?.UIText.horAlignment = TextHorAlignment.Center

    tryAgainButtonNode = create_answer_button(try_again(), ui_w(TRY_AGAIN_BUTTON_WIDTH))
    tryAgainButtonNode.name = "tryAgainButtonNode"
    layout_centered_answer_button(tryAgainButtonNode, ui_w(TRY_AGAIN_BUTTON_WIDTH))
    set_image_color(tryAgainButtonNode, float4(1.0, 1.0, 1.0, 0.0))
    let tryAgainFill = answer_button_fill(tryAgainButtonNode)
    if (tryAgainFill.isAlive) {
        var fillCol = ANSWER_BUTTON_COLOR
        fillCol.w = 0.0
        set_image_color(tryAgainFill, fillCol)
        tryAgainFill?.UIText.color = float4(TEXT_COLOR.x, TEXT_COLOR.y, TEXT_COLOR.z, 0.0)
    }

    tryAgainRowNode = hbox([tryAgainButtonNode])
    tryAgainRowNode.name = "tryAgainRowNode"
    set_alignment(tryAgainRowNode, LayoutAlignment.MiddleCenter)
    set_frame_pivot(tryAgainRowNode, float2(0.5, 0.5))

    deathSummaryContentNode = vbox([deathSummaryTextNode, deathRecordTextNode, tryAgainRowNode])
    deathSummaryContentNode.name = "deathSummaryContentNode"
    set_spacing(deathSummaryContentNode, ui_h(20.0))
    set_alignment(deathSummaryContentNode, LayoutAlignment.MiddleCenter)
    set_padding(deathSummaryContentNode, float4(ui_h(DEATH_SUMMARY_BOX_PADDING), ui_h(DEATH_SUMMARY_BOX_PADDING), ui_h(DEATH_SUMMARY_BOX_PADDING), ui_h(DEATH_SUMMARY_BOX_PADDING)))
    deathSummaryContentNode?.UIVerticalLayout.childForceExpandWidth = true
    tryAgainRowNode?.UIHorizontalLayout.childForceExpandWidth = false
    tryAgainRowNode?.UIHorizontalLayout.childForceExpandHeight = false
    set_frame_pivot(deathSummaryContentNode, float2(0.0, 0.0))

    let summaryInnerW = ui_w(DEATH_SUMMARY_BOX_WIDTH) - 2.0 * ui_box_border()
    deathSummaryBoxNode = panel(float2(summaryInnerW, ui_h(200.0)), [deathSummaryContentNode])
    deathSummaryBoxNode.name = "deathSummaryBoxNode"
    set_image_color(deathSummaryBoxNode, float4(DEATH_SUMMARY_BOX_BG_COLOR.x, DEATH_SUMMARY_BOX_BG_COLOR.y, DEATH_SUMMARY_BOX_BG_COLOR.z, 0.0))
    set_alignment(deathSummaryBoxNode, LayoutAlignment.TopLeft)
    set_frame_pivot(deathSummaryBoxNode, float2(0.0, 0.0))

    deathSummaryBorderNode = panel(float2(ui_w(DEATH_SUMMARY_BOX_WIDTH), ui_h(204.0)), [deathSummaryBoxNode])
    deathSummaryBorderNode.name = "deathSummaryBorderNode"
    set_image_color(deathSummaryBorderNode, float4(UI_BOX_BORDER_COLOR.x, UI_BOX_BORDER_COLOR.y, UI_BOX_BORDER_COLOR.z, 0.0))
    set_alignment(deathSummaryBorderNode, LayoutAlignment.TopLeft)
    set_frame_pivot(deathSummaryBorderNode, float2(0.5, 0.5))
    set_frame_pos(deathSummaryBoxNode, float2(ui_box_border(), ui_box_border()))

    deathSummaryRoot = deathSummaryBorderNode
    deathSummaryRoot.name = "deathSummaryRoot"
    set_parent(deathSummaryRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(deathSummaryRoot, MIDDLE_CENTER_ANCHOR)
    deathSummaryRoot.isActive = false
    apply_death_summary_layout()

    build_info_tooltip_ui()
    build_main_menu_ui()
    build_main_menu_options_ui()
    build_intro_cutscene_ui()

    add_component(uiCanvas, new StatBarDisplay())
    add_component(uiCanvas, new MenuInput())
    add_component(uiCanvas, new CameraZoom())
    add_component(uiCanvas, new ParallelHandoffFlow())
    add_component(uiCanvas, new CharacterVisualPrep())
    add_component(uiCanvas, new DialogueFlow())
    add_component(uiCanvas, new AnswerChoiceHover())
    add_component(uiCanvas, new MenuButtonHover())
    add_component(uiCanvas, new MainMenuButtonHover())
    add_component(uiCanvas, new CharacterProfileButtonHover())
    add_component(uiCanvas, new MainMenuOptionsButtonHover())
    add_component(uiCanvas, new CharacterClick())
    add_component(uiCanvas, new InfoTooltipDisplay())
    add_component(uiCanvas, new DialogueLayout())
    add_component(uiCanvas, new DefeatFlow())
    add_component(uiCanvas, new IntroCutsceneFlow())
    add_component(uiCanvas, new ContinueFadeFlow())
    add_component(uiCanvas, new AdvisorIconHover())
    add_component(uiCanvas, new AdvisorActionCardHover())

    apply_top_bar_layout()
    apply_bottom_bar_layout()
    apply_advisor_icon_layout()
    apply_menu_layout()
    apply_main_menu_layout()
    apply_character_profile_layout()
    apply_info_tooltip_layout()

    if (introFadeOverlay.isAlive) {
        introFadeOverlay.set_parent(uiCanvas, AddChildStrategy.KeepLocalTransform)
    }
}



def public load_menu_button_textures() {
    menuButtonShineTexture = create_menu_button_shine_texture()
}



def public court_portrait_texture_is_valid(tex : TextureId) : bool {
    var valid = false
    get_texture_size(tex) $(size : int2) {
        valid = size.x > 0 && size.y > 0
    }
    return valid
}



def public load_court_character_batch(fromIdx : int; toIdxEx : int) {
    for (i in range(fromIdx, toIdxEx)) {
        courtBodyTextures[i] = request_texture(COURT_BODY_PATHS[i])
        if (COURT_PORTRAIT_PATHS[i] != COURT_BODY_PATHS[i]) {
            courtPortraitTextures[i] = request_texture(COURT_PORTRAIT_PATHS[i])
            if (!court_portrait_texture_is_valid(courtPortraitTextures[i])) {
                courtPortraitTextures[i] = courtBodyTextures[i]
            }
        } else {
            courtPortraitTextures[i] = courtBodyTextures[i]
        }
    }
}



def public advance_bootstrap_loading() {
    if (gameBootstrapComplete) {
        return
    }
    if (bootstrapLoadStep == 0) {
        load_menu_button_textures()
        gameFont = request_font(GAME_FONT_PATH)
        dialogueFont = request_font(DIALOGUE_FONT_PATH)
        choiceFont = request_font(CHOICE_FONT_PATH)
        uiFont = choiceFont
        russianDialogueFont = choiceFont
        bootstrapLoadStep = 1
        return
    }
    if (bootstrapLoadStep == 1) {
        backgroundTexture = request_texture(BACKGROUND_TEXTURE_PATH)
        mainMenuBackgroundTexture = request_texture(MAIN_MENU_BACKGROUND_TEXTURE_PATH)
        update_main_menu_background_texture_aspect()
        advisorHudIconTexture = request_texture(ADVISOR_ICON_TEXTURE_PATH)
        advisorHudIconHoverTexture = request_texture(ADVISOR_ICON_HOVER_TEXTURE_PATH)
        load_advisor_icon_alpha_pixels()
        advisorCharacterTexture = request_texture(ADVISOR_CHARACTER_TEXTURE_PATH)
        for (i in range(MAX_ADVISOR_ACTIONS)) {
            advisorActionTextures[i] = request_texture(advisor_action_image_path(i))
            update_advisor_action_texture_aspect(i, advisorActionTextures[i])
        }
        update_advisor_character_texture_aspect(advisorCharacterTexture)
        bootstrapLoadStep = 2
        return
    }
    if (bootstrapLoadStep == 2) {
        kingTexture = request_texture(KING_TEXTURE_PATH)
        peasantTexture = request_texture(PEASANT_TEXTURE_PATH)
        bootstrapLoadStep = 3
        return
    }
    if (bootstrapLoadStep == 3) {
        for (i in range(VISITOR_TEXTURE_COUNT)) {
            visitorTextures[i] = request_texture(VISITOR_TEXTURE_PATHS[i])
        }
        bootstrapLoadStep = 4
        return
    }
    if (bootstrapLoadStep == 4) {
        for (i in range(STAT_COUNT)) {
            statTextures[i] = request_texture(STAT_TEXTURE_PATHS[i])
            statOutlineTextures[i] = request_texture(STAT_OUTLINE_TEXTURE_PATHS[i])
        }
        bootstrapLoadStep = 5
        return
    }
    if (bootstrapLoadStep == 5) {
        for (i in range(CHARACTER_COUNT)) {
            portraitTextures[i] = request_texture(PORTRAIT_TEXTURE_PATHS[i])
        }
        bootstrapLoadStep = 6
        return
    }
    if (bootstrapLoadStep == 6) {
        load_court_character_batch(0, 3)
        bootstrapLoadStep = 7
        return
    }
    if (bootstrapLoadStep == 7) {
        load_court_character_batch(3, 6)
        bootstrapLoadStep = 8
        return
    }
    if (bootstrapLoadStep == 8) {
        load_court_character_batch(6, 9)
        bootstrapLoadStep = 9
        return
    }
    if (bootstrapLoadStep == 9) {
        load_court_character_batch(9, COURT_CHARACTER_COUNT)
        bootstrapLoadStep = 10
        return
    }
    if (bootstrapLoadStep == 10) {
        statBarTrackTexture = create_solid_stat_bar_texture()
        statBarFillTexture = create_solid_stat_bar_texture()
        characterTexture = kingTexture
        update_character_texture_aspect(characterTexture)
        bootstrapLoadStep = 11
        return
    }
    finish_game_bootstrap()
}



def public wire_ui_event_listeners() {
    add_ui_event_listener(answer_button_fill(menuButtonNode), UIMouseEventType.MouseClick, @@on_menu_button_click)
    add_ui_event_listener(answer_button_fill(menuButtonNode), UIMouseEventType.MouseOver, @@on_menu_button_mouse_over)
    add_ui_event_listener(answer_button_fill(menuButtonNode), UIMouseEventType.MouseOut, @@on_menu_button_mouse_out)
    add_ui_event_listener(answer_button_fill(advisorButtonNode), UIMouseEventType.MouseClick, @@on_advisor_button_click)
    add_ui_event_listener(answer_button_fill(advisorButtonNode), UIMouseEventType.MouseOver, @@on_advisor_button_mouse_over)
    add_ui_event_listener(answer_button_fill(advisorButtonNode), UIMouseEventType.MouseOut, @@on_advisor_button_mouse_out)
    add_ui_event_listener(answer_button_fill(menuContinueButtonNode), UIMouseEventType.MouseClick, @@on_menu_continue_click)
    add_ui_event_listener(answer_button_fill(menuContinueButtonNode), UIMouseEventType.MouseOver, @@on_menu_continue_mouse_over)
    add_ui_event_listener(answer_button_fill(menuContinueButtonNode), UIMouseEventType.MouseOut, @@on_menu_continue_mouse_out)
    add_ui_event_listener(answer_button_fill(menuExitButtonNode), UIMouseEventType.MouseClick, @@on_menu_exit_click)
    add_ui_event_listener(answer_button_fill(menuOptionsButtonNode), UIMouseEventType.MouseClick, @@on_menu_options_click)
    add_ui_event_listener(answer_button_fill(menuExitButtonNode), UIMouseEventType.MouseOver, @@on_menu_exit_mouse_over)
    add_ui_event_listener(answer_button_fill(menuExitButtonNode), UIMouseEventType.MouseOut, @@on_menu_exit_mouse_out)
    add_ui_event_listener(dayTextNode, UIMouseEventType.MouseOver, @@on_info_day_mouse_over)
    add_ui_event_listener(dayTextNode, UIMouseEventType.MouseOut, @@on_info_day_mouse_out)
    add_ui_event_listener(nicknameTextNode, UIMouseEventType.MouseOver, @@on_info_nickname_mouse_over)
    add_ui_event_listener(nicknameTextNode, UIMouseEventType.MouseOut, @@on_info_nickname_mouse_out)
    add_ui_event_listener(statColumnNodes[0], UIMouseEventType.MouseOver, @@on_stat_0_mouse_over)
    add_ui_event_listener(statColumnNodes[1], UIMouseEventType.MouseOver, @@on_stat_1_mouse_over)
    add_ui_event_listener(statColumnNodes[2], UIMouseEventType.MouseOver, @@on_stat_2_mouse_over)
    add_ui_event_listener(statColumnNodes[3], UIMouseEventType.MouseOver, @@on_stat_3_mouse_over)
    add_ui_event_listener(statColumnNodes[4], UIMouseEventType.MouseOver, @@on_stat_4_mouse_over)
    add_ui_event_listener(statColumnNodes[5], UIMouseEventType.MouseOver, @@on_stat_5_mouse_over)
    add_ui_event_listener(statColumnNodes[6], UIMouseEventType.MouseOver, @@on_stat_6_mouse_over)
    add_ui_event_listener(statColumnNodes[7], UIMouseEventType.MouseOver, @@on_stat_7_mouse_over)
    add_ui_event_listener(statColumnNodes[8], UIMouseEventType.MouseOver, @@on_stat_8_mouse_over)
    add_ui_event_listener(statColumnNodes[0], UIMouseEventType.MouseOut, @@on_stat_0_mouse_out)
    add_ui_event_listener(statColumnNodes[1], UIMouseEventType.MouseOut, @@on_stat_1_mouse_out)
    add_ui_event_listener(statColumnNodes[2], UIMouseEventType.MouseOut, @@on_stat_2_mouse_out)
    add_ui_event_listener(statColumnNodes[3], UIMouseEventType.MouseOut, @@on_stat_3_mouse_out)
    add_ui_event_listener(statColumnNodes[4], UIMouseEventType.MouseOut, @@on_stat_4_mouse_out)
    add_ui_event_listener(statColumnNodes[5], UIMouseEventType.MouseOut, @@on_stat_5_mouse_out)
    add_ui_event_listener(statColumnNodes[6], UIMouseEventType.MouseOut, @@on_stat_6_mouse_out)
    add_ui_event_listener(statColumnNodes[7], UIMouseEventType.MouseOut, @@on_stat_7_mouse_out)
    add_ui_event_listener(statColumnNodes[8], UIMouseEventType.MouseOut, @@on_stat_8_mouse_out)
    add_ui_event_listener(menuOverlay, UIMouseEventType.MouseClick, @@on_menu_overlay_click)
    add_ui_event_listener(mainMenuOptionsOverlay, UIMouseEventType.MouseClick, @@on_main_menu_options_overlay_click)
    add_ui_event_listener(mainMenuOptionsPanelNode, UIMouseEventType.MouseClick, @@on_main_menu_options_panel_click)
    add_ui_event_listener(answer_button_fill(mainMenuOptionsBackButtonNode), UIMouseEventType.MouseClick, @@on_main_menu_options_back_click)
    add_ui_event_listener(answer_button_fill(mainMenuOptionsBackButtonNode), UIMouseEventType.MouseOver, @@on_main_menu_options_back_mouse_over)
    add_ui_event_listener(answer_button_fill(mainMenuOptionsBackButtonNode), UIMouseEventType.MouseOut, @@on_main_menu_options_back_mouse_out)
    add_ui_event_listener(characterProfileOverlay, UIMouseEventType.MouseClick, @@on_character_profile_overlay_click)
    add_ui_event_listener(characterProfilePanelNode, UIMouseEventType.MouseClick, @@on_character_profile_panel_click)
    add_ui_event_listener(UIMouseEventType.MouseClick, @@on_advisor_popup_global_mouse_click)
    add_ui_event_listener(advisorHudIconNode, UIMouseEventType.MouseClick, @@on_advisor_icon_click)
    wire_advisor_action_event_listeners()
    add_ui_event_listener(advisorConfirmOverlay, UIMouseEventType.MouseClick, @@on_advisor_confirm_overlay_click)
    add_ui_event_listener(advisorConfirmPanelNode, UIMouseEventType.MouseClick, @@on_advisor_confirm_panel_click)
    add_ui_event_listener(answer_button_fill(advisorConfirmYesNode), UIMouseEventType.MouseClick, @@on_advisor_confirm_yes_click)
    add_ui_event_listener(answer_button_fill(advisorConfirmNoNode), UIMouseEventType.MouseClick, @@on_advisor_confirm_no_click)
    add_ui_event_listener(answer_button_fill(characterProfileOkayButtonNode), UIMouseEventType.MouseClick, @@on_character_profile_okay_click)
    add_ui_event_listener(answer_button_fill(characterProfileOkayButtonNode), UIMouseEventType.MouseOver, @@on_character_profile_okay_mouse_over)
    add_ui_event_listener(answer_button_fill(characterProfileOkayButtonNode), UIMouseEventType.MouseOut, @@on_character_profile_okay_mouse_out)
    add_ui_event_listener(answer_button_fill(tryAgainButtonNode), UIMouseEventType.MouseClick, @@on_try_again_click)
    add_ui_event_listener(answer_button_fill(tryAgainButtonNode), UIMouseEventType.MouseOver, @@on_try_again_mouse_over)
    add_ui_event_listener(answer_button_fill(tryAgainButtonNode), UIMouseEventType.MouseOut, @@on_try_again_mouse_out)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[0]), UIMouseEventType.MouseClick, @@on_choice_0_click)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[1]), UIMouseEventType.MouseClick, @@on_choice_1_click)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[2]), UIMouseEventType.MouseClick, @@on_choice_2_click)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[3]), UIMouseEventType.MouseClick, @@on_choice_3_click)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[4]), UIMouseEventType.MouseClick, @@on_choice_4_click)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[0]), UIMouseEventType.MouseOver, @@on_choice_0_mouse_over)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[1]), UIMouseEventType.MouseOver, @@on_choice_1_mouse_over)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[2]), UIMouseEventType.MouseOver, @@on_choice_2_mouse_over)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[3]), UIMouseEventType.MouseOver, @@on_choice_3_mouse_over)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[4]), UIMouseEventType.MouseOver, @@on_choice_4_mouse_over)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[0]), UIMouseEventType.MouseOut, @@on_choice_0_mouse_out)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[1]), UIMouseEventType.MouseOut, @@on_choice_1_mouse_out)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[2]), UIMouseEventType.MouseOut, @@on_choice_2_mouse_out)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[3]), UIMouseEventType.MouseOut, @@on_choice_3_mouse_out)
    add_ui_event_listener(answer_button_fill(choiceButtonNodes[4]), UIMouseEventType.MouseOut, @@on_choice_4_mouse_out)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX]), UIMouseEventType.MouseClick, @@on_main_menu_continue_click)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX]), UIMouseEventType.MouseOver, @@on_main_menu_button_0_mouse_over)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_CONTINUE_IDX]), UIMouseEventType.MouseOut, @@on_main_menu_button_0_mouse_out)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX]), UIMouseEventType.MouseClick, @@on_main_menu_new_game_click)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX]), UIMouseEventType.MouseOver, @@on_main_menu_button_1_mouse_over)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_NEW_GAME_IDX]), UIMouseEventType.MouseOut, @@on_main_menu_button_1_mouse_out)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX]), UIMouseEventType.MouseClick, @@on_main_menu_options_click)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX]), UIMouseEventType.MouseOver, @@on_main_menu_button_2_mouse_over)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_OPTIONS_IDX]), UIMouseEventType.MouseOut, @@on_main_menu_button_2_mouse_out)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX]), UIMouseEventType.MouseClick, @@on_main_menu_about_click)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX]), UIMouseEventType.MouseOver, @@on_main_menu_button_3_mouse_over)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX]), UIMouseEventType.MouseOut, @@on_main_menu_button_3_mouse_out)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_EXIT_IDX]), UIMouseEventType.MouseClick, @@on_main_menu_exit_click)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_EXIT_IDX]), UIMouseEventType.MouseOver, @@on_main_menu_button_4_mouse_over)
    add_ui_event_listener(answer_button_fill(mainMenuButtonNodes[MAIN_MENU_EXIT_IDX]), UIMouseEventType.MouseOut, @@on_main_menu_button_4_mouse_out)
}



def public finish_game_bootstrap() {
    if (gameBootstrapComplete) {
        return
    }
    load_game_options()
    load_record_days()
    refresh_save_availability()
    build_ui()
    juice_init()
    juice_apply_fonts()
    apply_ui_theme()
    warm_character_alpha(KING_TEXTURE_PATH)
    warm_character_visual(COURT_BODY_PATHS[CHAR_EDRIC])
    warm_character_alpha(COURT_BODY_PATHS[CHAR_EDRIC])
    wire_ui_event_listeners()
    update_stat_bar_anims(0.0)
    sync_options_ui_from_settings()
    refresh_all_localized_ui()
    update_day_text()
    update_nickname_text()
    cameraZoomT = 0.0
    apply_camera_zoom()
    screenPhase = SCREEN_MAIN_MENU
    apply_main_menu_layout()
    if (startupSplashRoot.isAlive) {
        startupSplashRoot.set_parent(uiCanvas, AddChildStrategy.KeepLocalTransform)
        apply_startup_splash_layout()
    }
    gameBootstrapComplete = true
    bootstrapLoadStep = 11
}



def public load_resources() {
    while (!gameBootstrapComplete) {
        advance_bootstrap_loading()
    }
}


// ----- hover_components -----
class AdvisorIconHover : Component {
    def override on_update {
        var hovered = false
        if (can_hover_advisor_icon()) {
            hovered = is_mouse_over_advisor_icon_opaque()
        }
        if (hovered == advisorHudIconHovered) {
            return
        }
        advisorHudIconHovered = hovered
        apply_advisor_icon_visual()
    }
}



class AdvisorActionCardHover : Component {
    def override on_update {
        let popupVisible = is_advisor_popup_open() && advisorPopupAnimPhase != ADVISOR_ANIM_CLOSING && advisorPopupPanelNode.isActive
        if (!popupVisible) {
            for (i in range(MAX_ADVISOR_ACTIONS)) {
                advisorActionHovered[i] = false
                advisorActionHoverT[i] = 0.0
            }
            return
        }
        let dt = get_delta_time()
        for (i in range(MAX_ADVISOR_ACTIONS)) {
            advisorActionHovered[i] = is_mouse_over_advisor_action_card(i)
            let available = is_advisor_action_available(i) && can_execute_advisor_actions()
            let target = (advisorActionHovered[i] && available) ? 1.0 : 0.0
            advisorActionHoverT[i] = move_toward(advisorActionHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            if (advisorActionSlotFillNodes[i].isAlive) {
                apply_advisor_action_card_visual(i, advisorActionHoverT[i], available)
            }
        }
    }
}



class CharacterHover : Component {
    def override on_update {
        if (!characterRoot.isAlive || !characterRoot.isActive) {
            characterHovered = false
        } elif (characterHoverT <= 0.0 && !is_mouse_over_character_frame()) {
            characterHovered = false
        } else {
            characterHovered = is_mouse_over_character_opaque()
        }
        let dt = get_delta_time()
        let target = characterHovered ? 1.0 : 0.0
        characterHoverT = move_toward(characterHoverT, target, ANSWER_HOVER_LERP_SPEED * dt)
        apply_character_image_color(current_character_reveal_t())
    }
}



class CharacterClick : Component {
    def override on_update {
        if (!can_click_character()) {
            return
        }
        for (cmd in get_input_command_buffer()) {
            if (cmd is RawMouseInputEvent) {
                let mouse = cmd as RawMouseInputEvent
                if (mouse.kind == RawMouseInputEventKind.MouseDown && mouse.buttonIdx == MouseButton.Left) {
                    if (is_mouse_over_character_opaque()) {
                        open_character_profile()
                    }
                }
            }
        }
    }
}



class StartupSplashFlow : Component {
    def override on_update {
        if (!is_startup_splash_active()) {
            return
        }
        advance_bootstrap_loading()
        if (gameBootstrapComplete) {
            tick_character_visual_prep("", "")
        }
        let dt = get_delta_time()

        if (startupSplashPhase == SPLASH_BLACK_HOLD) {
            set_startup_splash_overlay_alpha(1.0)
            set_startup_splash_logo_visible(false)
            startupSplashT += dt
            sync_background_music()
            if (startupSplashT >= SPLASH_BLACK_HOLD_DURATION) {
                startupSplashPhase = SPLASH_FADE_IN_LOGO
                startupSplashT = 0.0
                set_startup_splash_logo_visible(true)
            }
            return
        }

        if (startupSplashPhase == SPLASH_FADE_IN_LOGO) {
            startupSplashT += dt / SPLASH_FADE_IN_LOGO_DURATION
            sync_background_music()
            if (startupSplashT >= 1.0) {
                startupSplashT = 1.0
                set_startup_splash_overlay_alpha(0.0)
                startupSplashPhase = SPLASH_HOLD_LOGO
                startupSplashT = 0.0
            } else {
                set_startup_splash_overlay_alpha(1.0 - startupSplashT)
            }
            return
        }

        if (startupSplashPhase == SPLASH_HOLD_LOGO) {
            set_startup_splash_overlay_alpha(0.0)
            set_startup_splash_bg_alpha(1.0)
            startupSplashT += dt
            sync_background_music()
            if (startupSplashT >= SPLASH_HOLD_LOGO_DURATION && gameBootstrapComplete) {
                startupSplashPhase = SPLASH_FADE_IN_MENU
                startupSplashT = 0.0
                set_startup_splash_logo_visible(false)
                juice_stop_layer(splashBackLayerNode)
                juice_stop_layer(splashFrontLayerNode)
                apply_screen_visibility()
            }
            return
        }

        if (startupSplashPhase == SPLASH_FADE_IN_MENU) {
            if (!gameBootstrapComplete) {
                return
            }
            apply_screen_visibility()
            sync_background_music()
            startupSplashT += dt / SPLASH_FADE_IN_MENU_DURATION
            if (startupSplashT >= 1.0) {
                startupSplashT = 1.0
                set_startup_splash_bg_alpha(0.0)
                set_startup_splash_overlay_alpha(0.0)
                finish_startup_splash()
            } else {
                set_startup_splash_bg_alpha(1.0 - startupSplashT)
                set_startup_splash_overlay_alpha(0.0)
            }
        }
    }
}



class ContinueFadeFlow : Component {
    def override on_update {
        if (continueFadePhase == CONTINUE_FADE_NONE) {
            return
        }
        let dt = get_delta_time()

        if (continueFadePhase == CONTINUE_FADE_OUT) {
            continueFadeT += dt / INTRO_FADE_DURATION
            if (continueFadeT >= 1.0) {
                continueFadeT = 1.0
                set_intro_fade_alpha(1.0)
                on_continue_fade_out_complete()
            } else {
                set_intro_fade_alpha(continueFadeT)
            }
            return
        }

        if (continueFadePhase == CONTINUE_FADE_IN) {
            continueFadeT += dt / INTRO_FADE_DURATION
            if (continueFadeT >= 1.0) {
                continueFadeT = 1.0
                set_intro_fade_alpha(0.0)
                on_continue_fade_in_complete()
            } else {
                set_intro_fade_alpha(lerp(1.0, 0.0, continueFadeT))
            }
        }
    }
}



class IntroCutsceneFlow : Component {
    def override on_update {
        if (introCutscenePhase == INTRO_NONE) {
            reset_intro_cutscene_skip_ui()
            return
        }
        let dt = get_delta_time()
        if (!introSkipExitPending) {
            if (tick_intro_cutscene_skip_hold(dt)) {
                return
            }
        } else {
            set_intro_cutscene_skip_visible(false)
        }

        if (introCutscenePhase == INTRO_FADE_TO_BLACK) {
            introCutsceneT += dt / INTRO_FADE_DURATION
            if (introCutsceneT >= 1.0) {
                introCutsceneT = 1.0
                set_intro_fade_alpha(1.0)
                screenPhase = SCREEN_PLAYING
                introCutscenePhase = INTRO_SCENE_WAIT
                introCutsceneT = 0.0
                apply_screen_visibility()
            } else {
                set_intro_fade_alpha(introCutsceneT)
            }
            return
        }

        if (introCutscenePhase == INTRO_SCENE_WAIT) {
            set_intro_fade_alpha(0.0)
            if (intro_any_input_pressed()) {
                introCutscenePhase = INTRO_PICTURE_WAIT
                introCutsceneT = 0.0
                introPictureSlideDone = false
                introDialogueBeat = 0
                introCutsceneSlideX = intro_image_hidden_left_x()
                set_intro_image_visible(true)
                apply_intro_slide_positions()
                return
            }
            introCutsceneT += dt
            if (introCutsceneT >= INTRO_SCENE_WAIT_DURATION) {
                introCutscenePhase = INTRO_PICTURE_WAIT
                introCutsceneT = 0.0
                introPictureSlideDone = false
                introDialogueBeat = 0
                introCutsceneSlideX = intro_image_hidden_left_x()
                set_intro_image_visible(true)
                apply_intro_slide_positions()
            }
            return
        }

        if (introCutscenePhase == INTRO_PICTURE_WAIT) {
            if (intro_any_input_pressed()) {
                if (!introPictureSlideDone) {
                    intro_snap_main_image_in_place()
                }
                if (introSlideTargetBeat > 0) {
                    intro_begin_dialogue_beat_immediately(introSlideTargetBeat)
                    introSlideTargetBeat = 0
                } else {
                    intro_begin_replica_immediately_for_current_beat()
                }
                return
            }
            if (!introPictureSlideDone) {
                introCutsceneSlideX = move_toward(introCutsceneSlideX, 0.0, intro_image_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introCutsceneSlideX) < 1.0) {
                    intro_snap_main_image_in_place()
                    if (introSlideTargetBeat > 0) {
                        intro_begin_dialogue_beat_immediately(introSlideTargetBeat)
                        introSlideTargetBeat = 0
                    } else {
                        intro_begin_replica_immediately_for_current_beat()
                    }
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_NAME_SLIDE) {
            if (intro_any_input_pressed()) {
                introCutscenePhase = INTRO_TYPEWRITER
                intro_begin_typewriter_for_current_beat()
                return
            }
            introNameSlideX = move_toward(introNameSlideX, 0.0, intro_name_slide_speed() * dt)
            apply_intro_slide_positions()
            if (abs(introNameSlideX) < 1.0) {
                introCutscenePhase = INTRO_TYPEWRITER
                intro_begin_typewriter_for_current_beat()
            }
            return
        }

        if (introCutscenePhase == INTRO_TYPEWRITER) {
            if (intro_tick_typewriter(dt)) {
                introCutscenePhase = INTRO_POST_TEXT_WAIT
                introCutsceneT = 0.0
            }
            return
        }

        if (introCutscenePhase == INTRO_POST_TEXT_WAIT) {
            if (intro_tick_post_text_wait(dt)) {
                if (ashfordCutsceneActive) {
                    introCutscenePhase = INTRO_FADE_OUT
                } elif (statUnlockCutsceneActive && statUnlockCutsceneStatIdx == STAT_CHURCH_IDX && has_next_church_cutscene_replica(introDialogueBeat)) {
                    introDialogueBeat += 1
                    introCutscenePhase = INTRO_TYPEWRITER
                    introCutsceneT = 0.0
                    intro_begin_typewriter_for_current_beat()
                } elif (statUnlockCutsceneActive) {
                    introCutscenePhase = INTRO_FADE_OUT
                } elif (introCutsceneLayoutMode == INTRO_LAYOUT_SEQ1 && introDialogueBeat == 0) {
                    begin_intro_dialogue_beat(1, true)
                    introCutscenePhase = INTRO_TYPEWRITER
                    refresh_intro_replica_text()
                } else {
                    introCutscenePhase = INTRO_SLIDE_OUT
                }
                introCutsceneT = 0.0
            }
            return
        }

        if (introCutscenePhase == INTRO_SLIDE_OUT) {
            if (intro_any_input_pressed()) {
                intro_snap_main_image_offscreen_exit()
                prepare_intro_seq2()
                introCutscenePhase = INTRO_SEQ2_SLIDE_IN
                introCutsceneT = 0.0
                set_intro_image_visible(true)
                apply_intro_slide_positions()
                return
            }
            let targetX = intro_exit_hidden_right_x()
            introCutsceneSlideX = move_toward(introCutsceneSlideX, targetX, intro_exit_slide_speed() * dt)
            apply_intro_slide_positions()
            if (abs(introCutsceneSlideX - targetX) < 1.0) {
                intro_snap_main_image_offscreen_exit()
                prepare_intro_seq2()
                introCutscenePhase = INTRO_SEQ2_SLIDE_IN
                introCutsceneT = 0.0
                set_intro_image_visible(true)
                apply_intro_slide_positions()
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ2_SLIDE_IN) {
            if (intro_any_input_pressed()) {
                if (!introPictureSlideDone) {
                    intro_snap_main_image_in_place()
                }
                intro_begin_dialogue_beat_immediately(2)
                return
            }
            if (!introPictureSlideDone) {
                introCutsceneSlideX = move_toward(introCutsceneSlideX, 0.0, intro_image_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introCutsceneSlideX) < 1.0) {
                    intro_snap_main_image_in_place()
                    intro_begin_dialogue_beat_immediately(2)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_DIALOGUE) {
            if (introDialogueSubPhase == INTRO_DIALOGUE_NAME_SLIDE) {
                if (intro_any_input_pressed()) {
                    introDialogueSubPhase = INTRO_DIALOGUE_TYPEWRITER
                    intro_begin_typewriter_for_current_beat()
                    return
                }
                introNameSlideX = move_toward(introNameSlideX, 0.0, intro_name_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introNameSlideX) < 1.0) {
                    introDialogueSubPhase = INTRO_DIALOGUE_TYPEWRITER
                    intro_begin_typewriter_for_current_beat()
                }
                return
            }
            if (introDialogueSubPhase == INTRO_DIALOGUE_TYPEWRITER) {
                if (intro_tick_typewriter(dt)) {
                    introDialogueSubPhase = INTRO_DIALOGUE_POST_WAIT
                    introCutsceneT = 0.0
                }
                return
            }
            if (intro_tick_post_text_wait(dt)) {
                intro_advance_after_dialogue_wait()
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ3_SLIDE_IN) {
            let targetBeat = intro_seq3_slide_target_beat()
            if (intro_any_input_pressed()) {
                if (!introSeq3SlideDone) {
                    intro_snap_seq3_in_place()
                }
                intro_begin_dialogue_beat_immediately(targetBeat)
                return
            }
            if (!introSeq3SlideDone) {
                introSeq3SlideX = move_toward(introSeq3SlideX, 0.0, intro_seq3_slide_speed_for_current() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq3SlideX) < 1.0) {
                    intro_snap_seq3_in_place()
                    intro_begin_dialogue_beat_immediately(targetBeat)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ4_APPEAR) {
            if (intro_any_input_pressed()) {
                if (!introSeq4SlideDone) {
                    intro_snap_seq4_in_place()
                }
                intro_begin_dialogue_beat_immediately(9)
                return
            }
            if (!introSeq4SlideDone) {
                introSeq4SlideX = move_toward(introSeq4SlideX, 0.0, intro_seq4_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq4SlideX) < 1.0) {
                    intro_snap_seq4_in_place()
                    intro_begin_dialogue_beat_immediately(9)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ5_APPEAR) {
            if (intro_any_input_pressed()) {
                if (!introSeq5SlideDone) {
                    intro_snap_seq5_in_place()
                }
                intro_begin_dialogue_beat_immediately(11)
                return
            }
            if (!introSeq5SlideDone) {
                introSeq5SlideX = move_toward(introSeq5SlideX, 0.0, intro_seq5_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq5SlideX) < 1.0) {
                    intro_snap_seq5_in_place()
                    intro_begin_dialogue_beat_immediately(11)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ6_APPEAR) {
            if (intro_any_input_pressed()) {
                if (!introSeq6SlideDone) {
                    intro_snap_seq6_in_place()
                }
                intro_begin_dialogue_beat_immediately(13)
                return
            }
            if (!introSeq6SlideDone) {
                introSeq6SlideX = move_toward(introSeq6SlideX, 0.0, intro_seq6_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq6SlideX) < 1.0) {
                    intro_snap_seq6_in_place()
                    intro_begin_dialogue_beat_immediately(13)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_BLACK_PAUSE) {
            if (intro_any_input_pressed()) {
                intro_leave_black_pause_and_begin_edwin_shake()
                return
            }
            introCutsceneT += dt
            if (introCutsceneT >= INTRO_BLACK_PAUSE_DURATION) {
                intro_leave_black_pause_and_begin_edwin_shake()
            }
            return
        }

        if (introCutscenePhase == INTRO_IMAGE_SHAKE) {
            if (intro_any_input_pressed()) {
                introShakeT = INTRO_SHAKE_DURATION
                intro_finish_shake_transition()
                return
            }
            intro_tick_shake_offset(dt)
            apply_intro_slide_positions()
            if (introShakeT >= INTRO_SHAKE_DURATION) {
                intro_finish_shake_transition()
            }
            return
        }

        if (introCutscenePhase == INTRO_POST_SHAKE_WAIT) {
            if (intro_any_input_pressed()) {
                intro_begin_scene6()
                intro_snap_main_image_in_place()
                intro_begin_dialogue_beat_immediately(28)
                return
            }
            introCutsceneT += dt
            if (introCutsceneT >= INTRO_POST_SHAKE_WAIT_DURATION) {
                intro_begin_scene6()
            }
            return
        }

        if (introCutscenePhase == INTRO_FADE_OUT) {
            sync_intro_cutscene_music()
            sync_background_music()
            introCutsceneT += dt / intro_cutscene_exit_fade_duration()
            if (introCutsceneT >= 1.0) {
                introCutsceneT = 1.0
                set_intro_fade_alpha(1.0)
                if (introCutsceneRoot.isAlive) {
                    introCutsceneRoot.isActive = false
                }
                introCutscenePhase = INTRO_UNFADE
                introCutsceneT = 0.0
                apply_screen_visibility()
            } else {
                set_intro_fade_alpha(introCutsceneT)
            }
            return
        }

        if (introCutscenePhase == INTRO_UNFADE) {
            introCutsceneT += dt / intro_cutscene_exit_unfade_duration()
            if (introCutsceneT >= 1.0) {
                if (ashfordCutsceneActive) {
                    finish_ashford_cutscene()
                } elif (statUnlockCutsceneActive) {
                    finish_stat_unlock_cutscene()
                } else {
                    finish_intro_cutscene()
                }
            } else {
                set_intro_fade_alpha(lerp(1.0, 0.0, introCutsceneT))
            }
        }
    }
}



class CharacterSlide : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (characterAnimPhase == CHARACTER_ANIM_EXIT) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_character_exit()
                return
            }
            let dt = get_delta_time()
            characterAnimOffsetX -= ui_w(CHARACTER_ANIM_EXIT_SPEED) * dt
            characterWalkBobTimer += dt
            let bobPhase = cos(characterWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
            let bobY = character_walk_bob_offset_y(bobPhase)
            set_character_offset(characterAnimOffsetX, bobY)
            characterRevealT = character_exit_fade_t(characterAnimOffsetX)
            apply_character_image_color(characterRevealT)

            if (characterAnimOffsetX <= character_exit_end_offset()) {
                finish_character_exit()
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_ENTER) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_character_enter()
                return
            }
            let dt = get_delta_time()
            characterEnterT = min(1.0, characterEnterT + dt / CHARACTER_ENTER_DURATION)
            // Ease out: a confident stride that slows into place instead of a constant slide.
            let u = 1.0 - characterEnterT
            let p = 1.0 - u * u * u
            characterAnimOffsetX = lerp(characterEnterStartX, characterRestOffsetX, p)
            characterWalkBobTimer += dt
            // One-sided bob: trough sits amplitude below the border, peak lands feet on the border.
            // The steps shorten as the visitor slows down.
            let bobPhase = cos(characterWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
            let bobY = character_walk_bob_offset_y(bobPhase) * (0.15 + 0.85 * u)
            // The silhouette starts to catch the light on the way in.
            let light = saturate((p - 0.55) / 0.45)
            // Kept as the reveal amount, since the hover pass re-applies it every frame.
            characterRevealT = CHARACTER_ENTER_LIGHT_START * light * light * (3.0 - 2.0 * light)
            apply_character_image_color(characterRevealT)

            if (characterEnterT >= 1.0) {
                finish_character_enter_slide()
            } else {
                set_character_offset(characterAnimOffsetX, bobY)
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_REVEAL) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_character_enter()
                return
            }
            let dt = get_delta_time()
            characterRevealT += dt / CHARACTER_REVEAL_DURATION
            apply_character_breath()
            if (characterRevealT >= 1.0) {
                finish_character_reveal()
            } else {
                apply_character_image_color(characterRevealT)
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_IDLE) {
            apply_character_breath()
        }
    }
}



class DialogueFlow : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (dialogPhase == DIALOG_TYPEWRITER) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_typewriter()
                return
            }
            let dt = get_delta_time()
            let totalChars = typewriter_text_length(typewriterFullText)
            typewriterAccumulator += TYPEWRITER_CHARS_PER_SEC * dt
            while (typewriterCharCount < totalChars && typewriterAccumulator >= 1.0) {
                typewriterCharCount++
                typewriterAccumulator -= 1.0
            }
            questionTextNode?.UIText.text = typewriter_text_slice(typewriterFullText, typewriterCharCount)
            if (typewriterCharCount >= totalChars) {
                finish_typewriter()
            }
            return
        }

        if (dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_post_response_hold()
                return
            }
            postResponseHoldTimer -= get_delta_time()
            if (postResponseHoldTimer <= 0.0) {
                finish_post_response_hold()
            }
        }
    }
}



class DefeatFlow : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (defeatPhase == DEFEAT_FADE_OUT) {
            let dt = get_delta_time()
            defeatFadeT += dt / DEFEAT_FADE_DURATION
            if (defeatFadeT >= 1.0) {
                defeatFadeT = 1.0
                set_death_fade_alpha(1.0)
                if (deathScreenNode.isAlive) {
                    deathScreenNode.isActive = true
                    set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, 0.0))
                }
                defeatPhase = DEFEAT_SHOW_SCREEN
                deathSummaryTimer = 0.0
                deathSummaryFadeT = 0.0
            } else {
                set_death_fade_alpha(defeatFadeT)
            }
            return
        }

        if (defeatPhase == DEFEAT_SHOW_SCREEN) {
            let dt = get_delta_time()
            deathSummaryFadeT += dt / DEFEAT_FADE_DURATION
            let screenT = clamp(deathSummaryFadeT, 0.0, 1.0)
            set_death_fade_alpha(lerp(1.0, 0.0, screenT))
            if (deathScreenNode.isAlive) {
                set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, screenT))
            }
            if (screenT >= 1.0) {
                deathSummaryTimer += dt
                if (deathSummaryTimer >= DEATH_SUMMARY_DELAY) {
                    defeatPhase = DEFEAT_SHOW_SUMMARY
                    update_death_summary_text()
                    if (deathSummaryRoot.isAlive) {
                        deathSummaryRoot.isActive = true
                    }
                    deathSummaryFadeT = 0.0
                }
            }
            return
        }

        if (defeatPhase == DEFEAT_SHOW_SUMMARY) {
            let dt = get_delta_time()
            deathSummaryFadeT += dt / DEATH_SUMMARY_FADE_DURATION
            if (deathSummaryFadeT >= 1.0) {
                deathSummaryFadeT = 1.0
            }
            set_death_summary_alpha(deathSummaryFadeT)
        }
    }
}



class ParallelHandoffFlow : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (!parallelHandoffActive || incomingEnterFinished) {
            return
        }
        if (can_skip_game_animations() && intro_any_input_pressed()) {
            finish_parallel_incoming_enter()
            return
        }
        update_parallel_incoming_visitor(get_delta_time())
    }
}



class CharacterVisualPrep : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (!gameBootstrapComplete) {
            return
        }
        let onMainMenu = screenPhase == SCREEN_MAIN_MENU
        let activePath = onMainMenu ? "" : texture_path_for(characterTexture)
        let priorityPath = onMainMenu ? "" : incoming_character_body_path()
        tick_character_visual_prep(activePath, priorityPath)
    }
}



class CameraZoom : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (cameraZoomPhase == CAM_ZOOM_OUT) {
            let dt = get_delta_time()
            cameraZoomT -= CAMERA_ZOOM_SPEED * dt
            if (cameraZoomT <= 0.0) {
                cameraZoomT = 0.0
                apply_camera_zoom()
                zoomOutFinished = true
                cameraZoomPhase = CAM_ZOOM_IDLE
                try_advance_to_wait()
            } else {
                apply_camera_zoom()
            }
            return
        }

        if (cameraZoomPhase == CAM_ZOOM_IN) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_camera_zoom_in()
                return
            }
            let dt = get_delta_time()
            cameraZoomT += CAMERA_ZOOM_SPEED * dt
            if (cameraZoomT >= 1.0) {
                finish_camera_zoom_in()
            } else {
                apply_camera_zoom()
            }
        }
    }
}



class StatBarDisplay : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        update_stat_bar_anims(get_delta_time())
    }
}



class MenuInput : Component {
    def override on_update {
        for (cmd in get_input_command_buffer()) {
            match (cmd) {
                if (RawKeyboardInputEvent(kind = RawKeyboardInputEventKind.KeyDown, buttonIdx = $v(buttonIdx))) {
                    if (buttonIdx == KeyCode.Escape) {
                        if (is_on_main_menu()) {
                            if (mainMenuOptionsAnimPhase == MENU_ANIM_OPEN || mainMenuOptionsAnimPhase == MENU_ANIM_OPENING) {
                                close_main_menu_options()
                            }
                            return
                        }
                        if (is_in_defeat_flow()) {
                            return
                        }
                        // Esc backs out of the Advisor panel, closing its confirmation first.
                        if (is_advisor_popup_open()) {
                            if (advisorConfirmOverlay.isAlive && advisorConfirmOverlay.isActive) {
                                hide_advisor_confirm()
                            } elif (advisorPopupAnimPhase != ADVISOR_ANIM_CLOSING) {
                                close_advisor_popup()
                            }
                            return
                        }
                        if (characterProfileAnimPhase == PROFILE_ANIM_OPEN || characterProfileAnimPhase == PROFILE_ANIM_OPENING) {
                            close_character_profile()
                        } elif (menuAnimPhase == MENU_ANIM_OPEN || menuAnimPhase == MENU_ANIM_OPENING) {
                            close_pause_menu()
                        } elif (menuAnimPhase == MENU_ANIM_IDLE && characterProfileAnimPhase == PROFILE_ANIM_IDLE) {
                            open_pause_menu()
                        }
                    }
                }
            }
        }
    }
}



class DialogueLayout : Component {
    def override on_update {
        if (!dialogueRoot.isAlive || !dialogueRoot.isActive) {
            return
        }
        let zoomAnimating = cameraZoomPhase != CAM_ZOOM_IDLE
        let typewriting = dialogPhase == DIALOG_TYPEWRITER
        let choosing = dialogPhase == DIALOG_CHOOSING
        let postResponse = dialogPhase == DIALOG_POST_RESPONSE_HOLD
        if (!dialogueLayoutDirty && !zoomAnimating && !typewriting && !choosing && !postResponse) {
            return
        }
        apply_dialogue_layout()
    }
}



class AnswerChoiceHover : Component {
    def override on_update {
        if (dialogPhase != DIALOG_CHOOSING || is_game_paused()) {
            return
        }
        let dt = get_delta_time()
        let choiceCount = visible_choice_count(get_current_dialogue_node())

        for (i in range(MAX_CHOICES)) {
            let target = (hoveredChoice == i && i < choiceCount) ? 1.0 : 0.0
            choiceHoverT[i] = move_toward(choiceHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            let btn = choiceButtonNodes[i]
            if (btn.isAlive && i < choiceCount) {
                apply_menu_button_visual(btn, choiceHoverT[i], true)
            }
        }
    }
}



class MainMenuButtonHover : Component {
    def override on_update {
        if (!is_on_main_menu()) {
            return
        }
        let dt = get_delta_time()
        mainMenuDecorTime += dt
        apply_main_menu_background_zoom()
        let btnW = main_menu_button_width()
        let btnH = ui_h(MAIN_MENU_BUTTON_HEIGHT)
        let innerW = btnW - 2.0 * ui_box_border()
        for (i in range(MAIN_MENU_BUTTON_COUNT)) {
            let enabled = is_main_menu_button_enabled(i)
            let target = (enabled && mainMenuButtonHovered[i]) ? 1.0 : 0.0
            mainMenuButtonHoverT[i] = move_toward(mainMenuButtonHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            let btn = mainMenuButtonNodes[i]
            if (btn.isAlive) {
                apply_main_menu_button_visual(btn, mainMenuButtonHoverT[i], enabled)
                update_main_menu_button_shine(i, innerW, btnH, mainMenuButtonHoverT[i], enabled)
            }
        }
    }
}



class MenuButtonHover : Component {
    def override on_update {
        let onMainMenu = is_on_main_menu()
        let pauseMenuOpen = is_pause_menu_open()
        if (onMainMenu && !pauseMenuOpen) {
            return
        }
        let dt = get_delta_time()

        let pauseTarget = (!is_in_defeat_flow() && !is_on_main_menu() && menuButtonHovered) ? 1.0 : 0.0
        menuButtonHoverT = move_toward(menuButtonHoverT, pauseTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuButtonNode.isAlive) {
            apply_menu_button_visual(menuButtonNode, menuButtonHoverT, true)
        }

        let advisorTarget = ((can_open_advisor_popup() || is_advisor_popup_open()) && advisorButtonHovered) ? 1.0 : 0.0
        advisorButtonHoverT = move_toward(advisorButtonHoverT, advisorTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (advisorButtonNode.isAlive) {
            apply_menu_button_visual(advisorButtonNode, advisorButtonHoverT, can_open_advisor_popup() || is_advisor_popup_open())
        }

        let continueTarget = (is_pause_menu_open() && menuContinueButtonHovered) ? 1.0 : 0.0
        menuContinueButtonHoverT = move_toward(menuContinueButtonHoverT, continueTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuContinueButtonNode.isAlive) {
            apply_menu_button_visual(menuContinueButtonNode, menuContinueButtonHoverT, true)
        }

        let exitTarget = (is_pause_menu_open() && menuExitButtonHovered) ? 1.0 : 0.0
        menuExitButtonHoverT = move_toward(menuExitButtonHoverT, exitTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuExitButtonNode.isAlive) {
            apply_menu_button_visual(menuExitButtonNode, menuExitButtonHoverT, true)
        }
    }
}



class CharacterProfileButtonHover : Component {
    def override on_update {
        let dt = get_delta_time()
        let okayTarget = (is_character_profile_open() && characterProfileOkayHovered) ? 1.0 : 0.0
        characterProfileOkayHoverT = move_toward(characterProfileOkayHoverT, okayTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (characterProfileOkayButtonNode.isAlive) {
            apply_profile_okay_button_visual(characterProfileOkayHoverT)
        }
    }
}



class MainMenuOptionsButtonHover : Component {
    def override on_update {
        let dt = get_delta_time()
        let backTarget = (is_main_menu_options_open() && mainMenuOptionsBackButtonHovered) ? 1.0 : 0.0
        mainMenuOptionsBackButtonHoverT = move_toward(mainMenuOptionsBackButtonHoverT, backTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (mainMenuOptionsBackButtonNode.isAlive) {
            apply_menu_button_visual(mainMenuOptionsBackButtonNode, mainMenuOptionsBackButtonHoverT, true)
        }
    }
}



class InfoTooltipDisplay : Component {
    lastLayoutTarget : int = INFO_HOVER_NONE
    lastLayoutSignature : string = ""

    def override on_update {
        if (hoveredInfoTarget == INFO_HOVER_NONE) {
            lastLayoutTarget = INFO_HOVER_NONE
            lastLayoutSignature = ""
            return
        }
        if (is_game_paused() || is_in_defeat_flow()) {
            hide_info_tooltip()
            lastLayoutTarget = INFO_HOVER_NONE
            lastLayoutSignature = ""
            return
        }
        update_info_tooltip_content()
        let signature = info_tooltip_layout_signature(hoveredInfoTarget)
        if (hoveredInfoTarget != lastLayoutTarget || signature != lastLayoutSignature) {
            resize_info_tooltip_panel()
            position_info_tooltip(hoveredInfoTarget)
            lastLayoutTarget = hoveredInfoTarget
            lastLayoutSignature = signature
        }
    }
}


//////////////////////////////// Feedback hooks ////////////////////////////////

def public juice_node_center(node : NodeId) : float2 {
    let res = float2(get_resolution())
    let world = node.worldPosition
    var center = float2(world.x + res.x * 0.5, res.y * 0.5 - world.y)
    get_component(node) $(var frame : UIFrame?) {
        center += (float2(0.5, 0.5) - frame.pivot) * frame.size
    }
    return center
}


def public juice_apply_fonts() {
    for (i in range(JUICE_MAX_FLOATERS)) {
        apply_dialogue_font(juice_floater_node(i))
    }
    apply_ui_font(juice_banner_title_node())
    apply_dialogue_font(juice_banner_text_node())
    apply_ui_font(optionsReduceEffectsLabelNode)
    apply_ui_font(menuTitleNode)
    apply_ui_font(aboutTitleNode)
    apply_dialogue_font(aboutBodyNode)
    apply_dialogue_font(aboutCreditsNode)
    apply_ui_font(menuTitleShadowNode)
    apply_dialogue_font(menuRecordNode)
    apply_dialogue_font(topInfoCenterTextNode)
    for (i in range(TOP_INFO_CHIP_COUNT)) {
        apply_dialogue_font(topInfoChipLabelNodes[i])
        apply_dialogue_font(topInfoChipValueNodes[i])
    }
}


def public juice_on_choice_selected(choiceIdx : int) {
    if (choiceIdx >= 0 && choiceIdx < MAX_CHOICES && choiceButtonNodes[choiceIdx].isAlive) {
        fx_gold_burst(juice_node_center(choiceButtonNodes[choiceIdx]), 8, 0.6)
    }
}


def public juice_on_stat_deltas(deltas : int[STAT_COUNT]) {
    var totalLoss = 0
    var totalGain = 0
    for (i in range(STAT_COUNT)) {
        if (deltas[i] == 0 || !statUnlocked[i] || !statColumnNodes[i].isAlive || !statColumnNodes[i].isActive) {
            continue
        }
        let pos = juice_node_center(statColumnNodes[i])
        if (deltas[i] > 0) {
            totalGain += deltas[i]
            juice_float_text(pos, "+{deltas[i]}", JUICE_COLOR_POSITIVE_TEXT)
            fx_gold_burst(pos, 6 + deltas[i] / 2, 0.8)
        } else {
            totalLoss -= deltas[i]
            juice_float_text(pos, "{deltas[i]}", JUICE_COLOR_NEGATIVE_TEXT)
            fx_red_shards(pos, 6 - deltas[i] / 2, 0.8)
        }
    }
    if (totalLoss > 0) {
        // Scaled to the size of the blow: a scratch barely moves the room.
        juice_add_trauma(saturate(float(totalLoss) / 45.0) * 0.5)
        if (totalLoss >= 15) {
            juice_flash(float4(0.55, 0.04, 0.02, saturate(float(totalLoss) / 60.0) * 0.32))
        }
    }
}


def public juice_on_fatal_choice(statIdx : int) {
    juice_add_trauma(0.85)
    juice_flash(float4(0.6, 0.03, 0.02, 0.55))
    if (statIdx >= 0 && statColumnNodes[statIdx].isAlive) {
        fx_red_shards(juice_node_center(statColumnNodes[statIdx]), 34, 1.5)
    }
}


def public juice_on_defeat_fade() {
    juice_play_sfx(JUICE_SFX_THUD, 0.8)
    juice_add_trauma(0.45)
}


def public juice_on_character_arrived() {
    if (!characterRoot.isAlive) {
        return
    }
    let res = float2(get_resolution())
    let floorY = res.y - ui_h(BOTTOM_BAR_HEIGHT)
    fx_dust_puff(float2(juice_node_center(characterRoot).x, floorY), 10)
    juice_play_pending_celebration()
}


def public juice_on_advisor_purchase(actionIdx : int) {
    juice_play_sfx(JUICE_SFX_COIN)
    juice_flash(float4(1.0, 0.82, 0.36, 0.14))
    if (advisorActionSlotNodes[actionIdx].isAlive) {
        fx_gold_burst(juice_node_center(advisorActionSlotNodes[actionIdx]), 30, 1.3)
    }
}


def public reign_milestone_title(day : int) : string {
    return is_russian() ? "День {day}" : "Day {day}"
}


def public reign_milestone_text(day : int) : string {
    let en = fixed_array(
        "The Chronicle notes that you still breathe. Advisors stand ready.",
        "The court has stopped counting the days until your fall. Advisors stand ready.",
        "A season survived. The heralds learn your name. Advisors stand ready.",
        "Your coin is accepted without a second look. Advisors stand ready.",
        "Children born this year have known no other king. Advisors stand ready.",
        "Half a year. Your enemies are revising their plans. Advisors stand ready.",
        "Ambassadors bow lower than they did. Advisors stand ready.",
        "The old king's portraits are quietly coming down. Advisors stand ready.",
        "The realm has begun to mistake you for permanent. Advisors stand ready.",
        "Songs are sung of you, and some are even kind. Advisors stand ready.",
        "Deep winter finds you still on the throne. Advisors stand ready.",
        "A full year on the throne. The crown is yours by every measure that matters."
    )
    let ru = fixed_array(
        "Летопись отмечает, что вы ещё дышите. Советники наготове.",
        "Двор перестал считать дни до вашего падения. Советники наготове.",
        "Сезон пережит. Глашатаи выучили ваше имя. Советники наготове.",
        "Вашу монету принимают не глядя. Советники наготове.",
        "Рождённые в этом году не знали другого короля. Советники наготове.",
        "Полгода. Враги пересматривают свои планы. Советники наготове.",
        "Послы кланяются ниже, чем прежде. Советники наготове.",
        "Портреты старого короля тихо снимают со стен. Советники наготове.",
        "Королевство начинает считать вас постоянным. Советники наготове.",
        "О вас поют песни, и некоторые даже добрые. Советники наготове.",
        "Глубокая зима застаёт вас на троне. Советники наготове.",
        "Целый год на троне. Корона ваша по всем мерам, что имеют значение."
    )
    let idx = clamp(day / REIGN_MILESTONE_INTERVAL - 1, 0, 11)
    return is_russian() ? ru[idx] : en[idx]
}


def public is_reign_milestone_day(day : int) : bool {
    return day == 365 || (day > 0 && day % REIGN_MILESTONE_INTERVAL == 0)
}


// Each milestone clears every advisor cooldown, so surviving pays off in play.
def public reign_milestone_grant_reward() {
    reset_advisor_action_state()
    advisorActionUsedToday = false
}


def public juice_on_day_advanced() {
    juice_pop_node(dayTextNode, 0.45)
    if (is_reign_milestone_day(currentDay)) {
        // The reward applies now. Presentation waits for the next visitor, because
        // milestone days can open a story cutscene that would hide the banner.
        reign_milestone_grant_reward()
        juicePendingCelebration = CELEBRATION_MILESTONE
    } elif (recordDays > 0 && currentDay == recordDays + 1) {
        juicePendingCelebration = CELEBRATION_RECORD
    }
}


def public juice_play_pending_celebration() {
    if (juicePendingCelebration == CELEBRATION_MILESTONE) {
        juice_play_sfx(JUICE_SFX_FANFARE)
        fx_confetti(60)
        juice_flash(float4(1.0, 0.82, 0.36, 0.2))
        juice_show_banner(reign_milestone_title(currentDay), reign_milestone_text(currentDay))
    } elif (juicePendingCelebration == CELEBRATION_RECORD) {
        juice_play_sfx(JUICE_SFX_FANFARE, 0.8)
        fx_confetti(36)
        juice_show_banner(
            is_russian() ? "Новый рекорд" : "A New Record",
            is_russian() ? "Вы правите дольше, чем когда-либо прежде." : "You have now reigned longer than ever before."
        )
    }
    juicePendingCelebration = CELEBRATION_NONE
}


// Tracks state that has no single event: hover changes and how close the realm is to ruin.
def public juice_update_game_feedback() {
    update_intro_ken_burns(get_delta_time())
    update_death_screen_motion(get_delta_time())
    update_intro_skip_hint_fade(get_delta_time())
    update_top_info(get_delta_time())
    update_about_panel(get_delta_time())
    update_stat_popup(get_delta_time())
    update_choice_cursors()
    if (optionsSliderRedrawFrames > 0) {
        optionsSliderRedrawFrames--
        init_options_slider(mainMenuOptionsMasterSliderNode, settingsMasterVolume)
        init_options_slider(mainMenuOptionsMusicSliderNode, settingsMusicVolume)
    }
    if (hoveredChoice != juiceLastHoveredChoice) {
        juiceLastHoveredChoice = hoveredChoice
        if (hoveredChoice >= 0) {
            juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
        }
    }
    var danger = 0.0
    if (gameBootstrapComplete && !is_on_main_menu() && !is_startup_splash_active() && !is_story_cutscene_active() && !is_in_defeat_flow()) {
        for (i in range(STAT_COUNT)) {
            if (statUnlocked[i]) {
                danger = max(danger, saturate((JUICE_DANGER_STAT_THRESHOLD - float(kingdomStats[i])) / JUICE_DANGER_STAT_THRESHOLD))
            }
        }
    }
    juice_set_danger(danger)
    var speaker = ""
    if (questionNameNode.isAlive) {
        get_component(questionNameNode) $(var nameText : UIText?) {
            speaker = nameText.text
        }
    }
    let talking = gameBootstrapComplete && dialogPhase == DIALOG_TYPEWRITER && !is_game_paused()
    juice_voice_update(talking, speaker, get_delta_time())
}


def public options_reduce_effects() : string {
    return is_russian() ? "Меньше эффектов" : "Reduce effects"
}


def public reduce_effects_fill_color() : float4 {
    return juiceReduceEffects ? THEME_BUTTON_DARK_HOVER : THEME_BUTTON_DARK
}


def public create_options_reduce_effects_toggle() : NodeId {
    let border = ui_box_border()
    let boxSize = ui_h(OPTIONS_CHECKBOX_SIZE)
    let fillNode = panel(float2(boxSize, boxSize), [])
    fillNode.name = "optionsReduceEffectsFill"
    set_frame_pivot(fillNode, float2(0.0, 0.0))
    set_image_color(fillNode, reduce_effects_fill_color())
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = juiceReduceEffects ? "X" : "",
        fontSize = ui_h(OPTIONS_TOGGLE_FONT_SIZE),
        color = THEME_TEXT_ON_GOLD
    ))
    configure_options_control_text(fillNode)
    sync_options_control_label_frame(fillNode, float2(boxSize, boxSize))
    apply_ui_font(fillNode)
    fillNode?.UIButton.onClick = @() {
        juiceReduceEffects = !juiceReduceEffects
        juice_play_sfx(JUICE_SFX_CLICK, 0.8)
        let fill = get_child(optionsReduceEffectsToggleNode, 0)
        fill?.UIText.text = juiceReduceEffects ? "X" : ""
        set_image_color(fill, reduce_effects_fill_color())
        save_game_options()
    }
    let outer = boxSize + 2.0 * border
    let borderNode = panel(float2(outer, outer), [fillNode])
    borderNode.name = "optionsReduceEffectsToggle"
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pivot(borderNode, float2(0.0, 0.5))
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}


def public create_options_reduce_effects_row() : NodeId {
    let labelNode = create_options_label(options_reduce_effects())
    labelNode.name = "optionsReduceEffectsLabel"
    optionsReduceEffectsLabelNode = labelNode
    optionsReduceEffectsToggleNode = create_options_reduce_effects_toggle()
    let spacer = panel(float2(1.0, ui_h(OPTIONS_ROW_HEIGHT)), [])
    set_image_color(spacer, float4(0.0, 0.0, 0.0, 0.0))
    let slot = hbox([spacer, optionsReduceEffectsToggleNode])
    set_alignment(slot, LayoutAlignment.MiddleLeft)
    set_frame_size(slot, float2(ui_w(options_control_column_width()), ui_h(OPTIONS_ROW_HEIGHT)))
    slot?.UIHorizontalLayout.childForceExpandWidth = false
    slot?.UIHorizontalLayout.childForceExpandHeight = false
    let row = hbox([labelNode, slot])
    row.name = "optionsReduceEffectsRow"
    set_spacing(row, ui_w(OPTIONS_ROW_LABEL_GAP))
    set_alignment(row, LayoutAlignment.MiddleLeft)
    set_frame_size(row, float2(ui_w(OPTIONS_ROW_WIDTH), ui_h(OPTIONS_ROW_HEIGHT)))
    row?.UIHorizontalLayout.childForceExpandWidth = false
    row?.UIHorizontalLayout.childForceExpandHeight = false
    return row
}


//////////////////////////////// Top bar information ////////////////////////////////

def public reign_season_name(day : int) : string {
    let idx = clamp((day - 1) / REIGN_SEASON_DAYS, 0, 3)
    if (idx == 0) {
        return loc("Spring", "Весна")
    } elif (idx == 1) {
        return loc("Summer", "Лето")
    } elif (idx == 2) {
        return loc("Autumn", "Осень")
    }
    return loc("Winter", "Зима")
}


def public weakest_unlocked_stat_idx() : int {
    var best = -1
    for (i in range(STAT_COUNT)) {
        if (statUnlocked[i] && (best < 0 || kingdomStats[i] < kingdomStats[best])) {
            best = i
        }
    }
    return best
}


def public realm_mood_text(weakest : int) : string {
    if (weakest < 0 || kingdomStats[weakest] >= 50) {
        return loc("Stable", "Стабильна")
    } elif (kingdomStats[weakest] >= 30) {
        return loc("Uneasy", "Неспокойна")
    } elif (kingdomStats[weakest] >= 15) {
        return loc("Troubled", "В смуте")
    }
    return loc("Crumbling", "Рушится")
}


def public realm_mood_color(weakest : int) : float4 {
    var col = float4(0.6, 0.9, 0.5, 1.0)
    if (weakest >= 0 && kingdomStats[weakest] < 15) {
        col = float4(1.0, 0.38, 0.3, 1.0)
    } elif (weakest >= 0 && kingdomStats[weakest] < 30) {
        col = float4(1.0, 0.6, 0.28, 1.0)
    } elif (weakest >= 0 && kingdomStats[weakest] < 50) {
        col = float4(1.0, 0.84, 0.42, 1.0)
    }
    return col
}


def private top_info_text(name : string; color : float4) : NodeId {
    let node = text("")
    node.name = name
    set_text_color(node, color)
    apply_dialogue_font(node)
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = false
    node?.UIText.horAlignment = TextHorAlignment.Center
    node?.UIText.vertAlignment = TextVertAlignment.Middle
    set_frame_pivot(node, float2(0.5, 0.5))
    set_parent(node, topBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(node, float2(0.0, 0.5))
    return node
}


def public build_top_info() {
    topInfoCenterTextNode = top_info_text("topInfoCenterText", THEME_PARCHMENT)

    topInfoProgressTrackNode = panel(float2(1.0, 1.0), [])
    topInfoProgressTrackNode.name = "topInfoProgressTrack"
    theme_set_image(topInfoProgressTrackNode, THEME_TEX_PILL, THEME_TRACK, 0.0)
    set_frame_pivot(topInfoProgressTrackNode, float2(0.5, 0.5))
    set_parent(topInfoProgressTrackNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(topInfoProgressTrackNode, float2(0.0, 0.5))

    topInfoProgressFillNode = panel(float2(1.0, 1.0), [])
    topInfoProgressFillNode.name = "topInfoProgressFill"
    theme_set_image(topInfoProgressFillNode, THEME_TEX_PILL, THEME_TRACK_FILL, 0.0)
    topInfoProgressFillNode?.UIImage.fillMode = FillMode.Horizontal
    set_frame_pivot(topInfoProgressFillNode, float2(0.0, 0.0))
    set_parent(topInfoProgressFillNode, topInfoProgressTrackNode, AddChildStrategy.KeepLocalTransform)

    for (i in range(TOP_INFO_CHIP_COUNT)) {
        topInfoChipLabelNodes[i] = top_info_text("topInfoChipLabel_{i}", THEME_GOLD_DIM)
        topInfoChipValueNodes[i] = top_info_text("topInfoChipValue_{i}", THEME_PARCHMENT)
        let rule = panel(float2(1.0, 1.0), [])
        rule.name = "topInfoChipRule_{i}"
        theme_set_kit(rule, KIT_DIAMOND)
        set_frame_pivot(rule, float2(0.5, 0.5))
        set_parent(rule, topBarRoot, AddChildStrategy.KeepLocalTransform)
        add_anchor(rule, float2(0.0, 0.5))
        topInfoChipRuleNodes[i] = rule
    }
    apply_top_info_layout()
    topInfoRefreshTimer = 0.0
}


def public apply_top_info_layout() {
    if (!topInfoCenterTextNode.isAlive) {
        return
    }
    let centerX = ui_w(TOP_INFO_CENTER_X)
    let centerW = ui_w(TOP_INFO_CENTER_WIDTH)
    set_text_font_size(topInfoCenterTextNode, ui_h(TOP_INFO_VALUE_FONT_SIZE))
    set_frame_size(topInfoCenterTextNode, float2(centerW, ui_h(30.0)))
    set_anchor_insets(topInfoCenterTextNode, centerX, -ui_h(11.0))

    let barSize = float2(centerW, ui_h(11.0))
    set_frame_size(topInfoProgressTrackNode, barSize)
    topInfoProgressTrackNode?.UIImage.size = barSize
    set_anchor_insets(topInfoProgressTrackNode, centerX, ui_h(17.0))
    set_frame_size(topInfoProgressFillNode, barSize)
    topInfoProgressFillNode?.UIImage.size = barSize

    for (i in range(TOP_INFO_CHIP_COUNT)) {
        let chipX = ui_w(TOP_INFO_CHIPS_START_X + TOP_INFO_CHIP_WIDTH * (float(i) + 0.5))
        let chipSize = float2(ui_w(TOP_INFO_CHIP_WIDTH - 8.0), ui_h(28.0))
        set_text_font_size(topInfoChipLabelNodes[i], ui_h(TOP_INFO_LABEL_FONT_SIZE))
        set_frame_size(topInfoChipLabelNodes[i], chipSize)
        set_anchor_insets(topInfoChipLabelNodes[i], chipX, -ui_h(14.0))
        set_text_font_size(topInfoChipValueNodes[i], ui_h(TOP_INFO_VALUE_FONT_SIZE))
        set_frame_size(topInfoChipValueNodes[i], chipSize)
        set_anchor_insets(topInfoChipValueNodes[i], chipX, ui_h(12.0))
        let gem = float2(52.0, 62.0) * theme_kit_scale() * 0.42
        set_frame_size(topInfoChipRuleNodes[i], gem)
        topInfoChipRuleNodes[i]?.UIImage.size = gem
        set_anchor_insets(topInfoChipRuleNodes[i], ui_w(TOP_INFO_CHIPS_START_X + TOP_INFO_CHIP_WIDTH * float(i)), 0.0)
    }
}


def public update_top_info(dt : float) {
    if (!topInfoCenterTextNode.isAlive || !topBarRoot.isAlive || !topBarRoot.isActive) {
        return
    }
    topInfoRefreshTimer -= dt
    if (topInfoRefreshTimer > 0.0) {
        return
    }
    topInfoRefreshTimer = TOP_INFO_REFRESH_SECONDS

    topInfoCenterTextNode?.UIText.text = "{reign_season_name(currentDay)}  ·  {loc("Day", "День")} {currentDay} {loc("of", "из")} {REIGN_TOTAL_DAYS}"
    topInfoProgressFillNode?.UIImage.fillAmount = clamp(float(currentDay) / float(REIGN_TOTAL_DAYS), 0.0, 1.0)

    let weakest = weakest_unlocked_stat_idx()
    topInfoChipLabelNodes[0]?.UIText.text = loc("Realm", "Держава")
    topInfoChipValueNodes[0]?.UIText.text = realm_mood_text(weakest)
    topInfoChipValueNodes[0]?.UIText.color = realm_mood_color(weakest)

    topInfoChipLabelNodes[1]?.UIText.text = loc("Weakest", "Слабее всего")
    topInfoChipValueNodes[1]?.UIText.text = (weakest >= 0) ? stat_display_name(weakest) : "-"

    let advisorReady = !advisorActionUsedToday
    topInfoChipLabelNodes[2]?.UIText.text = loc("Advisor", "Советник")
    topInfoChipValueNodes[2]?.UIText.text = advisorReady ? loc("Ready", "Готов") : loc("Used today", "Занят")
    topInfoChipValueNodes[2]?.UIText.color = advisorReady ? float4(0.6, 0.9, 0.5, 1.0) : THEME_GOLD_DIM

    topInfoChipLabelNodes[3]?.UIText.text = loc("Longest reign", "Рекорд")
    topInfoChipValueNodes[3]?.UIText.text = (recordDays > 0) ? "{recordDays} {loc("days", "дн.")}" : "-"
}


//////////////////////////////// Main menu title ////////////////////////////////

def public refresh_menu_title_text() {
    // The game's name stays in English in every language.
    let title = "The Weight of the Crown"
    if (menuTitleNode.isAlive) {
        menuTitleNode?.UIText.text = title
        menuTitleShadowNode?.UIText.text = title
    }
    if (menuRecordNode.isAlive) {
        menuRecordNode?.UIText.text = (recordDays > 0) ? "{loc("Longest reign", "Рекорд правления")}: {recordDays} {loc("days", "дн.")}" : loc("Survive 365 days on a stolen throne", "Продержитесь 365 дней на украденном троне")
    }
}


def public apply_menu_title_layout() {
    if (!menuTitleNode.isAlive) {
        return
    }
    let res = float2(get_resolution())
    let titleSize = float2(res.x * 0.92, ui_h(MENU_TITLE_FONT_SIZE * 1.3))
    let top = ui_h(26.0)
    set_text_font_size(menuTitleNode, ui_h(MENU_TITLE_FONT_SIZE))
    set_frame_size(menuTitleNode, titleSize)
    set_anchor_insets(menuTitleNode, 0.0, top)
    set_text_font_size(menuTitleShadowNode, ui_h(MENU_TITLE_FONT_SIZE))
    set_frame_size(menuTitleShadowNode, titleSize)
    let shadow = max(2.0, ui_h(4.0))
    set_anchor_insets(menuTitleShadowNode, shadow, top + shadow)

    let ruleY = top + titleSize.y * 0.86
    let ruleSize = float2(169.0, 40.0) * theme_kit_scale() * 1.9
    set_frame_size(menuTitleRuleNode, ruleSize)
    menuTitleRuleNode?.UIImage.size = ruleSize
    set_anchor_insets(menuTitleRuleNode, 0.0, ruleY)

    set_text_font_size(menuRecordNode, ui_h(MENU_RECORD_FONT_SIZE))
    set_frame_size(menuRecordNode, float2(res.x * 0.8, ui_h(44.0)))
    // Just above the buttons, clear of the king.
    set_anchor_insets(menuRecordNode, 0.0, res.y - ui_h(MAIN_MENU_BOTTOM_BAR_HEIGHT) - ui_h(30.0))
}


def private menu_title_text(name : string; color : float4) : NodeId {
    let node = text("")
    node.name = name
    set_text_color(node, color)
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = false
    node?.UIText.horAlignment = TextHorAlignment.Center
    node?.UIText.vertAlignment = TextVertAlignment.Middle
    set_frame_pivot(node, float2(0.5, 0.0))
    set_parent(node, mainMenuRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(node, float2(0.5, 0.0))
    return node
}


def public build_menu_title() {
    let topShade = panel(float2(1.0, 1.0), [])
    topShade.name = "menuTitleShade"
    theme_set_image(topShade, THEME_TEX_FADE_DOWN, float4(1.0, 1.0, 1.0, 0.86))
    set_parent(topShade, mainMenuRoot, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(topShade, float2(0.5, 0.0))
    add_anchor(topShade, float2(0.0, 0.0), float2(1.0, 0.0))
    set_frame_size(topShade, float2(float(get_resolution().x), ui_h(330.0)))
    topShade?.UIImage.size = float2(float(get_resolution().x), ui_h(330.0))

    menuTitleShadowNode = menu_title_text("menuTitleShadow", float4(0.02, 0.01, 0.0, 0.92))
    apply_ui_font(menuTitleShadowNode)
    menuTitleNode = menu_title_text("menuTitle", THEME_GOLD)
    apply_ui_font(menuTitleNode)

    menuTitleRuleNode = panel(float2(1.0, 1.0), [])
    menuTitleRuleNode.name = "menuTitleRule"
    theme_set_kit(menuTitleRuleNode, KIT_LINE_ORNAMENT)
    menuTitleRuleNode.isActive = false
    set_frame_pivot(menuTitleRuleNode, float2(0.5, 0.0))
    set_parent(menuTitleRuleNode, mainMenuRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(menuTitleRuleNode, float2(0.5, 0.0))

    menuRecordNode = menu_title_text("menuRecord", THEME_PARCHMENT)
    apply_dialogue_font(menuRecordNode)
    refresh_menu_title_text()
    apply_menu_title_layout()
}


//////////////////////////////// Theme pass ////////////////////////////////

def public apply_ui_theme() {
    theme_ensure()
    theme_style_panel(menuPanelNode, menuPanelInnerNode)
    theme_style_panel(advisorPopupPanelNode, advisorPopupInnerNode)
    theme_style_panel(advisorConfirmPanelNode, advisorConfirmInnerNode)
    theme_style_panel(mainMenuOptionsPanelNode, mainMenuOptionsInnerNode)
    theme_style_panel(questionBorderNode, questionBoxNode)
    theme_style_panel(infoTooltipRoot, infoTooltipBoxNode)
    theme_style_panel(characterProfilePanelNode, characterProfileInnerNode)
    theme_add_corners(questionBorderNode, 0.42)
    theme_add_corners(mainMenuOptionsPanelNode)
    theme_add_corners(menuPanelNode, 0.45)
    theme_add_corners(advisorPopupPanelNode)
    theme_add_corners(characterProfilePanelNode, 0.45)
    theme_set_kit(juice_banner_node(), KIT_PANEL_NOTICE)
    build_choice_cursors()
    polish_cutscene_ui()
    build_about_ui()
    build_stat_popup_ui()

    theme_set_image(topBarRoot, THEME_TEX_BAR, float4(1.0, 1.0, 1.0, 1.0))
    theme_set_image(bottomBarRoot, THEME_TEX_BAR, float4(1.0, 1.0, 1.0, 1.0))
    theme_set_image(mainMenuBottomBarRoot, THEME_TEX_FADE_UP, float4(1.0, 1.0, 1.0, 0.96))
    if (mainMenuBottomBarBorderNode.isAlive) {
        mainMenuBottomBarBorderNode.isActive = false
    }

    theme_style_slider(mainMenuOptionsMasterSliderNode, ui_h(32.0))
    theme_style_slider(mainMenuOptionsMusicSliderNode, ui_h(32.0))
    theme_style_button_shape(optionsReduceEffectsToggleNode, get_child(optionsReduceEffectsToggleNode, 0))
    update_options_fullscreen_toggle_visual()
    update_options_language_button_visuals()

    for (btn in fixed_array(menuButtonNode, advisorButtonNode, menuContinueButtonNode, menuOptionsButtonNode, menuExitButtonNode, mainMenuOptionsBackButtonNode)) {
        apply_menu_button_visual(btn, 0.0, true)
    }
    build_menu_title()
    apply_main_menu_layout()
}


//////////////////////////////// Choice cursor ////////////////////////////////

def public build_choice_cursors() {
    let s = theme_kit_scale() * 0.8
    for (i in range(MAX_CHOICES)) {
        if (!choiceButtonNodes[i].isAlive) {
            continue
        }
        let cursor = panel(float2(57.0 * s, 55.0 * s), [])
        cursor.name = "choiceCursor_{i}"
        theme_set_kit(cursor, KIT_CHOICE_CURSOR)
        set_parent(cursor, choiceButtonNodes[i], AddChildStrategy.KeepLocalTransform)
        add_anchor(cursor, float2(0.0, 0.5))
        set_frame_pivot(cursor, float2(1.0, 0.5))
        cursor.isActive = false
        choiceCursorNodes[i] = cursor
    }
}


// The pointing hand from the kit sits beside the hovered choice and nudges toward it.
def public update_choice_cursors() {
    choiceCursorTime += get_delta_time()
    let bob = sin(choiceCursorTime * 7.0) * ui_w(5.0)
    for (i in range(MAX_CHOICES)) {
        let cursor = choiceCursorNodes[i]
        if (!cursor.isAlive) {
            continue
        }
        let show = dialogPhase == DIALOG_CHOOSING && hoveredChoice == i && !is_game_paused()
        cursor.isActive = show
        if (show) {
            set_anchor_insets(cursor, -ui_w(6.0) + bob, 0.0)
        }
    }
}


//////////////////////////////// About ////////////////////////////////

def public about_pitch_text() : string {
    return loc(
        "King Edwin is dead, and you sit on his throne. Balance the people, the church, the army and the treasury, answer every petitioner, and survive 365 days of a crown you took by force.",
        "Король Эдвин мёртв, и на его троне сидите вы. Удерживайте в равновесии народ, церковь, армию и казну, отвечайте каждому просителю и продержитесь 365 дней с короной, взятой силой.")
}


def public about_credits_text() : string {
    return loc(
        "Design and programming: Viktar Syanau (MarySue)\nLoosy Tale Studio\n\nMade for EdenSpark Game Jam #2, theme: Mass Control\nBuilt with EdenSpark and Daslang\n\nInterface: Pixel RPG Dialogue UI kit\nFire and smoke: VFX Collector Pack by Fellor / BitBlast Studio",
        "Дизайн и программирование: Viktar Syanau (MarySue)\nLoosy Tale Studio\n\nСоздано для EdenSpark Game Jam #2, тема: Mass Control\nСделано на EdenSpark и Daslang\n\nИнтерфейс: Pixel RPG Dialogue UI kit\nОгонь и дым: VFX Collector Pack, Fellor / BitBlast Studio")
}


def private about_text(name : string; color : float4; fontSize : float) : NodeId {
    let node = text("")
    node.name = name
    set_text_color(node, color)
    set_text_font_size(node, ui_h(fontSize))
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Center
    node?.UIText.vertAlignment = TextVertAlignment.Top
    set_frame_pivot(node, float2(0.5, 0.0))
    set_parent(node, aboutPanelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(node, float2(0.5, 0.0))
    return node
}


def private about_place(node : NodeId; size : float2; top : float) {
    set_frame_size(node, size)
    get_component(node) $(var anchor : UIAnchor?) {
        anchor.left = 0.0
        anchor.top = top
    }
}


def public build_about_ui() {
    let res = float2(get_resolution())
    aboutOverlayNode = panel(res, [])
    aboutOverlayNode.name = "aboutOverlay"
    set_image_color(aboutOverlayNode, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    set_parent(aboutOverlayNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(aboutOverlayNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    add_component(aboutOverlayNode, new UIButton())
    aboutOverlayNode?.UIButton.onClick = @() {
        close_about_panel()
    }
    aboutOverlayNode.isActive = false

    aboutPanelNode = panel(float2(1.0, 1.0), [])
    aboutPanelNode.name = "aboutPanel"
    theme_set_kit(aboutPanelNode, KIT_PANEL_DARK)
    set_parent(aboutPanelNode, aboutOverlayNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(aboutPanelNode, float2(0.5, 0.5))
    set_frame_pivot(aboutPanelNode, float2(0.5, 0.5))
    // Clicks on the panel itself must not reach the overlay, which closes the screen.
    add_component(aboutPanelNode, new UIButton())
    theme_add_corners(aboutPanelNode)

    aboutRibbonNode = panel(float2(1.0, 1.0), [])
    aboutRibbonNode.name = "aboutRibbon"
    theme_set_kit(aboutRibbonNode, KIT_RIBBON_RED)
    set_parent(aboutRibbonNode, aboutPanelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(aboutRibbonNode, float2(0.5, 0.0))
    set_frame_pivot(aboutRibbonNode, float2(0.5, 0.5))

    aboutTitleNode = about_text("aboutTitle", THEME_GOLD, 64.0)
    aboutTitleNode?.UIText.vertAlignment = TextVertAlignment.Middle
    aboutTitleNode?.UIText.wordWrapping = false
    set_frame_pivot(aboutTitleNode, float2(0.5, 0.5))
    apply_ui_font(aboutTitleNode)

    aboutRuleNode = panel(float2(1.0, 1.0), [])
    aboutRuleNode.name = "aboutRule"
    theme_set_kit(aboutRuleNode, KIT_LINE_ORNAMENT)
    set_parent(aboutRuleNode, aboutPanelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(aboutRuleNode, float2(0.5, 0.0))
    set_frame_pivot(aboutRuleNode, float2(0.5, 0.0))

    aboutBodyNode = about_text("aboutBody", THEME_PARCHMENT, 32.0)
    apply_dialogue_font(aboutBodyNode)
    aboutCreditsNode = about_text("aboutCredits", THEME_GOLD_DIM, 27.0)
    apply_dialogue_font(aboutCreditsNode)

    aboutCloseNode = create_menu_button(menu_back(), ui_w(360.0), ui_h(OPTIONS_BUTTON_HEIGHT), true, OPTIONS_BUTTON_FONT_SIZE)
    aboutCloseNode.name = "aboutCloseButton"
    set_parent(aboutCloseNode, aboutPanelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(aboutCloseNode, float2(0.5, 1.0))
    set_frame_pivot(aboutCloseNode, float2(0.5, 1.0))
    let fill = answer_button_fill(aboutCloseNode)
    add_ui_event_listener(fill, UIMouseEventType.MouseClick, @@on_about_close_click)
    add_ui_event_listener(fill, UIMouseEventType.MouseOver, @@on_about_close_mouse_over)
    add_ui_event_listener(fill, UIMouseEventType.MouseOut, @@on_about_close_mouse_out)
    apply_about_layout()
}


def public apply_about_layout() {
    if (!aboutPanelNode.isAlive) {
        return
    }
    let res = float2(get_resolution())
    let panelSize = float2(min(res.x * 0.62, ui_w(1180.0)), min(res.y * 0.72, ui_h(760.0)))
    set_frame_size(aboutPanelNode, panelSize)
    aboutPanelNode?.UIImage.size = panelSize
    let innerW = panelSize.x - ui_w(120.0)
    let k = theme_kit_scale()

    let ribbon = float2(391.0, 101.0) * k * 1.25
    set_frame_size(aboutRibbonNode, ribbon)
    aboutRibbonNode?.UIImage.size = ribbon
    get_component(aboutRibbonNode) $(var anchor : UIAnchor?) {
        anchor.left = 0.0
        anchor.top = ui_h(4.0)
    }
    about_place(aboutTitleNode, float2(ribbon.x, ribbon.y * 0.62), ui_h(0.0) - ribbon.y * 0.08)

    let ruleTop = ribbon.y * 0.62 + ui_h(10.0)
    let rule = float2(169.0, 40.0) * k * 1.6
    set_frame_size(aboutRuleNode, rule)
    aboutRuleNode?.UIImage.size = rule
    get_component(aboutRuleNode) $(var anchor : UIAnchor?) {
        anchor.left = 0.0
        anchor.top = ruleTop
    }
    let bodyTop = ruleTop + rule.y + ui_h(14.0)
    about_place(aboutBodyNode, float2(innerW, ui_h(190.0)), bodyTop)
    about_place(aboutCreditsNode, float2(innerW, ui_h(330.0)), bodyTop + ui_h(205.0))
    apply_menu_button_layout(aboutCloseNode, ui_w(360.0), ui_h(OPTIONS_BUTTON_HEIGHT), OPTIONS_BUTTON_FONT_SIZE, true, float2(0.5, 1.0))
    get_component(aboutCloseNode) $(var anchor : UIAnchor?) {
        anchor.left = 0.0
        anchor.top = -ui_h(40.0)
    }
    // Sit a little above centre so the panel clears the menu buttons.
    get_component(aboutPanelNode) $(var anchor : UIAnchor?) {
        anchor.top = -res.y * 0.05
    }
}


def public is_about_open() : bool {
    return aboutOpen
}


def public open_about_panel() {
    if (!aboutOverlayNode.isAlive || aboutOpen) {
        return
    }
    aboutOpen = true
    aboutCloseHovered = false
    aboutTitleNode?.UIText.text = menu_about()
    aboutBodyNode?.UIText.text = about_pitch_text()
    aboutCreditsNode?.UIText.text = about_credits_text()
    set_button_label_text(aboutCloseNode, menu_back())
    apply_ui_font(aboutTitleNode)
    apply_dialogue_font(aboutBodyNode)
    apply_dialogue_font(aboutCreditsNode)
    apply_about_layout()
    aboutOverlayNode.isActive = true
}


def public close_about_panel() {
    if (aboutOpen) {
        juice_play_sfx(JUICE_SFX_CLICK, 0.7, 0.06)
    }
    aboutOpen = false
}


def public on_about_close_click(evt : UIMouseEvent) {
    stop_propagation(evt)
    close_about_panel()
}


def public on_about_close_mouse_over(evt : UIMouseEvent) {
    if (aboutOpen) {
        aboutCloseHovered = true
        juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
    }
}


def public on_about_close_mouse_out(evt : UIMouseEvent) {
    aboutCloseHovered = false
}


// Fades the overlay and pops the panel in with a slight overshoot.
def public update_about_panel(dt : float) {
    if (!aboutOverlayNode.isAlive) {
        return
    }
    if (aboutOpen && !is_on_main_menu()) {
        aboutOpen = false
    }
    let target = aboutOpen ? 1.0 : 0.0
    aboutOpenT = move_toward(aboutOpenT, target, dt / 0.28)
    if (aboutOpenT <= 0.0 && !aboutOpen) {
        if (aboutOverlayNode.isActive) {
            aboutOverlayNode.isActive = false
        }
        return
    }
    let t = aboutOpenT
    let c1 = 1.70158
    let u = t - 1.0
    let pop = 1.0 + (c1 + 1.0) * u * u * u + c1 * u * u
    let scale = aboutOpen ? lerp(0.86, 1.0, pop) : lerp(0.94, 1.0, t)
    aboutPanelNode.localScale = float3(scale, scale, 1.0)
    set_image_color(aboutOverlayNode, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, MENU_OVERLAY_COLOR.w * t))
    set_image_color(aboutPanelNode, float4(1.0, 1.0, 1.0, t))
    aboutCloseHoverT = move_toward(aboutCloseHoverT, aboutCloseHovered ? 1.0 : 0.0, ANSWER_HOVER_LERP_SPEED * dt)
    let fill = answer_button_fill(aboutCloseNode)
    theme_apply_dark_button(fill, aboutCloseHoverT)
    if (aboutOpen && aboutOpenT >= 1.0 && ui_dismiss_key_pressed(true)) {
        close_about_panel()
    }
}


//////////////////////////////// Advisor effect icons ////////////////////////////////

def private advisor_chip_signature(deltas : int[STAT_COUNT]; sign : int) : string {
    var sig = "s{sign}"
    for (i in range(STAT_COUNT)) {
        if (deltas[i] * sign > 0) {
            sig = "{sig}|{i}:{deltas[i]}"
        }
    }
    return sig
}


// Each change reads as the stat's icon followed by its amount. The line's own text is
// hidden; the line node keeps its place in the card layout and holds the chips.
def public update_advisor_effect_chips(lineNode : NodeId; deltas : int[STAT_COUNT]; sign : int; hoverT : float; enabled : bool; fontSize : float; lineWidth : float; lineHeight : float) {
    if (!lineNode.isAlive || !lineNode.isActive) {
        return
    }
    let partCol = advisor_action_effect_part_color(sign, hoverT)
    let alpha = enabled ? 1.0 : ADVISOR_ACTION_DISABLED_ALPHA
    let textCol = float4(partCol.x, partCol.y, partCol.z, alpha)
    lineNode?.UIText.color = float4(0.0, 0.0, 0.0, 0.0)

    let sig = advisor_chip_signature(deltas, sign)
    var row = NodeId()
    var current = ""
    var inscope existing = lineNode.get_children()
    if (length(existing) > 0) {
        row = existing[0]
        current = row.name
    }
    if (current != sig) {
        if (row.isAlive) {
            remove_node(row)
        }
        let iconSize = fontSize * ADVISOR_CHIP_ICON_SCALE
        var chips : array<NodeId>
        for (i in range(STAT_COUNT)) {
            if (deltas[i] * sign <= 0) {
                continue
            }
            let icon = panel(float2(iconSize, iconSize), [])
            icon?.UIImage.textureId = statTextures[i]
            let amount = text((deltas[i] > 0) ? "+{deltas[i]}" : "{deltas[i]}")
            set_text_font_size(amount, fontSize)
            apply_dialogue_font(amount)
            amount?.UIText.wordWrapping = false
            amount?.UIText.autoResizeFrame = true
            let chip = hbox([icon, amount])
            set_spacing(chip, ui_w(4.0))
            set_alignment(chip, LayoutAlignment.MiddleLeft)
            set_frame_size(chip, float2(iconSize * 3.2, lineHeight))
            chip?.UIHorizontalLayout.childForceExpandWidth = false
            chip?.UIHorizontalLayout.childForceExpandHeight = false
            push(chips, chip)
        }
        row = hbox(chips)
        row.name = sig
        set_spacing(row, ui_w(10.0))
        set_alignment(row, LayoutAlignment.MiddleLeft)
        row?.UIHorizontalLayout.childForceExpandWidth = false
        row?.UIHorizontalLayout.childForceExpandHeight = false
        set_parent(row, lineNode, AddChildStrategy.KeepLocalTransform)
        add_anchor(row, float2(0.0, 0.0))
        set_frame_pivot(row, float2(0.0, 0.0))
    }
    set_frame_size(row, float2(lineWidth, lineHeight))
    var inscope chipNodes = row.get_children()
    for (chip in chipNodes) {
        let icon = get_child(chip, 0)
        set_image_color(icon, float4(1.0, 1.0, 1.0, alpha))
        let amount = get_child(chip, 1)
        amount?.UIText.color = textCol
    }
}


//////////////////////////////// Modal panels ////////////////////////////////

// The stat pop-up's shape: a dimmed overlay holding a framed panel with a ribbon title.
def private build_modal_shell(name : string; var overlay : NodeId&; var ribbon : NodeId&; var title : NodeId&) : NodeId {
    let res = float2(get_resolution())
    overlay = panel(res, [])
    overlay.name = "{name}Overlay"
    set_image_color(overlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    set_parent(overlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(overlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    add_component(overlay, new UIButton())
    overlay.isActive = false

    let panelNode = panel(float2(1.0, 1.0), [])
    panelNode.name = "{name}Panel"
    theme_set_kit(panelNode, KIT_PANEL_DARK)
    set_parent(panelNode, overlay, AddChildStrategy.KeepLocalTransform)
    add_anchor(panelNode, float2(0.5, 0.5))
    set_frame_pivot(panelNode, float2(0.5, 0.5))
    add_component(panelNode, new UIButton())
    theme_add_corners(panelNode)

    ribbon = panel(float2(1.0, 1.0), [])
    ribbon.name = "{name}Ribbon"
    theme_set_kit(ribbon, KIT_RIBBON_RED)
    set_parent(ribbon, panelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(ribbon, float2(0.5, 0.0))
    set_frame_pivot(ribbon, float2(0.5, 0.5))

    title = text("")
    title.name = "{name}Title"
    set_text_color(title, THEME_GOLD)
    title?.UIText.autoResizeFrame = false
    title?.UIText.wordWrapping = false
    title?.UIText.horAlignment = TextHorAlignment.Center
    title?.UIText.vertAlignment = TextVertAlignment.Middle
    set_frame_pivot(title, float2(0.5, 0.5))
    set_parent(title, panelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(title, float2(0.5, 0.0))
    apply_ui_font(title)
    return panelNode
}


def private modal_text(parent : NodeId; name : string; color : float4) : NodeId {
    let node = text("")
    node.name = name
    set_text_color(node, color)
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Center
    node?.UIText.vertAlignment = TextVertAlignment.Top
    set_frame_pivot(node, float2(0.5, 0.0))
    set_parent(node, parent, AddChildStrategy.KeepLocalTransform)
    add_anchor(node, float2(0.5, 0.0))
    apply_dialogue_font(node)
    return node
}


def private modal_inset(node : NodeId; left : float; top : float) {
    get_component(node) $(var anchor : UIAnchor?) {
        anchor.left = left
        anchor.top = top
    }
}


def private layout_modal_header(panelNode : NodeId; ribbon : NodeId; title : NodeId; panelSize : float2) {
    set_frame_size(panelNode, panelSize)
    panelNode?.UIImage.size = panelSize
    let k = theme_kit_scale()
    let ribbonSize = float2(391.0, 101.0) * k * 1.35
    set_frame_size(ribbon, ribbonSize)
    ribbon?.UIImage.size = ribbonSize
    modal_inset(ribbon, 0.0, ui_h(4.0))
    set_text_font_size(title, ui_h(52.0))
    set_frame_size(title, float2(ribbonSize.x * 0.8, ribbonSize.y * 0.6))
    modal_inset(title, 0.0, -ribbonSize.y * 0.08)
}


// Overlay fade and an overshoot pop for an open modal; returns the eased amount.
def private animate_modal(overlay : NodeId; panelNode : NodeId; isOpen : bool; var openT : float&; dt : float) : float {
    openT = move_toward(openT, isOpen ? 1.0 : 0.0, dt / 0.3)
    if (openT <= 0.0 && !isOpen) {
        if (overlay.isActive) {
            overlay.isActive = false
        }
        return 0.0
    }
    let t = openT
    let u = t - 1.0
    let pop = 1.0 + 2.70158 * u * u * u + 1.70158 * u * u
    let scale = isOpen ? lerp(0.86, 1.0, pop) : lerp(0.94, 1.0, t)
    panelNode.localScale = float3(scale, scale, 1.0)
    set_image_color(overlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, MENU_OVERLAY_COLOR.w * t))
    set_image_color(panelNode, float4(1.0, 1.0, 1.0, t))
    return t
}


//////////////////////////////// Stat introduction pop-up ////////////////////////////////

def public stat_popup_lead_text(statIdx : int) : string {
    return loc("A new pillar of your realm: {stat_display_name(statIdx)}", "Новая опора вашей державы: {stat_display_name(statIdx)}")
}


def public stat_popup_hint_text() : string {
    return loc("Watch it in the bar below. If it falls to nothing, your reign ends.", "Следите за ней на панели внизу. Если она упадёт до нуля, вашему правлению конец.")
}


def public build_stat_popup_ui() {
    statPopupPanelNode = build_modal_shell("statPopup", statPopupOverlayNode, statPopupRibbonNode, statPopupTitleNode)
    statPopupIconNode = panel(float2(1.0, 1.0), [])
    statPopupIconNode.name = "statPopupIcon"
    set_parent(statPopupIconNode, statPopupPanelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(statPopupIconNode, float2(0.5, 0.0))
    set_frame_pivot(statPopupIconNode, float2(0.5, 0.0))
    statPopupLeadNode = modal_text(statPopupPanelNode, "statPopupLead", THEME_GOLD)
    statPopupBodyNode = modal_text(statPopupPanelNode, "statPopupBody", THEME_PARCHMENT)
    statPopupButtonNode = create_menu_button(loc("Continue", "Продолжить"), ui_w(380.0), ui_h(OPTIONS_BUTTON_HEIGHT), true, OPTIONS_BUTTON_FONT_SIZE)
    statPopupButtonNode.name = "statPopupButton"
    set_parent(statPopupButtonNode, statPopupPanelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(statPopupButtonNode, float2(0.5, 1.0))
    set_frame_pivot(statPopupButtonNode, float2(0.5, 1.0))
    let fill = answer_button_fill(statPopupButtonNode)
    add_ui_event_listener(fill, UIMouseEventType.MouseClick, @@on_stat_popup_continue_click)
    add_ui_event_listener(fill, UIMouseEventType.MouseOver, @@on_stat_popup_mouse_over)
    add_ui_event_listener(fill, UIMouseEventType.MouseOut, @@on_stat_popup_mouse_out)
}


def public apply_stat_popup_layout() {
    let res = float2(get_resolution())
    let panelSize = float2(min(res.x * 0.56, ui_w(1060.0)), min(res.y * 0.74, ui_h(780.0)))
    layout_modal_header(statPopupPanelNode, statPopupRibbonNode, statPopupTitleNode, panelSize)
    let innerW = panelSize.x - ui_w(110.0)
    let icon = ui_h(150.0)
    set_frame_size(statPopupIconNode, float2(icon, icon))
    statPopupIconNode?.UIImage.size = float2(icon, icon)
    modal_inset(statPopupIconNode, 0.0, ui_h(112.0))
    set_text_font_size(statPopupLeadNode, ui_h(34.0))
    set_frame_size(statPopupLeadNode, float2(innerW, ui_h(50.0)))
    modal_inset(statPopupLeadNode, 0.0, ui_h(276.0))
    set_text_font_size(statPopupBodyNode, ui_h(30.0))
    set_frame_size(statPopupBodyNode, float2(innerW, ui_h(250.0)))
    modal_inset(statPopupBodyNode, 0.0, ui_h(336.0))
    apply_menu_button_layout(statPopupButtonNode, ui_w(380.0), ui_h(OPTIONS_BUTTON_HEIGHT), OPTIONS_BUTTON_FONT_SIZE, true, float2(0.5, 1.0))
    modal_inset(statPopupButtonNode, 0.0, -ui_h(40.0))
}


// Introduces a stat with a pop-up; the day's visitor follows once it is dismissed.
def public begin_stat_unlock_popup(statIdx : int) {
    hide_dialogue_ui()
    cancel_parallel_handoff()
    if (characterRoot.isAlive && characterAnimPhase != CHARACTER_ANIM_EXIT) {
        characterRoot.isActive = false
    }
    statIntroPopupOpen = true
    statIntroPopupStatIdx = statIdx
    statPopupButtonHovered = false
    statPopupTitleNode?.UIText.text = get_stat_unlock_cutscene_title(statIdx)
    statPopupLeadNode?.UIText.text = stat_popup_lead_text(statIdx)
    statPopupBodyNode?.UIText.text = "{get_stat_unlock_cutscene_body(statIdx)}\n\n{stat_popup_hint_text()}"
    statPopupIconNode?.UIImage.textureId = statTextures[statIdx]
    set_button_label_text(statPopupButtonNode, loc("Continue", "Продолжить"))
    apply_ui_font(statPopupTitleNode)
    apply_dialogue_font(statPopupLeadNode)
    apply_dialogue_font(statPopupBodyNode)
    apply_stat_popup_layout()
    statPopupOverlayNode.isActive = true
    juice_play_sfx(JUICE_SFX_BELL, 0.7)
    fx_gold_burst(juice_node_center(statPopupIconNode), 26, 1.1)
    apply_screen_visibility()
}


def public finish_stat_unlock_popup() {
    if (!statIntroPopupOpen) {
        return
    }
    let statIdx = statIntroPopupStatIdx
    statIntroPopupOpen = false
    statIntroPopupStatIdx = -1
    unlock_stat_with_reveal(statIdx)
    sync_stat_bar_children()
    apply_screen_visibility()
    juice_play_sfx(JUICE_SFX_STAT_UP, 0.8)
    if (statIdx == STAT_RICH_LOVE_IDX) {
        start_ashford_debut_encounter()
    } else {
        start_stat_intro_encounter(statIdx)
    }
}


def public on_stat_popup_continue_click(evt : UIMouseEvent) {
    stop_propagation(evt)
    juice_play_sfx(JUICE_SFX_CLICK, 0.8)
    finish_stat_unlock_popup()
}


def public on_stat_popup_mouse_over(evt : UIMouseEvent) {
    statPopupButtonHovered = true
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
}


def public on_stat_popup_mouse_out(evt : UIMouseEvent) {
    statPopupButtonHovered = false
}


def public update_stat_popup(dt : float) {
    if (!statPopupOverlayNode.isAlive) {
        return
    }
    if (animate_modal(statPopupOverlayNode, statPopupPanelNode, statIntroPopupOpen, statPopupOpenT, dt) <= 0.0) {
        return
    }
    statPopupButtonHoverT = move_toward(statPopupButtonHoverT, statPopupButtonHovered ? 1.0 : 0.0, ANSWER_HOVER_LERP_SPEED * dt)
    theme_apply_dark_button(answer_button_fill(statPopupButtonNode), statPopupButtonHoverT)
    // Esc is left to the pause menu here; Enter or Space continues.
    if (statIntroPopupOpen && statPopupOpenT >= 1.0 && ui_dismiss_key_pressed(false)) {
        finish_stat_unlock_popup()
    }
}


//////////////////////////////// Polish helpers ////////////////////////////////

def public stat_outline_texture(statIdx : int) : TextureId {
    return statOutlineTextures[statIdx]
}


def public ui_dismiss_key_pressed(allowEscape : bool) : bool {
    var pressed = false
    for (cmd in get_input_command_buffer()) {
        if (cmd is RawKeyboardInputEvent) {
            let key = cmd as RawKeyboardInputEvent
            if (key.kind == RawKeyboardInputEventKind.KeyDown) {
                if (key.buttonIdx == KeyCode.Return || key.buttonIdx == KeyCode.Space || (allowEscape && key.buttonIdx == KeyCode.Escape)) {
                    pressed = true
                }
            }
        }
    }
    return pressed
}


// Remembers each cutscene image's fitted UV and returns where its push-in currently is.
def public intro_ken_burns_register(node : NodeId; baseUv : float4) : float4 {
    for (i in range(length(introKenBurnsNodes))) {
        if (introKenBurnsNodes[i] == node) {
            introKenBurnsBase[i] = baseUv
            return intro_ken_burns_uv(baseUv, introKenBurnsAge[i], introKenBurnsDir[i])
        }
    }
    push(introKenBurnsNodes, node)
    push(introKenBurnsBase, baseUv)
    push(introKenBurnsTex, node?.UIImage.textureId)
    push(introKenBurnsAge, 0.0)
    push(introKenBurnsDir, 1.0)
    return baseUv
}


// Each picture starts wide and slowly pushes in while drifting sideways, kept inside the fitted region.
def public intro_ken_burns_uv(base : float4; age : float; dir : float) : float4 {
    let t = saturate(age / CUTSCENE_KEN_BURNS_SECONDS)
    let e = t * (2.0 - t)
    let zoom = 1.0 + CUTSCENE_KEN_BURNS_ZOOM * e
    let w = base.z / zoom
    let h = base.w / zoom
    let x = base.x + (base.z - w) * (0.5 + 0.4 * dir * e)
    let y = base.y + (base.w - h) * 0.45
    return float4(x, y, w, h)
}


def public update_intro_ken_burns(dt : float) {
    if (!is_intro_cutscene_active()) {
        return
    }
    for (i in range(length(introKenBurnsNodes))) {
        let node = introKenBurnsNodes[i]
        if (!node.isAlive || !node.isActive) {
            continue
        }
        let tex = node?.UIImage.textureId
        if (tex != introKenBurnsTex[i]) {
            // A new picture: restart the push-in and drift the other way from the last one.
            introKenBurnsTex[i] = tex
            introKenBurnsAge[i] = 0.0
            introKenBurnsFlip = -introKenBurnsFlip
            introKenBurnsDir[i] = introKenBurnsFlip
        }
        introKenBurnsAge[i] += dt
        node?.UIImage.uvRegion = intro_ken_burns_uv(introKenBurnsBase[i], introKenBurnsAge[i], introKenBurnsDir[i])
    }
}


// Long narration wraps before the skip hint in the bottom-right corner instead of running under it.
def public intro_replica_width(textW : float) : float {
    let hintW = intro_cutscene_skip_text_size().x + 2.0 * ui_w(26.0)
    let hintLeft = screen_w() - ui_w(CUTSCENE_SKIP_PADDING_RIGHT) - hintW - ui_w(32.0)
    return clamp(hintLeft - intro_text_top_left().x, textW * 0.55, textW)
}


def public on_try_again_mouse_over(evt : UIMouseEvent) {
    tryAgainHovered = true
    juice_play_sfx(JUICE_SFX_HOVER, 0.7, 0.08)
}


def public on_try_again_mouse_out(evt : UIMouseEvent) {
    tryAgainHovered = false
}


// The death art is fitted to the screen (it used to be stretched) and slowly pushes in.
def public update_death_screen_motion(dt : float) {
    if (!deathScreenNode.isAlive || !deathScreenNode.isActive) {
        deathScreenMotionT = 0.0
        return
    }
    deathScreenMotionT += dt
    let base = intro_cover_uv_for(float2(get_resolution()), DEATH_SCREEN_ASPECT)
    let t = saturate(deathScreenMotionT / DEATH_SCREEN_ZOOM_SECONDS)
    let zoom = 1.0 + DEATH_SCREEN_ZOOM * (1.0 - (1.0 - t) * (1.0 - t))
    let w = base.z / zoom
    let h = base.w / zoom
    deathScreenNode?.UIImage.uvRegion = float4(base.x + (base.z - w) * 0.5, base.y + (base.w - h) * 0.42, w, h)
}


// Cutscene presentation: gilded frames, a vignette on every picture and drifting motes.
def public polish_cutscene_ui() {
    for (frame in fixed_array(introCutsceneImageFrameNode, introCutsceneImage3FrameNode, introCutsceneImage4FrameNode, introCutsceneImage5FrameNode, introCutsceneImage6FrameNode)) {
        theme_add_corners(frame, 0.3)
    }
    for (image in fixed_array(introCutsceneImageNode, introCutsceneImage3Node, introCutsceneImage4Node, introCutsceneImage5Node, introCutsceneImage6Node)) {
        if (image.isAlive) {
            let vignette = juice_create_room_vignette(image)
            set_image_color(vignette, float4(0.0, 0.0, 0.0, 0.55))
        }
    }
    if (introCutsceneRoot.isAlive) {
        juice_create_ambient_layer(introCutsceneRoot, "juiceCutsceneLayer", JUICE_AMBIENT_CUTSCENE)
    }
}

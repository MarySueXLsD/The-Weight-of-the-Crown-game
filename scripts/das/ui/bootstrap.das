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
require scripts/das/ui/hover_components

module bootstrap public

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
    node?.UIText.fontScaling = false
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
    btnNode?.UIText.fontScaling = false
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
    if (!fill.isAlive) {
        return
    }
    let col = (selected) ? MENU_BUTTON_HOVER_COLOR : OPTIONS_CONTROL_BG_COLOR
    set_image_color(fill, col)
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
        set_image_color(fill, MENU_DISABLED_BUTTON_COLOR)
        fill?.UIText.color = MENU_DISABLED_TEXT_COLOR
        return
    }
    fill?.UIText.text = (settingsFullscreen) ? "X" : ""
    fill?.UIText.color = OPTIONS_CONTROL_TEXT_COLOR
    let col = (settingsFullscreen) ? MENU_BUTTON_HOVER_COLOR : OPTIONS_CONTROL_BG_COLOR
    set_image_color(fill, col)
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
    set_alignment(mainMenuOptionsFullscreenSlotNode, LayoutAlignment.MiddleRight)
    set_frame_size(mainMenuOptionsFullscreenSlotNode, float2(ui_w(options_control_column_width()), ui_h(OPTIONS_ROW_HEIGHT)))
    mainMenuOptionsFullscreenSlotNode?.UIHorizontalLayout.childForceExpandWidth = true
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
    let settingsRows = 4.0
    return titleH + rowH * settingsRows + versionH + btnOuterH + spacing * 6.0 + pad * 2.0
}



def public init_options_slider(node : NodeId; initialValue : float) {
    if (!node.isAlive) {
        return
    }
    set_frame_size(node, float2(ui_w(options_control_column_width()), ui_h(OPTIONS_SLIDER_HEIGHT)))
    get_component(node) $(var slider : UIHorizontalSlider?) {
        slider.minValue = 0.0
        slider.maxValue = 1.0
        slider.value = initialValue
    }
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
    if (!is_on_main_menu() || is_main_menu_options_open()) {
        return
    }
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
    node?.UIText.fontScaling = false
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



def public configure_intro_replica_text(node : NodeId; textW : float) {
    let textH = intro_replica_frame_height()
    node?.UIText.fontScaling = false
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
    introCutsceneSkipIdleT = 0.0
    update_intro_cutscene_skip_bar(0.0)
}



def public reset_intro_cutscene_skip_ui() {
    reset_intro_cutscene_skip_hold()
    introCutsceneSkipAlpha = 0.0
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
        imageNode?.UIImage.uvRegion = coverUv
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
        begin_stat_unlock_cutscene(statIdx, skipEntryFade)
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
    if (idx == MAIN_MENU_NEW_GAME_IDX || idx == MAIN_MENU_OPTIONS_IDX) {
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
    node?.UIText.fontScaling = false
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
    node?.UIText.fontScaling = false
    node?.UIText.autoResizeFrame = false
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    apply_ui_font(node)
}



def public configure_advisor_card_line_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.fontScaling = false
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    apply_ui_font(node)
}



def public configure_advisor_status_text(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.fontScaling = false
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

    let plusYOffset = hasMinus ? (lineHeight + lineGap) : 0.0
    update_advisor_effect_line_text(advisorActionEffectPlusNodes[actionIdx], plusText, 1, hoverT, enabled, fontSize, lineWidth, lineHeight, plusYOffset)

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
    characterRevealT = 0.0
    characterAnimPhase = CHARACTER_ANIM_REVEAL
    apply_character_image_color(0.0)
}



def public finish_character_reveal() {
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
            mask.showMaskSource = false
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
    if (stat_hover_outline_blink_white()) {
        return float4(1.0, 1.0, 1.0, 1.0)
    }
    return float4(0.0, 0.0, 0.0, 1.0)
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
    set_image_color(colorFill, float4(tintCol.x, tintCol.y, tintCol.z, 1.0))
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
}




def public layout_stat_column_positions(statIdx : int; columnH : float; iconSize : float2; barH : float; icon : NodeId; barWrapper : NodeId) {
    let spacing = stat_icon_bar_spacing()
    let barLift = ui_h(STAT_BAR_OFFSET_FROM_BOTTOM)
    let iconTop = columnH - barH - spacing - iconSize.y + ui_h(STAT_ICON_OFFSET_DOWN)
    let outline = statIconOutlineNodes[statIdx]
    if (outline.isAlive) {
        set_frame_size(outline, iconSize)
        outline?.UIImage.size = iconSize
        outline?.UIImage.textureId = statTextures[statIdx]
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
    iconOutline?.UIImage.textureId = statTextures[statIdx]
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
    node?.UIText.fontScaling = false
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
    apply_plain_font(characterProfileLikesNode)

    characterProfileDislikesNode = text("")
    characterProfileDislikesNode.name = "characterProfileDislikesNode"
    set_text_font_size(characterProfileDislikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))
    set_text_color(characterProfileDislikesNode, float4(0.92, 0.45, 0.38, 1.0))
    configure_profile_body_text(characterProfileDislikesNode)
    apply_plain_font(characterProfileDislikesNode)

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
    mainMenuButtonNodes[MAIN_MENU_ABOUT_IDX] = create_pause_menu_button(menu_about(), false, btnW, btnH)
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
    menuOptionsButtonNode = create_pause_menu_button(menu_options(), false, buttonW, btnH)
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
    deathScreenNode.isActive = false

    deathSummaryTextNode = text("")
    deathSummaryTextNode.name = "deathSummaryTextNode"
    set_text_font_size(deathSummaryTextNode, ui_h(DEATH_SUMMARY_FONT_SIZE))
    set_text_color(deathSummaryTextNode, float4(1.0, 1.0, 1.0, 0.0))
    apply_ui_font(deathSummaryTextNode)
    deathSummaryTextNode?.UIText.fontScaling = false
    deathSummaryTextNode?.UIText.autoResizeFrame = true
    deathSummaryTextNode?.UIText.wordWrapping = true
    deathSummaryTextNode?.UIText.horAlignment = TextHorAlignment.Center

    deathRecordTextNode = text("")
    deathRecordTextNode.name = "deathRecordTextNode"
    set_text_font_size(deathRecordTextNode, ui_h(DEATH_RECORD_FONT_SIZE))
    set_text_color(deathRecordTextNode, float4(0.85, 0.85, 0.85, 0.0))
    apply_ui_font(deathRecordTextNode)
    deathRecordTextNode?.UIText.fontScaling = false
    deathRecordTextNode?.UIText.autoResizeFrame = true
    deathRecordTextNode?.UIText.wordWrapping = true
    deathRecordTextNode?.UIText.horAlignment = TextHorAlignment.Center

    tryAgainButtonNode = create_answer_button(try_again(), ui_w(TRY_AGAIN_BUTTON_WIDTH))
    tryAgainButtonNode.name = "tryAgainButtonNode"
    layout_centered_answer_button(tryAgainButtonNode, ui_w(TRY_AGAIN_BUTTON_WIDTH))
    set_image_color(tryAgainButtonNode, float4(UI_BOX_BORDER_COLOR.x, UI_BOX_BORDER_COLOR.y, UI_BOX_BORDER_COLOR.z, 0.0))
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



def public jump_day(day : int) {
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



def public fire_arc_beat(arcId : int; beatIdx : int) {
    begin_arc_encounter(arcId, beatIdx)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}



def public jump_day_30() {
    currentDay = 30
    update_day_text()
    setup_encounter_for_day(currentDay)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}



def public jump_day_90() {
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



def public jump_day_175() {
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



def public fire_household_finale() {
    currentDay = 86
    begin_arc_encounter(ARC_HOUSEHOLD, 7)
    apply_current_encounter_character()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}



def public on_initialize() {
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



def public on_update() {
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



def public on_resolution_changed(res : int2) {
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



def public on_exit() {
    save_game_options()
}




require engine.core
require strings
require constants
require game_state
require questions
require layout
require tooltips
require characters


def ui_box_border() : float {
    return ui_h(UI_BOX_BORDER)
}


def answer_button_height() : float {
    return ui_h(ANSWER_BUTTON_HEIGHT)
}


def compute_character_rest_offset_x() : float {
    return ui_w(CHARACTER_CENTER_DESIGN_X) - screen_w() * 0.5
}


def toggle_menu() {
    if (is_pause_menu_open()) {
        close_pause_menu()
    } elif (!is_character_profile_open()) {
        open_pause_menu()
    }
}


def is_pause_menu_open() : bool {
    return menuAnimPhase != MENU_ANIM_IDLE
}


def is_character_profile_open() : bool {
    return characterProfileAnimPhase != PROFILE_ANIM_IDLE
}


def is_game_paused() : bool {
    return is_pause_menu_open() || is_character_profile_open()
}


def menu_panel_outer_width() : float {
    if (menuPanelNode.isAlive) {
        return menuPanelNode?.UIFrame.size.x
    }
    return ui_w(MENU_PANEL_WIDTH)
}


def menu_panel_slide_rest_x() : float {
    return 0.0
}


def menu_panel_slide_hidden_left_x() : float {
    let panelW = menu_panel_outer_width()
    return -(screen_w() + panelW) * 0.5
}


def menu_panel_slide_hidden_right_x() : float {
    let panelW = menu_panel_outer_width()
    return (screen_w() + panelW) * 0.5
}


def menu_panel_slide_speed() : float {
    let travel = screen_w() + ui_w(MENU_PANEL_WIDTH) * 2.0
    return travel / MENU_SLIDE_DURATION
}


def menu_panel_outer_height() : float {
    if (menuPanelNode.isAlive) {
        return menuPanelNode?.UIFrame.size.y
    }
    let border = ui_box_border()
    let menuPad = ui_h(MENU_PANEL_PADDING)
    let btnH = ui_h(MENU_PANEL_BUTTON_HEIGHT)
    let btnSpacing = ui_h(MENU_PANEL_BUTTON_SPACING)
    return btnH * 3.0 + btnSpacing * 2.0 + menuPad * 2.0 + 2.0 * border
}


def menu_panel_centered_top_left(slideX : float) : float2 {
    let panelW = menu_panel_outer_width()
    let panelH = menu_panel_outer_height()
    let topLeftX = screen_w() * 0.5 - panelW * 0.5 + slideX
    let topLeftY = screen_h() * 0.5 - panelH * 0.5
    return float2(topLeftX, topLeftY)
}


def set_menu_panel_slide_x(slideX : float) {
    menuPanelSlideX = slideX
    if (!menuPanelNode.isAlive) {
        return
    }
    let pos = menu_panel_centered_top_left(slideX)
    set_frame_pos(menuPanelNode, pos)
}


def menu_open_amount() : float {
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


def apply_menu_overlay_from_open_amount() {
    if (!menuOverlay.isAlive) {
        return
    }
    let alpha = menu_open_amount() * MENU_OVERLAY_COLOR.w
    set_image_color(menuOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, alpha))
}


def update_menu_slide(dt : float) {
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


def open_pause_menu() {
    if (is_pause_menu_open() || is_character_profile_open() || is_in_defeat_flow()) {
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


def close_pause_menu() {
    if (menuAnimPhase == MENU_ANIM_IDLE || menuAnimPhase == MENU_ANIM_CLOSING) {
        return
    }
    menuAnimPhase = MENU_ANIM_CLOSING
    menuOpen = false
    menuPanelSlideTargetX = menu_panel_slide_hidden_right_x()
}


def reset_pause_menu_state() {
    menuAnimPhase = MENU_ANIM_IDLE
    menuOpen = false
    menuPanelSlideX = menu_panel_slide_hidden_left_x()
    menuPanelSlideTargetX = menu_panel_slide_rest_x()
    menuContinueButtonHovered = false
    menuContinueButtonHoverT = 0.0
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
}


def character_profile_panel_outer_width() : float {
    if (characterProfilePanelNode.isAlive) {
        return characterProfilePanelNode?.UIFrame.size.x
    }
    return ui_w(CHARACTER_PROFILE_PANEL_WIDTH)
}


def character_profile_panel_slide_rest_x() : float {
    return 0.0
}


def character_profile_panel_slide_hidden_left_x() : float {
    let panelW = character_profile_panel_outer_width()
    return -(screen_w() + panelW) * 0.5
}


def character_profile_panel_slide_hidden_right_x() : float {
    let panelW = character_profile_panel_outer_width()
    return (screen_w() + panelW) * 0.5
}


def character_profile_panel_slide_speed() : float {
    let travel = screen_w() + character_profile_panel_outer_width() * 2.0
    return travel / MENU_SLIDE_DURATION
}


def character_profile_panel_outer_height() : float {
    if (characterProfilePanelNode.isAlive) {
        return characterProfilePanelNode?.UIFrame.size.y
    }
    return ui_h(600.0)
}


def character_profile_panel_centered_top_left(slideX : float) : float2 {
    let panelW = character_profile_panel_outer_width()
    let panelH = character_profile_panel_outer_height()
    let topLeftX = screen_w() * 0.5 - panelW * 0.5 + slideX
    let topLeftY = screen_h() * 0.5 - panelH * 0.5
    return float2(topLeftX, topLeftY)
}


def set_character_profile_slide_x(slideX : float) {
    characterProfileSlideX = slideX
    if (!characterProfilePanelNode.isAlive) {
        return
    }
    set_frame_pos(characterProfilePanelNode, character_profile_panel_centered_top_left(slideX))
}


def character_profile_open_amount() : float {
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


def apply_character_profile_overlay_from_open_amount() {
    if (!characterProfileOverlay.isAlive) {
        return
    }
    let alpha = character_profile_open_amount() * MENU_OVERLAY_COLOR.w
    set_image_color(characterProfileOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, alpha))
}


def update_character_profile_slide(dt : float) {
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


def character_idx_for_texture(tex : TextureId) : int {
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


def compute_profile_okay_button_outer_width() : float {
    let border = ui_box_border()
    let padX = ui_w(36.0)
    let glyphW = ui_w(MENU_BUTTON_FONT_SIZE * 0.5)
    let textW = glyphW * 4.0
    let innerW = max(ui_w(CHARACTER_PROFILE_OKAY_BUTTON_WIDTH), textW + padX)
    return innerW + 2.0 * border
}


def character_profile_content_text_width(innerW : float) : float {
    let pad = ui_h(CHARACTER_PROFILE_PADDING)
    return innerW - 2.0 * pad
}


def profile_portrait_size() : float {
    return ui_h(CHARACTER_PROFILE_PORTRAIT_SIZE)
}


def profile_portrait_width() : float {
    return profile_portrait_size()
}


def profile_portrait_height() : float {
    return profile_portrait_size()
}


def profile_text_line_height(fontSize : float) : float {
    if (fontSize == CHARACTER_PROFILE_BODY_FONT_SIZE) {
        return ui_h(fontSize * CHARACTER_PROFILE_BODY_LINE_HEIGHT)
    }
    return ui_h(fontSize * 1.15)
}


def profile_text_char_width(fontSize : float) : float {
    if (fontSize == CHARACTER_PROFILE_BODY_FONT_SIZE) {
        return max(1.0, ui_w(fontSize * CHARACTER_PROFILE_BODY_CHAR_WIDTH))
    }
    return max(1.0, ui_w(fontSize * 0.48))
}


def advance_profile_wrap_index(text : string; startIdx : int; textW : float; fontSize : float) : int {
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


def estimate_wrapped_text_height(fontSize : float; text : string; textW : float) : float {
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


def measure_profile_text_block_height(node : NodeId; text : string; textW : float; fontSize : float) : float {
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


def find_next_profile_word_end(text : string; fromIdx : int) : int {
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


def measure_profile_beside_fit_height(text : string; textW : float) : float {
    if (!characterProfileDescBesideNode.isAlive || length(text) == 0) {
        return 0.0
    }
    let measured = measure_profile_text_block_height(characterProfileDescBesideNode, text, textW, CHARACTER_PROFILE_BODY_FONT_SIZE)
    let est = estimate_wrapped_text_height(CHARACTER_PROFILE_BODY_FONT_SIZE, text, textW)
    if (est <= 0.0) {
        return measured
    }
    if (measured <= 0.0) {
        return est
    }
    if (measured > est * 1.08) {
        return est
    }
    return measured
}


def strip_leading_spaces(text : string) : string {
    var result = text
    while (length(result) > 0 && starts_with(result, " ")) {
        result = slice(result, 1, length(result))
    }
    return result
}


def split_profile_description(fullText : string; besideW : float; maxBesideH : float) {
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


def update_character_profile_content(idx : int) {
    if (idx < 0 || idx >= CHARACTER_COUNT) {
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
        characterProfileLikesNode?.UIText.text = "Likes: {profile.likes}"
    }
    if (characterProfileDislikesNode.isAlive) {
        characterProfileDislikesNode?.UIText.text = "Dislikes: {profile.dislikes}"
    }
}


def layout_character_profile_header(textW : float; portraitW : float; portraitH : float; besideW : float; spacing : float) : float {
    set_text_font_size(characterProfileTitleNode, ui_h(CHARACTER_PROFILE_TITLE_FONT_SIZE))
    set_text_font_size(characterProfileDescBesideNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))
    set_text_font_size(characterProfileDescBelowNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))

    let titleText = characterProfileTitleNode?.UIText.text
    let titleH = measure_profile_text_block_height(characterProfileTitleNode, titleText, besideW, CHARACTER_PROFILE_TITLE_FONT_SIZE)
    let besideLineH = profile_text_line_height(CHARACTER_PROFILE_BODY_FONT_SIZE)
    let besideDescMaxH = max(0.0, portraitH - titleH - spacing) + besideLineH * CHARACTER_PROFILE_BESIDE_EXTRA_LINES
    split_profile_description(characterProfileDescriptionFullText, besideW, besideDescMaxH)
    let besideText = characterProfileDescBesideText
    let belowText = characterProfileDescBelowText

    if (characterProfileDescBesideNode.isAlive) {
        characterProfileDescBesideNode?.UIText.text = besideText
        characterProfileDescBesideNode.isActive = length(besideText) > 0
    }
    if (characterProfileDescBelowNode.isAlive) {
        characterProfileDescBelowNode?.UIText.text = belowText
        characterProfileDescBelowNode.isActive = length(belowText) > 0
    }

    let besideDescH = measure_profile_text_block_height(characterProfileDescBesideNode, besideText, besideW, CHARACTER_PROFILE_BODY_FONT_SIZE)
    let textColumnH = titleH + ((length(besideText) > 0) ? spacing + besideDescH : 0.0)
    var headerH : float = portraitH
    if (textColumnH > headerH) {
        headerH = textColumnH
    }

    if (characterProfileTitleNode.isAlive) {
        set_frame_width(characterProfileTitleNode, besideW)
    }
    if (characterProfileDescBesideNode.isAlive && length(besideText) > 0) {
        set_frame_width(characterProfileDescBesideNode, besideW)
    }
    if (characterProfilePortraitNode.isAlive) {
        set_frame_size(characterProfilePortraitNode, float2(portraitW, portraitH))
        characterProfilePortraitNode?.UIImage.size = float2(portraitW, portraitH)
    }
    if (characterProfileTextColumnNode.isAlive) {
        set_frame_width(characterProfileTextColumnNode, besideW)
        set_frame_size(characterProfileTextColumnNode, float2(besideW, textColumnH))
    }
    if (characterProfileHeaderNode.isAlive) {
        set_frame_size(characterProfileHeaderNode, float2(textW, headerH))
    }
    return headerH
}


def compute_character_profile_body_height(innerW : float) : float {
    let spacing = ui_h(CHARACTER_PROFILE_SPACING)
    let textW = character_profile_content_text_width(innerW)
    let portraitW = profile_portrait_width()
    let portraitH = profile_portrait_height()
    let headerGap = ui_w(CHARACTER_PROFILE_HEADER_GAP)
    let besideW = textW - portraitW - headerGap

    let headerH = layout_character_profile_header(textW, portraitW, portraitH, besideW, spacing)

    set_frame_width(characterProfileDescBelowNode, textW)
    let belowDescH = characterProfileDescBelowNode.isActive ? measure_profile_text_block_height(characterProfileDescBelowNode, characterProfileDescBelowText, textW, CHARACTER_PROFILE_BODY_FONT_SIZE) : 0.0
    set_frame_width(characterProfileLikesNode, textW)
    set_frame_width(characterProfileDislikesNode, textW)
    let likesH = max(characterProfileLikesNode?.UIFrame.size.y, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE + 8.0))
    let dislikesH = max(characterProfileDislikesNode?.UIFrame.size.y, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE + 8.0))
    let btnH = menu_button_outer_height(ui_h(CHARACTER_PROFILE_BUTTON_HEIGHT))

    var sectionCount = 3
    if (belowDescH > 0.0) {
        sectionCount += 1
    }
    let spacingTotal = spacing * float(sectionCount - 1)
    return headerH + belowDescH + likesH + dislikesH + btnH + spacingTotal
}


def apply_character_profile_layout() {
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
    }
    set_frame_size(characterProfilePanelNode, float2(panelW, contentH + 2.0 * border))
    set_frame_pivot(characterProfilePanelNode, float2(0.0, 0.0))
    let btnInnerH = ui_h(CHARACTER_PROFILE_BUTTON_HEIGHT)
    let btnOuterW = compute_profile_okay_button_outer_width()
    apply_menu_button_layout(characterProfileOkayButtonNode, btnOuterW, btnInnerH)
    if (characterProfileOkayRowNode.isAlive) {
        set_frame_size(characterProfileOkayRowNode, float2(textW, menu_button_outer_height(btnInnerH)))
    }
    if (is_character_profile_open()) {
        set_character_profile_slide_x(characterProfileSlideX)
        apply_character_profile_overlay_from_open_amount()
    }
}


def open_character_profile() {
    if (is_character_profile_open() || is_pause_menu_open() || is_in_defeat_flow()) {
        return
    }
    if (!can_click_character()) {
        return
    }
    let idx = character_idx_for_texture(characterTexture)
    if (idx < 0) {
        return
    }
    hide_info_tooltip()
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


def close_character_profile() {
    if (characterProfileAnimPhase == PROFILE_ANIM_IDLE || characterProfileAnimPhase == PROFILE_ANIM_CLOSING) {
        return
    }
    characterProfileAnimPhase = PROFILE_ANIM_CLOSING
    characterProfileSlideTargetX = character_profile_panel_slide_hidden_right_x()
}


def reset_character_profile_state() {
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
        apply_menu_button_visual(characterProfileOkayButtonNode, 0.0, true)
    }
}


def can_click_character() : bool {
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


def apply_game_font(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIText.fontId = gameFont
}


def configure_menu_button_text(btnNode : NodeId) {
    apply_game_font(btnNode)
    btnNode?.UIText.fontScaling = false
    btnNode?.UIText.autoResizeFrame = false
    btnNode?.UIText.wordWrapping = false
    btnNode?.UIText.horAlignment = TextHorAlignment.Center
    btnNode?.UIText.vertAlignment = TextVertAlignment.Middle
    btnNode?.UIText.pivot = float2(0.5, 0.5)
}


def create_menu_button(buttonText : string; buttonOuterWidth : float = -1.0; innerHeight : float = -1.0) : NodeId {
    let border = ui_box_border()
    let outerW = (buttonOuterWidth > 0.0) ? buttonOuterWidth : ui_w(120.0)
    let btnH = (innerHeight > 0.0) ? innerHeight : ui_h(52.0)
    let innerW = outerW - 2.0 * border
    let fillNode = panel(float2(innerW, btnH), [])
    set_frame_pivot(fillNode, float2(0.0, 0.0))
    set_image_color(fillNode, ANSWER_BUTTON_COLOR)
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = buttonText,
        fontSize = ui_h(MENU_BUTTON_FONT_SIZE),
        color = TEXT_COLOR
    ))
    configure_menu_button_text(fillNode)

    let outerH = btnH + 2.0 * border
    let borderNode = panel(float2(outerW, outerH), [fillNode])
    set_frame_pivot(borderNode, float2(0.0, 0.5))
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}


def create_pause_menu_button(buttonText : string; enabled : bool; buttonOuterWidth : float; innerHeight : float) : NodeId {
    let borderNode = create_menu_button(buttonText, buttonOuterWidth, innerHeight)
    let fill = answer_button_fill(borderNode)
    if (fill.isAlive) {
        fill?.UIButton.interactable = enabled
        if (!enabled) {
            set_image_color(fill, MENU_DISABLED_BUTTON_COLOR)
            fill?.UIText.color = MENU_DISABLED_TEXT_COLOR
        }
    }
    return borderNode
}


def move_toward(current, target : float; maxDelta : float) : float {
    if (current < target) {
        return min(current + maxDelta, target)
    }
    return max(current - maxDelta, target)
}


def answer_button_fill(btnBorderNode : NodeId) : NodeId {
    if (!btnBorderNode.isAlive) {
        return NodeId()
    }
    return get_child(btnBorderNode, 0)
}


def compute_answer_button_width(dialogueW : float) : float {
    return max(dialogueW * ANSWER_BUTTON_WIDTH_RATIO, ui_w(ANSWER_BUTTON_MIN_WIDTH))
}


def apply_menu_button_visual(btnBorderNode : NodeId; hoverT : float; enabled : bool) {
    if (!btnBorderNode.isAlive || !enabled) {
        return
    }
    let fill = answer_button_fill(btnBorderNode)
    if (!fill.isAlive) {
        return
    }
    let scale = lerp(1.0, ANSWER_HOVER_SCALE, hoverT)
    btnBorderNode.localScale = float3(scale, scale, 1.0)
    fill.localScale = float3(1.0, 1.0, 1.0)
    var col = lerp(ANSWER_BUTTON_COLOR, ANSWER_BUTTON_HOVER_COLOR, hoverT)
    col.w = lerp(ANSWER_BUTTON_IDLE_ALPHA, ANSWER_HOVER_ALPHA, hoverT)
    set_image_color(fill, col)
}


def apply_answer_button_visual(btnBorderNode : NodeId; hoverT : float) {
    if (!btnBorderNode.isAlive) {
        return
    }
    let fill = answer_button_fill(btnBorderNode)
    if (!fill.isAlive) {
        return
    }
    let scale = lerp(1.0, ANSWER_HOVER_SCALE, hoverT)
    btnBorderNode.localScale = float3(scale, scale, 1.0)
    fill.localScale = float3(1.0, 1.0, 1.0)
    var col = lerp(ANSWER_BUTTON_COLOR, ANSWER_BUTTON_HOVER_COLOR, hoverT)
    col.w = lerp(ANSWER_BUTTON_IDLE_ALPHA, ANSWER_HOVER_ALPHA, hoverT)
    set_image_color(fill, col)
}


def layout_answer_button(btnBorderNode : NodeId; buttonWidth : float) {
    let border = ui_box_border()
    let btnH = answer_button_height()
    let innerW = buttonWidth - 2.0 * border
    let outerH = btnH + 2.0 * border
    set_frame_size(btnBorderNode, float2(buttonWidth, outerH))
    set_frame_pivot(btnBorderNode, float2(0.0, 0.5))
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        set_frame_size(fill, float2(innerW, btnH))
        set_frame_pivot(fill, float2(0.0, 0.0))
        set_frame_pos(fill, float2(border, border))
    }
}


def layout_centered_answer_button(btnBorderNode : NodeId; buttonWidth : float) {
    let border = ui_box_border()
    let btnH = answer_button_height()
    let innerW = buttonWidth - 2.0 * border
    let outerH = btnH + 2.0 * border
    set_frame_size(btnBorderNode, float2(buttonWidth, outerH))
    set_frame_pivot(btnBorderNode, float2(0.5, 0.5))
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        set_frame_size(fill, float2(innerW, btnH))
        set_frame_pivot(fill, float2(0.0, 0.0))
        set_frame_pos(fill, float2(border, border))
    }
}


def configure_single_line_text(node : NodeId) {
    node?.UIText.fontScaling = false
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = false
}


def configure_info_hover_target(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    add_component(node, new UIButton())
}


def update_info_tooltip_content() {
    if (!infoTooltipTitleNode.isAlive || !infoTooltipBodyNode.isAlive) {
        return
    }
    if (hoveredInfoTarget == INFO_HOVER_NONE) {
        return
    }
    infoTooltipTitleNode?.UIText.text = info_tooltip_title(hoveredInfoTarget, playerNickname, currentDay, kingdomStats)
    infoTooltipBodyNode?.UIText.text = info_tooltip_body(hoveredInfoTarget, currentDay)
}


def info_tooltip_screen_pos_for_stat(statIdx : int) : float2 {
    let columnW = stat_column_width()
    let gap = ui_w(STAT_COLUMN_GAP)
    let dividerGap = ui_w(STAT_BAR_DIVIDER_GAP)
    let dividerW = ui_w(STAT_BAR_DIVIDER_WIDTH)
    let barLeft = screen_w() * 0.5 - stat_bar_total_width() * 0.5
    let y = ui_h(TOP_BAR_HEIGHT + INFO_TOOLTIP_OFFSET_Y)
    var centerX = 0.0
    if (statIdx == STAT_SUCCESSION_IDX) {
        centerX = barLeft + stat_main_group_width() + dividerGap + dividerW + dividerGap + columnW * 0.5
    } else {
        centerX = barLeft + float(statIdx) * (columnW + gap) + columnW * 0.5
    }
    return float2(centerX, y)
}


def clamp_info_tooltip_center_x(centerX : float) : float {
    if (!infoTooltipRoot.isAlive) {
        return centerX
    }
    let halfW = infoTooltipRoot?.UIFrame.size.x * 0.5
    let margin = ui_w(INFO_TOOLTIP_SCREEN_MARGIN)
    return clamp(centerX, halfW + margin, screen_w() - halfW - margin)
}


def position_info_tooltip(target : int) {
    if (!infoTooltipRoot.isAlive) {
        return
    }
    infoTooltipRoot.set_parent(uiCanvas, AddChildStrategy.KeepLocalTransform)
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
        let anchorCenterX = ui_w(TOP_BAR_HORIZONTAL_PADDING) + daySize.x + ui_w(20.0) + nickSize.x * 0.5
        pos = float2(clamp_info_tooltip_center_x(anchorCenterX), pos.y)
    } elif (target >= INFO_HOVER_STAT_BASE && target < INFO_HOVER_STAT_BASE + STAT_COUNT) {
        pos = info_tooltip_screen_pos_for_stat(target - INFO_HOVER_STAT_BASE)
        pos.x = clamp_info_tooltip_center_x(pos.x)
    }
    set_frame_pos(infoTooltipRoot, pos)
}


def show_info_tooltip(target : int) {
    if (is_game_paused() || is_in_defeat_flow()) {
        return
    }
    hoveredInfoTarget = target
    update_info_tooltip_content()
    apply_info_tooltip_layout()
    position_info_tooltip(target)
    infoTooltipRoot.isActive = true
}


def hide_info_tooltip() {
    hoveredInfoTarget = INFO_HOVER_NONE
    if (!infoTooltipRoot.isAlive) {
        return
    }
    infoTooltipRoot.isActive = false
    infoTooltipRoot.set_parent(uiCanvas, AddChildStrategy.KeepLocalTransform)
}


def clear_info_hover_if(target : int) {
    if (hoveredInfoTarget == target) {
        hide_info_tooltip()
    }
}


def set_info_hover_stat(statIdx : int) {
    if (is_game_paused() || is_in_defeat_flow()) {
        return
    }
    show_info_tooltip(INFO_HOVER_STAT_BASE + statIdx)
}


def set_anchor_insets(node : NodeId; left : float = 0.0; top : float = 0.0) {
    get_component(node) $(var anchor : UIAnchor?) {
        anchor.left = left
        anchor.top = top
    }
}


def configure_answer_button_text(btnNode : NodeId) {
    apply_game_font(btnNode)
    btnNode?.UIText.fontScaling = false
    btnNode?.UIText.autoResizeFrame = false
    btnNode?.UIText.wordWrapping = true
    btnNode?.UIText.horAlignment = TextHorAlignment.Center
    btnNode?.UIText.vertAlignment = TextVertAlignment.Middle
    btnNode?.UIText.pivot = float2(0.5, 0.5)
}


def create_answer_button(buttonText : string; buttonWidth : float) : NodeId {
    let border = ui_box_border()
    let btnH = answer_button_height()
    let innerW = buttonWidth - 2.0 * border
    let fillSize = float2(innerW, btnH)
    let fillNode = panel(fillSize, [])
    set_frame_pivot(fillNode, float2(0.0, 0.0))
    set_image_color(fillNode, ANSWER_BUTTON_COLOR)
    add_component(fillNode, new UIButton())
    add_component(fillNode, new UIText(
        text = buttonText,
        fontSize = ui_h(ANSWER_FONT_SIZE),
        color = TEXT_COLOR
    ))
    configure_answer_button_text(fillNode)

    let outerH = btnH + 2.0 * border
    let borderNode = panel(float2(buttonWidth, outerH), [fillNode])
    set_frame_pivot(borderNode, float2(0.0, 0.5))
    set_image_color(borderNode, UI_BOX_BORDER_COLOR)
    set_frame_pos(fillNode, float2(border, border))
    return borderNode
}


def on_menu_button_click(evt : UIMouseEvent) {
    if (is_in_defeat_flow()) {
        return
    }
    toggle_menu()
}


def on_menu_continue_click(evt : UIMouseEvent) {
    close_pause_menu()
}


def on_menu_button_mouse_over(evt : UIMouseEvent) {
    if (!is_in_defeat_flow()) {
        menuButtonHovered = true
    }
}


def on_menu_button_mouse_out(evt : UIMouseEvent) {
    menuButtonHovered = false
}


def on_menu_continue_mouse_over(evt : UIMouseEvent) {
    if (is_pause_menu_open()) {
        menuContinueButtonHovered = true
    }
}


def on_menu_continue_mouse_out(evt : UIMouseEvent) {
    menuContinueButtonHovered = false
}


def on_info_day_mouse_over(evt : UIMouseEvent) {
    show_info_tooltip(INFO_HOVER_DAY)
}


def on_info_day_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_DAY)
}


def on_info_nickname_mouse_over(evt : UIMouseEvent) {
    show_info_tooltip(INFO_HOVER_NICKNAME)
}


def on_info_nickname_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_NICKNAME)
}


def on_stat_0_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(0)
}


def on_stat_1_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(1)
}


def on_stat_2_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(2)
}


def on_stat_3_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(3)
}


def on_stat_4_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(4)
}


def on_stat_5_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(5)
}


def on_stat_6_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(6)
}


def on_stat_7_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(7)
}


def on_stat_8_mouse_over(evt : UIMouseEvent) {
    set_info_hover_stat(8)
}


def on_stat_0_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 0)
}


def on_stat_1_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 1)
}


def on_stat_2_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 2)
}


def on_stat_3_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 3)
}


def on_stat_4_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 4)
}


def on_stat_5_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 5)
}


def on_stat_6_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 6)
}


def on_stat_7_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 7)
}


def on_stat_8_mouse_out(evt : UIMouseEvent) {
    clear_info_hover_if(INFO_HOVER_STAT_BASE + 8)
}


def on_menu_overlay_click(evt : UIMouseEvent) {
    close_pause_menu()
}


def on_character_profile_overlay_click(evt : UIMouseEvent) {
    close_character_profile()
}


def on_character_profile_panel_click(evt : UIMouseEvent) {
    pass
}


def on_character_profile_okay_click(evt : UIMouseEvent) {
    close_character_profile()
}


def on_character_profile_okay_mouse_over(evt : UIMouseEvent) {
    if (is_character_profile_open()) {
        characterProfileOkayHovered = true
    }
}


def on_character_profile_okay_mouse_out(evt : UIMouseEvent) {
    characterProfileOkayHovered = false
}


def on_try_again_click(evt : UIMouseEvent) {
    reset_game()
}


def set_menu_open(open : bool) {
    if (open) {
        open_pause_menu()
    } else {
        close_pause_menu()
    }
}


def get_current_dialogue_node() : DialogueNode {
    if (defeatPhase == DEFEAT_PEASANT_DIALOGUE) {
        return get_defeat_dialogue_node(currentNodeIdx)
    }
    return get_dialogue_node(currentEncounterIdx, currentNodeIdx)
}


def day_word(count : int) : string {
    return (count == 1) ? "day" : "days"
}


def update_day_text() {
    if (!dayTextNode.isAlive) {
        return
    }
    dayTextNode?.UIText.text = "Day {currentDay}"
}


def update_nickname_text() {
    if (!nicknameTextNode.isAlive) {
        return
    }
    nicknameTextNode?.UIText.text = playerNickname
}


def pick_random_visitor_texture() : TextureId {
    let idx = random_range(0, VISITOR_TEXTURE_COUNT - 1)
    return visitorTextures[idx]
}


def roll_next_visitor_texture() {
    nextVisitorTexture = pick_random_visitor_texture()
}


def advance_encounter_state() {
    currentDay++
    update_day_text()
    currentEncounterIdx = (currentEncounterIdx + 1) % encounter_count()
    currentNodeIdx = get_encounter(currentEncounterIdx).startNodeIdx
    pendingNextNodeIdx = NO_NEXT_NODE
}


def append_same_visitor_prompt(additionalPrompt : string) {
    let prefix = typewriterFullText
    typewriterFullText = "{prefix}\n\n{SAME_VISITOR_BRIDGE_TEXT}\n\n{additionalPrompt}"
    typewriterCharCount = length(prefix)
    typewriterAccumulator = 0.0
    typewriterKind = TYPEWRITER_PROMPT
    dialogPhase = DIALOG_TYPEWRITER
    answerRoot.isActive = false
}


def start_same_visitor_encounter() {
    advance_encounter_state()
    roll_next_visitor_texture()
    append_same_visitor_prompt(get_current_dialogue_node().prompt)
}


def texture_path_for(tex : TextureId) : string {
    if (tex == kingTexture) {
        return KING_TEXTURE_PATH
    }
    if (tex == peasantTexture) {
        return PEASANT_TEXTURE_PATH
    }
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        if (tex == visitorTextures[i]) {
            return VISITOR_TEXTURE_PATHS[i]
        }
    }
    return KING_TEXTURE_PATH
}


def update_character_texture_aspect(tex : TextureId) {
    let path = texture_path_for(tex)
    if (apply_character_visual(path)) {
        return
    }
    get_texture_size(tex) $(size : int2) {
        characterTextureAspect = float(size.x) / float(size.y)
        characterTextureUvRegion = float4(0.0, 0.0, 1.0, 1.0)
    }
    characterAlphaWidth = 0
    characterAlphaHeight = 0
    characterAlphaPixels |> clear()
}


def character_mouse_local_xy() : float2 {
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


def is_mouse_over_character_opaque() : bool {
    if (!characterImageNode.isAlive || !characterRoot.isAlive || !characterRoot.isActive) {
        return false
    }
    if (is_game_paused() || is_in_defeat_flow()) {
        return false
    }
    if (characterAnimPhase == CHARACTER_ANIM_EXIT || characterAnimPhase == CHARACTER_ANIM_HIDE) {
        return false
    }
    if (characterAlphaWidth <= 0 || characterAlphaHeight <= 0 || length(characterAlphaPixels) == 0) {
        return false
    }
    if (!is_mouse_inside_frame(characterImageNode?.UIFrame)) {
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


def apply_character_outline_visual(hoverT : float) {
    if (!characterOutlineNode.isAlive) {
        return
    }
    characterOutlineNode.isActive = hoverT > 0.01
    var col = CHARACTER_OUTLINE_COLOR
    col.w = hoverT
    set_image_color(characterOutlineNode, col)
}


def is_in_defeat_flow() : bool {
    return defeatPhase != DEFEAT_NONE
}


def format_death_summary_text() : string {
    return "You lived {currentDay} {day_word(currentDay)} as the King of Loria."
}


def format_death_record_text() : string {
    return "The record for the kings is {recordDays} {day_word(recordDays)}."
}


def update_death_summary_text() {
    if (!deathSummaryTextNode.isAlive) {
        return
    }
    deathSummaryTextNode?.UIText.text = format_death_summary_text()
    if (deathRecordTextNode.isAlive) {
        deathRecordTextNode?.UIText.text = format_death_record_text()
    }
    apply_death_summary_layout()
}


def menu_button_outer_height(innerHeight : float) : float {
    return innerHeight + 2.0 * ui_box_border()
}


def apply_menu_button_layout(btnBorderNode : NodeId; buttonOuterWidth : float; innerHeight : float) {
    if (!btnBorderNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let innerW = buttonOuterWidth - 2.0 * border
    let outerH = menu_button_outer_height(innerHeight)
    set_frame_size(btnBorderNode, float2(buttonOuterWidth, outerH))
    let fill = answer_button_fill(btnBorderNode)
    if (fill.isAlive) {
        set_frame_size(fill, float2(innerW, innerHeight))
        set_frame_pivot(fill, float2(0.0, 0.0))
        set_frame_pos(fill, float2(border, border))
        set_text_font_size(fill, ui_h(MENU_BUTTON_FONT_SIZE))
    }
}


def apply_menu_layout() {
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
        set_alignment(menuPanelContentNode, LayoutAlignment.TopLeft)
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


def apply_top_bar_layout() {
    let resX = screen_w()
    let barH = ui_h(TOP_BAR_HEIGHT)
    if (topBarRoot.isAlive) {
        set_frame_size(topBarRoot, float2(resX, barH))
    }
    if (topBarBorderNode.isAlive) {
        set_frame_size(topBarBorderNode, float2(resX, ui_box_border()))
    }
    if (topBarLeftInfoNode.isAlive) {
        set_frame_size(topBarLeftInfoNode, float2(ui_w(480.0), barH))
        set_anchor_insets(topBarLeftInfoNode, ui_w(TOP_BAR_HORIZONTAL_PADDING), 0.0)
        set_spacing(topBarLeftInfoNode, ui_w(20.0))
    }
    if (menuButtonNode.isAlive) {
        set_anchor_insets(menuButtonNode, -ui_w(TOP_BAR_PAUSE_MARGIN), 0.0)
        apply_menu_button_layout(menuButtonNode, ui_w(120.0), ui_h(52.0))
    }
    if (dayTextNode.isAlive) {
        set_text_font_size(dayTextNode, ui_h(DAY_FONT_SIZE))
    }
    if (nicknameTextNode.isAlive) {
        set_text_font_size(nicknameTextNode, ui_h(NICKNAME_FONT_SIZE))
    }
}


def try_again_button_height() : float {
    return answer_button_height() + 2.0 * ui_box_border()
}


def apply_death_summary_layout() {
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


def set_death_summary_alpha(alpha : float) {
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


def set_death_fade_alpha(alpha : float) {
    let a = clamp(alpha, 0.0, 1.0)
    if (deathFadeOverlay.isAlive) {
        set_image_color(deathFadeOverlay, float4(0.0, 0.0, 0.0, a))
    }
    if (deathScreenNode.isAlive) {
        set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, a))
    }
}


def hide_death_ui() {
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


def begin_defeat_after_exit() {
    defeatPhase = DEFEAT_WAIT_EXIT
}


def start_defeat_peasant_encounter() {
    defeatPhase = DEFEAT_PEASANT_DIALOGUE
    currentNodeIdx = 0
    pendingNextNodeIdx = NO_NEXT_NODE
    characterTexture = peasantTexture
    update_character_texture_aspect(peasantTexture)
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


def start_defeat_fade_out() {
    defeatPhase = DEFEAT_FADE_OUT
    defeatFadeT = 0.0
    deathSummaryFadeT = 0.0
    deathSummaryTimer = 0.0
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    if (currentDay > recordDays) {
        recordDays = currentDay
    }
    update_death_summary_text()
    if (deathFadeOverlay.isAlive) {
        deathFadeOverlay.isActive = true
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


def reset_game() {
    let savedRecord = recordDays
    reset_kingdom_stats()
    reset_stat_anim_state()
    currentDay = 1
    playerNickname = DEFAULT_NICKNAME
    recordDays = savedRecord
    currentEncounterIdx = 0
    currentNodeIdx = get_encounter(0).startNodeIdx
    pendingNextNodeIdx = NO_NEXT_NODE
    defeatPhase = DEFEAT_NONE
    defeatFadeT = 0.0
    deathSummaryFadeT = 0.0
    deathSummaryTimer = 0.0
    menuOpen = false
    reset_pause_menu_state()
    reset_character_profile_state()
    hide_death_ui()
    update_day_text()
    update_nickname_text()
    cancel_parallel_handoff()
    reset_character_transform()
    characterTexture = kingTexture
    update_character_texture_aspect(kingTexture)
    roll_next_visitor_texture()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    cameraZoomPhase = CAM_ZOOM_IDLE
    cameraZoomT = 0.0
    apply_camera_zoom()
    update_stat_bar_anims(0.0)
    start_character_enter()
}


def choice_has_stat_change(choice : DialogueChoice) : bool {
    for (i in range(STAT_COUNT)) {
        if (choice.statDeltas[i] != 0) {
            return true
        }
    }
    return false
}


def should_begin_gold_defeat(choice : DialogueChoice) : bool {
    if (defeatPhase != DEFEAT_NONE) {
        return false
    }
    let goldAfter = clamp_stat(kingdomStats[STAT_GOLD_IDX] + choice.statDeltas[STAT_GOLD_IDX])
    return goldAfter <= STAT_MIN
}


def apply_choice_stat_deltas(choice : DialogueChoice) {
    for (i in range(STAT_COUNT)) {
        kingdomStats[i] = clamp_stat(kingdomStats[i] + choice.statDeltas[i])
    }
}


def character_size() : float2 {
    let resY = float(get_resolution().y)
    let height = resY * CHARACTER_HEIGHT_SCREEN_RATIO
    let width = height * characterTextureAspect
    return float2(width, height)
}


def incoming_character_size() : float2 {
    let resY = float(get_resolution().y)
    let height = resY * CHARACTER_HEIGHT_SCREEN_RATIO
    let width = height * incomingTextureAspect
    return float2(width, height)
}


def incoming_enter_start_offset() : float {
    let charW = incoming_character_size().x
    return -screen_w() * 0.5 - charW * 0.5
}


def set_incoming_visitor_offset(offsetX : float; offsetY : float = 0.0) {
    if (!incomingVisitorRoot.isAlive) {
        return
    }
    get_component(incomingVisitorRoot) $(var anchor : UIAnchor?) {
        anchor.left = offsetX
        anchor.top = -offsetY
    }
}


def apply_incoming_silhouette(revealT : float) {
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


def layout_incoming_visitor() {
    if (!incomingVisitorRoot.isAlive) {
        return
    }
    let charSize = incoming_character_size()
    set_frame_size(incomingVisitorRoot, charSize)
    if (incomingVisitorImageNode.isAlive) {
        incomingVisitorImageNode?.UIImage.size = charSize
        incomingVisitorImageNode?.UIImage.uvRegion = incomingTextureUvRegion
    }
    if (incomingVisitorSilhouetteNode.isAlive) {
        incomingVisitorSilhouetteNode?.UIImage.size = charSize
        incomingVisitorSilhouetteNode?.UIImage.uvRegion = incomingTextureUvRegion
    }
}


def cancel_parallel_handoff() {
    parallelHandoffActive = false
    incomingEnterFinished = false
    if (incomingVisitorRoot.isAlive) {
        incomingVisitorRoot.isActive = false
    }
}


def begin_parallel_incoming_visitor(tex : TextureId) {
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


def update_parallel_incoming_visitor(dt : float) {
    if (!parallelHandoffActive || incomingEnterFinished) {
        return
    }
    incomingAnimOffsetX += ui_w(CHARACTER_ANIM_ENTER_SPEED) * dt
    incomingWalkBobTimer += dt
    let bobPhase = cos(incomingWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
    let bobY = -bobPhase * ui_h(CHARACTER_WALK_BOB_AMPLITUDE)
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


def complete_parallel_handoff() {
    advance_encounter_state()
    characterTexture = incomingVisitorTexture
    update_character_texture_aspect(characterTexture)
    roll_next_visitor_texture()
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
    cancel_parallel_handoff()
}


def zoom_ui_scale() : float {
    return lerp(CAMERA_ZOOM_OUT_SCALE, CAMERA_ZOOM_IN_SCALE, cameraZoomT)
}


def transform_zoom_local_to_screen(localPos : float2) : float2 {
    let center = float2(screen_w(), screen_h()) * 0.5
    let scale = zoom_ui_scale()
    return center + (localPos - center) * scale
}


def character_image_top_right_screen() : float2 {
    let charSize = character_size()
    let res = float2(screen_w(), screen_h())
    // Anchor dialogue to the standing rest pose, not the breathing bob.
    let localTopRight = float2(
        res.x * 0.5 + characterAnimOffsetX + charSize.x * 0.5,
        res.y - charSize.y
    )
    return transform_zoom_local_to_screen(localTopRight)
}


def compute_dialogue_left() : float {
    return character_image_top_right_screen().x + ui_w(DIALOGUE_CHARACTER_GAP_X)
}


def compute_dialogue_top() : float {
    return character_image_top_right_screen().y + ui_h(DIALOGUE_CHARACTER_GAP_Y)
}


def character_enter_start_offset() : float {
    let charW = character_size().x
    // Right edge of character at screen left (x = 0).
    return -screen_w() * 0.5 - charW * 0.5
}


def character_exit_end_offset() : float {
    let charW = character_size().x
    // Walk fully past the left edge before exit completes.
    return -screen_w() * 0.5 - charW * 0.5 - ui_w(CHARACTER_EXIT_EXTRA_OFFSET)
}


def character_exit_fade_t(offsetX : float) : float {
    let startX = characterRestOffsetX
    let endX = character_exit_end_offset()
    let span = startX - endX
    if (span <= 0.001) {
        return 0.0
    }
    return clamp((offsetX - endX) / span, 0.0, 1.0)
}


def compute_dialogue_width() : float {
    let left = max(compute_dialogue_left(), 0.0)
    let available = screen_w() - left - ui_w(DIALOGUE_SCREEN_MARGIN_DESIGN)
    return max(available, ui_w(80.0))
}


def set_frame_width(node : NodeId; width : float) {
    get_component(node) $(var frame : UIFrame?) {
        frame.size = float2(width, frame.size.y)
    }
}


def set_dialogue_anchor(left : float; top : float) {
    get_component(dialogueRoot) $(var anchor : UIAnchor?) {
        anchor.left = left
        anchor.top = top
    }
}


def get_dialogue_speaker_name() : string {
    let idx = character_idx_for_texture(characterTexture)
    if (idx < 0) {
        return ""
    }
    return get_character_profile(idx).name
}


def update_dialogue_speaker_name() {
    if (!questionNameNode.isAlive) {
        return
    }
    questionNameNode?.UIText.text = get_dialogue_speaker_name()
}


def apply_question_box_layout(dialogueW : float) {
    if (!questionBorderNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let padding = ui_h(DIALOGUE_BOX_PADDING)
    let innerW = dialogueW - 2.0 * border
    let textW = innerW - 2.0 * padding
    set_text_font_size(questionNameNode, ui_h(DIALOGUE_NAME_FONT_SIZE))
    set_frame_width(questionNameNode, textW)
    let nameH = questionNameNode?.UIFrame.size.y
    set_text_font_size(questionTextNode, ui_h(QUESTION_FONT_SIZE))
    set_frame_width(questionTextNode, textW)
    let textH = questionTextNode?.UIFrame.size.y
    let nameSpacing = (nameH > 0.0) ? ui_h(DIALOGUE_NAME_SPACING) : 0.0
    let contentH = nameH + nameSpacing + textH + 2.0 * padding
    set_padding(questionContentNode, float4(padding, padding, padding, padding))
    set_frame_size(questionContentNode, float2(innerW, contentH))
    set_frame_size(questionBoxNode, float2(innerW, contentH))
    set_frame_pos(questionBoxNode, float2(border, border))
    set_frame_size(questionBorderNode, float2(dialogueW, contentH + 2.0 * border))
}


def apply_dialogue_layout() {
    if (!dialogueRoot.isAlive) {
        return
    }
    let res = float2(get_resolution())
    let dialogueW = compute_dialogue_width()

    set_dialogue_anchor(compute_dialogue_left(), compute_dialogue_top())
    set_frame_width(dialogueRoot, dialogueW)
    apply_question_box_layout(dialogueW)
    if (dialogPhase == DIALOG_CHOOSING) {
        layout_visible_choice_buttons(dialogueW)
    }
}


def layout_visible_choice_buttons(dialogueW : float) {
    let node = get_current_dialogue_node()
    let count = node.choiceCount
    let buttonW = compute_answer_button_width(dialogueW)
    let answerOuterH = answer_button_height() + 2.0 * ui_box_border()
    let answerSpacing = ui_h(ANSWER_SPACING)
    let spacingTotal = (count > 1) ? answerSpacing * float(count - 1) : 0.0
    set_spacing(answerRoot, answerSpacing)
    set_frame_size(answerRoot, float2(dialogueW, answerOuterH * float(count) + spacingTotal))
    for (i in range(MAX_CHOICES)) {
        let btn = choiceButtonNodes[i]
        if (!btn.isAlive) {
            continue
        }
        if (i < count) {
            btn.isActive = true
            layout_answer_button(btn, buttonW)
            let fill = answer_button_fill(btn)
            if (fill.isAlive) {
                fill?.UIText.fontSize = ui_h(ANSWER_FONT_SIZE)
                fill?.UIText.text = node.choices[i].choiceText
            }
        } else {
            btn.isActive = false
        }
    }
}


def sync_character_image_size(node : NodeId; charSize : float2) {
    if (!node.isAlive) {
        return
    }
    set_frame_size(node, charSize)
    node?.UIImage.size = charSize
    node?.UIImage.uvRegion = characterTextureUvRegion
}


def apply_character_layout() {
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
        sync_character_image_size(characterOutlineNode, charSize)
        sync_character_image_size(characterImageNode, charSize)
        sync_character_image_size(characterSilhouetteOverlay, charSize)
    }

    apply_dialogue_layout()
}


def is_dialogue_input_blocked() : bool {
    if (is_in_defeat_flow() && defeatPhase != DEFEAT_PEASANT_DIALOGUE) {
        return true
    }
    if (characterAnimPhase != CHARACTER_ANIM_IDLE) {
        return true
    }
    if (cameraZoomPhase != CAM_ZOOM_IDLE) {
        return true
    }
    if (dialogPhase == DIALOG_TYPEWRITER || dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
        return true
    }
    return false
}


def apply_camera_zoom() {
    let scale = zoom_ui_scale()
    zoomRoot.localScale = float3(scale, scale, 1.0)
    if (dialogueRoot.isAlive && dialogueRoot.isActive) {
        apply_dialogue_layout()
    }
}


def set_character_offset(offsetX : float; offsetY : float = 0.0) {
    characterAnimOffsetY = offsetY
    get_component(characterRoot) $(var anchor : UIAnchor?) {
        anchor.left = offsetX
        // Bottom-anchored (anchor y = 1.0): vertical inset uses top, not bottom.
        anchor.top = -offsetY
    }
}


def apply_character_breath() {
    characterBreathTimer += get_delta_time()
    let breathY = sin(characterBreathTimer * CHARACTER_BREATH_BOB_FREQ * PI * 2.0) * ui_h(CHARACTER_BREATH_BOB_AMPLITUDE)
    // Snap to whole pixels so sub-pixel bob does not shimmer the top scanline.
    set_character_offset(characterAnimOffsetX, floor(breathY + 0.5))
}


def apply_character_image_color(revealT : float) {
    if (!characterImageNode.isAlive) {
        return
    }
    // Base stays full-color at full opacity — never tint it black (premultiplied alpha makes black tint invisible).
    set_image_color(characterImageNode, float4(1.0, 1.0, 1.0, 1.0))
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


def prepare_character_offscreen() {
    characterAnimOffsetX = character_enter_start_offset()
    characterRevealT = 0.0
    set_character_offset(characterAnimOffsetX)
    apply_character_image_color(0.0)
}


def try_advance_to_wait() {
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


def hide_dialogue_ui() {
    dialogueRoot.isActive = false
    questionBorderNode.isActive = false
    answerRoot.isActive = false
}


def reset_choice_hover_state() {
    hoveredChoice = HOVER_NONE
    for (i in range(MAX_CHOICES)) {
        choiceHoverT[i] = 0.0
        let btn = choiceButtonNodes[i]
        if (btn.isAlive) {
            apply_answer_button_visual(btn, 0.0)
        }
    }
}


def show_answer_buttons() {
    reset_choice_hover_state()
    layout_visible_choice_buttons(compute_dialogue_width())
    answerRoot.isActive = true
}


def begin_typewriter(bodyText : string; kind : int) {
    typewriterKind = kind
    typewriterFullText = bodyText
    typewriterCharCount = 0
    typewriterAccumulator = 0.0
    update_dialogue_speaker_name()
    questionTextNode?.UIText.text = ""
    dialogueRoot.isActive = true
    questionBorderNode.isActive = true
    answerRoot.isActive = false
    dialogPhase = DIALOG_TYPEWRITER
}


def start_prompt_typewriter() {
    let node = get_current_dialogue_node()
    begin_typewriter(node.prompt, TYPEWRITER_PROMPT)
}


def start_typewriter() {
    if (dialogPhase != DIALOG_IDLE) {
        return
    }
    pendingNextNodeIdx = NO_NEXT_NODE
    start_prompt_typewriter()
}


def finish_typewriter() {
    questionTextNode?.UIText.text = typewriterFullText
    if (typewriterKind == TYPEWRITER_PROMPT) {
        dialogPhase = DIALOG_CHOOSING
        show_answer_buttons()
        return
    }
    if (typewriterKind == TYPEWRITER_RESPONSE) {
        if (pendingNextNodeIdx != NO_NEXT_NODE) {
            currentNodeIdx = pendingNextNodeIdx
            pendingNextNodeIdx = NO_NEXT_NODE
            dialogPhase = DIALOG_CHOOSING
            show_answer_buttons()
        } elif (nextVisitorTexture == characterTexture && defeatPhase == DEFEAT_NONE) {
            start_same_visitor_encounter()
        } else {
            dialogPhase = DIALOG_POST_RESPONSE_HOLD
            postResponseHoldTimer = POST_RESPONSE_HOLD_DURATION
        }
    }
}


def select_choice(choiceIdx : int) {
    if (is_dialogue_input_blocked() || is_game_paused() || dialogPhase != DIALOG_CHOOSING) {
        return
    }
    let node = get_current_dialogue_node()
    if (choiceIdx < 0 || choiceIdx >= node.choiceCount) {
        return
    }
    let choice = node.choices[choiceIdx]
    pendingNextNodeIdx = choice.nextNodeIdx
    hoveredChoice = HOVER_NONE
    let goldDefeat = should_begin_gold_defeat(choice)
    if (choice_has_stat_change(choice)) {
        start_stat_confirm_anims(choice)
    }
    if (goldDefeat) {
        begin_defeat_after_exit()
    }
    answerRoot.isActive = false
    begin_typewriter(choice.response, TYPEWRITER_RESPONSE)
}


def reset_character_transform() {
    characterAnimOffsetX = characterRestOffsetX
    characterAnimOffsetY = 0.0
    characterAnimPhase = CHARACTER_ANIM_IDLE
    characterWalkBobTimer = 0.0
    characterBreathTimer = 0.0
    characterRevealT = 1.0
    set_character_offset(characterRestOffsetX)
    apply_character_image_color(1.0)
}


def start_camera_zoom_out() {
    cameraZoomPhase = CAM_ZOOM_OUT
}


def start_camera_zoom_in() {
    if (cameraZoomPhase == CAM_ZOOM_IN) {
        return
    }
    cameraZoomT = 0.0
    cameraZoomPhase = CAM_ZOOM_IN
}


def start_character_wait() {
    if (defeatPhase == DEFEAT_WAIT_EXIT) {
        start_defeat_peasant_encounter()
        return
    }
    advance_encounter_state()
    characterTexture = nextVisitorTexture
    update_character_texture_aspect(characterTexture)
    roll_next_visitor_texture()
    prepare_character_offscreen()
    refresh_character_visuals()
    hide_dialogue_ui()
    dialogPhase = DIALOG_IDLE
    start_character_enter()
}


def start_character_enter() {
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


def start_character_exit() {
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
    if (defeatPhase == DEFEAT_NONE && nextVisitorTexture != characterTexture) {
        begin_parallel_incoming_visitor(nextVisitorTexture)
    }
}


def refresh_character_visuals() {
    if (!characterImageNode.isAlive) {
        return
    }
    characterImageNode?.UIImage.textureId = characterTexture
    if (characterOutlineNode.isAlive) {
        characterOutlineNode?.UIImage.textureId = characterOutlineTexture
    }
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


def stat_icon_side() : float {
    let maxSide = ui_h(TOP_BAR_HEIGHT - STAT_BAR_HEIGHT - STAT_ICON_LAYOUT_PAD)
    return maxSide * STAT_ICON_SIZE_RATIO
}


def stat_bar_outer_width() : float {
    return stat_icon_side() * STAT_BAR_WIDTH_RATIO
}


def stat_column_width() : float {
    return max(stat_icon_side(), stat_bar_outer_width())
}


def stat_icon_to_bar_gap() : float {
    let available = ui_h(TOP_BAR_HEIGHT) - stat_icon_side() - stat_bar_outer_height()
    let requested = ui_h(STAT_BAR_GAP)
    return min(requested, max(0.0, available))
}


def stat_bar_outer_height() : float {
    return ui_h(STAT_BAR_HEIGHT)
}


def stat_icon_drop_room() : float {
    return ui_h(STAT_EMPHASIS_DROP)
}


def stat_column_size() : float2 {
    return float2(stat_column_width(), ui_h(TOP_BAR_HEIGHT))
}


def configure_stat_icon(node : NodeId) {
    if (!node.isAlive) {
        return
    }
    node?.UIImage.color = float4(1.0, 1.0, 1.0, 1.0)
    node?.UIImage.pivot = float2(0.5, 0.5)
    node?.UIImage.localPosition2D = float2(0.0, 0.0)
}


def stat_fill_color_for_percent(percent : float) : float4 {
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


def layout_stat_bar_fill_value(statIdx : int; value : float) {
    let fillNode = statBarFillNodes[statIdx]
    if (!fillNode.isAlive) {
        return
    }
    let barW = stat_bar_outer_width()
    let barH = stat_bar_outer_height()
    let fillWidth = barW * (clamp(value, 0.0, float(STAT_MAX)) / float(STAT_MAX))
    set_frame_size(fillNode, float2(max(fillWidth, ui_w(2.0)), barH))
}


def apply_stat_fill_color(statIdx : int) {
    let fillNode = statBarFillNodes[statIdx]
    if (!fillNode.isAlive) {
        return
    }
    let baseCol = stat_fill_color_for_percent(statFillDisplayed[statIdx])
    let flashCol = statFlashPositive[statIdx] ? STAT_FLASH_POSITIVE_COLOR : STAT_FLASH_NEGATIVE_COLOR
    let t = clamp(statFlashT[statIdx], 0.0, 1.0)
    let col = lerp(baseCol, flashCol, t)
    set_image_color(fillNode, col)
}


def stat_hover_target(statIdx : int) : float {
    if (dialogPhase != DIALOG_CHOOSING || is_game_paused()) {
        return 0.0
    }
    if (hoveredChoice < 0) {
        return 0.0
    }
    let node = get_current_dialogue_node()
    if (hoveredChoice >= node.choiceCount) {
        return 0.0
    }
    if (node.choices[hoveredChoice].statDeltas[statIdx] != 0) {
        return 1.0
    }
    return 0.0
}


def stat_info_hover_target(statIdx : int) : float {
    if (is_game_paused() || is_in_defeat_flow()) {
        return 0.0
    }
    if (hoveredInfoTarget == INFO_HOVER_STAT_BASE + statIdx) {
        return 1.0
    }
    return 0.0
}


def stat_emphasis_target(statIdx : int) : float {
    let phase = statConfirmPhase[statIdx]
    if (phase == STAT_CONFIRM_FLASH || phase == STAT_CONFIRM_FILL || phase == STAT_CONFIRM_COLOR) {
        return 1.0
    }
    if (phase == STAT_CONFIRM_SHRINK) {
        let t = clamp(statConfirmTimer[statIdx] / STAT_CONFIRM_SHRINK_DURATION, 0.0, 1.0)
        return 1.0 - t
    }
    return max(stat_hover_target(statIdx), stat_info_hover_target(statIdx))
}


def apply_stat_icon_visual(statIdx : int) {
    let icon = statIconWrapNodes[statIdx]
    if (!icon.isAlive) {
        return
    }
    let emphasis = statEmphasisT[statIdx]
    let scale = lerp(1.0, STAT_EMPHASIS_SCALE, emphasis)
    let drop = lerp(0.0, stat_icon_drop_room(), emphasis)
    icon.localScale = float3(scale, scale, 1.0)
    icon?.UIImage.localPosition2D = float2(0.0, -drop)
}


def apply_stat_column_visual(statIdx : int) {
    apply_stat_icon_visual(statIdx)
    layout_stat_bar_fill_value(statIdx, statFillDisplayed[statIdx])
    apply_stat_fill_color(statIdx)
}


def stat_icon_bar_spacing() : float {
    let barGap = stat_icon_to_bar_gap()
    return max(0.0, barGap - ui_h(STAT_ICON_OFFSET_Y))
}


def start_stat_confirm_anims(choice : DialogueChoice) {
    for (i in range(STAT_COUNT)) {
        if (choice.statDeltas[i] == 0) {
            continue
        }
        let fromVal = float(kingdomStats[i])
        let toVal = float(clamp_stat(kingdomStats[i] + choice.statDeltas[i]))
        statFillFrom[i] = fromVal
        statFillTo[i] = toVal
        statFillDisplayed[i] = fromVal
        statFlashPositive[i] = toVal > fromVal
        statFlashT[i] = 1.0
        statConfirmTimer[i] = 0.0
        statConfirmPhase[i] = STAT_CONFIRM_FLASH
    }
}



def update_stat_confirm_anim(statIdx : int; dt : float) {
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


def update_stat_bar_anims(dt : float) {
    for (i in range(STAT_COUNT)) {
        update_stat_confirm_anim(i, dt)
        let phase = statConfirmPhase[i]
        if (phase == STAT_CONFIRM_SHRINK) {
            let t = clamp(statConfirmTimer[i] / STAT_CONFIRM_SHRINK_DURATION, 0.0, 1.0)
            statEmphasisT[i] = 1.0 - t
        } else {
            let target = stat_emphasis_target(i)
            statEmphasisT[i] = move_toward(statEmphasisT[i], target, STAT_EMPHASIS_LERP_SPEED * dt)
        }
        apply_stat_column_visual(i)
    }
}


def layout_stat_bar_stack_raise(columnW : float; barH : float; barStack : NodeId) {
    if (!barStack.isAlive) {
        return
    }
    set_frame_pivot(barStack, float2(0.5, 1.0))
    set_frame_pos(barStack, float2(columnW * 0.5, barH - ui_h(STAT_BAR_RAISE)))
}


def stat_main_group_width() : float {
    let columnSize = stat_column_size()
    let statGap = ui_w(STAT_COLUMN_GAP)
    return columnSize.x * float(STAT_MAIN_COUNT) + statGap * float(STAT_MAIN_COUNT - 1)
}


def stat_bar_total_width() : float {
    let gap = ui_w(STAT_BAR_DIVIDER_GAP)
    return stat_main_group_width() + gap + ui_w(STAT_BAR_DIVIDER_WIDTH) + gap + stat_column_width()
}


def apply_stat_column_layout(statIdx : int; columnSize : float2; iconSize : float2; columnW : float; barW : float; barH : float) {
    let column = statColumnNodes[statIdx]
    if (!column.isAlive) {
        return
    }
    let icon = statIconWrapNodes[statIdx]
    let barWrapper = get_child(column, 1)
    set_spacing(column, stat_icon_bar_spacing())
    set_alignment(column, LayoutAlignment.BottomCenter)
    set_frame_size(column, columnSize)
    if (icon.isAlive) {
        set_frame_size(icon, iconSize)
        configure_stat_icon(icon)
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
            layout_stat_bar_stack_raise(columnW, barH, barStack)
        }
    }
    apply_stat_column_visual(statIdx)
}


def apply_stat_bar_layout() {
    if (!statBarRoot.isAlive) {
        return
    }
    let iconSide = stat_icon_side()
    let iconSize = float2(iconSide, iconSide)
    let barW = stat_bar_outer_width()
    let barH = stat_bar_outer_height()
    let columnW = stat_column_width()
    let columnSize = stat_column_size()
    let mainGroup = get_child(statBarRoot, 0)
    if (mainGroup.isAlive) {
        set_spacing(mainGroup, ui_w(STAT_COLUMN_GAP))
        set_frame_size(mainGroup, float2(stat_main_group_width(), columnSize.y))
    }
    set_spacing(statBarRoot, ui_w(STAT_BAR_DIVIDER_GAP))
    set_frame_size(statBarRoot, float2(stat_bar_total_width(), columnSize.y))
    for (i in range(STAT_MAIN_COUNT)) {
        apply_stat_column_layout(i, columnSize, iconSize, columnW, barW, barH)
    }
    if (statBarDividerNode.isAlive) {
        set_frame_size(statBarDividerNode, float2(ui_w(STAT_BAR_DIVIDER_WIDTH), ui_h(STAT_BAR_DIVIDER_HEIGHT)))
    }
    apply_stat_column_layout(STAT_SUCCESSION_IDX, columnSize, iconSize, columnW, barW, barH)
}


def create_stat_column(statIdx : int) : NodeId {
    let iconSide = stat_icon_side()
    let iconSize = float2(iconSide, iconSide)
    let barW = stat_bar_outer_width()
    let barH = stat_bar_outer_height()
    let barGap = stat_icon_to_bar_gap()
    let columnW = stat_column_width()
    let columnSize = stat_column_size()

    let icon = panel(iconSize, [])
    icon?.UIImage.textureId = statTextures[statIdx]
    configure_stat_icon(icon)

    let barTrack = panel(float2(barW, barH), [])
    barTrack?.UIImage.textureId = statBarTrackTexture
    set_image_color(barTrack, STAT_BAR_TRACK_COLOR)
    set_frame_pivot(barTrack, float2(0.0, 0.0))
    statBarTrackNodes[statIdx] = barTrack

    let barFill = panel(float2(barW * 0.5, barH), [])
    barFill?.UIImage.textureId = statBarFillTexture
    set_image_color(barFill, stat_fill_color_for_percent(float(kingdomStats[statIdx])))
    set_frame_pivot(barFill, float2(0.0, 0.0))
    statBarFillNodes[statIdx] = barFill

    let barStack = panel(float2(barW, barH), [barTrack, barFill])
    set_image_color(barStack, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(barStack, float2(0.0, 0.0))

    let barWrapper = vbox([barStack])
    set_alignment(barWrapper, LayoutAlignment.BottomCenter)
    set_frame_size(barWrapper, float2(columnW, barH))
    set_image_color(barWrapper, float4(0.0, 0.0, 0.0, 0.0))
    layout_stat_bar_stack_raise(columnW, barH, barStack)

    let column = vbox([icon, barWrapper])
    set_spacing(column, stat_icon_bar_spacing())
    set_alignment(column, LayoutAlignment.BottomCenter)
    set_frame_size(column, columnSize)
    set_frame_pivot(column, float2(0.5, 0.5))

    statColumnNodes[statIdx] = column
    statIconWrapNodes[statIdx] = icon
    statFillDisplayed[statIdx] = float(kingdomStats[statIdx])
    configure_info_hover_target(column)
    return column
}


def build_dialogue_ui() {
    let dialogueW = compute_dialogue_width()
    let border = ui_box_border()
    let padding = ui_h(DIALOGUE_BOX_PADDING)
    let innerW = dialogueW - 2.0 * border
    let textW = innerW - 2.0 * padding

    questionNameNode = text("")
    set_text_font_size(questionNameNode, ui_h(DIALOGUE_NAME_FONT_SIZE))
    set_text_color(questionNameNode, DIALOGUE_NAME_COLOR)
    apply_game_font(questionNameNode)
    configure_single_line_text(questionNameNode)
    set_frame_width(questionNameNode, textW)
    questionNameNode?.UIText.horAlignment = TextHorAlignment.Left
    questionNameNode?.UIText.vertAlignment = TextVertAlignment.Top
    questionNameNode?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(questionNameNode, float2(0.0, 0.0))

    questionTextNode = text("")
    set_text_font_size(questionTextNode, ui_h(QUESTION_FONT_SIZE))
    set_text_color(questionTextNode, DIALOGUE_TEXT_COLOR)
    apply_game_font(questionTextNode)
    set_frame_width(questionTextNode, textW)
    questionTextNode?.UIText.fontScaling = false
    questionTextNode?.UIText.autoResizeFrame = true
    questionTextNode?.UIText.wordWrapping = true
    questionTextNode?.UIText.horAlignment = TextHorAlignment.Left
    questionTextNode?.UIText.vertAlignment = TextVertAlignment.Top
    questionTextNode?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(questionTextNode, float2(0.0, 0.0))

    questionContentNode = vbox([questionNameNode, questionTextNode])
    set_spacing(questionContentNode, ui_h(DIALOGUE_NAME_SPACING))
    set_padding(questionContentNode, float4(padding, padding, padding, padding))
    set_alignment(questionContentNode, LayoutAlignment.TopLeft)
    set_frame_pivot(questionContentNode, float2(0.0, 0.0))

    questionBoxNode = panel(float2(innerW, 80.0), [questionContentNode])
    set_image_color(questionBoxNode, DIALOGUE_BOX_BG_COLOR)
    set_alignment(questionBoxNode, LayoutAlignment.TopLeft)
    set_frame_pivot(questionBoxNode, float2(0.0, 0.0))

    questionBorderNode = panel(float2(dialogueW, 86.0), [questionBoxNode])
    set_image_color(questionBorderNode, UI_BOX_BORDER_COLOR)
    set_alignment(questionBorderNode, LayoutAlignment.TopLeft)
    set_frame_pivot(questionBorderNode, float2(0.0, 0.0))
    set_frame_pos(questionBoxNode, float2(border, border))

    let buttonW = compute_answer_button_width(dialogueW)
    var choiceButtons : array<NodeId>
    for (i in range(MAX_CHOICES)) {
        let btn = create_answer_button("", buttonW)
        choiceButtonNodes[i] = btn
        push(choiceButtons, btn)
    }
    answerRoot = vbox(choiceButtons)
    set_spacing(answerRoot, ui_h(ANSWER_SPACING))
    set_alignment(answerRoot, LayoutAlignment.TopLeft)
    set_frame_pivot(answerRoot, float2(0.0, 0.0))
    layout_visible_choice_buttons(dialogueW)

    dialogueRoot = vbox([questionBorderNode, answerRoot])
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


def build_character() {
    let charSize = character_size()
    characterRestOffsetX = compute_character_rest_offset_x()

    characterRoot = panel(charSize, [])
    set_image_color(characterRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(characterRoot, zoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterRoot, float2(0.5, 1.0))
    set_frame_pivot(characterRoot, float2(0.5, 1.0))
    set_frame_pos(characterRoot, float2(0.0, 0.0))
    set_character_offset(characterRestOffsetX)
    add_component(characterRoot, new CharacterSlide())
    add_component(characterRoot, new CharacterHover())

    characterImageNode = panel(charSize, [])
    characterImageNode?.UIImage.textureId = characterTexture
    characterImageNode?.UIImage.size = charSize
    characterImageNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(characterImageNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(characterImageNode, characterRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterImageNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)

    // Outline renders on top of the sprite so the opaque panel does not bury it.
    characterOutlineNode = panel(charSize, [])
    characterOutlineNode?.UIImage.textureId = characterOutlineTexture
    characterOutlineNode?.UIImage.size = charSize
    characterOutlineNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(characterOutlineNode, CHARACTER_OUTLINE_COLOR)
    set_parent(characterOutlineNode, characterRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterOutlineNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    characterOutlineNode.isActive = false

    characterSilhouetteOverlay = panel(charSize, [])
    characterSilhouetteOverlay?.UIImage.textureId = characterTexture
    characterSilhouetteOverlay?.UIImage.size = charSize
    characterSilhouetteOverlay?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(characterSilhouetteOverlay, float4(0.0, 0.0, 0.0, 1.0))
    set_parent(characterSilhouetteOverlay, characterRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterSilhouetteOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    characterSilhouetteOverlay.isActive = false
}


def build_incoming_visitor() {
    let charSize = character_size()
    incomingVisitorRoot = panel(charSize, [])
    set_image_color(incomingVisitorRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(incomingVisitorRoot, zoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(incomingVisitorRoot, float2(0.5, 1.0))
    set_frame_pivot(incomingVisitorRoot, float2(0.5, 1.0))
    set_frame_pos(incomingVisitorRoot, float2(0.0, 0.0))
    incomingVisitorRoot.isActive = false

    incomingVisitorImageNode = panel(charSize, [])
    incomingVisitorImageNode?.UIImage.textureId = characterTexture
    incomingVisitorImageNode?.UIImage.size = charSize
    incomingVisitorImageNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(incomingVisitorImageNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(incomingVisitorImageNode, incomingVisitorRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(incomingVisitorImageNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)

    incomingVisitorSilhouetteNode = panel(charSize, [])
    incomingVisitorSilhouetteNode?.UIImage.textureId = characterTexture
    incomingVisitorSilhouetteNode?.UIImage.size = charSize
    incomingVisitorSilhouetteNode?.UIImage.uvRegion = characterTextureUvRegion
    set_image_color(incomingVisitorSilhouetteNode, float4(0.0, 0.0, 0.0, 1.0))
    set_parent(incomingVisitorSilhouetteNode, incomingVisitorRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(incomingVisitorSilhouetteNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    incomingVisitorSilhouetteNode.isActive = false
}


def compute_info_tooltip_content_height(textW : float) : float {
    let pad = ui_h(INFO_TOOLTIP_PADDING)
    let spacing = ui_h(INFO_TOOLTIP_SPACING)
    set_frame_width(infoTooltipTitleNode, textW)
    set_frame_width(infoTooltipBodyNode, textW)
    let titleH = max(infoTooltipTitleNode?.UIFrame.size.y, ui_h(INFO_TOOLTIP_TITLE_FONT_SIZE + 8.0))
    let bodyH = max(infoTooltipBodyNode?.UIFrame.size.y, ui_h(INFO_TOOLTIP_BODY_FONT_SIZE + 8.0))
    return titleH + bodyH + spacing + 2.0 * pad
}


def apply_info_tooltip_layout() {
    if (!infoTooltipBoxNode.isAlive) {
        return
    }
    let border = ui_box_border()
    let pad = ui_h(INFO_TOOLTIP_PADDING)
    let spacing = ui_h(INFO_TOOLTIP_SPACING)
    let innerW = ui_w(INFO_TOOLTIP_WIDTH) - 2.0 * border
    let textW = innerW - 2.0 * pad
    set_text_font_size(infoTooltipTitleNode, ui_h(INFO_TOOLTIP_TITLE_FONT_SIZE))
    set_text_font_size(infoTooltipBodyNode, ui_h(INFO_TOOLTIP_BODY_FONT_SIZE))
    let contentH = compute_info_tooltip_content_height(textW)
    if (infoTooltipContentNode.isAlive) {
        set_spacing(infoTooltipContentNode, spacing)
        set_padding(infoTooltipContentNode, float4(pad, pad, pad, pad))
        set_alignment(infoTooltipContentNode, LayoutAlignment.TopLeft)
        set_frame_size(infoTooltipContentNode, float2(innerW, contentH))
        infoTooltipContentNode?.UIVerticalLayout.childForceExpandWidth = true
        infoTooltipContentNode?.UIVerticalLayout.childForceExpandHeight = false
    }
    if (infoTooltipBoxNode.isAlive) {
        set_frame_size(infoTooltipBoxNode, float2(innerW, contentH))
    }
    if (infoTooltipRoot.isAlive) {
        set_frame_size(infoTooltipRoot, float2(ui_w(INFO_TOOLTIP_WIDTH), contentH + 2.0 * border))
    }
}


def build_info_tooltip_ui() {
    let border = ui_box_border()
    let pad = ui_h(INFO_TOOLTIP_PADDING)
    let innerW = ui_w(INFO_TOOLTIP_WIDTH) - 2.0 * border
    let textW = innerW - 2.0 * pad

    infoTooltipTitleNode = text("")
    set_text_font_size(infoTooltipTitleNode, ui_h(INFO_TOOLTIP_TITLE_FONT_SIZE))
    set_text_color(infoTooltipTitleNode, float4(1.0, 1.0, 1.0, 1.0))
    apply_game_font(infoTooltipTitleNode)
    infoTooltipTitleNode?.UIText.fontScaling = false
    infoTooltipTitleNode?.UIText.autoResizeFrame = true
    infoTooltipTitleNode?.UIText.wordWrapping = true
    infoTooltipTitleNode?.UIText.horAlignment = TextHorAlignment.Left
    infoTooltipTitleNode?.UIText.vertAlignment = TextVertAlignment.Top
    set_frame_width(infoTooltipTitleNode, textW)

    infoTooltipBodyNode = text("")
    set_text_font_size(infoTooltipBodyNode, ui_h(INFO_TOOLTIP_BODY_FONT_SIZE))
    set_text_color(infoTooltipBodyNode, float4(0.85, 0.78, 0.65, 1.0))
    apply_game_font(infoTooltipBodyNode)
    infoTooltipBodyNode?.UIText.fontScaling = false
    infoTooltipBodyNode?.UIText.autoResizeFrame = true
    infoTooltipBodyNode?.UIText.wordWrapping = true
    infoTooltipBodyNode?.UIText.horAlignment = TextHorAlignment.Left
    infoTooltipBodyNode?.UIText.vertAlignment = TextVertAlignment.Top
    set_frame_width(infoTooltipBodyNode, textW)

    infoTooltipContentNode = vbox([infoTooltipTitleNode, infoTooltipBodyNode])
    set_spacing(infoTooltipContentNode, ui_h(INFO_TOOLTIP_SPACING))
    set_alignment(infoTooltipContentNode, LayoutAlignment.TopLeft)
    set_padding(infoTooltipContentNode, float4(pad, pad, pad, pad))
    set_frame_pivot(infoTooltipContentNode, float2(0.0, 0.0))
    infoTooltipContentNode?.UIVerticalLayout.childForceExpandWidth = true
    infoTooltipContentNode?.UIVerticalLayout.childForceExpandHeight = false

    infoTooltipBoxNode = panel(float2(innerW, ui_h(80.0)), [infoTooltipContentNode])
    set_image_color(infoTooltipBoxNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(infoTooltipBoxNode, LayoutAlignment.TopLeft)
    set_frame_pivot(infoTooltipBoxNode, float2(0.0, 0.0))

    infoTooltipRoot = panel(float2(ui_w(INFO_TOOLTIP_WIDTH), ui_h(84.0)), [infoTooltipBoxNode])
    set_image_color(infoTooltipRoot, UI_BOX_BORDER_COLOR)
    set_alignment(infoTooltipRoot, LayoutAlignment.TopLeft)
    set_frame_pos(infoTooltipBoxNode, float2(border, border))
    set_frame_pivot(infoTooltipRoot, float2(0.5, 0.0))
    set_parent(infoTooltipRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    infoTooltipRoot.isActive = false
}


def configure_profile_text(node : NodeId) {
    apply_game_font(node)
    node?.UIText.fontScaling = false
    node?.UIText.autoResizeFrame = true
    node?.UIText.wordWrapping = true
    node?.UIText.horAlignment = TextHorAlignment.Left
    node?.UIText.vertAlignment = TextVertAlignment.Top
    node?.UIText.pivot = float2(0.0, 0.0)
    set_frame_pivot(node, float2(0.0, 0.0))
}


def build_character_profile_ui() {
    let border = ui_box_border()
    let panelW = ui_w(CHARACTER_PROFILE_PANEL_WIDTH)
    let innerW = panelW - 2.0 * border
    let portraitW = profile_portrait_width()
    let portraitH = profile_portrait_height()
    let btnH = ui_h(CHARACTER_PROFILE_BUTTON_HEIGHT)

    characterProfilePortraitNode = panel(float2(portraitW, portraitH), [])
    characterProfilePortraitNode?.UIImage.textureId = portraitTextures[0]
    characterProfilePortraitNode?.UIImage.size = float2(portraitW, portraitH)
    characterProfilePortraitNode?.UIImage.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    set_image_color(characterProfilePortraitNode, float4(1.0, 1.0, 1.0, 1.0))
    set_frame_pivot(characterProfilePortraitNode, float2(0.0, 0.0))

    characterProfileTitleNode = text("")
    set_text_font_size(characterProfileTitleNode, ui_h(CHARACTER_PROFILE_TITLE_FONT_SIZE))
    set_text_color(characterProfileTitleNode, float4(1.0, 1.0, 1.0, 1.0))
    configure_profile_text(characterProfileTitleNode)

    characterProfileDescBesideNode = text("")
    set_text_font_size(characterProfileDescBesideNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))
    set_text_color(characterProfileDescBesideNode, float4(0.85, 0.78, 0.65, 1.0))
    configure_profile_text(characterProfileDescBesideNode)

    characterProfileDescBelowNode = text("")
    set_text_font_size(characterProfileDescBelowNode, ui_h(CHARACTER_PROFILE_BODY_FONT_SIZE))
    set_text_color(characterProfileDescBelowNode, float4(0.85, 0.78, 0.65, 1.0))
    configure_profile_text(characterProfileDescBelowNode)

    characterProfileTextColumnNode = vbox([characterProfileTitleNode, characterProfileDescBesideNode])
    set_spacing(characterProfileTextColumnNode, ui_h(CHARACTER_PROFILE_SPACING))
    set_alignment(characterProfileTextColumnNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileTextColumnNode, float2(0.0, 0.0))
    characterProfileTextColumnNode?.UIVerticalLayout.childForceExpandWidth = true
    characterProfileTextColumnNode?.UIVerticalLayout.childForceExpandHeight = false

    characterProfileHeaderNode = hbox([characterProfilePortraitNode, characterProfileTextColumnNode])
    set_spacing(characterProfileHeaderNode, ui_w(CHARACTER_PROFILE_HEADER_GAP))
    set_alignment(characterProfileHeaderNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileHeaderNode, float2(0.0, 0.0))
    characterProfileHeaderNode?.UIHorizontalLayout.childForceExpandWidth = false
    characterProfileHeaderNode?.UIHorizontalLayout.childForceExpandHeight = false

    characterProfileLikesNode = text("")
    set_text_font_size(characterProfileLikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))
    set_text_color(characterProfileLikesNode, float4(0.55, 0.88, 0.45, 1.0))
    configure_profile_text(characterProfileLikesNode)

    characterProfileDislikesNode = text("")
    set_text_font_size(characterProfileDislikesNode, ui_h(CHARACTER_PROFILE_TRAIT_FONT_SIZE))
    set_text_color(characterProfileDislikesNode, float4(0.92, 0.45, 0.38, 1.0))
    configure_profile_text(characterProfileDislikesNode)

    let okayBtnW = compute_profile_okay_button_outer_width()
    characterProfileOkayButtonNode = create_pause_menu_button("Okay", true, okayBtnW, btnH)

    characterProfileOkayRowNode = hbox([characterProfileOkayButtonNode])
    set_alignment(characterProfileOkayRowNode, LayoutAlignment.MiddleCenter)
    set_frame_pivot(characterProfileOkayRowNode, float2(0.0, 0.0))
    characterProfileOkayRowNode?.UIHorizontalLayout.childForceExpandWidth = false
    characterProfileOkayRowNode?.UIHorizontalLayout.childForceExpandHeight = false

    characterProfileContentNode = vbox([
        characterProfileHeaderNode,
        characterProfileDescBelowNode,
        characterProfileLikesNode,
        characterProfileDislikesNode,
        characterProfileOkayRowNode
    ])
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
    set_image_color(characterProfileInnerNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(characterProfileInnerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfileInnerNode, float2(0.0, 0.0))
    set_frame_pos(characterProfileInnerNode, float2(border, border))

    characterProfilePanelNode = panel(float2(panelW, contentH + 2.0 * border), [characterProfileInnerNode])
    set_image_color(characterProfilePanelNode, UI_BOX_BORDER_COLOR)
    set_alignment(characterProfilePanelNode, LayoutAlignment.TopLeft)
    set_frame_pivot(characterProfilePanelNode, float2(0.0, 0.0))
    add_component(characterProfilePanelNode, new UIButton())
    set_parent(characterProfilePanelNode, characterProfileOverlay, AddChildStrategy.KeepLocalTransform)
    characterProfileSlideX = character_profile_panel_slide_hidden_left_x()
    set_character_profile_slide_x(characterProfileSlideX)
    characterProfilePanelNode.isActive = false
}


def build_ui() {
    let res = float2(get_resolution())
    uiCanvas = canvas(res)

    zoomRoot = panel(res, [])
    set_parent(zoomRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(zoomRoot, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_frame_pivot(zoomRoot, float2(0.5, 0.5))

    backgroundNode = panel(res, [])
    backgroundNode?.UIImage.textureId = backgroundTexture
    set_image_color(backgroundNode, float4(1.0, 1.0, 1.0, 1.0))
    set_parent(backgroundNode, zoomRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(backgroundNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)

    build_character()
    build_incoming_visitor()
    build_dialogue_ui()

    topBarRoot = panel(float2(res.x, ui_h(TOP_BAR_HEIGHT)), [])
    set_image_color(topBarRoot, TOP_BAR_BG_COLOR)
    set_parent(topBarRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(topBarRoot, float2(0.0, 0.0), float2(1.0, 0.0))
    set_frame_pivot(topBarRoot, float2(0.5, 0.0))

    var mainStatColumns : array<NodeId>
    for (i in range(STAT_MAIN_COUNT)) {
        push(mainStatColumns, create_stat_column(i))
    }
    let mainStatGroup = hbox(mainStatColumns)
    set_spacing(mainStatGroup, ui_w(STAT_COLUMN_GAP))
    set_alignment(mainStatGroup, LayoutAlignment.MiddleCenter)
    let columnSize = stat_column_size()
    set_frame_size(mainStatGroup, float2(stat_main_group_width(), columnSize.y))

    statBarDividerNode = panel(float2(ui_w(STAT_BAR_DIVIDER_WIDTH), ui_h(STAT_BAR_DIVIDER_HEIGHT)), [])
    set_image_color(statBarDividerNode, STAT_BAR_DIVIDER_COLOR)

    statBarRoot = hbox([mainStatGroup, statBarDividerNode, create_stat_column(STAT_SUCCESSION_IDX)])
    set_spacing(statBarRoot, ui_w(STAT_BAR_DIVIDER_GAP))
    set_alignment(statBarRoot, LayoutAlignment.MiddleCenter)
    set_frame_size(statBarRoot, float2(stat_bar_total_width(), columnSize.y))
    set_parent(statBarRoot, topBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(statBarRoot, float2(0.5, 0.5))
    set_frame_pivot(statBarRoot, float2(0.5, 0.5))

    dayTextNode = text("Day 1")
    set_text_font_size(dayTextNode, ui_h(DAY_FONT_SIZE))
    set_text_color(dayTextNode, float4(1.0, 1.0, 1.0, 1.0))
    apply_game_font(dayTextNode)
    configure_single_line_text(dayTextNode)
    configure_info_hover_target(dayTextNode)

    nicknameTextNode = text(DEFAULT_NICKNAME)
    set_text_font_size(nicknameTextNode, ui_h(NICKNAME_FONT_SIZE))
    set_text_color(nicknameTextNode, float4(0.85, 0.78, 0.65, 1.0))
    apply_game_font(nicknameTextNode)
    configure_single_line_text(nicknameTextNode)
    configure_info_hover_target(nicknameTextNode)

    topBarLeftInfoNode = hbox([dayTextNode, nicknameTextNode])
    set_spacing(topBarLeftInfoNode, ui_w(20.0))
    set_alignment(topBarLeftInfoNode, LayoutAlignment.MiddleLeft)
    set_frame_size(topBarLeftInfoNode, float2(ui_w(480.0), ui_h(TOP_BAR_HEIGHT)))
    set_parent(topBarLeftInfoNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(topBarLeftInfoNode, float2(0.0, 0.5))
    set_frame_pos(topBarLeftInfoNode, float2(ui_w(TOP_BAR_HORIZONTAL_PADDING), 0.0))
    add_anchor(topBarLeftInfoNode, float2(0.0, 0.5))
    set_anchor_insets(topBarLeftInfoNode, ui_w(TOP_BAR_HORIZONTAL_PADDING), 0.0)

    menuButtonNode = create_menu_button("Pause")
    set_parent(menuButtonNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    set_frame_pivot(menuButtonNode, float2(1.0, 0.5))
    set_frame_pos(menuButtonNode, float2(-ui_w(TOP_BAR_PAUSE_MARGIN), 0.0))
    add_anchor(menuButtonNode, float2(1.0, 0.5))
    set_anchor_insets(menuButtonNode, -ui_w(TOP_BAR_PAUSE_MARGIN), 0.0)

    topBarBorderNode = panel(float2(res.x, ui_box_border()), [])
    set_image_color(topBarBorderNode, UI_BOX_BORDER_COLOR)
    set_parent(topBarBorderNode, topBarRoot, AddChildStrategy.KeepLocalTransform)
    add_anchor(topBarBorderNode, float2(0.0, 1.0), float2(1.0, 1.0))
    set_frame_pivot(topBarBorderNode, float2(0.5, 1.0))

    menuOverlay = panel(res, [])
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

    menuContinueButtonNode = create_pause_menu_button("Continue", true, buttonW, btnH)
    menuOptionsButtonNode = create_pause_menu_button("Options", false, buttonW, btnH)
    menuExitButtonNode = create_pause_menu_button("Exit", false, buttonW, btnH)
    menuPanelContentNode = vbox([menuContinueButtonNode, menuOptionsButtonNode, menuExitButtonNode])
    set_spacing(menuPanelContentNode, btnSpacing)
    set_alignment(menuPanelContentNode, LayoutAlignment.TopLeft)
    set_padding(menuPanelContentNode, float4(menuPad, menuPad, menuPad, menuPad))
    set_frame_pivot(menuPanelContentNode, float2(0.0, 0.0))
    set_frame_size(menuPanelContentNode, float2(innerW, contentH))
    menuPanelContentNode?.UIVerticalLayout.childForceExpandWidth = true
    menuPanelContentNode?.UIVerticalLayout.childForceExpandHeight = false

    menuPanelInnerNode = panel(float2(innerW, contentH), [menuPanelContentNode])
    set_image_color(menuPanelInnerNode, DEATH_SUMMARY_BOX_BG_COLOR)
    set_alignment(menuPanelInnerNode, LayoutAlignment.TopLeft)
    set_frame_pivot(menuPanelInnerNode, float2(0.0, 0.0))

    menuPanelNode = panel(float2(panelW, contentH + 2.0 * menuBorder), [menuPanelInnerNode])
    set_image_color(menuPanelNode, UI_BOX_BORDER_COLOR)
    set_alignment(menuPanelNode, LayoutAlignment.TopLeft)
    set_frame_pos(menuPanelInnerNode, float2(menuBorder, menuBorder))
    set_frame_pivot(menuPanelNode, float2(0.0, 0.0))
    set_parent(menuPanelNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    menuPanelSlideX = menu_panel_slide_hidden_left_x()
    set_menu_panel_slide_x(menuPanelSlideX)
    menuPanelNode.isActive = false

    characterProfileOverlay = panel(res, [])
    set_parent(characterProfileOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(characterProfileOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    set_image_color(characterProfileOverlay, float4(MENU_OVERLAY_COLOR.x, MENU_OVERLAY_COLOR.y, MENU_OVERLAY_COLOR.z, 0.0))
    add_component(characterProfileOverlay, new UIButton())
    characterProfileOverlay.isActive = false

    build_character_profile_ui()

    deathFadeOverlay = panel(res, [])
    set_image_color(deathFadeOverlay, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(deathFadeOverlay, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(deathFadeOverlay, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    deathFadeOverlay.isActive = false

    deathScreenNode = panel(res, [])
    deathScreenNode?.UIImage.textureId = deathScreenTexture
    set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, 0.0))
    set_parent(deathScreenNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(deathScreenNode, TOP_LEFT_ANCHOR, BOTTOM_RIGHT_ANCHOR)
    deathScreenNode.isActive = false

    deathSummaryTextNode = text("")
    set_text_font_size(deathSummaryTextNode, ui_h(DEATH_SUMMARY_FONT_SIZE))
    set_text_color(deathSummaryTextNode, float4(1.0, 1.0, 1.0, 0.0))
    apply_game_font(deathSummaryTextNode)
    deathSummaryTextNode?.UIText.fontScaling = false
    deathSummaryTextNode?.UIText.autoResizeFrame = true
    deathSummaryTextNode?.UIText.wordWrapping = true
    deathSummaryTextNode?.UIText.horAlignment = TextHorAlignment.Center

    deathRecordTextNode = text("")
    set_text_font_size(deathRecordTextNode, ui_h(DEATH_RECORD_FONT_SIZE))
    set_text_color(deathRecordTextNode, float4(0.85, 0.85, 0.85, 0.0))
    apply_game_font(deathRecordTextNode)
    deathRecordTextNode?.UIText.fontScaling = false
    deathRecordTextNode?.UIText.autoResizeFrame = true
    deathRecordTextNode?.UIText.wordWrapping = true
    deathRecordTextNode?.UIText.horAlignment = TextHorAlignment.Center

    tryAgainButtonNode = create_answer_button("Try again", ui_w(TRY_AGAIN_BUTTON_WIDTH))
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
    set_alignment(tryAgainRowNode, LayoutAlignment.MiddleCenter)
    set_frame_pivot(tryAgainRowNode, float2(0.5, 0.5))

    deathSummaryContentNode = vbox([deathSummaryTextNode, deathRecordTextNode, tryAgainRowNode])
    set_spacing(deathSummaryContentNode, ui_h(20.0))
    set_alignment(deathSummaryContentNode, LayoutAlignment.MiddleCenter)
    set_padding(deathSummaryContentNode, float4(ui_h(DEATH_SUMMARY_BOX_PADDING), ui_h(DEATH_SUMMARY_BOX_PADDING), ui_h(DEATH_SUMMARY_BOX_PADDING), ui_h(DEATH_SUMMARY_BOX_PADDING)))
    deathSummaryContentNode?.UIVerticalLayout.childForceExpandWidth = true
    tryAgainRowNode?.UIHorizontalLayout.childForceExpandWidth = false
    tryAgainRowNode?.UIHorizontalLayout.childForceExpandHeight = false
    set_frame_pivot(deathSummaryContentNode, float2(0.0, 0.0))

    let summaryInnerW = ui_w(DEATH_SUMMARY_BOX_WIDTH) - 2.0 * ui_box_border()
    deathSummaryBoxNode = panel(float2(summaryInnerW, ui_h(200.0)), [deathSummaryContentNode])
    set_image_color(deathSummaryBoxNode, float4(DEATH_SUMMARY_BOX_BG_COLOR.x, DEATH_SUMMARY_BOX_BG_COLOR.y, DEATH_SUMMARY_BOX_BG_COLOR.z, 0.0))
    set_alignment(deathSummaryBoxNode, LayoutAlignment.TopLeft)
    set_frame_pivot(deathSummaryBoxNode, float2(0.0, 0.0))

    deathSummaryBorderNode = panel(float2(ui_w(DEATH_SUMMARY_BOX_WIDTH), ui_h(204.0)), [deathSummaryBoxNode])
    set_image_color(deathSummaryBorderNode, float4(UI_BOX_BORDER_COLOR.x, UI_BOX_BORDER_COLOR.y, UI_BOX_BORDER_COLOR.z, 0.0))
    set_alignment(deathSummaryBorderNode, LayoutAlignment.TopLeft)
    set_frame_pivot(deathSummaryBorderNode, float2(0.5, 0.5))
    set_frame_pos(deathSummaryBoxNode, float2(ui_box_border(), ui_box_border()))

    deathSummaryRoot = deathSummaryBorderNode
    set_parent(deathSummaryRoot, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(deathSummaryRoot, MIDDLE_CENTER_ANCHOR)
    deathSummaryRoot.isActive = false
    apply_death_summary_layout()

    build_info_tooltip_ui()

    add_component(uiCanvas, new StatBarDisplay())
    add_component(uiCanvas, new MenuInput())
    add_component(uiCanvas, new CameraZoom())
    add_component(uiCanvas, new DialogueFlow())
    add_component(uiCanvas, new AnswerChoiceHover())
    add_component(uiCanvas, new MenuButtonHover())
    add_component(uiCanvas, new CharacterProfileButtonHover())
    add_component(uiCanvas, new CharacterClick())
    add_component(uiCanvas, new InfoTooltipDisplay())
    add_component(uiCanvas, new DialogueLayout())
    add_component(uiCanvas, new DefeatFlow())

    apply_top_bar_layout()
    apply_stat_bar_layout()
    apply_menu_layout()
    apply_character_profile_layout()
    apply_info_tooltip_layout()
}


def on_choice_0_click(evt : UIMouseEvent) {
    select_choice(0)
}


def on_choice_1_click(evt : UIMouseEvent) {
    select_choice(1)
}


def on_choice_2_click(evt : UIMouseEvent) {
    select_choice(2)
}


def on_choice_3_click(evt : UIMouseEvent) {
    select_choice(3)
}


def on_choice_4_click(evt : UIMouseEvent) {
    select_choice(4)
}


def on_choice_0_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 0
    }
}


def on_choice_1_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 1
    }
}


def on_choice_2_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 2
    }
}


def on_choice_3_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 3
    }
}


def on_choice_4_mouse_over(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && !is_game_paused()) {
        hoveredChoice = 4
    }
}


def on_choice_0_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 0) {
        hoveredChoice = HOVER_NONE
    }
}


def on_choice_1_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 1) {
        hoveredChoice = HOVER_NONE
    }
}


def on_choice_2_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 2) {
        hoveredChoice = HOVER_NONE
    }
}


def on_choice_3_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 3) {
        hoveredChoice = HOVER_NONE
    }
}


def on_choice_4_mouse_out(evt : UIMouseEvent) {
    if (dialogPhase == DIALOG_CHOOSING && hoveredChoice == 4) {
        hoveredChoice = HOVER_NONE
    }
}


def create_solid_stat_bar_texture() : TextureId {
    var pixels : array<uint>
    pixels |> resize(1)
    pixels[0] = 0xFFFFFFFFu
    return create_texture(1, 1, pixels, TextureDeclaration(
        filter = TextureFilter.Point,
        addressing = TextureAddress.Clamp,
        generateMipLevels = false
    ))
}


def load_resources() {
    backgroundTexture = request_texture(BACKGROUND_TEXTURE_PATH)
    kingTexture = request_texture(KING_TEXTURE_PATH)
    peasantTexture = request_texture(PEASANT_TEXTURE_PATH)
    deathScreenTexture = request_texture(DEATH_SCREEN_TEXTURE_PATH)
    characterTexture = kingTexture
    gameFont = request_font(GAME_FONT_PATH)
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        visitorTextures[i] = request_texture(VISITOR_TEXTURE_PATHS[i])
    }
    for (i in range(STAT_COUNT)) {
        statTextures[i] = request_texture(STAT_TEXTURE_PATHS[i])
    }
    for (i in range(CHARACTER_COUNT)) {
        portraitTextures[i] = request_texture(PORTRAIT_TEXTURE_PATHS[i])
    }
    statBarTrackTexture = create_solid_stat_bar_texture()
    statBarFillTexture = create_solid_stat_bar_texture()
    precache_all_character_visuals()
    update_character_texture_aspect(characterTexture)
    roll_next_visitor_texture()
}


[export]
def on_initialize() {
    reset_kingdom_stats()
    reset_stat_anim_state()
    currentEncounterIdx = 0
    currentNodeIdx = get_encounter(0).startNodeIdx
    pendingNextNodeIdx = NO_NEXT_NODE

    cameraNode = create_node(NodeData(name = "camera"))
    add_component(cameraNode, new Camera(backgroundColor = BG_COLOR))

    create_render_settings()

    load_resources()
    build_ui()
    update_stat_bar_anims(0.0)

    add_ui_event_listener(answer_button_fill(menuButtonNode), UIMouseEventType.MouseClick, @@on_menu_button_click)
    add_ui_event_listener(answer_button_fill(menuButtonNode), UIMouseEventType.MouseOver, @@on_menu_button_mouse_over)
    add_ui_event_listener(answer_button_fill(menuButtonNode), UIMouseEventType.MouseOut, @@on_menu_button_mouse_out)
    add_ui_event_listener(answer_button_fill(menuContinueButtonNode), UIMouseEventType.MouseClick, @@on_menu_continue_click)
    add_ui_event_listener(answer_button_fill(menuContinueButtonNode), UIMouseEventType.MouseOver, @@on_menu_continue_mouse_over)
    add_ui_event_listener(answer_button_fill(menuContinueButtonNode), UIMouseEventType.MouseOut, @@on_menu_continue_mouse_out)
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
    add_ui_event_listener(characterProfileOverlay, UIMouseEventType.MouseClick, @@on_character_profile_overlay_click)
    add_ui_event_listener(characterProfilePanelNode, UIMouseEventType.MouseClick, @@on_character_profile_panel_click)
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

    update_day_text()
    update_nickname_text()

    cameraZoomT = 0.0
    apply_camera_zoom()
    start_character_enter()
}


[export]
def on_update() {
    let dt = get_delta_time()
    update_menu_slide(dt)
    update_character_profile_slide(dt)

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
    let choiceCount = get_current_dialogue_node().choiceCount
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
    if (characterProfileOverlay.isAlive) {
        set_frame_size(characterProfileOverlay, float2(res))
    }
    if (menuPanelNode.isAlive) {
        apply_menu_layout()
    }
    if (characterProfilePanelNode.isAlive) {
        apply_character_profile_layout()
    }
    if (deathFadeOverlay.isAlive) {
        set_frame_size(deathFadeOverlay, float2(res))
    }
    if (deathScreenNode.isAlive) {
        set_frame_size(deathScreenNode, float2(res))
    }
    if (zoomRoot.isAlive) {
        set_frame_size(zoomRoot, float2(res))
    }
    apply_top_bar_layout()
    apply_stat_bar_layout()
    apply_menu_layout()
    apply_character_layout()
    apply_death_summary_layout()
    apply_info_tooltip_layout()
    if (hoveredInfoTarget != INFO_HOVER_NONE && infoTooltipRoot.isAlive && infoTooltipRoot.isActive) {
        position_info_tooltip(hoveredInfoTarget)
    }
    apply_camera_zoom()
}


class CharacterHover : Component {
    def override on_update {
        if (!characterRoot.isAlive || !characterRoot.isActive) {
            characterHovered = false
        } else {
            characterHovered = is_mouse_over_character_opaque()
        }
        let dt = get_delta_time()
        let target = characterHovered ? 1.0 : 0.0
        characterHoverT = move_toward(characterHoverT, target, ANSWER_HOVER_LERP_SPEED * dt)
        apply_character_outline_visual(characterHoverT)
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


class CharacterSlide : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (characterAnimPhase == CHARACTER_ANIM_EXIT) {
            let dt = get_delta_time()
            update_parallel_incoming_visitor(dt)
            characterAnimOffsetX -= ui_w(CHARACTER_ANIM_EXIT_SPEED) * dt
            characterWalkBobTimer += dt
            let bobPhase = cos(characterWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
            let bobY = -bobPhase * ui_h(CHARACTER_WALK_BOB_AMPLITUDE)
            set_character_offset(characterAnimOffsetX, bobY)
            characterRevealT = character_exit_fade_t(characterAnimOffsetX)
            apply_character_image_color(characterRevealT)

            if (characterAnimOffsetX <= character_exit_end_offset()) {
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
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_ENTER) {
            let dt = get_delta_time()
            characterAnimOffsetX += ui_w(CHARACTER_ANIM_ENTER_SPEED) * dt
            characterWalkBobTimer += dt
            // One-sided bob: trough sits amplitude below the border, peak lands feet on the border.
            let bobPhase = cos(characterWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
            let bobY = -bobPhase * ui_h(CHARACTER_WALK_BOB_AMPLITUDE)
            apply_character_image_color(0.0)

            if (characterAnimOffsetX >= characterRestOffsetX) {
                characterAnimOffsetX = characterRestOffsetX
                characterWalkBobTimer = 0.0
                set_character_offset(characterRestOffsetX)
                characterRevealT = 0.0
                characterAnimPhase = CHARACTER_ANIM_REVEAL
                apply_character_image_color(0.0)
            } else {
                set_character_offset(characterAnimOffsetX, bobY)
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_REVEAL) {
            let dt = get_delta_time()
            characterRevealT += dt / CHARACTER_REVEAL_DURATION
            apply_character_breath()
            if (characterRevealT >= 1.0) {
                characterRevealT = 1.0
                apply_character_image_color(1.0)
                characterAnimPhase = CHARACTER_ANIM_IDLE
                characterBreathTimer = 0.0
                start_camera_zoom_in()
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
            let dt = get_delta_time()
            let totalChars = length(typewriterFullText)
            typewriterAccumulator += TYPEWRITER_CHARS_PER_SEC * dt
            while (typewriterCharCount < totalChars && typewriterAccumulator >= 1.0) {
                typewriterCharCount++
                typewriterAccumulator -= 1.0
            }
            questionTextNode?.UIText.text = slice(typewriterFullText, 0, typewriterCharCount)
            if (typewriterCharCount >= totalChars) {
                finish_typewriter()
            }
            return
        }

        if (dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
            postResponseHoldTimer -= get_delta_time()
            if (postResponseHoldTimer <= 0.0) {
                hide_dialogue_ui()
                dialogPhase = DIALOG_IDLE
                if (defeatPhase == DEFEAT_PEASANT_DIALOGUE) {
                    defeatPhase = DEFEAT_WAIT_FADE
                    start_character_exit()
                } else {
                    start_character_exit()
                }
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
            let dt = get_delta_time()
            cameraZoomT += CAMERA_ZOOM_SPEED * dt
            if (cameraZoomT >= 1.0) {
                cameraZoomT = 1.0
                apply_camera_zoom()
                cameraZoomPhase = CAM_ZOOM_IDLE
                if (dialogPhase == DIALOG_IDLE) {
                    start_typewriter()
                }
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
        if (is_in_defeat_flow()) {
            return
        }
        for (cmd in get_input_command_buffer()) {
            match (cmd) {
                if (RawKeyboardInputEvent(kind = RawKeyboardInputEventKind.KeyDown, buttonIdx = $v(buttonIdx))) {
                    if (buttonIdx == KeyCode.Escape) {
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
        apply_dialogue_layout()
    }
}


class AnswerChoiceHover : Component {
    def override on_update {
        let choosing = (dialogPhase == DIALOG_CHOOSING && !is_game_paused())
        let dt = get_delta_time()
        let choiceCount = get_current_dialogue_node().choiceCount

        for (i in range(MAX_CHOICES)) {
            let target = (choosing && hoveredChoice == i && i < choiceCount) ? 1.0 : 0.0
            choiceHoverT[i] = move_toward(choiceHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            let btn = choiceButtonNodes[i]
            if (btn.isAlive && i < choiceCount) {
                apply_answer_button_visual(btn, choiceHoverT[i])
            }
        }
    }
}


class MenuButtonHover : Component {
    def override on_update {
        let dt = get_delta_time()

        let pauseTarget = (!is_in_defeat_flow() && menuButtonHovered) ? 1.0 : 0.0
        menuButtonHoverT = move_toward(menuButtonHoverT, pauseTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuButtonNode.isAlive) {
            apply_menu_button_visual(menuButtonNode, menuButtonHoverT, true)
        }

        let continueTarget = (is_pause_menu_open() && menuContinueButtonHovered) ? 1.0 : 0.0
        menuContinueButtonHoverT = move_toward(menuContinueButtonHoverT, continueTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuContinueButtonNode.isAlive) {
            apply_menu_button_visual(menuContinueButtonNode, menuContinueButtonHoverT, true)
        }
    }
}


class CharacterProfileButtonHover : Component {
    def override on_update {
        let dt = get_delta_time()
        let okayTarget = (is_character_profile_open() && characterProfileOkayHovered) ? 1.0 : 0.0
        characterProfileOkayHoverT = move_toward(characterProfileOkayHoverT, okayTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (characterProfileOkayButtonNode.isAlive) {
            apply_menu_button_visual(characterProfileOkayButtonNode, characterProfileOkayHoverT, true)
        }
    }
}


def resize_info_tooltip_panel() {
    apply_info_tooltip_layout()
}


class InfoTooltipDisplay : Component {
    def override on_update {
        if (hoveredInfoTarget == INFO_HOVER_NONE) {
            return
        }
        if (is_game_paused() || is_in_defeat_flow()) {
            hide_info_tooltip()
            return
        }
        update_info_tooltip_content()
        resize_info_tooltip_panel()
        position_info_tooltip(hoveredInfoTarget)
    }
}

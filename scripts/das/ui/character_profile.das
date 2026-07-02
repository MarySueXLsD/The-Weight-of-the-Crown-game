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

module character_profile public

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
    close_character_profile()
}



def public on_character_profile_panel_click(evt : UIMouseEvent) {
    pass
}



def public on_character_profile_okay_click(evt : UIMouseEvent) {
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




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
require scripts/das/ui/menus

module hud public

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
}



def public apply_bottom_bar_layout() {
    let resX = screen_w()
    let barH = ui_h(BOTTOM_BAR_HEIGHT)
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
    lineNode?.UIText.fontScaling = false
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
    if (pendingAdvisorActionIdx >= 0) {
        execute_advisor_action(pendingAdvisorActionIdx)
    }
}



def public on_advisor_confirm_no_click(evt : UIMouseEvent) {
    hide_advisor_confirm()
}



def public on_advisor_confirm_overlay_click(evt : UIMouseEvent) {
    hide_advisor_confirm()
}



def public on_advisor_confirm_panel_click(evt : UIMouseEvent) {
    pass
}



def public on_advisor_popup_overlay_click(evt : UIMouseEvent) {
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
    pass
}



def public on_advisor_icon_click(evt : UIMouseEvent) {
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




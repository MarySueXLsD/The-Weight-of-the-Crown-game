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

module menus public

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
}



def public apply_settings_music_volume(vol : float) {
    if (valid(backgroundMusicHandle) && is_playing(backgroundMusicHandle)) {
        set_volume(backgroundMusicHandle, background_music_base_volume() * vol, BACKGROUND_MUSIC_FADE_DURATION)
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
    set(storage, "master", settingsMasterVolume)
    set(storage, "music", settingsMusicVolume)
    set(storage, "fullscreen", settingsFullscreen)
    set(storage, "language", settingsLanguageIdx)
    save_storage(storage, OPTIONS_STORAGE_KEY)
}



def public load_game_options() {
    load_storage(OPTIONS_STORAGE_KEY) $(var storage : GenericStorage#) {
        settingsMasterVolume = get_or(storage, "master", 1.0)
        settingsMusicVolume = get_or(storage, "music", 1.0)
        settingsFullscreen = get_or(storage, "fullscreen", false)
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
    settingsMasterVolume = value
    apply_settings_master_volume(value)
    save_game_options()
}



def public on_options_music_volume_change(value : float) {
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
    mainMenuOptionsTitleNode?.UIText.fontScaling = false
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
    mainMenuOptionsLanguageRowNode = create_options_language_row()
    mainMenuOptionsLanguageRowNode.name = "mainMenuOptionsLanguageRowNode"

    mainMenuOptionsVersionTextNode = text(options_version())
    mainMenuOptionsVersionTextNode.name = "mainMenuOptionsVersionTextNode"
    set_text_font_size(mainMenuOptionsVersionTextNode, ui_h(OPTIONS_VERSION_FONT_SIZE))
    set_text_color(mainMenuOptionsVersionTextNode, OPTIONS_TEXT_COLOR)
    apply_ui_font(mainMenuOptionsVersionTextNode)
    mainMenuOptionsVersionTextNode?.UIText.fontScaling = false
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
    set_button_label_text(advisorButtonNode, advisor_bar_button())
}



def public refresh_options_ui_labels() {
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



def public apply_menu_button_visual(btnBorderNode : NodeId; hoverT : float; enabled : bool) {
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



def public on_menu_button_click(evt : UIMouseEvent) {
    if (is_in_defeat_flow()) {
        return
    }
    toggle_menu()
}



def public on_menu_continue_click(evt : UIMouseEvent) {
    close_pause_menu()
}



def public on_menu_exit_click(evt : UIMouseEvent) {
    if (!is_pause_menu_open()) {
        return
    }
    return_to_main_menu()
}



def public on_menu_exit_mouse_over(evt : UIMouseEvent) {
    if (is_pause_menu_open()) {
        menuExitButtonHovered = true
    }
}



def public on_menu_exit_mouse_out(evt : UIMouseEvent) {
    menuExitButtonHovered = false
}



def public on_menu_button_mouse_over(evt : UIMouseEvent) {
    if (!is_in_defeat_flow()) {
        menuButtonHovered = true
    }
}



def public on_menu_button_mouse_out(evt : UIMouseEvent) {
    menuButtonHovered = false
}



def public on_menu_continue_mouse_over(evt : UIMouseEvent) {
    if (is_pause_menu_open()) {
        menuContinueButtonHovered = true
    }
}



def public on_menu_continue_mouse_out(evt : UIMouseEvent) {
    menuContinueButtonHovered = false
}



def public on_menu_overlay_click(evt : UIMouseEvent) {
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
    if (!is_on_main_menu() || is_intro_cutscene_active() || !hasSaveGame || is_continue_fade_active()) {
        return
    }
    begin_continue_from_menu()
}



def public on_main_menu_about_click(evt : UIMouseEvent) {
    pass
}



def public on_main_menu_new_game_click(evt : UIMouseEvent) {
    if (!is_on_main_menu() || is_intro_cutscene_active() || is_continue_fade_active()) {
        return
    }
    launch_new_game()
}



def public on_main_menu_options_click(evt : UIMouseEvent) {
    if (!is_on_main_menu() || is_intro_cutscene_active()) {
        return
    }
    open_main_menu_options()
}



def public on_main_menu_options_overlay_click(evt : UIMouseEvent) {
    close_main_menu_options()
}



def public on_main_menu_options_panel_click(evt : UIMouseEvent) {
    pass
}



def public on_main_menu_options_back_click(evt : UIMouseEvent) {
    close_main_menu_options()
}



def public on_main_menu_options_back_mouse_over(evt : UIMouseEvent) {
    if (is_main_menu_options_open()) {
        mainMenuOptionsBackButtonHovered = true
    }
}



def public on_main_menu_options_back_mouse_out(evt : UIMouseEvent) {
    mainMenuOptionsBackButtonHovered = false
}



def public on_main_menu_exit_click(evt : UIMouseEvent) {
    if (!is_on_main_menu() || is_intro_cutscene_active()) {
        return
    }
    quit_application()
}



def public on_main_menu_button_0_mouse_over(evt : UIMouseEvent) {
    if (is_on_main_menu()) {
        mainMenuButtonHovered[0] = true
    }
}



def public on_main_menu_button_1_mouse_over(evt : UIMouseEvent) {
    if (is_on_main_menu()) {
        mainMenuButtonHovered[1] = true
    }
}



def public on_main_menu_button_2_mouse_over(evt : UIMouseEvent) {
    if (is_on_main_menu()) {
        mainMenuButtonHovered[2] = true
    }
}



def public on_main_menu_button_3_mouse_over(evt : UIMouseEvent) {
    if (is_on_main_menu()) {
        mainMenuButtonHovered[3] = true
    }
}



def public on_main_menu_button_4_mouse_over(evt : UIMouseEvent) {
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




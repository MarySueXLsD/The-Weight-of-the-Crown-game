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

module cutscenes public

def public intro_cutscene_music_target_volume() : float {
    return INTRO_CUTSCENE_MUSIC_VOLUME * settingsMusicVolume
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
    for (cmd in get_input_command_buffer()) {
        if (cmd is RawMouseInputEvent) {
            let mouse = cmd as RawMouseInputEvent
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
    return introCutsceneSkipRightMouseDown
}



def public apply_intro_cutscene_skip_alpha() {
    let a = introCutsceneSkipAlpha
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
        introCutsceneSkipIdleT = 0.0
        apply_intro_cutscene_skip_alpha()
        set_intro_cutscene_skip_visible(false)
        return
    }

    update_intro_cutscene_skip_input_state()

    let inputActive = intro_cutscene_skip_input_active()
    if (inputActive || is_intro_cutscene_skip_hold_pressed()) {
        introCutsceneSkipIdleT = 0.0
    } else {
        introCutsceneSkipIdleT += dt
    }

    let wantVisible = inputActive || is_intro_cutscene_skip_hold_pressed() || introCutsceneSkipIdleT < CUTSCENE_SKIP_HINT_IDLE_HIDE_DELAY
    let targetAlpha = (wantVisible ? 1.0 : 0.0)
    let fadeSpeed = 1.0 / CUTSCENE_SKIP_HINT_FADE_DURATION
    introCutsceneSkipAlpha = move_toward(introCutsceneSkipAlpha, targetAlpha, fadeSpeed * dt)
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
    let barW = introCutsceneSkipBarBgNode?.UIFrame.size.x
    let barH = introCutsceneSkipBarBgNode?.UIFrame.size.y
    let fillW = max(0.0, barW * clamp(progress, 0.0, 1.0))
    set_frame_size(introCutsceneSkipBarFillNode, float2(fillW, barH))
    set_frame_pos(introCutsceneSkipBarFillNode, float2(0.0, 0.0))
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
    let padR = ui_w(CUTSCENE_SKIP_PADDING_RIGHT)
    let padB = ui_h(CUTSCENE_SKIP_PADDING_BOTTOM)
    let barH = ui_h(CUTSCENE_SKIP_BAR_HEIGHT)
    let gap = ui_h(CUTSCENE_SKIP_TEXT_BAR_GAP)

    set_text_font_size(introCutsceneSkipTextNode, ui_h(CUTSCENE_SKIP_HINT_FONT_SIZE))
    set_text_color(introCutsceneSkipTextNode, CUTSCENE_SKIP_HINT_COLOR)
    apply_dialogue_font(introCutsceneSkipTextNode)
    refresh_intro_cutscene_skip_text()

    let textSize = intro_cutscene_skip_text_size()
    let textW = textSize.x
    let textH = textSize.y

    set_frame_pivot(introCutsceneSkipTextNode, float2(1.0, 1.0))
    set_frame_pos(introCutsceneSkipTextNode, float2(0.0, 0.0))

    let barExtraUp = ui_h(CUTSCENE_SKIP_BAR_EXTRA_UP)
    let barExtraW = ui_w(CUTSCENE_SKIP_BAR_EXTRA_WIDTH)
    set_frame_size(introCutsceneSkipBarBgNode, float2(textW + barExtraW, barH))
    set_frame_pivot(introCutsceneSkipBarBgNode, float2(1.0, 1.0))
    set_frame_pos(introCutsceneSkipBarBgNode, float2(0.0, -(textH + gap + barExtraUp)))
    set_frame_pivot(introCutsceneSkipBarFillNode, float2(0.0, 0.0))
    set_frame_pos(introCutsceneSkipBarFillNode, float2(0.0, 0.0))

    set_frame_pivot(introCutsceneSkipRoot, float2(1.0, 1.0))
    set_frame_pos(introCutsceneSkipRoot, float2(-padR, -padB))
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
    return INTRO_BATTLE_SFX_VOLUME * settingsMusicVolume
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
        return
    }
    if (!intro_beat_has_dialogue_audio(beat)) {
        return
    }
    introDialogueSoundHandle = play_sound(introDialogueSounds[beat])
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

    startupSplashLogoNode = panel(float2(640.0, 360.0), [])
    startupSplashLogoNode.name = "startupSplashLogoNode"
    startupSplashLogoNode?.UIImage.textureId = logoTexture
    startupSplashLogoNode?.UIImage.pivot = float2(0.0, 0.0)
    set_image_color(startupSplashLogoNode, float4(1.0, 1.0, 1.0, 1.0))
    set_frame_pivot(startupSplashLogoNode, float2(0.0, 0.0))
    set_parent(startupSplashLogoNode, startupSplashRoot, AddChildStrategy.KeepLocalTransform)
    startupSplashLogoNode.isActive = false

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
    introCutsceneSkipTextNode?.UIText.fontScaling = false
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

    introCutsceneSkipRoot = panel(float2(0.0, 0.0), [])
    introCutsceneSkipRoot.name = "introCutsceneSkipRoot"
    set_image_color(introCutsceneSkipRoot, float4(0.0, 0.0, 0.0, 0.0))
    set_frame_pivot(introCutsceneSkipRoot, float2(1.0, 1.0))
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




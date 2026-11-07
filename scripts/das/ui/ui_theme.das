require engine.core
require scripts/das/core/game_state

module ui_theme public

// The game's look: dark walnut and aged gold. Every texture is generated at startup,
// so the theme adds no image files and scales cleanly through nine-slice borders.

let public {
    THEME_TEX_PANEL = 0
    THEME_TEX_BUTTON_FRAME = 1
    THEME_TEX_BUTTON_FILL = 2
    THEME_TEX_PILL = 3
    THEME_TEX_DISC = 4
    THEME_TEX_DIVIDER = 5
    THEME_TEX_BAR = 6
    THEME_TEX_FADE_UP = 7
    THEME_TEX_FADE_DOWN = 8
    THEME_TEX_COUNT = 9

    THEME_PANEL_GRID = 24.0
    THEME_BUTTON_FRAME_GRID = 14.0
    THEME_BUTTON_FILL_GRID = 12.0
    THEME_PILL_GRID = 16.0

    THEME_GOLD = float4(1.0, 0.82, 0.46, 1.0)
    THEME_GOLD_DIM = float4(0.74, 0.60, 0.38, 1.0)
    THEME_PARCHMENT = float4(0.95, 0.89, 0.76, 1.0)
    THEME_BUTTON_DARK = float4(0.30, 0.22, 0.15, 1.0)
    THEME_BUTTON_DARK_HOVER = float4(1.0, 0.80, 0.42, 1.0)
    THEME_BUTTON_DISABLED = float4(0.20, 0.17, 0.14, 1.0)
    THEME_TEXT_DISABLED = float4(0.46, 0.40, 0.32, 1.0)
    THEME_TEXT_ON_GOLD = float4(0.05, 0.03, 0.015, 1.0)
    THEME_TRACK = float4(0.06, 0.04, 0.03, 0.92)
    THEME_TRACK_FILL = float4(1.0, 0.72, 0.28, 1.0)

    // Sprites from the Pixel RPG Dialogue UI kit, in static/UI/Kit.
    KIT_BUTTON_RED = 0
    KIT_BUTTON_WHITE = 1
    KIT_CHOICE = 2
    KIT_CHOICE_HOVER = 3
    KIT_CHOICE_DIM = 4
    KIT_CHOICE_CURSOR = 5
    KIT_RIBBON_RED = 6
    KIT_CORNER_L = 7
    KIT_CORNER_R = 8
    KIT_DIAMOND = 9
    KIT_LINE_ORNAMENT = 10
    KIT_PANEL_DARK = 11
    KIT_PANEL_NOTICE = 12
    KIT_PANEL_SLOT = 13
    KIT_COUNT = 14
    KIT_TEXT_ON_RED = float4(1.0, 0.86, 0.56, 1.0)
    KIT_TEXT_ON_PARCHMENT = float4(0.17, 0.07, 0.05, 1.0)
}

let private KIT_PATHS = fixed_array(
    "static/UI/Kit/button_red.png",
    "static/UI/Kit/button_white.png",
    "static/UI/Kit/choice.png",
    "static/UI/Kit/choice_hover.png",
    "static/UI/Kit/choice_dim.png",
    "static/UI/Kit/choice_cursor.png",
    "static/UI/Kit/ribbon_red.png",
    "static/UI/Kit/corner_l.png",
    "static/UI/Kit/corner_r.png",
    "static/UI/Kit/diamond.png",
    "static/UI/Kit/line_ornament.png",
    "static/UI/Kit/panel_dark.png",
    "static/UI/Kit/panel_notice.png",
    "static/UI/Kit/panel_slot.png"
)

// Nine-slice borders in texture pixels (left, top, right, bottom), measured from the sprites.
let private KIT_GRIDS = fixed_array(
    float4(12.0, 12.0, 13.0, 13.0),
    float4(12.0, 12.0, 13.0, 13.0),
    float4(14.0, 12.0, 27.0, 12.0),
    float4(14.0, 12.0, 27.0, 12.0),
    float4(14.0, 12.0, 27.0, 12.0),
    float4(0.0, 0.0, 0.0, 0.0),
    float4(40.0, 14.0, 40.0, 30.0),
    float4(0.0, 0.0, 0.0, 0.0),
    float4(0.0, 0.0, 0.0, 0.0),
    float4(0.0, 0.0, 0.0, 0.0),
    float4(0.0, 0.0, 0.0, 0.0),
    float4(22.0, 22.0, 22.0, 22.0),
    float4(46.0, 26.0, 46.0, 40.0),
    float4(14.0, 14.0, 14.0, 14.0)
)

var private kitTextures : TextureId[KIT_COUNT]
var private kitReady = false

var private themeTextures : TextureId[THEME_TEX_COUNT]
var private themeReady = false


def private theme_pixel(col : float3; a : float) : uint {
    let r = int(saturate(col.x) * 255.0)
    let g = int(saturate(col.y) * 255.0)
    let b = int(saturate(col.z) * 255.0)
    let ai = int(saturate(a) * 255.0)
    return (uint(ai) << 24u) | (uint(r) << 16u) | (uint(g) << 8u) | uint(b)
}


// Signed distance from a pixel to a rounded rectangle; negative is inside.
def private theme_round_rect_distance(x, y, w, h, radius : float) : float {
    let qx = abs(x - w * 0.5) - (w * 0.5 - radius)
    let qy = abs(y - h * 0.5) - (h * 0.5 - radius)
    return length(float2(max(qx, 0.0), max(qy, 0.0))) + min(max(qx, qy), 0.0) - radius
}


def private theme_declaration() : TextureDeclaration {
    return TextureDeclaration(
        filter = TextureFilter.Bilinear,
        addressing = TextureAddress.Clamp,
        generateMipLevels = false
    )
}


def private theme_gold_band(v : float) : float3 {
    return lerp(float3(1.0, 0.86, 0.52), float3(0.58, 0.40, 0.17), v)
}


def private theme_make_panel() : TextureId {
    let size = 96
    var bmp <- Bitmap(size, size)
    bmp.pixels |> resize(size * size)
    let fs = float(size)
    for (iy in range(size)) {
        for (ix in range(size)) {
            let x = float(ix) + 0.5
            let y = float(iy) + 0.5
            let d = theme_round_rect_distance(x, y, fs, fs, 10.0)
            let depth = -d
            let v = y / fs
            var col = lerp(float3(0.21, 0.155, 0.105), float3(0.115, 0.08, 0.055), v)
            if (depth < 1.4) {
                col = float3(0.05, 0.03, 0.02)
            } elif (depth < 3.8) {
                col = theme_gold_band(v)
            } elif (depth < 5.0) {
                col = float3(0.05, 0.03, 0.02)
            } elif (depth < 6.2) {
                col = lerp(col, float3(0.5, 0.38, 0.22), 0.28)
            }
            // A small gold stud in each corner, left unstretched by the nine-slice.
            let sx = (x < fs * 0.5) ? 14.0 : fs - 14.0
            let sy = (y < fs * 0.5) ? 14.0 : fs - 14.0
            let stud = abs(x - sx) + abs(y - sy)
            if (stud < 4.2) {
                col = lerp(float3(1.0, 0.88, 0.56), float3(0.62, 0.44, 0.2), stud / 4.2)
            }
            bmp.pixels[iy * size + ix] = theme_pixel(col, 0.5 - d)
        }
    }
    return create_texture(bmp, theme_declaration())
}


def private theme_make_button_frame() : TextureId {
    let size = 48
    var bmp <- Bitmap(size, size)
    bmp.pixels |> resize(size * size)
    let fs = float(size)
    for (iy in range(size)) {
        for (ix in range(size)) {
            let x = float(ix) + 0.5
            let y = float(iy) + 0.5
            let d = theme_round_rect_distance(x, y, fs, fs, 7.0)
            var col = theme_gold_band(y / fs)
            if (-d < 1.0) {
                col = float3(0.05, 0.03, 0.02)
            }
            bmp.pixels[iy * size + ix] = theme_pixel(col, 0.5 - d)
        }
    }
    return create_texture(bmp, theme_declaration())
}


// White, so one texture tints into any button colour.
def private theme_make_button_fill() : TextureId {
    let size = 48
    var bmp <- Bitmap(size, size)
    bmp.pixels |> resize(size * size)
    let fs = float(size)
    for (iy in range(size)) {
        for (ix in range(size)) {
            let x = float(ix) + 0.5
            let y = float(iy) + 0.5
            let d = theme_round_rect_distance(x, y, fs, fs, 6.0)
            var value = lerp(1.0, 0.70, y / fs)
            if (-d < 1.6 && y < fs * 0.5) {
                value = 1.0
            }
            bmp.pixels[iy * size + ix] = theme_pixel(float3(value), 0.5 - d)
        }
    }
    return create_texture(bmp, theme_declaration())
}


def private theme_make_pill() : TextureId {
    let w = 128
    let h = 32
    var bmp <- Bitmap(w, h)
    bmp.pixels |> resize(w * h)
    for (iy in range(h)) {
        for (ix in range(w)) {
            let x = float(ix) + 0.5
            let y = float(iy) + 0.5
            let d = theme_round_rect_distance(x, y, float(w), float(h), 16.0)
            let v = y / float(h)
            let value = lerp(1.0, 0.68, v) + 0.25 * saturate(1.0 - abs(v - 0.24) * 7.0)
            bmp.pixels[iy * w + ix] = theme_pixel(float3(value), 0.5 - d * 0.6)
        }
    }
    return create_texture(bmp, theme_declaration())
}


def private theme_make_disc() : TextureId {
    let size = 48
    var bmp <- Bitmap(size, size)
    bmp.pixels |> resize(size * size)
    let c = float(size) * 0.5
    for (iy in range(size)) {
        for (ix in range(size)) {
            let x = float(ix) + 0.5 - c
            let y = float(iy) + 0.5 - c
            let r = length(float2(x, y))
            let v = saturate(length(float2(x + 6.0, y + 8.0)) / 26.0)
            var col = lerp(float3(1.0, 0.94, 0.72), float3(0.72, 0.5, 0.2), v)
            if (r > c - 4.0) {
                col = float3(0.16, 0.09, 0.04)
            }
            bmp.pixels[iy * size + ix] = theme_pixel(col, c - 0.5 - r)
        }
    }
    return create_texture(bmp, theme_declaration())
}


// A gold rule that fades at both ends around a centre diamond.
def private theme_make_divider() : TextureId {
    let w = 512
    let h = 24
    var bmp <- Bitmap(w, h)
    bmp.pixels |> resize(w * h)
    for (iy in range(h)) {
        for (ix in range(w)) {
            let u = (float(ix) + 0.5) / float(w) * 2.0 - 1.0
            let py = float(iy) + 0.5 - float(h) * 0.5
            let px = (float(ix) + 0.5) - float(w) * 0.5
            let line = saturate(1.6 - abs(py)) * saturate(1.0 - abs(u)) * saturate((1.0 - abs(u)) * 3.0)
            let diamond = saturate(9.5 - (abs(px) + abs(py)))
            let side = saturate(5.0 - (abs(abs(px) - 22.0) + abs(py)))
            bmp.pixels[iy * w + ix] = theme_pixel(float3(1.0, 0.82, 0.46), max(line, max(diamond, side)))
        }
    }
    return create_texture(bmp, theme_declaration())
}


def private theme_make_bar() : TextureId {
    let h = 64
    var bmp <- Bitmap(4, h)
    bmp.pixels |> resize(4 * h)
    for (iy in range(h)) {
        let v = (float(iy) + 0.5) / float(h)
        var col = lerp(float3(0.235, 0.17, 0.115), float3(0.095, 0.065, 0.045), v)
        col += float3(0.09, 0.07, 0.04) * saturate(1.0 - v * 22.0)
        for (ix in range(4)) {
            bmp.pixels[iy * 4 + ix] = theme_pixel(col, 1.0)
        }
    }
    return create_texture(bmp, theme_declaration())
}


def private theme_make_fade(fadeUp : bool) : TextureId {
    let h = 64
    var bmp <- Bitmap(4, h)
    bmp.pixels |> resize(4 * h)
    for (iy in range(h)) {
        let v = (float(iy) + 0.5) / float(h)
        let t = fadeUp ? v : 1.0 - v
        for (ix in range(4)) {
            bmp.pixels[iy * 4 + ix] = theme_pixel(float3(0.035, 0.022, 0.014), t * t * (3.0 - 2.0 * t))
        }
    }
    return create_texture(bmp, theme_declaration())
}


def public theme_kit_ensure() {
    if (kitReady) {
        return
    }
    kitReady = true
    for (i in range(KIT_COUNT)) {
        kitTextures[i] = request_texture(KIT_PATHS[i])
    }
}


// The kit is drawn for 1080p; borders shrink with the screen so they keep their proportion.
def public theme_kit_scale() : float {
    return max(0.35, float(get_resolution().y) / 1080.0)
}


def public theme_set_kit(node : NodeId; kitIdx : int; color : float4 = float4(1.0, 1.0, 1.0, 1.0)) {
    if (!node.isAlive) {
        return
    }
    theme_kit_ensure()
    get_component(node) $(var img : UIImage?) {
        img.textureId = kitTextures[kitIdx]
        img.nineGrid = KIT_GRIDS[kitIdx]
        img.pixelMultiplier = 1.0 / theme_kit_scale()
        img.color = color
    }
}


// Gilded corner pieces on the top-left and bottom-right of a panel.
def private theme_inset(node : NodeId; left : float; top : float) {
    get_component(node) $(var anchor : UIAnchor?) {
        anchor.left = left
        anchor.top = top
    }
}


def public theme_add_corners(panelNode : NodeId; sizeScale : float = 0.55) {
    if (!panelNode.isAlive) {
        return
    }
    let s = theme_kit_scale() * sizeScale
    let left = panel(float2(146.0 * s, 134.0 * s), [])
    left.name = "kitCornerL"
    theme_set_kit(left, KIT_CORNER_L)
    set_parent(left, panelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(left, float2(0.0, 0.0))
    set_frame_pivot(left, float2(0.0, 0.0))
    theme_inset(left, -8.0 * s, -8.0 * s)
    let right = panel(float2(127.0 * s, 124.0 * s), [])
    right.name = "kitCornerR"
    theme_set_kit(right, KIT_CORNER_R)
    set_parent(right, panelNode, AddChildStrategy.KeepLocalTransform)
    add_anchor(right, float2(1.0, 1.0))
    set_frame_pivot(right, float2(1.0, 1.0))
    theme_inset(right, 8.0 * s, 8.0 * s)
}


def public theme_ensure() {
    theme_kit_ensure()
    if (themeReady) {
        return
    }
    themeReady = true
    themeTextures[THEME_TEX_PANEL] = theme_make_panel()
    themeTextures[THEME_TEX_BUTTON_FRAME] = theme_make_button_frame()
    themeTextures[THEME_TEX_BUTTON_FILL] = theme_make_button_fill()
    themeTextures[THEME_TEX_PILL] = theme_make_pill()
    themeTextures[THEME_TEX_DISC] = theme_make_disc()
    themeTextures[THEME_TEX_DIVIDER] = theme_make_divider()
    themeTextures[THEME_TEX_BAR] = theme_make_bar()
    themeTextures[THEME_TEX_FADE_UP] = theme_make_fade(true)
    themeTextures[THEME_TEX_FADE_DOWN] = theme_make_fade(false)
}


def public theme_set_image(node : NodeId; texIdx : int; color : float4; grid : float = 0.0) {
    if (!node.isAlive) {
        return
    }
    theme_ensure()
    get_component(node) $(var img : UIImage?) {
        img.textureId = themeTextures[texIdx]
        img.nineGrid = float4(grid, grid, grid, grid)
        img.color = color
    }
}


// Panels are an outer border node holding an inner fill node; the frame draws both.
def public theme_style_panel(outer : NodeId; inner : NodeId) {
    theme_set_kit(outer, KIT_PANEL_DARK)
    if (inner.isAlive) {
        set_image_color(inner, float4(0.0, 0.0, 0.0, 0.0))
    }
}


// Buttons are a border node holding a fill node with the label. The sprite goes on the
// border and the fill stays clear, so state changes swap the sprite.
def public theme_style_button_shape(borderNode : NodeId; fillNode : NodeId) {
    theme_set_kit(borderNode, KIT_BUTTON_RED)
    if (fillNode.isAlive) {
        set_image_color(fillNode, float4(0.0, 0.0, 0.0, 0.0))
    }
}


def private theme_button_state(fill : NodeId; kitIdx : int; textColor : float4; tint : float4) {
    if (!fill.isAlive) {
        return
    }
    theme_set_kit(fill.parent, kitIdx, tint)
    set_image_color(fill, float4(0.0, 0.0, 0.0, 0.0))
    fill?.UIText.color = textColor
}


// Crimson button that turns to parchment on hover.
def public theme_apply_dark_button(fill : NodeId; hoverT : float) {
    let hovered = hoverT > 0.5
    theme_button_state(fill, hovered ? KIT_BUTTON_WHITE : KIT_BUTTON_RED, hovered ? KIT_TEXT_ON_PARCHMENT : KIT_TEXT_ON_RED, float4(1.0, 1.0, 1.0, 1.0))
}


// Parchment button that turns crimson on hover.
def public theme_apply_light_button(fill : NodeId; hoverT : float) {
    let hovered = hoverT > 0.5
    theme_button_state(fill, hovered ? KIT_BUTTON_RED : KIT_BUTTON_WHITE, hovered ? KIT_TEXT_ON_RED : KIT_TEXT_ON_PARCHMENT, float4(1.0, 1.0, 1.0, 1.0))
}


// Dialogue choices use the laurel sprites.
def public theme_apply_choice_button(fill : NodeId; hoverT : float) {
    let hovered = hoverT > 0.5
    theme_button_state(fill, hovered ? KIT_CHOICE_HOVER : KIT_CHOICE, hovered ? KIT_TEXT_ON_RED : KIT_TEXT_ON_PARCHMENT, float4(1.0, 1.0, 1.0, 1.0))
}


def public theme_apply_disabled_button(fill : NodeId) {
    theme_button_state(fill, KIT_BUTTON_RED, THEME_TEXT_DISABLED, float4(0.52, 0.48, 0.46, 1.0))
}


def public theme_apply_selected_control(fill : NodeId; selected : bool) {
    theme_button_state(fill, selected ? KIT_BUTTON_WHITE : KIT_BUTTON_RED, selected ? KIT_TEXT_ON_PARCHMENT : THEME_GOLD_DIM, float4(1.0, 1.0, 1.0, 1.0))
}


def public theme_style_slider(node : NodeId; handleSize : float) {
    if (!node.isAlive) {
        return
    }
    theme_ensure()
    var slideArea : NodeId
    var filled : NodeId
    var handle : NodeId
    get_component(node) $(var slider : UIHorizontalSlider?) {
        slideArea = slider.slideArea.nodeId
        filled = slider.filled.nodeId
        handle = slider.handle.nodeId
    }
    get_component(node) $(var state : UIColorState?) {
        state.activeColor = float4(1.0, 1.0, 1.0, 1.0)
        state.hoverColor = float4(1.0, 0.96, 0.84, 1.0)
        state.pressedColor = float4(1.0, 0.88, 0.62, 1.0)
        state.focusedColor = float4(1.0, 0.96, 0.84, 1.0)
    }
    if (slideArea.isAlive) {
        theme_set_image(get_child(slideArea, 0), THEME_TEX_PILL, THEME_TRACK)
    }
    theme_set_image(filled, THEME_TEX_PILL, THEME_TRACK_FILL)
    theme_set_image(handle, THEME_TEX_DISC, float4(1.0, 1.0, 1.0, 1.0))
    if (handle.isAlive) {
        set_frame_size(handle, float2(handleSize, handleSize))
        handle?.UIImage.size = float2(handleSize, handleSize)
    }
}

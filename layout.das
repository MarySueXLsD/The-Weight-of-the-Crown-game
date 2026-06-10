require engine.core

let public LAYOUT_REF_WIDTH = 1920.0
let public LAYOUT_REF_HEIGHT = 1080.0


def screen_w() : float {
    return float(get_resolution().x)
}


def screen_h() : float {
    return float(get_resolution().y)
}


// Map a horizontal design coordinate (1920-wide reference) to the current screen.
def ui_w(designX : float) : float {
    return screen_w() * (designX / LAYOUT_REF_WIDTH)
}


// Map a vertical design coordinate (1080-tall reference) to the current screen.
def ui_h(designY : float) : float {
    return screen_h() * (designY / LAYOUT_REF_HEIGHT)
}


def ui_size(design : float2) : float2 {
    return float2(ui_w(design.x), ui_h(design.y))
}

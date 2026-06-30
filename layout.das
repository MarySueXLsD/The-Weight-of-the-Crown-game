require engine.core

let public LAYOUT_REF_WIDTH = 1920.0
let public LAYOUT_REF_HEIGHT = 1080.0

var cachedScreenW = 1920.0
var cachedScreenH = 1080.0


def public refresh_layout_resolution() {
    let res = get_resolution()
    cachedScreenW = float(res.x)
    cachedScreenH = float(res.y)
}


def screen_w() : float {
    return cachedScreenW
}


def screen_h() : float {
    return cachedScreenH
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


def public ui_name(node : NodeId; nodeName : string) : NodeId {
    node.name = nodeName
    return node
}

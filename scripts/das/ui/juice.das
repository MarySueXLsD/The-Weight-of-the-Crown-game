require engine.core
require strings
require scripts/das/core/constants
require scripts/das/core/game_state

module juice public

// Presentation-only feedback layer: particles, screen shake, flashes, floating
// numbers, milestone banner and synthesized sound effects. Nothing here touches
// game rules, and nothing here requires other UI code, so any UI code can call it.

let public {
    JUICE_MAX_PARTICLES = 160
    JUICE_POOL_SPLASH_BACK = 300
    JUICE_POOL_SPLASH_FRONT = 90
    JUICE_POOL_MENU = 240
    JUICE_POOL_HALL = 90
    JUICE_MAX_FLOATERS = 12
    JUICE_SAMPLE_RATE = 44100

    JUICE_TEX_GLOW = 0
    JUICE_TEX_SPARK = 1
    JUICE_TEX_SHARD = 2
    JUICE_TEX_FLAME = 3
    JUICE_TEX_SMOKE = 4
    JUICE_TEX_COUNT = 5

    // Animated sprites from the VFX Collector pack, in static/FX.
    JUICE_ANIM_NONE = 0
    JUICE_ANIM_FIRE = 1
    JUICE_ANIM_SMOKE = 2
    JUICE_ANIM_FRAMES = 12

    JUICE_AMBIENT_NONE = 0
    JUICE_AMBIENT_HALL = 1
    JUICE_AMBIENT_MENU = 2
    JUICE_AMBIENT_SPLASH_BACK = 3
    JUICE_AMBIENT_SPLASH_FRONT = 4
    JUICE_AMBIENT_ASH = 5
    JUICE_AMBIENT_CUTSCENE = 6
    JUICE_POOL_ASH = 110
    JUICE_POOL_CUTSCENE = 70

    JUICE_SFX_HOVER = 0
    JUICE_SFX_CLICK = 1
    JUICE_SFX_STAT_UP = 2
    JUICE_SFX_STAT_DOWN = 3
    JUICE_SFX_COIN = 4
    JUICE_SFX_DENIED = 5
    JUICE_SFX_BELL = 6
    JUICE_SFX_FANFARE = 7
    JUICE_SFX_THUD = 8
    JUICE_SFX_COUNT = 9

    JUICE_COLOR_GOLD = float4(1.0, 0.82, 0.36, 1.0)
    JUICE_COLOR_GOLD_FADE = float4(1.0, 0.45, 0.1, 0.0)
    JUICE_COLOR_RED = float4(0.86, 0.14, 0.1, 1.0)
    JUICE_COLOR_RED_FADE = float4(0.28, 0.03, 0.03, 0.0)
    JUICE_COLOR_POSITIVE_TEXT = float4(0.52, 0.95, 0.52, 1.0)
    JUICE_COLOR_NEGATIVE_TEXT = float4(1.0, 0.42, 0.36, 1.0)

    JUICE_SHAKE_DECAY = 1.6
    JUICE_SHAKE_MAX_OFFSET = 16.0
    JUICE_FLASH_DECAY = 3.2
    JUICE_FLOATER_LIFE = 1.15
    JUICE_FLOATER_RISE = 62.0
    JUICE_BANNER_HOLD = 3.0
    JUICE_BANNER_SLIDE = 0.45
    JUICE_VOICE_CLIP_COUNT = 7
    JUICE_VOICE_VOLUME = 0.5
    JUICE_VOICE_STOP_FADE = 0.12
    JUICE_VOICE_PITCH_MIN = 0.86
    JUICE_VOICE_PITCH_STEP = 0.04
    JUICE_VOICE_PITCH_STEPS = 9
}

var public juiceReduceEffects = false

var private juiceRoot : NodeId
var private juiceFlashNode : NodeId
var private juiceDangerNode : NodeId
var private juiceBannerNode : NodeId
var private juiceBannerTitleNode : NodeId
var private juiceBannerTextNode : NodeId
var private juiceFloaterNodes : NodeId[JUICE_MAX_FLOATERS]
var private juiceFloaterLife : float[JUICE_MAX_FLOATERS]
var private juiceFloaterPos : float2[JUICE_MAX_FLOATERS]
var private juiceFloaterColor : float4[JUICE_MAX_FLOATERS]
var private juiceFloaterCursor = 0
var private juiceTextures : TextureId[JUICE_TEX_COUNT]
var private juiceVignetteTexture : TextureId
var private juiceFireFrames : TextureId[JUICE_ANIM_FRAMES]
var private juiceSmokeFrames : TextureId[JUICE_ANIM_FRAMES]
var private juiceTexturesReady = false
var private juiceTrauma = 0.0
var private juiceShakeTime = 0.0
var private juiceFlashColor = float4(0.0, 0.0, 0.0, 0.0)
var private juiceDangerTarget = 0.0
var private juiceDangerValue = 0.0
var private juiceDangerTime = 0.0
var private juiceBannerT = -1.0
var private juiceVoiceSounds : SoundId[JUICE_VOICE_CLIP_COUNT]
var private juiceVoiceHandle : SoundHandle
var private juiceVoiceActive = false
var private juiceVoiceTimer = 0.0
var private juiceVoiceLastClip = -1
var private juiceSamples : array<float>[JUICE_SFX_COUNT]
var private juiceSfxReady = false
var private juicePopNode : NodeId
var private juicePopT = 1.0
var private juicePopStrength = 0.0


struct JuiceParticle {
    life : float = 0.0
    maxLife : float = 1.0
    pos : float2
    vel : float2
    gravity : float = 0.0
    drag : float = 0.0
    sizeFrom : float = 8.0
    sizeTo : float = 0.0
    colorFrom : float4
    colorTo : float4
    colorMid : float4
    hasMid : bool = false
    angle : float = 0.0
    spin : float = 0.0
    sway : float = 0.0
    swayPhase : float = 0.0
    texIdx : int = 0
    animKind : int = JUICE_ANIM_NONE
    animFps : float = 12.0
    animOffset : float = 0.0
    animFrame : int = -1
}


// Every audible sound goes through this. DEBUG_MUTE_ALL_AUDIO silences test runs
// without touching the volume saved in the player's options.
def public juice_master_volume() : float {
    return DEBUG_MUTE_ALL_AUDIO ? 0.0 : settingsMasterVolume
}


def private rand_range(lo, hi : float) : float {
    return lo + random_float() * (hi - lo)
}


def private ease_out_back(t : float) : float {
    let c1 = 1.70158
    let c3 = c1 + 1.0
    let u = t - 1.0
    return 1.0 + c3 * u * u * u + c1 * u * u
}


//////////////////////////////// Textures ////////////////////////////////

def private juice_pixel(r, g, b, a : float) : uint {
    let ai = int(clamp(a * 255.0, 0.0, 255.0))
    return (uint(ai) << 24u) | (uint(int(r * 255.0)) << 16u) | (uint(int(g * 255.0)) << 8u) | uint(int(b * 255.0))
}


def private juice_texture_declaration() : TextureDeclaration {
    return TextureDeclaration(
        filter = TextureFilter.Bilinear,
        addressing = TextureAddress.Clamp,
        generateMipLevels = false
    )
}


def private juice_make_shape_texture(kind : int) : TextureId {
    let size = (kind == JUICE_TEX_SMOKE || kind == JUICE_TEX_FLAME) ? 64 : 32
    var bmp <- Bitmap(size, size)
    bmp.pixels |> resize(size * size)
    for (y in range(size)) {
        let v = (float(y) + 0.5) / float(size) * 2.0 - 1.0
        for (x in range(size)) {
            let u = (float(x) + 0.5) / float(size) * 2.0 - 1.0
            var a = 0.0
            if (kind == JUICE_TEX_GLOW) {
                let d = saturate(1.0 - sqrt(u * u + v * v))
                a = d * d
            } elif (kind == JUICE_TEX_SPARK) {
                // A four-pointed star reads as a glint at small sizes.
                let d = abs(u) + abs(v)
                let core = saturate(1.0 - d * 1.15)
                let rays = saturate(1.0 - abs(u) * 9.0) * saturate(1.0 - abs(v)) + saturate(1.0 - abs(v) * 9.0) * saturate(1.0 - abs(u))
                a = saturate(core + rays)
            } elif (kind == JUICE_TEX_FLAME) {
                // A soft teardrop, narrow at the top.
                let narrow = lerp(0.5, 1.0, saturate((v + 1.0) * 0.5))
                let d = saturate(1.0 - sqrt(u * u / (narrow * narrow) + v * v))
                a = d * d
            } elif (kind == JUICE_TEX_SMOKE) {
                // Layered ripples break up the disc so it reads as a billow.
                let r = sqrt(u * u + v * v)
                let billow = 0.62 + 0.2 * sin(u * 6.3 + v * 3.1) + 0.18 * sin(v * 8.7 - u * 4.3 + 1.7)
                let d = saturate(1.0 - r)
                a = saturate(d * d * (3.0 - 2.0 * d) * billow * 1.35)
            } else {
                // An irregular splinter.
                let d = abs(u) * 1.7 + abs(v + u * 0.45) * 1.05
                a = saturate((1.0 - d) * 6.0)
            }
            bmp.pixels[y * size + x] = juice_pixel(1.0, 1.0, 1.0, a)
        }
    }
    return create_texture(bmp, juice_texture_declaration())
}


def private juice_make_vignette_texture() : TextureId {
    let w = 128
    let h = 72
    var bmp <- Bitmap(w, h)
    bmp.pixels |> resize(w * h)
    for (y in range(h)) {
        let v = (float(y) + 0.5) / float(h) * 2.0 - 1.0
        for (x in range(w)) {
            let u = (float(x) + 0.5) / float(w) * 2.0 - 1.0
            let d = saturate((sqrt(u * u + v * v) - 0.55) / 0.85)
            bmp.pixels[y * w + x] = juice_pixel(1.0, 1.0, 1.0, d * d)
        }
    }
    return create_texture(bmp, juice_texture_declaration())
}


def private juice_ensure_textures() {
    if (juiceTexturesReady) {
        return
    }
    for (i in range(JUICE_TEX_COUNT)) {
        juiceTextures[i] = juice_make_shape_texture(i)
    }
    juiceVignetteTexture = juice_make_vignette_texture()
    for (i in range(JUICE_ANIM_FRAMES)) {
        let n = i + 1
        let num = (n < 10) ? "0{n}" : "{n}"
        juiceFireFrames[i] = request_texture("static/FX/fire_{num}.png")
        juiceSmokeFrames[i] = request_texture("static/FX/smoke_{num}.png")
    }
    juiceTexturesReady = true
}


//////////////////////////////// Particles ////////////////////////////////

class JuiceParticleLayer : Component {
    @no_export particles : array<JuiceParticle>
    @no_export nodes : array<NodeId>
    @no_export cursor : int = 0
    @no_export ambientKind : int = JUICE_AMBIENT_NONE
    @no_export flameAcc : float = 0.0
    @no_export torchAcc : float = 0.0
    @no_export smokeAcc : float = 0.0
    @no_export emberAcc : float = 0.0
    @no_export dustAcc : float = 0.0
    @no_export layerTime : float = 0.0

    def setup(count : int) {
        particles |> resize(count)
        nodes |> resize(count)
        for (i in range(count)) {
            let node = panel(float2(8.0, 8.0), [])
            node.name = "juiceParticle"
            set_frame_pivot(node, float2(0.5, 0.5))
            set_image_color(node, float4(1.0, 1.0, 1.0, 0.0))
            set_parent(node, nodeId, AddChildStrategy.KeepLocalTransform)
            node.isActive = false
            nodes[i] = node
        }
    }

    def spawn(p : JuiceParticle) {
        if (length(particles) == 0) {
            return
        }
        cursor = (cursor + 1) % length(particles)
        particles[cursor] = p
        let node = nodes[cursor]
        get_component(node) $(var img : UIImage?) {
            img.textureId = (p.animKind == JUICE_ANIM_FIRE) ? juiceFireFrames[0] : ((p.animKind == JUICE_ANIM_SMOKE) ? juiceSmokeFrames[0] : juiceTextures[p.texIdx])
        }
        node.isActive = true
    }

    def spawn_fire_sprite(pos : float2; size : float; riseSpeed : float; life : float) {
        var p = JuiceParticle()
        p.animKind = JUICE_ANIM_FIRE
        p.animFps = rand_range(10.0, 15.0)
        p.animOffset = rand_range(0.0, 12.0)
        p.maxLife = life * rand_range(0.75, 1.2)
        p.life = p.maxLife
        // The flame sits at the bottom of its frame, so lift the centre to stand it on pos.
        p.pos = pos - float2(0.0, size * 0.42)
        p.vel = float2(rand_range(-0.1, 0.1) * riseSpeed, -riseSpeed * rand_range(0.6, 1.1))
        p.sizeFrom = size * rand_range(0.8, 1.2)
        p.sizeTo = p.sizeFrom * 0.72
        p.colorFrom = float4(1.0, 1.0, 1.0, 1.0)
        p.colorMid = float4(1.0, 0.95, 0.86, 0.95)
        p.colorTo = float4(1.0, 0.7, 0.55, 0.0)
        p.hasMid = true
        self->spawn(p)
    }

    def spawn_smoke_sprite(pos : float2; size : float; riseSpeed : float; life : float; alpha : float) {
        var p = JuiceParticle()
        p.animKind = JUICE_ANIM_SMOKE
        p.maxLife = life * rand_range(0.8, 1.25)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(rand_range(-0.3, 0.3) * riseSpeed, -riseSpeed * rand_range(0.7, 1.2))
        p.drag = 0.15
        p.sizeFrom = size * rand_range(0.8, 1.2)
        p.sizeTo = p.sizeFrom * 1.6
        let grey = rand_range(0.24, 0.38)
        p.colorFrom = float4(grey, grey * 0.96, grey * 0.92, alpha)
        p.colorMid = float4(grey, grey * 0.96, grey * 0.92, alpha * 0.9)
        p.colorTo = float4(grey, grey, grey, 0.0)
        p.hasMid = true
        self->spawn(p)
    }

    def spawn_flame(pos : float2; sizeFrom : float; riseSpeed : float; life : float) {
        var p = JuiceParticle()
        p.texIdx = JUICE_TEX_FLAME
        p.maxLife = life * rand_range(0.7, 1.2)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(rand_range(-0.12, 0.12) * riseSpeed, -riseSpeed * rand_range(0.75, 1.2))
        p.drag = 0.35
        p.sizeFrom = sizeFrom * rand_range(0.7, 1.25)
        p.sizeTo = sizeFrom * 0.14
        p.colorFrom = float4(1.0, 0.88, 0.5, 0.86)
        p.colorMid = float4(1.0, 0.46, 0.08, 0.72)
        p.colorTo = float4(0.42, 0.04, 0.01, 0.0)
        p.hasMid = true
        p.spin = 0.0
        p.sway = rand_range(6.0, 20.0) * sizeFrom * 0.012
        p.swayPhase = rand_range(0.0, 6.28)
        self->spawn(p)
    }

    def spawn_smoke(pos : float2; sizeFrom : float; riseSpeed : float; life : float; alpha : float) {
        var p = JuiceParticle()
        p.texIdx = JUICE_TEX_SMOKE
        p.maxLife = life * rand_range(0.75, 1.25)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(rand_range(-0.35, 0.35) * riseSpeed, -riseSpeed * rand_range(0.7, 1.2))
        p.drag = 0.12
        p.sizeFrom = sizeFrom * rand_range(0.7, 1.2)
        p.sizeTo = p.sizeFrom * 2.7
        let grey = rand_range(0.17, 0.3)
        p.colorFrom = float4(grey, grey * 0.95, grey * 0.9, alpha)
        p.colorMid = float4(grey, grey * 0.95, grey * 0.9, alpha * 0.85)
        p.colorTo = float4(grey * 0.8, grey * 0.8, grey * 0.8, 0.0)
        p.hasMid = true
        p.angle = rand_range(0.0, 6.28)
        p.spin = rand_range(-0.35, 0.35)
        self->spawn(p)
    }

    def spawn_ember(pos : float2; size : float; riseSpeed : float; life : float) {
        var p = JuiceParticle()
        p.texIdx = JUICE_TEX_GLOW
        p.maxLife = life * rand_range(0.6, 1.3)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(rand_range(-0.4, 0.4) * riseSpeed, -riseSpeed * rand_range(0.55, 1.25))
        p.drag = 0.2
        p.sizeFrom = size * rand_range(0.6, 1.5)
        p.sizeTo = 2.0
        p.colorFrom = float4(1.0, rand_range(0.68, 0.92), 0.34, 1.0)
        p.colorTo = float4(0.9, 0.16, 0.03, 0.0)
        p.sway = rand_range(10.0, 36.0)
        p.swayPhase = rand_range(0.0, 6.28)
        self->spawn(p)
    }

    def spawn_dust(res : float2; scale : float) {
        var p = JuiceParticle()
        p.texIdx = JUICE_TEX_GLOW
        p.maxLife = rand_range(5.0, 9.0)
        p.life = p.maxLife
        p.pos = float2(rand_range(0.0, res.x), rand_range(0.0, res.y))
        p.vel = float2(rand_range(-9.0, 9.0), rand_range(-11.0, -2.0)) * scale
        p.sizeFrom = rand_range(7.0, 18.0) * scale
        p.sizeTo = p.sizeFrom
        p.colorFrom = float4(1.0, 0.93, 0.74, rand_range(0.3, 0.6))
        p.colorTo = float4(1.0, 0.93, 0.74, 0.0)
        p.sway = rand_range(4.0, 12.0)
        p.swayPhase = rand_range(0.0, 6.28)
        self->spawn(p)
    }

    def spawn_glint(pos : float2; size : float; riseSpeed : float; life : float) {
        var p = JuiceParticle()
        p.texIdx = JUICE_TEX_SPARK
        p.maxLife = life * rand_range(0.7, 1.3)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(rand_range(-0.3, 0.3) * riseSpeed, -riseSpeed * rand_range(0.5, 1.1))
        p.drag = 0.15
        p.sizeFrom = size * rand_range(0.7, 1.4)
        p.sizeTo = 1.0
        p.colorFrom = float4(1.0, 0.92, 0.62, 0.95)
        p.colorMid = float4(1.0, 0.78, 0.36, 0.85)
        p.colorTo = float4(1.0, 0.5, 0.15, 0.0)
        p.hasMid = true
        p.angle = rand_range(0.0, 6.28)
        p.spin = rand_range(-2.5, 2.5)
        p.sway = rand_range(8.0, 26.0)
        p.swayPhase = rand_range(0.0, 6.28)
        self->spawn(p)
    }

    def emit_splash_back(res : float2; scale : float; rate : float; dt : float) {
        // Deep layer behind the logo: many slow, dim embers drifting up the whole screen.
        emberAcc += 18.0 * rate * dt
        while (emberAcc >= 1.0) {
            emberAcc -= 1.0
            self->spawn_ember(float2(rand_range(-0.02, 1.02) * res.x, res.y * rand_range(0.35, 1.05)), rand_range(6.0, 15.0) * scale, 70.0 * scale, 4.2)
        }
        dustAcc += 3.0 * rate * dt
        while (dustAcc >= 1.0) {
            dustAcc -= 1.0
            self->spawn_dust(res, scale)
        }
    }

    def emit_splash_front(res : float2; scale : float; rate : float; dt : float) {
        // Near layer in front of the logo: fewer, larger and faster, with gold glints.
        emberAcc += 6.0 * rate * dt
        while (emberAcc >= 1.0) {
            emberAcc -= 1.0
            self->spawn_ember(float2(rand_range(0.0, 1.0) * res.x, res.y * rand_range(0.6, 1.05)), rand_range(14.0, 28.0) * scale, 150.0 * scale, 3.0)
        }
        flameAcc += 3.0 * rate * dt
        while (flameAcc >= 1.0) {
            flameAcc -= 1.0
            self->spawn_glint(float2(rand_range(0.05, 0.95) * res.x, res.y * rand_range(0.2, 0.95)), rand_range(14.0, 30.0) * scale, 40.0 * scale, 2.2)
        }
    }

    def emit_menu(res : float2; scale : float; rate : float; dt : float) {
        emberAcc += 30.0 * rate * dt
        while (emberAcc >= 1.0) {
            emberAcc -= 1.0
            self->spawn_ember(float2(rand_range(0.0, 1.0) * res.x, res.y * rand_range(0.4, 1.02)), rand_range(9.0, 21.0) * scale, 95.0 * scale, 3.8)
        }
        flameAcc += 7.0 * rate * dt
        while (flameAcc >= 1.0) {
            flameAcc -= 1.0
            self->spawn_glint(float2(rand_range(0.05, 0.95) * res.x, res.y * rand_range(0.15, 0.85)), rand_range(12.0, 24.0) * scale, 26.0 * scale, 2.4)
        }
        dustAcc += 6.0 * rate * dt
        while (dustAcc >= 1.0) {
            dustAcc -= 1.0
            self->spawn_dust(res, scale)
        }
    }

    def emit_hall(res : float2; scale : float; rate : float; dt : float) {
        // Unrest shows in the room: more embers and smoke as the realm nears ruin.
        let unrest = 1.0 + juiceDangerValue * 3.0
        emberAcc += 7.0 * rate * unrest * dt
        while (emberAcc >= 1.0) {
            emberAcc -= 1.0
            let side = (random_float() < 0.5) ? rand_range(0.0, 0.3) : rand_range(0.7, 1.0)
            self->spawn_ember(float2(side * res.x, res.y * rand_range(0.72, 0.9)), rand_range(7.0, 15.0) * scale, 62.0 * scale, 5.0)
        }
        smokeAcc += 2.6 * rate * unrest * dt
        while (smokeAcc >= 1.0) {
            smokeAcc -= 1.0
            self->spawn_smoke_sprite(float2(rand_range(-0.05, 1.05) * res.x, res.y * rand_range(0.74, 0.9)), rand_range(150.0, 240.0) * scale, 14.0 * scale, 5.0, 0.16)
            self->spawn_smoke(float2(rand_range(-0.05, 1.05) * res.x, res.y * rand_range(0.7, 0.86)), rand_range(100.0, 190.0) * scale, 16.0 * scale, 6.5, 0.15)
        }
        dustAcc += 3.2 * rate * dt
        while (dustAcc >= 1.0) {
            dustAcc -= 1.0
            self->spawn_dust(res, scale)
        }
    }

    // The death screen: ash drifting down, a few embers still rising.
    def emit_ash(res : float2; scale : float; rate : float; dt : float) {
        dustAcc += 10.0 * rate * dt
        while (dustAcc >= 1.0) {
            dustAcc -= 1.0
            var p = JuiceParticle()
            p.texIdx = JUICE_TEX_SHARD
            p.maxLife = rand_range(9.0, 15.0)
            p.life = p.maxLife
            p.pos = float2(rand_range(-0.05, 1.05) * res.x, rand_range(-0.12, 0.6) * res.y)
            p.vel = float2(rand_range(-14.0, 14.0), rand_range(22.0, 52.0)) * scale
            p.sizeFrom = rand_range(4.0, 11.0) * scale
            p.sizeTo = p.sizeFrom * 0.8
            let g = rand_range(0.45, 0.7)
            p.colorFrom = float4(g, g * 0.96, g * 0.92, rand_range(0.35, 0.65))
            p.colorTo = float4(g, g * 0.96, g * 0.92, 0.0)
            p.angle = rand_range(0.0, 6.28)
            p.spin = rand_range(-1.6, 1.6)
            p.sway = rand_range(10.0, 28.0)
            p.swayPhase = rand_range(0.0, 6.28)
            self->spawn(p)
        }
        emberAcc += 3.0 * rate * dt
        while (emberAcc >= 1.0) {
            emberAcc -= 1.0
            self->spawn_ember(float2(rand_range(0.0, 1.0) * res.x, res.y * rand_range(0.85, 1.05)), rand_range(5.0, 11.0) * scale, 55.0 * scale, 5.0)
        }
    }

    // Cutscenes: slow motes in the light and the odd ember.
    def emit_cutscene(res : float2; scale : float; rate : float; dt : float) {
        dustAcc += 3.5 * rate * dt
        while (dustAcc >= 1.0) {
            dustAcc -= 1.0
            self->spawn_dust(res, scale)
        }
        emberAcc += 2.2 * rate * dt
        while (emberAcc >= 1.0) {
            emberAcc -= 1.0
            self->spawn_ember(float2(rand_range(0.0, 1.0) * res.x, res.y * rand_range(0.8, 1.05)), rand_range(5.0, 11.0) * scale, 45.0 * scale, 5.5)
        }
    }

    def emit_ambient(dt : float) {
        if (ambientKind == JUICE_AMBIENT_NONE) {
            return
        }
        layerTime += dt
        let res = float2(get_resolution())
        let scale = res.y / 800.0
        let rate = juiceReduceEffects ? 0.35 : 1.0
        if (ambientKind == JUICE_AMBIENT_HALL) {
            self->emit_hall(res, scale, rate, dt)
        } elif (ambientKind == JUICE_AMBIENT_MENU) {
            self->emit_menu(res, scale, rate, dt)
        } elif (ambientKind == JUICE_AMBIENT_SPLASH_BACK) {
            self->emit_splash_back(res, scale, rate, dt)
        } elif (ambientKind == JUICE_AMBIENT_SPLASH_FRONT) {
            self->emit_splash_front(res, scale, rate, dt)
        } elif (ambientKind == JUICE_AMBIENT_ASH) {
            self->emit_ash(res, scale, rate, dt)
        } elif (ambientKind == JUICE_AMBIENT_CUTSCENE) {
            self->emit_cutscene(res, scale, rate, dt)
        }
    }

    def override on_update {
        let dt = get_delta_time()
        self->emit_ambient(dt)
        for (i in range(length(particles))) {
            if (particles[i].life <= 0.0) {
                continue
            }
            particles[i].life -= dt
            let node = nodes[i]
            if (particles[i].life <= 0.0) {
                node.isActive = false
                continue
            }
            particles[i].vel.y += particles[i].gravity * dt
            particles[i].vel *= max(0.0, 1.0 - particles[i].drag * dt)
            particles[i].pos += particles[i].vel * dt
            particles[i].angle += particles[i].spin * dt
            let t = 1.0 - particles[i].life / particles[i].maxLife
            let size = lerp(particles[i].sizeFrom, particles[i].sizeTo, t)
            var drawPos = particles[i].pos
            if (particles[i].sway != 0.0) {
                drawPos.x += sin(particles[i].swayPhase + t * 7.0) * particles[i].sway
            }
            var col = particles[i].colorFrom
            if (particles[i].hasMid) {
                col = (t < 0.35) ? lerp(particles[i].colorFrom, particles[i].colorMid, t / 0.35) : lerp(particles[i].colorMid, particles[i].colorTo, (t - 0.35) / 0.65)
            } else {
                col = lerp(particles[i].colorFrom, particles[i].colorTo, t)
            }
            // Fade in over the first tenth so ambient motes never pop into view.
            col.w *= saturate(t * 10.0)
            set_frame_pos(node, drawPos)
            set_frame_size(node, float2(size, size))
            get_component(node) $(var img : UIImage?) {
                img.size = float2(size, size)
            }
            set_image_color(node, col)
            node.localRotation = quat4(0.0, 0.0, particles[i].angle)
            if (particles[i].animKind != JUICE_ANIM_NONE) {
                var frame = 0
                if (particles[i].animKind == JUICE_ANIM_FIRE) {
                    frame = int((particles[i].maxLife - particles[i].life) * particles[i].animFps + particles[i].animOffset) % JUICE_ANIM_FRAMES
                } else {
                    frame = min(JUICE_ANIM_FRAMES - 1, int(t * float(JUICE_ANIM_FRAMES)))
                }
                if (frame != particles[i].animFrame) {
                    particles[i].animFrame = frame
                    let tex = (particles[i].animKind == JUICE_ANIM_FIRE) ? juiceFireFrames[frame] : juiceSmokeFrames[frame]
                    get_component(node) $(var img : UIImage?) {
                        img.textureId = tex
                    }
                }
            }
        }
    }
}


def private juice_create_layer(parent : NodeId; name : string; count : int; ambientKind : int) : NodeId {
    juice_ensure_textures()
    let res = float2(get_resolution())
    let root = panel(res, [])
    root.name = name
    set_image_color(root, float4(0.0, 0.0, 0.0, 0.0))
    set_parent(root, parent, AddChildStrategy.KeepLocalTransform)
    add_anchor(root, float2(0.0, 0.0), float2(1.0, 1.0))
    set_frame_pivot(root, float2(0.5, 0.5))
    add_component(root, new JuiceParticleLayer())
    get_component(root) $(var layer : JuiceParticleLayer?) {
        layer->setup(count)
        layer.ambientKind = ambientKind
    }
    return root
}


def public juice_create_ambient_layer(parent : NodeId; name : string; ambientKind : int) : NodeId {
    var pool = JUICE_POOL_HALL
    if (ambientKind == JUICE_AMBIENT_MENU) {
        pool = JUICE_POOL_MENU
    } elif (ambientKind == JUICE_AMBIENT_SPLASH_BACK) {
        pool = JUICE_POOL_SPLASH_BACK
    } elif (ambientKind == JUICE_AMBIENT_SPLASH_FRONT) {
        pool = JUICE_POOL_SPLASH_FRONT
    } elif (ambientKind == JUICE_AMBIENT_ASH) {
        pool = JUICE_POOL_ASH
    } elif (ambientKind == JUICE_AMBIENT_CUTSCENE) {
        pool = JUICE_POOL_CUTSCENE
    }
    return juice_create_layer(parent, name, pool, ambientKind)
}


// Stops new particles; the live ones burn out on their own, so nothing pops off screen.
def public juice_stop_layer(layerNode : NodeId) {
    if (!layerNode.isAlive) {
        return
    }
    get_component(layerNode) $(var layer : JuiceParticleLayer?) {
        layer.ambientKind = JUICE_AMBIENT_NONE
    }
}


def public juice_glow_texture() : TextureId {
    juice_ensure_textures()
    return juiceTextures[JUICE_TEX_GLOW]
}


// A soft dark falloff that sits behind the characters and adds depth to flat walls.
def public juice_create_room_vignette(parent : NodeId) : NodeId {
    juice_ensure_textures()
    let res = float2(get_resolution())
    let node = panel(res, [])
    node.name = "juiceRoomVignette"
    get_component(node) $(var img : UIImage?) {
        img.textureId = juiceVignetteTexture
    }
    set_image_color(node, float4(0.07, 0.04, 0.02, 0.62))
    set_parent(node, parent, AddChildStrategy.KeepLocalTransform)
    add_anchor(node, float2(0.0, 0.0), float2(1.0, 1.0))
    return node
}


def private juice_spawn_on_top(p : JuiceParticle) {
    if (!juiceRoot.isAlive) {
        return
    }
    get_component(juiceRoot) $(var layer : JuiceParticleLayer?) {
        layer->spawn(p)
    }
}


def private juice_count(count : int) : int {
    return juiceReduceEffects ? max(1, count / 3) : count
}


def public fx_scale() : float {
    return float(get_resolution().y) / 800.0
}


// Radial burst of glints: a stat rising, a purchase landing.
def public fx_gold_burst(pos : float2; count : int; power : float = 1.0) {
    let scale = fx_scale()
    for (i in range(juice_count(count))) {
        var p = JuiceParticle()
        let a = rand_range(0.0, 6.283)
        let speed = rand_range(70.0, 300.0) * power * scale
        p.maxLife = rand_range(0.45, 1.05)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(cos(a) * speed, sin(a) * speed - 90.0 * scale)
        p.gravity = 300.0 * scale
        p.drag = 1.5
        p.sizeFrom = rand_range(10.0, 25.0) * scale
        p.sizeTo = 1.0
        p.colorFrom = JUICE_COLOR_GOLD
        p.colorTo = JUICE_COLOR_GOLD_FADE
        p.angle = rand_range(0.0, 6.283)
        p.spin = rand_range(-7.0, 7.0)
        p.texIdx = (i % 3 == 0) ? JUICE_TEX_GLOW : JUICE_TEX_SPARK
        juice_spawn_on_top(p)
    }
}


// Heavy falling splinters: a stat dropping.
def public fx_red_shards(pos : float2; count : int; power : float = 1.0) {
    let scale = fx_scale()
    for (i in range(juice_count(count))) {
        var p = JuiceParticle()
        let a = rand_range(3.5, 5.9)
        let speed = rand_range(90.0, 250.0) * power * scale
        p.maxLife = rand_range(0.5, 1.1)
        p.life = p.maxLife
        p.pos = pos
        p.vel = float2(cos(a) * speed, sin(a) * speed)
        p.gravity = 820.0 * scale
        p.sizeFrom = rand_range(8.0, 19.0) * scale
        p.sizeTo = 2.0
        p.colorFrom = JUICE_COLOR_RED
        p.colorTo = JUICE_COLOR_RED_FADE
        p.angle = rand_range(0.0, 6.283)
        p.spin = rand_range(-11.0, 11.0)
        p.texIdx = JUICE_TEX_SHARD
        juice_spawn_on_top(p)
    }
}


// Falling golden flecks across the top of the screen: milestones and new records.
def public fx_confetti(count : int) {
    let res = float2(get_resolution())
    let scale = fx_scale()
    for (i in range(juice_count(count))) {
        var p = JuiceParticle()
        p.maxLife = rand_range(1.5, 3.0)
        p.life = p.maxLife
        p.pos = float2(rand_range(0.0, res.x), rand_range(-30.0, res.y * 0.1))
        p.vel = float2(rand_range(-40.0, 40.0), rand_range(90.0, 240.0) * scale)
        p.sizeFrom = rand_range(8.0, 18.0) * scale
        p.sizeTo = p.sizeFrom * 0.5
        p.colorFrom = (i % 3 == 0) ? float4(0.72, 0.13, 0.13, 1.0) : JUICE_COLOR_GOLD
        p.colorTo = float4(p.colorFrom.x, p.colorFrom.y, p.colorFrom.z, 0.0)
        p.angle = rand_range(0.0, 6.283)
        p.spin = rand_range(-6.0, 6.0)
        p.sway = rand_range(14.0, 40.0)
        p.swayPhase = rand_range(0.0, 6.28)
        p.texIdx = JUICE_TEX_SHARD
        juice_spawn_on_top(p)
    }
}


// Dust kicked up along the floor when a visitor arrives.
def public fx_dust_puff(pos : float2; count : int) {
    let scale = fx_scale()
    for (i in range(juice_count(count))) {
        var p = JuiceParticle()
        let dir = (i % 2 == 0) ? 1.0 : -1.0
        p.maxLife = rand_range(0.6, 1.25)
        p.life = p.maxLife
        p.pos = pos + float2(rand_range(-50.0, 50.0) * scale, 0.0)
        p.vel = float2(dir * rand_range(20.0, 130.0) * scale, rand_range(-48.0, -8.0) * scale)
        p.drag = 2.2
        p.sizeFrom = rand_range(14.0, 34.0) * scale
        p.sizeTo = rand_range(48.0, 84.0) * scale
        p.colorFrom = float4(0.86, 0.75, 0.58, 0.38)
        p.colorTo = float4(0.86, 0.75, 0.58, 0.0)
        p.texIdx = JUICE_TEX_GLOW
        juice_spawn_on_top(p)
    }
}


//////////////////////////////// Shake / flash / danger ////////////////////////////////

def public juice_add_trauma(amount : float) {
    if (juiceReduceEffects) {
        return
    }
    juiceTrauma = saturate(juiceTrauma + amount)
}


def public juice_flash(color : float4) {
    var c = color
    if (juiceReduceEffects) {
        c.w *= 0.25
    }
    if (c.w >= juiceFlashColor.w) {
        juiceFlashColor = c
    }
}


// level: 0 = kingdom is safe, 1 = a stat is about to end the reign.
def public juice_set_danger(level : float) {
    juiceDangerTarget = saturate(level)
}


//////////////////////////////// Floating numbers ////////////////////////////////

def public juice_floater_node(idx : int) : NodeId {
    return juiceFloaterNodes[idx]
}


def public juice_float_text(pos : float2; message : string; color : float4) {
    let idx = juiceFloaterCursor
    juiceFloaterCursor = (juiceFloaterCursor + 1) % JUICE_MAX_FLOATERS
    let node = juiceFloaterNodes[idx]
    if (!node.isAlive) {
        return
    }
    juiceFloaterLife[idx] = JUICE_FLOATER_LIFE
    juiceFloaterPos[idx] = pos
    juiceFloaterColor[idx] = color
    node?.UIText.text = message
    node?.UIText.color = color
    node.isActive = true
}


//////////////////////////////// Banner ////////////////////////////////

def public juice_banner_node() : NodeId {
    return juiceBannerNode
}


def public juice_banner_title_node() : NodeId {
    return juiceBannerTitleNode
}


def public juice_banner_text_node() : NodeId {
    return juiceBannerTextNode
}


def public juice_show_banner(title : string; body : string) {
    if (!juiceBannerNode.isAlive) {
        return
    }
    juiceBannerTitleNode?.UIText.text = title
    juiceBannerTextNode?.UIText.text = body
    juiceBannerT = 0.0
    juiceBannerNode.isActive = true
}


def private juice_update_banner(dt : float) {
    if (juiceBannerT < 0.0 || !juiceBannerNode.isAlive) {
        return
    }
    juiceBannerT += dt
    let res = float2(get_resolution())
    let total = JUICE_BANNER_SLIDE * 2.0 + JUICE_BANNER_HOLD
    if (juiceBannerT >= total) {
        juiceBannerT = -1.0
        juiceBannerNode.isActive = false
        return
    }
    var slide = 1.0
    if (juiceBannerT < JUICE_BANNER_SLIDE) {
        slide = ease_out_back(juiceBannerT / JUICE_BANNER_SLIDE)
    } elif (juiceBannerT > total - JUICE_BANNER_SLIDE) {
        let t = (total - juiceBannerT) / JUICE_BANNER_SLIDE
        slide = t * t
    }
    let h = res.y * 0.135
    set_frame_size(juiceBannerNode, float2(res.x * 0.62, h))
    set_frame_pos(juiceBannerNode, float2(res.x * 0.5, lerp(-h, res.y * 0.135, slide)))
    set_frame_size(juiceBannerTitleNode, float2(res.x * 0.6, h * 0.52))
    set_frame_pos(juiceBannerTitleNode, float2(res.x * 0.31, h * 0.32))
    set_frame_size(juiceBannerTextNode, float2(res.x * 0.6, h * 0.38))
    set_frame_pos(juiceBannerTextNode, float2(res.x * 0.31, h * 0.74))
}


//////////////////////////////// Sound ////////////////////////////////

def private synth_envelope(t, attack, decay : float) : float {
    if (t < attack) {
        return t / attack
    }
    return exp(-(t - attack) * decay)
}


def private synth_tone(var out : array<float>; startSec, durSec, freq, endFreq, gain, decay, noiseMix : float) {
    let startIdx = int(startSec * float(JUICE_SAMPLE_RATE))
    let count = int(durSec * float(JUICE_SAMPLE_RATE))
    if (length(out) < startIdx + count) {
        out |> resize(startIdx + count)
    }
    var phase = 0.0
    let step = 6.2831853 / float(JUICE_SAMPLE_RATE)
    for (i in range(count)) {
        let t = float(i) / float(JUICE_SAMPLE_RATE)
        let k = float(i) / float(count)
        phase += lerp(freq, endFreq, k) * step
        var s = sin(phase) * (1.0 - noiseMix)
        if (noiseMix > 0.0) {
            s += (random_float() * 2.0 - 1.0) * noiseMix
        }
        // Tail fade prevents a click where the buffer stops.
        let tail = saturate((1.0 - k) * 20.0)
        out[startIdx + i] += s * gain * synth_envelope(t, 0.002, decay) * tail
    }
}


def private juice_build_sfx() {
    if (juiceSfxReady) {
        return
    }
    juiceSfxReady = true
    synth_tone(juiceSamples[JUICE_SFX_HOVER], 0.0, 0.03, 1900.0, 2200.0, 0.14, 110.0, 0.1)

    synth_tone(juiceSamples[JUICE_SFX_CLICK], 0.0, 0.07, 220.0, 120.0, 0.55, 55.0, 0.35)
    synth_tone(juiceSamples[JUICE_SFX_CLICK], 0.0, 0.02, 1500.0, 900.0, 0.18, 170.0, 0.2)

    synth_tone(juiceSamples[JUICE_SFX_STAT_UP], 0.0, 0.16, 587.0, 587.0, 0.3, 18.0, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_STAT_UP], 0.075, 0.28, 880.0, 880.0, 0.32, 12.0, 0.0)

    synth_tone(juiceSamples[JUICE_SFX_STAT_DOWN], 0.0, 0.34, 196.0, 92.0, 0.5, 8.0, 0.12)
    synth_tone(juiceSamples[JUICE_SFX_STAT_DOWN], 0.0, 0.1, 110.0, 60.0, 0.45, 30.0, 0.45)

    synth_tone(juiceSamples[JUICE_SFX_COIN], 0.0, 0.26, 2093.0, 2093.0, 0.2, 18.0, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_COIN], 0.0, 0.2, 3136.0, 3136.0, 0.12, 24.0, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_COIN], 0.085, 0.34, 2637.0, 2637.0, 0.2, 14.0, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_COIN], 0.085, 0.24, 3951.0, 3951.0, 0.1, 22.0, 0.0)

    synth_tone(juiceSamples[JUICE_SFX_DENIED], 0.0, 0.1, 150.0, 130.0, 0.42, 22.0, 0.25)
    synth_tone(juiceSamples[JUICE_SFX_DENIED], 0.1, 0.13, 118.0, 96.0, 0.42, 20.0, 0.25)

    // Inharmonic partials are what make a tone read as a bell.
    synth_tone(juiceSamples[JUICE_SFX_BELL], 0.0, 1.4, 392.0, 392.0, 0.26, 3.2, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_BELL], 0.0, 1.0, 784.0, 784.0, 0.16, 4.5, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_BELL], 0.0, 0.8, 1014.0, 1014.0, 0.12, 6.0, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_BELL], 0.0, 0.5, 1643.0, 1643.0, 0.06, 10.0, 0.0)

    let notes = fixed_array(392.0, 523.25, 659.25, 783.99)
    for (i in range(4)) {
        let start = float(i) * 0.12
        let dur = (i == 3) ? 0.85 : 0.3
        let decay = (i == 3) ? 3.5 : 7.0
        synth_tone(juiceSamples[JUICE_SFX_FANFARE], start, dur, notes[i], notes[i], 0.24, decay, 0.0)
        synth_tone(juiceSamples[JUICE_SFX_FANFARE], start, dur, notes[i] * 2.0, notes[i] * 2.0, 0.09, decay * 1.3, 0.0)
    }

    synth_tone(juiceSamples[JUICE_SFX_THUD], 0.0, 0.9, 74.0, 34.0, 0.9, 4.5, 0.0)
    synth_tone(juiceSamples[JUICE_SFX_THUD], 0.0, 0.22, 170.0, 60.0, 0.5, 16.0, 0.6)

}


def public juice_play_sfx(sfx : int; volume : float = 1.0; pitchSpread : float = 0.0) {
    // Clicking and hovering UI elements is silent by design.
    if (sfx == JUICE_SFX_CLICK || sfx == JUICE_SFX_HOVER) {
        return
    }
    if (sfx < 0 || sfx >= JUICE_SFX_COUNT || length(juiceSamples[sfx]) == 0) {
        return
    }
    var handle = play_sound(JUICE_SAMPLE_RATE, 1, juiceSamples[sfx])
    set_volume(handle, saturate(volume) * juice_master_volume())
    if (pitchSpread > 0.0) {
        set_pitch(handle, 1.0 + (random_float() * 2.0 - 1.0) * pitchSpread)
    }
}


// Gibberish speech while dialogue types out. Clips are chosen at random and chained.
def private juice_voice_clip_seconds(clip : int) : float {
    let seconds = fixed_array(0.97, 2.03, 2.94, 2.04, 3.74, 3.13, 4.61)
    return seconds[clip]
}


// Same speaker, same pitch, so characters stay recognisable from one line to the next.
def private juice_voice_pitch(speaker : string) : float {
    var sum = 0
    for (i in range(length(speaker))) {
        sum += character_at(speaker, i) * (i + 1)
    }
    return JUICE_VOICE_PITCH_MIN + float(abs(sum) % JUICE_VOICE_PITCH_STEPS) * JUICE_VOICE_PITCH_STEP
}


def private juice_voice_stop() {
    if (juiceVoiceActive) {
        stop(juiceVoiceHandle, JUICE_VOICE_STOP_FADE)
        juiceVoiceActive = false
    }
    juiceVoiceTimer = 0.0
}


def public juice_voice_update(talking : bool; speaker : string; dt : float) {
    if (!talking) {
        juice_voice_stop()
        return
    }
    juiceVoiceTimer -= dt
    if (juiceVoiceActive && juiceVoiceTimer > 0.0) {
        return
    }
    var clip = random_range(0, JUICE_VOICE_CLIP_COUNT - 1)
    if (clip >= juiceVoiceLastClip) {
        clip++  // Never the same clip twice in a row.
    }
    juiceVoiceLastClip = clip
    let pitch = juice_voice_pitch(speaker)
    juiceVoiceHandle = play_sound(juiceVoiceSounds[clip])
    set_volume(juiceVoiceHandle, JUICE_VOICE_VOLUME * juice_master_volume())
    set_pitch(juiceVoiceHandle, pitch)
    juiceVoiceTimer = juice_voice_clip_seconds(clip) / pitch
    juiceVoiceActive = true
}


//////////////////////////////// Driver ////////////////////////////////

def private juice_set_zoom_root_offset(offset : float2) {
    // zoomRoot stretches to the canvas, so it moves through opposing anchor insets.
    get_component(zoomRoot) $(var anchor : UIAnchor?) {
        anchor.left = offset.x
        anchor.right = -offset.x
        anchor.top = offset.y
        anchor.bottom = -offset.y
    }
}


def private juice_update_shake(dt : float) {
    if (!zoomRoot.isAlive) {
        return
    }
    if (juiceTrauma <= 0.0) {
        return
    }
    juiceTrauma = max(0.0, juiceTrauma - JUICE_SHAKE_DECAY * dt)
    juiceShakeTime += dt * 34.0
    // Squared, so small hits barely move and big ones punch.
    let shake = juiceTrauma * juiceTrauma
    let amp = JUICE_SHAKE_MAX_OFFSET * fx_scale() * shake
    let offset = float2(amp * sin(juiceShakeTime * 1.7), amp * sin(juiceShakeTime * 2.3 + 1.3))
    juice_set_zoom_root_offset(offset)
    zoomRoot.localRotation = quat4(0.0, 0.0, 0.012 * shake * sin(juiceShakeTime * 1.1))
    if (juiceTrauma <= 0.0) {
        juice_set_zoom_root_offset(float2(0.0, 0.0))
        zoomRoot.localRotation = quat4(0.0, 0.0, 0.0)
    }
}


def private juice_update_flash(dt : float) {
    if (!juiceFlashNode.isAlive) {
        return
    }
    if (juiceFlashColor.w <= 0.0) {
        if (juiceFlashNode.isActive) {
            juiceFlashNode.isActive = false
        }
        return
    }
    juiceFlashNode.isActive = true
    juiceFlashColor.w = max(0.0, juiceFlashColor.w - JUICE_FLASH_DECAY * dt * max(0.25, juiceFlashColor.w))
    if (juiceFlashColor.w < 0.004) {
        juiceFlashColor.w = 0.0
    }
    set_image_color(juiceFlashNode, juiceFlashColor)
}


def private juice_update_danger(dt : float) {
    if (!juiceDangerNode.isAlive) {
        return
    }
    juiceDangerTime += dt
    juiceDangerValue = lerp(juiceDangerValue, juiceDangerTarget, saturate(dt * 2.5))
    if (juiceDangerValue < 0.01) {
        if (juiceDangerNode.isActive) {
            juiceDangerNode.isActive = false
        }
        return
    }
    juiceDangerNode.isActive = true
    let rate = lerp(1.4, 3.0, juiceDangerValue)
    let pulse = 0.72 + 0.28 * sin(juiceDangerTime * rate * 3.14159)
    let scale = juiceReduceEffects ? 0.45 : 0.85
    set_image_color(juiceDangerNode, float4(0.62, 0.03, 0.02, juiceDangerValue * pulse * scale))
}


def private juice_update_floaters(dt : float) {
    for (i in range(JUICE_MAX_FLOATERS)) {
        if (juiceFloaterLife[i] <= 0.0) {
            continue
        }
        juiceFloaterLife[i] -= dt
        let node = juiceFloaterNodes[i]
        if (juiceFloaterLife[i] <= 0.0) {
            node.isActive = false
            continue
        }
        let t = 1.0 - juiceFloaterLife[i] / JUICE_FLOATER_LIFE
        let rise = (1.0 - (1.0 - t) * (1.0 - t)) * JUICE_FLOATER_RISE * fx_scale()
        // Overshoot on entry gives the number a pop instead of a slow appearance.
        let pop = (t < 0.18) ? ease_out_back(t / 0.18) : 1.0
        set_frame_pos(node, juiceFloaterPos[i] - float2(0.0, rise))
        node.localScale = float3(pop, pop, 1.0)
        var col = juiceFloaterColor[i]
        col.w = saturate((1.0 - t) * 3.0)
        node?.UIText.color = col
    }
}


def public juice_pop_node(node : NodeId; strength : float) {
    if (juicePopNode.isAlive && juicePopNode != node) {
        juicePopNode.localScale = float3(1.0, 1.0, 1.0)
    }
    juicePopNode = node
    juicePopT = 0.0
    juicePopStrength = strength
}


def private juice_update_pop(dt : float) {
    if (juicePopT >= 1.0 || !juicePopNode.isAlive) {
        return
    }
    juicePopT = min(1.0, juicePopT + dt / 0.45)
    let u = 1.0 - juicePopT
    // A damped wobble that settles exactly back to rest.
    let scale = 1.0 + juicePopStrength * u * u * cos(juicePopT * 14.0)
    juicePopNode.localScale = float3(scale, scale, 1.0)
}


class JuiceDriver : Component {
    def override on_update {
        let dt = get_delta_time()
        juice_update_shake(dt)
        juice_update_flash(dt)
        juice_update_danger(dt)
        juice_update_floaters(dt)
        juice_update_banner(dt)
        juice_update_pop(dt)
    }
}


// Create last so it draws above the rest of the UI.
def public juice_init() {
    juice_build_sfx()
    for (i in range(JUICE_VOICE_CLIP_COUNT)) {
        let n = i + 1
        juiceVoiceSounds[i] = request_sound("static/Voice/blah_0{n}.wav")
    }
    juice_ensure_textures()
    if (juiceRoot.isAlive) {
        return
    }
    let res = float2(get_resolution())

    juiceDangerNode = panel(res, [])
    juiceDangerNode.name = "juiceDanger"
    get_component(juiceDangerNode) $(var img : UIImage?) {
        img.textureId = juiceVignetteTexture
    }
    set_image_color(juiceDangerNode, float4(0.62, 0.03, 0.02, 0.0))
    set_parent(juiceDangerNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(juiceDangerNode, float2(0.0, 0.0), float2(1.0, 1.0))
    juiceDangerNode.isActive = false

    juiceFlashNode = panel(res, [])
    juiceFlashNode.name = "juiceFlash"
    set_image_color(juiceFlashNode, float4(1.0, 1.0, 1.0, 0.0))
    set_parent(juiceFlashNode, uiCanvas, AddChildStrategy.KeepLocalTransform)
    add_anchor(juiceFlashNode, float2(0.0, 0.0), float2(1.0, 1.0))
    juiceFlashNode.isActive = false

    juiceRoot = juice_create_layer(uiCanvas, "juiceRoot", JUICE_MAX_PARTICLES, JUICE_AMBIENT_NONE)
    add_component(juiceRoot, new JuiceDriver())

    for (i in range(JUICE_MAX_FLOATERS)) {
        let node = text("")
        node.name = "juiceFloater"
        set_text_font_size(node, res.y * 0.048)
        node?.UIText.wordWrapping = false
        node?.UIText.autoResizeFrame = true
        set_frame_pivot(node, float2(0.5, 0.5))
        set_parent(node, juiceRoot, AddChildStrategy.KeepLocalTransform)
        node.isActive = false
        juiceFloaterNodes[i] = node
        juiceFloaterLife[i] = 0.0
    }

    juiceBannerNode = panel(float2(res.x * 0.62, res.y * 0.135), [])
    juiceBannerNode.name = "juiceBanner"
    set_image_color(juiceBannerNode, float4(0.13, 0.08, 0.05, 0.94))
    set_frame_pivot(juiceBannerNode, float2(0.5, 0.5))
    set_parent(juiceBannerNode, juiceRoot, AddChildStrategy.KeepLocalTransform)
    juiceBannerNode.isActive = false

    juiceBannerTitleNode = text("")
    juiceBannerTitleNode.name = "juiceBannerTitle"
    set_text_font_size(juiceBannerTitleNode, res.y * 0.05)
    set_text_color(juiceBannerTitleNode, JUICE_COLOR_GOLD)
    juiceBannerTitleNode?.UIText.horAlignment = TextHorAlignment.Center
    juiceBannerTitleNode?.UIText.vertAlignment = TextVertAlignment.Middle
    set_frame_pivot(juiceBannerTitleNode, float2(0.5, 0.5))
    set_parent(juiceBannerTitleNode, juiceBannerNode, AddChildStrategy.KeepLocalTransform)

    juiceBannerTextNode = text("")
    juiceBannerTextNode.name = "juiceBannerText"
    set_text_font_size(juiceBannerTextNode, res.y * 0.028)
    set_text_color(juiceBannerTextNode, float4(0.93, 0.86, 0.72, 1.0))
    juiceBannerTextNode?.UIText.horAlignment = TextHorAlignment.Center
    juiceBannerTextNode?.UIText.vertAlignment = TextVertAlignment.Middle
    set_frame_pivot(juiceBannerTextNode, float2(0.5, 0.5))
    set_parent(juiceBannerTextNode, juiceBannerNode, AddChildStrategy.KeepLocalTransform)
}

require engine.core
require constants
require game_state


[safe_when_uninitialized]
struct CharacterProfile {
    name : string
    description : string
    likes : string
    dislikes : string
}


[safe_when_uninitialized]
struct CharacterVisualData {
    aspect : float = 0.75
    uvRegion : float4 = float4(0.0, 0.0, 1.0, 1.0)
    outlineTexture : TextureId
    alphaWidth : int = 0
    alphaHeight : int = 0
    alphaPixels : array<uint>
}


[safe_when_uninitialized]
struct CharacterVisualLayout {
    valid : bool = false
    aspect : float = 0.75
    uvRegion : float4 = float4(0.0, 0.0, 1.0, 1.0)
}


let characterProfiles : CharacterProfile[CHARACTER_COUNT] <- fixed_array(
    CharacterProfile(
        name = "The Merchant",
        description = "A shrewd trader from the eastern roads who buys influence at court as readily as silk and spice. Every petition hides a ledger entry.",
        likes = "Low taxes, open markets, trade treaties",
        dislikes = "Tariffs, embargoes, crown monopolies"
    ),
    CharacterProfile(
        name = "The Wizard",
        description = "An aged court mage who speaks in riddles and measures power in secrets kept. The realm's mysteries bend when he whispers.",
        likes = "Arcane funding, forbidden knowledge, quiet study",
        dislikes = "Church oversight, burned grimoires, sceptical advisors"
    ),
    CharacterProfile(
        name = "The Bishop",
        description = "A high prelate draped in purple and gold, speaking for the faithful while counting souls and silver with equal devotion.",
        likes = "Cathedral building, public piety, royal legitimacy",
        dislikes = "Secular decrees, heresy trials, empty collection plates"
    ),
    CharacterProfile(
        name = "Lady Ashford",
        description = "A wealthy noblewoman whose jewels outshine most crowns. Her smile opens purses; her frown closes alliances across the realm.",
        likes = "Courtly favour, lavish feasts, noble marriages",
        dislikes = "Peasant unrest, insults to bloodlines, cheap gifts"
    ),
    CharacterProfile(
        name = "The Peasant",
        description = "A rough-spoken representative of the hungry commons, sent to plead for bread and mercy before the throne. Hope and fury share his voice.",
        likes = "Open granaries, fair wages, relief from tithes",
        dislikes = "Hunger, conscription, crushing taxes"
    ),
    CharacterProfile(
        name = "The King",
        description = "You — a young monarch crowned after the sudden death of the old king. The court watches your every decree, waiting to see whether you will flourish or falter.",
        likes = "Stability, loyal advisors, a full treasury",
        dislikes = "Rebellion, empty coffers, betrayal in the shadows"
    )
)


let characterVisualCachePaths : string[CHARACTER_VISUAL_CACHE_COUNT] <- fixed_array(
    KING_TEXTURE_PATH,
    VISITOR_TEXTURE_PATHS[0],
    VISITOR_TEXTURE_PATHS[1],
    VISITOR_TEXTURE_PATHS[2],
    VISITOR_TEXTURE_PATHS[3],
    VISITOR_TEXTURE_PATHS[4]
)


var characterVisualCache : CharacterVisualData[CHARACTER_VISUAL_CACHE_COUNT]
var characterVisualCacheReady : bool[CHARACTER_VISUAL_CACHE_COUNT]


def public get_character_profile(idx : int) : CharacterProfile {
    return characterProfiles[idx]
}


def pixel_alpha(pixel : uint) : int {
    return int((pixel >> 24u) & 0xFFu)
}


def character_pixel_declaration() : TextureDeclaration {
    return TextureDeclaration(
        filter = TextureFilter.Point,
        addressing = TextureAddress.Clamp,
        generateMipLevels = false
    )
}


def public is_character_pixel_opaque(alpha : int) : bool {
    return alpha > CHARACTER_TEXTURE_ALPHA_THRESHOLD
}


def build_outline_texture(var bitmap : Bitmap) : TextureId {
    let w = bitmap.w
    let h = bitmap.h
    let outlineColor = 0xFFFFFF00u
    let radius = CHARACTER_OUTLINE_WIDTH
    let diam = radius * 2 + 1
    var outlinePixels <- Bitmap(w, h)
    outlinePixels.pixels |> resize(w * h)
    for (y in range(h)) {
        for (x in range(w)) {
            let idx = y * w + x
            var isOutline = false
            if (!is_character_pixel_opaque(pixel_alpha(bitmap.pixels[idx]))) {
                for (oi in range(diam * diam)) {
                    let dx = (oi % diam) - radius
                    let dy = (oi / diam) - radius
                    if (dx == 0 && dy == 0) {
                        continue
                    }
                    let nx = x + dx
                    let ny = y + dy
                    if (nx < 0 || nx >= w || ny < 0 || ny >= h) {
                        continue
                    }
                    let nidx = ny * w + nx
                    if (is_character_pixel_opaque(pixel_alpha(bitmap.pixels[nidx]))) {
                        isOutline = true
                        break
                    }
                }
            }
            outlinePixels.pixels[idx] = isOutline ? outlineColor : 0u
        }
    }
    return create_texture(outlinePixels, character_pixel_declaration())
}


def build_character_visual_data(var bitmap : Bitmap) : CharacterVisualData {
    let w = bitmap.w
    let h = bitmap.h
    var data : CharacterVisualData
    data.alphaWidth = w
    data.alphaHeight = h
    data.alphaPixels |> resize(w * h)
    for (i in range(w * h)) {
        data.alphaPixels[i] = bitmap.pixels[i]
    }
    data.outlineTexture = build_outline_texture(bitmap)

    var top = h
    var bottom = 0
    var left = w
    var right = 0
    var found = false
    for (y in range(h)) {
        for (x in range(w)) {
            let idx = y * w + x
            let alpha = pixel_alpha(bitmap.pixels[idx])
            if (is_character_pixel_opaque(alpha)) {
                found = true
                top = min(top, y)
                bottom = max(bottom, y)
                left = min(left, x)
                right = max(right, x)
            }
        }
    }
    if (found) {
        let cw = right - left + 1
        let ch = bottom - top + 1
        data.aspect = float(cw) / float(ch)
        data.uvRegion = float4(
            float(left) / float(w),
            float(top) / float(h),
            float(cw) / float(w),
            float(ch) / float(h)
        )
    } else {
        data.aspect = float(w) / float(h)
        data.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    }
    return <- data
}


def visual_cache_index_for_path(path : string) : int {
    for (i in range(CHARACTER_VISUAL_CACHE_COUNT)) {
        if (characterVisualCachePaths[i] == path) {
            return i
        }
    }
    return -1
}


def precache_character_visual(path : string) {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0 || characterVisualCacheReady[idx]) {
        return
    }
    get_image_content(path) $(var bitmap : Bitmap) {
        characterVisualCache[idx] <- build_character_visual_data(bitmap)
        characterVisualCacheReady[idx] = true
    }
}


def public precache_all_character_visuals() {
    for (i in range(CHARACTER_VISUAL_CACHE_COUNT)) {
        precache_character_visual(characterVisualCachePaths[i])
    }
}


def apply_visual_data_from_cache(idx : int) {
    characterTextureAspect = characterVisualCache[idx].aspect
    characterTextureUvRegion = characterVisualCache[idx].uvRegion
    characterOutlineTexture = characterVisualCache[idx].outlineTexture
    characterAlphaWidth = characterVisualCache[idx].alphaWidth
    characterAlphaHeight = characterVisualCache[idx].alphaHeight
    let pixelCount = length(characterVisualCache[idx].alphaPixels)
    characterAlphaPixels |> resize(pixelCount)
    for (i in range(pixelCount)) {
        characterAlphaPixels[i] = characterVisualCache[idx].alphaPixels[i]
    }
}


def public apply_character_visual(path : string) : bool {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0 || !characterVisualCacheReady[idx]) {
        return false
    }
    apply_visual_data_from_cache(idx)
    return true
}


def public query_character_visual_layout(path : string) : CharacterVisualLayout {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0 || !characterVisualCacheReady[idx]) {
        return CharacterVisualLayout()
    }
    return CharacterVisualLayout(
        valid = true,
        aspect = characterVisualCache[idx].aspect,
        uvRegion = characterVisualCache[idx].uvRegion
    )
}

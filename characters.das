require engine.core
require constants
require game_state
require court_characters

module characters public


[safe_when_uninitialized]
struct OpaqueBounds {
    found : bool = false
    top : int = 0
    bottom : int = 0
    left : int = 0
    right : int = 0
}


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
        description = "A shrewd trader who bankrolled the coup and now presents the bill. Every smile at court arrives with interest attached.",
        likes = "Debt repayments, open markets, a stable usurper who can pay",
        dislikes = "Defaulted crowns, seized assets, tariffs on his caravans"
    ),
    CharacterProfile(
        name = "The Wizard",
        description = "An aged court mage who survived three reigns and prefers this one frightened. He trades omens and secrets like any other merchant.",
        likes = "Arcane funding, rumours of exiled heirs, quiet study",
        dislikes = "Church oversight, burned grimoires, rulers who ignore his warnings"
    ),
    CharacterProfile(
        name = "The Bishop",
        description = "A high prelate draped in purple and gold. He speaks for the faithful — and weighs whether heaven will bless a crown taken by force.",
        likes = "Cathedral building, public piety, legitimising the new reign",
        dislikes = "Usurpers who refuse the church, heresy, empty collection plates"
    ),
    CharacterProfile(
        name = "Lady Ashford",
        description = "A wealthy noblewoman whose house sat out the coup and now judges whether your reign deserves their bow. Her smile opens purses; her frown closes alliances.",
        likes = "Titles, marriage alliances, proof the usurper can endure",
        dislikes = "Upstart rulers, insults to bloodlines, empty treasuries"
    ),
    CharacterProfile(
        name = "The Peasant",
        description = "A rough-spoken voice from the hungry commons. He remembers the old king's granaries — and blames the usurper who emptied them.",
        likes = "Open granaries, fair wages, rulers who feed their people",
        dislikes = "Hunger, coup taxes, kings who take thrones and leave nothing behind"
    ),
    CharacterProfile(
        name = "The King",
        description = "You — the new ruler of Loria, seated after a bloody usurpation. Every faction helped you rise and now demands its price. Hold the realm, or join the king you replaced.",
        likes = "Loyal courtiers, a full treasury, silence about the old dynasty",
        dislikes = "Exiled claimants, empty coffers, sermons against your crown"
    )
)


let characterVisualCachePaths : string[CHARACTER_VISUAL_CACHE_COUNT] <- fixed_array(
    KING_TEXTURE_PATH,
    VISITOR_TEXTURE_PATHS[0],
    VISITOR_TEXTURE_PATHS[1],
    VISITOR_TEXTURE_PATHS[2],
    VISITOR_TEXTURE_PATHS[3],
    VISITOR_TEXTURE_PATHS[4],
    COURT_BODY_PATHS[0],
    COURT_BODY_PATHS[1],
    COURT_BODY_PATHS[2],
    COURT_BODY_PATHS[3],
    COURT_BODY_PATHS[4],
    COURT_BODY_PATHS[5],
    COURT_BODY_PATHS[6],
    COURT_BODY_PATHS[7],
    COURT_BODY_PATHS[8],
    COURT_BODY_PATHS[9],
    COURT_BODY_PATHS[10],
    COURT_BODY_PATHS[11]
)


var characterVisualCache : CharacterVisualData[CHARACTER_VISUAL_CACHE_COUNT]
var characterVisualCacheReady : bool[CHARACTER_VISUAL_CACHE_COUNT]
var characterOutlineReady : bool[CHARACTER_VISUAL_CACHE_COUNT]
var private cachedAlphaPath = ""
var private pendingAlphaPath = ""
var private outlineBuildQueue : array<int>
var private outlineBuildActive = false
var private outlineBuildIdx = -1
var private outlineBuildW = 0
var private outlineBuildH = 0
var private outlineBuildRadius = 0
var private outlineBuildDiam = 0
var private outlineBuildScanTop = 0
var private outlineBuildScanBottom = 0
var private outlineBuildScanLeft = 0
var private outlineBuildScanRight = 0
var private outlineBuildY = 0
var private outlineBuildBitmap : Bitmap
var private outlineBuildOutput : Bitmap


let characterProfilesRu : CharacterProfile[CHARACTER_COUNT] <- fixed_array(
    CharacterProfile(
        name = "Купец",
        description = "Хитрый торговец, профинансировавший переворот и теперь предъявляющий счёт. Каждая улыбка при дворе обходится с процентами.",
        likes = "Возврат долгов, открытые рынки, стабильный узурпатор, способный платить",
        dislikes = "Неплательщики, конфискованное имущество, пошлины на его караваны"
    ),
    CharacterProfile(
        name = "Волшебник",
        description = "Пожилой придворный маг, переживший три правления и предпочитающий, чтобы новый правитель боялся. Торгует знамениями и тайнами, как любой купец.",
        likes = "Финансирование магии, слухи об изгнанных наследниках, тихие исследования",
        dislikes = "Церковный надзор, сожжённые гримуары, правители, игнорирующие его предупреждения"
    ),
    CharacterProfile(
        name = "Епископ",
        description = "Высокий прелат в пурпурном и золоте. Говорит от имени верующих — и взвешивает, благословит ли небо корону, взятую силой.",
        likes = "Строительство соборов, публичная набожность, легитимизация нового правления",
        dislikes = "Узурпаторы, отвергающие церковь, ересь, пустые подношения"
    ),
    CharacterProfile(
        name = "Леди Эшфорд",
        description = "Богатая аристократка, чей дом не участвовал в перевороте и теперь решает, достоин ли ваш трон их поклона. Её улыбка открывает кошельки; хмурый взгляд — закрывает союзы.",
        likes = "Титулы, брачные союзы, доказательства, что узурпатор может удержаться",
        dislikes = "Выскочки-правители, оскорбления крови, пустая казна"
    ),
    CharacterProfile(
        name = "Крестьянин",
        description = "Грубый голос из голодного народа. Помнит закрома старого короля — и винит узурпатора, который их опустошил.",
        likes = "Открытые закрома, справедливая плата, правители, кормящие свой народ",
        dislikes = "Голод, налоги переворота, короли, берущие трон и не оставляющие ничего"
    ),
    CharacterProfile(
        name = "Король",
        description = "Вы — новый правитель Лории, взошедший на трон после кровавого переворота. Каждая фракция помогла вам подняться и теперь требует свою цену. Удержите королевство — или последуйте за свергнутым.",
        likes = "Верные придворные, полная казна, молчание о старой династии",
        dislikes = "Изгнанные претенденты, пустые сундуки, проповеди против вашей короны"
    )
)


def public get_character_profile(idx : int) : CharacterProfile {
    if (settingsLanguageIdx == 1) {
        return characterProfilesRu[idx]
    }
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


def compute_opaque_bounds(bitmap : Bitmap) : OpaqueBounds {
    let w = bitmap.w
    let h = bitmap.h
    var bounds : OpaqueBounds
    bounds.top = h
    bounds.bottom = 0
    bounds.left = w
    bounds.right = 0
    for (y in range(h)) {
        for (x in range(w)) {
            let idx = y * w + x
            if (is_character_pixel_opaque(pixel_alpha(bitmap.pixels[idx]))) {
                bounds.found = true
                bounds.top = min(bounds.top, y)
                bounds.bottom = max(bounds.bottom, y)
                bounds.left = min(bounds.left, x)
                bounds.right = max(bounds.right, x)
            }
        }
    }
    return bounds
}


def public reset_character_visual_prep() {
    pendingAlphaPath = ""
    outlineBuildQueue |> clear()
    outlineBuildActive = false
    outlineBuildIdx = -1
    outlineBuildW = 0
    outlineBuildH = 0
}


def process_outline_rows(yStart : int; yEnd : int) {
    let w = outlineBuildW
    let h = outlineBuildH
    let radius = outlineBuildRadius
    let diam = outlineBuildDiam
    let outlineColor = 0xFFFFFF00u
    let scanLeft = outlineBuildScanLeft
    let scanRight = outlineBuildScanRight
    for (y in range(yStart, yEnd + 1)) {
        for (x in range(scanLeft, scanRight + 1)) {
            let idx = y * w + x
            if (is_character_pixel_opaque(pixel_alpha(outlineBuildBitmap.pixels[idx]))) {
                continue
            }
            var isOutline = false
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
                if (is_character_pixel_opaque(pixel_alpha(outlineBuildBitmap.pixels[nidx]))) {
                    isOutline = true
                    break
                }
            }
            outlineBuildOutput.pixels[idx] = isOutline ? outlineColor : 0u
        }
    }
}


def finish_incremental_outline_build() {
    let idx = outlineBuildIdx
    if (idx >= 0) {
        characterVisualCache[idx].outlineTexture = create_texture(outlineBuildOutput, character_pixel_declaration())
        characterOutlineReady[idx] = true
    }
    outlineBuildActive = false
    outlineBuildIdx = -1
    outlineBuildW = 0
    outlineBuildH = 0
}


def begin_incremental_outline_build(idx : int; path : string) {
    if (idx < 0 || characterOutlineReady[idx] || outlineBuildActive) {
        return
    }
    get_image_content(path) $(var bitmap : Bitmap) {
        let w = bitmap.w
        let h = bitmap.h
        let radius = CHARACTER_OUTLINE_WIDTH
        let pad = radius + 1
        let bounds = compute_opaque_bounds(bitmap)
        outlineBuildIdx = idx
        outlineBuildW = w
        outlineBuildH = h
        outlineBuildRadius = radius
        outlineBuildDiam = radius * 2 + 1
        outlineBuildBitmap <- bitmap
        outlineBuildOutput <- Bitmap(w, h)
        outlineBuildOutput.pixels |> resize(w * h)
        if (!bounds.found) {
            finish_incremental_outline_build()
            return
        }
        outlineBuildScanTop = max(0, bounds.top - pad)
        outlineBuildScanBottom = min(h - 1, bounds.bottom + pad)
        outlineBuildScanLeft = max(0, bounds.left - pad)
        outlineBuildScanRight = min(w - 1, bounds.right + pad)
        outlineBuildY = outlineBuildScanTop
        outlineBuildActive = true
    }
}


def advance_incremental_outline_build() : bool {
    if (!outlineBuildActive) {
        return false
    }
    let yEnd = min(outlineBuildScanBottom, outlineBuildY + OUTLINE_BUILD_ROWS_PER_FRAME - 1)
    process_outline_rows(outlineBuildY, yEnd)
    outlineBuildY = yEnd + 1
    if (outlineBuildY > outlineBuildScanBottom) {
        finish_incremental_outline_build()
        return true
    }
    return false
}


def enqueue_outline_build(idx : int) {
    if (idx < 0 || characterOutlineReady[idx] || outlineBuildActive && outlineBuildIdx == idx) {
        return
    }
    for (q in outlineBuildQueue) {
        if (q == idx) {
            return
        }
    }
    push(outlineBuildQueue, idx)
}


def public queue_character_outline_prep(path : string) {
    enqueue_outline_build(visual_cache_index_for_path(path))
}


def pick_next_outline_build_idx(activePath : string; priorityPath : string) : int {
    var idx = visual_cache_index_for_path(priorityPath)
    if (idx >= 0 && !characterOutlineReady[idx]) {
        return idx
    }
    idx = visual_cache_index_for_path(activePath)
    if (idx >= 0 && !characterOutlineReady[idx]) {
        return idx
    }
    if (length(outlineBuildQueue) > 0) {
        let queuedIdx = outlineBuildQueue[0]
        erase(outlineBuildQueue, 0)
        if (queuedIdx >= 0 && !characterOutlineReady[queuedIdx]) {
            return queuedIdx
        }
    }
    return -1
}


def apply_cached_outline_for_path(path : string) : bool {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0 || !characterOutlineReady[idx]) {
        return false
    }
    characterOutlineTexture = characterVisualCache[idx].outlineTexture
    return true
}


def public tick_character_visual_prep(activePath : string; priorityPath : string) : bool {
    if (outlineBuildActive) {
        let buildingIdx = outlineBuildIdx
        let finished = advance_incremental_outline_build()
        if (finished && buildingIdx >= 0 && activePath != "") {
            let finishedPath = characterVisualCachePaths[buildingIdx]
            if (finishedPath == activePath) {
                return apply_cached_outline_for_path(activePath)
            }
        }
        return false
    }

    if (pendingAlphaPath != "" && cachedAlphaPath != pendingAlphaPath) {
        load_character_alpha_pixels(pendingAlphaPath)
        pendingAlphaPath = ""
        return false
    }

    if (activePath != "" && cachedAlphaPath != activePath) {
        pendingAlphaPath = activePath
        return false
    }

    let nextIdx = pick_next_outline_build_idx(activePath, priorityPath)
    if (nextIdx < 0) {
        return false
    }
    begin_incremental_outline_build(nextIdx, characterVisualCachePaths[nextIdx])
    return false
}


def build_character_visual_data(var bitmap : Bitmap) : CharacterVisualData {
    let w = bitmap.w
    let h = bitmap.h
    var data : CharacterVisualData
    let bounds = compute_opaque_bounds(bitmap)
    if (bounds.found) {
        var cropTop = bounds.top
        var cropBottom = bounds.bottom
        let trimTop = CHARACTER_TEXTURE_UV_TRIM_TOP
        if (cropBottom - cropTop + 1 > trimTop * 2) {
            cropTop += trimTop
        }
        let cw = bounds.right - bounds.left + 1
        let ch = cropBottom - cropTop + 1
        let insetU = 0.5 / float(w)
        let insetV = 0.5 / float(h)
        data.aspect = float(cw) / float(ch)
        data.uvRegion = float4(
            float(bounds.left) / float(w) + insetU,
            float(cropTop) / float(h) + insetV,
            float(cw) / float(w) - insetU * 2.0,
            float(ch) / float(h) - insetV * 2.0
        )
    } else {
        data.aspect = float(w) / float(h)
        data.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
    }
    return <- data
}


def copy_alpha_from_bitmap(var bitmap : Bitmap) {
    characterAlphaWidth = bitmap.w
    characterAlphaHeight = bitmap.h
    let pixelCount = bitmap.w * bitmap.h
    characterAlphaPixels |> resize(pixelCount)
    for (i in range(pixelCount)) {
        characterAlphaPixels[i] = bitmap.pixels[i]
    }
}


def load_character_alpha_pixels(path : string) {
    characterAlphaWidth = 0
    characterAlphaHeight = 0
    characterAlphaPixels |> clear()
    get_image_content(path) $(var bitmap : Bitmap) {
        copy_alpha_from_bitmap(bitmap)
    }
    cachedAlphaPath = path
}


def apply_visual_data_from_cache(idx : int; path : string) {
    characterTextureAspect = characterVisualCache[idx].aspect
    characterTextureUvRegion = characterVisualCache[idx].uvRegion
    if (cachedAlphaPath != path) {
        pendingAlphaPath = path
    }
    apply_cached_outline_for_path(path)
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


def finish_character_outline_prep(idx : int; path : string) {
    if (idx < 0 || characterOutlineReady[idx]) {
        return
    }
    if (!outlineBuildActive) {
        begin_incremental_outline_build(idx, path)
    } elif (outlineBuildIdx != idx) {
        return
    }
    while (outlineBuildActive) {
        advance_incremental_outline_build()
    }
}


def public prepare_character_visual_fully(path : string) {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0) {
        return
    }
    precache_character_visual(path)
    load_character_alpha_pixels(path)
    finish_character_outline_prep(idx, path)
}


def public warm_character_visual(path : string) {
    precache_character_visual(path)
    queue_character_outline_prep(path)
}


def public precache_all_character_visuals() {
    for (i in range(CHARACTER_VISUAL_CACHE_COUNT)) {
        precache_character_visual(characterVisualCachePaths[i])
    }
}


def public apply_character_visual(path : string) : bool {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0) {
        return false
    }
    if (!characterVisualCacheReady[idx]) {
        precache_character_visual(path)
    }
    if (!characterVisualCacheReady[idx]) {
        return false
    }
    apply_visual_data_from_cache(idx, path)
    return true
}


def public query_character_visual_layout(path : string) : CharacterVisualLayout {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0) {
        return CharacterVisualLayout()
    }
    if (!characterVisualCacheReady[idx]) {
        precache_character_visual(path)
    }
    if (!characterVisualCacheReady[idx]) {
        return CharacterVisualLayout()
    }
    return CharacterVisualLayout(
        valid = true,
        aspect = characterVisualCache[idx].aspect,
        uvRegion = characterVisualCache[idx].uvRegion
    )
}

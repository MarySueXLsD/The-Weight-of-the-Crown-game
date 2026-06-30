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
    opaqueBounds : OpaqueBounds
}


[safe_when_uninitialized]
struct CharacterAlphaSlot {
    pixels : array<uint>
    width : int = 0
    height : int = 0
    ready : bool = false
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
        description = "A shrewd trader who bankrolled the coup and now presents the bill. Every smile at court arrives with interest attached. Cross him and caravans find other roads.",
        likes = "Debt repayments, open markets, a stable usurper who can pay",
        dislikes = "Defaulted crowns, seized assets, tariffs on his caravans"
    ),
    CharacterProfile(
        name = "The Wizard",
        description = "An aged court mage who survived three reigns and prefers this one frightened. He trades omens and secrets like any other merchant. He will never advise you for free.",
        likes = "Arcane funding, rumours of exiled heirs, quiet study",
        dislikes = "Church oversight, burned grimoires, rulers who ignore his warnings"
    ),
    CharacterProfile(
        name = "The Bishop",
        description = "A high prelate draped in purple and gold. He speaks for the faithful — and weighs whether heaven will bless a crown taken by force. Defy him and every sermon becomes a referendum on your soul.",
        likes = "Cathedral building, public piety, legitimising the new reign",
        dislikes = "Usurpers who refuse the church, heresy, empty collection plates"
    ),
    CharacterProfile(
        name = "Lady Ashford",
        description = "A wealthy noblewoman whose house sat out the coup and now judges whether your reign deserves their bow. Her smile opens purses; her frown closes alliances. She is deciding whether the realm will love you, not whether she will.",
        likes = "Titles, marriage alliances, proof the usurper can endure",
        dislikes = "Upstart rulers, insults to bloodlines, empty treasuries"
    ),
    CharacterProfile(
        name = "The Peasant",
        description = "A rough-spoken voice from the hungry commons. He remembers the old king's granaries — and blames the usurper who emptied them. He wants keys to the reserves, not your poetry.",
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
    COURT_BODY_PATHS[11],
    COURT_BODY_PATHS[12],
    COURT_BODY_PATHS[13],
    COURT_BODY_PATHS[14],
    COURT_BODY_PATHS[15],
    COURT_BODY_PATHS[16],
    COURT_BODY_PATHS[17],
    COURT_BODY_PATHS[18],
    COURT_BODY_PATHS[19],
    COURT_BODY_PATHS[20],
    COURT_BODY_PATHS[21],
    COURT_BODY_PATHS[22],
    COURT_BODY_PATHS[23],
    COURT_BODY_PATHS[24],
    COURT_BODY_PATHS[25],
    COURT_BODY_PATHS[26],
    COURT_BODY_PATHS[27],
    COURT_BODY_PATHS[28],
    COURT_BODY_PATHS[29],
    COURT_BODY_PATHS[30],
    COURT_BODY_PATHS[31],
    COURT_BODY_PATHS[32],
    COURT_BODY_PATHS[33],
    COURT_BODY_PATHS[34],
    COURT_BODY_PATHS[35],
    COURT_BODY_PATHS[36],
    COURT_BODY_PATHS[37],
    COURT_BODY_PATHS[38]
)


var characterVisualCache : CharacterVisualData[CHARACTER_VISUAL_CACHE_COUNT]
var characterVisualCacheReady : bool[CHARACTER_VISUAL_CACHE_COUNT]
var characterOutlineReady : bool[CHARACTER_VISUAL_CACHE_COUNT]
var characterAlphaCache : CharacterAlphaSlot[CHARACTER_VISUAL_CACHE_COUNT]
var private cachedAlphaPath = ""
var private precacheQueue : array<int>
var private alphaPreloadQueue : array<int>
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
var private outlineLru : array<int>
var private alphaLru : array<int>
var private characterOutlinePath = ""
var public characterEmptyOutlineTexture : TextureId


let characterProfilesRu : CharacterProfile[CHARACTER_COUNT] <- fixed_array(
    CharacterProfile(
        name = "Купец",
        description = "Хитрый торговец, профинансировавший переворот и теперь предъявляющий счёт. Каждая улыбка при дворе обходится с процентами. Разорите его — караваны найдут другие дороги.",
        likes = "Возврат долгов, открытые рынки, стабильный узурпатор, способный платить",
        dislikes = "Неплательщики, конфискованное имущество, пошлины на его караваны"
    ),
    CharacterProfile(
        name = "Волшебник",
        description = "Пожилой придворный маг, переживший три правления и предпочитающий, чтобы новый правитель боялся. Торгует знамениями и тайнами, как любой купец. Он никогда не советует бесплатно.",
        likes = "Финансирование магии, слухи об изгнанных наследниках, тихие исследования",
        dislikes = "Церковный надзор, сожжённые гримуары, правители, игнорирующие его предупреждения"
    ),
    CharacterProfile(
        name = "Епископ",
        description = "Высокий прелат в пурпурном и золоте. Говорит от имени верующих — и взвешивает, благословит ли небо корону, взятую силой. Бросьте вызов — и каждая проповедь станет судом над вашей душой.",
        likes = "Строительство соборов, публичная набожность, легитимизация нового правления",
        dislikes = "Узурпаторы, отвергающие церковь, ересь, пустые подношения"
    ),
    CharacterProfile(
        name = "Леди Эшфорд",
        description = "Богатая аристократка, чей дом не участвовал в перевороте и теперь решает, достоин ли ваш трон их поклона. Её улыбка открывает кошельки; хмурый взгляд — закрывает союзы. Она решает, полюбит ли вас королевство.",
        likes = "Титулы, брачные союзы, доказательства, что узурпатор может удержаться",
        dislikes = "Выскочки-правители, оскорбления крови, пустая казна"
    ),
    CharacterProfile(
        name = "Крестьянин",
        description = "Грубый голос из голодного народа. Помнит закрома старого короля — и винит узурпатора, который их опустошил. Ему нужны ключи от закромов, а не ваша поэзия.",
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
    precacheQueue |> clear()
    alphaPreloadQueue |> clear()
    outlineBuildQueue |> clear()
    outlineBuildActive = false
    outlineBuildIdx = -1
    outlineBuildW = 0
    outlineBuildH = 0
    cachedAlphaPath = ""
    characterAlphaWidth = 0
    characterAlphaHeight = 0
    characterAlphaPixels |> clear()
}


def alpha_lru_contains(idx : int) : bool {
    for (q in alphaLru) {
        if (q == idx) {
            return true
        }
    }
    return false
}


def remove_alpha_lru_entry(idx : int) {
    for (i in range(length(alphaLru))) {
        if (alphaLru[i] == idx) {
            erase(alphaLru, i)
            return
        }
    }
}


def touch_alpha_lru(idx : int) {
    remove_alpha_lru_entry(idx)
    push(alphaLru, idx)
}


def evict_oldest_alpha_cache_entry() {
    if (length(alphaLru) == 0) {
        return
    }
    let evictIdx = alphaLru[0]
    erase(alphaLru, 0)
    if (evictIdx < 0 || !characterAlphaCache[evictIdx].ready) {
        return
    }
    let evictedPath = characterVisualCachePaths[evictIdx]
    characterAlphaCache[evictIdx].pixels |> clear()
    characterAlphaCache[evictIdx].ready = false
    characterAlphaCache[evictIdx].width = 0
    characterAlphaCache[evictIdx].height = 0
    if (cachedAlphaPath == evictedPath) {
        characterAlphaWidth = 0
        characterAlphaHeight = 0
        characterAlphaPixels |> clear()
        cachedAlphaPath = ""
    }
}


def ensure_alpha_cache_room() {
    while (length(alphaLru) >= CHARACTER_ALPHA_CACHE_MAX_SLOTS) {
        evict_oldest_alpha_cache_entry()
    }
}


def compute_downsample_size(srcW : int; srcH : int; maxDim : int) : int2 {
    if (srcW <= maxDim && srcH <= maxDim) {
        return int2(srcW, srcH)
    }
    if (srcW >= srcH) {
        return int2(maxDim, max(1, srcH * maxDim / srcW))
    }
    return int2(max(1, srcW * maxDim / srcH), maxDim)
}


def compute_alpha_cache_size(srcW : int; srcH : int) : int2 {
    return compute_downsample_size(srcW, srcH, CHARACTER_ALPHA_CACHE_MAX_SIZE)
}


def downsample_bitmap_to_max(var src : Bitmap; maxDim : int) : Bitmap {
    let size = compute_downsample_size(src.w, src.h, maxDim)
    let dstW = size.x
    let dstH = size.y
    var dst <- Bitmap(dstW, dstH)
    let pixelCount = dstW * dstH
    dst.pixels |> resize(pixelCount)
    for (y in range(dstH)) {
        let sy = y * src.h / dstH
        let rowStart = y * dstW
        let srcRowStart = sy * src.w
        for (x in range(dstW)) {
            let sx = x * src.w / dstW
            dst.pixels[rowStart + x] = src.pixels[srcRowStart + sx]
        }
    }
    return <- dst
}


def downsample_bitmap_for_cache(var src : Bitmap) : Bitmap {
    return downsample_bitmap_to_max(src, CHARACTER_ALPHA_CACHE_MAX_SIZE)
}


def store_downsampled_alpha_slot(var slot : CharacterAlphaSlot; var bitmap : Bitmap) {
    slot.width = bitmap.w
    slot.height = bitmap.h
    let pixelCount = bitmap.w * bitmap.h
    slot.pixels |> resize(pixelCount)
    for (i in range(pixelCount)) {
        slot.pixels[i] = bitmap.pixels[i]
    }
    slot.ready = true
}


def enqueue_alpha_preload(idx : int) {
    if (idx < 0 || characterAlphaCache[idx].ready) {
        return
    }
    for (q in alphaPreloadQueue) {
        if (q == idx) {
            return
        }
    }
    push(alphaPreloadQueue, idx)
}


def pick_next_alpha_preload_idx() : int {
    while (length(alphaPreloadQueue) > 0) {
        let queuedIdx = alphaPreloadQueue[0]
        erase(alphaPreloadQueue, 0)
        if (queuedIdx >= 0 && !characterAlphaCache[queuedIdx].ready) {
            return queuedIdx
        }
    }
    return -1
}


def precache_character_alpha_slot(idx : int; path : string) {
    if (idx < 0 || characterAlphaCache[idx].ready) {
        return
    }
    if (!alpha_lru_contains(idx)) {
        ensure_alpha_cache_room()
    }
    get_image_content(path) $(var bitmap : Bitmap) {
        var down <- downsample_bitmap_for_cache(bitmap)
        store_downsampled_alpha_slot(characterAlphaCache[idx], down)
    }
    if (characterAlphaCache[idx].ready) {
        touch_alpha_lru(idx)
    }
}


def load_character_alpha_pixels_from_image(path : string) {
    characterAlphaWidth = 0
    characterAlphaHeight = 0
    characterAlphaPixels |> clear()
    cachedAlphaPath = ""
    get_image_content(path) $(var bitmap : Bitmap) {
        characterAlphaWidth = bitmap.w
        characterAlphaHeight = bitmap.h
        let pixelCount = bitmap.w * bitmap.h
        characterAlphaPixels |> resize(pixelCount)
        for (i in range(pixelCount)) {
            characterAlphaPixels[i] = bitmap.pixels[i]
        }
        cachedAlphaPath = path
    }
}


def activate_character_alpha_from_cache(path : string) {
    let idx = visual_cache_index_for_path(path)
    if (idx >= 0 && !characterAlphaCache[idx].ready) {
        precache_character_alpha_slot(idx, path)
    }
    if (idx >= 0 && characterAlphaCache[idx].ready) {
        characterAlphaWidth = characterAlphaCache[idx].width
        characterAlphaHeight = characterAlphaCache[idx].height
        let pixelCount = length(characterAlphaCache[idx].pixels)
        characterAlphaPixels |> resize(pixelCount)
        for (i in range(pixelCount)) {
            characterAlphaPixels[i] = characterAlphaCache[idx].pixels[i]
        }
        cachedAlphaPath = path
        touch_alpha_lru(idx)
        return
    }
    characterAlphaWidth = 0
    characterAlphaHeight = 0
    characterAlphaPixels |> clear()
    cachedAlphaPath = ""
}


def clear_outline_build_buffers() {
    outlineBuildBitmap.pixels |> clear()
    outlineBuildOutput.pixels |> clear()
}


def texture_for_character_path(path : string) : TextureId {
    if (path == KING_TEXTURE_PATH) {
        return kingTexture
    }
    if (path == PEASANT_TEXTURE_PATH) {
        return peasantTexture
    }
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        if (path == VISITOR_TEXTURE_PATHS[i]) {
            return visitorTextures[i]
        }
    }
    for (i in range(COURT_CHARACTER_COUNT)) {
        if (path == COURT_BODY_PATHS[i]) {
            return courtBodyTextures[i]
        }
    }
    return kingTexture
}


def layout_from_texture_size(path : string) : CharacterVisualLayout {
    var layout : CharacterVisualLayout
    let tex = texture_for_character_path(path)
    get_texture_size(tex) $(size : int2) {
        if (size.x > 0 && size.y > 0) {
            layout.valid = true
            layout.aspect = float(size.x) / float(size.y)
            layout.uvRegion = float4(0.0, 0.0, 1.0, 1.0)
        }
    }
    return layout
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


def remove_outline_lru_entry(idx : int) {
    for (i in range(length(outlineLru))) {
        if (outlineLru[i] == idx) {
            erase(outlineLru, i)
            return
        }
    }
}


def touch_outline_lru(idx : int) {
    remove_outline_lru_entry(idx)
    push(outlineLru, idx)
}


def evict_oldest_outline_cache_entry() {
    if (length(outlineLru) == 0) {
        return
    }
    let evictIdx = outlineLru[0]
    erase(outlineLru, 0)
    if (evictIdx < 0 || !characterOutlineReady[evictIdx]) {
        return
    }
    let evictedPath = characterVisualCachePaths[evictIdx]
    characterVisualCache[evictIdx].outlineTexture = characterEmptyOutlineTexture
    characterOutlineReady[evictIdx] = false
    if (characterOutlinePath == evictedPath) {
        characterOutlineTexture = characterEmptyOutlineTexture
        characterOutlinePath = ""
    }
}


def finish_incremental_outline_build() {
    let idx = outlineBuildIdx
    if (idx >= 0) {
        while (length(outlineLru) >= CHARACTER_OUTLINE_CACHE_MAX) {
            evict_oldest_outline_cache_entry()
        }
        characterVisualCache[idx].outlineTexture = create_texture(outlineBuildOutput, character_pixel_declaration())
        characterOutlineReady[idx] = true
        touch_outline_lru(idx)
    }
    outlineBuildActive = false
    outlineBuildIdx = -1
    outlineBuildW = 0
    outlineBuildH = 0
    clear_outline_build_buffers()
}


def cancel_outline_build() {
    if (!outlineBuildActive) {
        return
    }
    outlineBuildActive = false
    outlineBuildIdx = -1
    outlineBuildW = 0
    outlineBuildH = 0
    clear_outline_build_buffers()
}


def create_empty_outline_texture() : TextureId {
    var pixels : array<uint>
    pixels |> resize(1)
    pixels[0] = 0u
    return create_texture(1, 1, pixels, character_pixel_declaration())
}


def public init_character_outline_textures() {
    characterEmptyOutlineTexture = create_empty_outline_texture()
    characterOutlineTexture = characterEmptyOutlineTexture
    characterOutlinePath = ""
}


def public character_outline_matches_path(path : string) : bool {
    return path != "" && characterOutlinePath == path
}


def public is_outline_ready_for_path(path : string) : bool {
    let idx = visual_cache_index_for_path(path)
    return idx >= 0 && characterOutlineReady[idx]
}


def public get_outline_texture_for_path(path : string) : TextureId {
    let idx = visual_cache_index_for_path(path)
    if (idx >= 0 && characterOutlineReady[idx]) {
        touch_outline_lru(idx)
        return characterVisualCache[idx].outlineTexture
    }
    return characterEmptyOutlineTexture
}


def begin_incremental_outline_build(idx : int; path : string) {
    if (idx < 0 || characterOutlineReady[idx] || outlineBuildActive) {
        return
    }
    get_image_content(path) $(var bitmap : Bitmap) {
        let srcW = bitmap.w
        var down <- downsample_bitmap_to_max(bitmap, CHARACTER_OUTLINE_BUILD_MAX_SIZE)
        let radius = max(1, CHARACTER_OUTLINE_WIDTH * down.w / srcW)
        begin_incremental_outline_build_from_bitmap(idx, down, radius)
    }
}


def begin_incremental_outline_build_from_bitmap(idx : int; var bitmap : Bitmap; radius : int) {
    let w = bitmap.w
    let h = bitmap.h
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


def character_prep_rows_per_frame() : int {
    return OUTLINE_BUILD_ROWS_PER_FRAME
}


def character_prep_warm_per_frame() : int {
    return CHARACTER_VISUAL_WARM_PER_FRAME
}


def character_prep_alpha_per_frame() : int {
    return CHARACTER_ALPHA_PRELOAD_PER_FRAME
}


def advance_incremental_outline_build() : bool {
    if (!outlineBuildActive) {
        return false
    }
    let rowsBudget = character_prep_rows_per_frame()
    let yEnd = min(outlineBuildScanBottom, outlineBuildY + rowsBudget - 1)
    process_outline_rows(outlineBuildY, yEnd)
    outlineBuildY = yEnd + 1
    if (outlineBuildY > outlineBuildScanBottom) {
        finish_incremental_outline_build()
        return true
    }
    return false
}


def enqueue_precache(idx : int) {
    if (idx < 0 || characterVisualCacheReady[idx]) {
        return
    }
    for (q in precacheQueue) {
        if (q == idx) {
            return
        }
    }
    push(precacheQueue, idx)
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


def public prioritize_outline_build_for_path(path : string) {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0 || characterOutlineReady[idx]) {
        return
    }
    if (outlineBuildActive && outlineBuildIdx != idx) {
        cancel_outline_build()
    }
    var filtered : array<int>
    for (q in outlineBuildQueue) {
        if (q != idx) {
            push(filtered, q)
        }
    }
    outlineBuildQueue |> clear()
    push(outlineBuildQueue, idx)
    for (q in filtered) {
        push(outlineBuildQueue, q)
    }
}


def pick_next_precache_idx(activePath : string; priorityPath : string) : int {
    var idx = visual_cache_index_for_path(priorityPath)
    if (idx >= 0 && !characterVisualCacheReady[idx]) {
        return idx
    }
    idx = visual_cache_index_for_path(activePath)
    if (idx >= 0 && !characterVisualCacheReady[idx]) {
        return idx
    }
    if (length(precacheQueue) > 0) {
        let queuedIdx = precacheQueue[0]
        erase(precacheQueue, 0)
        if (queuedIdx >= 0 && !characterVisualCacheReady[queuedIdx]) {
            return queuedIdx
        }
    }
    return -1
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
    characterOutlinePath = path
    touch_outline_lru(idx)
    return true
}


def public sync_character_outline_for_path(path : string) : bool {
    if (apply_cached_outline_for_path(path)) {
        return true
    }
    characterOutlineTexture = characterEmptyOutlineTexture
    characterOutlinePath = ""
    return false
}


def public load_character_alpha_pixels(path : string) {
    if (path == "") {
        return
    }
    if (cachedAlphaPath == path && characterAlphaWidth > 0 && length(characterAlphaPixels) == characterAlphaWidth * characterAlphaHeight) {
        return
    }
    activate_character_alpha_from_cache(path)
}


def public tick_character_visual_prep(activePath : string; priorityPath : string) : bool {
    var outlineApplied = false
    if (outlineBuildActive) {
        let buildingIdx = outlineBuildIdx
        let finished = advance_incremental_outline_build()
        if (finished && buildingIdx >= 0 && activePath != "") {
            let finishedPath = characterVisualCachePaths[buildingIdx]
            if (finishedPath == activePath) {
                outlineApplied = sync_character_outline_for_path(activePath)
            }
        }
    }

    var warmedThisFrame = 0
    let warmBudget = max(character_prep_warm_per_frame(), character_prep_alpha_per_frame())
    while (warmedThisFrame < warmBudget) {
        let alphaIdx = pick_next_alpha_preload_idx()
        if (alphaIdx >= 0) {
            precache_character_alpha_slot(alphaIdx, characterVisualCachePaths[alphaIdx])
            warmedThisFrame++
            continue
        }

        if (outlineBuildActive) {
            break
        }

        let nextPrecacheIdx = pick_next_precache_idx(activePath, priorityPath)
        if (nextPrecacheIdx >= 0) {
            precache_character_visual(characterVisualCachePaths[nextPrecacheIdx])
            warmedThisFrame++
            continue
        }

        let nextOutlineIdx = pick_next_outline_build_idx(activePath, priorityPath)
        if (nextOutlineIdx >= 0) {
            begin_incremental_outline_build(nextOutlineIdx, characterVisualCachePaths[nextOutlineIdx])
            break
        }
        break
    }
    return outlineApplied
}


def build_character_visual_data(var bitmap : Bitmap) : CharacterVisualData {
    let w = bitmap.w
    let h = bitmap.h
    var data : CharacterVisualData
    data.opaqueBounds = compute_opaque_bounds(bitmap)
    let bounds = data.opaqueBounds
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


def apply_visual_data_from_cache(idx : int; path : string) {
    characterTextureAspect = characterVisualCache[idx].aspect
    characterTextureUvRegion = characterVisualCache[idx].uvRegion
    load_character_alpha_pixels(path)
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
    load_character_alpha_pixels_from_image(path)
    finish_character_outline_prep(idx, path)
}


def public warm_character_visual(path : string) {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0) {
        return
    }
    enqueue_precache(idx)
    enqueue_alpha_preload(idx)
}


def public queue_all_character_visual_warming() {
    for (i in range(CHARACTER_VISUAL_CACHE_COUNT)) {
        warm_character_visual(characterVisualCachePaths[i])
    }
}


def public queue_all_character_alpha_preload() {
    for (i in range(CHARACTER_VISUAL_CACHE_COUNT)) {
        enqueue_alpha_preload(i)
    }
}


def public queue_splash_character_preload() {
    queue_all_character_alpha_preload()
}


def public warm_character_alpha(path : string) {
    enqueue_alpha_preload(visual_cache_index_for_path(path))
}


def public precache_all_character_visuals() {
    queue_all_character_visual_warming()
}


def public apply_character_visual(path : string) : bool {
    let idx = visual_cache_index_for_path(path)
    if (idx < 0) {
        return false
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
        return layout_from_texture_size(path)
    }
    return CharacterVisualLayout(
        valid = true,
        aspect = characterVisualCache[idx].aspect,
        uvRegion = characterVisualCache[idx].uvRegion
    )
}

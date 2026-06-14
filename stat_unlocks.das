require engine.core
require constants
require game_state
require localization public

module stat_unlocks public

let CHURCH_CUTSCENE_TITLE = "The Faith"
let CHURCH_CUTSCENE_BODY = "When the old king fell, the bishops held their tongues and counted their tithes. Today the Church demands to be seen — and every sermon will measure whether heaven still recognizes your crown."
let PEOPLE_CUTSCENE_TITLE = "The Peasantry"
let PEOPLE_CUTSCENE_BODY = "The common folk kept their heads down through the coup — but they never stopped counting sacks in the granary and boots in the yard. Today their patience ends and their voices find the throne room."
let NOBILITY_CUTSCENE_TITLE = "The Great Houses"
let NOBILITY_CUTSCENE_BODY = "The great houses of Loria have watched your reign from their country estates — measuring every decree, every insult, every sign of weakness. Today the most dangerous of them steps through your gates."
let LOYALTY_CUTSCENE_TITLE = "Court Loyalty"
let LOYALTY_CUTSCENE_BODY = "Every crown rests on whispers as much as steel. The courtiers who smiled through your coronation now measure whether your reign will hold — and whether their loyalty is still worth selling."
let SUCCESSION_CUTSCENE_TITLE = "The Line of Succession"
let SUCCESSION_CUTSCENE_BODY = "A throne without an heir is a knife left on the table. The great houses have begun asking the question you avoided since the coup: who inherits if you fall?"


def public is_stat_unlocked(statIdx : int) : bool {
    return statUnlocked[statIdx]
}


def public count_unlocked_main_stats() : int {
    var count = 0
    for (i in range(STAT_MAIN_COUNT)) {
        let idx = STAT_BAR_DISPLAY_ORDER[i]
        if (statUnlocked[idx]) {
            count++
        }
    }
    return count
}


def public mask_deltas_to_unlocked_stats(deltas : int[STAT_COUNT]) : int[STAT_COUNT] {
    var masked : int[STAT_COUNT]
    for (i in range(STAT_COUNT)) {
        if (statUnlocked[i]) {
            masked[i] = deltas[i]
        } else {
            masked[i] = 0
        }
    }
    return masked
}


def public is_encounter_available(encIdx : int) : bool {
    if (encIdx == 0) {
        return statUnlocked[STAT_FOOD_IDX]
    }
    if (encIdx == 1) {
        return statUnlocked[STAT_CHURCH_IDX]
    }
    if (encIdx == 2) {
        return statUnlocked[STAT_ARMY_IDX]
    }
    if (encIdx == 3) {
        return statUnlocked[STAT_GOLD_IDX]
    }
    if (encIdx == 4) {
        return statUnlocked[STAT_HEALTH_IDX]
    }
    if (encIdx == 5) {
        return statUnlocked[STAT_LOYALTY_IDX]
    }
    if (encIdx == 6) {
        return statUnlocked[STAT_RICH_LOVE_IDX]
    }
    if (encIdx == 7) {
        return statUnlocked[STAT_SUCCESSION_IDX]
    }
    return true
}


def public next_available_encounter_after(fromIdx : int; totalEncounters : int) : int {
    var idx = (fromIdx + 1) % totalEncounters
    var attempts = 0
    while (!is_encounter_available(idx) && attempts < totalEncounters) {
        idx = (idx + 1) % totalEncounters
        attempts++
    }
    return idx
}


def public get_stat_intro_encounter_idx(statIdx : int) : int {
    if (statIdx == STAT_CHURCH_IDX) {
        return 1
    }
    if (statIdx == STAT_ARMY_IDX) {
        return 2
    }
    if (statIdx == STAT_GOLD_IDX) {
        return 3
    }
    if (statIdx == STAT_HEALTH_IDX) {
        return 4
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return 5
    }
    if (statIdx == STAT_RICH_LOVE_IDX) {
        return 6
    }
    if (statIdx == STAT_SUCCESSION_IDX) {
        return 7
    }
    return 0
}


def public get_stat_intro_visitor_idx(statIdx : int) : int {
    if (statIdx == STAT_CHURCH_IDX) {
        return VISITOR_BISHOP_IDX
    }
    if (statIdx == STAT_PEOPLE_IDX) {
        return VISITOR_PEASANT_IDX
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return 1
    }
    if (statIdx == STAT_SUCCESSION_IDX) {
        return 1
    }
    return VISITOR_PEASANT_IDX
}


def public get_stat_unlock_cutscene_stat_for_day(day : int) : int {
    if (day == STAT_CHURCH_UNLOCK_DAY && !statUnlocked[STAT_CHURCH_IDX]) {
        return STAT_CHURCH_IDX
    }
    if (day == STAT_PEOPLE_UNLOCK_DAY && !statUnlocked[STAT_PEOPLE_IDX]) {
        return STAT_PEOPLE_IDX
    }
    if (day == STAT_NOBILITY_UNLOCK_DAY && !statUnlocked[STAT_RICH_LOVE_IDX]) {
        return STAT_RICH_LOVE_IDX
    }
    if (day == STAT_LOYALTY_UNLOCK_DAY && !statUnlocked[STAT_LOYALTY_IDX]) {
        return STAT_LOYALTY_IDX
    }
    if (day == STAT_SUCCESSION_UNLOCK_DAY && !statUnlocked[STAT_SUCCESSION_IDX]) {
        return STAT_SUCCESSION_IDX
    }
    return -1
}


def public will_cutscene_after_day_advance() : bool {
    let nextDay = currentDay + 1
    return get_stat_unlock_cutscene_stat_for_day(nextDay) >= 0
}


def public get_stat_unlock_cutscene_texture_path(statIdx : int) : string {
    if (statIdx == STAT_CHURCH_IDX) {
        return CHURCH_CUTSCENE_TEXTURE_PATH
    }
    if (statIdx == STAT_PEOPLE_IDX) {
        return PEOPLE_CUTSCENE_TEXTURE_PATH
    }
    if (statIdx == STAT_RICH_LOVE_IDX) {
        return NOBILITY_CUTSCENE_TEXTURE_PATH
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return LOYALTY_CUTSCENE_TEXTURE_PATH
    }
    if (statIdx == STAT_SUCCESSION_IDX) {
        return SUCCESSION_CUTSCENE_TEXTURE_PATH
    }
    return PEOPLE_CUTSCENE_TEXTURE_PATH
}


def public get_stat_unlock_cutscene_title(statIdx : int) : string {
    if (is_russian()) {
        if (statIdx == STAT_CHURCH_IDX) {
            return "Вера"
        }
        if (statIdx == STAT_PEOPLE_IDX) {
            return "Крестьяне"
        }
        if (statIdx == STAT_RICH_LOVE_IDX) {
            return "Великие дома"
        }
        if (statIdx == STAT_LOYALTY_IDX) {
            return "Верность двора"
        }
        if (statIdx == STAT_SUCCESSION_IDX) {
            return "Престолонаследие"
        }
    }
    if (statIdx == STAT_CHURCH_IDX) {
        return CHURCH_CUTSCENE_TITLE
    }
    if (statIdx == STAT_PEOPLE_IDX) {
        return PEOPLE_CUTSCENE_TITLE
    }
    if (statIdx == STAT_RICH_LOVE_IDX) {
        return NOBILITY_CUTSCENE_TITLE
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return LOYALTY_CUTSCENE_TITLE
    }
    if (statIdx == STAT_SUCCESSION_IDX) {
        return SUCCESSION_CUTSCENE_TITLE
    }
    return ""
}


def public get_stat_unlock_cutscene_body(statIdx : int) : string {
    if (is_russian()) {
        if (statIdx == STAT_CHURCH_IDX) {
            return "Когда пал прежний король, епископы молчали и считали десятины. Сегодня Церковь требует, чтобы её видели — и каждая проповедь будет взвешивать, признаёт ли небо ещё вашу корону."
        }
        if (statIdx == STAT_PEOPLE_IDX) {
            return "Простой люд опустил головы во время переворота — но не перестал считать мешки в амбарах и сапоги во дворе. Сегодня их терпение кончилось, и их голоса дошли до тронного зала."
        }
        if (statIdx == STAT_RICH_LOVE_IDX) {
            return "Великие дома Лории наблюдали за вашим правлением из своих загородных поместий — взвешивая каждый указ, каждое оскорбление, каждый признак слабости. Сегодня самый опасный из них переступает ваши ворота."
        }
        if (statIdx == STAT_LOYALTY_IDX) {
            return "Каждая корона держится на шёпоте не меньше, чем на стали. Придворные, улыбавшиеся при вашей коронации, теперь взвешивают, устоит ли ваше правление — и стоит ли ещё продавать им верность."
        }
        if (statIdx == STAT_SUCCESSION_IDX) {
            return "Трон без наследника — нож, оставленный на столе. Великие дома уже задают вопрос, которого вы избегали с переворота: кто унаследует престол, если вы падёте?"
        }
    }
    if (statIdx == STAT_CHURCH_IDX) {
        return CHURCH_CUTSCENE_BODY
    }
    if (statIdx == STAT_PEOPLE_IDX) {
        return PEOPLE_CUTSCENE_BODY
    }
    if (statIdx == STAT_RICH_LOVE_IDX) {
        return NOBILITY_CUTSCENE_BODY
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return LOYALTY_CUTSCENE_BODY
    }
    if (statIdx == STAT_SUCCESSION_IDX) {
        return SUCCESSION_CUTSCENE_BODY
    }
    return ""
}


def public unlock_stat_with_reveal(statIdx : int) {
    statUnlocked[statIdx] = true
    statUnlockRevealT[statIdx] = 0.0
}

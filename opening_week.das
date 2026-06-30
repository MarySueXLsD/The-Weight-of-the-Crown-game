require engine.core
require constants
require dialogue_types
require game_state
require opening_week_encounters_en
require opening_week_encounters_ru
require localization public

module opening_week public


def public is_opening_week_encounter(encounterIdx : int) : bool {
    return encounterIdx >= OPENING_WEEK_ENC_BASE && encounterIdx < OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_COUNT
}


def public opening_week_local_idx(encounterIdx : int) : int {
    return encounterIdx - OPENING_WEEK_ENC_BASE
}


def public get_opening_week_encounter(encounterIdx : int) : Encounter {
    let localIdx = opening_week_local_idx(encounterIdx)
    if (localIdx < 0 || localIdx >= OPENING_WEEK_ENC_COUNT) {
        return openingWeekEncountersEn[0]
    }
    if (is_russian()) {
        return openingWeekEncountersRu[localIdx]
    }
    return openingWeekEncountersEn[localIdx]
}


def public get_static_opening_encounter_idx(day : int) : int {
    if (day == 2) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_RUDOLF_PAY
    }
    if (day == 3) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_MALRIK_BLESS
    }
    if (day == 4) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_BORVIN_TREASURY
    }
    if (day == 6) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_MIRA_DISEASE
    }
    if (day == 7) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_VARN_GUARD
    }
    if (day == 9) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_EDRIC_DECREE
    }
    if (day == 10) {
        return OPENING_WEEK_ENC_BASE + OPENING_WEEK_ENC_RUDOLF_DESERTERS
    }
    return -1
}


def public mark_opening_week_encounter_used(encounterIdx : int) {
    if (!is_opening_week_encounter(encounterIdx)) {
        return
    }
    let localIdx = opening_week_local_idx(encounterIdx)
    if (localIdx >= 0 && localIdx < OPENING_WEEK_ENC_COUNT) {
        usedOpeningWeekFlags[localIdx] = true
    }
}


def public reset_opening_week_used_flags() {
    for (i in range(OPENING_WEEK_ENC_COUNT)) {
        usedOpeningWeekFlags[i] = false
    }
}

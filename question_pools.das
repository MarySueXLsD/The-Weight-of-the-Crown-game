require engine.core
require constants
require dialogue_types
require encounters_en
require encounters_ru
require edric_opener
require game_state
require localization public
require stat_unlocks


module question_pools public


def public encounter_count() : int {
    return TOTAL_ENCOUNTER_COUNT
}


def private get_encounter_en(index : int) : Encounter {
    if (index < POOL_MID_START) {
        return allEncountersEnEarly[index]
    }
    if (index < POOL_LATE_START) {
        return allEncountersEnMid[index - POOL_MID_START]
    }
    if (index < POOL_LATE_START + POOL_LATE_A_COUNT) {
        return allEncountersEnLateA[index - POOL_LATE_START]
    }
    if (index < POOL_PEOPLE_START) {
        return allEncountersEnLateB[index - POOL_LATE_START - POOL_LATE_A_COUNT]
    }
    return allEncountersEnPeople[index - POOL_PEOPLE_START]
}


def private get_encounter_ru(index : int) : Encounter {
    if (index < POOL_MID_START) {
        return allEncountersRuEarly[index]
    }
    if (index < POOL_LATE_START) {
        return allEncountersRuMid[index - POOL_MID_START]
    }
    if (index < POOL_LATE_START + POOL_LATE_A_COUNT) {
        return allEncountersRuLateA[index - POOL_LATE_START]
    }
    if (index < POOL_PEOPLE_START) {
        return allEncountersRuLateB[index - POOL_LATE_START - POOL_LATE_A_COUNT]
    }
    return allEncountersRuPeople[index - POOL_PEOPLE_START]
}


def public get_encounter(index : int) : Encounter {
    if (index < 0 || index >= TOTAL_ENCOUNTER_COUNT) {
        return get_edric_day_one_encounter()
    }
    if (is_edric_day_one_encounter(index)) {
        return get_edric_day_one_encounter()
    }
    if (is_russian()) {
        return get_encounter_ru(index)
    }
    return get_encounter_en(index)
}


def public get_dialogue_node(encounterIdx : int; nodeIdx : int) : DialogueNode {
    if (is_edric_day_one_encounter(encounterIdx)) {
        return get_edric_day_one_dialogue_node(nodeIdx)
    }
    return get_encounter(encounterIdx).nodes[nodeIdx]
}


def public get_encounter_character_idx(encounterIdx : int) : int {
    return get_encounter(encounterIdx).characterIdx
}


def public get_pool_start_and_count(day : int) : int2 {
    if (day >= POOL_EARLY_FIRST_DAY && day <= POOL_EARLY_LAST_DAY) {
        return int2(POOL_EARLY_START, POOL_EARLY_COUNT)
    }
    if (day >= POOL_MID_FIRST_DAY && day <= POOL_MID_LAST_DAY) {
        return int2(POOL_MID_START, POOL_MID_COUNT)
    }
    if (day >= POOL_PEOPLE_FIRST_DAY) {
        return int2(POOL_PEOPLE_START, POOL_PEOPLE_COUNT)
    }
    if (day >= POOL_LATE_FIRST_DAY && day <= POOL_LATE_LAST_DAY) {
        return int2(POOL_LATE_START, POOL_LATE_COUNT)
    }
    return int2(POOL_LATE_START, POOL_LATE_COUNT)
}


def reset_pool_used_flags(start : int; count : int) {
    for (i in range(count)) {
        usedEncounterFlags[start + i] = false
    }
}


def public is_character_on_question_cooldown(charIdx : int) : bool {
    if (charIdx < 0 || charIdx >= COURT_CHARACTER_COUNT) {
        return false
    }
    return currentDay < characterQuestionCooldowns[charIdx]
}


def public mark_encounter_character_cooldown() {
    let charIdx = currentCourtCharacterIdx
    if (charIdx < 0 || charIdx >= COURT_CHARACTER_COUNT) {
        return
    }
    characterQuestionCooldowns[charIdx] = currentDay + CHARACTER_QUESTION_COOLDOWN_DAYS + 1
}


def encounter_passes_character_cooldown(encounterIdx : int) : bool {
    let charIdx = get_encounter_character_idx(encounterIdx)
    return !is_character_on_question_cooldown(charIdx)
}


def collect_pool_candidates(start : int; count : int; respectCharacterCooldown : bool) : array<int> {
    var candidates : array<int>
    for (i in range(count)) {
        let idx = start + i
        if (!usedEncounterFlags[idx]) {
            if (!respectCharacterCooldown || encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    return <- candidates
}


def pick_random_candidate(candidates : array<int>; markUsed : bool) : int {
    let pick = candidates[random_range(0, length(candidates) - 1)]
    if (markUsed) {
        usedEncounterFlags[pick] = true
    }
    return pick
}


def pick_random_from_pool(start : int; count : int; markUsed : bool) : int {
    var candidates <- collect_pool_candidates(start, count, true)
    if (length(candidates) == 0) {
        reset_pool_used_flags(start, count)
        candidates <- collect_pool_candidates(start, count, true)
    }
    return pick_random_candidate(candidates, markUsed)
}


def pick_random_from_late_pool(markUsed : bool) : int {
    var candidates : array<int>
    for (i in range(1, POOL_LATE_COUNT)) {
        let idx = POOL_LATE_START + i
        if (!usedEncounterFlags[idx] && encounter_passes_character_cooldown(idx)) {
            push(candidates, idx)
        }
    }
    if (length(candidates) == 0) {
        reset_pool_used_flags(POOL_LATE_START + 1, POOL_LATE_COUNT - 1)
        for (i in range(1, POOL_LATE_COUNT)) {
            let idx = POOL_LATE_START + i
            if (encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    return pick_random_candidate(candidates, markUsed)
}


def pick_random_from_early_pool(markUsed : bool) : int {
    var candidates : array<int>
    for (i in range(1, POOL_EARLY_COUNT)) {
        let idx = POOL_EARLY_START + i
        if (!usedEncounterFlags[idx] && encounter_passes_character_cooldown(idx)) {
            push(candidates, idx)
        }
    }
    if (length(candidates) == 0) {
        reset_pool_used_flags(POOL_EARLY_START + 1, POOL_EARLY_COUNT - 1)
        for (i in range(1, POOL_EARLY_COUNT)) {
            let idx = POOL_EARLY_START + i
            if (encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    return pick_random_candidate(candidates, markUsed)
}


def pick_random_from_people_pool(markUsed : bool) : int {
    var candidates : array<int>
    for (i in range(POOL_PEOPLE_COUNT)) {
        let idx = POOL_PEOPLE_START + i
        if (!usedEncounterFlags[idx] && encounter_passes_character_cooldown(idx)) {
            push(candidates, idx)
        }
    }
    if (length(candidates) == 0) {
        reset_pool_used_flags(POOL_PEOPLE_START, POOL_PEOPLE_COUNT)
        for (i in range(POOL_PEOPLE_COUNT)) {
            let idx = POOL_PEOPLE_START + i
            if (encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    return pick_random_candidate(candidates, markUsed)
}


def public find_encounter_for_day(day : int) : int {
    if (day == POOL_EARLY_FIRST_DAY) {
        return POOL_EARLY_FIXED_IDX
    }
    if (day == POOL_LATE_FIRST_DAY) {
        return POOL_LATE_FIXED_IDX
    }
    if (day >= POOL_PEOPLE_FIRST_DAY) {
        return pick_random_from_people_pool(false)
    }
    if (day >= POOL_LATE_FIRST_DAY && day <= POOL_LATE_LAST_DAY) {
        return pick_random_from_late_pool(false)
    }
    if (day >= POOL_EARLY_FIRST_DAY && day <= POOL_EARLY_LAST_DAY) {
        return pick_random_from_early_pool(false)
    }
    let pool = get_pool_start_and_count(day)
    return pick_random_from_pool(pool.x, pool.y, false)
}


def public pick_encounter_for_day(day : int) : int {
    let idx = find_encounter_for_day(day)
    usedEncounterFlags[idx] = true
    return idx
}


def public apply_encounter_nickname_change(encounterIdx : int; choiceIdx : int) {
    if (encounterIdx != POOL_LATE_FIXED_IDX) {
        return
    }
    if (choiceIdx == 0 || choiceIdx == 2) {
        playerNickname = nickname_saint()
    } elif (choiceIdx == 1) {
        playerNickname = nickname_demander()
    }
}


def apply_encounter_slot(encounterIdx : int) {
    currentEncounterIdx = encounterIdx
    currentNodeIdx = get_encounter(currentEncounterIdx).startNodeIdx
    pendingNextNodeIdx = NO_NEXT_NODE
    currentCourtCharacterIdx = get_encounter_character_idx(currentEncounterIdx)
}


def public apply_encounter_after_stat_cutscene(statIdx : int) {
    var encIdx = -1
    if (queuedNextEncounterIdx >= 0) {
        encIdx = queuedNextEncounterIdx
        queuedNextEncounterIdx = -1
    } elif (currentDay == STAT_CHURCH_UNLOCK_DAY && statIdx == STAT_CHURCH_IDX) {
        encIdx = POOL_LATE_FIXED_IDX
        usedEncounterFlags[encIdx] = true
    } else {
        encIdx = get_stat_intro_encounter_idx(statIdx)
    }
    apply_encounter_slot(encIdx)
}


def public apply_forced_encounter(encounterIdx : int) {
    apply_encounter_slot(encounterIdx)
}


def public queue_forced_encounter(encounterIdx : int) {
    queuedNextEncounterIdx = encounterIdx
}


def public setup_encounter_for_day(day : int) {
    apply_encounter_slot(pick_encounter_for_day(day))
}


def public commit_encounter_pick(encIdx : int) {
    apply_encounter_slot(encIdx)
    usedEncounterFlags[encIdx] = true
}


def public queue_next_day_encounter_preview(day : int) : int {
    let encIdx = find_encounter_for_day(day)
    queuedNextEncounterIdx = encIdx
    return encIdx
}


def public advance_to_next_encounter() {
    if (queuedNextEncounterIdx >= 0 && encounter_passes_character_cooldown(queuedNextEncounterIdx)) {
        commit_encounter_pick(queuedNextEncounterIdx)
        queuedNextEncounterIdx = -1
    } else {
        queuedNextEncounterIdx = -1
        setup_encounter_for_day(currentDay)
    }
}


def public reset_used_encounter_flags() {
    for (i in range(TOTAL_ENCOUNTER_COUNT)) {
        usedEncounterFlags[i] = false
    }
}


def public reset_court_characters_met() {
    for (i in range(COURT_CHARACTER_COUNT)) {
        courtCharactersMet[i] = false
    }
}


def public reset_character_question_cooldowns() {
    for (i in range(COURT_CHARACTER_COUNT)) {
        characterQuestionCooldowns[i] = 0
    }
}

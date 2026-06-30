require engine.core
require constants
require dialogue_types
require encounters_en
require encounters_ru
require encounters_nobility_en
require encounters_nobility_ru
require encounters_loyalty_en
require encounters_loyalty_ru
require encounters_succession_en
require encounters_succession_ru
require edric_opener
require opening_week
require game_state
require localization public
require stat_unlocks
require stat_unlock_intro
require arc_routing
require arc_engine
require pool_prompts


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
    if (index < POOL_NOBILITY_START) {
        return allEncountersEnPeople[index - POOL_PEOPLE_START]
    }
    if (index < POOL_LOYALTY_START) {
        return allEncountersEnNobility[index - POOL_NOBILITY_START]
    }
    if (index < POOL_SUCCESSION_START) {
        return allEncountersEnLoyalty[index - POOL_LOYALTY_START]
    }
    return allEncountersEnSuccession[index - POOL_SUCCESSION_START]
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
    if (index < POOL_NOBILITY_START) {
        return allEncountersRuPeople[index - POOL_PEOPLE_START]
    }
    if (index < POOL_LOYALTY_START) {
        return allEncountersRuNobility[index - POOL_NOBILITY_START]
    }
    if (index < POOL_SUCCESSION_START) {
        return allEncountersRuLoyalty[index - POOL_LOYALTY_START]
    }
    return allEncountersRuSuccession[index - POOL_SUCCESSION_START]
}


def private get_pool_encounter_by_index(index : int) : Encounter {
    if (is_opening_week_encounter(index)) {
        return get_opening_week_encounter(index)
    }
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


def public get_encounter(index : int) : Encounter {
    if (usingArcEncounter && index < 0) {
        return get_arc_encounter(activeArcId, activeArcBeatIdx)
    }
    return get_pool_encounter_by_index(index)
}


def public get_dialogue_node(encounterIdx : int; nodeIdx : int) : DialogueNode {
    if (usingArcEncounter) {
        return resolve_arc_dialogue_node(activeArcId, activeArcBeatIdx, nodeIdx)
    }
    if (is_edric_day_one_encounter(encounterIdx)) {
        return get_edric_day_one_dialogue_node(nodeIdx)
    }
    let base = get_encounter(encounterIdx).nodes[nodeIdx]
    return resolve_pool_dialogue_node(encounterIdx, nodeIdx, base)
}


def public get_encounter_character_idx(encounterIdx : int) : int {
    if (usingArcEncounter && encounterIdx < 0) {
        return get_arc_character_idx(activeArcId, activeArcBeatIdx)
    }
    if (usingStatUnlockEncounter && encounterIdx < 0) {
        return currentCourtCharacterIdx
    }
    if (is_opening_week_encounter(encounterIdx)) {
        return get_opening_week_encounter(encounterIdx).characterIdx
    }
    return get_pool_encounter_by_index(encounterIdx).characterIdx
}


def public get_pool_start_and_count(day : int) : int2 {
    if (day >= POOL_EARLY_FIRST_DAY && day <= POOL_EARLY_LAST_DAY) {
        return int2(POOL_EARLY_START, POOL_EARLY_COUNT)
    }
    if (day >= POOL_MID_FIRST_DAY && day <= POOL_MID_LAST_DAY) {
        return int2(POOL_MID_START, POOL_MID_COUNT)
    }
    if (day >= POOL_SUCCESSION_FIRST_DAY) {
        return int2(POOL_SUCCESSION_START, POOL_SUCCESSION_COUNT)
    }
    if (day >= POOL_LOYALTY_FIRST_DAY && day <= POOL_LOYALTY_LAST_DAY) {
        return int2(POOL_LOYALTY_START, POOL_LOYALTY_COUNT)
    }
    if (day >= POOL_NOBILITY_FIRST_DAY && day <= POOL_NOBILITY_LAST_DAY) {
        return int2(POOL_NOBILITY_START, POOL_NOBILITY_COUNT)
    }
    if (day >= POOL_PEOPLE_FIRST_DAY && day <= POOL_PEOPLE_LAST_DAY) {
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


def mark_encounter_used(encIdx : int) {
    if (is_opening_week_encounter(encIdx)) {
        mark_opening_week_encounter_used(encIdx)
        return
    }
    if (encIdx >= 0 && encIdx < TOTAL_ENCOUNTER_COUNT) {
        usedEncounterFlags[encIdx] = true
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


def public character_passes_debut_gate(charIdx : int; gateDay : int) : bool {
    if (charIdx == CHAR_GROMM && gateDay < CHARACTER_DEBUT_DAY_GROMM) {
        return false
    }
    if (charIdx == CHAR_INGVAR && gateDay < CHARACTER_DEBUT_DAY_INGVAR) {
        return false
    }
    return true
}


def encounter_passes_character_debut_gate(encounterIdx : int; gateDay : int) : bool {
    if (encounterIdx < 0) {
        return true
    }
    if (encounterIdx == POOL_RUDOLF_BORDER_IDX && gateDay < POOL_LATE_FIRST_DAY) {
        return false
    }
    let charIdx = get_encounter_character_idx(encounterIdx)
    return character_passes_debut_gate(charIdx, gateDay)
}


def collect_pool_candidates(start : int; count : int; respectCharacterCooldown : bool; gateDay : int) : array<int> {
    var candidates : array<int>
    for (i in range(count)) {
        let idx = start + i
        if (!encounter_passes_day_gate(idx)) {
            continue
        }
        if (!encounter_passes_character_debut_gate(idx, gateDay)) {
            continue
        }
        if (!usedEncounterFlags[idx]) {
            if (!respectCharacterCooldown || encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    return <- candidates
}


def pick_random_candidate(candidates : array<int>; markUsed : bool; fallback : int) : int {
    if (length(candidates) == 0) {
        return fallback
    }
    let pick = candidates[random_range(0, length(candidates) - 1)]
    if (markUsed) {
        usedEncounterFlags[pick] = true
    }
    return pick
}


def pick_random_from_pool(start : int; count : int; markUsed : bool; gateDay : int) : int {
    var candidates <- collect_pool_candidates(start, count, true, gateDay)
    if (length(candidates) == 0) {
        reset_pool_used_flags(start, count)
        candidates <- collect_pool_candidates(start, count, true, gateDay)
    }
    if (length(candidates) == 0) {
        candidates <- collect_pool_candidates(start, count, false, gateDay)
    }
    let fallback = start
    return pick_random_candidate(candidates, markUsed, fallback)
}


def pick_random_from_late_pool(markUsed : bool; gateDay : int) : int {
    var candidates : array<int>
    for (i in range(1, POOL_LATE_COUNT)) {
        let idx = POOL_LATE_START + i
        if (!encounter_passes_day_gate(idx)) {
            continue
        }
        if (!encounter_passes_character_debut_gate(idx, gateDay)) {
            continue
        }
        if (!usedEncounterFlags[idx] && encounter_passes_character_cooldown(idx)) {
            push(candidates, idx)
        }
    }
    if (length(candidates) == 0) {
        reset_pool_used_flags(POOL_LATE_START + 1, POOL_LATE_COUNT - 1)
        for (i in range(1, POOL_LATE_COUNT)) {
            let idx = POOL_LATE_START + i
            if (!encounter_passes_day_gate(idx)) {
                continue
            }
            if (!encounter_passes_character_debut_gate(idx, gateDay)) {
                continue
            }
            if (encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    if (length(candidates) == 0) {
        for (i in range(1, POOL_LATE_COUNT)) {
            let idx = POOL_LATE_START + i
            if (encounter_passes_day_gate(idx) && encounter_passes_character_debut_gate(idx, gateDay)) {
                push(candidates, idx)
            }
        }
    }
    return pick_random_candidate(candidates, markUsed, POOL_LATE_START + 1)
}


def pick_random_from_early_pool(markUsed : bool; gateDay : int) : int {
    var candidates : array<int>
    for (i in range(1, POOL_EARLY_COUNT)) {
        let idx = POOL_EARLY_START + i
        if (!encounter_passes_day_gate(idx)) {
            continue
        }
        if (!encounter_passes_character_debut_gate(idx, gateDay)) {
            continue
        }
        if (!usedEncounterFlags[idx] && encounter_passes_character_cooldown(idx)) {
            push(candidates, idx)
        }
    }
    if (length(candidates) == 0) {
        reset_pool_used_flags(POOL_EARLY_START + 1, POOL_EARLY_COUNT - 1)
        for (i in range(1, POOL_EARLY_COUNT)) {
            let idx = POOL_EARLY_START + i
            if (!encounter_passes_day_gate(idx)) {
                continue
            }
            if (!encounter_passes_character_debut_gate(idx, gateDay)) {
                continue
            }
            if (encounter_passes_character_cooldown(idx)) {
                push(candidates, idx)
            }
        }
    }
    if (length(candidates) == 0) {
        for (i in range(1, POOL_EARLY_COUNT)) {
            let idx = POOL_EARLY_START + i
            if (encounter_passes_day_gate(idx) && encounter_passes_character_debut_gate(idx, gateDay)) {
                push(candidates, idx)
            }
        }
    }
    return pick_random_candidate(candidates, markUsed, POOL_EARLY_START + 1)
}


def pick_random_from_people_pool(markUsed : bool; gateDay : int) : int {
    return pick_random_from_pool(POOL_PEOPLE_START, POOL_PEOPLE_COUNT, markUsed, gateDay)
}


def pick_random_from_nobility_pool(markUsed : bool; gateDay : int) : int {
    return pick_random_from_pool(POOL_NOBILITY_START, POOL_NOBILITY_COUNT, markUsed, gateDay)
}


def pick_random_from_loyalty_pool(markUsed : bool; gateDay : int) : int {
    return pick_random_from_pool(POOL_LOYALTY_START, POOL_LOYALTY_COUNT, markUsed, gateDay)
}


def pick_random_from_succession_pool(markUsed : bool; gateDay : int) : int {
    return pick_random_from_pool(POOL_SUCCESSION_START, POOL_SUCCESSION_COUNT, markUsed, gateDay)
}


def public is_pool_fixed_encounter(encounterIdx : int) : bool {
    return encounterIdx == POOL_EARLY_FIXED_IDX || encounterIdx == POOL_LATE_FIXED_IDX
}


def public encounter_has_built_in_intro() : bool {
    if (usingArcEncounter) {
        return true
    }
    if (usingStatUnlockEncounter) {
        return true
    }
    if (is_opening_week_encounter(currentEncounterIdx)) {
        return true
    }
    if (is_edric_day_one_encounter(currentEncounterIdx)) {
        return true
    }
    if (is_pool_fixed_encounter(currentEncounterIdx)) {
        return true
    }
    return false
}


def is_stat_unlock_conflict_day(day : int) : bool {
    if (day == STAT_UNLOCK_CONFLICT_DAY_CHURCH) {
        return true
    }
    if (day == STAT_UNLOCK_CONFLICT_DAY_PEOPLE) {
        return true
    }
    if (day == STAT_UNLOCK_CONFLICT_DAY_NOBILITY) {
        return true
    }
    if (day == STAT_UNLOCK_CONFLICT_DAY_LOYALTY) {
        return true
    }
    if (day == STAT_UNLOCK_CONFLICT_DAY_SUCCESSION) {
        return true
    }
    return false
}


def pick_pool_encounter_for_day(day : int) : int {
    if (day == POOL_EARLY_FIRST_DAY) {
        return POOL_EARLY_FIXED_IDX
    }
    let staticOpeningIdx = get_static_opening_encounter_idx(day)
    if (staticOpeningIdx >= 0) {
        return staticOpeningIdx
    }
    if (day == POOL_LATE_FIRST_DAY) {
        return POOL_LATE_FIXED_IDX
    }
    if (day >= POOL_SUCCESSION_FIRST_DAY) {
        return pick_random_from_succession_pool(false, day)
    }
    if (day >= POOL_LOYALTY_FIRST_DAY && day <= POOL_LOYALTY_LAST_DAY) {
        return pick_random_from_loyalty_pool(false, day)
    }
    if (day >= POOL_NOBILITY_FIRST_DAY && day <= POOL_NOBILITY_LAST_DAY) {
        return pick_random_from_nobility_pool(false, day)
    }
    if (day >= POOL_PEOPLE_FIRST_DAY && day <= POOL_PEOPLE_LAST_DAY) {
        return pick_random_from_people_pool(false, day)
    }
    if (day >= POOL_LATE_FIRST_DAY && day <= POOL_LATE_LAST_DAY) {
        return pick_random_from_late_pool(false, day)
    }
    let pool = get_pool_start_and_count(day)
    return pick_random_from_pool(pool.x, pool.y, false, day)
}


def public find_encounter_for_day(day : int) : int {
    if (is_stat_unlock_conflict_day(day)) {
        return -1
    }
    let arcBeat = find_arc_beat_for_day(day)
    if (arcBeat.x >= 0) {
        return -1
    }
    return pick_pool_encounter_for_day(day)
}


def public pick_encounter_for_day(day : int) : int {
    if (is_stat_unlock_conflict_day(day)) {
        begin_arc_encounter_for_day(day)
        return currentEncounterIdx
    }
    let arcBeat = find_arc_beat_for_day(day)
    if (arcBeat.x >= 0) {
        begin_arc_encounter(arcBeat.x, arcBeat.y)
        return currentEncounterIdx
    }
    let idx = pick_pool_encounter_for_day(day)
    clear_arc_encounter_mode()
    mark_encounter_used(idx)
    apply_encounter_slot(idx)
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
    if (queuedNextEncounterIdx >= 0) {
        let encIdx = queuedNextEncounterIdx
        queuedNextEncounterIdx = -1
        clear_arc_encounter_mode()
        clear_stat_unlock_encounter_mode()
        apply_encounter_slot(encIdx)
        return
    }
    if (currentDay == STAT_CHURCH_UNLOCK_DAY && statIdx == STAT_CHURCH_IDX) {
        begin_arc_encounter(ARC_CHURCH_CROWN, 0)
        return
    }
    if (currentDay == STAT_NOBILITY_UNLOCK_DAY && statIdx == STAT_RICH_LOVE_IDX) {
        return
    }
    if (statIdx == STAT_PEOPLE_IDX || statIdx == STAT_LOYALTY_IDX || statIdx == STAT_SUCCESSION_IDX) {
        pick_encounter_for_day(currentDay)
        return
    }
    if (statIdx == STAT_CHURCH_IDX) {
        let encIdx = POOL_LATE_FIXED_IDX
        mark_encounter_used(encIdx)
        clear_arc_encounter_mode()
        apply_encounter_slot(encIdx)
    } else {
        let encIdx = get_stat_intro_encounter_idx(statIdx)
        clear_arc_encounter_mode()
        apply_encounter_slot(encIdx)
    }
}


def public apply_forced_encounter(encounterIdx : int) {
    clear_arc_encounter_mode()
    apply_encounter_slot(encounterIdx)
}


def public queue_forced_encounter(encounterIdx : int) {
    queuedNextEncounterIdx = encounterIdx
}


def public setup_encounter_for_day(day : int) {
    pick_encounter_for_day(day)
}


def public commit_encounter_pick(encIdx : int) {
    apply_encounter_slot(encIdx)
    mark_encounter_used(encIdx)
}


def public queue_next_day_encounter_preview(day : int) : int {
    if (is_stat_unlock_conflict_day(day)) {
        queuedNextEncounterIdx = -1
        queuedNextArcId = find_arc_beat_for_day(day).x
        queuedNextArcBeatIdx = find_arc_beat_for_day(day).y
        return -1
    }
    let arcBeat = find_arc_beat_for_day(day)
    if (arcBeat.x >= 0) {
        queuedNextEncounterIdx = -1
        queuedNextArcId = arcBeat.x
        queuedNextArcBeatIdx = arcBeat.y
        return -1
    }
    let encIdx = pick_pool_encounter_for_day(day)
    queuedNextEncounterIdx = encIdx
    queuedNextArcId = ARC_NONE
    queuedNextArcBeatIdx = -1
    return encIdx
}


def public advance_to_next_encounter() {
    if (queuedNextArcId >= 0) {
        begin_arc_encounter(queuedNextArcId, queuedNextArcBeatIdx)
        queuedNextArcId = ARC_NONE
        queuedNextArcBeatIdx = -1
        queuedNextEncounterIdx = -1
        return
    }
    if (queuedNextEncounterIdx >= 0
        && encounter_passes_character_cooldown(queuedNextEncounterIdx)
        && encounter_passes_character_debut_gate(queuedNextEncounterIdx, currentDay)) {
        clear_arc_encounter_mode()
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
    reset_opening_week_used_flags()
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

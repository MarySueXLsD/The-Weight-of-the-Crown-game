require engine.core
require constants
require game_state
require question_pools public


module dialogue_ids public


// Question IDs: encounterIdx * 10 + nodeIdx + 1. Ashford debut uses 101+.
// Reply IDs = questionId * 10 + choiceIdx + 1.

let public {
    RESUME_ASHFORD_CUTSCENE = -1
    RESUME_STAT_PEOPLE_CUTSCENE = -2
    RESUME_STAT_LOYALTY_CUTSCENE = -3
    RESUME_STAT_SUCCESSION_CUTSCENE = -4
    RESUME_STAT_CHURCH_CUTSCENE = -5
    RESUME_STAT_NOBILITY_CUTSCENE = -6
    ASHFORD_QUESTION_ID_BASE = 101
}


def public main_question_id(encounterIdx : int; nodeIdx : int) : int {
    return encounterIdx * 10 + nodeIdx + 1
}


def public ashford_question_id(nodeIdx : int) : int {
    return ASHFORD_QUESTION_ID_BASE + nodeIdx
}


def public reply_id(questionId : int; choiceIdx : int) : int {
    return questionId * 10 + choiceIdx + 1
}


def public get_current_question_id() : int {
    if (usingAshfordDebutEncounter) {
        return ashford_question_id(currentNodeIdx)
    }
    return main_question_id(currentEncounterIdx, currentNodeIdx)
}


def public get_reply_id_for_choice(choiceIdx : int) : int {
    return reply_id(get_current_question_id(), choiceIdx)
}


def public is_ashford_question_id(questionId : int) : bool {
    return questionId >= ASHFORD_QUESTION_ID_BASE
}


def public is_cutscene_resume_id(resumeId : int) : bool {
    return resumeId < 0
}


def public is_stat_unlock_cutscene_resume_id(resumeId : int) : bool {
    return resumeId == RESUME_STAT_CHURCH_CUTSCENE || resumeId == RESUME_STAT_PEOPLE_CUTSCENE || resumeId == RESUME_STAT_NOBILITY_CUTSCENE || resumeId == RESUME_STAT_LOYALTY_CUTSCENE || resumeId == RESUME_STAT_SUCCESSION_CUTSCENE
}


def public cutscene_resume_id_for_stat(statIdx : int) : int {
    if (statIdx == STAT_CHURCH_IDX) {
        return RESUME_STAT_CHURCH_CUTSCENE
    }
    if (statIdx == STAT_PEOPLE_IDX) {
        return RESUME_STAT_PEOPLE_CUTSCENE
    }
    if (statIdx == STAT_RICH_LOVE_IDX) {
        return RESUME_STAT_NOBILITY_CUTSCENE
    }
    if (statIdx == STAT_LOYALTY_IDX) {
        return RESUME_STAT_LOYALTY_CUTSCENE
    }
    if (statIdx == STAT_SUCCESSION_IDX) {
        return RESUME_STAT_SUCCESSION_CUTSCENE
    }
    return RESUME_STAT_PEOPLE_CUTSCENE
}


def public stat_idx_for_cutscene_resume_id(resumeId : int) : int {
    if (resumeId == RESUME_STAT_CHURCH_CUTSCENE) {
        return STAT_CHURCH_IDX
    }
    if (resumeId == RESUME_STAT_PEOPLE_CUTSCENE) {
        return STAT_PEOPLE_IDX
    }
    if (resumeId == RESUME_STAT_NOBILITY_CUTSCENE || resumeId == RESUME_ASHFORD_CUTSCENE) {
        return STAT_RICH_LOVE_IDX
    }
    if (resumeId == RESUME_STAT_LOYALTY_CUTSCENE) {
        return STAT_LOYALTY_IDX
    }
    if (resumeId == RESUME_STAT_SUCCESSION_CUTSCENE) {
        return STAT_SUCCESSION_IDX
    }
    return -1
}


def public resolve_main_question_id(questionId : int) : int2 {
    if (questionId <= 0) {
        return int2(0, 0)
    }
    let encounterIdx = (questionId - 1) / 10
    let nodeIdx = (questionId - 1) % 10
    return int2(encounterIdx, nodeIdx)
}


def public apply_question_id_to_state(questionId : int) {
    if (is_ashford_question_id(questionId)) {
        usingAshfordDebutEncounter = true
        currentNodeIdx = questionId - ASHFORD_QUESTION_ID_BASE
        pendingNextNodeIdx = NO_NEXT_NODE
        return
    }
    usingAshfordDebutEncounter = false
    let loc = resolve_main_question_id(questionId)
    currentEncounterIdx = loc.x
    currentNodeIdx = loc.y
    pendingNextNodeIdx = NO_NEXT_NODE
    currentCourtCharacterIdx = get_encounter_character_idx(currentEncounterIdx)
}

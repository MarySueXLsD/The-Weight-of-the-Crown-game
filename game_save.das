require engine.core
require constants
require game_state
require dialogue_ids
require question_pools public


module game_save public


let public {
    SAVE_VERSION = 6
    SAVE_STORAGE_KEY = "game_progress"
    HIGH_SCORE_STORAGE_KEY = "high_score"
}


var private loadedNextResumeId = 0


def visitor_index_for_texture(tex : TextureId) : int {
    for (i in range(VISITOR_TEXTURE_COUNT)) {
        if (visitorTextures[i] == tex) {
            return i
        }
    }
    return 0
}


def sync_stat_displays_after_commit() {
    for (i in range(STAT_COUNT)) {
        statFillDisplayed[i] = float(kingdomStats[i])
        statFillFrom[i] = float(kingdomStats[i])
        statFillTo[i] = float(kingdomStats[i])
        statConfirmPhase[i] = STAT_CONFIRM_IDLE
        statConfirmTimer[i] = 0.0
        statFlashT[i] = 0.0
        statEmphasisT[i] = 0.0
        statChoiceHoverT[i] = 0.0
    }
}


def public commit_pending_choice_stats() {
    if (!hasPendingChoiceDeltas) {
        return
    }
    for (i in range(STAT_COUNT)) {
        kingdomStats[i] = clamp_stat(kingdomStats[i] + pendingChoiceDeltas[i])
    }
    hasPendingChoiceDeltas = false
    sync_stat_displays_after_commit()
}


def public append_reply_to_history(questionId : int; replyId : int) {
    push(savedQuestionIds, questionId)
    push(savedReplyIds, replyId)
}


def public clear_reply_history() {
    savedQuestionIds |> clear()
    savedReplyIds |> clear()
}


def public save_game_progress(nextResumeId : int) {
    commit_pending_choice_stats()
    loadedNextResumeId = nextResumeId

    var storage : GenericStorage
    set(storage, "version", SAVE_VERSION)
    set(storage, "hasProgress", 1)
    set(storage, "day", currentDay)
    set(storage, "encounter", currentEncounterIdx)
    set(storage, "node", currentNodeIdx)
    set(storage, "nextResume", nextResumeId)
    set(storage, "charVisitorIdx", visitor_index_for_texture(characterTexture))
    set(storage, "nextVisitorIdx", visitor_index_for_texture(nextVisitorTexture))
    set(storage, "pendingNode", pendingNextNodeIdx)
    set(storage, "advisorUsedToday", advisorActionUsedToday ? 1 : 0)
    set(storage, "ashfordIntroduced", ashfordIntroduced ? 1 : 0)
    set(storage, "ashfordDebut", usingAshfordDebutEncounter ? 1 : 0)
    set(storage, "courtCharIdx", currentCourtCharacterIdx)

    for (i in range(COURT_CHARACTER_COUNT)) {
        set(storage, "courtMet{i}", courtCharactersMet[i] ? 1 : 0)
        set(storage, "charQCooldown{i}", characterQuestionCooldowns[i])
    }

    set(storage, "stats0", int4(kingdomStats[0], kingdomStats[1], kingdomStats[2], kingdomStats[3]))
    set(storage, "stats1", int4(kingdomStats[4], kingdomStats[5], kingdomStats[6], kingdomStats[7]))
    set(storage, "stat8", kingdomStats[8])

    set(storage, "unlock0", statUnlocked[0] ? 1 : 0)
    set(storage, "unlock1", statUnlocked[1] ? 1 : 0)
    set(storage, "unlock2", statUnlocked[2] ? 1 : 0)
    set(storage, "unlock3", statUnlocked[3] ? 1 : 0)
    set(storage, "unlock4", statUnlocked[4] ? 1 : 0)
    set(storage, "unlock5", statUnlocked[5] ? 1 : 0)
    set(storage, "unlock6", statUnlocked[6] ? 1 : 0)
    set(storage, "unlock7", statUnlocked[7] ? 1 : 0)
    set(storage, "unlock8", statUnlocked[8] ? 1 : 0)

    var historyEntries : array<int4>
    let historyCount = length(savedQuestionIds)
    for (i in range(historyCount)) {
        push(historyEntries, int4(savedQuestionIds[i], savedReplyIds[i], 0, 0))
    }
    if (length(historyEntries) > 0) {
        set(storage, "history", historyEntries)
    }

    let result = save_storage(storage, SAVE_STORAGE_KEY)
    if (result == SaveStorageResult.Success) {
        hasSaveGame = true
    }
}


def public clear_game_save() {
    remove_storage(SAVE_STORAGE_KEY)
    hasSaveGame = false
    loadedNextResumeId = 0
    clear_reply_history()
}


def public load_record_days() {
    load_storage(HIGH_SCORE_STORAGE_KEY) $(var storage : GenericStorage#) {
        recordDays = get_or(storage, "recordDays", 0)
    }
}


def public save_record_days() {
    var storage : GenericStorage
    set(storage, "recordDays", recordDays)
    save_storage(storage, HIGH_SCORE_STORAGE_KEY)
}


def public try_update_record_days(days : int) {
    if (days > recordDays) {
        recordDays = days
        save_record_days()
    }
}


def public refresh_save_availability() {
    hasSaveGame = false
    load_storage(SAVE_STORAGE_KEY) $(var storage : GenericStorage#) {
        if (get_or(storage, "hasProgress", 0) == 1) {
            hasSaveGame = true
        }
    }
}


def public get_loaded_next_resume_id() : int {
    return loadedNextResumeId
}


def public load_and_apply_game_progress() : bool {
    var loaded = false
    load_storage(SAVE_STORAGE_KEY) $(var storage : GenericStorage#) {
        if (get_or(storage, "hasProgress", 0) != 1) {
            return
        }

        currentDay = get_or(storage, "day", 1)
        currentEncounterIdx = get_or(storage, "encounter", 0)
        currentNodeIdx = get_or(storage, "node", 0)
        loadedNextResumeId = get_or(storage, "nextResume", main_question_id(0, 0))
        ashfordIntroduced = get_or(storage, "ashfordIntroduced", 0) != 0
        usingAshfordDebutEncounter = get_or(storage, "ashfordDebut", 0) != 0

        let stats0 = get_or(storage, "stats0", int4(STAT_START_VALUES[0], STAT_START_VALUES[1], STAT_START_VALUES[2], STAT_START_VALUES[3]))
        let stats1 = get_or(storage, "stats1", int4(STAT_START_VALUES[4], STAT_START_VALUES[5], STAT_START_VALUES[6], STAT_START_VALUES[7]))
        kingdomStats[0] = stats0.x
        kingdomStats[1] = stats0.y
        kingdomStats[2] = stats0.z
        kingdomStats[3] = stats0.w
        kingdomStats[4] = stats1.x
        kingdomStats[5] = stats1.y
        kingdomStats[6] = stats1.z
        kingdomStats[7] = stats1.w
        kingdomStats[8] = get_or(storage, "stat8", STAT_START_VALUES[8])

        var savedUnlocked : int[STAT_COUNT]
        savedUnlocked[0] = get_or(storage, "unlock0", 0)
        savedUnlocked[1] = get_or(storage, "unlock1", 0)
        savedUnlocked[2] = get_or(storage, "unlock2", 0)
        savedUnlocked[3] = get_or(storage, "unlock3", 0)
        savedUnlocked[4] = get_or(storage, "unlock4", 0)
        savedUnlocked[5] = get_or(storage, "unlock5", 0)
        savedUnlocked[6] = get_or(storage, "unlock6", 0)
        savedUnlocked[7] = get_or(storage, "unlock7", 0)
        savedUnlocked[8] = get_or(storage, "unlock8", 0)
        apply_stat_unlocks_for_saved_day(currentDay, savedUnlocked)

        clear_reply_history()
        var historyEntries : array<int4>
        if (get(storage, "history", historyEntries)) {
            for (entry in historyEntries) {
                push(savedQuestionIds, entry.x)
                push(savedReplyIds, entry.y)
            }
        }

        let legacyVisitorIdx = clamp(get_or(storage, "visitorIdx", 0), 0, VISITOR_TEXTURE_COUNT - 1)
        let charVisitorIdx = clamp(get_or(storage, "charVisitorIdx", legacyVisitorIdx), 0, VISITOR_TEXTURE_COUNT - 1)
        let nextVisitorIdx = clamp(get_or(storage, "nextVisitorIdx", legacyVisitorIdx), 0, VISITOR_TEXTURE_COUNT - 1)
        currentCourtCharacterIdx = clamp(get_or(storage, "courtCharIdx", get_encounter_character_idx(currentEncounterIdx)), 0, COURT_CHARACTER_COUNT - 1)
        for (i in range(COURT_CHARACTER_COUNT)) {
            courtCharactersMet[i] = get_or(storage, "courtMet{i}", 0) != 0
            characterQuestionCooldowns[i] = get_or(storage, "charQCooldown{i}", 0)
        }
        if (usingAshfordDebutEncounter) {
            characterTexture = visitorTextures[VISITOR_LADY_ASHFORD_IDX]
            nextVisitorTexture = visitorTextures[nextVisitorIdx]
        } else {
            characterTexture = courtBodyTextures[currentCourtCharacterIdx]
            nextVisitorTexture = visitorTextures[nextVisitorIdx]
        }
        pendingNextNodeIdx = get_or(storage, "pendingNode", NO_NEXT_NODE)
        hasPendingChoiceDeltas = false
        advisorActionUsedToday = get_or(storage, "advisorUsedToday", 0) != 0
        sync_stat_displays_after_commit()
        loaded = true
        hasSaveGame = true
    }
    return loaded
}

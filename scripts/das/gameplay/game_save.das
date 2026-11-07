require engine.core
require scripts/das/core/constants
require scripts/das/core/game_state
require scripts/das/core/dialogue_ids
require scripts/das/gameplay/question_pools public
require scripts/das/arcs/arc_state
module game_save public


let public {
    SAVE_VERSION = 8
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


def public clear_record_days() {
    remove_storage(HIGH_SCORE_STORAGE_KEY)
    recordDays = 0
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
    set(storage, "usingArc", usingArcEncounter ? 1 : 0)
    set(storage, "usingStatUnlock", usingStatUnlockEncounter ? 1 : 0)
    set(storage, "statUnlockKind", statUnlockEncounterKind)
    set(storage, "arcId", activeArcId)
    set(storage, "arcBeat", activeArcBeatIdx)
    set(storage, "householdStance", householdStance)
    set(storage, "householdTone", householdTone)
    set(storage, "householdConsistency", householdConsistency)
    set(storage, "householdOutcome", householdOutcome)
    set(storage, "householdArcPhase", householdArcPhase)
    set(storage, "householdKeptGromm", householdKeptGromm ? 1 : 0)
    set(storage, "householdFeastChoice", householdFeastChoice)
    set(storage, "northernTrust", northernTrust)
    set(storage, "northernEnvoyChoice", northernEnvoyChoice)
    set(storage, "northernOutcome", northernOutcome)
    set(storage, "northernArcPhase", northernArcPhase)
    set(storage, "tapestryTrust", tapestryTrust)
    set(storage, "tapestryOutcome", tapestryOutcome)
    set(storage, "famineSeverity", famineSeverity)
    set(storage, "hungryOutcome", hungryOutcome)
    set(storage, "guildStanding", guildStanding)
    set(storage, "guildOutcome", guildOutcome)
    set(storage, "plagueProgress", plagueCureProgress)
    set(storage, "plaguePath", plagueFundingPath)
    set(storage, "arc_plagueChurchTook", plagueChurchTook ? 1 : 0)
    set(storage, "arc_plagueChurchShare", plagueChurchShare ? 1 : 0)
    set(storage, "arc_plagueOdoAsked", plagueOdoAsked ? 1 : 0)
    set(storage, "arc_plagueOdoUsed", plagueOdoUsed ? 1 : 0)
    set(storage, "arc_plagueOdoWide", plagueOdoWide ? 1 : 0)
    set(storage, "arc_plagueAftermathShown", plagueAftermathShown)
    set(storage, "arc_householdWatchedGromm", householdWatchedGromm ? 1 : 0)
    set(storage, "arc_householdPurgedGuards", householdPurgedGuards ? 1 : 0)
    set(storage, "arc_householdCutClerks", householdCutClerks ? 1 : 0)
    set(storage, "arc_householdShelteredConfessor", householdShelteredConfessor ? 1 : 0)
    set(storage, "arc_householdChurchDeal", householdChurchDeal ? 1 : 0)
    set(storage, "arc_householdSelenaBribe", householdSelenaBribe ? 1 : 0)
    set(storage, "arc_householdVeteranPurge", householdVeteranPurge ? 1 : 0)
    set(storage, "arc_householdSelectiveGuards", householdSelectiveGuards ? 1 : 0)
    set(storage, "arc_tapestryArcPhase", tapestryArcPhase)
    set(storage, "arc_purseStance", purseStance)
    set(storage, "arc_purseOutcome", purseOutcome)
    set(storage, "arc_purseArcPhase", purseArcPhase)
    set(storage, "arc_hungryArcPhase", hungryArcPhase)
    set(storage, "arc_hungryCrownPolicy", hungryCrownPolicy)
    set(storage, "arc_hungryChurchSoup", hungryChurchSoup ? 1 : 0)
    set(storage, "arc_hungryFaraCartel", hungryFaraCartel ? 1 : 0)
    set(storage, "arc_hungryYarekRiots", hungryYarekRiots ? 1 : 0)
    set(storage, "arc_hungryGrommFeast", hungryGrommFeast ? 1 : 0)
    set(storage, "arc_guildArcPhase", guildArcPhase)
    set(storage, "arc_guildCrownStance", guildCrownStance)
    set(storage, "arc_guildFaraEmbargo", guildFaraEmbargo ? 1 : 0)
    set(storage, "arc_guildSaltLoan", guildSaltLoan ? 1 : 0)
    set(storage, "arc_guildNeriusCounterfeit", guildNeriusCounterfeit ? 1 : 0)
    set(storage, "arc_guildJointUltimatum", guildJointUltimatum ? 1 : 0)
    set(storage, "arc_churchStance", churchStance)
    set(storage, "arc_churchOutcome", churchOutcome)
    set(storage, "arc_churchArcPhase", churchArcPhase)
    set(storage, "arc_churchArcStance", churchArcStance)
    set(storage, "arc_churchInterdictDeclared", churchInterdictDeclared ? 1 : 0)
    set(storage, "arc_forfeitPressure", forfeitPressure)
    set(storage, "arc_northernWarStage", northernWarStage)
    set(storage, "arc_northernBorderChoice", northernBorderChoice)
    set(storage, "arc_northernFaithChoice", northernFaithChoice)
    set(storage, "arc_northernKnoxChoice", northernKnoxChoice)
    set(storage, "arc_northernAllianceChoice", northernAllianceChoice)
    set(storage, "arc_northernTributePaid", northernTributePaid ? 1 : 0)
    set(storage, "arc_northernAllianceSigned", northernAllianceSigned ? 1 : 0)
    set(storage, "arc_northernWarDeclared", northernWarDeclared ? 1 : 0)
    set(storage, "arc_northernRefugeesAccepted", northernRefugeesAccepted ? 1 : 0)
    set(storage, "arc_northernRefugeesTurnedBack", northernRefugeesTurnedBack ? 1 : 0)
    set(storage, "arc_tapestryLissaChoice", tapestryLissaChoice)
    set(storage, "arc_tapestryTilChoice", tapestryTilChoice)
    set(storage, "arc_tapestryGrommChoice", tapestryGrommChoice)
    set(storage, "arc_tapestryRaenaChoice", tapestryRaenaChoice)
    set(storage, "arc_tapestryChamberChoice", tapestryChamberChoice)
    set(storage, "arc_tapestryKnoxChoice", tapestryKnoxChoice)
    set(storage, "arc_tapestryChamberUsed", tapestryChamberUsed ? 1 : 0)
    set(storage, "arc_tapestryLissaCoupNight", tapestryLissaCoupNight ? 1 : 0)
    set(storage, "arc_tapestryTilMockCrown", tapestryTilMockCrown ? 1 : 0)
    set(storage, "arc_tapestryRaenaDoor", tapestryRaenaDoor ? 1 : 0)
    set(storage, "arc_tapestryKnoxServants", tapestryKnoxServants ? 1 : 0)
    set(storage, "arc_tapestryCoupNarrow", tapestryCoupNarrow ? 1 : 0)
    set(storage, "arc_tapestryCrownStance", tapestryCrownStance)
    set(storage, "arc_emptyPurseDay11Choice", emptyPurseDay11Choice)
    set(storage, "arc_emptyPurseBorvinChoice", emptyPurseBorvinChoice)
    set(storage, "arc_emptyPurseFinnChoice", emptyPurseFinnChoice)
    set(storage, "arc_emptyPurseSaltLoan", emptyPurseSaltLoan ? 1 : 0)
    set(storage, "arc_emptyPurseFinnAmnesty", emptyPurseFinnAmnesty ? 1 : 0)
    set(storage, "arc_emptyPurseKaraCrown", emptyPurseKaraCrown ? 1 : 0)
    set(storage, "arc_emptyPurseOttoSworn", emptyPurseOttoSworn ? 1 : 0)
    set(storage, "arc_emptyPurseCrisis", emptyPurseCrisis ? 1 : 0)
    set(storage, "arc_armyPayTrust", armyPayTrust)
    set(storage, "arc_northernAshfordLinked", northernAshfordLinked ? 1 : 0)
    set(storage, "arc_housesOutcome", housesOutcome)
    set(storage, "arc_housesArcPhase", housesArcPhase)
    set(storage, "arc_housesDeadCount", housesDeadCount)
    set(storage, "arc_housesAliveAshford", housesAliveAshford ? 1 : 0)
    set(storage, "arc_housesAliveKaspar", housesAliveKaspar ? 1 : 0)
    set(storage, "arc_housesAliveDell", housesAliveDell ? 1 : 0)
    set(storage, "arc_housesAliveCrow", housesAliveCrow ? 1 : 0)
    set(storage, "arc_housesAliveRaymond", housesAliveRaymond ? 1 : 0)
    set(storage, "arc_housesAliveGoose", housesAliveGoose ? 1 : 0)
    set(storage, "arc_scaffoldOutcome", scaffoldOutcome)
    set(storage, "arc_scaffoldArcPhase", scaffoldArcPhase)
    set(storage, "arc_scaffoldMercy", scaffoldMercy)
    set(storage, "arc_scaffoldCrownStance", scaffoldCrownStance)
    set(storage, "arc_scaffoldRiotHangings", scaffoldRiotHangings ? 1 : 0)
    set(storage, "arc_scaffoldMassAmnesty", scaffoldMassAmnesty ? 1 : 0)
    set(storage, "arc_scaffoldTalenBribe", scaffoldTalenBribe ? 1 : 0)
    set(storage, "arc_starChamberOutcome", starChamberOutcome)
    set(storage, "arc_starChamberArcPhase", starChamberArcPhase)
    set(storage, "arc_starCredibility", starCredibility)
    set(storage, "arc_starSilenced", starSilenced ? 1 : 0)
    set(storage, "arc_starCrownStance", starCrownStance)
    set(storage, "arc_prophetFavor", prophetFavor)
    set(storage, "arc_prophetOutcome", prophetOutcome)
    set(storage, "arc_prophetArcPhase", prophetArcPhase)
    set(storage, "arc_prophetSilenced", prophetSilenced ? 1 : 0)
    set(storage, "arc_prophetFoxCult", prophetFoxCult ? 1 : 0)
    set(storage, "arc_courtTrust", courtTrust)
    set(storage, "arc_knivesArcPhase", knivesArcPhase)
    set(storage, "arc_knivesOutcome", knivesOutcome)
    set(storage, "arc_knivesCrownStance", knivesCrownStance)
    set(storage, "arc_knivesKnoxOffer", knivesKnoxOffer ? 1 : 0)
    set(storage, "arc_knivesTalenTriple", knivesTalenTriple ? 1 : 0)
    set(storage, "arc_knivesVarnPurge", knivesVarnPurge ? 1 : 0)
    set(storage, "arc_heirCredibility", heirCredibility)
    set(storage, "arc_nephewOutcome", nephewOutcome)
    set(storage, "arc_nephewArcPhase", nephewArcPhase)
    set(storage, "arc_heirCrownStance", heirCrownStance)
    set(storage, "arc_heirNephewAlive", heirNephewAlive ? 1 : 0)
    set(storage, "arc_heirIngvarBid", heirIngvarBid ? 1 : 0)
    set(storage, "arc_plagueOutcome", plagueOutcome)
    set(storage, "arc_plagueArcPhase", plagueArcPhase)
    set(storage, "arc_peopleUnlockTone", peopleUnlockTone)
    set(storage, "arc_guildCompactSigned", guildCompactSigned ? 1 : 0)
    set(storage, "arc_housesAshfordLeads", housesAshfordLeads ? 1 : 0)
    set(storage, "arc_housesRaymondRising", housesRaymondRising ? 1 : 0)
    set(storage, "arc_housesDellCrowDeal", housesDellCrowDeal ? 1 : 0)
    set(storage, "arc_housesGooseFavored", housesGooseFavored ? 1 : 0)
    set(storage, "arc_heirAshfordCage", heirAshfordCage ? 1 : 0)
    set(storage, "arc_heirRecognized", heirRecognized ? 1 : 0)
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
        usingArcEncounter = get_or(storage, "usingArc", 0) != 0
        usingStatUnlockEncounter = get_or(storage, "usingStatUnlock", 0) != 0
        statUnlockEncounterKind = get_or(storage, "statUnlockKind", 0)
        activeArcId = get_or(storage, "arcId", ARC_NONE)
        activeArcBeatIdx = get_or(storage, "arcBeat", -1)
        householdStance = get_or(storage, "householdStance", 0)
        householdTone = get_or(storage, "householdTone", 0)
        householdConsistency = get_or(storage, "householdConsistency", 50)
        householdOutcome = get_or(storage, "householdOutcome", 0)
        householdArcPhase = get_or(storage, "householdArcPhase", 0)
        householdKeptGromm = get_or(storage, "householdKeptGromm", 0) != 0
        householdFeastChoice = get_or(storage, "householdFeastChoice", -1)
        northernTrust = get_or(storage, "northernTrust", 0)
        northernEnvoyChoice = get_or(storage, "northernEnvoyChoice", -1)
        northernOutcome = get_or(storage, "northernOutcome", 0)
        northernArcPhase = get_or(storage, "northernArcPhase", 0)
        tapestryTrust = get_or(storage, "tapestryTrust", 0)
        tapestryOutcome = get_or(storage, "tapestryOutcome", 0)
        famineSeverity = get_or(storage, "famineSeverity", 10)
        hungryOutcome = get_or(storage, "hungryOutcome", 0)
        guildStanding = get_or(storage, "guildStanding", 0)
        guildOutcome = get_or(storage, "guildOutcome", 0)
        plagueCureProgress = get_or(storage, "plagueProgress", 0)
        plagueFundingPath = get_or(storage, "plaguePath", 0)
        plagueChurchTook = get_or(storage, "arc_plagueChurchTook", 0) != 0
        plagueChurchShare = get_or(storage, "arc_plagueChurchShare", 0) != 0
        plagueOdoAsked = get_or(storage, "arc_plagueOdoAsked", 0) != 0
        plagueOdoUsed = get_or(storage, "arc_plagueOdoUsed", 0) != 0
        plagueOdoWide = get_or(storage, "arc_plagueOdoWide", 0) != 0
        plagueAftermathShown = get_or(storage, "arc_plagueAftermathShown", 0)
        householdWatchedGromm = get_or(storage, "arc_householdWatchedGromm", 0) != 0
        householdPurgedGuards = get_or(storage, "arc_householdPurgedGuards", 0) != 0
        householdCutClerks = get_or(storage, "arc_householdCutClerks", 0) != 0
        householdShelteredConfessor = get_or(storage, "arc_householdShelteredConfessor", 0) != 0
        householdChurchDeal = get_or(storage, "arc_householdChurchDeal", 0) != 0
        householdSelenaBribe = get_or(storage, "arc_householdSelenaBribe", 0) != 0
        householdVeteranPurge = get_or(storage, "arc_householdVeteranPurge", 0) != 0
        householdSelectiveGuards = get_or(storage, "arc_householdSelectiveGuards", 0) != 0
        tapestryArcPhase = get_or(storage, "arc_tapestryArcPhase", 0)
        purseStance = get_or(storage, "arc_purseStance", 0)
        purseOutcome = get_or(storage, "arc_purseOutcome", 0)
        purseArcPhase = get_or(storage, "arc_purseArcPhase", 0)
        hungryArcPhase = get_or(storage, "arc_hungryArcPhase", 0)
        hungryCrownPolicy = get_or(storage, "arc_hungryCrownPolicy", -1)
        hungryChurchSoup = get_or(storage, "arc_hungryChurchSoup", 0) != 0
        hungryFaraCartel = get_or(storage, "arc_hungryFaraCartel", 0) != 0
        hungryYarekRiots = get_or(storage, "arc_hungryYarekRiots", 0) != 0
        hungryGrommFeast = get_or(storage, "arc_hungryGrommFeast", 0) != 0
        guildArcPhase = get_or(storage, "arc_guildArcPhase", 0)
        guildCrownStance = get_or(storage, "arc_guildCrownStance", -1)
        guildFaraEmbargo = get_or(storage, "arc_guildFaraEmbargo", 0) != 0
        guildSaltLoan = get_or(storage, "arc_guildSaltLoan", 0) != 0
        guildNeriusCounterfeit = get_or(storage, "arc_guildNeriusCounterfeit", 0) != 0
        guildJointUltimatum = get_or(storage, "arc_guildJointUltimatum", 0) != 0
        churchStance = get_or(storage, "arc_churchStance", 0)
        churchOutcome = get_or(storage, "arc_churchOutcome", 0)
        churchArcPhase = get_or(storage, "arc_churchArcPhase", 0)
        churchArcStance = get_or(storage, "arc_churchArcStance", -1)
        churchInterdictDeclared = get_or(storage, "arc_churchInterdictDeclared", 0) != 0
        forfeitPressure = get_or(storage, "arc_forfeitPressure", 0)
        northernWarStage = get_or(storage, "arc_northernWarStage", 0)
        northernBorderChoice = get_or(storage, "arc_northernBorderChoice", -1)
        northernFaithChoice = get_or(storage, "arc_northernFaithChoice", -1)
        northernKnoxChoice = get_or(storage, "arc_northernKnoxChoice", -1)
        northernAllianceChoice = get_or(storage, "arc_northernAllianceChoice", -1)
        northernTributePaid = get_or(storage, "arc_northernTributePaid", 0) != 0
        northernAllianceSigned = get_or(storage, "arc_northernAllianceSigned", 0) != 0
        northernWarDeclared = get_or(storage, "arc_northernWarDeclared", 0) != 0
        northernRefugeesAccepted = get_or(storage, "arc_northernRefugeesAccepted", 0) != 0
        northernRefugeesTurnedBack = get_or(storage, "arc_northernRefugeesTurnedBack", 0) != 0
        tapestryLissaChoice = get_or(storage, "arc_tapestryLissaChoice", -1)
        tapestryTilChoice = get_or(storage, "arc_tapestryTilChoice", -1)
        tapestryGrommChoice = get_or(storage, "arc_tapestryGrommChoice", -1)
        tapestryRaenaChoice = get_or(storage, "arc_tapestryRaenaChoice", -1)
        tapestryChamberChoice = get_or(storage, "arc_tapestryChamberChoice", -1)
        tapestryKnoxChoice = get_or(storage, "arc_tapestryKnoxChoice", -1)
        tapestryChamberUsed = get_or(storage, "arc_tapestryChamberUsed", 0) != 0
        tapestryLissaCoupNight = get_or(storage, "arc_tapestryLissaCoupNight", 0) != 0
        tapestryTilMockCrown = get_or(storage, "arc_tapestryTilMockCrown", 0) != 0
        tapestryRaenaDoor = get_or(storage, "arc_tapestryRaenaDoor", 0) != 0
        tapestryKnoxServants = get_or(storage, "arc_tapestryKnoxServants", 0) != 0
        tapestryCoupNarrow = get_or(storage, "arc_tapestryCoupNarrow", 0) != 0
        tapestryCrownStance = get_or(storage, "arc_tapestryCrownStance", 0)
        emptyPurseDay11Choice = get_or(storage, "arc_emptyPurseDay11Choice", -1)
        emptyPurseBorvinChoice = get_or(storage, "arc_emptyPurseBorvinChoice", -1)
        emptyPurseFinnChoice = get_or(storage, "arc_emptyPurseFinnChoice", -1)
        emptyPurseSaltLoan = get_or(storage, "arc_emptyPurseSaltLoan", 0) != 0
        emptyPurseFinnAmnesty = get_or(storage, "arc_emptyPurseFinnAmnesty", 0) != 0
        emptyPurseKaraCrown = get_or(storage, "arc_emptyPurseKaraCrown", 0) != 0
        emptyPurseOttoSworn = get_or(storage, "arc_emptyPurseOttoSworn", 0) != 0
        emptyPurseCrisis = get_or(storage, "arc_emptyPurseCrisis", 0) != 0
        armyPayTrust = get_or(storage, "arc_armyPayTrust", 0)
        northernAshfordLinked = get_or(storage, "arc_northernAshfordLinked", 0) != 0
        housesOutcome = get_or(storage, "arc_housesOutcome", 0)
        housesArcPhase = get_or(storage, "arc_housesArcPhase", 0)
        housesDeadCount = get_or(storage, "arc_housesDeadCount", 0)
        housesAliveAshford = get_or(storage, "arc_housesAliveAshford", 1) != 0
        housesAliveKaspar = get_or(storage, "arc_housesAliveKaspar", 1) != 0
        housesAliveDell = get_or(storage, "arc_housesAliveDell", 1) != 0
        housesAliveCrow = get_or(storage, "arc_housesAliveCrow", 1) != 0
        housesAliveRaymond = get_or(storage, "arc_housesAliveRaymond", 1) != 0
        housesAliveGoose = get_or(storage, "arc_housesAliveGoose", 1) != 0
        scaffoldOutcome = get_or(storage, "arc_scaffoldOutcome", 0)
        scaffoldArcPhase = get_or(storage, "arc_scaffoldArcPhase", 0)
        scaffoldMercy = get_or(storage, "arc_scaffoldMercy", 0)
        scaffoldCrownStance = get_or(storage, "arc_scaffoldCrownStance", -1)
        scaffoldRiotHangings = get_or(storage, "arc_scaffoldRiotHangings", 0) != 0
        scaffoldMassAmnesty = get_or(storage, "arc_scaffoldMassAmnesty", 0) != 0
        scaffoldTalenBribe = get_or(storage, "arc_scaffoldTalenBribe", 0) != 0
        starChamberOutcome = get_or(storage, "arc_starChamberOutcome", 0)
        starChamberArcPhase = get_or(storage, "arc_starChamberArcPhase", 0)
        starCredibility = get_or(storage, "arc_starCredibility", 0)
        starSilenced = get_or(storage, "arc_starSilenced", 0) != 0
        starCrownStance = get_or(storage, "arc_starCrownStance", -1)
        prophetFavor = get_or(storage, "arc_prophetFavor", 0)
        prophetOutcome = get_or(storage, "arc_prophetOutcome", 0)
        prophetArcPhase = get_or(storage, "arc_prophetArcPhase", 0)
        prophetSilenced = get_or(storage, "arc_prophetSilenced", 0) != 0
        prophetFoxCult = get_or(storage, "arc_prophetFoxCult", 0) != 0
        courtTrust = get_or(storage, "arc_courtTrust", 0)
        knivesArcPhase = get_or(storage, "arc_knivesArcPhase", 0)
        knivesOutcome = get_or(storage, "arc_knivesOutcome", 0)
        knivesCrownStance = get_or(storage, "arc_knivesCrownStance", -1)
        knivesKnoxOffer = get_or(storage, "arc_knivesKnoxOffer", 0) != 0
        knivesTalenTriple = get_or(storage, "arc_knivesTalenTriple", 0) != 0
        knivesVarnPurge = get_or(storage, "arc_knivesVarnPurge", 0) != 0
        heirCredibility = get_or(storage, "arc_heirCredibility", 0)
        nephewOutcome = get_or(storage, "arc_nephewOutcome", 0)
        nephewArcPhase = get_or(storage, "arc_nephewArcPhase", 0)
        heirCrownStance = get_or(storage, "arc_heirCrownStance", -1)
        heirNephewAlive = get_or(storage, "arc_heirNephewAlive", 1) != 0
        heirIngvarBid = get_or(storage, "arc_heirIngvarBid", 0) != 0
        plagueOutcome = get_or(storage, "arc_plagueOutcome", 0)
        plagueArcPhase = get_or(storage, "arc_plagueArcPhase", 0)
        peopleUnlockTone = get_or(storage, "arc_peopleUnlockTone", 0)
        guildCompactSigned = get_or(storage, "arc_guildCompactSigned", 0) != 0
        housesAshfordLeads = get_or(storage, "arc_housesAshfordLeads", 0) != 0
        housesRaymondRising = get_or(storage, "arc_housesRaymondRising", 0) != 0
        housesDellCrowDeal = get_or(storage, "arc_housesDellCrowDeal", 0) != 0
        housesGooseFavored = get_or(storage, "arc_housesGooseFavored", 0) != 0
        heirAshfordCage = get_or(storage, "arc_heirAshfordCage", 0) != 0
        heirRecognized = get_or(storage, "arc_heirRecognized", 0) != 0

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
        } elif (usingArcEncounter || usingStatUnlockEncounter) {
            characterTexture = courtBodyTextures[currentCourtCharacterIdx]
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

require engine.core
require constants
require dialogue_types
require game_state
require arc_state
require arc_schedule
require arc_encounters_en
require arc_encounters_ru
require arc_effects
require arc_prompts
require stat_unlock_intro
require localization public


module arc_engine public


def public get_arc_encounter(arcId : int; beatIdx : int) : Encounter {
    if (is_russian()) {
        return get_arc_encounter_ru(arcId, beatIdx)
    }
    return get_arc_encounter_en(arcId, beatIdx)
}


def private get_arc_encounter_en(arcId : int; beatIdx : int) : Encounter {
    if (arcId == ARC_HOUSEHOLD && beatIdx >= 0 && beatIdx < ARC_HOUSEHOLD_BEAT_COUNT) {
        return arc0BeatsEn[beatIdx]
    }
    if (arcId == ARC_TAPESTRY && beatIdx >= 0 && beatIdx < ARC_TAPESTRY_BEAT_COUNT) {
        return arc1BeatsEn[beatIdx]
    }
    if (arcId == ARC_EMPTY_PURSE && beatIdx >= 0 && beatIdx < ARC_EMPTY_PURSE_BEAT_COUNT) {
        return arc2BeatsEn[beatIdx]
    }
    if (arcId == ARC_HUNGRY_SEASON && beatIdx >= 0 && beatIdx < ARC_HUNGRY_SEASON_BEAT_COUNT) {
        return arc3BeatsEn[beatIdx]
    }
    if (arcId == ARC_GUILD_COMPACT && beatIdx >= 0 && beatIdx < ARC_GUILD_COMPACT_BEAT_COUNT) {
        return arc4BeatsEn[beatIdx]
    }
    if (arcId == ARC_CHURCH_CROWN && beatIdx >= 0 && beatIdx < ARC_CHURCH_CROWN_BEAT_COUNT) {
        return arc5BeatsEn[beatIdx]
    }
    if (arcId == ARC_NORTHERN_PRICE && beatIdx >= 0 && beatIdx < ARC_NORTHERN_PRICE_BEAT_COUNT) {
        return arc6BeatsEn[beatIdx]
    }
    if (arcId == ARC_GREAT_HOUSES && beatIdx >= 0 && beatIdx < ARC_GREAT_HOUSES_BEAT_COUNT) {
        return arc7BeatsEn[beatIdx]
    }
    if (arcId == ARC_SCAFFOLD_LEDGER && beatIdx >= 0 && beatIdx < ARC_SCAFFOLD_LEDGER_BEAT_COUNT) {
        return arc8BeatsEn[beatIdx]
    }
    if (arcId == ARC_STAR_CHAMBER && beatIdx >= 0 && beatIdx < ARC_STAR_CHAMBER_BEAT_COUNT) {
        return arc9BeatsEn[beatIdx]
    }
    if (arcId == ARC_PROPHET_WINTER && beatIdx >= 0 && beatIdx < ARC_PROPHET_WINTER_BEAT_COUNT) {
        return arc10BeatsEn[beatIdx]
    }
    if (arcId == ARC_COURT_KNIVES && beatIdx >= 0 && beatIdx < ARC_COURT_KNIVES_BEAT_COUNT) {
        return arc11BeatsEn[beatIdx]
    }
    if (arcId == ARC_NEPHEW_FOG && beatIdx >= 0 && beatIdx < ARC_NEPHEW_FOG_BEAT_COUNT) {
        return arc12BeatsEn[beatIdx]
    }
    if (arcId == ARC_PLAGUE_CURE && beatIdx >= 0 && beatIdx < ARC_PLAGUE_CURE_BEAT_COUNT) {
        return arc13BeatsEn[beatIdx]
    }
    return arc0BeatsEn[0]
}


def private get_arc_encounter_ru(arcId : int; beatIdx : int) : Encounter {
    if (arcId == ARC_HOUSEHOLD && beatIdx >= 0 && beatIdx < ARC_HOUSEHOLD_BEAT_COUNT) {
        return arc0BeatsRu[beatIdx]
    }
    if (arcId == ARC_TAPESTRY && beatIdx >= 0 && beatIdx < ARC_TAPESTRY_BEAT_COUNT) {
        return arc1BeatsRu[beatIdx]
    }
    if (arcId == ARC_EMPTY_PURSE && beatIdx >= 0 && beatIdx < ARC_EMPTY_PURSE_BEAT_COUNT) {
        return arc2BeatsRu[beatIdx]
    }
    if (arcId == ARC_HUNGRY_SEASON && beatIdx >= 0 && beatIdx < ARC_HUNGRY_SEASON_BEAT_COUNT) {
        return arc3BeatsRu[beatIdx]
    }
    if (arcId == ARC_GUILD_COMPACT && beatIdx >= 0 && beatIdx < ARC_GUILD_COMPACT_BEAT_COUNT) {
        return arc4BeatsRu[beatIdx]
    }
    if (arcId == ARC_CHURCH_CROWN && beatIdx >= 0 && beatIdx < ARC_CHURCH_CROWN_BEAT_COUNT) {
        return arc5BeatsRu[beatIdx]
    }
    if (arcId == ARC_NORTHERN_PRICE && beatIdx >= 0 && beatIdx < ARC_NORTHERN_PRICE_BEAT_COUNT) {
        return arc6BeatsRu[beatIdx]
    }
    if (arcId == ARC_GREAT_HOUSES && beatIdx >= 0 && beatIdx < ARC_GREAT_HOUSES_BEAT_COUNT) {
        return arc7BeatsRu[beatIdx]
    }
    if (arcId == ARC_SCAFFOLD_LEDGER && beatIdx >= 0 && beatIdx < ARC_SCAFFOLD_LEDGER_BEAT_COUNT) {
        return arc8BeatsRu[beatIdx]
    }
    if (arcId == ARC_STAR_CHAMBER && beatIdx >= 0 && beatIdx < ARC_STAR_CHAMBER_BEAT_COUNT) {
        return arc9BeatsRu[beatIdx]
    }
    if (arcId == ARC_PROPHET_WINTER && beatIdx >= 0 && beatIdx < ARC_PROPHET_WINTER_BEAT_COUNT) {
        return arc10BeatsRu[beatIdx]
    }
    if (arcId == ARC_COURT_KNIVES && beatIdx >= 0 && beatIdx < ARC_COURT_KNIVES_BEAT_COUNT) {
        return arc11BeatsRu[beatIdx]
    }
    if (arcId == ARC_NEPHEW_FOG && beatIdx >= 0 && beatIdx < ARC_NEPHEW_FOG_BEAT_COUNT) {
        return arc12BeatsRu[beatIdx]
    }
    if (arcId == ARC_PLAGUE_CURE && beatIdx >= 0 && beatIdx < ARC_PLAGUE_CURE_BEAT_COUNT) {
        return arc13BeatsRu[beatIdx]
    }
    return arc0BeatsRu[0]
}


def public get_arc_character_idx(arcId : int; beatIdx : int) : int {
    return get_arc_encounter(arcId, beatIdx).characterIdx
}


def public resolve_arc_dialogue_node(arcId : int; beatIdx : int; nodeIdx : int) : DialogueNode {
    let finaleNode = try_build_arc_finale_node(arcId, beatIdx, nodeIdx)
    if (finaleNode.choiceCount > 0) {
        return finaleNode
    }
    let base = get_arc_encounter(arcId, beatIdx).nodes[nodeIdx]
    let dynamicPrompt = resolve_arc_dynamic_prompt(arcId, beatIdx, nodeIdx)
    return try_patch_arc_prompt(base, dynamicPrompt)
}


def public clear_arc_encounter_mode() {
    usingArcEncounter = false
    activeArcId = ARC_NONE
    activeArcBeatIdx = -1
}


def public begin_arc_encounter(arcId : int; beatIdx : int) {
    usingArcEncounter = true
    activeArcId = arcId
    activeArcBeatIdx = beatIdx
    currentEncounterIdx = -1
    compute_arc_outcome_if_finale(arcId, beatIdx)
    let enc = get_arc_encounter(arcId, beatIdx)
    currentNodeIdx = enc.startNodeIdx
    pendingNextNodeIdx = NO_NEXT_NODE
    currentCourtCharacterIdx = enc.characterIdx
}


def public begin_arc_encounter_for_day(day : int) {
    if (day == STAT_UNLOCK_CONFLICT_DAY_CHURCH) {
        begin_arc_encounter(ARC_CHURCH_CROWN, 0)
    } elif (day == STAT_UNLOCK_CONFLICT_DAY_PEOPLE) {
        begin_stat_unlock_people_encounter()
    } elif (day == STAT_UNLOCK_CONFLICT_DAY_LOYALTY) {
        begin_stat_unlock_loyalty_encounter()
    } elif (day == STAT_UNLOCK_CONFLICT_DAY_SUCCESSION) {
        begin_stat_unlock_succession_encounter()
    }
}


def public apply_arc_choice_effects(arcId : int; beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects_impl(arcId, beatIdx, choiceIdx)
}

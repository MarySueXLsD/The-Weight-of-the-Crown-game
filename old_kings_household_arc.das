require engine.core
require constants
require dialogue_types
require arc_engine
require arc_effects


module old_kings_household_arc public


def public get_household_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_HOUSEHOLD, beatIdx)
}


def public resolve_household_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_HOUSEHOLD, beatIdx, nodeIdx)
}


def public apply_household_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_HOUSEHOLD, beatIdx, choiceIdx)
}


def public compute_household_outcome() {
    compute_arc_outcome_if_finale(ARC_HOUSEHOLD, 7)
}

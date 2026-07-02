require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module empty_purse_arc public


def public get_empty_purse_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_EMPTY_PURSE, beatIdx)
}


def public resolve_empty_purse_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_EMPTY_PURSE, beatIdx, nodeIdx)
}


def public apply_empty_purse_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_EMPTY_PURSE, beatIdx, choiceIdx)
}


def public compute_empty_purse_outcome() {
    compute_arc_outcome_if_finale(ARC_EMPTY_PURSE, 7)
}

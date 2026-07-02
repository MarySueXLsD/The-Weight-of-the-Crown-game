require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module below_tapestry_arc public


def public get_tapestry_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_TAPESTRY, beatIdx)
}


def public resolve_tapestry_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_TAPESTRY, beatIdx, nodeIdx)
}


def public apply_tapestry_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_TAPESTRY, beatIdx, choiceIdx)
}


def public compute_tapestry_outcome() {
    compute_arc_outcome_if_finale(ARC_TAPESTRY, 7)
}

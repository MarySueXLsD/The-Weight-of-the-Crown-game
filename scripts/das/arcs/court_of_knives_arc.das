require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module court_of_knives_arc public


def public get_court_of_knives_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_COURT_KNIVES, beatIdx)
}


def public resolve_court_of_knives_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_COURT_KNIVES, beatIdx, nodeIdx)
}


def public apply_court_of_knives_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_COURT_KNIVES, beatIdx, choiceIdx)
}


def public compute_court_of_knives_outcome() {
    compute_arc_outcome_if_finale(ARC_COURT_KNIVES, 9)
}

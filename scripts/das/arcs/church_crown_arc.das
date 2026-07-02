require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module church_crown_arc public


def public get_church_crown_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_CHURCH_CROWN, beatIdx)
}


def public resolve_church_crown_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_CHURCH_CROWN, beatIdx, nodeIdx)
}


def public apply_church_crown_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_CHURCH_CROWN, beatIdx, choiceIdx)
}


def public compute_church_crown_outcome() {
    compute_arc_outcome_if_finale(ARC_CHURCH_CROWN, 9)
}

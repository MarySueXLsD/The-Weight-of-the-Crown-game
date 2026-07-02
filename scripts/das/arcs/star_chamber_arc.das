require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module star_chamber_arc public


def public get_star_chamber_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_STAR_CHAMBER, beatIdx)
}


def public resolve_star_chamber_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_STAR_CHAMBER, beatIdx, nodeIdx)
}


def public apply_star_chamber_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_STAR_CHAMBER, beatIdx, choiceIdx)
}


def public compute_star_chamber_outcome() {
    compute_arc_outcome_if_finale(ARC_STAR_CHAMBER, 6)
}

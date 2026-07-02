require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module prophets_winter_arc public


def public get_prophets_winter_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_PROPHET_WINTER, beatIdx)
}


def public resolve_prophets_winter_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_PROPHET_WINTER, beatIdx, nodeIdx)
}


def public apply_prophets_winter_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_PROPHET_WINTER, beatIdx, choiceIdx)
}


def public compute_prophets_winter_outcome() {
    compute_arc_outcome_if_finale(ARC_PROPHET_WINTER, 5)
}

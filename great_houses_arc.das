require engine.core
require constants
require dialogue_types
require arc_engine
require arc_effects

module great_houses_arc public


def public get_great_houses_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_GREAT_HOUSES, beatIdx)
}


def public resolve_great_houses_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_GREAT_HOUSES, beatIdx, nodeIdx)
}


def public apply_great_houses_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_GREAT_HOUSES, beatIdx, choiceIdx)
}


def public compute_great_houses_outcome() {
    compute_arc_outcome_if_finale(ARC_GREAT_HOUSES, 13)
}

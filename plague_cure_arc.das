require engine.core
require constants
require dialogue_types
require arc_engine
require arc_effects

module plague_cure_arc public


def public get_plague_cure_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_PLAGUE_CURE, beatIdx)
}


def public resolve_plague_cure_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_PLAGUE_CURE, beatIdx, nodeIdx)
}


def public apply_plague_cure_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_PLAGUE_CURE, beatIdx, choiceIdx)
}


def public compute_plague_cure_outcome() {
    compute_arc_outcome_if_finale(ARC_PLAGUE_CURE, 28)
}

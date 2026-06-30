require engine.core
require constants
require dialogue_types
require arc_engine
require arc_effects

module northern_price_arc public


def public get_northern_price_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_NORTHERN_PRICE, beatIdx)
}


def public resolve_northern_price_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_NORTHERN_PRICE, beatIdx, nodeIdx)
}


def public apply_northern_price_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_NORTHERN_PRICE, beatIdx, choiceIdx)
}


def public compute_northern_price_outcome() {
    compute_arc_outcome_if_finale(ARC_NORTHERN_PRICE, 15)
}

require engine.core
require constants
require dialogue_types
require arc_engine
require arc_effects

module nephew_fog_arc public


def public get_nephew_fog_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_NEPHEW_FOG, beatIdx)
}


def public resolve_nephew_fog_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_NEPHEW_FOG, beatIdx, nodeIdx)
}


def public apply_nephew_fog_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_NEPHEW_FOG, beatIdx, choiceIdx)
}


def public compute_nephew_fog_outcome() {
    compute_arc_outcome_if_finale(ARC_NEPHEW_FOG, 9)
}

require engine.core
require constants
require dialogue_types
require arc_engine
require arc_effects

module hungry_season_arc public


def public get_hungry_season_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_HUNGRY_SEASON, beatIdx)
}


def public resolve_hungry_season_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_HUNGRY_SEASON, beatIdx, nodeIdx)
}


def public apply_hungry_season_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_HUNGRY_SEASON, beatIdx, choiceIdx)
}


def public compute_hungry_season_outcome() {
    compute_arc_outcome_if_finale(ARC_HUNGRY_SEASON, 11)
}

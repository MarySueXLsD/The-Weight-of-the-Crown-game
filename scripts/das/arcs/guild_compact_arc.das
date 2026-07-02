require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module guild_compact_arc public


def public get_guild_compact_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_GUILD_COMPACT, beatIdx)
}


def public resolve_guild_compact_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_GUILD_COMPACT, beatIdx, nodeIdx)
}


def public apply_guild_compact_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_GUILD_COMPACT, beatIdx, choiceIdx)
}


def public compute_guild_compact_outcome() {
    compute_arc_outcome_if_finale(ARC_GUILD_COMPACT, 11)
}

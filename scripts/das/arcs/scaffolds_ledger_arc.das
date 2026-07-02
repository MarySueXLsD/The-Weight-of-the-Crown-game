require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_effects
module scaffolds_ledger_arc public


def public get_scaffolds_ledger_beat_encounter(beatIdx : int) : Encounter {
    return get_arc_encounter(ARC_SCAFFOLD_LEDGER, beatIdx)
}


def public resolve_scaffolds_ledger_node(beatIdx : int; nodeIdx : int) : DialogueNode {
    return resolve_arc_dialogue_node(ARC_SCAFFOLD_LEDGER, beatIdx, nodeIdx)
}


def public apply_scaffolds_ledger_choice(beatIdx : int; choiceIdx : int) {
    apply_arc_choice_effects(ARC_SCAFFOLD_LEDGER, beatIdx, choiceIdx)
}


def public compute_scaffolds_ledger_outcome() {
    compute_arc_outcome_if_finale(ARC_SCAFFOLD_LEDGER, 8)
}

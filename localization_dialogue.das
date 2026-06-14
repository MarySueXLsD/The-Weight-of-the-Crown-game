require engine.core
require constants
require dialogue_types
require question_pools public


module localization_dialogue public


def public get_encounter_ru(index : int) : Encounter {
    return get_encounter(index)
}

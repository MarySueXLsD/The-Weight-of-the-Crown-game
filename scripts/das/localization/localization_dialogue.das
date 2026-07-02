require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/gameplay/question_pools public
module localization_dialogue public


def public get_encounter_ru(index : int) : Encounter {
    return get_encounter(index)
}

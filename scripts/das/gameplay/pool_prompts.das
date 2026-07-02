require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_state
require scripts/das/core/game_state
require scripts/das/localization/localization public
module pool_prompts public


let POOL_EDRIC_WATCH_IDX = 13


def public encounter_passes_day_gate(encounterIdx : int) : bool {
    if (encounterIdx == POOL_EDRIC_WATCH_IDX) {
        return currentDay >= 8 || householdArcPhase >= 1
    }
    return true
}


def build_edric_watch_prompt_en() : string {
    return "Your Majesty, after your decision on Edwin's household, the court wants specifics. Six servants still walk these halls — whom do you watch first this week?"
}


def build_edric_watch_prompt_ru() : string {
    return "Ваше Величество, после вашего решения о свите Эдвина двор просит конкретики. Шестеро слуг до сих пор ходят по залам — кого поставить под надзор в первую неделю?"
}


def build_edric_watch_choice_gromm_en() : string {
    if (householdArcPhase >= 1 || householdKeptGromm) {
        return "Cook Gromm and the kitchens."
    }
    return "The cook and the kitchens."
}


def build_edric_watch_choice_gromm_ru() : string {
    if (householdArcPhase >= 1 || householdKeptGromm) {
        return "Повар Громм и кухни."
    }
    return "Повар и кухни."
}


def build_edric_watch_choice_osric_en() : string {
    if (householdArcPhase >= 2) {
        return "Scribe Osric and the archive."
    }
    return "The chief scribe and the archive."
}


def build_edric_watch_choice_osric_ru() : string {
    if (householdArcPhase >= 2) {
        return "Писец Осрик и архив."
    }
    return "Главный писец и архив."
}


def public build_edric_watch_node(base : DialogueNode) : DialogueNode {
    var prompt = build_edric_watch_prompt_en()
    var c0 = build_edric_watch_choice_gromm_en()
    var c1 = build_edric_watch_choice_osric_en()
    if (is_russian()) {
        prompt = build_edric_watch_prompt_ru()
        c0 = build_edric_watch_choice_gromm_ru()
        c1 = build_edric_watch_choice_osric_ru()
    }
    return DialogueNode(
        prompt = prompt,
        choiceCount = clamp_choice_count(base.choiceCount),
        choices = fixed_array(
            DialogueChoice(
                choiceText = c0,
                response = base.choices[0].response,
                statDeltas = base.choices[0].statDeltas,
                nextNodeIdx = base.choices[0].nextNodeIdx,
                replyId = base.choices[0].replyId
            ),
            DialogueChoice(
                choiceText = c1,
                response = base.choices[1].response,
                statDeltas = base.choices[1].statDeltas,
                nextNodeIdx = base.choices[1].nextNodeIdx,
                replyId = base.choices[1].replyId
            ),
            DialogueChoice(
                choiceText = base.choices[2].choiceText,
                response = base.choices[2].response,
                statDeltas = base.choices[2].statDeltas,
                nextNodeIdx = base.choices[2].nextNodeIdx,
                replyId = base.choices[2].replyId
            ),
            DialogueChoice(
                choiceText = base.choices[3].choiceText,
                response = base.choices[3].response,
                statDeltas = base.choices[3].statDeltas,
                nextNodeIdx = base.choices[3].nextNodeIdx,
                replyId = base.choices[3].replyId
            ),
            DialogueChoice()
        ),
        questionId = base.questionId
    )
}


def public resolve_pool_dialogue_node(encounterIdx : int; nodeIdx : int; base : DialogueNode) : DialogueNode {
    if (encounterIdx == POOL_EDRIC_WATCH_IDX && nodeIdx == 0) {
        return build_edric_watch_node(base)
    }
    return base
}

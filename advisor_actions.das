require engine.core

require constants

require game_state

require dialogue_types

require defeat

require stat_synergies

require localization public





module advisor_actions public





[safe_when_uninitialized]

struct AdvisorAction {

    titleEn : string

    titleRu : string

    descEn : string

    descRu : string

    imagePath : string

    statDeltas : int[STAT_COUNT]

    cooldownDays : int

    minSourceStatIdx : int = -1

    minSourceValue : int = ADVISOR_MIN_SPEND_STAT

    desperateOnly : bool = false

}





let advisorActions : AdvisorAction[MAX_ADVISOR_ACTIONS] <- fixed_array(

    AdvisorAction(

        titleEn = "Buy more army",

        titleRu = "Купить армию",

        descEn = "Recruit regiments and stock the armories.",

        descRu = "Набрать полки и снарядить арсеналы.",

        imagePath = "static/Advisor_actions/buy_army.png",

        statDeltas = fixed_array(0, 0, 10, -20, 0, 0, 0, 0, 0),

        cooldownDays = 3,

        minSourceStatIdx = STAT_GOLD_IDX

    ),

    AdvisorAction(

        titleEn = "Buy more food",

        titleRu = "Купить продовольствие",

        descEn = "Fill the granaries before hunger turns to riot.",

        descRu = "Наполнить амбары, пока голод не стал бунтом.",

        imagePath = "static/Advisor_actions/buy_food.png",

        statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 12, 0),

        cooldownDays = 3,

        minSourceStatIdx = STAT_GOLD_IDX

    ),

    AdvisorAction(

        titleEn = "Buy medicine",

        titleRu = "Купить лекарства",

        descEn = "Pay healers to keep plague from the gates.",

        descRu = "Заплатить лекарям, чтобы чума не вошла в ворота.",

        imagePath = "static/Advisor_actions/buy_medicine.png",

        statDeltas = fixed_array(0, 0, 0, -20, 10, 0, 0, 0, 0),

        cooldownDays = 3,

        minSourceStatIdx = STAT_GOLD_IDX

    ),

    AdvisorAction(

        titleEn = "Press Enter",

        titleRu = "Нажать Enter",

        descEn = "Paper over the crisis and insist the realm is fine.",

        descRu = "Замять кризис и убедить всех, что в королевстве порядок.",

        imagePath = "static/Advisor_actions/use_posd.png",

        statDeltas = fixed_array(-12, -5, 0, 0, 0, 8, 0, 0, 0),

        cooldownDays = 4

    ),

    AdvisorAction(

        titleEn = "Hard restart",

        titleRu = "Жёсткая перезагрузка",

        descEn = "Purge dissent and rebuild the court from scratch.",

        descRu = "Вычистить недовольных и собрать двор заново.",

        imagePath = "static/Advisor_actions/use_rapam.png",

        statDeltas = fixed_array(-10, 0, 15, 0, 0, -25, 0, 0, 0),

        cooldownDays = 5,

        desperateOnly = true

    ),

    AdvisorAction(

        titleEn = "Press any key",

        titleRu = "Нажмите любую клавишу",

        descEn = "Trudge onward and pray nothing else breaks.",

        descRu = "Идти дальше и молиться, чтобы ничего больше не сломалось.",

        imagePath = "static/Advisor_actions/use_leger.png",

        statDeltas = fixed_array(0, 0, 0, 10, -15, 0, 0, -10, 0),

        cooldownDays = 4

    )

)





def public advisor_action_count() : int {

    return MAX_ADVISOR_ACTIONS

}





def public get_advisor_action(actionIdx : int) : AdvisorAction {

    return advisorActions[actionIdx]

}





def public advisor_action_image_path(actionIdx : int) : string {

    return advisorActions[actionIdx].imagePath

}





def public advisor_action_title(actionIdx : int) : string {

    let action = advisorActions[actionIdx]

    return loc(action.titleEn, action.titleRu)

}





def public advisor_action_description(actionIdx : int) : string {

    let action = advisorActions[actionIdx]

    return loc(action.descEn, action.descRu)

}





def public has_desperate_stat() : bool {

    for (i in range(STAT_COUNT)) {

        if (kingdomStats[i] <= ADVISOR_DESPERATE_STAT_THRESHOLD) {

            return true

        }

    }

    return false

}





def public advisor_action_on_cooldown(actionIdx : int) : bool {

    return advisorActionCooldowns[actionIdx] > 0

}





def public advisor_action_meets_min_stat(actionIdx : int) : bool {

    let action = advisorActions[actionIdx]

    if (action.minSourceStatIdx < 0) {

        return true

    }

    return kingdomStats[action.minSourceStatIdx] >= action.minSourceValue

}





def public advisor_action_would_defeat(actionIdx : int) : bool {

    let deltas = copy_action_deltas_with_loyalty_tax(actionIdx)

    return find_defeating_stat_idx_from_deltas(deltas) >= 0

}





def public copy_action_deltas_with_loyalty_tax(actionIdx : int) : int[STAT_COUNT] {

    return copy_action_deltas_with_loyalty_tax_from(get_advisor_action(actionIdx).statDeltas)

}





def copy_action_deltas_with_loyalty_tax_from(base : int[STAT_COUNT]) : int[STAT_COUNT] {

    var deltas : int[STAT_COUNT]

    for (i in range(STAT_COUNT)) {

        deltas[i] = base[i]

    }

    if (kingdomStats[STAT_LOYALTY_IDX] < ADVISOR_LOYALTY_LOW_THRESHOLD) {

        deltas[STAT_LOYALTY_IDX] -= ADVISOR_LOYALTY_USE_PENALTY

    }

    apply_choice_penalty_multiplier(deltas)

    return deltas

}





def public is_advisor_action_available(actionIdx : int) : bool {

    if (actionIdx < 0 || actionIdx >= MAX_ADVISOR_ACTIONS) {

        return false

    }

    if (advisorActionUsedToday) {

        return false

    }

    if (advisorActionCooldowns[actionIdx] > 0) {

        return false

    }

    let action = advisorActions[actionIdx]

    if (action.desperateOnly && !has_desperate_stat()) {

        return false

    }

    if (!advisor_action_meets_min_stat(actionIdx)) {

        return false

    }

    if (advisor_action_would_defeat(actionIdx)) {

        return false

    }

    return true

}





def public advisor_action_disabled_reason(actionIdx : int) : string {

    if (actionIdx < 0 || actionIdx >= MAX_ADVISOR_ACTIONS) {

        return ""

    }

    if (advisorActionUsedToday) {

        return advisor_disabled_used_today()

    }

    if (advisorActionCooldowns[actionIdx] > 0) {

        return advisor_disabled_cooldown(advisorActionCooldowns[actionIdx])

    }

    let action = advisorActions[actionIdx]

    if (action.desperateOnly && !has_desperate_stat()) {

        return advisor_disabled_not_desperate()

    }

    if (!advisor_action_meets_min_stat(actionIdx)) {

        return advisor_disabled_low_stat(stat_display_name(action.minSourceStatIdx), action.minSourceValue)

    }

    if (advisor_action_would_defeat(actionIdx)) {

        return advisor_disabled_would_defeat()

    }

    return ""

}





def public tick_advisor_cooldowns() {

    for (i in range(MAX_ADVISOR_ACTIONS)) {

        if (advisorActionCooldowns[i] > 0) {

            advisorActionCooldowns[i]--

        }

    }

}





def public reset_advisor_action_state() {

    advisorActionUsedToday = false

    for (i in range(MAX_ADVISOR_ACTIONS)) {

        advisorActionCooldowns[i] = 0

    }

    pendingAdvisorActionIdx = -1

}





def public begin_advisor_action_cooldown(actionIdx : int) {

    let action = advisorActions[actionIdx]

    advisorActionCooldowns[actionIdx] = action.cooldownDays

    advisorActionUsedToday = true

}


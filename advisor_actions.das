require engine.core

require constants

require game_state

require dialogue_types

require defeat

require stat_synergies

require stat_unlocks

require localization public





module advisor_actions public





struct AdvisorAction {

    titleEn : string

    titleRu : string

    descEn : string

    descRu : string

    imagePath : string

    cooldownDays : int

    minSourceStatIdx : int = -1

    minSourceValue : int = ADVISOR_MIN_SPEND_STAT

    unlockStatIdx : int = -1

}

// Flat storage avoids struct array-field copy issues when building previews.
let advisorActionDeltas : int[MAX_ADVISOR_ACTIONS * STAT_COUNT] <- fixed_array(
    0, 0, 12, -22, 0, 0, 0, 0, 0,
    3, 0, 0, -18, 0, 0, 0, 14, 0,
    0, 0, 0, -18, 12, 0, 0, 0, 0,
    0, 0, -12, 20, 0, 0, 0, 0, 0,
    -6, 0, 0, 18, 0, 0, 0, -12, 0,
    -4, 14, 0, -20, 0, 0, 0, 0, 0,
    16, 0, 0, -22, 0, 0, 0, -6, 0,
    -6, 0, 0, -18, 0, 6, 14, 0, 0
)


def advisor_action_base_delta(actionIdx : int; statIdx : int) : int {
    return advisorActionDeltas[actionIdx * STAT_COUNT + statIdx]
}


let advisorActions : AdvisorAction[MAX_ADVISOR_ACTIONS] <- fixed_array(

    AdvisorAction(

        titleEn = "Muster the ranks",

        titleRu = "Собрать полки",

        descEn = "Call levies to the banner and drill them in the castle yards.",

        descRu = "Созвать ополчение под знамёна и обучить его во дворах замка.",

        imagePath = "static/Advisor_actions/buy_army.png",

        cooldownDays = 3,

        minSourceStatIdx = STAT_GOLD_IDX,

        unlockStatIdx = -1

    ),

    AdvisorAction(

        titleEn = "Fill the granaries",

        titleRu = "Наполнить амбары",

        descEn = "Buy grain and bread from merchants at the castle market.",

        descRu = "Закупить зерно и хлеб у купцов на замковом рынке.",

        imagePath = "static/Advisor_actions/buy_food.png",

        cooldownDays = 3,

        minSourceStatIdx = STAT_GOLD_IDX,

        unlockStatIdx = -1

    ),

    AdvisorAction(

        titleEn = "Stock the apothecary",

        titleRu = "Снабдить лазарет",

        descEn = "Commission herbs and remedies from the royal healers.",

        descRu = "Заказать травы и снадобья у королевских лекарей.",

        imagePath = "static/Advisor_actions/buy_medicine.png",

        cooldownDays = 3,

        minSourceStatIdx = STAT_GOLD_IDX,

        unlockStatIdx = -1

    ),

    AdvisorAction(

        titleEn = "Sell crown steel",

        titleRu = "Продать королевскую сталь",

        descEn = "Sell surplus blades from the armories to passing merchants.",

        descRu = "Продать лишние клинки из арсеналов проезжающим купцам.",

        imagePath = "static/Advisor_actions/sell_swords.png",

        cooldownDays = 4,

        minSourceStatIdx = STAT_ARMY_IDX,

        unlockStatIdx = -1

    ),

    AdvisorAction(

        titleEn = "Auction royal grain",

        titleRu = "Продать королевское зерно",

        descEn = "Let foreign buyers haul reserve grain from the crown stores.",

        descRu = "Позволить иноземным покупателям вывезти зерно из королевских запасов.",

        imagePath = "static/Advisor_actions/sell_grain.png",

        cooldownDays = 4,

        minSourceStatIdx = STAT_FOOD_IDX,

        unlockStatIdx = -1

    ),

    AdvisorAction(

        titleEn = "Grant a royal tithe",

        titleRu = "Пожертвовать в храм",

        descEn = "Send gold to restore churches and placate the bishops.",

        descRu = "Отправить золото на восстановление храмов и умиротворение епископов.",

        imagePath = "static/Advisor_actions/fund_clergy.png",

        cooldownDays = 4,

        minSourceStatIdx = STAT_GOLD_IDX,

        unlockStatIdx = STAT_CHURCH_IDX

    ),

    AdvisorAction(

        titleEn = "Declare a relief week",

        titleRu = "Объявить неделю помощи",

        descEn = "Cancel peasant debts and open the royal larders to the hungry.",

        descRu = "Списать крестьянские долги и открыть королевские закрома голодным.",

        imagePath = "static/Advisor_actions/grant_relief.png",

        cooldownDays = 4,

        minSourceStatIdx = STAT_GOLD_IDX,

        unlockStatIdx = STAT_PEOPLE_IDX

    ),

    AdvisorAction(

        titleEn = "Hold a crown banquet",

        titleRu = "Устроить королевский пир",

        descEn = "Feast the great houses and distribute honors they will remember.",

        descRu = "Устроить пир для великих домов и раздать почести, которые они запомнят.",

        imagePath = "static/Advisor_actions/host_nobility.png",

        cooldownDays = 5,

        minSourceStatIdx = STAT_GOLD_IDX,

        unlockStatIdx = STAT_RICH_LOVE_IDX

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
    return loc(advisorActions[actionIdx].titleEn, advisorActions[actionIdx].titleRu)
}


def public advisor_action_description(actionIdx : int) : string {
    return loc(advisorActions[actionIdx].descEn, advisorActions[actionIdx].descRu)
}





def public advisor_action_is_stat_locked(actionIdx : int) : bool {

    let action = advisorActions[actionIdx]

    if (action.unlockStatIdx < 0) {

        return false

    }

    return !is_stat_unlocked(action.unlockStatIdx)

}





def public advisor_action_preview_deltas(actionIdx : int) : int[STAT_COUNT] {

    return copy_action_deltas_with_loyalty_tax(actionIdx)

}





def public advisor_action_apply_deltas(actionIdx : int) : int[STAT_COUNT] {

    return mask_deltas_to_unlocked_stats(copy_action_deltas_with_loyalty_tax(actionIdx))

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

    let deltas = advisor_action_apply_deltas(actionIdx)

    return find_defeating_stat_idx_from_deltas(deltas) >= 0

}





def public copy_action_deltas_with_loyalty_tax(actionIdx : int) : int[STAT_COUNT] {

    var deltas : int[STAT_COUNT]

    for (i in range(STAT_COUNT)) {

        deltas[i] = advisor_action_base_delta(actionIdx, i)

    }

    if (is_stat_unlocked(STAT_LOYALTY_IDX) && kingdomStats[STAT_LOYALTY_IDX] < ADVISOR_LOYALTY_LOW_THRESHOLD) {

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

    if (advisor_action_is_stat_locked(actionIdx)) {

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

    if (advisor_action_is_stat_locked(actionIdx)) {

        let lockedStatIdx = advisorActions[actionIdx].unlockStatIdx

        return advisor_disabled_stat_locked(stat_display_name(lockedStatIdx))

    }

    let action = advisorActions[actionIdx]

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


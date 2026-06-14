require engine.core
require constants
require game_state
require localization public


module stat_synergies public


def public get_stat_tier(value : int) : int {
    if (value <= STAT_TIER_CRITICAL_MAX) {
        return STAT_TIER_CRITICAL
    }
    if (value <= STAT_TIER_LOW_MAX) {
        return STAT_TIER_LOW
    }
    if (value <= STAT_TIER_STABLE_MAX) {
        return STAT_TIER_STABLE
    }
    if (value <= STAT_TIER_STRONG_MAX) {
        return STAT_TIER_STRONG
    }
    return STAT_TIER_DOMINANT
}


def stat_touches(deltas : int[STAT_COUNT]; idx : int) : bool {
    return deltas[idx] != 0
}


def is_high_stat(idx : int) : bool {
    return kingdomStats[idx] >= STAT_TIER_STRONG_MIN
}


def is_low_stat(idx : int) : bool {
    return kingdomStats[idx] <= STAT_TIER_LOW_MAX
}


def is_critical_stat(idx : int) : bool {
    return kingdomStats[idx] <= STAT_TIER_CRITICAL_MAX
}


def clamp_synergy_mod(mod : int) : int {
    if (mod > 0) {
        return min(mod, SYNERGY_BONUS_MAX)
    }
    if (mod < 0) {
        return max(mod, -SYNERGY_PENALTY_MAX)
    }
    return 0
}


def apply_delta_mod(var deltas : int[STAT_COUNT]; idx : int; mod : int) {
    if (!stat_touches(deltas, idx)) {
        return
    }
    deltas[idx] += clamp_synergy_mod(mod)
}


def is_tax_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_GOLD_IDX] > 0 && deltas[STAT_PEOPLE_IDX] < 0
}


def is_army_pay_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_ARMY_IDX] > 0 && deltas[STAT_GOLD_IDX] < 0
}


def is_health_build_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_HEALTH_IDX] > 0
}


def is_treasury_spend_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_GOLD_IDX] < 0
}


def is_church_refuse_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_CHURCH_IDX] < 0
}


def is_succession_bless_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_CHURCH_IDX] > 0 && deltas[STAT_SUCCESSION_IDX] > 0
}


def is_health_prayer_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_HEALTH_IDX] > 0 && deltas[STAT_CHURCH_IDX] > 0
}


def is_nobility_gain_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_RICH_LOVE_IDX] > 0
}


def is_nobility_insult_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_RICH_LOVE_IDX] < 0 && deltas[STAT_GOLD_IDX] <= 0
}


def is_nobility_seize_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_RICH_LOVE_IDX] < 0 && deltas[STAT_GOLD_IDX] > 0
}


def is_loyalty_court_oath_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_LOYALTY_IDX] > 0 && stat_touches(deltas, STAT_LOYALTY_IDX)
}


def is_spy_or_dismiss_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_LOYALTY_IDX] > 0 && (deltas[STAT_RICH_LOVE_IDX] < 0 || deltas[STAT_PEOPLE_IDX] < 0)
}


def is_succession_nephew_hunt_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_SUCCESSION_IDX] < 0 && deltas[STAT_ARMY_IDX] > 0
}


def is_people_purge_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_PEOPLE_IDX] < 0 && deltas[STAT_ARMY_IDX] > 0
}


def is_succession_heir_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_SUCCESSION_IDX] > 0
}


def is_food_granary_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_FOOD_IDX] > 0
}


def is_betrayal_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_LOYALTY_IDX] < 0
}


def is_nobility_cost_choice(deltas : int[STAT_COUNT]) : bool {
    return deltas[STAT_RICH_LOVE_IDX] < 0
}


def public copy_stat_deltas(src : int[STAT_COUNT]) : int[STAT_COUNT] {
    var result : int[STAT_COUNT]
    for (i in range(STAT_COUNT)) {
        result[i] = src[i]
    }
    return result
}


def public apply_choice_penalty_multiplier(var deltas : int[STAT_COUNT]) {
    for (i in range(STAT_COUNT)) {
        if (deltas[i] < 0) {
            deltas[i] = int(floor(float(deltas[i]) * CHOICE_PENALTY_MULTIPLIER))
        }
    }
}


def apply_critical_tax(var deltas : int[STAT_COUNT]) {
    for (i in range(STAT_COUNT)) {
        if (is_critical_stat(i) && deltas[i] < 0) {
            deltas[i] -= 1
        }
    }
}


def clamp_synergy_total_change(original : int[STAT_COUNT]; var deltas : int[STAT_COUNT]) {
    for (i in range(STAT_COUNT)) {
        let change = deltas[i] - original[i]
        if (change > SYNERGY_BONUS_MAX) {
            deltas[i] = original[i] + SYNERGY_BONUS_MAX
        } elif (change < -SYNERGY_PENALTY_MAX) {
            deltas[i] = original[i] - SYNERGY_PENALTY_MAX
        }
    }
}


def public apply_synergy_modifiers(var deltas : int[STAT_COUNT]) {
    let original = copy_stat_deltas(deltas)

    // People synergies
    if (stat_touches(deltas, STAT_FOOD_IDX)) {
        if (is_high_stat(STAT_PEOPLE_IDX)) {
            apply_delta_mod(deltas, STAT_FOOD_IDX, 2)
            apply_delta_mod(deltas, STAT_PEOPLE_IDX, 1)
        }
        if (is_low_stat(STAT_PEOPLE_IDX)) {
            apply_delta_mod(deltas, STAT_FOOD_IDX, -2)
        }
    }
    if (is_low_stat(STAT_PEOPLE_IDX) && is_tax_choice(deltas)) {
        apply_delta_mod(deltas, STAT_PEOPLE_IDX, -1)
    }

    // Food synergies
    if (stat_touches(deltas, STAT_PEOPLE_IDX)) {
        if (is_high_stat(STAT_FOOD_IDX)) {
            apply_delta_mod(deltas, STAT_PEOPLE_IDX, 1)
        }
        if (is_low_stat(STAT_FOOD_IDX)) {
            apply_delta_mod(deltas, STAT_PEOPLE_IDX, -2)
        }
    }
    if (stat_touches(deltas, STAT_HEALTH_IDX)) {
        if (is_high_stat(STAT_FOOD_IDX)) {
            apply_delta_mod(deltas, STAT_HEALTH_IDX, 1)
        }
        if (is_low_stat(STAT_FOOD_IDX)) {
            apply_delta_mod(deltas, STAT_HEALTH_IDX, -1)
        }
    }

    // Treasury synergies
    if (is_treasury_spend_choice(deltas)) {
        if (is_high_stat(STAT_GOLD_IDX)) {
            apply_delta_mod(deltas, STAT_GOLD_IDX, 2)
        }
    }
    if (is_army_pay_choice(deltas) && is_low_stat(STAT_GOLD_IDX)) {
        apply_delta_mod(deltas, STAT_GOLD_IDX, -2)
    }
    if (is_health_build_choice(deltas) && is_low_stat(STAT_GOLD_IDX)) {
        apply_delta_mod(deltas, STAT_HEALTH_IDX, -1)
    }

    // Army synergies
    if (stat_touches(deltas, STAT_ARMY_IDX) && is_high_stat(STAT_ARMY_IDX)) {
        apply_delta_mod(deltas, STAT_ARMY_IDX, 1)
    }
    if (is_spy_or_dismiss_choice(deltas) && is_high_stat(STAT_ARMY_IDX)) {
        apply_delta_mod(deltas, STAT_LOYALTY_IDX, 1)
    }
    if (is_succession_nephew_hunt_choice(deltas) && is_low_stat(STAT_ARMY_IDX)) {
        apply_delta_mod(deltas, STAT_SUCCESSION_IDX, -2)
    }
    if (is_people_purge_choice(deltas) && is_low_stat(STAT_ARMY_IDX)) {
        apply_delta_mod(deltas, STAT_PEOPLE_IDX, -2)
    }

    // Church synergies
    if (stat_touches(deltas, STAT_CHURCH_IDX) && deltas[STAT_CHURCH_IDX] > 0 && is_high_stat(STAT_CHURCH_IDX)) {
        apply_delta_mod(deltas, STAT_CHURCH_IDX, 2)
    }
    if (is_succession_bless_choice(deltas) && is_high_stat(STAT_CHURCH_IDX)) {
        apply_delta_mod(deltas, STAT_SUCCESSION_IDX, 1)
    }
    if (is_church_refuse_choice(deltas) && is_low_stat(STAT_CHURCH_IDX)) {
        apply_delta_mod(deltas, STAT_CHURCH_IDX, -2)
    }
    if (is_health_prayer_choice(deltas) && is_low_stat(STAT_CHURCH_IDX)) {
        apply_delta_mod(deltas, STAT_HEALTH_IDX, -1)
    }

    // Nobility synergies
    if (is_nobility_gain_choice(deltas) && is_high_stat(STAT_RICH_LOVE_IDX)) {
        apply_delta_mod(deltas, STAT_RICH_LOVE_IDX, 2)
    }
    if (is_nobility_seize_choice(deltas) && is_high_stat(STAT_RICH_LOVE_IDX)) {
        apply_delta_mod(deltas, STAT_RICH_LOVE_IDX, 1)
    }
    if (is_nobility_insult_choice(deltas) && is_low_stat(STAT_RICH_LOVE_IDX)) {
        apply_delta_mod(deltas, STAT_RICH_LOVE_IDX, -2)
    }
    if (is_loyalty_court_oath_choice(deltas) && is_low_stat(STAT_RICH_LOVE_IDX)) {
        apply_delta_mod(deltas, STAT_LOYALTY_IDX, -1)
    }

    // Loyalty synergies
    if (stat_touches(deltas, STAT_LOYALTY_IDX) && deltas[STAT_LOYALTY_IDX] > 0 && is_high_stat(STAT_LOYALTY_IDX)) {
        apply_delta_mod(deltas, STAT_LOYALTY_IDX, 1)
    }
    if (deltas[STAT_LOYALTY_IDX] < 0 && is_high_stat(STAT_LOYALTY_IDX)) {
        apply_delta_mod(deltas, STAT_LOYALTY_IDX, 1)
    }
    if (is_spy_or_dismiss_choice(deltas) && is_low_stat(STAT_LOYALTY_IDX)) {
        if (deltas[STAT_PEOPLE_IDX] < 0) {
            apply_delta_mod(deltas, STAT_PEOPLE_IDX, -2)
        }
        if (deltas[STAT_RICH_LOVE_IDX] < 0) {
            apply_delta_mod(deltas, STAT_RICH_LOVE_IDX, -2)
        }
    }

    // Health synergies
    if (stat_touches(deltas, STAT_HEALTH_IDX) && deltas[STAT_HEALTH_IDX] > 0 && is_high_stat(STAT_HEALTH_IDX)) {
        apply_delta_mod(deltas, STAT_HEALTH_IDX, 2)
    }
    if (is_food_granary_choice(deltas) && is_high_stat(STAT_HEALTH_IDX)) {
        apply_delta_mod(deltas, STAT_FOOD_IDX, 1)
    }
    if (is_low_stat(STAT_HEALTH_IDX) && deltas[STAT_PEOPLE_IDX] < 0) {
        apply_delta_mod(deltas, STAT_PEOPLE_IDX, -1)
    }

    // Succession synergies
    if (is_succession_heir_choice(deltas) && is_high_stat(STAT_SUCCESSION_IDX)) {
        apply_delta_mod(deltas, STAT_SUCCESSION_IDX, 2)
    }
    if (is_nobility_gain_choice(deltas) && is_high_stat(STAT_SUCCESSION_IDX)) {
        apply_delta_mod(deltas, STAT_RICH_LOVE_IDX, 1)
    }
    if (is_nobility_cost_choice(deltas) && is_low_stat(STAT_SUCCESSION_IDX)) {
        apply_delta_mod(deltas, STAT_RICH_LOVE_IDX, -1)
    }
    if (is_betrayal_choice(deltas) && is_low_stat(STAT_SUCCESSION_IDX)) {
        apply_delta_mod(deltas, STAT_LOYALTY_IDX, -1)
    }

    clamp_synergy_total_change(original, deltas)
    apply_critical_tax(deltas)
}


def public stat_tooltip_influence_buff_line(statIdx : int) : string {
    return "{stat_tooltip_high_prefix()} {stat_influence_buff_text(statIdx)}"
}


def public stat_tooltip_influence_debuff_line(statIdx : int) : string {
    return "{stat_tooltip_low_prefix()} {stat_influence_debuff_text(statIdx)}"
}


def public stat_tooltip_active_buff_line(statIdx : int) : string {
    if (!is_high_stat(statIdx)) {
        return ""
    }
    return stat_active_buff_text(statIdx)
}


def public stat_tooltip_active_debuff_line(statIdx : int) : string {
    var result = ""
    if (is_low_stat(statIdx)) {
        result = stat_active_debuff_text(statIdx)
    }
    if (is_critical_stat(statIdx)) {
        let crisisLine = stat_active_crisis_text()
        if (length(result) > 0) {
            result = "{result}\n{crisisLine}"
        } else {
            result = crisisLine
        }
    }
    return result
}


def public stat_tooltip_has_active_modifiers(statIdx : int) : bool {
    return length(stat_tooltip_active_buff_line(statIdx)) > 0 || length(stat_tooltip_active_debuff_line(statIdx)) > 0
}

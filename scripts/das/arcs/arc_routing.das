require engine.core
require scripts/das/core/constants
require scripts/das/core/game_state
require scripts/das/arcs/arc_schedule
require scripts/das/arcs/arc_state
module arc_routing public


def public find_arc_beat_for_day(day : int) : int2 {
    for (i in range(ARC_SCHEDULE_COUNT)) {
        let slot = arcDaySchedule[i]
        if (slot.day == day) {
            if (slot.arcId == ARC_PLAGUE_CURE) {
                return int2(slot.arcId, route_plague_beat(slot.beatIdx))
            }
            return int2(slot.arcId, slot.beatIdx)
        }
    }
    return int2(ARC_NONE, -1)
}



// ---- Grey Lung arc: the schedule holds eight plague days; which scene plays depends on earlier choices.
// Beats: 0 offer | 1 funded progress | 2 refused, fever spreads | 3 delayed | 4 Church wants the cure |
// 5 Church offers relics (refused) | 6 army wants the cure | 7 capital infected (refused) | 8 holy water fails |
// 9-13 results (cured, scarred, ash, Church cure, Odo madness) | 14-23 aftermath | 24-27 legacy | 28 Odo's offer.
def public plague_result_beat() : int {
    if (plagueOdoWide) {
        return 13
    }
    if (plagueChurchTook && plagueCureProgress >= 30) {
        return 12
    }
    if (plagueCureProgress >= 55) {
        return 9
    }
    if (plagueCureProgress >= 30) {
        return 10
    }
    return 11
}


def public plague_outcome_of_beat(beat : int) : int {
    if (beat >= 9 && beat <= 13) {
        return beat - 8
    }
    return 0
}


def private plague_outcome_now() : int {
    if (plagueOutcome != 0) {
        return plagueOutcome
    }
    return plague_outcome_of_beat(plague_result_beat())
}


def private plague_aftermath_beat(outcome : int; shown : int) : int {
    let second = shown >= 1
    if (outcome == 1) {
        return second ? 19 : 14
    } elif (outcome == 2) {
        return second ? 23 : 16
    } elif (outcome == 3) {
        return second ? 20 : 17
    } elif (outcome == 4) {
        return second ? 21 : 15
    }
    return second ? 22 : 18
}


def public route_plague_beat(slotBeat : int) : int {
    if (slotBeat == 0) {
        return 0
    }
    if (slotBeat == 1) {
        if (plagueFundingPath == 0) {
            return 2
        } elif (plagueFundingPath == 3) {
            return 3
        }
        return 1
    }
    if (slotBeat == 4) {
        return plagueFundingPath == 0 ? 5 : 4
    }
    if (slotBeat == 6) {
        if (plagueFundingPath == 0) {
            return 7
        } elif (plagueChurchTook || plagueChurchShare) {
            return 8
        }
        return 6
    }
    if (slotBeat == 24) {
        let outcome = plague_outcome_now()
        if (outcome == 1) {
            return 24
        } elif (outcome == 3) {
            return 26
        } elif (outcome == 4) {
            return 27
        }
        return 25
    }
    if (plagueOutcome == 0) {
        if (!plagueOdoAsked && !plagueChurchTook && plagueCureProgress < 55) {
            return 28
        }
        return plague_result_beat()
    }
    return plague_aftermath_beat(plagueOutcome, plagueAftermathShown)
}

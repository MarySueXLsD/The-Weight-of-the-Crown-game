require engine.core
require scripts/das/core/constants
require scripts/das/core/game_state
require scripts/das/arcs/arc_schedule
module arc_routing public


def public find_arc_beat_for_day(day : int) : int2 {
    for (i in range(ARC_SCHEDULE_COUNT)) {
        let slot = arcDaySchedule[i]
        if (slot.day == day) {
            return int2(slot.arcId, slot.beatIdx)
        }
    }
    return int2(ARC_NONE, -1)
}

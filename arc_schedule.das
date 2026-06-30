require engine.core
require constants

module arc_schedule public

struct ArcDaySlot {
    day : int
    arcId : int
    beatIdx : int
    priority : int
}

let public ARC_SCHEDULE_COUNT = 137

let public arcDaySchedule : ArcDaySlot[ARC_SCHEDULE_COUNT] <- fixed_array(
    ArcDaySlot(day = 5, arcId = 6, beatIdx = 0, priority = 50),
    ArcDaySlot(day = 8, arcId = 0, beatIdx = 0, priority = 80),
    ArcDaySlot(day = 11, arcId = 2, beatIdx = 0, priority = 70),
    ArcDaySlot(day = 12, arcId = 6, beatIdx = 1, priority = 50),
    ArcDaySlot(day = 16, arcId = 0, beatIdx = 1, priority = 80),
    ArcDaySlot(day = 17, arcId = 2, beatIdx = 1, priority = 70),
    ArcDaySlot(day = 20, arcId = 6, beatIdx = 2, priority = 50),
    ArcDaySlot(day = 23, arcId = 2, beatIdx = 2, priority = 70),
    ArcDaySlot(day = 24, arcId = 0, beatIdx = 2, priority = 80),
    ArcDaySlot(day = 25, arcId = 13, beatIdx = 0, priority = 72),
    ArcDaySlot(day = 27, arcId = 6, beatIdx = 3, priority = 50),
    ArcDaySlot(day = 29, arcId = 2, beatIdx = 3, priority = 70),
    ArcDaySlot(day = 30, arcId = 4, beatIdx = 12, priority = 55),
    ArcDaySlot(day = 33, arcId = 0, beatIdx = 3, priority = 80),
    ArcDaySlot(day = 35, arcId = 5, beatIdx = 1, priority = 60),
    ArcDaySlot(day = 36, arcId = 2, beatIdx = 4, priority = 70),
    ArcDaySlot(day = 38, arcId = 13, beatIdx = 1, priority = 72),
    ArcDaySlot(day = 40, arcId = 5, beatIdx = 2, priority = 60),
    ArcDaySlot(day = 42, arcId = 3, beatIdx = 0, priority = 65),
    ArcDaySlot(day = 44, arcId = 5, beatIdx = 3, priority = 60),
    ArcDaySlot(day = 46, arcId = 6, beatIdx = 4, priority = 50),
    ArcDaySlot(day = 47, arcId = 2, beatIdx = 5, priority = 70),
    ArcDaySlot(day = 48, arcId = 5, beatIdx = 4, priority = 60),
    ArcDaySlot(day = 49, arcId = 0, beatIdx = 4, priority = 80),
    ArcDaySlot(day = 50, arcId = 3, beatIdx = 1, priority = 65),
    ArcDaySlot(day = 52, arcId = 13, beatIdx = 4, priority = 72),
    ArcDaySlot(day = 54, arcId = 2, beatIdx = 6, priority = 70),
    ArcDaySlot(day = 55, arcId = 5, beatIdx = 5, priority = 60),
    ArcDaySlot(day = 56, arcId = 3, beatIdx = 2, priority = 65),
    ArcDaySlot(day = 57, arcId = 6, beatIdx = 5, priority = 50),
    ArcDaySlot(day = 58, arcId = 0, beatIdx = 5, priority = 80),
    ArcDaySlot(day = 61, arcId = 5, beatIdx = 6, priority = 60),
    ArcDaySlot(day = 62, arcId = 10, beatIdx = 0, priority = 30),
    ArcDaySlot(day = 63, arcId = 3, beatIdx = 3, priority = 65),
    ArcDaySlot(day = 65, arcId = 2, beatIdx = 7, priority = 70),
    ArcDaySlot(day = 66, arcId = 6, beatIdx = 6, priority = 50),
    ArcDaySlot(day = 67, arcId = 0, beatIdx = 6, priority = 80),
    ArcDaySlot(day = 68, arcId = 3, beatIdx = 4, priority = 65),
    ArcDaySlot(day = 69, arcId = 5, beatIdx = 7, priority = 60),
    ArcDaySlot(day = 70, arcId = 13, beatIdx = 6, priority = 72),
    ArcDaySlot(day = 74, arcId = 3, beatIdx = 5, priority = 65),
    ArcDaySlot(day = 77, arcId = 5, beatIdx = 8, priority = 60),
    ArcDaySlot(day = 78, arcId = 6, beatIdx = 7, priority = 50),
    ArcDaySlot(day = 80, arcId = 3, beatIdx = 6, priority = 65),
    ArcDaySlot(day = 85, arcId = 3, beatIdx = 7, priority = 65),
    ArcDaySlot(day = 86, arcId = 0, beatIdx = 7, priority = 80),
    ArcDaySlot(day = 87, arcId = 1, beatIdx = 0, priority = 75),
    ArcDaySlot(day = 91, arcId = 6, beatIdx = 8, priority = 50),
    ArcDaySlot(day = 92, arcId = 8, beatIdx = 0, priority = 68),
    ArcDaySlot(day = 93, arcId = 3, beatIdx = 8, priority = 65),
    ArcDaySlot(day = 94, arcId = 1, beatIdx = 1, priority = 75),
    ArcDaySlot(day = 95, arcId = 13, beatIdx = 9, priority = 72),
    ArcDaySlot(day = 96, arcId = 10, beatIdx = 1, priority = 30),
    ArcDaySlot(day = 98, arcId = 1, beatIdx = 2, priority = 75),
    ArcDaySlot(day = 100, arcId = 3, beatIdx = 9, priority = 65),
    ArcDaySlot(day = 102, arcId = 1, beatIdx = 3, priority = 75),
    ArcDaySlot(day = 104, arcId = 8, beatIdx = 1, priority = 68),
    ArcDaySlot(day = 105, arcId = 9, beatIdx = 0, priority = 35),
    ArcDaySlot(day = 106, arcId = 3, beatIdx = 10, priority = 65),
    ArcDaySlot(day = 108, arcId = 5, beatIdx = 9, priority = 60),
    ArcDaySlot(day = 112, arcId = 1, beatIdx = 4, priority = 75),
    ArcDaySlot(day = 117, arcId = 8, beatIdx = 2, priority = 68),
    ArcDaySlot(day = 118, arcId = 1, beatIdx = 5, priority = 75),
    ArcDaySlot(day = 119, arcId = 3, beatIdx = 11, priority = 65),
    ArcDaySlot(day = 122, arcId = 6, beatIdx = 9, priority = 50),
    ArcDaySlot(day = 126, arcId = 1, beatIdx = 6, priority = 75),
    ArcDaySlot(day = 127, arcId = 1, beatIdx = 7, priority = 75),
    ArcDaySlot(day = 128, arcId = 4, beatIdx = 0, priority = 55),
    ArcDaySlot(day = 130, arcId = 13, beatIdx = 14, priority = 72),
    ArcDaySlot(day = 134, arcId = 8, beatIdx = 3, priority = 68),
    ArcDaySlot(day = 136, arcId = 4, beatIdx = 1, priority = 55),
    ArcDaySlot(day = 140, arcId = 10, beatIdx = 2, priority = 30),
    ArcDaySlot(day = 144, arcId = 4, beatIdx = 2, priority = 55),
    ArcDaySlot(day = 145, arcId = 6, beatIdx = 10, priority = 50),
    ArcDaySlot(day = 148, arcId = 8, beatIdx = 4, priority = 68),
    ArcDaySlot(day = 152, arcId = 4, beatIdx = 3, priority = 55),
    ArcDaySlot(day = 154, arcId = 8, beatIdx = 5, priority = 68),
    ArcDaySlot(day = 155, arcId = 9, beatIdx = 1, priority = 35),
    ArcDaySlot(day = 158, arcId = 7, beatIdx = 0, priority = 45),
    ArcDaySlot(day = 160, arcId = 4, beatIdx = 4, priority = 55),
    ArcDaySlot(day = 161, arcId = 7, beatIdx = 1, priority = 45),
    ArcDaySlot(day = 164, arcId = 7, beatIdx = 2, priority = 45),
    ArcDaySlot(day = 165, arcId = 8, beatIdx = 6, priority = 68),
    ArcDaySlot(day = 168, arcId = 7, beatIdx = 3, priority = 45),
    ArcDaySlot(day = 169, arcId = 4, beatIdx = 5, priority = 55),
    ArcDaySlot(day = 172, arcId = 6, beatIdx = 11, priority = 50),
    ArcDaySlot(day = 174, arcId = 7, beatIdx = 4, priority = 45),
    ArcDaySlot(day = 177, arcId = 4, beatIdx = 6, priority = 55),
    ArcDaySlot(day = 178, arcId = 7, beatIdx = 5, priority = 45),
    ArcDaySlot(day = 179, arcId = 8, beatIdx = 7, priority = 68),
    ArcDaySlot(day = 181, arcId = 7, beatIdx = 6, priority = 45),
    ArcDaySlot(day = 183, arcId = 8, beatIdx = 8, priority = 68),
    ArcDaySlot(day = 184, arcId = 4, beatIdx = 7, priority = 55),
    ArcDaySlot(day = 185, arcId = 7, beatIdx = 7, priority = 45),
    ArcDaySlot(day = 187, arcId = 10, beatIdx = 3, priority = 30),
    ArcDaySlot(day = 188, arcId = 7, beatIdx = 8, priority = 45),
    ArcDaySlot(day = 191, arcId = 7, beatIdx = 9, priority = 45),
    ArcDaySlot(day = 192, arcId = 4, beatIdx = 8, priority = 55),
    ArcDaySlot(day = 196, arcId = 6, beatIdx = 12, priority = 50),
    ArcDaySlot(day = 199, arcId = 7, beatIdx = 10, priority = 45),
    ArcDaySlot(day = 200, arcId = 13, beatIdx = 19, priority = 72),
    ArcDaySlot(day = 204, arcId = 4, beatIdx = 9, priority = 55),
    ArcDaySlot(day = 205, arcId = 7, beatIdx = 11, priority = 45),
    ArcDaySlot(day = 210, arcId = 7, beatIdx = 12, priority = 45),
    ArcDaySlot(day = 212, arcId = 9, beatIdx = 2, priority = 35),
    ArcDaySlot(day = 214, arcId = 4, beatIdx = 10, priority = 55),
    ArcDaySlot(day = 218, arcId = 7, beatIdx = 13, priority = 45),
    ArcDaySlot(day = 222, arcId = 4, beatIdx = 11, priority = 55),
    ArcDaySlot(day = 234, arcId = 12, beatIdx = 0, priority = 38),
    ArcDaySlot(day = 235, arcId = 9, beatIdx = 4, priority = 35),
    ArcDaySlot(day = 242, arcId = 12, beatIdx = 1, priority = 38),
    ArcDaySlot(day = 248, arcId = 11, beatIdx = 0, priority = 40),
    ArcDaySlot(day = 252, arcId = 6, beatIdx = 13, priority = 50),
    ArcDaySlot(day = 255, arcId = 11, beatIdx = 1, priority = 40),
    ArcDaySlot(day = 257, arcId = 12, beatIdx = 2, priority = 38),
    ArcDaySlot(day = 262, arcId = 11, beatIdx = 2, priority = 40),
    ArcDaySlot(day = 265, arcId = 10, beatIdx = 4, priority = 30),
    ArcDaySlot(day = 268, arcId = 11, beatIdx = 3, priority = 40),
    ArcDaySlot(day = 271, arcId = 12, beatIdx = 3, priority = 38),
    ArcDaySlot(day = 274, arcId = 11, beatIdx = 4, priority = 40),
    ArcDaySlot(day = 276, arcId = 11, beatIdx = 5, priority = 40),
    ArcDaySlot(day = 278, arcId = 6, beatIdx = 14, priority = 50),
    ArcDaySlot(day = 280, arcId = 9, beatIdx = 5, priority = 35),
    ArcDaySlot(day = 285, arcId = 12, beatIdx = 4, priority = 38),
    ArcDaySlot(day = 286, arcId = 11, beatIdx = 6, priority = 40),
    ArcDaySlot(day = 292, arcId = 11, beatIdx = 7, priority = 40),
    ArcDaySlot(day = 298, arcId = 12, beatIdx = 5, priority = 38),
    ArcDaySlot(day = 304, arcId = 11, beatIdx = 8, priority = 40),
    ArcDaySlot(day = 310, arcId = 12, beatIdx = 6, priority = 38),
    ArcDaySlot(day = 315, arcId = 11, beatIdx = 9, priority = 40),
    ArcDaySlot(day = 318, arcId = 9, beatIdx = 6, priority = 35),
    ArcDaySlot(day = 322, arcId = 12, beatIdx = 7, priority = 38),
    ArcDaySlot(day = 325, arcId = 10, beatIdx = 5, priority = 30),
    ArcDaySlot(day = 328, arcId = 12, beatIdx = 8, priority = 38),
    ArcDaySlot(day = 335, arcId = 12, beatIdx = 9, priority = 38),
    ArcDaySlot(day = 340, arcId = 13, beatIdx = 24, priority = 72),
    ArcDaySlot(day = 350, arcId = 6, beatIdx = 15, priority = 50)
)

let public {
    ARC_HOUSEHOLD_BEAT_COUNT = 8
    ARC_TAPESTRY_BEAT_COUNT = 8
    ARC_EMPTY_PURSE_BEAT_COUNT = 8
    ARC_HUNGRY_SEASON_BEAT_COUNT = 12
    ARC_GUILD_COMPACT_BEAT_COUNT = 13
    ARC_CHURCH_CROWN_BEAT_COUNT = 10
    ARC_NORTHERN_PRICE_BEAT_COUNT = 16
    ARC_GREAT_HOUSES_BEAT_COUNT = 14
    ARC_SCAFFOLD_LEDGER_BEAT_COUNT = 9
    ARC_STAR_CHAMBER_BEAT_COUNT = 7
    ARC_PROPHET_WINTER_BEAT_COUNT = 6
    ARC_COURT_KNIVES_BEAT_COUNT = 10
    ARC_NEPHEW_FOG_BEAT_COUNT = 10
    ARC_PLAGUE_CURE_BEAT_COUNT = 29
}

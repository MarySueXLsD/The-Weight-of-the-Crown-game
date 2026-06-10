require engine.core
require constants


let MONTH_NAMES : string[12] <- fixed_array(
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
)

let DAYS_IN_MONTH : int[12] <- fixed_array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

let STAT_DISPLAY_NAMES : string[STAT_COUNT] <- fixed_array(
    "People",
    "Church",
    "Army",
    "Treasury",
    "Health",
    "Loyalty",
    "Nobility",
    "Food",
    "Succession"
)

let STAT_DESCRIPTIONS : string[STAT_COUNT] <- fixed_array(
    "The common folk's happiness and support. Let it fall too low and riots will sweep the capital.",
    "The clergy and faith of the realm. They shape what the people believe — and whom they blame.",
    "Military strength and readiness. A weak army invites invasion; an overgrown one drains the treasury.",
    "The crown's gold reserves. Every decree has a cost, and an empty treasury ends your reign.",
    "Public health across the kingdom. Plague and sickness thrive when hospitals and healers are neglected.",
    "Devotion of your court and closest advisors. Betrayal waits when trust runs dry.",
    "Favour of the wealthy elite. Their coin and influence can save you — or buy your enemies.",
    "Granaries and food supply. Famine turns loyal subjects into a raging mob at the palace gates.",
    "Stability of your royal line. Without a clear heir, every lord begins planning for your funeral."
)

let DAY_PERIOD_DESCRIPTIONS : string[13] <- fixed_array(
    "High summer. The capital buzzes with traders, petitioners, and the hum of a new reign.",
    "Harvest season nears. Peasants toil in the fields while the court debates taxes and tithes.",
    "Golden autumn. Nobles return from country estates, bringing gossip and schemes to the throne room.",
    "The first frost. Winter preparations begin and the poor knock ever louder on palace gates.",
    "Midwinter cold. Roads grow dangerous and distant provinces grow restless under the snow.",
    "Deep winter. Fires burn in the great hall while villages beyond the walls go hungry and quiet.",
    "Late winter thaw. Rivers swell, merchants stir, and old grievances surface with the melt.",
    "Early spring. New growth stirs in the fields and new plots take root in the shadows of court.",
    "Spring bloom. Weddings, festivals, and conspiracies multiply across the kingdom.",
    "High spring. Alliances are forged and broken as the trading season opens once more.",
    "Early summer returns. Another turning of the year — and the throne has never felt so watched.",
    "Midsummer again. Veterans of your reign whisper that the crown sits heavier with each season.",
    "The year's end approaches. Three hundred and sixty-five days to prove yourself — or perish."
)

let KING_DESCRIPTION = "You are a young monarch, crowned after the sudden death of the old king. The court watches your every decree, waiting to see whether you will flourish — or falter."


def public format_calendar_date(day : int) : string {
    var monthIdx : int = CALENDAR_START_MONTH - 1
    var dom : int = CALENDAR_START_DAY + (day - 1)
    while (dom > DAYS_IN_MONTH[monthIdx]) {
        dom -= DAYS_IN_MONTH[monthIdx]
        monthIdx += 1
        if (monthIdx >= 12) {
            monthIdx = 0
        }
    }
    return "{dom} {MONTH_NAMES[monthIdx]}"
}


def public day_period_index(day : int) : int {
    let idx : int = (day - 1) / DAY_PERIOD_LENGTH
    return min(idx, 12)
}


def public info_tooltip_title(target : int; nickname : string; day : int; stats : int[STAT_COUNT]) : string {
    if (target == INFO_HOVER_DAY) {
        return "Day {day}/{MAX_REIGN_DAYS}"
    }
    if (target == INFO_HOVER_NICKNAME) {
        return nickname
    }
    if (target >= INFO_HOVER_STAT_BASE && target < INFO_HOVER_STAT_BASE + STAT_COUNT) {
        let statIdx : int = target - INFO_HOVER_STAT_BASE
        return "{STAT_DISPLAY_NAMES[statIdx]}: {stats[statIdx]}/{STAT_MAX}"
    }
    return ""
}


def public info_tooltip_body(target : int; day : int) : string {
    if (target == INFO_HOVER_DAY) {
        let periodIdx : int = day_period_index(day)
        return "{format_calendar_date(day)}\n\n{DAY_PERIOD_DESCRIPTIONS[periodIdx]}"
    }
    if (target == INFO_HOVER_NICKNAME) {
        return KING_DESCRIPTION
    }
    if (target >= INFO_HOVER_STAT_BASE && target < INFO_HOVER_STAT_BASE + STAT_COUNT) {
        let statIdx : int = target - INFO_HOVER_STAT_BASE
        return STAT_DESCRIPTIONS[statIdx]
    }
    return ""
}

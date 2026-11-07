require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_state
require scripts/das/core/game_state
require scripts/das/localization/localization public
module arc_effects public


// Stance/tone constants
let HOUSEHOLD_TONE_STEADY = 0
let HOUSEHOLD_TONE_BOLD = 1
let HOUSEHOLD_TONE_MYSTERY = 2
let HOUSEHOLD_TONE_ACCOUNTABLE = 3

let HOUSEHOLD_OUTCOME_CLEAN_COURT = 0
let HOUSEHOLD_OUTCOME_TURNED = 1
let HOUSEHOLD_OUTCOME_HAUNTED = 2
let HOUSEHOLD_OUTCOME_LEDGER = 3
let HOUSEHOLD_OUTCOME_IRON = 4

let NORTHERN_OUTCOME_NONE = 0
let NORTHERN_OUTCOME_COLD_PEACE = 1
let NORTHERN_OUTCOME_TRIBUTARY = 2
let NORTHERN_OUTCOME_ALLY = 3
let NORTHERN_OUTCOME_VICTOR = 4
let NORTHERN_OUTCOME_BROKEN = 5
let NORTHERN_OUTCOME_VASSAL = 6

let PURSE_OUTCOME_NONE = 0
let PURSE_OUTCOME_PAID_CROWN = 1
let PURSE_OUTCOME_MERCENARY_THRONE = 2
let PURSE_OUTCOME_MUTINY_AVOIDED = 3
let PURSE_OUTCOME_SOLD_SWORD = 4
let PURSE_OUTCOME_GHOST_ARMY = 5

let HUNGRY_OUTCOME_BREAD_KING = 1
let HUNGRY_OUTCOME_STARVING_CROWN = 2
let HUNGRY_OUTCOME_CHURCH_KITCHEN = 3
let HUNGRY_OUTCOME_GUILD_REPUBLIC = 4
let HUNGRY_OUTCOME_PEASANT_FURY = 5
let HUNGRY_OUTCOME_MANAGED_FAMINE = 6

let GUILD_OUTCOME_SOUND_TREASURY = 1
let GUILD_OUTCOME_DEBT_CROWN = 2
let GUILD_OUTCOME_MERCHANT_THRONE = 3
let GUILD_OUTCOME_COUNTERFEIT_CRISIS = 4
let GUILD_OUTCOME_GUILD_REPUBLIC = 5
let GUILD_OUTCOME_MANAGED_DEBT = 6

let CHURCH_OUTCOME_ANOINTED_USURPER = 1
let CHURCH_OUTCOME_SECULAR_CROWN = 2
let CHURCH_OUTCOME_SCHISM_KING = 3
let CHURCH_OUTCOME_PUPPET_THRONE = 4
let CHURCH_OUTCOME_FORFEIT_SURVIVED = 5

let HOUSES_OUTCOME_ASHFORD_ASCENDANT = 1
let HOUSES_OUTCOME_CROW_DELL_COMPACT = 2
let HOUSES_OUTCOME_LANDLESS_FURY = 3
let HOUSES_OUTCOME_COMIC_HORROR = 4
let HOUSES_OUTCOME_SHATTERED_PEERAGE = 5
let HOUSES_OUTCOME_BLOODLESS_LEDGER = 6

let SCAFFOLD_OUTCOME_BLOODY_PEACE = 1
let SCAFFOLD_OUTCOME_MERCY_CROWN = 2
let SCAFFOLD_OUTCOME_MORWENS_REPUBLIC = 3
let SCAFFOLD_OUTCOME_SELECTIVE_JUSTICE = 4

let HUNGRY_POLICY_FEED = 0
let HUNGRY_POLICY_RATION = 1
let HUNGRY_POLICY_REQUISITION = 2
let HUNGRY_POLICY_FAITH = 3

let GUILD_STANCE_PAY = 0
let GUILD_STANCE_RENEGOTIATE = 1
let GUILD_STANCE_SEIZE = 2
let GUILD_STANCE_DEFAULT = 3

let CHURCH_STANCE_SUBMIT = 0
let CHURCH_STANCE_DEFY = 1
let CHURCH_STANCE_BARGAIN = 2
let CHURCH_STANCE_SCHISM = 3


def public apply_household_edric_tone(choiceIdx : int) {
    if (choiceIdx == 0) {
        householdTone = HOUSEHOLD_TONE_STEADY
    } elif (choiceIdx == 1) {
        householdTone = HOUSEHOLD_TONE_BOLD
    } elif (choiceIdx == 2) {
        householdTone = HOUSEHOLD_TONE_MYSTERY
    } elif (choiceIdx == 3) {
        householdTone = HOUSEHOLD_TONE_ACCOUNTABLE
    }
}


def public apply_household_edric_stance(choiceIdx : int) {
    if (choiceIdx == 0) {
        householdStance = HOUSEHOLD_STANCE_PURGE
    } elif (choiceIdx == 1) {
        householdStance = HOUSEHOLD_STANCE_INTEGRATE
    } elif (choiceIdx == 2) {
        householdStance = HOUSEHOLD_STANCE_IGNORE
    } elif (choiceIdx == 3) {
        householdStance = HOUSEHOLD_STANCE_SELECTIVE
    }
    householdArcPhase = 1
}


def compute_household_outcome() {
    if (householdConsistency >= 70 && householdStance == HOUSEHOLD_STANCE_PURGE) {
        householdOutcome = HOUSEHOLD_OUTCOME_CLEAN_COURT
    } elif (householdStance == HOUSEHOLD_STANCE_INTEGRATE && householdKeptGromm) {
        householdOutcome = HOUSEHOLD_OUTCOME_TURNED
    } elif (householdStance == HOUSEHOLD_STANCE_IGNORE) {
        householdOutcome = HOUSEHOLD_OUTCOME_HAUNTED
    } elif (householdStance == HOUSEHOLD_STANCE_SELECTIVE) {
        householdOutcome = HOUSEHOLD_OUTCOME_LEDGER
    } elif (householdConsistency < 30) {
        householdOutcome = HOUSEHOLD_OUTCOME_IRON
    } else {
        householdOutcome = HOUSEHOLD_OUTCOME_LEDGER
    }
    householdArcPhase = 2
}


def apply_household_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        if (currentNodeIdx == 0) {
            if (choiceIdx == 0) {
                householdFeastChoice = 0
                householdKeptGromm = true
                hungryGrommFeast = true
                householdConsistency += 5
            } elif (choiceIdx == 1) {
                householdFeastChoice = 1
                householdKeptGromm = true
                householdConsistency += 5
            } elif (choiceIdx == 2) {
                householdFeastChoice = 2
                householdKeptGromm = true
                householdConsistency += 10
            }
        } elif (currentNodeIdx == 1) {
            if (choiceIdx == 0) {
                householdFeastChoice = 3
                householdKeptGromm = true
                householdWatchedGromm = true
                householdConsistency += 3
            } elif (choiceIdx == 1) {
                householdFeastChoice = 4
                householdKeptGromm = true
                hungryGrommFeast = true
                householdConsistency += 5
            } elif (choiceIdx == 2) {
                householdFeastChoice = 5
                householdKeptGromm = true
                householdConsistency += 8
            }
        }
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            householdPurgedGuards = true
        } elif (choiceIdx == 2) {
            householdSelectiveGuards = true
        }
    } elif (beatIdx == 2) {
        if (choiceIdx == 0) {
            householdCutClerks = true
        }
    } elif (beatIdx == 3) {
        if (choiceIdx == 0) {
            householdShelteredConfessor = true
        } elif (choiceIdx == 1) {
            householdChurchDeal = true
        }
    } elif (beatIdx == 4) {
        if (choiceIdx == 1) {
            householdSelenaBribe = true
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            householdVeteranPurge = true
        }
    }
}


def apply_plague_beat_choice(beatIdx : int; choiceIdx : int) {
    // plagueCureProgress: 55+ cures the realm, 30+ leaves it scarred, below 30 the pyres win.
    if (beatIdx == 0) {
        if (choiceIdx == 0) {
            plagueFundingPath = 1
            plagueCureProgress += 20
        } elif (choiceIdx == 1) {
            plagueFundingPath = 2
            plagueCureProgress += 10
        } elif (choiceIdx == 2) {
            plagueFundingPath = 0
        } else {
            plagueFundingPath = 3
        }
    } elif (beatIdx == 1) {
        plagueCureProgress += choiceIdx == 2 ? 5 : 20
    } elif (beatIdx == 2) {
        if (choiceIdx == 0) {
            plagueFundingPath = 1
            plagueCureProgress += 20
        } elif (choiceIdx == 1) {
            plagueCureProgress += 8
        }
    } elif (beatIdx == 3) {
        if (choiceIdx == 0) {
            plagueFundingPath = 1
            plagueCureProgress += 15
        } elif (choiceIdx == 1) {
            plagueFundingPath = 2
            plagueCureProgress += 8
        } else {
            plagueFundingPath = 0
        }
    } elif (beatIdx == 4) {
        if (choiceIdx == 0) {
            plagueCureProgress += 10
        } elif (choiceIdx == 1) {
            plagueChurchShare = true
            plagueCureProgress += 5
        } else {
            plagueChurchTook = true
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            plagueChurchTook = true
        } elif (choiceIdx == 1) {
            plagueFundingPath = 1
            plagueCureProgress += 20
        }
    } elif (beatIdx == 6) {
        if (choiceIdx == 0) {
            plagueCureProgress += 5
        } elif (choiceIdx == 1) {
            plagueCureProgress += 10
        }
    } elif (beatIdx == 7) {
        if (choiceIdx == 0) {
            plagueFundingPath = 1
            plagueChurchTook = false
            plagueCureProgress += 25
        } elif (choiceIdx == 1) {
            plagueCureProgress += 10
        }
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            plagueChurchTook = false
            plagueChurchShare = false
            plagueCureProgress += 10
        } elif (choiceIdx == 1) {
            plagueChurchTook = true
        } else {
            plagueCureProgress += 3
        }
    } elif (beatIdx >= 9 && beatIdx <= 13) {
        plagueOutcome = beatIdx - 8
        plagueArcPhase = 2
    } elif (beatIdx >= 14 && beatIdx <= 23) {
        plagueAftermathShown += 1
    } elif (beatIdx == 28) {
        plagueOdoAsked = true
        if (choiceIdx == 1) {
            plagueOdoUsed = true
            plagueCureProgress += 20
        } elif (choiceIdx == 2) {
            plagueOdoUsed = true
            plagueOdoWide = true
            plagueCureProgress += 35
        } elif (choiceIdx == 3) {
            plagueOdoUsed = true
            plagueCureProgress += 25
        }
    }
    if (plagueArcPhase < 1) {
        plagueArcPhase = 1
    }
}


def apply_people_unlock_tone(choiceIdx : int) {
    peopleUnlockTone = choiceIdx
}


def apply_northern_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        northernEnvoyChoice = choiceIdx
        if (choiceIdx == 0) {
            clamp_northern_trust(8)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(-22)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(5)
        }
        northernArcPhase = 1
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            clamp_northern_trust(10)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(-15)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(5)
        }
    } elif (beatIdx == 2) {
        northernBorderChoice = choiceIdx
        if (choiceIdx == 0) {
            clamp_northern_trust(-5)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(-25)
            northernWarStage = 1
        } elif (choiceIdx == 2) {
            clamp_northern_trust(8)
        }
    } elif (beatIdx == 3) {
        northernFaithChoice = choiceIdx
        if (choiceIdx == 0) {
            northernTributePaid = true
            clamp_northern_trust(18)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(-12)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(14)
        }
    } elif (beatIdx == 4) {
        if (choiceIdx == 0) {
            clamp_northern_trust(10)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(-8)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(3)
        }
    } elif (beatIdx == 5) {
        northernKnoxChoice = choiceIdx
        if (choiceIdx == 0) {
            clamp_northern_trust(12)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(-18)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(-35)
            northernWarStage = 1
        }
    } elif (beatIdx == 6) {
        northernAllianceChoice = choiceIdx
        if (choiceIdx == 0) {
            northernAllianceSigned = true
            clamp_northern_trust(25)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(10)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(-20)
        } elif (choiceIdx == 3 && northern_trust_tier() <= 1) {
            clamp_northern_trust(15)
        } elif (choiceIdx == 4 && northern_trust_tier() <= 1) {
            clamp_northern_trust(-15)
            northernWarStage = 2
        }
    } elif (beatIdx == 7) {
        if (choiceIdx == 0) {
            clamp_northern_trust(-15)
            northernWarStage = max(northernWarStage, 1)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(8)
        }
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            northernRefugeesAccepted = true
            clamp_northern_trust(10)
        } elif (choiceIdx == 1) {
            northernRefugeesTurnedBack = true
            clamp_northern_trust(-15)
        }
    } elif (beatIdx == 9) {
        if (choiceIdx == 0) {
            northernAllianceSigned = true
            clamp_northern_trust(12)
        } elif (choiceIdx == 1) {
            clamp_northern_trust(10)
        } elif (choiceIdx == 2) {
            northernAllianceSigned = false
            clamp_northern_trust(-15)
        } elif (choiceIdx == 3) {
            northernTributePaid = true
            clamp_northern_trust(5)
        } else {
            northernWarDeclared = true
            clamp_northern_trust(-20)
        }
    } elif (beatIdx == 10) {
        if (choiceIdx == 0) {
            clamp_northern_trust(-6)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(8)
        }
    } elif (beatIdx == 12) {
        if (choiceIdx == 2) {
            northernWarDeclared = true
            clamp_northern_trust(-25)
        } elif (choiceIdx == 0) {
            clamp_northern_trust(-5)
        }
    } elif (beatIdx == 13) {
        if (choiceIdx == 1) {
            clamp_northern_trust(-8)
        } elif (choiceIdx == 2) {
            clamp_northern_trust(10)
        }
    } elif (beatIdx == 14) {
        if (choiceIdx == 2) {
            clamp_northern_trust(-10)
        }
    }
}


def apply_tapestry_beat_choice(beatIdx : int; choiceIdx : int) {
    // Trust of the palace staff: how warmly the stairs speak of the crown.
    if (beatIdx == 0) {
        tapestryLissaChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryLissaCoupNight = true
            tapestryTrust += 5
        } elif (choiceIdx == 1) {
            tapestryTrust -= 6
        } else {
            tapestryTrust += 2
        }
    } elif (beatIdx == 1) {
        tapestryTilChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryTrust += 4
        } elif (choiceIdx == 1) {
            tapestryTilMockCrown = true
            tapestryTrust += 3
        } else {
            tapestryTrust -= 5
        }
    } elif (beatIdx == 2) {
        tapestryGrommChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryTrust += 8
        } elif (choiceIdx == 1) {
            tapestryTrust -= 6
        } else {
            tapestryTrust += 5
        }
    } elif (beatIdx == 3) {
        tapestryRaenaChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryRaenaDoor = true
            tapestryTrust += 2
        } elif (choiceIdx == 1) {
            tapestryTrust += 6
        } else {
            tapestryTrust -= 6
        }
    } elif (beatIdx == 4) {
        tapestryChamberChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryTrust += 2
        } elif (choiceIdx == 1) {
            tapestryChamberUsed = true
            tapestryTrust -= 4
        } else {
            tapestryTrust += 6
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            tapestryTrust += 4
        } elif (choiceIdx == 1) {
            tapestryTrust += 2
        } else {
            tapestryTrust -= 4
        }
    } elif (beatIdx == 6) {
        tapestryKnoxChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryKnoxServants = true
            tapestryTrust -= 10
        } elif (choiceIdx == 1) {
            tapestryTrust += 3
        } else {
            tapestryCoupNarrow = true
            tapestryTrust -= 2
        }
    }
    tapestryArcPhase = beatIdx + 1
}


def apply_purse_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        emptyPurseDay11Choice = choiceIdx
        if (choiceIdx == 0) {
            armyPayTrust += 10
        } elif (choiceIdx == 1) {
            armyPayTrust -= 5
        } elif (choiceIdx == 2) {
            emptyPurseCrisis = true
        }
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            emptyPurseSaltLoan = true
        }
    } elif (beatIdx == 2) {
        emptyPurseFinnChoice = choiceIdx
        if (choiceIdx == 0) {
            emptyPurseFinnAmnesty = true
        }
    } elif (beatIdx == 3) {
        emptyPurseBorvinChoice = choiceIdx
        if (choiceIdx == 2) {
            emptyPurseCrisis = true
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            emptyPurseKaraCrown = true
        }
    } elif (beatIdx == 6) {
        if (choiceIdx == 0) {
            emptyPurseOttoSworn = true
        }
    }
    purseArcPhase = beatIdx + 1
}


def clamp_famine_severity(delta : int) {
    famineSeverity = clamp(famineSeverity + delta, 0, 100)
}


def clamp_guild_standing(delta : int) {
    guildStanding = clamp(guildStanding + delta, -100, 100)
}


def apply_hungry_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        if (choiceIdx == 0) {
            hungryCrownPolicy = HUNGRY_POLICY_FEED
            clamp_famine_severity(-10)
        } elif (choiceIdx == 1) {
            hungryCrownPolicy = HUNGRY_POLICY_REQUISITION
            clamp_famine_severity(4)
        } else {
            hungryCrownPolicy = HUNGRY_POLICY_RATION
            clamp_famine_severity(12)
        }
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            clamp_famine_severity(-6)
        } elif (choiceIdx == 1) {
            hungryGrommFeast = true
            clamp_famine_severity(8)
        } else {
            clamp_famine_severity(-3)
        }
    } elif (beatIdx == 2) {
        if (choiceIdx == 0) {
            clamp_famine_severity(-8)
        } elif (choiceIdx == 1) {
            hungryChurchSoup = true
            clamp_famine_severity(-4)
        } else {
            clamp_famine_severity(10)
        }
    } elif (beatIdx == 3) {
        if (choiceIdx == 0) {
            clamp_famine_severity(-8)
        } elif (choiceIdx == 1) {
            clamp_famine_severity(8)
        } else {
            clamp_famine_severity(-3)
        }
    } elif (beatIdx == 4) {
        if (choiceIdx == 0) {
            clamp_famine_severity(-5)
        } elif (choiceIdx == 1) {
            hungryYarekRiots = true
            clamp_famine_severity(12)
        } else {
            hungryFaraCartel = true
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            hungryFaraCartel = true
            clamp_famine_severity(-8)
        } elif (choiceIdx == 1) {
            clamp_famine_severity(-4)
        } else {
            clamp_famine_severity(15)
        }
    } elif (beatIdx == 7) {
        if (choiceIdx == 2) {
            clamp_famine_severity(12)
        } else {
            clamp_famine_severity(-6)
        }
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            clamp_famine_severity(-4)
        } elif (choiceIdx == 1) {
            clamp_famine_severity(-6)
        } else {
            hungryChurchSoup = true
            clamp_famine_severity(-2)
        }
    } elif (beatIdx == 9) {
        if (choiceIdx == 0) {
            clamp_famine_severity(-5)
        } elif (choiceIdx == 1) {
            clamp_famine_severity(8)
        } else {
            clamp_famine_severity(-10)
        }
    } elif (beatIdx == 10) {
        if (choiceIdx == 0) {
            hungryYarekRiots = true
            clamp_famine_severity(8)
        } elif (choiceIdx == 1) {
            clamp_famine_severity(-2)
        } else {
            clamp_famine_severity(-6)
        }
    }
    hungryArcPhase = beatIdx + 1
}


def apply_guild_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        if (choiceIdx == 0) {
            clamp_guild_standing(8)
        } elif (choiceIdx == 1) {
            clamp_guild_standing(-6)
        } else {
            guildFaraEmbargo = true
            clamp_guild_standing(-15)
        }
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            clamp_guild_standing(6)
        } elif (choiceIdx == 1) {
            guildSaltLoan = true
        } else {
            guildSaltLoan = true
            clamp_guild_standing(-15)
        }
    } elif (beatIdx == 2) {
        if (choiceIdx >= 1) {
            guildNeriusCounterfeit = true
        }
    } elif (beatIdx == 6) {
        if (choiceIdx == 0) {
            guildCompactSigned = true
        } elif (choiceIdx == 1) {
            clamp_guild_standing(-12)
        } elif (choiceIdx == 2) {
            clamp_guild_standing(-4)
        } elif (choiceIdx == 3) {
            clamp_guild_standing(12)
        } else {
            guildSaltLoan = true
        }
    } elif (beatIdx == 7) {
        if (choiceIdx <= 1) {
            guildNeriusCounterfeit = false
        } else {
            guildNeriusCounterfeit = true
        }
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            guildCrownStance = GUILD_STANCE_PAY
            clamp_guild_standing(12)
        } elif (choiceIdx == 1) {
            guildCrownStance = GUILD_STANCE_DEFAULT
            clamp_guild_standing(-25)
        } else {
            guildCrownStance = GUILD_STANCE_SEIZE
            clamp_guild_standing(4)
        }
    } elif (beatIdx == 9) {
        if (choiceIdx == 0) {
            clamp_guild_standing(4)
        } elif (choiceIdx == 2) {
            clamp_guild_standing(-4)
        }
    }
    guildArcPhase = beatIdx + 1
}


def apply_church_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        if (currentNodeIdx == 0) {
            if (choiceIdx == 0) {
                churchArcStance = CHURCH_STANCE_SUBMIT
            } elif (choiceIdx == 1) {
                churchArcStance = CHURCH_STANCE_DEFY
            } elif (choiceIdx == 2) {
                churchArcStance = CHURCH_STANCE_BARGAIN
            } else {
                churchArcStance = CHURCH_STANCE_SCHISM
            }
        } elif (currentNodeIdx == 1) {
            if (choiceIdx == 0) {
                forfeitPressure = clamp(forfeitPressure - 10, 0, 100)
            } elif (choiceIdx == 1) {
                forfeitPressure = clamp(forfeitPressure + 25, 0, 100)
            } elif (choiceIdx == 2) {
                forfeitPressure = clamp(forfeitPressure + 10, 0, 100)
            }
        }
        churchArcPhase = beatIdx + 1
        return
    }
    // Every open challenge to Malrik raises the pressure to declare the crown forfeit.
    if (beatIdx == 1) {
        if (choiceIdx == 1) {
            forfeitPressure = clamp(forfeitPressure + 12, 0, 100)
        }
    } elif (beatIdx == 2) {
        if (choiceIdx == 0) {
            forfeitPressure = clamp(forfeitPressure + 12, 0, 100)
        } elif (choiceIdx == 1) {
            forfeitPressure = clamp(forfeitPressure - 8, 0, 100)
        }
    } elif (beatIdx == 3) {
        if (choiceIdx == 0) {
            forfeitPressure = clamp(forfeitPressure + 10, 0, 100)
        } elif (choiceIdx == 2) {
            churchInterdictDeclared = true
            forfeitPressure = clamp(forfeitPressure + 20, 0, 100)
        }
    } elif (beatIdx == 4) {
        if (choiceIdx == 1) {
            forfeitPressure = clamp(forfeitPressure + 15, 0, 100)
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            forfeitPressure = clamp(forfeitPressure + 10, 0, 100)
        } elif (choiceIdx == 1) {
            forfeitPressure = clamp(forfeitPressure - 8, 0, 100)
        }
    } elif (beatIdx == 6) {
        if (choiceIdx == 0) {
            forfeitPressure = clamp(forfeitPressure + 20, 0, 100)
        } elif (choiceIdx == 2) {
            forfeitPressure = clamp(forfeitPressure - 5, 0, 100)
        }
    } elif (beatIdx == 7) {
        if (choiceIdx == 1) {
            forfeitPressure = clamp(forfeitPressure + 10, 0, 100)
        }
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            churchArcStance = CHURCH_STANCE_SUBMIT
        } elif (choiceIdx == 1) {
            churchArcStance = CHURCH_STANCE_DEFY
            churchInterdictDeclared = true
        } else {
            churchArcStance = CHURCH_STANCE_SCHISM
        }
    }
    churchArcPhase = beatIdx + 1
}


def apply_houses_beat_choice(beatIdx : int; choiceIdx : int) {
    if ((beatIdx == 2 && choiceIdx == 1) || (beatIdx == 8 && choiceIdx == 1)) {
        housesDellCrowDeal = true
    } elif (beatIdx == 6 && choiceIdx == 0) {
        housesGooseFavored = true
    } elif (beatIdx == 7) {
        housesAshfordLeads = choiceIdx == 0
    } elif (beatIdx == 9 && choiceIdx == 2) {
        housesRaymondRising = true
    } elif (beatIdx == 11) {
        // The night of knives: who dies depends on whom the crown protects.
        if (choiceIdx == 1) {
            housesAliveAshford = false
            housesDeadCount += 1
        } elif (choiceIdx == 3) {
            housesAliveDell = false
            housesAliveCrow = false
            housesDeadCount += 2
        } elif (choiceIdx == 4) {
            housesAliveKaspar = false
            housesDeadCount += 1
        }
    }
    housesArcPhase = beatIdx + 1
}


def apply_scaffold_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        scaffoldCrownStance = choiceIdx
    }
    // Mercy score per beat, in choice order (positive = mercy, negative = rope).
    var mercy = 0
    if (beatIdx == 0) {
        mercy = choiceIdx == 0 ? -8 : (choiceIdx == 1 ? 0 : 10)
    } elif (beatIdx == 1) {
        mercy = choiceIdx == 0 ? -10 : (choiceIdx == 1 ? -4 : 6)
    } elif (beatIdx == 2) {
        mercy = choiceIdx == 0 ? -15 : (choiceIdx == 1 ? 4 : 12)
        if (choiceIdx == 0) {
            scaffoldRiotHangings = true
        }
    } elif (beatIdx == 3) {
        mercy = choiceIdx == 0 ? -12 : (choiceIdx == 1 ? 10 : 0)
    } elif (beatIdx == 4) {
        mercy = choiceIdx == 0 ? 6 : (choiceIdx == 1 ? -8 : 0)
    } elif (beatIdx == 5) {
        mercy = choiceIdx == 0 ? -6 : (choiceIdx == 1 ? 12 : -8)
    } elif (beatIdx == 6) {
        if (choiceIdx == 0) {
            scaffoldTalenBribe = true
        } elif (choiceIdx == 2) {
            scaffoldTalenBribe = true
            scaffoldCrownStance = 1
        }
    } elif (beatIdx == 7) {
        if (choiceIdx == 0) {
            scaffoldMassAmnesty = true
            mercy = 15
        } elif (choiceIdx == 1) {
            scaffoldRiotHangings = true
            mercy = -15
        }
    }
    scaffoldMercy += mercy
    scaffoldArcPhase = beatIdx + 1
}


def apply_star_beat_choice(beatIdx : int; choiceIdx : int) {
    // Credibility of the court astrologer; handing him over or burning his work silences him.
    if (beatIdx == 0) {
        if (choiceIdx == 0) {
            starCredibility += 10
            starCrownStance = 0
        } elif (choiceIdx == 2) {
            starSilenced = true
            starCredibility -= 15
        }
    } elif (beatIdx == 1) {
        starCredibility += choiceIdx == 0 ? 6 : (choiceIdx == 1 ? 3 : -8)
    } elif (beatIdx == 2) {
        starCredibility += choiceIdx == 0 ? 10 : (choiceIdx == 1 ? 4 : -6)
    } elif (beatIdx == 3) {
        starCredibility += choiceIdx == 0 ? -10 : (choiceIdx == 1 ? 10 : -6)
    } elif (beatIdx == 4) {
        starCredibility += choiceIdx == 0 ? 6 : (choiceIdx == 1 ? -4 : 8)
    } elif (beatIdx == 5) {
        starCredibility += choiceIdx == 0 ? 4 : (choiceIdx == 1 ? 2 : -4)
    }
    starChamberArcPhase = beatIdx + 1
}


def apply_knives_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        knivesCrownStance = choiceIdx
        if (choiceIdx == 0) {
            courtTrust -= 4
        } elif (choiceIdx == 1) {
            knivesKnoxOffer = true
            courtTrust -= 12
        } else {
            courtTrust += 2
        }
    } elif (beatIdx == 1) {
        courtTrust += choiceIdx == 0 ? -8 : (choiceIdx == 1 ? 2 : 10)
    } elif (beatIdx == 2) {
        courtTrust += choiceIdx == 0 ? 6 : (choiceIdx == 1 ? 2 : -8)
    } elif (beatIdx == 3) {
        courtTrust += choiceIdx == 0 ? -4 : (choiceIdx == 1 ? 4 : -2)
    } elif (beatIdx == 4) {
        courtTrust += choiceIdx == 0 ? 8 : (choiceIdx == 1 ? -4 : -10)
    } elif (beatIdx == 5) {
        courtTrust += choiceIdx == 0 ? 4 : (choiceIdx == 1 ? 2 : -4)
    } elif (beatIdx == 6) {
        courtTrust += choiceIdx == 0 ? 6 : (choiceIdx == 1 ? 0 : -8)
    } elif (beatIdx == 7) {
        if (choiceIdx == 0) {
            courtTrust += 4
        } elif (choiceIdx == 1) {
            knivesKnoxOffer = true
            courtTrust -= 6
        } else {
            knivesTalenTriple = true
            courtTrust -= 4
        }
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            knivesVarnPurge = true
            courtTrust -= 10
        } elif (choiceIdx == 1) {
            courtTrust += 10
        } else {
            courtTrust -= 6
        }
    }
    knivesArcPhase = beatIdx + 1
}


def apply_nephew_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 1 && choiceIdx == 2) {
        heirAshfordCage = true
    } elif (beatIdx == 2 && choiceIdx == 1) {
        heirAshfordCage = true
    } elif (beatIdx == 3) {
        if (choiceIdx == 1) {
            heirIngvarBid = true
        } elif (choiceIdx == 2) {
            heirNephewAlive = false
        }
    } elif (beatIdx == 4) {
        heirCrownStance = choiceIdx
        if (choiceIdx == 1) {
            heirRecognized = true
        }
    } elif (beatIdx == 5 && choiceIdx == 0) {
        heirRecognized = true
    } elif (beatIdx == 6 && choiceIdx == 1) {
        heirIngvarBid = true
    }
    if (choiceIdx == 0) {
        heirCredibility += 8
    } elif (choiceIdx == 2) {
        heirCredibility -= 10
    }
    nephewArcPhase = beatIdx + 1
}


def apply_prophet_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        if (choiceIdx == 0) {
            prophetFavor += 10
        } elif (choiceIdx == 1) {
            prophetSilenced = true
            prophetFavor -= 15
        }
    } elif (beatIdx == 1) {
        prophetFavor += choiceIdx == 0 ? 10 : (choiceIdx == 1 ? -8 : 4)
    } elif (beatIdx == 2) {
        if (choiceIdx == 0) {
            prophetFoxCult = true
            prophetFavor += 8
        } elif (choiceIdx == 1) {
            prophetFavor -= 10
        }
    } elif (beatIdx == 3) {
        prophetFavor += choiceIdx == 0 ? 5 : (choiceIdx == 1 ? -6 : 6)
    } elif (beatIdx == 4) {
        if (choiceIdx == 0) {
            prophetFavor += 6
        } elif (choiceIdx == 1) {
            prophetSilenced = true
            prophetFavor -= 15
        } else {
            prophetFavor += 4
        }
    }
    prophetArcPhase = beatIdx + 1
}


def compute_hungry_outcome() {
    if (famineSeverity >= 75) {
        hungryOutcome = HUNGRY_OUTCOME_STARVING_CROWN
    } elif (famineSeverity <= 30 && hungryCrownPolicy == HUNGRY_POLICY_FEED) {
        hungryOutcome = HUNGRY_OUTCOME_BREAD_KING
    } elif (hungryChurchSoup) {
        hungryOutcome = HUNGRY_OUTCOME_CHURCH_KITCHEN
    } elif (hungryFaraCartel) {
        hungryOutcome = HUNGRY_OUTCOME_GUILD_REPUBLIC
    } elif (hungryYarekRiots && famineSeverity >= 50) {
        hungryOutcome = HUNGRY_OUTCOME_PEASANT_FURY
    } else {
        hungryOutcome = HUNGRY_OUTCOME_MANAGED_FAMINE
    }
    hungryArcPhase = 2
}


def compute_guild_outcome() {
    if (guildCompactSigned) {
        guildOutcome = GUILD_OUTCOME_GUILD_REPUBLIC
    } elif (guildCrownStance == GUILD_STANCE_DEFAULT) {
        guildOutcome = GUILD_OUTCOME_DEBT_CROWN
    } elif (guildNeriusCounterfeit) {
        guildOutcome = GUILD_OUTCOME_COUNTERFEIT_CRISIS
    } elif (guildSaltLoan && guildStanding <= 0) {
        guildOutcome = GUILD_OUTCOME_MERCHANT_THRONE
    } elif (guildCrownStance == GUILD_STANCE_PAY && guildStanding >= 15) {
        guildOutcome = GUILD_OUTCOME_SOUND_TREASURY
    } else {
        guildOutcome = GUILD_OUTCOME_MANAGED_DEBT
    }
    guildArcPhase = 2
}


def compute_church_outcome() {
    if (churchArcStance == CHURCH_STANCE_SCHISM) {
        churchOutcome = CHURCH_OUTCOME_SCHISM_KING
    } elif (churchArcStance == CHURCH_STANCE_SUBMIT) {
        churchOutcome = forfeitPressure < 50 ? CHURCH_OUTCOME_ANOINTED_USURPER : CHURCH_OUTCOME_PUPPET_THRONE
    } elif (churchArcStance == CHURCH_STANCE_DEFY) {
        churchOutcome = forfeitPressure >= 60 ? CHURCH_OUTCOME_FORFEIT_SURVIVED : CHURCH_OUTCOME_SECULAR_CROWN
    } else {
        churchOutcome = CHURCH_OUTCOME_PUPPET_THRONE
    }
    churchArcPhase = 2
}


def compute_houses_outcome() {
    if (housesDeadCount >= 2) {
        housesOutcome = HOUSES_OUTCOME_SHATTERED_PEERAGE
    } elif (housesAshfordLeads && housesAliveAshford) {
        housesOutcome = HOUSES_OUTCOME_ASHFORD_ASCENDANT
    } elif (housesRaymondRising) {
        housesOutcome = HOUSES_OUTCOME_LANDLESS_FURY
    } elif (housesDellCrowDeal && housesAliveDell && housesAliveCrow) {
        housesOutcome = HOUSES_OUTCOME_CROW_DELL_COMPACT
    } elif (housesGooseFavored) {
        housesOutcome = HOUSES_OUTCOME_COMIC_HORROR
    } elif (housesDeadCount == 0) {
        housesOutcome = HOUSES_OUTCOME_BLOODLESS_LEDGER
    } else {
        housesOutcome = HOUSES_OUTCOME_SHATTERED_PEERAGE
    }
    housesArcPhase = 2
}


def compute_scaffold_outcome() {
    if (scaffoldMercy >= 25 && scaffoldMassAmnesty) {
        scaffoldOutcome = SCAFFOLD_OUTCOME_MERCY_CROWN
    } elif (scaffoldMercy <= -25) {
        scaffoldOutcome = SCAFFOLD_OUTCOME_BLOODY_PEACE
    } elif (scaffoldTalenBribe && scaffoldCrownStance == 1) {
        scaffoldOutcome = SCAFFOLD_OUTCOME_MORWENS_REPUBLIC
    } else {
        scaffoldOutcome = SCAFFOLD_OUTCOME_SELECTIVE_JUSTICE
    }
    scaffoldArcPhase = 2
}


def compute_star_outcome() {
    if (starSilenced || starCredibility <= -15) {
        starChamberOutcome = 1
    } elif (starCredibility >= 20) {
        starChamberOutcome = 3
    } else {
        starChamberOutcome = 2
    }
    starChamberArcPhase = 2
}


def compute_knives_outcome() {
    if (knivesKnoxOffer && courtTrust <= 0) {
        knivesOutcome = 3
    } elif (knivesVarnPurge || courtTrust <= -15) {
        knivesOutcome = 1
    } elif (courtTrust >= 15) {
        knivesOutcome = 4
    } else {
        knivesOutcome = 2
    }
    knivesArcPhase = 2
}


def compute_nephew_outcome() {
    if (heirIngvarBid) {
        nephewOutcome = 3
    } elif (heirAshfordCage) {
        nephewOutcome = 2
    } elif (heirRecognized && heirNephewAlive) {
        nephewOutcome = 4
    } elif (!heirNephewAlive) {
        nephewOutcome = 1
    } else {
        nephewOutcome = 5
    }
    nephewArcPhase = 2
}


def compute_prophet_outcome() {
    if (prophetSilenced) {
        prophetOutcome = 1
    } elif (prophetFoxCult && prophetFavor >= 15) {
        prophetOutcome = 2
    } elif (prophetFavor >= 25) {
        prophetOutcome = 3
    } elif (prophetFavor <= -15) {
        prophetOutcome = 4
    } else {
        prophetOutcome = 5
    }
    prophetArcPhase = 2
}


def compute_plague_outcome() {
    if (plagueCureProgress >= 80) {
        plagueOutcome = 1
    } elif (plagueCureProgress >= 40) {
        plagueOutcome = 2
    } else {
        plagueOutcome = 3
    }
    plagueArcPhase = 2
}


def clamp_northern_trust(delta : int) {
    northernTrust = clamp(northernTrust + delta, -100, 100)
}


def northern_trust_tier() : int {
    if (northernTrust <= -35) {
        return 0
    }
    if (northernTrust <= -5) {
        return 1
    }
    if (northernTrust <= 4) {
        return 2
    }
    if (northernTrust <= 34) {
        return 3
    }
    return 4
}


def public apply_arc_choice_effects_impl(arcId : int; beatIdx : int; choiceIdx : int) {
    if (arcId == ARC_HOUSEHOLD) {
        apply_household_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_PLAGUE_CURE) {
        apply_plague_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_NORTHERN_PRICE) {
        apply_northern_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_TAPESTRY) {
        apply_tapestry_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_EMPTY_PURSE) {
        apply_purse_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_HUNGRY_SEASON) {
        apply_hungry_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_GUILD_COMPACT) {
        apply_guild_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_CHURCH_CROWN) {
        apply_church_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_GREAT_HOUSES) {
        apply_houses_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_SCAFFOLD_LEDGER) {
        apply_scaffold_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_STAR_CHAMBER) {
        apply_star_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_COURT_KNIVES) {
        apply_knives_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_NEPHEW_FOG) {
        apply_nephew_beat_choice(beatIdx, choiceIdx)
    } elif (arcId == ARC_PROPHET_WINTER) {
        apply_prophet_beat_choice(beatIdx, choiceIdx)
    }
}


def compute_northern_outcome() {
    if (northernAllianceSigned && northernTrust >= 35) {
        northernOutcome = NORTHERN_OUTCOME_ALLY
    } elif (northernWarDeclared && northernTrust <= -35) {
        northernOutcome = NORTHERN_OUTCOME_BROKEN
    } elif (northernWarDeclared) {
        northernOutcome = NORTHERN_OUTCOME_VICTOR
    } elif (northernTributePaid && northernTrust <= 10) {
        northernOutcome = NORTHERN_OUTCOME_TRIBUTARY
    } elif (northern_trust_tier() == 0 && northernAllianceChoice == 3) {
        northernOutcome = NORTHERN_OUTCOME_VASSAL
    } elif (northernTrust >= -5 && northernTrust <= 15) {
        northernOutcome = NORTHERN_OUTCOME_COLD_PEACE
    } elif (northernTrust >= 35) {
        northernOutcome = NORTHERN_OUTCOME_ALLY
    } elif (northernTrust <= -35) {
        northernOutcome = NORTHERN_OUTCOME_BROKEN
    } else {
        northernOutcome = NORTHERN_OUTCOME_COLD_PEACE
    }
    northernArcPhase = 2
}


def compute_tapestry_outcome() {
    if (tapestryCoupNarrow) {
        tapestryOutcome = 2
    } elif (householdOutcome == HOUSEHOLD_OUTCOME_HAUNTED) {
        tapestryOutcome = 3
    } elif (tapestryTilMockCrown && tapestryTrust >= 0) {
        tapestryOutcome = 4
    } elif (tapestryTrust >= 12) {
        tapestryOutcome = 1
    } else {
        tapestryOutcome = 5
    }
    tapestryArcPhase = 2
}


def compute_purse_outcome() {
    if (emptyPurseKaraCrown) {
        purseOutcome = PURSE_OUTCOME_MERCENARY_THRONE
    } elif (emptyPurseOttoSworn) {
        purseOutcome = PURSE_OUTCOME_SOLD_SWORD
    } elif (emptyPurseFinnAmnesty && armyPayTrust >= 0) {
        purseOutcome = PURSE_OUTCOME_MUTINY_AVOIDED
    } elif (emptyPurseSaltLoan && armyPayTrust < -10) {
        purseOutcome = PURSE_OUTCOME_GHOST_ARMY
    } elif (emptyPurseDay11Choice == 0) {
        purseOutcome = PURSE_OUTCOME_PAID_CROWN
    } else {
        purseOutcome = PURSE_OUTCOME_MUTINY_AVOIDED
    }
    purseArcPhase = 2
}


def public compute_arc_outcome_if_finale(arcId : int; beatIdx : int) {
    if (arcId == ARC_HOUSEHOLD && beatIdx == 7) {
        compute_household_outcome()
    } elif (arcId == ARC_NORTHERN_PRICE && beatIdx == 15) {
        compute_northern_outcome()
    } elif (arcId == ARC_TAPESTRY && beatIdx == 7) {
        compute_tapestry_outcome()
    } elif (arcId == ARC_EMPTY_PURSE && beatIdx == 7) {
        compute_purse_outcome()
    } elif (arcId == ARC_HUNGRY_SEASON && beatIdx == 11) {
        compute_hungry_outcome()
    } elif (arcId == ARC_GUILD_COMPACT && beatIdx == 11) {
        compute_guild_outcome()
    } elif (arcId == ARC_CHURCH_CROWN && beatIdx == 9) {
        compute_church_outcome()
    } elif (arcId == ARC_GREAT_HOUSES && beatIdx == 13) {
        compute_houses_outcome()
    } elif (arcId == ARC_SCAFFOLD_LEDGER && beatIdx == 8) {
        compute_scaffold_outcome()
    } elif (arcId == ARC_STAR_CHAMBER && beatIdx == 6) {
        compute_star_outcome()
    } elif (arcId == ARC_COURT_KNIVES && beatIdx == 9) {
        compute_knives_outcome()
    } elif (arcId == ARC_NEPHEW_FOG && beatIdx == 9) {
        compute_nephew_outcome()
    } elif (arcId == ARC_PROPHET_WINTER && beatIdx == 5) {
        compute_prophet_outcome()
    }
}


def private build_household_finale_prompt() : string {
    if (is_russian()) {
        if (householdOutcome == HOUSEHOLD_OUTCOME_CLEAN_COURT) {
            return "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина. Кухни тихи. Казармы называют вас железом. Вы очистили двор. История поспорит о справедливости — о нерешительности нет."
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_TURNED) {
            if (householdWatchedGromm) {
                return "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина. Громм кормит вас под надзором. Старая стража сменила клятву. Двор не исчез — он сменил ошейник. Королевство называет вас королём, который держит свидетелей."
            }
            return "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина. Повар Эдвина по-прежнему кормит вас. Старая стража сменила клятву. Двор не исчез — он сменил ошейник. Опасно — но кухни тёплые."
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_HAUNTED) {
            return "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина. Люди Эдвина по-прежнему бродят по залам, как дым. Вы выбрали дворец призраков. Двор повинуется. Но не забывает."
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_IRON) {
            return "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина. Вы были милосердны — а потом жестоки. Казармы вас боятся. Кухни вас ненавидят. Вы — железо в бархате."
        }
        return "Ваше Величество, восемьдесят шесть дней с тех пор, как вы сказали мне, как намерены обращаться с двором Эдвина. Вы правили от случая к случаю — без доктрины, только суждением. Двор называет это мудростью или слабостью. Я называю это самым трудным троном для защиты."
    }
    if (householdOutcome == HOUSEHOLD_OUTCOME_CLEAN_COURT) {
        return "Your Majesty, eighty-six days since you told me how you would bear Edwin's household. The kitchens are quiet. The barracks call you iron. You cleansed the court. History will argue justice. It will not argue hesitation."
    }
    if (householdOutcome == HOUSEHOLD_OUTCOME_TURNED) {
        if (householdWatchedGromm) {
            return "Your Majesty, eighty-six days since you told me how you would bear Edwin's household. Gromm still feeds you under watch. The old guard swore anew. The household did not vanish — it changed collars. The realm calls you a king who keeps witnesses."
        }
        return "Your Majesty, eighty-six days since you told me how you would bear Edwin's household. Edwin's cook still feeds you. The old guard swore anew. The household did not vanish — it changed collars. Dangerous — but the kitchens are warm."
    }
    if (householdOutcome == HOUSEHOLD_OUTCOME_HAUNTED) {
        return "Your Majesty, eighty-six days since you told me how you would bear Edwin's household. Edwin's people still walk these halls like smoke. You chose a haunted palace. The court obeys. It does not forget."
    }
    if (householdOutcome == HOUSEHOLD_OUTCOME_IRON) {
        return "Your Majesty, eighty-six days since you told me how you would bear Edwin's household. You were merciful, then cruel. The barracks fear you. The kitchens hate you. You are iron wearing velvet."
    }
    return "Your Majesty, eighty-six days since you told me how you would bear Edwin's household. You ruled case by case — no doctrine, only judgment. The court calls it wisdom or weakness. I call it the hardest throne to defend."
}


def public build_household_finale_node() : DialogueNode {
    if (is_russian()) {
        return DialogueNode(
            prompt = build_household_finale_prompt(),
            choiceCount = 1,
            choices = fixed_array(
                DialogueChoice(choiceText = "Хватит", response = "Тогда я пишу итог один раз и закрываю главу. Вы купили ясность ценой тепла.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, 0, 0, 10)),
                DialogueChoice(),
                DialogueChoice(),
                DialogueChoice(),
                DialogueChoice(),
            )
        )
    }
    return DialogueNode(
        prompt = build_household_finale_prompt(),
        choiceCount = 1,
        choices = fixed_array(
            DialogueChoice(choiceText = "I have heard enough", response = "Then I write the verdict once and close the chapter. You bought clarity at the price of warmth.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, 0, 0, 10)),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice(),
        )
    )
}


// Arc endings that follow the outcome computed from the player's choices.
def private build_outcome_finale_node(arcId : int; beatIdx : int) : DialogueNode {
    let ru = is_russian()
    if (arcId == ARC_HOUSEHOLD && beatIdx == 7) {
        if (householdOutcome == HOUSEHOLD_OUTCOME_CLEAN_COURT) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, восемьдесят шесть дней назад вы сказали мне, как поступите с двором Эдвина. Вы сдержали слово: старых слуг нет, стража новая, писцы молчат. Кухни притихли, казармы зовут вас железным. История поспорит о справедливости, но нерешительным вас не назовёт.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Так и запиши", response = "Тогда я пишу «железо» и закрываю главу. Вы купили ясность. Ценой стало тепло.", statDeltas = fixed_array(0, 0, 8, 0, 0, -4, 0, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, eighty-six days ago you told me how you would treat Edwin's household. You kept your word: the old servants are gone, the guard is new, the clerks are silent. The kitchens are quiet and the barracks call you iron. History may argue about justice. It will not call you hesitant.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "Then write it down", response = "Then I write *iron* and close the chapter. You bought clarity. The price was warmth.", statDeltas = fixed_array(0, 0, 8, 0, 0, -4, 0, 0, 10)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_TURNED) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, восемьдесят шесть дней назад вы решили оставить людей Эдвина, а не выгнать их. Громм по-прежнему готовит вам. Старая стража принесла новую клятву. Двор не исчез — он сменил ошейник. Возможно, это опасно. Но на кухнях тепло, и слуги говорят с вами, а не о вас.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Так и запиши", response = "Тогда я пишу «переманены, а не сломлены». Следите за старыми руками — и иногда благодарите их.", statDeltas = fixed_array(0, 0, 2, 0, 0, 10, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, eighty-six days ago you chose to keep Edwin's people instead of throwing them out. Gromm still cooks for you. The old guard swore a new oath. The household did not vanish — it changed its collar. Dangerous, perhaps. But the kitchens are warm and the servants talk to you, not about you.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "Then write it down", response = "Then I write *turned, not broken*. Watch the old hands — and thank them now and then.", statDeltas = fixed_array(0, 0, 2, 0, 0, 10, 0, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_HAUNTED) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, восемьдесят шесть дней назад вы решили оставить двор Эдвина как есть. Его люди всё ещё здесь, бродят по залам, как дым. Они кланяются, служат и помнят. Вы выбрали дворец, полный призраков. Двор подчиняется вам. Но его он не забывает.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Так и запиши", response = "Тогда я пишу «дом с призраками». Спите чутко, Ваше Величество. У призраков есть ключи.", statDeltas = fixed_array(0, 0, -3, 0, 0, -6, 0, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, eighty-six days ago you decided to leave Edwin's household as it was. They are still here, walking these halls like smoke. They bow, they serve, they remember. You chose a palace full of ghosts. The court obeys you. It does not forget him.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "Then write it down", response = "Then I write *haunted*. Sleep lightly, Majesty. Ghosts keep keys.", statDeltas = fixed_array(0, 0, -3, 0, 0, -6, 0, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_LEDGER) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, восемьдесят шесть дней назад вы обещали судить людей Эдвина по одному. Так и вышло: повара оставили, стражника отослали, писца допросили. Никаких правил — только суждение. Двор называет это мудростью или слабостью, смотря кто сохранил место. Я называю это самым трудным троном — и самым честным.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Так и запиши", response = "Тогда я пишу «каждому по делам». Так тяжело править. Но за такое трудно ненавидеть.", statDeltas = fixed_array(0, 0, 3, 0, 0, 6, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, eighty-six days ago you promised to judge Edwin's people one by one. You did — a cook kept here, a guard sent there, a clerk questioned. No doctrine, only judgment. The court calls it wisdom or weakness, depending on who kept their post. I call it the hardest throne to defend — and the fairest.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "Then write it down", response = "Then I write *case by case*. Tiring to rule. Hard to hate.", statDeltas = fixed_array(0, 0, 3, 0, 0, 6, 0, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (householdOutcome == HOUSEHOLD_OUTCOME_IRON) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, восемьдесят шесть дней назад вы сказали мне одно о дворе Эдвина — а потом неделю за неделей делали другое. В понедельник милость, в пятницу сталь. Казармы вас боятся. Кухни ненавидят. Никто не знает, что вы сделаете завтра, — а во дворце это не всегда сила.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Так и запиши", response = "Тогда я пишу «железо в бархате». Страх работает. Доверие обошлось бы дешевле.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 0, 0, 2)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, eighty-six days ago you told me one thing about Edwin's household — and then did another, week after week. Mercy on Monday, steel on Friday. The barracks fear you. The kitchens hate you. No one knows what you will do next, and in a palace that is not always a strength.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "Then write it down", response = "Then I write *iron in velvet*. Fear works. Trust would have been cheaper.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 0, 0, 2)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_TAPESTRY && beatIdx == 7) {
        if (tapestryOutcome == 1) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, сорок дней прошло с тех пор, как Лисса считала свечи в ночь переворота, — и на лестницах ваше имя произносят без плевка. Вы накормили кухню, выслушали служанок и оставили шуту язык. Слуги, которые любят короля, — редкость. Берегите это, пока Эшфорд не начала мерить верхние залы.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал лестницу", response = "Тогда я пишу «тёплая лестница». Верхние залы скоро это проверят.", statDeltas = fixed_array(6, 0, 0, 0, 3, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, forty days since Lissa counted the candles of the coup night — and the stairs now speak your name without spitting. You fed the kitchens, listened to the maids, and let the fool keep his tongue. Servants who like their king are rare. Guard that before Ashford starts measuring the upper halls.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stairs", response = "Then I write *warm stairs*. The upper halls will test it soon.", statDeltas = fixed_array(6, 0, 0, 0, 3, 12, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (tapestryOutcome == 2) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы позволили истории ночи переворота утечь — и теперь все знают, как близко всё было к провалу. Три спальни, несколько верных клинков, одна удачная дверь. Двор больше не считает вас непобедимым. Зато он перестал гадать, а те, кто ещё мечтает о кресле Эдвина, показали лица.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал лестницу", response = "Тогда я пишу «открытый секрет». Вы потеряли легенду, но нашли врагов.", statDeltas = fixed_array(2, 0, 0, 0, 0, -4, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you let the story of the coup night leak — and now everyone knows how close it came. Three chambers, a few loyal blades, one lucky door. The court no longer thinks you invincible. But it has stopped guessing, and the people who still dream of Edwin's chair have shown their faces.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stairs", response = "Then I write *open secret*. You lost the legend and found your enemies.", statDeltas = fixed_array(2, 0, 0, 0, 0, -4, 0, 0, 8)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (tapestryOutcome == 3) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, лестница так и не оттаяла. Люди Эдвина по-прежнему управляют дворцом, и каждая история служанок кончается его именем. Вы не наказали сплетни и не перекупили их. Слуги подчиняются — и ждут.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал лестницу", response = "Тогда я пишу «лестница Эдвина». Вашей она пока не стала.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the stairs never warmed to you. Edwin's people still run the palace, and every story the maids tell ends with his name. You did not punish the gossip and you did not win it. The servants obey — and wait.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stairs", response = "Then I write *Edwin's stairs*. They are not yours yet.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (tapestryOutcome == 4) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы позволили Гусю высмеять корону при всех — и двор смеялся вместе с вами, а не над вами. Короля, который умеет принять шутку, трудно ненавидеть. Кто-то говорит, что вас не страшно ослушаться. Слуги говорят, что вам легко служить.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал лестницу", response = "Тогда я пишу «смеющийся двор». Смех — это щит, пока не станет привычкой.", statDeltas = fixed_array(6, 0, -3, 0, 0, 8, -3, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you let the Goose mock the crown in front of everyone — and the court laughed with you, not at you. A king who can take a joke is hard to hate. Some say you are too soft to fear. The servants say you are easy to serve.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stairs", response = "Then I write *the laughing court*. Laughter is a shield — until it is a habit.", statDeltas = fixed_array(6, 0, -3, 0, 0, 8, -3, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (tapestryOutcome == 5) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, на лестницах тихо — не тепло и не зло, просто осторожно. Кого-то вы заставили замолчать, кому-то заплатили, кого-то вычистили. Слуги делают своё дело и молчат. Но дворец, который молчит, ни о чём и не предупредит.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал лестницу", response = "Тогда я пишу «холодная лестница». Послушная и глухая. Берегитесь следующего ножа.", statDeltas = fixed_array(0, 0, 3, 0, 0, -5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the stairs are quiet — not warm, not angry, simply careful. You silenced some, paid others, and purged when it suited you. The servants do their work and say nothing. A palace that says nothing also warns you of nothing.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stairs", response = "Then I write *cold stairs*. Obedient. Deaf. Mind the next knife.", statDeltas = fixed_array(0, 0, 3, 0, 0, -5, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_EMPTY_PURSE && beatIdx == 7) {
        if (purseOutcome == PURSE_OUTCOME_PAID_CROWN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, пятьдесят четыре дня со дня первого смотра без жалованья — а люди всё ещё приходят на ваш зов. Вы платили им первыми, даже когда было больно. В казармах вас зовут королём, который платит. Это реже, чем храбрость.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал казармы", response = "Тогда войска выступят, когда я скажу. Эту верность купили монетой. Продолжайте платить.", statDeltas = fixed_array(0, 0, 12, -5, 0, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, fifty-four days since the first muster without coin — and the men still answer when you call. You paid them first, even when it hurt. The barracks call you a king who pays. That is rarer than courage.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the barracks", response = "Then march when I say march. Coin bought this loyalty. Keep paying for it.", statDeltas = fixed_array(0, 0, 12, -5, 0, 8, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (purseOutcome == PURSE_OUTCOME_MERCENARY_THRONE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, ворота теперь охраняет отряд Кары, оплаченный из королевской казны. Её болты смотрят туда, куда укажете вы, — пока звенит кошель. Мои люди видят, что наёмники едят лучше них. Армию, которую вы арендуете, завтра может арендовать кто-то другой.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал казармы", response = "Тогда держите казну полной. В день, когда она опустеет, у ворот сменится хозяин.", statDeltas = fixed_array(0, 0, 8, -10, 0, -4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Kara's company guards your gates now, paid from the crown's chest. Her bolts point where you point — while the purse sings. My own men watch the hired swords eat better than they do. An army you rent is an army someone else can rent tomorrow.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the barracks", response = "Then keep the chest full. The day it empties, the gates change owners.", statDeltas = fixed_array(0, 0, 8, -10, 0, -4, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (purseOutcome == PURSE_OUTCOME_MUTINY_AVOIDED) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, повозки у нижних ворот разгружены. Вы простили дезертиров, поторговались с банкирами и кормили людей ровно настолько, чтобы хватило. Об этом не сложат песен. Но и бунта не случилось. Иногда это и есть вся победа.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал казармы", response = "Тогда я назову это тихой победой. Не путайте тишину с верностью.", statDeltas = fixed_array(0, 0, 6, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the wagons at the lower gate are unpacked. You pardoned the deserters, haggled with the bankers, and kept the men just fed enough. No one sings about it. No one mutinied either. Sometimes that is the whole victory.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the barracks", response = "Then I call it a quiet win. Do not mistake quiet for loyal.", statDeltas = fixed_array(0, 0, 6, 0, 0, 4, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (purseOutcome == PURSE_OUTCOME_SOLD_SWORD) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, сэр Отто принял ваше жалованье и обнажил меч от вашего имени. Старые рыцари пошли за ним. Последний рыцарь дома Эдвина теперь охраняет ваш зал — и каждый ветеран видит, что новый король платит старые долги.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал казармы", response = "Тогда старые мечи ваши. Не заставляйте их пожалеть.", statDeltas = fixed_array(0, 0, 8, -4, 0, 6, 4, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Sir Otto took your stipend and drew his sword in your name. The old knights followed him. Edwin's last household knight now guards your hall — and every veteran sees that the new king pays old debts.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the barracks", response = "Then the old swords are yours. Do not make them regret it.", statDeltas = fixed_array(0, 0, 8, -4, 0, 6, 4, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (purseOutcome == PURSE_OUTCOME_GHOST_ARMY) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, заём Солта оплатил первый смотр — и больше ничего. В списках половина — имена, а не люди. По праздникам роты ещё маршируют, а по ночам расходятся. У вас армия на бумаге. Молитесь, чтобы её не позвали в бой.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал казармы", response = "Тогда найдите деньги раньше, чем войну. Бумага перевал не удержит.", statDeltas = fixed_array(0, 0, -10, 0, 0, -6, 0, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Salt's loan paid the first muster and nothing after it. Half the rolls are names, not men. The companies still march on parade days — and slip away at night. You have an army on paper. Pray no one asks it to fight.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the barracks", response = "Then find coin before you find a war. Paper does not hold a pass.", statDeltas = fixed_array(0, 0, -10, 0, 0, -6, 0, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_HUNGRY_SEASON && beatIdx == 11) {
        if (hungryOutcome == HUNGRY_OUTCOME_BREAD_KING) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, семьдесят семь дней прошло с тех пор, как Рута кашляла пылью у ваших ног, — а провинции ещё в силах вас благодарить. Вы открыли запасы и не закрыли их. Простой народ зовёт вас хлебным королём. Эшфорд усмехнётся. Мельницы — нет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал провинции", response = "Тогда я пишу «хлеб» раньше, чем «клинок». Редкость для короля, взявшего трон силой. Не растратьте это.", statDeltas = fixed_array(10, 0, 0, 0, 3, 8, 0, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, seventy-seven days since Ruta coughed dust at your feet — and the provinces still have breath to praise you. You opened the reserves and kept them open. The commons call you the bread king. Ashford will sneer. The mills will not.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *bread* before *blade*. Rare for a usurper. Do not waste it.", statDeltas = fixed_array(10, 0, 0, 0, 3, 8, 0, 4, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (hungryOutcome == HUNGRY_OUTCOME_STARVING_CROWN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, голодный сезон закончился, потому что есть больше нечего. Деревни опустели, мельницы молчат, а в балладах вас зовут королём, который ел последним. Всё, что вы сберегли в казне, вы потеряли в полях.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал провинции", response = "Тогда я пишу «голод». Следующей зимой они не станут ждать вашего указа.", statDeltas = fixed_array(-12, 0, 0, 0, -8, -10, 0, -6, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the hungry season is over because there is nothing left to eat. Villages are empty, the mills are silent, and the ballads call you the king who ate last. Whatever you saved in the treasury, you lost in the fields.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *famine*. Next winter, they will not wait for your decree.", statDeltas = fixed_array(-12, 0, 0, 0, -8, -10, 0, -6, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (hungryOutcome == HUNGRY_OUTCOME_CHURCH_KITCHEN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, королевство пережило голодный сезон — за церковным столом. Похлёбка Малрика кормила кварталы, а его священники читали молитву над каждой миской. Люди живы. И они знают, кто их кормил, — не корона.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал провинции", response = "Тогда я пишу «хлеб алтаря». Счёт Малрик пришлёт проповедями.", statDeltas = fixed_array(4, 12, 0, 0, 2, -4, 0, 2, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the realm survived the hungry season — at the church's tables. Malrik's soup fed the wards and Malrik's priests said grace over every bowl. The people are alive. They know who fed them, and it was not the crown.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *the altar's bread*. Malrik will send you the bill in sermons.", statDeltas = fixed_array(4, 12, 0, 0, 2, -4, 0, 2, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (hungryOutcome == HUNGRY_OUTCOME_GUILD_REPUBLIC) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, зерно снова идёт — по ценам Фары и по её дорогам. Гильдия накормила королевство, и теперь гильдия назначает цену хлеба. Никто не умер с голоду. Но никто и не забыл, у кого ключи от амбаров.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал провинции", response = "Тогда я пишу «купеческий урожай». Хлеб с квитанцией.", statDeltas = fixed_array(2, 0, 0, 8, 0, -4, 0, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the grain moves again — at Fara's prices, on Fara's roads. The guild fed the realm and now the guild sets the price of bread. Nobody starved. Nobody forgot who holds the keys to the granaries, either.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *the merchants' harvest*. Bread with a receipt.", statDeltas = fixed_array(2, 0, 0, 8, 0, -4, 0, 4, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (hungryOutcome == HUNGRY_OUTCOME_PEASANT_FURY) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, шахтёры не забыли подавленную забастовку, а деревни — солдат, забравших их зерно. Голодный сезон кончился факелами на горной дороге. Голод ушёл. Злость осталась.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал провинции", response = "Тогда я пишу «ярость». В следующем году накормите их раньше, чем они возьмутся за вас.", statDeltas = fixed_array(-10, 0, 4, 0, 0, -10, 0, 0, -3)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the miners did not forget the strike you crushed, and the villages did not forget the soldiers who took their grain. The hungry season ended with torches on the mountain road. Hunger is gone. Anger stayed.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *fury*. Feed them next year before they feed on you.", statDeltas = fixed_array(-10, 0, 4, 0, 0, -10, 0, 0, -3)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (hungryOutcome == HUNGRY_OUTCOME_MANAGED_FAMINE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, голодный сезон позади. Одни деревни накормили, другие — нет. Вы торговались, урезали пайки и брали в долг. Ни одна баллада не назовёт вас святым, ни одна — чудовищем. Большинство просто выжило.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал провинции", response = "Тогда я пишу «мы выстояли». Не слава. И не позор.", statDeltas = fixed_array(3, 0, 0, 0, 0, 3, 0, 2, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the hungry season is over. Some villages were fed, some were not. You bargained, rationed, and borrowed your way through it. No ballad calls you a saint, and none calls you a monster. Most people simply survived.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *we endured*. Not glory. Not shame.", statDeltas = fixed_array(3, 0, 0, 0, 0, 3, 0, 2, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_GUILD_COMPACT && beatIdx == 11) {
        if (guildOutcome == GUILD_OUTCOME_SOUND_TREASURY) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, девяносто четыре дня с тех пор, как Фара заморозила ваш кредит, — и в счётных конторах ваше имя произносят без плевка. Вы расплатились с Солтом, изъяли фальшивую монету и закрыли последний счёт полностью. Казна снова принадлежит короне. Это самое древнее чудо на свете.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кредиторов", response = "Тогда я пишу «платёжеспособен» раньше, чем «верен». Зима принесёт другие счета — оплатите и их.", statDeltas = fixed_array(0, 0, 0, 10, 0, 6, 4, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, ninety-four days since Fara froze your credit — and the counting houses speak your name without spitting. You paid Salt, cleared the false coin, and paid the final bill in full. The crown owns its coffers again. That is the oldest miracle there is.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *able to pay* before *loyal*. Winter brings other bills — pay them too.", statDeltas = fixed_array(0, 0, 0, 10, 0, 6, 4, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (guildOutcome == GUILD_OUTCOME_DEBT_CROWN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы сказали кредиторам правду: корона платить не может. Они забрали дорожные пошлины, соляные копи и серебряную посуду. Кресло вы сохранили. Теперь королевство зовёт вас Долговой Короной — королём, у которого есть трон и почти ничего больше.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кредиторов", response = "Тогда я пишу «честен и беден». Восстанавливайтесь медленно. И больше не занимайте.", statDeltas = fixed_array(0, 0, -4, -10, 0, 4, -8, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you told the creditors the truth: the crown cannot pay. They took the toll roads, the salt mines, and the silver plate. You kept the chair. The realm now calls you the Debt Crown — a king who owns a throne and little else.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *honest and poor*. Rebuild slowly. Borrow never.", statDeltas = fixed_array(0, 0, -4, -10, 0, 4, -8, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (guildOutcome == GUILD_OUTCOME_MERCHANT_THRONE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, займы Солта удержали вас на ногах — и теперь клерки Солта сидят рядом с вашим казначеем. Каждый указ, который стоит денег, сначала читает банкир. Вы правите. Доминик Солт одобряет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кредиторов", response = "Тогда я пишу «купеческий трон». Золото в левой руке, поводок — в правой.", statDeltas = fixed_array(0, 0, 0, 12, 0, -6, -4, 0, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Salt's loans kept you standing — and Salt's clerks now sit beside your treasurer. Every decree that costs money is read by a banker first. You rule. Dominic Salt approves.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *the merchant's throne*. Gold on the left hand, a leash on the right.", statDeltas = fixed_array(0, 0, 0, 12, 0, -6, -4, 0, -6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (guildOutcome == GUILD_OUTCOME_COUNTERFEIT_CRISIS) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, фальшивую монету так и не остановили. Пекари надкусывают каждый грош, солдаты отказываются от жалованья, а цены меняются дважды в день. Гильдии торгуют солью и обещаниями. Корона стоит столько же, сколько её монета, — а вашей не верят.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кредиторов", response = "Тогда я пишу «фальшивая монета». Чеканьте честные деньги, пока рынок не ударил вас.", statDeltas = fixed_array(-6, 0, -4, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the false coin was never stopped. Bakers bite every penny, soldiers refuse their pay, and prices change twice a day. The guilds trade in salt and promises. A crown is only as good as its coin, and yours is doubted.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *false coin*. Strike honest money before the market strikes you.", statDeltas = fixed_array(-6, 0, -4, -8, 0, -6, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (guildOutcome == GUILD_OUTCOME_GUILD_REPUBLIC) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы подписали договор Фары. Пошлины назначают гильдии, кредит идёт через гильдии, и даже церковный налог ограничивают купцы. Торговля ещё никогда не шла так хорошо. Короли редко бывали такими маленькими.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кредиторов", response = "Тогда я пишу «гильдейская республика». Богатое королевство. Скромная корона.", statDeltas = fixed_array(4, -6, 0, 12, 0, 0, -6, 4, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you signed Fara's compact. Tariffs are fixed by the guilds, credit flows through the guilds, and even the church tax is capped by merchants. Trade has never been better. Kings have rarely been smaller.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *the guild republic*. Rich realm. Modest crown.", statDeltas = fixed_array(4, -6, 0, 12, 0, 0, -6, 4, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (guildOutcome == GUILD_OUTCOME_MANAGED_DEBT) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, долги не выплачены, но больше не кричат. Вы растянули сроки, кое-что продали, кое-что заплатили и держали кредиторов в неведении. Казна дышит через соломинку. Но дышит.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал кредиторов", response = "Тогда я пишу «в долгах, но у руля». Пока что.", statDeltas = fixed_array(0, 0, 0, 4, 0, 2, 0, 0, 2)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the debts are not paid, but they are no longer shouting. You stretched terms, sold a little, paid a little, and kept the creditors guessing. The treasury breathes through a straw. It breathes.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *in debt, in control*. For now.", statDeltas = fixed_array(0, 0, 0, 4, 0, 2, 0, 0, 2)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_CHURCH_CROWN && beatIdx == 9) {
        if (churchOutcome == CHURCH_OUTCOME_ANOINTED_USURPER) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы преклонили колено перед Малриком, и он не стал вас унижать. Собор помазал корону. Слово «отречение» умерло на площади. Толпа становится на колени, когда вы проезжаете. Часть ваших утр теперь принадлежит небу — но у трона есть благословение, которого не было прежде.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал собор", response = "Тогда преклоняйте колено, когда он просит, и правьте, когда не просит.", statDeltas = fixed_array(4, 15, -3, 0, 0, 6, 0, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you knelt before Malrik and he did not humiliate you. The conclave anointed the crown. The word *forfeit* died in the square. The mob kneels when you pass. Heaven owns part of your mornings now — but your throne has a blessing it never had before.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the conclave", response = "Then kneel when he asks, and rule when he does not.", statDeltas = fixed_array(4, 15, -3, 0, 0, 6, 0, 0, 12)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (churchOutcome == CHURCH_OUTCOME_SECULAR_CROWN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы бросили вызов интердикту, и город не сгорел. Колокола молчали целый сезон, священники проповедовали против вас, а стража всё равно стояла на постах. Теперь корона стоит без алтаря. Одни называют это ересью. Ваши писцы — законом.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал собор", response = "Тогда пишите законы аккуратно. Небо будет читать их в поисках ошибок.", statDeltas = fixed_array(0, -12, 8, 4, 0, 4, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you defied the interdict and the city did not burn. The bells were silent for a season, the priests preached against you, and still the guards kept their posts. The crown now stands without the altar. Some call it heresy. Your clerks call it law.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the conclave", response = "Then write your laws carefully. Heaven will read them looking for mistakes.", statDeltas = fixed_array(0, -12, 8, 4, 0, 4, 0, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (churchOutcome == CHURCH_OUTCOME_SCHISM_KING) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, теперь в Эстедоре две церкви: собор Малрика и похлёбочные Арвеля. Раскол выбрали вы. Бедные молятся с монахами, лорды — с епископом, и обе стороны молятся за вас — по-разному.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал собор", response = "Тогда занимайте делом оба алтаря. Если они объединятся — то против вас.", statDeltas = fixed_array(8, -12, 0, 0, 0, 10, 0, -4, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Estedor now has two churches: Malrik's cathedral and Arvel's soup kitchens. You chose the split. The poor pray with the monks, the lords pray with the bishop, and both pray for you — differently.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the conclave", response = "Then keep both altars busy. If they unite, it will be against you.", statDeltas = fixed_array(8, -12, 0, 0, 0, 10, 0, -4, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (churchOutcome == CHURCH_OUTCOME_PUPPET_THRONE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы торговались с Малриком так часто, что теперь половину ваших указов пишет он. Церковь благословляет то, что ей нравится, и откладывает то, что нет. Корону носите вы. Перо держит он.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал собор", response = "Тогда забирайте перо по одному указу — пока он не забыл, что оно ваше.", statDeltas = fixed_array(0, 10, -4, -4, 0, -4, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you bargained with Malrik so often that he now writes half your decrees. The church blesses what it likes and delays what it does not. You wear the crown. He holds the pen.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the conclave", response = "Then take the pen back one decree at a time — before he forgets it was yours.", statDeltas = fixed_array(0, 10, -4, -4, 0, -4, 0, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (churchOutcome == CHURCH_OUTCOME_FORFEIT_SURVIVED) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, Малрик объявил вашу корону отрешённой, и королевство за ним не пошло. Люди Рудольфа удержали ворота, народ удержал хлеб, а епископ — проповедь, которой никто не послушался. Вы пережили самое сильное оружие Церкви. Благословения вам не видать. Возможно, оно и не нужно.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал собор", response = "Тогда правьте сталью и хлебом. Ни того, ни другого не должно не хватить.", statDeltas = fixed_array(2, -15, 10, 0, 0, 2, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Malrik declared your crown forfeit and the realm did not follow him. Rudolf's men held the gates, the people held their bread, and the bishop held a sermon nobody obeyed. You survived the church's strongest weapon. You will never be blessed. You may not need to be.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the conclave", response = "Then rule by steel and bread. Both must never run out.", statDeltas = fixed_array(2, -15, 10, 0, 0, 2, 0, 0, 8)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_NORTHERN_PRICE && beatIdx == 15) {
        if (northernOutcome == NORTHERN_OUTCOME_ALLY) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, триста пятьдесят дней с тех пор, как клинок дал вам корону, которую север не признавал. Договор держится, беженцы устроены, перевал общий. Князья заканчивают год, называя вас союзником — не другом и не вассалом, а королём, с которым стоит быть связанными.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда пусть ваши наследники спорят с нашими в письмах, а не на перевале.", statDeltas = fixed_array(0, 0, 6, 4, 0, 4, 0, 4, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, three hundred and fifty days since a blade gave you a crown the north did not grant. The charter holds, the refugees are housed, the pass is shared. The princes end the year calling you ally — not friend, not vassal, but a king worth binding.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the princes", response = "Then may your heirs argue with ours in letters, not on the pass.", statDeltas = fixed_array(0, 0, 6, 4, 0, 4, 0, 4, 15)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (northernOutcome == NORTHERN_OUTCOME_COLD_PEACE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, год кончается без войны и без дружбы. Князья торгуют с вами и следят за вами. Вы не заплатили ничего лишнего и не пообещали ничего, чего нельзя нарушить. Холодный мир — самый обычный из миров.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда держите костры на перевале. Холодный мир никого не греет.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the year ends without war and without friendship. The princes trade with you and watch you. You paid nothing you could not afford and promised nothing you could not break. A cold peace — the most common kind.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the princes", response = "Then keep the fires lit on the pass. Cold peace warms no one.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, 0, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (northernOutcome == NORTHERN_OUTCOME_TRIBUTARY) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, на перевале тихо, потому что вы платите за тишину. Каждую весну на север уходит повозка серебра. Князья называют это дружбой. Ваши солдаты называют это иначе.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда платите вовремя. Опоздавшая дань — кратчайшая дорога к войне.", statDeltas = fixed_array(0, 0, -6, -10, 0, -4, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the pass is quiet because you pay for its quiet. Each spring a wagon of silver goes north. The princes call it friendship. Your soldiers call it something else.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the princes", response = "Then pay on time. Late tribute is the shortest road to war.", statDeltas = fixed_array(0, 0, -6, -10, 0, -4, 0, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (northernOutcome == NORTHERN_OUTCOME_VICTOR) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы выбрали войну и выиграли её. Серый перевал ваш, князья подписали ваши условия, а вдовы с обеих сторон носят чёрное. Север будет уважать вас одно поколение — и ненавидеть два.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда стерегите перевал как следует. У побеждённых князей есть сыновья.", statDeltas = fixed_array(-4, 0, 12, -8, 0, 4, 0, -4, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you chose war and won it. The Grey Pass is yours, the princes signed under your terms, and the widows on both sides wear black. The north will respect you for a generation — and hate you for two.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the princes", response = "Then guard the pass well. Defeated princes have sons.", statDeltas = fixed_array(-4, 0, 12, -8, 0, 4, 0, -4, 10)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (northernOutcome == NORTHERN_OUTCOME_BROKEN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, война пошла плохо. Север сжёг три ваши деревни и держит Серый перевал. Солдаты вернулись — меньше числом и злее. Князьям пока не нужна ваша земля, только ваш страх. И он у них есть.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда восстанавливайтесь до весны. Север проверит вас снова.", statDeltas = fixed_array(-8, 0, -12, -8, 0, -6, 0, -6, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the war went badly. The north burned three of your villages and holds the Grey Pass. Your soldiers came home fewer and angrier. The princes do not want your land yet — only your fear. They have it.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the princes", response = "Then rebuild before spring. The north will test you again.", statDeltas = fixed_array(-8, 0, -12, -8, 0, -6, 0, -6, -6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (northernOutcome == NORTHERN_OUTCOME_VASSAL) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы приняли их условия, когда не было сил отказать. Ваша печать висит рядом с их печатями — и чуть ниже. Север называет вас другом так, как хозяин называет другом свою гончую.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал князей", response = "Тогда набирайтесь сил тихо. Ошейник можно снять.", statDeltas = fixed_array(0, 0, -8, -6, 0, -6, -4, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you accepted their terms when you had no strength to refuse. Your seal now hangs beside theirs — and a little lower. The north calls you a friend the way a master calls his hound a friend.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the princes", response = "Then grow strong quietly. Collars can be taken off.", statDeltas = fixed_array(0, 0, -8, -6, 0, -6, -4, 0, -8)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_GREAT_HOUSES && beatIdx == 13) {
        if (housesOutcome == HOUSES_OUTCOME_ASHFORD_ASCENDANT) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, великие дома вынесли вердикт: леди Эшфорд возглавляет ваш совет, и восток говорит её голосом. Остальные дома кланяются вам — но сперва смотрят на неё. В знати мир. Но у вас за плечом тень.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знать", response = "Тогда правьте с Эшфорд рядом — но никогда за спиной.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, 12, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the great houses have reached their verdict: Lady Ashford leads your council and the east speaks with her voice. The other houses bow to you — and look at her before they do. You have peace in the peerage. You also have a shadow on your shoulder.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the peerage", response = "Then rule with Ashford beside you — and never behind you.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, 12, 0, 8)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (housesOutcome == HOUSES_OUTCOME_CROW_DELL_COMPACT) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, Делл и Кроу перестали царапать друг друга и подписали один брачный договор на двоих — с вашей печатью внизу. Южные дороги и западные приданые теперь служат одному столу: вашему. Восток дуется. Юг платит.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знать", response = "Тогда держите обеих довольными. Союзу соперниц нужен судья.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 8, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Dell and Crow stopped clawing at each other and signed one marriage contract between them — with your seal at the bottom. The southern roads and the western dowries now serve one table: yours. The east sulks. The south pays.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the peerage", response = "Then keep both ladies happy. A compact of rivals needs a referee.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 8, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (housesOutcome == HOUSES_OUTCOME_LANDLESS_FURY) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, пока великие дома спорили о местах, безземельные люди Раймонда сами взяли поля. Три поместья горят, и лорды винят вас в том, что вы это допустили. Знать ослабла. Голодные осмелели.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знать", response = "Тогда раздавайте землю или рубите головы. Ждать больше нельзя.", statDeltas = fixed_array(4, 0, -4, 0, 0, -6, -10, -4, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, while the great houses argued over seats, Raymond's landless men took the fields themselves. Three estates burn and the lords blame you for letting it happen. The peerage is weaker. The hungry are bolder.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the peerage", response = "Then give land or take heads. Waiting is no longer a choice.", statDeltas = fixed_array(4, 0, -4, 0, 0, -6, -10, -4, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (housesOutcome == HOUSES_OUTCOME_COMIC_HORROR) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, великие дома пришли мерить ваше горло и нашли по правую руку от вас Герцога Гуся. Знать в ужасе. Народ в восторге. Никто толком не понимает, безумны вы или очень умны.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знать", response = "Тогда пусть гадают. Растерянные лорды медленно плетут заговоры.", statDeltas = fixed_array(8, 0, 0, 0, 0, 6, -10, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the great houses came to measure your throat and found Duke the Goose sitting at your right hand. The peers are horrified. The people adore it. Nobody quite knows whether you are mad or very clever.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the peerage", response = "Then keep them guessing. Lords who are confused plot slowly.", statDeltas = fixed_array(8, 0, 0, 0, 0, 6, -10, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (housesOutcome == HOUSES_OUTCOME_SHATTERED_PEERAGE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, ночь ножей оставила пустые кресла в зале совета. Великие имена похоронены, их наследники — дети, а их земли ждут хозяина. Ни один дом теперь не бросит вам вызов. Но и помочь никто не сможет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знать", response = "Тогда заполните кресла теми, кто вам обязан. И быстро.", statDeltas = fixed_array(0, 0, 4, 0, 0, -8, -15, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the night of knives left empty chairs in the council hall. Great names are buried, their heirs are children, and their lands wait for a master. No house can challenge you now. No house can help you either.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the peerage", response = "Then fill the chairs with people who owe you. Quickly.", statDeltas = fixed_array(0, 0, 4, 0, 0, -8, -15, 0, 10)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (housesOutcome == HOUSES_OUTCOME_BLOODLESS_LEDGER) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, великие дома приехали с ножами и уехали с договорами. Никто не умер. Все немного недовольны — а у знати это значит, что со всеми обошлись честно. Летопись назовёт это скучным. Дома — терпимым.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знать", response = "Тогда я пишу «бескровная книга». Редкость. Запомните, как вы это сделали.", statDeltas = fixed_array(2, 0, 0, 0, 0, 6, 10, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the great houses arrived with knives and left with contracts. No one died. Everyone is a little unhappy, which in the peerage means everyone is treated fairly. The chronicle will call it boring. The houses will call it survivable.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the peerage", response = "Then I write *the bloodless ledger*. Rare. Remember how you did it.", statDeltas = fixed_array(2, 0, 0, 0, 0, 6, 10, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_SCAFFOLD_LEDGER && beatIdx == 8) {
        if (scaffoldOutcome == SCAFFOLD_OUTCOME_BLOODY_PEACE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, девяносто три дня с тех пор, как Морвен впервые пересчитала сторонников Эдвина, — и теперь королевство знает вас по верёвке. Бунтовщики, еретики, изменники — все повешены. На площади тихо. В сердцах — нет. Вы купили кровавый мир. Он держится — пока держится.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал эшафот", response = "Тогда я пишу «верёвка» и надеюсь, что страх переживёт злость.", statDeltas = fixed_array(-8, 0, 10, 0, 0, -10, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, ninety-three days since Morwen first counted Edwin's loyalists — and the realm now knows you by the rope. Rioters, heretics, traitors: all hanged. The square is quiet. The hearts are not. You bought a bloody peace. It holds — until it does not.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the scaffold", response = "Then I write *rope* and hope fear outlasts anger.", statDeltas = fixed_array(-8, 0, 10, 0, 0, -10, 0, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (scaffoldOutcome == SCAFFOLD_OUTCOME_MERCY_CROWN) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, двор Морвен пуст, а её верёвка суха. Вы помиловали бунтовщиков, освободили безумных и простили даже тех, кто вас проклинал. Кто-то из освобождённых предаст. Но гораздо больше людей теперь рассказывают детям, что новый король их пощадил.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал эшафот", response = "Тогда я пишу «милосердие». Держите стражу поближе к помилованным: милость — не слепота.", statDeltas = fixed_array(10, 4, -6, 0, 0, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Morwen's yard is empty and her rope is dry. You pardoned rioters, freed the mad, and forgave even those who cursed you. Some freed men will betray you. Many more now tell their children that the new king spared them.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the scaffold", response = "Then I write *mercy*. Keep a few guards near the freed men — mercy is not blindness.", statDeltas = fixed_array(10, 4, -6, 0, 0, 12, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (scaffoldOutcome == SCAFFOLD_OUTCOME_MORWENS_REPUBLIC) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы наняли Талена, и теперь у правосудия есть прейскурант. Лорды покупают отсрочки, купцы — помилования, а вместо них вешают бедняков. Камеры пустеют быстро. Казна полнеет. Народ понял, что эшафот — это лавка.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал эшафот", response = "Тогда я пишу «верёвка на продажу». Однажды кто-нибудь купит и вашу.", statDeltas = fixed_array(-8, 0, 0, 10, 0, -8, 4, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you hired Talen and now justice has a price list. Lords buy delays, merchants buy pardons, and poor men hang in their place. The cells empty quickly. The treasury fills. The people have learned that the scaffold is a shop.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the scaffold", response = "Then I write *rope for sale*. One day someone will buy yours.", statDeltas = fixed_array(-8, 0, 0, 10, 0, -8, 4, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (scaffoldOutcome == SCAFFOLD_OUTCOME_SELECTIVE_JUSTICE) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы судили каждого по делу: кого-то повесили, кого-то пощадили, остальных оштрафовали. Никто больше не может предсказать эшафот — и именно поэтому его уважают. Морвен спит меньше. Вы — немного.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал эшафот", response = "Тогда я пишу «суд». Самое трудное правосудие — и самое честное.", statDeltas = fixed_array(2, 0, 2, 0, 0, 6, 2, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you judged case by case: hanged some, spared others, fined the rest. Nobody can predict the scaffold anymore, and that is exactly why people respect it. Morwen sleeps less. You sleep a little.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the scaffold", response = "Then I write *judgment*. The hardest kind of justice — and the most honest.", statDeltas = fixed_array(2, 0, 2, 0, 0, 6, 2, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_STAR_CHAMBER && beatIdx == 6) {
        if (starChamberOutcome == 1) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, моя башня погасла. Вы отдали мои карты инквизитору, а остальное сожгли. Двор больше не смотрит на небо — он смотрит на вас и на церковь, забравшую мою работу. Небо всё ещё пишет числами. Только читать их некому.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал звёзды", response = "Тогда правьте без знамений. Это труднее, чем кажется.", statDeltas = fixed_array(0, 10, 0, 0, 0, -4, -4, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, my tower is dark. You handed my charts to the inquisitor and burned the rest. The court no longer looks up — it looks at you, and at the church that took my work. Heaven still writes in numbers. Nobody reads them now.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stars", response = "Then rule without omens. It is harder than it sounds.", statDeltas = fixed_array(0, 10, 0, 0, 0, -4, -4, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (starChamberOutcome == 2) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, двор наполовину верит мне, наполовину смеётся. Вы пользовались моими картами, когда они помогали, и забывали о них, когда нет. Звёзды служили вам, как любой другой советник, — иногда.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал звёзды", response = "Тогда я продолжу считать. Однажды числа могут вам понадобиться.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 2, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the court half believes me and half laughs at me. You used my charts when they helped you and ignored them when they did not. The stars served you like any other advisor — sometimes.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stars", response = "Then I keep counting. One day you may need the numbers.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 2, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (starChamberOutcome == 3) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, двести тринадцать дней с тех пор, как моя комета пересекла звёзды Эдвина, — и теперь двор сперва смотрит вверх, а уж потом вниз. Вы провозгласили мои карты, обнародовали знамения и сделали звездочётство королевской должностью. Малрик зовёт это ересью. Знать — мудростью. Башня — обычным вторником.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал звёзды", response = "Тогда правьте по картам и по трону. Пусть они сойдутся в выборе наследника.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 10, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, two hundred and thirteen days since my comet crossed Edwin's stars — and now the court looks up before it looks down. You proclaimed my charts, published my omens, and made astronomy a crown office. Malrik calls it heresy. The nobles call it wisdom. The tower calls it Tuesday.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the stars", response = "Then govern by chart and by chair. May both agree on your heir.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 10, 0, 12)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_PROPHET_WINTER && beatIdx == 5) {
        if (prophetOutcome == 1) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы отдали мой язык инквизитору, и зима прошла без пророка. На площади тихо. Бедняки шепчут мои стихи за закрытыми дверьми. Вы не остановили знамение. Вы просто перестали его слышать.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал последний знак", response = "Тогда правьте в тишине. Тишина тоже пророчествует.", statDeltas = fixed_array(-6, 10, 2, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you gave my tongue to the inquisitor, and the winter went on without a prophet. The square is quiet. The poor whisper my rhymes behind closed doors. You did not stop the omen. You only stopped hearing it.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the last sign", response = "Then rule in silence. Silence also prophesies.", statDeltas = fixed_array(-6, 10, 2, 0, 0, -6, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (prophetOutcome == 2) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, трёхлапый лис на ваших знамёнах, и люди целуют его нарисованные лапы. Вы короновали чудо, которого не благословил ни один священник. Малрик в ярости. Ополчение ворчит. Но у бедняков есть надежда с хвостом — и они говорят, что её дали вы.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал последний знак", response = "Тогда кормите и лиса, и людей. Голодное чудо кусается.", statDeltas = fixed_array(12, -15, -4, 0, 0, 10, 0, 0, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the three-legged fox is on your banners and the people kiss its painted paws. You crowned a miracle no priest blessed. Malrik is furious. The levies grumble. But the poor have hope with a tail, and they say you gave it to them.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the last sign", response = "Then feed the fox and the people both. A hungry miracle bites.", statDeltas = fixed_array(12, -15, -4, 0, 0, 10, 0, 0, -4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (prophetOutcome == 3) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, триста двадцать пять дней с тех пор, как клинок сделал вас королём, а зима — меня вашей тенью. Вы слушали, когда другие повесили бы меня. Улицы зовут вас Зимним Королём — не за жестокость, а за то, что вы слушаете. История срифмует ваше имя.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал последний знак", response = "Тогда продолжайте слушать. Зимы возвращаются. И я тоже.", statDeltas = fixed_array(12, -12, 0, 0, 0, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, three hundred and twenty-five days since a blade made you king and winter made me your shadow. You listened when others would have hanged me. The streets call you the Winter King — not for cruelty, for listening. History will rhyme your name.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the last sign", response = "Then keep listening. Winters return. So do I.", statDeltas = fixed_array(12, -12, 0, 0, 0, 12, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (prophetOutcome == 4) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы запретили мои проповеди, сожгли святилище лиса и назвали ложью каждое знамение. Зима всё равно пришла. Люди не перестали верить — они перестали верить вам.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал последний знак", response = "Тогда последнее знамение — бесплатно: холодный трон — одинокий трон.", statDeltas = fixed_array(-10, 8, 4, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you banned my sermons, burned the fox shrine, and called every omen a lie. The winter came anyway. The people did not stop believing — they stopped believing in you.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the last sign", response = "Then I give you the last omen for free: a cold throne is a lonely throne.", statDeltas = fixed_array(-10, 8, 4, 0, 0, -10, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (prophetOutcome == 5) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы меня не короновали и не раздавили. Всю зиму мои стихи и проповеди Малрика делили площадь, и люди взяли понемногу от каждого. Я всё ещё без имени. Вы всё ещё король. Это своего рода равновесие.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал последний знак", response = "Тогда я уйду вместе со снегом. Ищите меня, когда вернётся кашель.", statDeltas = fixed_array(2, 0, 0, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you neither crowned me nor crushed me. My rhymes and Malrik's sermons shared the square all winter, and the people chose a little of both. I am still unnamed. You are still king. That is a kind of balance.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the last sign", response = "Then I leave with the snow. Look for me when the cough returns.", statDeltas = fixed_array(2, 0, 0, 0, 0, 4, 0, 0, 0)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_COURT_KNIVES && beatIdx == 9) {
        if (knivesOutcome == 1) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, шестьдесят семь дней с предложения Нокса — и теперь двор знает вас по чистке. Стража заменена, писцы повешены, маскам отказано. Страх держит совет в узде. Верность выжила. Тепло — нет.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал двор", response = "Тогда я пишу «железная канцелярия» и надеюсь, что страх переживёт обиду.", statDeltas = fixed_array(0, 0, 10, 0, 0, -4, -4, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, sixty-seven days since Knox's foreign offer — and the court now knows you by the purge. Guards replaced, clerks hanged, masks refused. Fear keeps the council in line. Loyalty survives. Warmth does not.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the court", response = "Then I write *iron chancellery* and hope fear outlasts resentment.", statDeltas = fixed_array(0, 0, 10, 0, 0, -4, -4, 0, 6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (knivesOutcome == 2) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, двор ножей не исчез — он затих. Каких-то шпионов поймали, каким-то скормили ложь, а кто-то всё ещё слушает у дверей. Вы не доверились до конца и не вычистили до конца. Двор шепчется. Осторожно шепчется.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал двор", response = "Тогда держите двери толстыми, а друзей — поближе.", statDeltas = fixed_array(0, 0, 2, 0, 0, 2, 0, 0, 2)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the court of knives did not end — it went quiet. Some spies were caught, some were fed lies, some still listen at doors. You never trusted fully and never purged fully. The court whispers. It whispers carefully.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the court", response = "Then keep your doors thick and your friends close.", statDeltas = fixed_array(0, 0, 2, 0, 0, 2, 0, 0, 2)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (knivesOutcome == 3) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы продали доступ к собственному двору. Чужая монета оплатила список вашего совета, а Нокс теперь работает на того, кто платит больше, — и на вас тоже. Казна полнее. У каждой тайны дворца есть цена, и эта цена всем известна.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал двор", response = "Тогда я пишу «двор внаём». Сдавайте осторожно.", statDeltas = fixed_array(0, 0, -4, 8, 0, -12, 0, 0, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you sold access to your own court. Foreign coin paid for your council roster and Knox now works for whoever pays most — including you. The treasury is fuller. Every secret of this palace has a price, and the price is public.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the court", response = "Then I write *the court for rent*. Lease carefully.", statDeltas = fixed_array(0, 0, -4, 8, 0, -12, 0, 0, -6)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (knivesOutcome == 4) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы оставили Раэну у двери, обновили клятвы и обнародовали честные счета. Шпионам нечего было покупать — почти ничего не скрывалось. Двор вам доверяет. Это опасная роскошь, но вы можете себе её позволить.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал двор", response = "Тогда я пишу «открытые двери». Держите их открытыми — и под охраной.", statDeltas = fixed_array(2, 0, 4, 0, 0, 14, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you kept Raena at your door, reformed the oaths, and published the true ledgers. The spies found little to buy because there was little hidden. Your court trusts you — a dangerous luxury, and you can afford it.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the court", response = "Then I write *open doors*. Keep them open — and guarded.", statDeltas = fixed_array(2, 0, 4, 0, 0, 14, 0, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    if (arcId == ARC_NEPHEW_FOG && beatIdx == 9) {
        if (nephewOutcome == 1) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, племянник Эдвина мёртв — на бумаге. Вырыли могилу, показали тело, подписали запись. Дышит ли мальчик где-то ещё, знает только тот, кто подделал бумаги. Моё последнее знамение коротко: «трон ест имена». Ваше пока цело.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знамение", response = "Тогда молитесь, чтобы могила молчала. У тумана есть родня.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 0, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, Edwin's nephew is dead — on paper. A grave was dug, a body was shown, a record was signed. Whether the boy breathes somewhere else, only the forger knows. My last omen is short: *the chair eats names*. Yours remains — for now.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the omen", response = "Then pray the grave stays quiet. Fog has cousins.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 0, 0, 12)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (nephewOutcome == 2) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, племянник живёт в замке Эшфорд — гость, которому нельзя уйти. Она держит кровь Эдвина, как ключ. Пока вы ей угодны, ключ лежит в её кармане. Моё знамение: «у клетки две двери».",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знамение", response = "Тогда держите Эшфорд рядом. Её карман теперь — часть вашего трона.", statDeltas = fixed_array(0, 0, 0, 0, 0, -2, 10, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the nephew lives in Ashford's castle — a guest who cannot leave. She holds Edwin's blood like a key. As long as you please her, the key stays in her pocket. My omen: *the cage has two doors*.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the omen", response = "Then keep Ashford close. Her pocket is now part of your throne.", statDeltas = fixed_array(0, 0, 0, 0, 0, -2, 10, 0, 4)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (nephewOutcome == 3) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, племянник идёт по северным снегам под знаменем Ингвара. Изгнание — тоже корона: холодная, далёкая и терпеливая. Князья хорошо его воспитают. Однажды они отправят его домой с армией. Моё знамение: «север помнит дни рождения».",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знамение", response = "Тогда заводите друзей на севере — или стройте стены на перевале.", statDeltas = fixed_array(0, 0, 4, 6, 0, -6, 0, 0, -12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the nephew walks the northern snow under Ingvar's banner. Exile is a kind of crown — cold, far, and patient. The princes will raise him well. One day they will send him home with an army. My omen: *the north remembers birthdays*.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the omen", response = "Then make friends in the north, or make walls on the pass.", statDeltas = fixed_array(0, 0, 4, 6, 0, -6, 0, 0, -12)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (nephewOutcome == 4) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, вы позволили королевству узнать правду: племянник Эдвина жив, и его право настоящее. Половина двора восхищается вашей честностью. Другая половина считает дни. Вы не развеяли туман — вы дали ему имя и лицо.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знамение", response = "Тогда завоёвывайте королевство каждый день. Настоящий соперник делает короля хорошим — или мёртвым.", statDeltas = fixed_array(6, 0, 0, 0, 0, 8, 0, 0, -10)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, you let the realm read the truth: Edwin's nephew lives and his claim is real. Half the court admires your honesty. The other half counts days. You did not kill the fog — you gave it a name and a face.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the omen", response = "Then win the realm every day. A true rival makes a good king or a dead one.", statDeltas = fixed_array(6, 0, 0, 0, 0, 8, 0, 0, -10)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
        if (nephewOutcome == 5) {
            if (ru) {
                return DialogueNode(
                    prompt = "Ваше Величество, туман так и не рассеялся. Мальчик может быть жив, мёртв или вовсе не рождён. Вы отрицали, тянули время и перекупали, и королевство устало от вопроса. Ваша история победила кровь Эдвина — не доказательством, а терпением. Моё знамение: «правит тот, кто остаётся».",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Я услышал знамение", response = "Тогда оставайтесь. Это всё, что может король, взявший трон силой.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                )
            }
            return DialogueNode(
                prompt = "Your Majesty, the fog never lifted. The boy may be alive, dead, or never born. You denied, delayed, and outbid, and the realm got tired of the question. Your story beat Edwin's blood — not by proof, but by patience. My omen: *the one who stays, rules*.",
                choiceCount = 1,
                choices = fixed_array(
                    DialogueChoice(choiceText = "I have heard the omen", response = "Then stay. That is all a usurper can do.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, 0, 8)),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                    DialogueChoice(),
                )
            )
        }
    }
    return DialogueNode()
}


def public try_build_arc_finale_node(arcId : int; beatIdx : int; nodeIdx : int) : DialogueNode {
    if (nodeIdx != 0) {
        return DialogueNode()
    }
    return build_outcome_finale_node(arcId, beatIdx)
}

require engine.core
require constants
require dialogue_types
require arc_state
require game_state
require localization public


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
        plagueArcPhase = 1
    } elif (beatIdx == 1) {
        plagueCureProgress += 15
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
    } elif (beatIdx == 8) {
        if (choiceIdx == 0) {
            northernRefugeesAccepted = true
            clamp_northern_trust(10)
        } elif (choiceIdx == 1) {
            northernRefugeesTurnedBack = true
            clamp_northern_trust(-15)
        }
    }
}


def apply_tapestry_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        tapestryLissaChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryLissaCoupNight = true
        }
    } elif (beatIdx == 1) {
        tapestryTilChoice = choiceIdx
        if (choiceIdx == 1) {
            tapestryTilMockCrown = true
        }
    } elif (beatIdx == 2) {
        tapestryGrommChoice = choiceIdx
    } elif (beatIdx == 3) {
        tapestryRaenaChoice = choiceIdx
        if (choiceIdx == 0) {
            tapestryRaenaDoor = true
        }
    } elif (beatIdx == 4) {
        tapestryChamberChoice = choiceIdx
        if (choiceIdx == 1) {
            tapestryChamberUsed = true
        }
    } elif (beatIdx == 6) {
        tapestryKnoxChoice = choiceIdx
        if (choiceIdx == 2) {
            tapestryCoupNarrow = true
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
            clamp_famine_severity(5)
        } else {
            hungryCrownPolicy = HUNGRY_POLICY_RATION
            clamp_famine_severity(12)
        }
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            hungryGrommFeast = true
            clamp_famine_severity(10)
        } elif (choiceIdx == 2) {
            clamp_famine_severity(-6)
        }
    } elif (beatIdx == 2) {
        if (choiceIdx == 0) {
            hungryChurchSoup = true
            clamp_famine_severity(-8)
        } elif (choiceIdx == 2) {
            clamp_famine_severity(10)
        }
    } elif (beatIdx == 4) {
        if (choiceIdx == 1) {
            hungryYarekRiots = true
            clamp_famine_severity(12)
        } elif (choiceIdx == 2) {
            hungryFaraCartel = true
        }
    } elif (beatIdx == 5) {
        if (choiceIdx == 0) {
            hungryFaraCartel = true
            clamp_famine_severity(-8)
        } elif (choiceIdx == 1) {
            clamp_famine_severity(15)
        }
    }
    hungryArcPhase = beatIdx + 1
}


def apply_guild_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        if (choiceIdx == 0) {
            clamp_guild_standing(8)
        } elif (choiceIdx == 2) {
            guildFaraEmbargo = true
            clamp_guild_standing(-15)
        }
    } elif (beatIdx == 1) {
        if (choiceIdx == 0) {
            guildSaltLoan = true
            clamp_guild_standing(5)
        }
    } elif (beatIdx == 2) {
        if (choiceIdx >= 1) {
            guildNeriusCounterfeit = true
        }
    } elif (beatIdx == 6) {
        guildJointUltimatum = true
        if (choiceIdx == 2) {
            clamp_guild_standing(-20)
        }
    } elif (beatIdx == 10) {
        guildCrownStance = choiceIdx
        if (choiceIdx == GUILD_STANCE_PAY) {
            clamp_guild_standing(10)
        } elif (choiceIdx == GUILD_STANCE_DEFAULT) {
            clamp_guild_standing(-25)
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
                forfeitPressure = clamp(forfeitPressure + 15, 0, 100)
            } elif (choiceIdx == 1) {
                forfeitPressure = clamp(forfeitPressure + 25, 0, 100)
            } elif (choiceIdx == 2) {
                forfeitPressure = clamp(forfeitPressure + 10, 0, 100)
            }
        }
        churchArcPhase = beatIdx + 1
        return
    } elif (beatIdx == 3) {
        if (choiceIdx == 2) {
            churchInterdictDeclared = true
        }
    } elif (beatIdx == 8) {
        churchArcStance = choiceIdx
    }
    churchArcPhase = beatIdx + 1
}


def apply_houses_beat_choice(beatIdx : int; choiceIdx : int) {
    if (choiceIdx == 0 && beatIdx >= 2) {
        housesDeadCount += 1
    }
    housesArcPhase = beatIdx + 1
}


def apply_scaffold_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        scaffoldCrownStance = choiceIdx
    }
    if (choiceIdx == 0) {
        scaffoldMercy += 8
    } elif (choiceIdx == 2) {
        scaffoldMercy -= 10
        if (beatIdx >= 3) {
            scaffoldRiotHangings = true
        }
    }
    if (beatIdx == 4 && choiceIdx == 0) {
        scaffoldMassAmnesty = true
        scaffoldMercy += 15
    }
    if (beatIdx == 5 && choiceIdx == 1) {
        scaffoldTalenBribe = true
    }
    scaffoldArcPhase = beatIdx + 1
}


def apply_star_beat_choice(beatIdx : int; choiceIdx : int) {
    if (choiceIdx == 2) {
        starSilenced = true
        starCredibility -= 15
    } elif (choiceIdx == 0) {
        starCredibility += 8
        starCrownStance = 0
    }
    starChamberArcPhase = beatIdx + 1
}


def apply_knives_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 0) {
        knivesCrownStance = choiceIdx
    }
    if (beatIdx == 3 && choiceIdx == 0) {
        knivesKnoxOffer = true
        courtTrust -= 10
    }
    if (beatIdx == 5 && choiceIdx == 1) {
        knivesTalenTriple = true
    }
    if (beatIdx == 2 && choiceIdx == 0) {
        knivesVarnPurge = true
        courtTrust -= 15
    }
    if (choiceIdx == 0) {
        courtTrust += 5
    } elif (choiceIdx == 2) {
        courtTrust -= 8
    }
    knivesArcPhase = beatIdx + 1
}


def apply_nephew_beat_choice(beatIdx : int; choiceIdx : int) {
    if (beatIdx == 2 && choiceIdx == 0) {
        heirIngvarBid = true
    }
    if (beatIdx == 4) {
        heirCrownStance = choiceIdx
        if (choiceIdx == 2) {
            heirNephewAlive = false
        }
    }
    if (choiceIdx == 0) {
        heirCredibility += 8
    } elif (choiceIdx == 2) {
        heirCredibility -= 10
    }
    nephewArcPhase = beatIdx + 1
}


def apply_prophet_beat_choice(beatIdx : int; choiceIdx : int) {
    if (choiceIdx == 2) {
        prophetSilenced = true
        prophetFavor -= 15
    } elif (choiceIdx == 0) {
        prophetFavor += 10
        if (beatIdx == 2) {
            prophetFoxCult = true
        }
    } elif (choiceIdx == 1) {
        prophetFavor += 5
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
    if (guildStanding >= 35 && guildCrownStance == GUILD_STANCE_PAY) {
        guildOutcome = GUILD_OUTCOME_SOUND_TREASURY
    } elif (guildJointUltimatum && guildStanding <= -35) {
        guildOutcome = GUILD_OUTCOME_DEBT_CROWN
    } elif (guildSaltLoan && guildStanding <= -20) {
        guildOutcome = GUILD_OUTCOME_MERCHANT_THRONE
    } elif (guildNeriusCounterfeit) {
        guildOutcome = GUILD_OUTCOME_COUNTERFEIT_CRISIS
    } elif (guildFaraEmbargo) {
        guildOutcome = GUILD_OUTCOME_GUILD_REPUBLIC
    } else {
        guildOutcome = GUILD_OUTCOME_MANAGED_DEBT
    }
    guildArcPhase = 2
}


def compute_church_outcome() {
    if (churchArcStance == CHURCH_STANCE_SCHISM) {
        churchOutcome = CHURCH_OUTCOME_SCHISM_KING
    } elif (churchInterdictDeclared) {
        churchOutcome = CHURCH_OUTCOME_SECULAR_CROWN
    } elif (churchArcStance == CHURCH_STANCE_SUBMIT && forfeitPressure < 50) {
        churchOutcome = CHURCH_OUTCOME_ANOINTED_USURPER
    } elif (churchArcStance == CHURCH_STANCE_BARGAIN) {
        churchOutcome = CHURCH_OUTCOME_PUPPET_THRONE
    } elif (forfeitPressure >= 80) {
        churchOutcome = CHURCH_OUTCOME_FORFEIT_SURVIVED
    } else {
        churchOutcome = CHURCH_OUTCOME_PUPPET_THRONE
    }
    churchArcPhase = 2
}


def compute_houses_outcome() {
    if (housesDeadCount >= 4) {
        housesOutcome = HOUSES_OUTCOME_SHATTERED_PEERAGE
    } elif (housesDeadCount == 0) {
        housesOutcome = HOUSES_OUTCOME_BLOODLESS_LEDGER
    } elif (housesDeadCount >= 3) {
        housesOutcome = HOUSES_OUTCOME_ASHFORD_ASCENDANT
    } else {
        housesOutcome = HOUSES_OUTCOME_LANDLESS_FURY
    }
    housesArcPhase = 2
}


def compute_scaffold_outcome() {
    if (scaffoldMercy <= -35 && scaffoldRiotHangings) {
        scaffoldOutcome = SCAFFOLD_OUTCOME_BLOODY_PEACE
    } elif (scaffoldMercy >= 35 && scaffoldMassAmnesty) {
        scaffoldOutcome = SCAFFOLD_OUTCOME_MERCY_CROWN
    } elif (scaffoldTalenBribe && scaffoldCrownStance == 1) {
        scaffoldOutcome = SCAFFOLD_OUTCOME_MORWENS_REPUBLIC
    } else {
        scaffoldOutcome = SCAFFOLD_OUTCOME_SELECTIVE_JUSTICE
    }
    scaffoldArcPhase = 2
}


def compute_star_outcome() {
    if (starSilenced || starCredibility <= -35) {
        starChamberOutcome = 1
    } elif (starCredibility >= 35) {
        starChamberOutcome = 3
    } else {
        starChamberOutcome = 1
    }
    starChamberArcPhase = 2
}


def compute_knives_outcome() {
    if (courtTrust <= -35 && knivesVarnPurge) {
        knivesOutcome = 1
    } elif (courtTrust <= -20 && knivesKnoxOffer) {
        knivesOutcome = 3
    } elif (courtTrust >= 20) {
        knivesOutcome = 4
    } else {
        knivesOutcome = 4
    }
    knivesArcPhase = 2
}


def compute_nephew_outcome() {
    if (!heirNephewAlive) {
        nephewOutcome = 1
    } elif (heirIngvarBid && heirCrownStance == 2) {
        nephewOutcome = 3
    } else {
        nephewOutcome = 5
    }
    nephewArcPhase = 2
}


def compute_prophet_outcome() {
    if (prophetSilenced) {
        prophetOutcome = 1
    } elif (prophetFoxCult && prophetFavor >= 20) {
        prophetOutcome = 2
    } elif (prophetFavor >= 35) {
        prophetOutcome = 3
    } elif (prophetFavor <= -35) {
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
    } elif (tapestryKnoxServants || tapestryTilMockCrown) {
        tapestryOutcome = 4
    } elif (householdOutcome == HOUSEHOLD_OUTCOME_HAUNTED) {
        tapestryOutcome = 3
    } elif (tapestryTrust >= 20) {
        tapestryOutcome = 1
    } else {
        tapestryOutcome = 1
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
    } elif (arcId == ARC_PLAGUE_CURE && beatIdx == 28) {
        compute_plague_outcome()
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


def public try_build_arc_finale_node(arcId : int; beatIdx : int; nodeIdx : int) : DialogueNode {
    if (nodeIdx != 0) {
        return DialogueNode()
    }
    if (arcId == ARC_HOUSEHOLD && beatIdx == 7) {
        return build_household_finale_node()
    }
    return DialogueNode()
}

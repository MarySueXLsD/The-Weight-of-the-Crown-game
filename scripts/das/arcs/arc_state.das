require engine.core
require scripts/das/core/constants
module arc_state public


// ---- Old King's Household ----
var public householdStance = 0
var public householdTone = 0
var public householdConsistency = 50
var public householdKeptGromm = false
var public householdWatchedGromm = false
var public householdPurgedGuards = false
var public householdCutClerks = false
var public householdShelteredConfessor = false
var public householdChurchDeal = false
var public householdSelenaBribe = false
var public householdVeteranPurge = false
var public householdSelectiveGuards = false
var public householdFeastChoice = -1
var public householdOutcome = 0
var public householdArcPhase = 0

// ---- Below the Tapestry ----
var public tapestryTrust = 0
var public tapestryOutcome = 0
var public tapestryArcPhase = 0

// ---- Empty Purse ----
var public purseStance = 0
var public purseOutcome = 0
var public purseArcPhase = 0

// ---- Hungry Season ----
var public hungryArcPhase = 0
var public hungryOutcome = 0
var public famineSeverity = 10
var public hungryCrownPolicy = -1
var public hungryChurchSoup = false
var public hungryFaraCartel = false
var public hungryYarekRiots = false
var public hungryGrommFeast = false

// ---- Guild Compact ----
var public guildOutcome = 0
var public guildArcPhase = 0
var public guildStanding = 0
var public guildCrownStance = -1
var public guildFaraEmbargo = false
var public guildSaltLoan = false
var public guildNeriusCounterfeit = false
var public guildJointUltimatum = false

// ---- Church Crown ----
var public churchStance = 0
var public churchOutcome = 0
var public churchArcPhase = 0
var public churchArcStance = -1
var public churchInterdictDeclared = false
var public forfeitPressure = 0

// ---- Northern Price ----
var public northernTrust = 0
var public northernWarStage = 0
var public northernOutcome = 0
var public northernArcPhase = 0
var public northernEnvoyChoice = -1
var public northernBorderChoice = -1
var public northernFaithChoice = -1
var public northernKnoxChoice = -1
var public northernAllianceChoice = -1
var public northernTributePaid = false
var public northernAllianceSigned = false
var public northernWarDeclared = false
var public northernRefugeesAccepted = false
var public northernRefugeesTurnedBack = false

// ---- Below the Tapestry ----
var public tapestryLissaChoice = -1
var public tapestryTilChoice = -1
var public tapestryGrommChoice = -1
var public tapestryRaenaChoice = -1
var public tapestryChamberChoice = -1
var public tapestryKnoxChoice = -1
var public tapestryChamberUsed = false
var public tapestryLissaCoupNight = false
var public tapestryTilMockCrown = false
var public tapestryRaenaDoor = false
var public tapestryKnoxServants = false
var public tapestryCoupNarrow = false
var public tapestryCrownStance = 0

// ---- Empty Purse ----
var public emptyPurseDay11Choice = -1
var public emptyPurseBorvinChoice = -1
var public emptyPurseFinnChoice = -1
var public emptyPurseSaltLoan = false
var public emptyPurseFinnAmnesty = false
var public emptyPurseKaraCrown = false
var public emptyPurseOttoSworn = false
var public emptyPurseCrisis = false
var public armyPayTrust = 0

// ---- Tapestry / other arc beat tracking ----
var public northernAshfordLinked = false

// ---- Great Houses ----
var public housesOutcome = 0
var public housesArcPhase = 0
var public housesDeadCount = 0
var public housesAliveAshford = true
var public housesAliveKaspar = true
var public housesAliveDell = true
var public housesAliveCrow = true
var public housesAliveRaymond = true
var public housesAliveGoose = true

// ---- Scaffold's Ledger ----
var public scaffoldOutcome = 0
var public scaffoldArcPhase = 0
var public scaffoldMercy = 0
var public scaffoldCrownStance = -1
var public scaffoldRiotHangings = false
var public scaffoldMassAmnesty = false
var public scaffoldTalenBribe = false

// ---- Star Chamber ----
var public starChamberOutcome = 0
var public starChamberArcPhase = 0
var public starCredibility = 0
var public starSilenced = false
var public starCrownStance = -1

// ---- Prophet's Winter ----
var public prophetFavor = 0
var public prophetOutcome = 0
var public prophetArcPhase = 0
var public prophetSilenced = false
var public prophetFoxCult = false

// ---- Court of Knives ----
var public courtTrust = 0
var public knivesArcPhase = 0
var public knivesOutcome = 0
var public knivesCrownStance = -1
var public knivesKnoxOffer = false
var public knivesTalenTriple = false
var public knivesVarnPurge = false

// ---- Nephew in the Fog ----
var public heirCredibility = 0
var public nephewOutcome = 0
var public nephewArcPhase = 0
var public heirCrownStance = -1
var public heirNephewAlive = true
var public heirIngvarBid = false

// ---- Grey Lung Cure ----
var public plagueFundingPath = 0
var public plagueCureProgress = 0
var public plagueOutcome = 0
var public plagueArcPhase = 0

// ---- People unlock tone ----
var public peopleUnlockTone = 0


def public reset_arc_state() {
    householdStance = 0
    householdTone = 0
    householdConsistency = 50
    householdKeptGromm = false
    householdWatchedGromm = false
    householdPurgedGuards = false
    householdCutClerks = false
    householdShelteredConfessor = false
    householdChurchDeal = false
    householdSelenaBribe = false
    householdVeteranPurge = false
    householdSelectiveGuards = false
    householdFeastChoice = -1
    householdOutcome = 0
    householdArcPhase = 0
    tapestryTrust = 0
    tapestryOutcome = 0
    tapestryArcPhase = 0
    purseStance = 0
    purseOutcome = 0
    purseArcPhase = 0
    hungryArcPhase = 0
    hungryOutcome = 0
    famineSeverity = 10
    hungryCrownPolicy = -1
    hungryChurchSoup = false
    hungryFaraCartel = false
    hungryYarekRiots = false
    hungryGrommFeast = false
    guildOutcome = 0
    guildArcPhase = 0
    guildStanding = 0
    guildCrownStance = -1
    guildFaraEmbargo = false
    guildSaltLoan = false
    guildNeriusCounterfeit = false
    guildJointUltimatum = false
    churchStance = 0
    churchOutcome = 0
    churchArcPhase = 0
    churchArcStance = -1
    churchInterdictDeclared = false
    forfeitPressure = 0
    northernTrust = 0
    northernWarStage = 0
    northernOutcome = 0
    northernArcPhase = 0
    northernEnvoyChoice = -1
    northernBorderChoice = -1
    northernFaithChoice = -1
    northernKnoxChoice = -1
    northernAllianceChoice = -1
    northernTributePaid = false
    northernAllianceSigned = false
    northernWarDeclared = false
    northernRefugeesAccepted = false
    northernRefugeesTurnedBack = false
    northernAshfordLinked = false
    tapestryLissaChoice = -1
    tapestryTilChoice = -1
    tapestryGrommChoice = -1
    tapestryRaenaChoice = -1
    tapestryChamberChoice = -1
    tapestryKnoxChoice = -1
    tapestryChamberUsed = false
    tapestryLissaCoupNight = false
    tapestryTilMockCrown = false
    tapestryRaenaDoor = false
    tapestryKnoxServants = false
    tapestryCoupNarrow = false
    tapestryCrownStance = 0
    emptyPurseDay11Choice = -1
    emptyPurseBorvinChoice = -1
    emptyPurseFinnChoice = -1
    emptyPurseSaltLoan = false
    emptyPurseFinnAmnesty = false
    emptyPurseKaraCrown = false
    emptyPurseOttoSworn = false
    emptyPurseCrisis = false
    armyPayTrust = 0
    housesOutcome = 0
    housesArcPhase = 0
    housesDeadCount = 0
    housesAliveAshford = true
    housesAliveKaspar = true
    housesAliveDell = true
    housesAliveCrow = true
    housesAliveRaymond = true
    housesAliveGoose = true
    scaffoldOutcome = 0
    scaffoldArcPhase = 0
    scaffoldMercy = 0
    scaffoldCrownStance = -1
    scaffoldRiotHangings = false
    scaffoldMassAmnesty = false
    scaffoldTalenBribe = false
    starChamberOutcome = 0
    starChamberArcPhase = 0
    starCredibility = 0
    starSilenced = false
    starCrownStance = -1
    prophetFavor = 0
    prophetOutcome = 0
    prophetArcPhase = 0
    prophetSilenced = false
    prophetFoxCult = false
    courtTrust = 0
    knivesArcPhase = 0
    knivesOutcome = 0
    knivesCrownStance = -1
    knivesKnoxOffer = false
    knivesTalenTriple = false
    knivesVarnPurge = false
    heirCredibility = 0
    nephewOutcome = 0
    nephewArcPhase = 0
    heirCrownStance = -1
    heirNephewAlive = true
    heirIngvarBid = false
    plagueFundingPath = 0
    plagueCureProgress = 0
    plagueOutcome = 0
    plagueArcPhase = 0
    peopleUnlockTone = 0
}

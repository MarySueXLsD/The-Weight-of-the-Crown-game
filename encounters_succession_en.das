require engine.core
require constants
require dialogue_types

module encounters_succession_en public

let public allEncountersEnSuccession : Encounter[POOL_SUCCESSION_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Name a loyal general as heir.", response = "Steel inherits. Bloodlines scream heresy.", statDeltas = fixed_array(-8, 10, 15, 0, 0, 5, -10, 0, 12)),
            DialogueChoice(choiceText = "Refuse", response = "Defiance. Succession whispers grow teeth.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, 15)),
            DialogueChoice(choiceText = "Adopt a distant cousin quietly.", response = "Paper heir. Fragile peace.", statDeltas = fixed_array(0, 5, 0, -10, 0, 5, 12, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise the throne passes by council vote.", response = "Institutional answer. Weak kings like it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 8, 0, 10)),
            DialogueChoice(choiceText = "Declare no heir", response = "Blunt threat. War more likely.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, 18)),
            DialogueChoice(choiceText = "Offer marriage tie to their bloodline.", response = "Diplomatic heir. Expensive tomorrow.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 6)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pursue election by great houses.", response = "Lawful rule bought with votes. Ashford smiles.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Pursue blood", response = "Desperate heraldry. Succession stabilizes, maybe.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 12)),
            DialogueChoice(choiceText = "Keep conquest", response = "Honest brutality. Future uncertain.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 15)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_PROPHET,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the prophet speaks without being asked: 'When the king who took the throne names no heir, the realm names three.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hear him in private.", response = "Omen noted. Court nervous.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Arrest him for threatening succession.", response = "Silence purchased. Rumors cheaper.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, 12)),
            DialogueChoice(choiceText = "Name a public heir to contradict him.", response = "Theatre answer. Stability or target acquired.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, -5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Adopt the star-named child.", response = "Myth becomes policy. Peasants cheer.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Dismiss astrology from state business.", response = "Rational crown. Superstitious unrest.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Pay for a private chart only.", response = "Secrets in heaven. Leaks on earth.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise reform", response = "Hope sold. Enemies price it.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 12)),
            DialogueChoice(choiceText = "Promise blood", response = "Hard answer. Stability through fear.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 15)),
            DialogueChoice(choiceText = "Promise nothing", response = "Mystery maintained. Anxiety spreads.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 10)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the duke who calls himself a goose demands succession rights because his house 'laid the golden egg of the treasury.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant a ceremonial title", response = "Absurdity buys peace. Chroniclers weep.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Throw him from court.", response = "Laughter and danger. He may return meaner.", statDeltas = fixed_array(0, 0, 3, 0, 0, -3, -5, 0, 8)),
            DialogueChoice(choiceText = "Make him regent of the poultry accounts.", response = "Joke becomes office. Surprisingly loyal bird.", statDeltas = fixed_array(5, 0, 0, 8, 0, 8, 3, 5, 3)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Ilana will publish your succession table unless you approve the chapter. She has three drafts — blood, blade, and bargain.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Approve blood chapter.", response = "Dynasty narrative. Rivals mobilize.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 10, 0, 12)),
            DialogueChoice(choiceText = "Approve blade chapter.", response = "Honest usurper myth. Honest unrest.", statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, -5, 0, 15)),
            DialogueChoice(choiceText = "Approve bargain chapter.", response = "Election fiction. Houses preen.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 12, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Talen sells a rumor that you have named a secret heir. Buy the rumor, spread it, or let it run?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy and bury the rumor.", response = "Quiet coin. Loud questions remain.", statDeltas = fixed_array(0, 0, 0, -15, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Spread the rumor", response = "False heir protects true throne. Fragile trick.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 5, 0, 10)),
            DialogueChoice(choiceText = "Deny publicly and hunt the source.", response = "Chaos contained. Court sweats.", statDeltas = fixed_array(0, 0, 5, 0, 0, 10, 0, 0, 12)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Ingvar offers to recognize your heir if you recognize his prince's claim to a border duchy after your death.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept", response = "Future sold for present calm.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 5, 0, -8)),
            DialogueChoice(choiceText = "Refuse", response = "Pride intact. Northern knives sharpen.", statDeltas = fixed_array(0, 0, 10, 0, 0, 5, 0, 0, 15)),
            DialogueChoice(choiceText = "Counter", response = "Diplomatic draw. Both sides grumble.", statDeltas = fixed_array(3, 0, 5, 0, 0, 5, 3, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Malrik says the cathedral vault holds Edwin's will — unread since the coup. Open it or burn it?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Open the will publicly.", response = "Truth ritual. Succession chaos possible.", statDeltas = fixed_array(0, 12, 0, 0, 0, 0, -8, 0, 15)),
            DialogueChoice(choiceText = "Read privately then decide.", response = "Knowledge is leverage. Suspicion grows.", statDeltas = fixed_array(0, 5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Burn it unopened.", response = "Peace of ignorance. Hell gets the paperwork.", statDeltas = fixed_array(0, -10, 5, 0, 0, -5, 5, 0, 12)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Arvel says the poor pray for 'a name after the king who took the throne.' Give them a name or give them bread?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Announce a public heir.", response = "Name given. Target acquired.", statDeltas = fixed_array(8, 5, 0, 0, 0, 8, 0, -5, 10)),
            DialogueChoice(choiceText = "Announce grain instead of heirs.", response = "Bread now. Succession later.", statDeltas = fixed_array(12, 0, 0, -12, 0, 5, 0, 15, 5)),
            DialogueChoice(choiceText = "Announce both", response = "Grand gesture. Expensive faith.", statDeltas = fixed_array(10, 5, 0, -18, 0, 10, 5, 10, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Rudolf wants the succession law to favor generals. The nobles want blood. The church wants rites. You want sleep.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Military succession clause.", response = "Army content. Elite furious.", statDeltas = fixed_array(-5, 0, 15, 0, 0, 5, -12, 0, 12)),
            DialogueChoice(choiceText = "Noble blood clause.", response = "Houses content. Soldiers wary.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 15, 0, 10)),
            DialogueChoice(choiceText = "Church rite clause.", response = "Altar binds succession. Crown shares power.", statDeltas = fixed_array(0, 15, 0, 0, 0, 5, 5, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_ILANA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Borvin proposes taxing empty succession titles — lords pay to keep hypothetical heirs on paper.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Enact the tax.", response = "Treasury laughs. Nobility plots.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
            DialogueChoice(choiceText = "Reject", response = "Respect bought. Gold lost.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Tax only foreign claimants.", response = "Narrow policy. Ingvar annoyed.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, 3, 0, 10)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_ASHFORD,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Mira tends a feverish lord who mutters Edwin's nephew's name. Save him and hear prophecy, or let fever finish the sentence?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Save him", response = "Life bought. Succession rumor strengthened.", statDeltas = fixed_array(0, 0, 0, -5, 10, 5, 0, 0, 12)),
            DialogueChoice(choiceText = "Let nature finish", response = "Hard choice. Whispers call it murder.", statDeltas = fixed_array(-8, 0, 0, 0, 0, -5, 0, 0, 8)),
            DialogueChoice(choiceText = "Save him but isolate from court.", response = "Middle path. Secrets in the sickroom.", statDeltas = fixed_array(0, 0, 0, -8, 8, 8, 0, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Varn found succession pamphlets in the barracks. Hang the printers, burn the pamphlets, or rewrite them with your heir?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the printers.", response = "Fear stills presses. Martyrs possible.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 8, 0, 0, 10)),
            DialogueChoice(choiceText = "Burn pamphlets only.", response = "Softer censorship. Ideas smolder.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Publish crown pamphlet answering them.", response = "War of words. Succession debated openly.", statDeltas = fixed_array(5, 0, 0, -10, 0, 8, 5, 0, 12)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Ashford offers to make lawful your line through her house's blood — if succession names her nephew as regent.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept regency bargain.", response = "Succession tethered to Ashford. Peace costly.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 18, 0, -5)),
            DialogueChoice(choiceText = "Refuse", response = "Independence kept. Eastern threat returns.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, -10, 0, 15)),
            DialogueChoice(choiceText = "Counter", response = "Half alliance. Half insult.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 10, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Name a loyal general as heir.", response = "Steel inherits. Bloodlines scream heresy.", statDeltas = fixed_array(-8, 10, 15, 0, 0, 5, -10, 0, 12)),
            DialogueChoice(choiceText = "Refuse", response = "Defiance. Succession whispers grow teeth.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, 15)),
            DialogueChoice(choiceText = "Adopt a distant cousin quietly.", response = "Paper heir. Fragile peace.", statDeltas = fixed_array(0, 5, 0, -10, 0, 5, 12, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise the throne passes by council vote.", response = "Institutional answer. Weak kings like it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 8, 0, 10)),
            DialogueChoice(choiceText = "Declare no heir", response = "Blunt threat. War more likely.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, 18)),
            DialogueChoice(choiceText = "Offer marriage tie to their bloodline.", response = "Diplomatic heir. Expensive tomorrow.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 6)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pursue election by great houses.", response = "Lawful rule bought with votes. Ashford smiles.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Pursue blood", response = "Desperate heraldry. Succession stabilizes, maybe.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 12)),
            DialogueChoice(choiceText = "Keep conquest", response = "Honest brutality. Future uncertain.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 15)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the prophet speaks without being asked: 'When the king who took the throne names no heir, the realm names three.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hear him in private.", response = "Omen noted. Court nervous.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Arrest him for threatening succession.", response = "Silence purchased. Rumors cheaper.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, 12)),
            DialogueChoice(choiceText = "Name a public heir to contradict him.", response = "Theatre answer. Stability or target acquired.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, -5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Adopt the star-named child.", response = "Myth becomes policy. Peasants cheer.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Dismiss astrology from state business.", response = "Rational crown. Superstitious unrest.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Pay for a private chart only.", response = "Secrets in heaven. Leaks on earth.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise reform", response = "Hope sold. Enemies price it.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 12)),
            DialogueChoice(choiceText = "Promise blood", response = "Hard answer. Stability through fear.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 15)),
            DialogueChoice(choiceText = "Promise nothing", response = "Mystery maintained. Anxiety spreads.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 10)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the duke who calls himself a goose demands succession rights because his house 'laid the golden egg of the treasury.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant a ceremonial title", response = "Absurdity buys peace. Chroniclers weep.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Throw him from court.", response = "Laughter and danger. He may return meaner.", statDeltas = fixed_array(0, 0, 3, 0, 0, -3, -5, 0, 8)),
            DialogueChoice(choiceText = "Make him regent of the poultry accounts.", response = "Joke becomes office. Surprisingly loyal bird.", statDeltas = fixed_array(5, 0, 0, 8, 0, 8, 3, 5, 3)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Ilana will publish your succession table unless you approve the chapter. She has three drafts — blood, blade, and bargain.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Approve blood chapter.", response = "Dynasty narrative. Rivals mobilize.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 10, 0, 12)),
            DialogueChoice(choiceText = "Approve blade chapter.", response = "Honest usurper myth. Honest unrest.", statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, -5, 0, 15)),
            DialogueChoice(choiceText = "Approve bargain chapter.", response = "Election fiction. Houses preen.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 12, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Talen sells a rumor that you have named a secret heir. Buy the rumor, spread it, or let it run?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy and bury the rumor.", response = "Quiet coin. Loud questions remain.", statDeltas = fixed_array(0, 0, 0, -15, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Spread the rumor", response = "False heir protects true throne. Fragile trick.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 5, 0, 10)),
            DialogueChoice(choiceText = "Deny publicly and hunt the source.", response = "Chaos contained. Court sweats.", statDeltas = fixed_array(0, 0, 5, 0, 0, 10, 0, 0, 12)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Ingvar offers to recognize your heir if you recognize his prince's claim to a border duchy after your death.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept", response = "Future sold for present calm.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 5, 0, -8)),
            DialogueChoice(choiceText = "Refuse", response = "Pride intact. Northern knives sharpen.", statDeltas = fixed_array(0, 0, 10, 0, 0, 5, 0, 0, 15)),
            DialogueChoice(choiceText = "Counter", response = "Diplomatic draw. Both sides grumble.", statDeltas = fixed_array(3, 0, 5, 0, 0, 5, 3, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Malrik says the cathedral vault holds Edwin's will — unread since the coup. Open it or burn it?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Open the will publicly.", response = "Truth ritual. Succession chaos possible.", statDeltas = fixed_array(0, 12, 0, 0, 0, 0, -8, 0, 15)),
            DialogueChoice(choiceText = "Read privately then decide.", response = "Knowledge is leverage. Suspicion grows.", statDeltas = fixed_array(0, 5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Burn it unopened.", response = "Peace of ignorance. Hell gets the paperwork.", statDeltas = fixed_array(0, -10, 5, 0, 0, -5, 5, 0, 12)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_ILANA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Arvel says the poor pray for 'a name after the king who took the throne.' Give them a name or give them bread?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Announce a public heir.", response = "Name given. Target acquired.", statDeltas = fixed_array(8, 5, 0, 0, 0, 8, 0, -5, 10)),
            DialogueChoice(choiceText = "Announce grain instead of heirs.", response = "Bread now. Succession later.", statDeltas = fixed_array(12, 0, 0, -12, 0, 5, 0, 15, 5)),
            DialogueChoice(choiceText = "Announce both", response = "Grand gesture. Expensive faith.", statDeltas = fixed_array(10, 5, 0, -18, 0, 10, 5, 10, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_ASHFORD,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Rudolf wants the succession law to favor generals. The nobles want blood. The church wants rites. You want sleep.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Military succession clause.", response = "Army content. Elite furious.", statDeltas = fixed_array(-5, 0, 15, 0, 0, 5, -12, 0, 12)),
            DialogueChoice(choiceText = "Noble blood clause.", response = "Houses content. Soldiers wary.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 15, 0, 10)),
            DialogueChoice(choiceText = "Church rite clause.", response = "Altar binds succession. Crown shares power.", statDeltas = fixed_array(0, 15, 0, 0, 0, 5, 5, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Borvin proposes taxing empty succession titles — lords pay to keep hypothetical heirs on paper.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Enact the tax.", response = "Treasury laughs. Nobility plots.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
            DialogueChoice(choiceText = "Reject", response = "Respect bought. Gold lost.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Tax only foreign claimants.", response = "Narrow policy. Ingvar annoyed.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, 3, 0, 10)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Mira tends a feverish lord who mutters Edwin's nephew's name. Save him and hear prophecy, or let fever finish the sentence?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Save him", response = "Life bought. Succession rumor strengthened.", statDeltas = fixed_array(0, 0, 0, -5, 10, 5, 0, 0, 12)),
            DialogueChoice(choiceText = "Let nature finish", response = "Hard choice. Whispers call it murder.", statDeltas = fixed_array(-8, 0, 0, 0, 0, -5, 0, 0, 8)),
            DialogueChoice(choiceText = "Save him but isolate from court.", response = "Middle path. Secrets in the sickroom.", statDeltas = fixed_array(0, 0, 0, -8, 8, 8, 0, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Varn found succession pamphlets in the barracks. Hang the printers, burn the pamphlets, or rewrite them with your heir?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the printers.", response = "Fear stills presses. Martyrs possible.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 8, 0, 0, 10)),
            DialogueChoice(choiceText = "Burn pamphlets only.", response = "Softer censorship. Ideas smolder.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Publish crown pamphlet answering them.", response = "War of words. Succession debated openly.", statDeltas = fixed_array(5, 0, 0, -10, 0, 8, 5, 0, 12)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_ARVEL,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Ashford offers to make lawful your line through her house's blood — if succession names her nephew as regent.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept regency bargain.", response = "Succession tethered to Ashford. Peace costly.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 18, 0, -5)),
            DialogueChoice(choiceText = "Refuse", response = "Independence kept. Eastern threat returns.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, -10, 0, 15)),
            DialogueChoice(choiceText = "Counter", response = "Half alliance. Half insult.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 10, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the church demands a succession rite — name an heir or they will name your reign temporary in the liturgy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Name a loyal general as heir.", response = "Steel inherits. Bloodlines scream heresy.", statDeltas = fixed_array(-8, 10, 15, 0, 0, 5, -10, 0, 12)),
            DialogueChoice(choiceText = "Refuse", response = "Defiance. Succession whispers grow teeth.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, 15)),
            DialogueChoice(choiceText = "Adopt a distant cousin quietly.", response = "Paper heir. Fragile peace.", statDeltas = fixed_array(0, 5, 0, -10, 0, 5, 12, 0, 8)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, northern princes ask who inherits if you die in spring campaign. They want the answer before they decide friend or foe.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise the throne passes by council vote.", response = "Institutional answer. Weak kings like it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 8, 0, 10)),
            DialogueChoice(choiceText = "Declare no heir", response = "Blunt threat. War more likely.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, 18)),
            DialogueChoice(choiceText = "Offer marriage tie to their bloodline.", response = "Diplomatic heir. Expensive tomorrow.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 6)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Edric says the law books list three succession paths — blood, election, and conquest. You have used only the third.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pursue election by great houses.", response = "Lawful rule bought with votes. Ashford smiles.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Pursue blood", response = "Desperate heraldry. Succession stabilizes, maybe.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 12)),
            DialogueChoice(choiceText = "Keep conquest", response = "Honest brutality. Future uncertain.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 15)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the prophet speaks without being asked: 'When the king who took the throne names no heir, the realm names three.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hear him in private.", response = "Omen noted. Court nervous.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Arrest him for threatening succession.", response = "Silence purchased. Rumors cheaper.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, 12)),
            DialogueChoice(choiceText = "Name a public heir to contradict him.", response = "Theatre answer. Stability or target acquired.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, -5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the astrologer charts a void in the succession house — he offers to fill it with a star-named child from the provinces.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Adopt the star-named child.", response = "Myth becomes policy. Peasants cheer.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Dismiss astrology from state business.", response = "Rational crown. Superstitious unrest.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Pay for a private chart only.", response = "Secrets in heaven. Leaks on earth.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 5)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the masked stranger returns — not for council, but to ask what you will leave when the fog lifts from your reign.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise reform", response = "Hope sold. Enemies price it.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 12)),
            DialogueChoice(choiceText = "Promise blood", response = "Hard answer. Stability through fear.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 15)),
            DialogueChoice(choiceText = "Promise nothing", response = "Mystery maintained. Anxiety spreads.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 10)),
            DialogueChoice(),
            DialogueChoice(),
            )
        ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode(),
        )
    )
)

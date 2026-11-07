require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
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
            DialogueChoice(choiceText = "Refuse to name an heir", response = "Defiance. The whispers about succession grow teeth.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, -8)),
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
            DialogueChoice(choiceText = "Declare that I need no heir", response = "Blunt threat. War more likely.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, -6)),
            DialogueChoice(choiceText = "Offer marriage tie to their bloodline.", response = "Diplomatic heir. Expensive tomorrow.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 10)),
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
            prompt = "Your Majesty, the law books list three paths to the throne: blood, election, and conquest. You have used only the third. A dynasty needs one of the other two.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pursue election by great houses.", response = "Lawful rule bought with votes. Ashford smiles.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Pursue blood", response = "Desperate heraldry. Succession stabilizes, maybe.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 8)),
            DialogueChoice(choiceText = "Keep conquest", response = "Honest brutality. Future uncertain.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 2)),
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
            prompt = "Your Majesty, the prophet speaks without being asked: 'When the usurper names no heir, the realm names three.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hear him in private.", response = "Omen noted. Court nervous.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 2)),
            DialogueChoice(choiceText = "Arrest him for threatening succession.", response = "Silence purchased. Rumors cheaper.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, -2)),
            DialogueChoice(choiceText = "Name a public heir to contradict him.", response = "Theatre answer. Stability or target acquired.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, 10)),
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
        characterIdx = CHAR_WIZARD,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, my charts show a void in the house of succession. I can fill it: a child born under a bright star in the provinces. Adopt the star-child, and the people will call it fate.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Adopt the star-named child.", response = "Myth becomes policy. Peasants cheer.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Dismiss astrology from state business.", response = "Rational crown. Superstitious unrest.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, -2)),
            DialogueChoice(choiceText = "Pay for a private chart only.", response = "Secrets in heaven. Leaks on earth.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 0)),
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
            prompt = "Your Majesty, the masked stranger has come back — not for the council this time. He asks what you will leave behind when the fog lifts from your reign.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise reform", response = "Hope sold. Enemies price it.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 8)),
            DialogueChoice(choiceText = "Promise blood", response = "Hard answer. Stability through fear.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 4)),
            DialogueChoice(choiceText = "Promise nothing", response = "Mystery maintained. Anxiety spreads.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, -6)),
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
        characterIdx = CHAR_GOOSE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, my house demands a place in the line of succession. After all, we laid the golden egg that fills your treasury. Ask Borvin. Actually, do not ask Borvin.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant a ceremonial title", response = "Absurdity buys peace. Chroniclers weep.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 0)),
            DialogueChoice(choiceText = "Throw him from court.", response = "Laughter and danger. He may return meaner.", statDeltas = fixed_array(-2, 0, 3, 0, 0, -3, -5, 0, 0)),
            DialogueChoice(choiceText = "Make him regent of the poultry accounts.", response = "Joke becomes office. Surprisingly loyal bird.", statDeltas = fixed_array(5, 0, 0, 8, 0, 8, 3, 5, 0)),
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
            prompt = "Your Majesty, I will publish your succession table unless you approve the chapter yourself. I have three drafts: blood, blade, and bargain. Choose one — the realm will copy it into law.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Approve blood chapter.", response = "Dynasty narrative. Rivals mobilize.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 10, 0, 12)),
            DialogueChoice(choiceText = "Approve blade chapter.", response = "The honest usurper's story. Honest unrest.", statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, -5, 0, 4)),
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
        characterIdx = CHAR_TALEN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I am selling a rumor that you have named a secret heir. Very popular this week. Buy it from me, let me spread it for you, or try to stop it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy and bury the rumor.", response = "Quiet coin. Loud questions remain.", statDeltas = fixed_array(0, 0, 0, -15, 0, 5, 0, 0, 2)),
            DialogueChoice(choiceText = "Spread the rumor", response = "False heir protects true throne. Fragile trick.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 5, 0, 4)),
            DialogueChoice(choiceText = "Deny publicly and hunt the source.", response = "Chaos contained. Court sweats.", statDeltas = fixed_array(0, 0, 5, 0, 0, 6, 0, 0, 6)),
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
            prompt = "Your Majesty, my princes will recognize your heir — if you recognize our prince's claim to a border duchy after your death. A promise about a future neither of us will see.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the bargain", response = "Future sold for present calm.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, -5, 0, 6)),
            DialogueChoice(choiceText = "Refuse — no land for promises", response = "Pride intact. Northern knives sharpen.", statDeltas = fixed_array(0, 0, 10, 0, 0, 5, 3, 0, -4)),
            DialogueChoice(choiceText = "Offer trade rights instead", response = "Diplomatic draw. Both sides grumble.", statDeltas = fixed_array(3, 0, 5, 0, 0, 5, 3, 0, 5)),
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
            prompt = "Your Majesty, the cathedral vault holds Edwin's will. No one has read it since the coup. It may name an heir. It may curse you. Open it, read it alone, or burn it unopened.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Open the will publicly.", response = "Truth ritual. Succession chaos possible.", statDeltas = fixed_array(0, 12, 0, 0, 0, 0, -8, 0, 6)),
            DialogueChoice(choiceText = "Read privately then decide.", response = "Knowledge is leverage. Suspicion grows.", statDeltas = fixed_array(0, 5, 0, 0, 0, 5, 0, 0, 4)),
            DialogueChoice(choiceText = "Burn it unopened.", response = "Peace of ignorance. Hell gets the paperwork.", statDeltas = fixed_array(0, -10, 5, 0, 0, -5, 5, 0, -4)),
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
            prompt = "Your Majesty, the poor in my soup line pray for 'a name after the king.' They fear what happens to them if you die. Give them a name — or give them bread.",
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
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I want the succession law to favor generals. The nobles want blood. The Church wants rites. And you, I suspect, want sleep. Choose one clause.",
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
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I propose a tax on empty succession titles: lords pay to keep imaginary heirs on paper. They invent cousins to grab land. Let the cousins pay.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Enact the tax.", response = "Treasury laughs. Nobility plots.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Reject the tax", response = "Respect bought. Gold lost.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 2)),
            DialogueChoice(choiceText = "Tax only foreign claimants.", response = "Narrow policy. Ingvar annoyed.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, 3, 0, 4)),
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
            prompt = "Your Majesty, I am treating a feverish lord who keeps muttering the name of Edwin's nephew. If he lives, he will talk. If I stop treating him, the fever will finish the sentence for him.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Save him", response = "Life bought. Succession rumor strengthened.", statDeltas = fixed_array(0, 0, 0, -5, 10, 5, 0, 0, -4)),
            DialogueChoice(choiceText = "Stop the treatment", response = "I will obey. I will not forget. The whispers will call it murder.", statDeltas = fixed_array(-8, 0, 0, 0, -5, -5, 0, 0, 2)),
            DialogueChoice(choiceText = "Save him but isolate from court.", response = "Middle path. Secrets in the sickroom.", statDeltas = fixed_array(0, 0, 0, -8, 8, 6, 0, 0, 2)),
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
            prompt = "Your Majesty, I found pamphlets about the succession in the barracks — who should rule after you, and who should not. Hang the printers, burn the pamphlets, or answer them with your own.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the printers.", response = "Fear stills presses. Martyrs possible.", statDeltas = fixed_array(-8, 0, 8, 0, 0, -4, 0, 0, 2)),
            DialogueChoice(choiceText = "Burn pamphlets only.", response = "Softer censorship. Ideas smolder.", statDeltas = fixed_array(0, 0, 3, 0, 0, 2, 0, 0, 2)),
            DialogueChoice(choiceText = "Publish crown pamphlet answering them.", response = "War of words. Succession debated openly.", statDeltas = fixed_array(5, 0, 0, -10, 0, 8, 5, 0, 6)),
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
            prompt = "Your Majesty, I can make your line lawful through my house's blood — if the succession names my nephew as regent should you die before your heir comes of age.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept regency bargain.", response = "Succession tethered to Ashford. Peace costly.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 18, 0, 6)),
            DialogueChoice(choiceText = "Refuse the regency", response = "Independence kept. Eastern threat returns.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, -10, 0, -4)),
            DialogueChoice(choiceText = "Offer a seat on the regency council instead", response = "Half alliance. Half insult.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 10, 0, 3)),
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
            prompt = "Your Majesty, if you fell from your horse tomorrow, the law does not say who rules. I have drafted a regency council: five names who would hold the realm until an heir is chosen. You choose the five.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Five great lords", response = "The houses feel safe. If you die, they will argue for years.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 6)),
            DialogueChoice(choiceText = "My most trusted advisors", response = "Edric, Rudolf, Borvin, Mira, Malrik. A practical council — and a jealous peerage.", statDeltas = fixed_array(0, 2, 3, 0, 0, 6, -6, 0, 10)),
            DialogueChoice(choiceText = "No council — I will not die", response = "A bold plan. The realm prays you are right.", statDeltas = fixed_array(0, 0, 0, 0, 0, -3, 0, 0, -10)),
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
            prompt = "Your Majesty, a kitchen girl says she carries your child. She may be lying. She may not. The court already knows. Either way, someone will use this.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Protect her and wait for the birth", response = "Honest and dangerous. A possible heir in the servants' wing.", statDeltas = fixed_array(4, -3, 0, -4, 0, 4, -4, 0, 8)),
            DialogueChoice(choiceText = "Send her away with gold", response = "Quiet, for now. The child, if there is one, will grow up far away — and hear stories.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 2, 0, -4)),
            DialogueChoice(choiceText = "Call her a liar in public", response = "She is shamed. If she spoke the truth, so are you.", statDeltas = fixed_array(-6, 2, 0, 0, 0, -4, 3, 0, -6)),
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
            prompt = "Your Majesty, my niece is twenty, clever, and unmarried. Marry her, and the east becomes your inheritance. Your children will have Ashford blood — and Ashford friends.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the marriage", response = "A wedding in spring. The east is yours. So is Ashford's opinion on everything.", statDeltas = fixed_array(3, 3, 0, -10, 0, 0, 12, 0, 15)),
            DialogueChoice(choiceText = "Ask for time to know her", response = "Ashford is surprised. A king who wants to know his bride. Romantic, or clever.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 3)),
            DialogueChoice(choiceText = "Refuse", response = "The east cools. Your heir, if any, will come from somewhere else.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -10, 0, -6)),
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
            prompt = "Your Majesty, a king's heir must be blessed at birth or named before God. You have neither child nor named heir. The Church offers to pray for one — publicly, every Sunday.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the Sunday prayers", response = "Every Sunday the realm is reminded that you have no heir. Gently.", statDeltas = fixed_array(2, 8, 0, 0, 0, 0, 0, 0, 4)),
            DialogueChoice(choiceText = "Name an heir before God instead", response = "A solemn rite. A name in the cathedral book. A target, too.", statDeltas = fixed_array(0, 10, 0, -6, 0, 0, 3, 0, 12)),
            DialogueChoice(choiceText = "My succession is not the Church's business", response = "Malrik writes this down. He writes everything down.", statDeltas = fixed_array(0, -8, 0, 0, 0, 0, 0, 0, -4)),
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
            prompt = "Your Majesty, the soldiers ask one question at every campfire: if the king falls, who do we follow? I need an answer I can give them — a name, or a law.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Rudolf commands until an heir is chosen", response = "The army is calm. The nobles see a general one step from the throne.", statDeltas = fixed_array(0, 0, 10, 0, 0, 0, -8, 0, 6)),
            DialogueChoice(choiceText = "Follow the law of the regency council", response = "A law is harder to love than a name. But it is harder to kill.", statDeltas = fixed_array(0, 0, 4, 0, 0, 3, 3, 0, 8)),
            DialogueChoice(choiceText = "Tell them to follow the crown and not ask", response = "They will stop asking you. They will keep asking each other.", statDeltas = fixed_array(0, 0, -4, 0, 0, -4, 0, 0, -6)),
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
            prompt = "Your Majesty, old kings carved their heir's name on the throne itself before the coronation. Your throne still has Edwin's son's name — the boy died of fever ten years ago. Shall we scrape it off?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Scrape it off and leave it blank", response = "An empty space on the throne. Everyone looks at it.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -3)),
            DialogueChoice(choiceText = "Leave the boy's name, in his memory", response = "A kind gesture. Edwin's loyalists are touched. The empty future stays empty.", statDeltas = fixed_array(3, 3, 0, 0, 0, 6, 3, 0, -2)),
            DialogueChoice(choiceText = "Carve a new name — my chosen heir", response = "Stone does not lie. Now the realm knows exactly who to protect — and who to kill.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, 0, 12)),
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
        characterIdx = CHAR_SELENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a southern merchant prince offers his son as your adopted heir. With the boy comes a fleet, a fortune, and a family that buys whole cities. Your lords would choke.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Adopt the merchant's son", response = "A fleet and a fortune. A peerage that will never accept him.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -15, 0, 8)),
            DialogueChoice(choiceText = "Offer him a seat at court instead", response = "Trade without blood. The prince accepts, a little disappointed.", statDeltas = fixed_array(0, 0, 0, 6, 0, 0, -2, 0, 0)),
            DialogueChoice(choiceText = "Refuse — the crown is not for sale", response = "The lords cheer. Borvin weeps quietly in his office.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, -2)),
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
        characterIdx = CHAR_ORM,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the veterans have a custom: an old soldier with no sons names a young comrade as his heir. They say a king who took his crown by the sword could do the same.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Name a young officer as heir", response = "The army roars. The great houses go pale.", statDeltas = fixed_array(3, 0, 12, 0, 0, 4, -12, 0, 10)),
            DialogueChoice(choiceText = "Honor the custom, but not for the crown", response = "A fine speech about tradition. No heir.", statDeltas = fixed_array(0, 0, 3, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "A crown is not a soldier's sword", response = "The veterans nod. They wanted it to be.", statDeltas = fixed_array(0, 0, -4, 0, 0, -2, 4, 0, -2)),
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
        characterIdx = CHAR_KNOX,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, three people at court are quietly preparing to claim the throne if you die. I have their names. I can tell you, sell you, or sell them.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay for the names", response = "Three names. One surprises you. One frightens you.", statDeltas = fixed_array(0, 0, 0, -12, 0, 4, 0, 0, 10)),
            DialogueChoice(choiceText = "Arrest Knox for treason", response = "Then the three claimants never learn they were known. And Knox sulks in a cell.", statDeltas = fixed_array(0, 0, 2, 0, 0, -3, 0, 0, -4)),
            DialogueChoice(choiceText = "Let him sell to them — and follow the money", response = "The claimants pay for nothing and reveal themselves. Knox gets paid twice.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 6)),
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
            prompt = "Your Majesty, the orphans in my monastery have a game: they play at choosing a king. Yesterday they chose a girl who shared her bread. Children see more than lords.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Visit the orphans and meet the girl", response = "A sweet story spreads through the city. You become the king who listens to children.", statDeltas = fixed_array(8, 4, 0, 0, 0, 4, 0, 0, 2)),
            DialogueChoice(choiceText = "Fund the monastery's school", response = "Future clerks, future healers, perhaps a future queen.", statDeltas = fixed_array(4, 3, 0, -8, 2, 0, 0, 0, 4)),
            DialogueChoice(choiceText = "A charming story, nothing more", response = "Arvel smiles and goes back to his soup.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)),
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
            prompt = "Your Majesty, the northern princes have many daughters and few allies. A marriage to the north would end the border wars for a generation. Your heir would speak two languages.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept a northern bride", response = "Peace on the pass. Your lords fear a northern queen.", statDeltas = fixed_array(0, -3, 6, 0, 0, 0, -8, 3, 12)),
            DialogueChoice(choiceText = "Offer a royal cousin instead", response = "A smaller marriage, a smaller peace. Still peace.", statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 4)),
            DialogueChoice(choiceText = "Refuse", response = "The princes will find other allies. Perhaps your enemies.", statDeltas = fixed_array(0, 0, -4, 0, 0, 0, 3, 0, -4)),
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
            prompt = "Your Majesty, when a king dies without an heir, his lands are split between claimants and his treasury is looted in a week. I suggest a royal trust: gold that only your named heir may open.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Create the royal trust", response = "A locked chest that makes your heir worth protecting.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 0, 12)),
            DialogueChoice(choiceText = "Create a smaller one", response = "Half the gold, half the safety. Better than nothing.", statDeltas = fixed_array(0, 0, 0, -6, 0, 0, 0, 0, 5)),
            DialogueChoice(choiceText = "The treasury needs the gold now", response = "Sensible today. A disaster tomorrow, if tomorrow comes too soon.", statDeltas = fixed_array(0, 0, 0, 4, 0, 0, 0, 0, -4)),
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
        characterIdx = CHAR_GOOSE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I demand to be named heir. I am loyal, popular, and I have never killed a king. Can any other candidate say the same? Also, I lay eggs. Dynasties need eggs.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Name the Goose 'Heir to the Feast'", response = "A joke title. The people laugh, the tension in the court breaks a little.", statDeltas = fixed_array(8, 0, 0, 0, 0, 4, -4, 0, 2)),
            DialogueChoice(choiceText = "Take it seriously and refuse", response = "The Goose bows deeply and honks a sad song all night.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 2, 0, 0)),
            DialogueChoice(choiceText = "Throw him out of court", response = "The people liked him. Now they like you a little less.", statDeltas = fixed_array(-6, 0, 0, 0, 0, -3, 4, 0, 0)),
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
        characterIdx = CHAR_OSRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I found Edwin's last letter — never sent. It names his heir if his son died: a cousin's grandson, living quietly as a schoolteacher in the west. He does not know.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Burn the letter", response = "A schoolteacher keeps his quiet life. History loses a page.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Bring the teacher to court and watch him", response = "A frightened man in a gilded room. The loyalists find him at once.", statDeltas = fixed_array(0, 0, 0, -4, 0, 4, 0, 0, -6)),
            DialogueChoice(choiceText = "Name him my heir — Edwin's line and mine united", response = "A stunning move. Loyalists weep with joy. Your own supporters are confused.", statDeltas = fixed_array(4, 4, -4, 0, 0, 12, 4, 0, 12)),
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
        characterIdx = CHAR_MORWEN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a man was caught writing 'the king has no heir' on the palace walls. It is true. It is also the kind of truth that ends with fire. What do I do with him?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Flog him publicly", response = "The walls are clean. The words are now in every tavern.", statDeltas = fixed_array(-4, 0, 2, 0, 0, 0, 0, 0, -3)),
            DialogueChoice(choiceText = "Release him — he wrote the truth", response = "A king who does not fear the truth. Brave, or careless.", statDeltas = fixed_array(4, 0, 0, 0, 0, 3, 0, 0, -2)),
            DialogueChoice(choiceText = "Answer him: announce that an heir will be named", response = "The rumor dies. Now you must keep the promise.", statDeltas = fixed_array(2, 0, 0, 0, 0, 4, 2, 0, 8)),
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
        characterIdx = CHAR_YVETTE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the southern houses will support any heir you name — on one condition: the heir must be raised in the south for three years. To learn our ways, of course.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Agree", response = "The south is yours. Your heir becomes a little southern.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 8, 0, 6)),
            DialogueChoice(choiceText = "One year, not three", response = "Yvette laughs and agrees. You suspect she wanted one all along.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 4, 0, 4)),
            DialogueChoice(choiceText = "The heir stays with the crown", response = "The south nods politely and keeps its support for later.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -6, 0, 0)),
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
            prompt = "Your Majesty, I am old. If I die, the court loses the only person who remembers every law, every treaty, and every secret. I wish to train a successor — but I need your choice of who.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "A young noble with good manners", response = "Polished and connected. He will forget half of what I teach him.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 4)),
            DialogueChoice(choiceText = "A clever clerk from the treasury", response = "Common-born and sharp. The lords will hate taking his advice.", statDeltas = fixed_array(2, 0, 0, 3, 0, 3, -4, 0, 6)),
            DialogueChoice(choiceText = "You will live forever, Edric", response = "Kind words. Untrue. I will keep my notes in a locked box.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, -4)),
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
        characterIdx = CHAR_ELINA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the city has a new song: 'The Lonely Crown,' about a king with no heir. It is sad, it is beautiful, and everyone sings it. Even your guards.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Commission a happier song", response = "A cheerful song about the future. People hum both.", statDeltas = fixed_array(2, 0, 0, -4, 0, 2, 0, 0, 2)),
            DialogueChoice(choiceText = "Let them sing", response = "A sad song is a safe song. Usually.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -2)),
            DialogueChoice(choiceText = "Ask her to sing it at court, before me", response = "A king who cries at his own song. The city loves him a little more.", statDeltas = fixed_array(6, 0, 0, 0, 0, 4, 0, 0, 0)),
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
        characterIdx = CHAR_KASPAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the east follows a simple rule: the heir is whoever the dying lord touches last. It sounds foolish. It has stopped many wars. Perhaps the crown should adopt it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Adopt the eastern custom", response = "Now everyone will want to be near your bed. Raena is unhappy.", statDeltas = fixed_array(0, -2, 0, 0, 0, -3, 6, 0, -4)),
            DialogueChoice(choiceText = "Write a clear law instead", response = "Ink instead of touch. Less romantic, much safer.", statDeltas = fixed_array(0, 0, 0, -3, 0, 2, 2, 0, 10)),
            DialogueChoice(choiceText = "Thank him and change nothing", response = "Kaspar shrugs. The east keeps its customs, and you keep your uncertainty.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -2)),
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
            prompt = "Your Majesty, I dreamed of your heir. A child with ink on its fingers and mud on its boots, laughing in an empty throne room. I do not know whose child. I only know it laughed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Search the realm for such a child", response = "Hundreds of muddy, inky children appear. One of them is very clever.", statDeltas = fixed_array(6, -4, 0, -5, 0, 0, 0, 0, 6)),
            DialogueChoice(choiceText = "Ask the Prophet to keep his dreams private", response = "He nods. The dream is already in the market.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)),
            DialogueChoice(choiceText = "Dreams are not law", response = "True. But laughing children make good stories.", statDeltas = fixed_array(-2, 2, 0, 0, 0, 0, 0, 0, -2)),
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
        characterIdx = CHAR_RAYMOND,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the landless men say: if the crown has no heir, let the crown go to whoever feeds the people best. A dangerous idea. A popular one.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Answer with a feast for the poor", response = "Bread today, and the idea fades a little. Ideas are hard to feed to death.", statDeltas = fixed_array(10, 0, 0, -8, 0, 4, -2, -8, 2)),
            DialogueChoice(choiceText = "Arrest those who spread it", response = "Prisons fill. The idea gets a martyr.", statDeltas = fixed_array(-8, 0, 3, 0, 0, -4, 4, 0, -2)),
            DialogueChoice(choiceText = "Name an heir and end the talk", response = "A name stops the question. Not the hunger.", statDeltas = fixed_array(2, 0, 0, 0, 0, 2, 0, 0, 10)),
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
            prompt = "Your Majesty, if you name an heir, the heir needs a guard. If the guard is too small, the heir dies. If it is too big, the heir becomes a second court. How many swords?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Twelve trusted guards", response = "Enough to stop a knife. Not enough to start a war.", statDeltas = fixed_array(0, 0, 2, -6, 0, 4, 0, 0, 8)),
            DialogueChoice(choiceText = "A full company of a hundred", response = "Safe — and the heir's captain grows very important.", statDeltas = fixed_array(0, 0, 4, -12, 0, -2, 0, 0, 10)),
            DialogueChoice(choiceText = "No guard — no heir yet", response = "Then this conversation was practice.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -3)),
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
        characterIdx = CHAR_FARA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the guilds will lend to a king — but loans die with kings. If you name an heir, the guilds will lend for twenty years. If not, only for one.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Name an heir in front of the guilds", response = "Twenty-year loans. The guilds now care very much about your heir's health.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -3, 0, 10)),
            DialogueChoice(choiceText = "Take the one-year loans", response = "Short loans, high interest. Borvin sighs.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 0, -2)),
            DialogueChoice(choiceText = "No loans at all", response = "No debts, no deals. The guilds wait.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, 0, 0)),
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

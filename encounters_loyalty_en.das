require engine.core
require constants
require dialogue_types

module encounters_loyalty_en public

let public allEncountersEnLoyalty : Encounter[POOL_LOYALTY_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Double the loyalty oath at muster.", response = "Words bind some. Others count coins.", statDeltas = fixed_array(0, 0, 12, -8, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay a bonus from the king's private money.", response = "Gold buys silence in steel. Brief silence.", statDeltas = fixed_array(0, 0, 15, -15, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Hang one rumormonger as example.", response = "Fear works. The rest salute louder.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Protect her and investigate quietly.", response = "Patience catches rats. The court sweats politely.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay her and forget the names.", response = "Cheap insurance. Dangerous if she talks twice.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss her", response = "Blind spot chosen. Someone will use it.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
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
            prompt = "Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy the list and purge the clerks.", response = "Efficient treachery. The court learns you purchase truth.", statDeltas = fixed_array(0, 0, 0, -12, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Arrest the spy and ignore the list.", response = "Principle over intelligence. Loyal fools remain hidden.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the list but spare the clerks", response = "Soft trap. They will know. They may behave.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 0)),
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
            prompt = "Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Execute the ringleaders only.", response = "Surgical fear. Mercy seen in the survivors.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Mass pardon for oaths, not for treason.", response = "Generous line-drawing. Purists will call it chaos.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Empty cells into the levy", response = "Brutal recruitment. Army swells, loyalty questionable.", statDeltas = fixed_array(-10, 0, 15, 0, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant leave", response = "Humanity costs risk. The court notes your nerve.", statDeltas = fixed_array(0, 0, -3, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Safe and cruel. She will remember.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Send her with pay and a replacement.", response = "Gold softens refusal. Professional solution.", statDeltas = fixed_array(0, 0, 3, -8, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let the monk feed who he chooses.", response = "Charity buys whispers of mercy. Malrik frowns.", statDeltas = fixed_array(10, -5, 0, 0, 5, 8, 0, -5, 0)),
            DialogueChoice(choiceText = "Arrest Edwin's sympathizers.", response = "Hard crown. Safer throne. Hungrier streets.", statDeltas = fixed_array(-12, 5, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Tax the soup kitchen", response = "Cynical. Surprisingly effective accounting.", statDeltas = fixed_array(0, 0, 0, 8, 0, 3, 0, -3, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the clerks, spare the treasurer.", response = "Scapegoats die. The court learns the price of theft.", statDeltas = fixed_array(0, 0, 0, 5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss the treasurer and reform the office.", response = "Clean house. Expensive honesty.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Take a cut and regulate the bribes.", response = "Corruption with a ledger. Loyalty has a tariff now.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_OTTO,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I have not spoken in years — today I write that your chamberlain plots with Ingvar's clerks.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Arrest the chamberlain immediately.", response = "Swift stroke. If wrong, you have made a martyr.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Watch quietly for proof.", response = "Patience. The plot may deepen into visibility.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Confront Ingvar publicly.", response = "Drama. Diplomacy suffers; truth may surface.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
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
        characterIdx = CHAR_LISSA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Seal every scriptorium door and investigate.", response = "Paranoia with cause. Work slows; traitors sweat.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Execute the junior scribe as warning.", response = "Fast justice. The guilty may remain.", statDeltas = fixed_array(-5, 0, 3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Issue a new decree confirming the true text.", response = "Ink fights ink. The realm reads confusion.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 0)),
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
        characterIdx = CHAR_GROMM,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Free the prisoner", response = "Mercy visible. Plotters may test your softness.", statDeltas = fixed_array(5, 0, 0, 0, 0, 10, 0, 3, 0)),
            DialogueChoice(choiceText = "Interrogate the prisoner privately.", response = "Information first. Justice later, maybe.", statDeltas = fixed_array(0, 0, 0, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Punish the cook for meddling.", response = "Message sent: look away. Loyalty bought with fear.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -8, 0, -5, 0)),
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
            prompt = "Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept", response = "Personal power grows. The army notices.", statDeltas = fixed_array(0, 0, -8, -10, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Unity preserved. Personal risk remains.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Expose the offer to Rudolf publicly.", response = "Transparency as weapon. He may respect or resent it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Treat him", response = "Mercy noted. Guards debate your softness.", statDeltas = fixed_array(5, 0, 5, 0, 8, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Turn him over to Varn for discipline.", response = "Order restored. Fear refreshed.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss him without treatment or pay.", response = "Harsh lesson. The barracks will remember.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept church reports on disloyalty.", response = "Faith becomes spy. Loyalty measurable, humiliating.", statDeltas = fixed_array(0, 12, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Independence declared. Blind spots remain.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Demand public oaths instead of secrets.", response = "Theatre of loyalty. Some will mean it.", statDeltas = fixed_array(0, 5, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Arrest the officers.", response = "Discipline restored. Resentment bottled.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Ignore", response = "Risk accepted. Cheap peace tonight.", statDeltas = fixed_array(0, 0, -3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the next round in the crown's name.", response = "Bold charm. They toast you before midnight.", statDeltas = fixed_array(0, 0, 8, -8, 0, 12, 0, 0, 0)),
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
        characterIdx = CHAR_LISSA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a chambermaid refuses to change the sheets in the guest wing — she says the lord there plotted against you at feast.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Reward her refusal", response = "Servants as eyes. Nobles as enemies.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 5, 0, 0)),
            DialogueChoice(choiceText = "Order her to obey or leave service.", response = "Hierarchy enforced. Useful warning silenced.", statDeltas = fixed_array(0, 0, 3, 0, 0, -5, 0, 0, 0)),
            DialogueChoice(choiceText = "Move the lord to lesser quarters quietly.", response = "Subtle punishment. He will understand.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 3, 0, 0)),
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
            prompt = "Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Double the loyalty oath at muster.", response = "Words bind some. Others count coins.", statDeltas = fixed_array(0, 0, 12, -8, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay a bonus from the king's private money.", response = "Gold buys silence in steel. Brief silence.", statDeltas = fixed_array(0, 0, 15, -15, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Hang one rumormonger as example.", response = "Fear works. The rest salute louder.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Protect her and investigate quietly.", response = "Patience catches rats. The court sweats politely.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay her and forget the names.", response = "Cheap insurance. Dangerous if she talks twice.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss her", response = "Blind spot chosen. Someone will use it.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
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
            prompt = "Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy the list and purge the clerks.", response = "Efficient treachery. The court learns you purchase truth.", statDeltas = fixed_array(0, 0, 0, -12, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Arrest the spy and ignore the list.", response = "Principle over intelligence. Loyal fools remain hidden.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the list but spare the clerks", response = "Soft trap. They will know. They may behave.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 0)),
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
            prompt = "Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Execute the ringleaders only.", response = "Surgical fear. Mercy seen in the survivors.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Mass pardon for oaths, not for treason.", response = "Generous line-drawing. Purists will call it chaos.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Empty cells into the levy", response = "Brutal recruitment. Army swells, loyalty questionable.", statDeltas = fixed_array(-10, 0, 15, 0, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant leave", response = "Humanity costs risk. The court notes your nerve.", statDeltas = fixed_array(0, 0, -3, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Safe and cruel. She will remember.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Send her with pay and a replacement.", response = "Gold softens refusal. Professional solution.", statDeltas = fixed_array(0, 0, 3, -8, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let the monk feed who he chooses.", response = "Charity buys whispers of mercy. Malrik frowns.", statDeltas = fixed_array(10, -5, 0, 0, 5, 8, 0, -5, 0)),
            DialogueChoice(choiceText = "Arrest Edwin's sympathizers.", response = "Hard crown. Safer throne. Hungrier streets.", statDeltas = fixed_array(-12, 5, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Tax the soup kitchen", response = "Cynical. Surprisingly effective accounting.", statDeltas = fixed_array(0, 0, 0, 8, 0, 3, 0, -3, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the clerks, spare the treasurer.", response = "Scapegoats die. The court learns the price of theft.", statDeltas = fixed_array(0, 0, 0, 5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss the treasurer and reform the office.", response = "Clean house. Expensive honesty.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Take a cut and regulate the bribes.", response = "Corruption with a ledger. Loyalty has a tariff now.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_OTTO,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I have not spoken in years — today I write that your chamberlain plots with Ingvar's clerks.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Arrest the chamberlain immediately.", response = "Swift stroke. If wrong, you have made a martyr.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Watch quietly for proof.", response = "Patience. The plot may deepen into visibility.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Confront Ingvar publicly.", response = "Drama. Diplomacy suffers; truth may surface.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
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
        characterIdx = CHAR_LISSA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Seal every scriptorium door and investigate.", response = "Paranoia with cause. Work slows; traitors sweat.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Execute the junior scribe as warning.", response = "Fast justice. The guilty may remain.", statDeltas = fixed_array(-5, 0, 3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Issue a new decree confirming the true text.", response = "Ink fights ink. The realm reads confusion.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 0)),
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
        characterIdx = CHAR_GROMM,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Free the prisoner", response = "Mercy visible. Plotters may test your softness.", statDeltas = fixed_array(5, 0, 0, 0, 0, 10, 0, 3, 0)),
            DialogueChoice(choiceText = "Interrogate the prisoner privately.", response = "Information first. Justice later, maybe.", statDeltas = fixed_array(0, 0, 0, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Punish the cook for meddling.", response = "Message sent: look away. Loyalty bought with fear.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -8, 0, -5, 0)),
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
            prompt = "Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept", response = "Personal power grows. The army notices.", statDeltas = fixed_array(0, 0, -8, -10, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Unity preserved. Personal risk remains.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Expose the offer to Rudolf publicly.", response = "Transparency as weapon. He may respect or resent it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Treat him", response = "Mercy noted. Guards debate your softness.", statDeltas = fixed_array(5, 0, 5, 0, 8, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Turn him over to Varn for discipline.", response = "Order restored. Fear refreshed.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss him without treatment or pay.", response = "Harsh lesson. The barracks will remember.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept church reports on disloyalty.", response = "Faith becomes spy. Loyalty measurable, humiliating.", statDeltas = fixed_array(0, 12, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Independence declared. Blind spots remain.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Demand public oaths instead of secrets.", response = "Theatre of loyalty. Some will mean it.", statDeltas = fixed_array(0, 5, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Arrest the officers.", response = "Discipline restored. Resentment bottled.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Ignore", response = "Risk accepted. Cheap peace tonight.", statDeltas = fixed_array(0, 0, -3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the next round in the crown's name.", response = "Bold charm. They toast you before midnight.", statDeltas = fixed_array(0, 0, 8, -8, 0, 12, 0, 0, 0)),
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
            prompt = "Your Majesty, a chambermaid refuses to change the sheets in the guest wing — she says the lord there plotted against you at feast.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Reward her refusal", response = "Servants as eyes. Nobles as enemies.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 5, 0, 0)),
            DialogueChoice(choiceText = "Order her to obey or leave service.", response = "Hierarchy enforced. Useful warning silenced.", statDeltas = fixed_array(0, 0, 3, 0, 0, -5, 0, 0, 0)),
            DialogueChoice(choiceText = "Move the lord to lesser quarters quietly.", response = "Subtle punishment. He will understand.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 3, 0, 0)),
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
            prompt = "Your Majesty, the guard captain reports whispers in the barracks — soldiers wonder who pays them if the treasury fails again.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Double the loyalty oath at muster.", response = "Words bind some. Others count coins.", statDeltas = fixed_array(0, 0, 12, -8, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay a bonus from the king's private money.", response = "Gold buys silence in steel. Brief silence.", statDeltas = fixed_array(0, 0, 15, -15, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Hang one rumormonger as example.", response = "Fear works. The rest salute louder.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, the kitchen maid heard two courtiers naming a price for your death. She wants protection — or gold.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Protect her and investigate quietly.", response = "Patience catches rats. The court sweats politely.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay her and forget the names.", response = "Cheap insurance. Dangerous if she talks twice.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss her", response = "Blind spot chosen. Someone will use it.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
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
            prompt = "Your Majesty, a foreign spy offers a list of disloyal clerks — for coin and a safe exit.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy the list and purge the clerks.", response = "Efficient treachery. The court learns you purchase truth.", statDeltas = fixed_array(0, 0, 0, -12, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Arrest the spy and ignore the list.", response = "Principle over intelligence. Loyal fools remain hidden.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the list but spare the clerks", response = "Soft trap. They will know. They may behave.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 0)),
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
            prompt = "Your Majesty, the executioner says the prisons overflow with men who swore Edwin's name. He needs guidance — blade or pardon.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Execute the ringleaders only.", response = "Surgical fear. Mercy seen in the survivors.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Mass pardon for oaths, not for treason.", response = "Generous line-drawing. Purists will call it chaos.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Empty cells into the levy", response = "Brutal recruitment. Army swells, loyalty questionable.", statDeltas = fixed_array(-10, 0, 15, 0, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, your bodyguard requests leave to visit her village — the only sword between you and the hall sleeps elsewhere.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant leave", response = "Humanity costs risk. The court notes your nerve.", statDeltas = fixed_array(0, 0, -3, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Safe and cruel. She will remember.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Send her with pay and a replacement.", response = "Gold softens refusal. Professional solution.", statDeltas = fixed_array(0, 0, 3, -8, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, the monk feeds loyalists' families at his gate. The guard wants to arrest them; the people want to bless you for allowing it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let the monk feed who he chooses.", response = "Charity buys whispers of mercy. Malrik frowns.", statDeltas = fixed_array(10, -5, 0, 0, 5, 8, 0, -5, 0)),
            DialogueChoice(choiceText = "Arrest Edwin's sympathizers.", response = "Hard crown. Safer throne. Hungrier streets.", statDeltas = fixed_array(-12, 5, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Tax the soup kitchen", response = "Cynical. Surprisingly effective accounting.", statDeltas = fixed_array(0, 0, 0, 8, 0, 3, 0, -3, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the treasurer's clerks have been selling audience slots. He swears ignorance; the guards swear otherwise.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the clerks, spare the treasurer.", response = "Scapegoats die. The court learns the price of theft.", statDeltas = fixed_array(0, 0, 0, 5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss the treasurer and reform the office.", response = "Clean house. Expensive honesty.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Take a cut and regulate the bribes.", response = "Corruption with a ledger. Loyalty has a tariff now.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_OTTO,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I have not spoken in years — today I write that your chamberlain plots with Ingvar's clerks.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Arrest the chamberlain immediately.", response = "Swift stroke. If wrong, you have made a martyr.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Watch quietly for proof.", response = "Patience. The plot may deepen into visibility.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Confront Ingvar publicly.", response = "Drama. Diplomacy suffers; truth may surface.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
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
        characterIdx = CHAR_LISSA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the scribe found two versions of your last decree — one signed, one forged. Someone in the scriptorium plays both sides.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Seal every scriptorium door and investigate.", response = "Paranoia with cause. Work slows; traitors sweat.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Execute the junior scribe as warning.", response = "Fast justice. The guilty may remain.", statDeltas = fixed_array(-5, 0, 3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Issue a new decree confirming the true text.", response = "Ink fights ink. The realm reads confusion.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 0)),
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
        characterIdx = CHAR_GROMM,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the cook caught a page stealing bread for a hidden prisoner in the west wing. He wants to know if mercy is still on the menu.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Free the prisoner", response = "Mercy visible. Plotters may test your softness.", statDeltas = fixed_array(5, 0, 0, 0, 0, 10, 0, 3, 0)),
            DialogueChoice(choiceText = "Interrogate the prisoner privately.", response = "Information first. Justice later, maybe.", statDeltas = fixed_array(0, 0, 0, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Punish the cook for meddling.", response = "Message sent: look away. Loyalty bought with fear.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -8, 0, -5, 0)),
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
            prompt = "Your Majesty, the merchant offers to fund a secret household guard — loyal only to you, not to Rudolf's officers.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept", response = "Personal power grows. The army notices.", statDeltas = fixed_array(0, 0, -8, -10, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Unity preserved. Personal risk remains.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Expose the offer to Rudolf publicly.", response = "Transparency as weapon. He may respect or resent it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, the healer tends a guard who took a bribe to look away during a theft. She asks whether loyalty or hunger deserves the sickbed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Treat him", response = "Mercy noted. Guards debate your softness.", statDeltas = fixed_array(5, 0, 5, 0, 8, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Turn him over to Varn for discipline.", response = "Order restored. Fear refreshed.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss him without treatment or pay.", response = "Harsh lesson. The barracks will remember.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 5, 0, 0, 0)),
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
            prompt = "Your Majesty, Malrik says confessionals overflow with courtiers' sins against your crown. He offers summaries — for the church's protection.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept church reports on disloyalty.", response = "Faith becomes spy. Loyalty measurable, humiliating.", statDeltas = fixed_array(0, 12, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Independence declared. Blind spots remain.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Demand public oaths instead of secrets.", response = "Theatre of loyalty. Some will mean it.", statDeltas = fixed_array(0, 5, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, the general reports officers drinking to Edwin's health in the lower taverns. Arrest, ignore, or join them with a toast to the living king?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Arrest the officers.", response = "Discipline restored. Resentment bottled.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Ignore", response = "Risk accepted. Cheap peace tonight.", statDeltas = fixed_array(0, 0, -3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the next round in the crown's name.", response = "Bold charm. They toast you before midnight.", statDeltas = fixed_array(0, 0, 8, -8, 0, 12, 0, 0, 0)),
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

require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
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
            DialogueChoice(choiceText = "Hang one rumormonger as example.", response = "Fear works. The rest salute louder.", statDeltas = fixed_array(-8, 0, 4, 0, 0, -4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Pay her and forget the names.", response = "Cheap insurance. Dangerous if she talks twice.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 0, 0)),
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
        characterIdx = CHAR_KNOX,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a foreign spy came to me with a list of your disloyal clerks. He wants coin and a safe road home. I have checked three names. They are real.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy the list and purge the clerks.", response = "Efficient treachery. The court learns you purchase truth.", statDeltas = fixed_array(0, 0, 0, -12, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Arrest the spy and ignore the list.", response = "Principle over intelligence. Loyal fools remain hidden.", statDeltas = fixed_array(0, 0, 5, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Buy the list but spare the clerks", response = "Soft trap. They will know. They may behave.", statDeltas = fixed_array(0, 0, 0, -8, 0, 6, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Execute the ringleaders only.", response = "Surgical fear. Mercy seen in the survivors.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 2, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Refuse her leave", response = "Safe and cruel. She will remember.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Arrest Edwin's sympathizers.", response = "Hard crown. Safer throne. Hungrier streets.", statDeltas = fixed_array(-12, 5, 5, 0, 0, -6, 0, 0, 0)),
            DialogueChoice(choiceText = "Tax the soup kitchen", response = "Cynical. Surprisingly effective accounting.", statDeltas = fixed_array(-3, 0, 0, 8, 0, -2, 0, -3, 0)),
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
            DialogueChoice(choiceText = "Hang the clerks, spare the treasurer.", response = "Scapegoats die. The court learns the price of theft.", statDeltas = fixed_array(0, 0, 0, 5, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss the treasurer and reform the office.", response = "Clean house. Expensive honesty.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Take a cut and regulate the bribes.", response = "Corruption with a ledger. Loyalty has a tariff now.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -8, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Arrest the chamberlain immediately.", response = "Swift stroke. If wrong, you have made a martyr.", statDeltas = fixed_array(0, 0, 5, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Watch quietly for proof.", response = "Patience. The plot may deepen into visibility.", statDeltas = fixed_array(0, 0, 0, -5, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Confront Ingvar publicly.", response = "Drama. Diplomacy suffers; truth may surface.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, 0, 0, 0)),
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
            prompt = "Your Majesty, I found two versions of your last decree — one signed by you, one forged. Someone in my scriptorium plays both sides, and they write almost as well as I do.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Seal every scriptorium door and investigate.", response = "Paranoia with cause. Work slows; traitors sweat.", statDeltas = fixed_array(0, 0, 0, -5, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Execute the junior scribe as warning.", response = "Fast justice. The guilty may remain.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -6, 0, 0, 0)),
            DialogueChoice(choiceText = "Issue a new decree confirming the true text.", response = "Ink fights ink. The realm reads confusion.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Free the prisoner", response = "Mercy visible. Plotters may test your softness.", statDeltas = fixed_array(5, 0, 0, 0, 0, 6, 0, 3, 0)),
            DialogueChoice(choiceText = "Interrogate the prisoner privately.", response = "Information first. Justice later, maybe.", statDeltas = fixed_array(0, 0, 0, -3, 0, 4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Accept the secret guard", response = "Personal power grows. The army notices.", statDeltas = fixed_array(0, 0, -8, -10, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse the offer", response = "Unity preserved. Personal risk remains.", statDeltas = fixed_array(0, 0, 8, 0, 0, -2, 0, 0, 0)),
            DialogueChoice(choiceText = "Expose the offer to Rudolf publicly.", response = "Transparency as weapon. He may respect or resent it.", statDeltas = fixed_array(0, 0, 5, 0, 0, 4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Turn him over to Varn for discipline.", response = "Order restored. Fear refreshed.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss him without treatment or pay.", response = "Harsh lesson. The barracks will remember.", statDeltas = fixed_array(-5, 0, -5, 5, 0, -8, 0, 0, 0)),
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
            prompt = "Your Majesty, the confessionals are full of courtiers' sins against your crown. I can send you summaries — in exchange for the Church's protection, of course.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept church reports on disloyalty.", response = "Faith becomes spy. Loyalty measurable, humiliating.", statDeltas = fixed_array(0, 12, 0, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse — confession is sacred", response = "Independence declared. Blind spots remain.", statDeltas = fixed_array(0, -8, 0, 0, 0, -2, 0, 0, 0)),
            DialogueChoice(choiceText = "Demand public oaths instead of secrets.", response = "Theatre of loyalty. Some will mean it.", statDeltas = fixed_array(0, 5, 5, 0, 0, 6, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Arrest the officers.", response = "Discipline restored. Resentment bottled.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Ignore the toasts", response = "Risk accepted. Cheap peace tonight.", statDeltas = fixed_array(0, 0, -3, 0, 0, -2, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I found a knife under your pillow this morning. Not used — left. Whoever did it wanted you to know they can reach your bed. Only six people have keys to your chamber.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Question all six with Morwen", response = "Five innocent servants will never forgive you. One will be found.", statDeltas = fixed_array(0, 0, 3, 0, 0, -6, 0, 0, 0)),
            DialogueChoice(choiceText = "Change the locks and say nothing", response = "The knife-giver waits for your fear. You give them none.", statDeltas = fixed_array(0, 0, 0, -3, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Tell the court and offer a reward", response = "Now everyone watches everyone. Useful. Exhausting.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, -2, 0, 0)),
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
            prompt = "Your Majesty, the gate guards let a merchant's cart in without checking it. Inside were barrels of oil, and torches. The cart is seized. The guards say they were paid to look away — two silver each.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the guards at the gate", response = "Two silver buys a rope. Every guard learns the price.", statDeltas = fixed_array(-3, 0, 4, 0, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Raise the guards' pay so bribes are not worth it", response = "Expensive, but a guard with a full purse looks harder at carts.", statDeltas = fixed_array(0, 0, 5, -12, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Use the guards to catch whoever paid them", response = "They take the next bribe — and lead us to the buyer.", statDeltas = fixed_array(0, 0, 2, 0, 0, 4, 0, 0, 0)),
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
            prompt = "Your Majesty, the servants have not been paid for two months. They still work. But they have started to say 'the new king' instead of 'our king.' That is how it begins.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay them now, with a bonus", response = "The stairs warm up. Coin is the fastest way to say thank you.", statDeltas = fixed_array(0, 0, 0, -12, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay them in food from the royal stores", response = "Full bellies, empty purses. They accept, and talk about it.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 0, -8, 0)),
            DialogueChoice(choiceText = "They can wait another month", response = "They will wait. They will also listen to anyone who pays.", statDeltas = fixed_array(0, 0, 0, 4, 0, -10, 0, 0, 0)),
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
            prompt = "Your Majesty, your cupbearer meets a northern merchant every Tuesday. Maybe he buys cheese. Maybe he sells your habits. I can follow him, scare him, or replace him tonight.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Follow him and learn", response = "Patience. If he is a spy, we will know his friends too.", statDeltas = fixed_array(0, 0, 0, -4, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Replace him quietly", response = "Safe. If he was innocent, he was just unlucky.", statDeltas = fixed_array(0, 0, 0, 0, 0, -3, 0, 0, 0)),
            DialogueChoice(choiceText = "Scare him with a visit from Morwen", response = "He confesses to buying cheese — and to something else.", statDeltas = fixed_array(0, 0, 2, 0, 0, 3, 0, 0, 0)),
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
            prompt = "Your Majesty, the veterans of Edwin's wars still wear his medals on feast days. Some soldiers say that is treason. The veterans say they earned the medals, not the king.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let them wear the medals proudly", response = "Old soldiers stand taller. Some even start to salute you.", statDeltas = fixed_array(2, 0, 3, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Ban Edwin's medals", response = "The medals go into drawers. The bitterness goes into the taverns.", statDeltas = fixed_array(0, 0, -3, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Give them new medals in my name", response = "Two medals on one chest. The veterans take both and drink to you.", statDeltas = fixed_array(0, 0, 5, -8, 0, 8, 0, 0, 0)),
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
            prompt = "Your Majesty, three of your council members received the same anonymous letter: 'The crown will fall by winter. Choose your side.' Two showed it to me. The third did not.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Confront the third councillor", response = "He swears he burned it. Perhaps. The council now knows you are watching.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -3, 0, 0)),
            DialogueChoice(choiceText = "Reward the two who came forward", response = "Honesty pays in your court. Others will remember that.", statDeltas = fixed_array(0, 0, 0, -6, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Do nothing and watch the third", response = "Silence is a trap. Let us see who walks into it.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
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
            prompt = "Your Majesty, a sergeant named Bray saved a whole company at the river crossing. He is common-born, loud, and loved by the men. They want him promoted to captain. The officers do not.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Make Bray a captain", response = "The ranks cheer. The officers' mess goes quiet for a week.", statDeltas = fixed_array(3, 0, 6, 0, 0, 10, -5, 0, 0)),
            DialogueChoice(choiceText = "Give him gold instead of rank", response = "Bray takes the gold and stays a sergeant. The men think it unfair.", statDeltas = fixed_array(0, 0, 2, -6, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Respect the officers' wishes", response = "Order is kept. The men stop singing Bray's song where you can hear it.", statDeltas = fixed_array(0, 0, -2, 0, 0, -8, 5, 0, 0)),
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
            prompt = "Your Majesty, someone has been adding salt to your soup — too much salt. Not poison. A message? A joke? A test? The kitchen boys swear they know nothing.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hire a food taster", response = "A sensible precaution. The taster is very pleased with his new job.", statDeltas = fixed_array(0, 0, 0, -5, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Eat with the staff for a week", response = "A king at the servants' table. Whoever salted your soup now sits beside you.", statDeltas = fixed_array(2, 0, 0, 0, 0, 10, -3, 0, 0)),
            DialogueChoice(choiceText = "Replace the entire kitchen staff", response = "New cooks, worse food, and twenty angry former servants in the city.", statDeltas = fixed_array(-2, 0, 0, -4, 0, -8, 0, 0, 0)),
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
            prompt = "Your Majesty, I can copy any signature in the palace — that was my work under Edwin. Others can too. I propose a new royal seal with a secret mark only you and I know.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Make the new seal", response = "Forgers starve. But now I know your secret. Trust me — you must.", statDeltas = fixed_array(0, 0, 0, -6, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Make it, but tell no one — not even Osric", response = "Wise. Insulting. I will copy it within a month, out of pride.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "The old seal is good enough", response = "Then false orders will keep walking out of this palace.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 0)),
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
            prompt = "Your Majesty, a young priest refused to say your name in the Sunday prayers. He says his oath was to Edwin. Half the parish agrees with him. The other half wants him removed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Have him removed from the parish", response = "One priest gone, one parish divided. Malrik is pleased.", statDeltas = fixed_array(-3, 5, 0, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Visit the parish and speak to him", response = "He does not say your name — but he says a prayer for you. A start.", statDeltas = fixed_array(4, 2, 0, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Ignore it", response = "One silent priest becomes ten silent priests by spring.", statDeltas = fixed_array(0, -3, 0, 0, 0, -6, 0, 0, 0)),
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
            prompt = "Your Majesty, a rich merchant offers you a gift: a beautiful horse from the south. He asks nothing in return. Nothing yet.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the gift", response = "A fine horse. A merchant who now tells everyone the king owes him.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 2, 0, 0)),
            DialogueChoice(choiceText = "Accept and pay its full price", response = "No debts, no gossip. Your court learns that gifts are paid for here.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse it politely", response = "The merchant is offended, but your honor is not for sale.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -2, 0, 0)),
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
            prompt = "Your Majesty, a guard was hurt protecting you from a drunk with a knife. The royal physician will not treat a common soldier. I will, but I need your order.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Order the royal physician to treat him", response = "The physician obeys, red-faced. Every guard hears about it by night.", statDeltas = fixed_array(0, 0, 5, 0, 3, 10, -3, 0, 0)),
            DialogueChoice(choiceText = "Let Mira treat him", response = "He will live. The guards notice who cared.", statDeltas = fixed_array(0, 0, 3, 0, 3, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Pay him and send him home", response = "A purse instead of a doctor. He goes home angry and limping.", statDeltas = fixed_array(0, 0, -3, -4, 0, -6, 0, 0, 0)),
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
        characterIdx = CHAR_KARA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, my company has guarded your roads for a year. My men ask for a contract for five more years. A long contract means loyalty. A short one means we keep looking for better offers.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Sign for five years", response = "Then my bolts are yours until your heir is grown.", statDeltas = fixed_array(0, 0, 8, -15, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Sign for one more year", response = "Fair. Short. We will see who offers more next spring.", statDeltas = fixed_array(0, 0, 4, -6, 0, 0, 0, 0, 0)),
            DialogueChoice(choiceText = "End the contract", response = "Then the roads are yours to guard. Good luck with that.", statDeltas = fixed_array(0, 0, -8, 6, 0, -4, 0, 0, 0)),
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
            prompt = "Your Majesty, the guards have a marching song that mocks you — gently. 'The king who walked in through the window.' They sing it with a smile. Should I write them a better one?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Ask her to write a proud song", response = "A new song, paid by the crown. The guards sing both.", statDeltas = fixed_array(0, 0, 2, -5, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Join the guards and sing along", response = "The king sings his own mocking song. The guards will die for you now.", statDeltas = fixed_array(3, 0, 5, 0, 0, 12, -3, 0, 0)),
            DialogueChoice(choiceText = "Ban the song", response = "Then they sing it louder, and without the smile.", statDeltas = fixed_array(0, 0, -3, 0, 0, -8, 0, 0, 0)),
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
            prompt = "Your Majesty, my deputy has kept a second set of books — a true one — and offered it to Lady Ashford. He says he did it to protect the treasury from me. Perhaps he is right.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Audit both Borvin and the deputy", response = "Painful, fair, and slow. Both men sweat. The truth comes out.", statDeltas = fixed_array(0, 0, 0, -5, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Trust Borvin, dismiss the deputy", response = "Loyal to your treasurer. The deputy goes straight to Ashford.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -3, 0, 0)),
            DialogueChoice(choiceText = "Make the deputy the new treasurer", response = "A bold change. Borvin is wounded. The deputy now owes you everything.", statDeltas = fixed_array(0, 0, 0, 3, 0, 2, 0, 0, 0)),
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
            prompt = "Your Majesty, a family of Edwin's loyalists has asked for shelter at my monastery. The father was a captain who fought against your coup. His children are hungry. Will the crown allow it?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Allow it — children are not enemies", response = "Mercy noticed. Some loyalists start to wonder if you are so bad.", statDeltas = fixed_array(5, 3, 0, 0, 0, 8, 0, -2, 0)),
            DialogueChoice(choiceText = "Allow it, but the captain must surrender", response = "He surrenders for his children's sake. A sad, fair trade.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse — loyalists get no help", response = "Hard. Clear. The loyalists stop wondering.", statDeltas = fixed_array(-4, -3, 2, 0, 0, -8, 0, 0, 0)),
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
            prompt = "Your Majesty, the night watch caught two of your guards gambling with dice made from bone — and losing your palace keys in a bet. They got the keys back. They say.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Change every lock in the palace", response = "Expensive and slow, but you sleep tonight.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Dismiss the two guards", response = "Two fewer fools. Also two men with knowledge of your palace in the city.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Find out who they lost to", response = "A clever idea. The winner was not a guard at all.", statDeltas = fixed_array(0, 0, 2, 0, 0, 6, 0, 0, 0)),
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
            prompt = "Your Majesty, I will be honest: some of my vassals talk about replacing you. I have not joined them. Yet. I would like a reason not to — perhaps a seat for my brother on your council.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Give her brother a seat", response = "Loyalty bought, openly. The other houses take note of the price.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 8, 0, 0)),
            DialogueChoice(choiceText = "Demand the names of the vassals", response = "She gives two names — the least important ones. A test of nerves.", statDeltas = fixed_array(0, 0, 2, 0, 0, 4, -6, 0, 0)),
            DialogueChoice(choiceText = "Thank her and give nothing", response = "She smiles. She does not forget.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -4, 0, 0)),
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
        characterIdx = CHAR_FINN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I was a deserter once. Now I lead your scouts. Some of the old deserters still hide in the hills. They would come back — if the crown promised not to hang them.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise a full pardon", response = "Forty men walk out of the hills. The army grows. The honest soldiers grumble.", statDeltas = fixed_array(0, 0, 8, 0, 0, 6, 0, -3, 0)),
            DialogueChoice(choiceText = "Pardon only those who served well before", response = "Fair, but it splits them. Half come back, half stay bandits.", statDeltas = fixed_array(0, 0, 4, 0, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "No pardon for deserters", response = "Then the hills stay dangerous. And I wonder about my own neck.", statDeltas = fixed_array(-2, 0, 2, 0, 0, -8, 0, 0, 0)),
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
        characterIdx = CHAR_DOMINIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I hear your guards are loyal — but loyalty that is not paid on time becomes rumor. I offer to pay the palace guard directly from my bank, every month, without fail.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept Salt's offer", response = "Your guards will never be late paid again. They will know who pays them.", statDeltas = fixed_array(0, 0, 4, 5, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse — the crown pays its own guards", response = "Pride, and a heavy chest to fill every month.", statDeltas = fixed_array(0, 0, 2, -6, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Let him pay only the outer gate guards", response = "A compromise. Your door stays yours.", statDeltas = fixed_array(0, 0, 2, 2, 0, 0, 0, 0, 0)),
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
            prompt = "Your Majesty, my old commander from Edwin's guard wants to meet you. He says he will swear loyalty — if you look him in the eye and tell him why Edwin had to die.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Meet him and tell the truth", response = "He listens. He does not forgive. But he kneels.", statDeltas = fixed_array(0, 0, 3, 0, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Meet him, but say only that it is done", response = "A king's answer. He respects it, barely.", statDeltas = fixed_array(0, 0, 2, 0, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse — kings do not explain", response = "Then he stays a stranger. So do his men.", statDeltas = fixed_array(0, 0, -2, 0, 0, -6, 2, 0, 0)),
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
            prompt = "Your Majesty, I could plant a false plot in the court — a fake conspiracy — and see who joins it. Those who join are traitors. Those who report it are loyal. Cruel, but very informative.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Run the false plot", response = "Three courtiers join. Four report it. Everyone else hears and trusts no one.", statDeltas = fixed_array(0, 0, 0, -5, 0, 6, -4, 0, 0)),
            DialogueChoice(choiceText = "Too cruel — refuse", response = "Then we wait for the real plot. They always come.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Run it, but pardon those who join", response = "A lesson, not a slaughter. They will never forget your mercy — or your trap.", statDeltas = fixed_array(0, 0, 0, -5, 0, 8, -2, 0, 0)),
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
            prompt = "Your Majesty, I am old, and I have one request: let me retire to my village with my sword. The young knights say a knight who leaves your service is a traitor. I say I am tired.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let him go with honor and a pension", response = "Every old soldier sees that your service can end in peace.", statDeltas = fixed_array(0, 0, 2, -6, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Ask him to train the young knights first", response = "One more year. He grumbles, and trains them very well.", statDeltas = fixed_array(0, 0, 6, 0, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse — he swore for life", response = "He stays. His heart does not.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 0)),
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
            prompt = "Your Majesty, I have a list of everyone who cheered when you took the crown — and everyone who wept. Shall I publish it in the chronicle? People like to know where they stand.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Burn the list", response = "A fresh start for everyone. The weepers are grateful.", statDeltas = fixed_array(2, 0, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Keep it secret, for my eyes only", response = "Useful. Dangerous if stolen. Knox is already curious.", statDeltas = fixed_array(0, 0, 0, 0, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Publish it", response = "Now everyone knows. The weepers will never be your friends.", statDeltas = fixed_array(0, 0, 0, 0, 0, -10, -3, 0, 0)),
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
            prompt = "Your Majesty, the court has no way to swear a new oath except Edwin's old words. I propose a new oath of loyalty — short, simple, and in your name. Everyone at court must say it at the next feast.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Everyone must swear it", response = "Most swear. A few find themselves sick that night. Now you know who.", statDeltas = fixed_array(0, 0, 2, 0, 0, 8, -3, 0, 0)),
            DialogueChoice(choiceText = "Only those who wish to", response = "Fewer oaths, but every one of them meant.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 2, 0, 0)),
            DialogueChoice(choiceText = "Keep Edwin's old oath", response = "Old words, old loyalties. Not all of them to you.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 3, 0, 0)),
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
            prompt = "Your Majesty, a woman confessed to plotting your death — but she is clearly mad, and her plot involved a flying cat. The law says confessed traitors must hang.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Send her to Mira's care", response = "Mercy for the mad. The law bends, and the people see a sensible king.", statDeltas = fixed_array(5, 0, 0, 0, 2, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "The law is the law", response = "She hangs. People whisper that the new king fears cats.", statDeltas = fixed_array(-6, 0, 2, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Release her with a warning", response = "She thanks you and promises to tell the cat.", statDeltas = fixed_array(3, 0, 0, 0, 0, 2, 0, 0, 0)),
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
        characterIdx = CHAR_YAREK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the miners will swear loyalty to the crown — all of them, in the town square — if you promise them one thing: no more children in the mines.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promise and enforce it", response = "A thousand miners swear. Ore output drops a little. Hearts rise a lot.", statDeltas = fixed_array(10, 0, -2, -6, 3, 12, -2, 0, 0)),
            DialogueChoice(choiceText = "Promise for children under twelve", response = "Half a promise. Half the miners swear.", statDeltas = fixed_array(4, 0, 0, -3, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Refuse — the mines need every hand", response = "The forges keep burning. The miners keep their oath to themselves.", statDeltas = fixed_array(-6, 0, 3, 4, 0, -8, 0, 0, 0)),
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
            prompt = "Your Majesty, someone is buying up all the black cloth in the city. Black for mourning — or for banners. My guess? Someone plans a funeral. Yours, perhaps.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy the rest of the black cloth yourself", response = "No cloth, no banners. The plotters must start over — angrily.", statDeltas = fixed_array(0, 0, 0, -8, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Find out who is buying", response = "A tailor talks. A name appears. A small, useful name.", statDeltas = fixed_array(0, 0, 2, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "It is just cloth", response = "Probably. Probably.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 0, 0, 0)),
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
            prompt = "Your Majesty, the army will march in the spring parade. The men want to march past the palace and shout your name. The officers want to march past the cathedral and shout God's.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Past the palace, shouting my name", response = "Five thousand voices shouting your name. Malrik hears it too.", statDeltas = fixed_array(2, -6, 6, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Past the cathedral, shouting God's", response = "Pious and safe. The men shout without much feeling.", statDeltas = fixed_array(0, 8, 2, 0, 0, 0, 0, 0, 0)),
            DialogueChoice(choiceText = "Past both — and I march with them", response = "A king who marches with his army. The men will tell their grandchildren.", statDeltas = fixed_array(4, 3, 8, -5, 0, 8, 0, 0, 0)),
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

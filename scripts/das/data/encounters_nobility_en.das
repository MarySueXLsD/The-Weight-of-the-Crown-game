require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
module encounters_nobility_en public

let public allEncountersEnNobility : Encounter[POOL_NOBILITY_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant Ashford's cousin a seat.", response = "Then blood buys silence. Efficient, if you can stomach the receipt.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Offer a lesser title without council voice.", response = "Half a crown for half a loyalty. They will negotiate louder tomorrow.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Refuse them a seat", response = "Bold. The great houses will remember who refused insurance.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
        characterIdx = CHAR_MARIANNA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, my house offers a marriage: Dell land and Dell cousins for your crown, and your name to make our house royal. The realm would see a dynasty forming, not a blade.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the match.", response = "Then ink binds blood. The realm sees a dynasty forming, not a blade.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Counter with a trade charter instead.", response = "Commerce instead of cousins. Cold, but cheaper.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Decline the marriage", response = "Pride keeps the crown light. The houses will call it arrogance.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Your Majesty, the heraldry office demands gold to register your coat of arms — or the old king's crest stays on every gate.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay for new heraldry.", response = "Then your sigil flies before your name is safe. Vanity with purpose.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Keep Edwin's crest and claim continuity.", response = "Dangerous symbolism. The loyalists cheer; the coup soldiers frown.", statDeltas = fixed_array(-5, 5, -5, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Issue a plain banner", response = "Modest. Boring. Sometimes survival wears grey.", statDeltas = fixed_array(0, 0, 3, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant eastern manors to loyal lords.", response = "Land buys swords. The peasants on those manors will scream.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Sell the estates at auction.", response = "Gold now, grudges later. The treasury breathes.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Refuse the landless lords", response = "Then the landless become dangerous. You chose principle over peace.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
            prompt = "Your Majesty, the guild masters say noble tariffs strangle trade. The nobles say guild wealth strangles bloodlines. Both want your signature.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Side with the guilds", response = "Merchants cheer. Great houses plot. Gold flows faster.", statDeltas = fixed_array(8, 0, 0, 12, 0, 0, -12, 5, 0)),
            DialogueChoice(choiceText = "Side with the nobles", response = "Blood applauds. Caravans detour. The purse swells.", statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 12, -8, 0)),
            DialogueChoice(choiceText = "Split the difference and anger everyone equally.", response = "Fairness that satisfies no one. Remarkably stable, briefly.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Your Majesty, a scandalous letter circulates — your name beside a baron's wife. The baron wants satisfaction or silence.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay for silence.", response = "Gold oils gossip. The story sleeps until someone hungrier wakes it.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Publicly deny and punish the scribe.", response = "Hard denial. The court believes you or pretends to.", statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Offer the baron a council post.", response = "Ambition cures jealousy, sometimes. Expensive cure.", statDeltas = fixed_array(-3, 0, 0, -10, 0, 0, 12, 0, 0)),
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
            prompt = "Your Majesty, the chronicler asks whether to record your reign as 'restoration' or 'usurpation' in the lineage books.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Restoration", response = "History becomes ally. Living Edwin loyalists become enemies.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Usurpation", response = "Honest and humiliating. Future generations will judge plainly.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Omit judgment", response = "Coward's wisdom. Scholars hate it. It often works.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 0)),
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
            prompt = "Your Majesty, eastern bankers offer a loan against next year's grain tax — if great houses co-sign. They want your word first.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Sign", response = "Debt chains crown to elite. Fast gold, slow leash.", statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 8, -5, 0)),
            DialogueChoice(choiceText = "Refuse foreign paper.", response = "Independence tastes poor. The army may notice empty coffers.", statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Tax the bankers instead of borrowing.", response = "Audacity. They will call it brigandage. Your purse calls it policy.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -5, 0, 0)),
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
        characterIdx = CHAR_MARIANNA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a young lord challenges your knight to a duel over an insult at feast. The court watches whether law or blood rules.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Allow the duel", response = "Steel settles what words broke. The commons call it justice.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Forbid duels", response = "Order wins. Nobles whisper you fear their blades.", statDeltas = fixed_array(5, 0, -3, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Fine both houses and cancel the duel.", response = "Mercantile peace. Both sides hate the arithmetic.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 3, 0, 0)),
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
            prompt = "Your Majesty, my princes will recognize your crown if you grant a border barony to their cousin. A small piece of land for a large piece of peace.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant the barony", response = "Land for a legal claim abroad. The eastern lords will riot.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse the barony", response = "Pride intact. Diplomacy colder. Soldiers may benefit.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Offer trade rights instead of land.", response = "Cheaper tribute. They will call it insult. It may hold.", statDeltas = fixed_array(3, 0, 0, 8, 0, 0, 5, 0, 0)),
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
            prompt = "Your Majesty, Gromm's feast for the great houses has gone far over budget. I blame the steward; the steward blames your generosity. The lords are already at the table.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay for the full feast", response = "Full tables, empty purse. They toast your name tonight.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Serve a modest meal and explain austerity.", response = "Thin soup, thick pride. Some lords will respect it.", statDeltas = fixed_array(5, 0, 0, 5, 0, 0, -5, 5, 0)),
            DialogueChoice(choiceText = "Cancel the feast", response = "Missed opportunity for alliances. Saved gold for soldiers.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, -8, 0, 0)),
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
            prompt = "Your Majesty, House Vayne offers you two hundred swords if you take Crow's hunting rights in the crown forest and give them to Vayne. Crow will not take it quietly.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Revoke Crow's rights.", response = "One house fed, one house furious. Forests do not vote.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Uphold Crow's ancient charter.", response = "Tradition wins. Vayne's swords go looking for another king.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Split the forest between both.", response = "Nobody happy. Fewer poachers, more lawsuits.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
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
            prompt = "Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant him a minor title", response = "Cheap nobility. True claimants will notice.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse his petition", response = "Hard line. The petitioner's friends become whisperers.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Exile him with gold.", response = "Gone with gossip. Gold well spent, perhaps.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 5, 0, 0)),
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
        characterIdx = CHAR_NERIUS,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the mint master says fake noble seals flood the markets — your face on false decrees.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the forgers publicly.", response = "Fear refreshes respect. Merchants tremble honestly.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Recall all seals and reissue.", response = "Expensive order. The false seals die slowly — but they die.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Ignore the forgeries", response = "Lazy. Someone will test that theory with rebellion.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            prompt = "Your Majesty, Ashford's envoy asks whether you will attend the eastern hunt — or be called too common for noble sport.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Attend the hunt", response = "Sport buys gossip. You will hear useful things between boars.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Send a proxy", response = "Practical snub. They will measure the proxy's rank.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Decline the invitation", response = "An insult dressed as principle. The army approves; the east does not.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Your Majesty, two houses dispute a bride's dowry after the groom died in your levy. Both want the crown to judge.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Rule for the bride's house.", response = "Mercy seen as weakness or justice, depending on the hall.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Rule for the groom's house", response = "Hard law. Soldiers' families cheer.", statDeltas = fixed_array(-5, 0, 5, 8, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Seize dowry for the treasury.", response = "Everyone hates you equally. The purse smiles.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -12, 0, 0)),
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
            prompt = "Your Majesty, Baron Holt refuses to pay the crown tax. He says his grandfather fought for Edwin's grandfather, and that debt was never repaid. Half the eastern barons are watching to see if you collect.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Send soldiers to collect", response = "The coin comes back with a broken gate. The barons pay — and remember.", statDeltas = fixed_array(-3, 0, 4, 12, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Forgive this year's tax", response = "Generous. Every baron with a grandfather will now write you a letter.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Pay the old debt with a title, not coin", response = "Clever. A title costs you ink. Holt will brag about it at every feast.", statDeltas = fixed_array(0, 0, 0, 4, 0, 0, 5, 0, 0)),
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
            prompt = "Your Majesty, my river barges pay a toll at every lord's bridge between here and the sea — eleven tolls in all. Grain costs triple by the time it reaches your city. Break the tolls, or my barges stop.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Abolish the river tolls", response = "Bread gets cheaper and eleven lords get angrier. The river does not care.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -12, 8, 0)),
            DialogueChoice(choiceText = "Buy out the tolls for the crown", response = "Expensive. But now the crown collects the toll — and decides how high it is.", statDeltas = fixed_array(3, 0, 0, -15, 0, 0, 4, 4, 0)),
            DialogueChoice(choiceText = "Leave the tolls alone", response = "Then the lords smile and the bakers raise their prices.", statDeltas = fixed_array(-6, 0, 0, 0, 0, 0, 6, -5, 0)),
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
            prompt = "Your Majesty, at tonight's banquet someone must sit at your right hand. Every house believes it is them. Choose wrong and three houses leave before dessert.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Seat Lady Ashford", response = "Then the east is pleased and the south counts the insult.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Seat the oldest lord present", response = "Tradition is hard to argue with. Old Lord Fenn falls asleep before the soup.", statDeltas = fixed_array(0, 2, 0, 0, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Seat a hero from the army", response = "The lords are offended. The soldiers hear about it by midnight and cheer.", statDeltas = fixed_array(3, 0, 8, 0, 0, 0, -8, 0, 0)),
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
            prompt = "Your Majesty, peasants on Lord Varrow's estate burned his barns. He beat them for poaching rabbits in a hungry winter. He wants soldiers. They want justice.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Send soldiers to Varrow", response = "The fires go out. The anger does not.", statDeltas = fixed_array(-10, 0, 3, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Judge Varrow for cruelty", response = "A lord on trial for beating peasants. The villages sing. The castles shiver.", statDeltas = fixed_array(12, 0, 0, 0, 0, 0, -12, 0, 0)),
            DialogueChoice(choiceText = "Pay for new barns and pardon everyone", response = "Peace bought with timber. Expensive, but nobody hangs this week.", statDeltas = fixed_array(4, 0, 0, -10, 0, 0, 3, 2, 0)),
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
            prompt = "Your Majesty, three noble houses want to buy the title of 'Royal Supplier of Wine.' It means nothing — except a seal on the barrel and a higher price. Shall I hold an auction?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Auction the title", response = "Two houses lose and sulk. One wins and overcharges everyone. The treasury sings.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -3, 0, 0)),
            DialogueChoice(choiceText = "Give it to the house that served me best", response = "Loyalty rewarded with wine. The losers drink theirs bitterly.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Refuse to sell royal titles", response = "Noble. The houses think you naive. The merchants think you honest.", statDeltas = fixed_array(3, 0, 0, -3, 0, 0, -2, 0, 0)),
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
            prompt = "Your Majesty, the lords want their eldest sons to serve as royal pages. It is an old custom: their children in your palace. Some call it honor. Some call it hostages.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the noble pages", response = "Every lord now has a reason to keep you alive. And a spy in your halls.", statDeltas = fixed_array(0, 0, 2, -5, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Take pages from merchant families instead", response = "The merchants are delighted. The lords are insulted.", statDeltas = fixed_array(4, 0, 0, 5, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "End the custom", response = "No hostages, no spies, no favors. The court feels emptier.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -4, 0, 0)),
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
            prompt = "Your Majesty, Lord Brannock's private army is larger than my eastern garrison. He says it guards his mines. I say a lord with three thousand spears is not guarding mines.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Order him to disband half", response = "He obeys — slowly. Half his men join bandits, half join me.", statDeltas = fixed_array(0, 0, 6, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Hire his army for the crown", response = "Then his spears are yours — while you pay. Brannock likes the arrangement too much.", statDeltas = fixed_array(0, 0, 10, -12, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Leave him be", response = "Then pray his mines stay his only interest.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 5, 0, 0)),
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
        characterIdx = CHAR_MARIANNA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, my cousin wishes to marry a miller's daughter. Our house forbids it. The girl's village says love should be stronger than titles. Will the crown say anything?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Bless the marriage", response = "The commons adore a love story. My family will not invite you to the wedding.", statDeltas = fixed_array(8, 3, 0, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Support the house's decision", response = "Order is preserved. One heart is broken. Nobody sings about order.", statDeltas = fixed_array(-4, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Give the miller's daughter a small title", response = "Problem solved with ink. The other houses fear you will do it again.", statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)),
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
            prompt = "Your Majesty, Lord Tessel's son killed a servant in a drunken fight. By old law a noble pays blood-money instead of hanging. The servant's family wants the rope.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang him like any man", response = "One law for all. The commons will remember this for years. So will Tessel.", statDeltas = fixed_array(12, 0, 0, 0, 0, 0, -14, 0, 0)),
            DialogueChoice(choiceText = "Follow the old law: blood-money", response = "Gold for a life. Legal. The streets call it something else.", statDeltas = fixed_array(-10, 0, 0, 3, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Exile the son, double the payment", response = "No rope, no mercy. Neither side is happy, both can live with it.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -3, 0, 0)),
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
            prompt = "Your Majesty, I wish to hold a tournament in your honor. Jousting, archery, and a race of geese. The lords will come to show off. The people will come to laugh. You will pay.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hold a grand tournament", response = "Banners, trumpets, and a goose that wins the race by biting the favorite. Unforgettable.", statDeltas = fixed_array(8, 0, 3, -15, 0, 0, 10, -3, 0)),
            DialogueChoice(choiceText = "A small tournament, no geese", response = "Respectable. Dull. The lords still come; the people stay home.", statDeltas = fixed_array(0, 0, 2, -6, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Cancel it", response = "The lords grumble about a king who does not know how to celebrate.", statDeltas = fixed_array(-2, 0, 0, 4, 0, 0, -6, 0, 0)),
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
            prompt = "Your Majesty, the nobles pay no salt tax, no road tax, and no bridge tax — privileges from Edwin's great-grandfather. If they paid like merchants, the treasury would be full by spring.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "End the noble privileges", response = "Full coffers, empty friendships. Every castle will now call you a merchant king.", statDeltas = fixed_array(6, 0, 0, 18, 0, 0, -15, 0, 0)),
            DialogueChoice(choiceText = "Tax only the richest houses", response = "Half the gold, half the anger. The poor lords secretly thank you.", statDeltas = fixed_array(2, 0, 0, 8, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Keep the old privileges", response = "The lords toast your wisdom. Borvin toasts nothing.", statDeltas = fixed_array(-4, 0, 0, -4, 0, 0, 8, 0, 0)),
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
            prompt = "Your Majesty, Lord Corran raided a northern village last week — for sport, he says. My princes ask whether your lords obey you, or only themselves.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hand Corran to the north for judgment", response = "The princes are impressed. Your lords are horrified that you gave one of them away.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, -12, 0, 0)),
            DialogueChoice(choiceText = "Punish him yourself and pay the village", response = "Justice at home, coin abroad. Both sides can call it fair.", statDeltas = fixed_array(0, 0, 2, -10, 0, 0, -4, 0, 0)),
            DialogueChoice(choiceText = "Defend Corran — it was a border skirmish", response = "Your lords cheer. The north sharpens its spears.", statDeltas = fixed_array(0, 0, -6, 0, 0, 0, 10, 0, 0)),
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
            prompt = "Your Majesty, Lady Wren hosts a salon where poets read verses about kings. Some verses are about you. Not all are kind. The lords love her evenings.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Attend her salon in person", response = "The poets stammer. Lady Wren is charmed. The verses get kinder by Friday.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Close the salon", response = "Then the verses move to taverns, where they rhyme with worse words.", statDeltas = fixed_array(-4, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Pay a poet to write in my praise", response = "One flattering poem among ten mocking ones. Everyone knows who paid.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 2, 0, 0)),
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
            prompt = "Your Majesty, Lord Penhallow refuses to let my healers inside his walls. Fever spreads in his villages, but he fears his own family will catch it from 'common hands.'",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Force the gates open for the healers", response = "The sick get bottles. Penhallow gets a grudge. Fair trade.", statDeltas = fixed_array(4, 0, -2, 0, 10, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Send a royal physician, not common healers", response = "Expensive, polite, and slow. The fever is not polite.", statDeltas = fixed_array(0, 0, 0, -8, 5, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Respect his wishes", response = "His family stays safe behind the walls. His villages do not.", statDeltas = fixed_array(-6, 0, 0, 0, -10, 0, 5, 0, 0)),
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
            prompt = "Your Majesty, half your nobles owe my bank more than their land is worth. I could take their castles tomorrow. I would rather the crown buy their debts from me — at a fair discount.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy the noble debts", response = "Now the lords owe you, not me. A leash is a leash, whoever holds it.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Let Salt take the castles", response = "Banker lords. The old houses will never forgive you for letting it happen.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, -15, 0, 0)),
            DialogueChoice(choiceText = "Cancel the interest by royal decree", response = "The lords love you. My bank does not. Other banks will remember.", statDeltas = fixed_array(0, 0, 0, -6, 0, 0, 10, 0, 0)),
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
            prompt = "Your Majesty, the old council chamber has a seat carved for each great house. Four seats sit empty since the coup. Fill them with new families, or leave them empty as a warning?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Raise four new families", response = "New lords, grateful lords. The old houses call them upstarts.", statDeltas = fixed_array(3, 0, 0, -6, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Return the seats to the old families' heirs", response = "Generous to former enemies. Some will repay it. Some will not.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Leave them empty", response = "Four empty chairs are louder than any speech.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -6, 0, 0)),
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
            prompt = "Your Majesty, the lords hunt in the royal forest and leave half the deer to rot. The villagers next to the forest are starving. They ask if they may take what the lords throw away.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let the villagers take the leftovers", response = "Venison in peasant pots. The lords find it vulgar. The villagers find it delicious.", statDeltas = fixed_array(8, 0, 0, 0, 2, 0, -4, 5, 0)),
            DialogueChoice(choiceText = "Limit how many deer the lords may kill", response = "Fewer trophies, fuller forests. The lords sulk at dinner.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -6, 3, 0)),
            DialogueChoice(choiceText = "The forest belongs to the lords", response = "Then the deer rot in peace and the villages poach in secret.", statDeltas = fixed_array(-6, 0, 0, 0, 0, 0, 6, 0, 0)),
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
        characterIdx = CHAR_NERIUS,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Lord Ostrand found silver in his hills. By law, a third of every silver mine belongs to the crown. He says the law is older than your reign and does not apply.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Demand the crown's third", response = "The law is the law, even for silver. Ostrand pays and plots.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Take a smaller share in exchange for peace", response = "A tenth now, a friend later. Maybe.", statDeltas = fixed_array(0, 0, 0, 6, 0, 0, 3, 0, 0)),
            DialogueChoice(choiceText = "Let him keep it all", response = "Ostrand becomes very rich and very fond of you. Until someone richer is fond of him.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 8, 0, 0)),
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
            prompt = "Your Majesty, my house was insulted: a southern lord painted my coat of arms on his privy door. I demand that he apologize publicly — or I take satisfaction with steel.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Order a public apology", response = "He apologizes through his teeth. The door is repainted. Peace, of a sort.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Let them duel", response = "Blood over a privy door. The chroniclers will laugh for a hundred years.", statDeltas = fixed_array(-2, 0, 2, 0, 0, 0, -4, 0, 0)),
            DialogueChoice(choiceText = "Laugh it off in front of the court", response = "The court laughs with you. Kaspar does not laugh at all.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -6, 0, 0)),
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
            prompt = "Your Majesty, Lady Marrow, Edwin's cousin, still wears mourning and refuses to bow to you. She has done nothing else. The guard asks whether a refusal to bow is treason.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let her grieve in peace", response = "Mercy to a widow. The old families notice and soften a little.", statDeltas = fixed_array(2, 2, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Banish her from court", response = "One fewer black dress at feasts. Many more whispers behind them.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Visit her and offer a pension", response = "She refuses the coin but remembers the visit.", statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 5, 0, 0)),
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
            prompt = "Your Majesty, the lords pay me to sing about their ancestors' glory. The people pay me to sing about the lords' greed. Both songs sell. Which one should the palace hear on the feast day?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "The song of noble glory", response = "The lords weep into their wine. The kitchen staff roll their eyes.", statDeltas = fixed_array(-3, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "The song of noble greed", response = "The hall goes silent. The servants hum it for a month.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "A new song about the realm", response = "Nobody is insulted and nobody remembers it tomorrow. A safe song.", statDeltas = fixed_array(2, 0, 0, -3, 0, 0, 2, 0, 0)),
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
            prompt = "Your Majesty, the young lords want to form a royal cavalry company — at their own expense, with their own colors. Brave boys. They want to ride under your banner, but command themselves.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept, with a royal captain in command", response = "They grumble about the captain and ride well anyway.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Accept on their terms", response = "Fine horses, fine armor, and no one who listens to Rudolf.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Refuse noble companies", response = "One army, one command. The young lords go home bored — and boredom is dangerous.", statDeltas = fixed_array(0, 0, 2, 0, 0, 0, -8, 0, 0)),
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
            prompt = "Your Majesty, Lord Hargrave wants to give his estate to the Church when he dies, to skip the crown's inheritance tax. His sons are furious. The Church is very pleased.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Allow the gift to the Church", response = "God gains a manor. The crown loses a tax. The sons lose everything.", statDeltas = fixed_array(0, 12, 0, -5, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Forbid it — land stays with the family", response = "The sons thank you. The Church will mention you in Sunday's sermon, unkindly.", statDeltas = fixed_array(0, -8, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Allow it, but tax the gift", response = "Everyone pays something. Everyone complains a little.", statDeltas = fixed_array(0, 4, 0, 6, 0, 0, -2, 0, 0)),
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
            prompt = "Your Majesty, my house will build you a stone bridge over the Swift River — if our family name is carved on it and we collect its toll for fifty years.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the deal", response = "A bridge for free, a toll forever. The south is now a little more Crow's.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, 8, 3, 0)),
            DialogueChoice(choiceText = "Build it with crown money", response = "Your name on the stone and your coin in the river. Expensive, but yours.", statDeltas = fixed_array(5, 0, 0, -15, 0, 0, -3, 3, 0)),
            DialogueChoice(choiceText = "No bridge for now", response = "The ferrymen are happy. Everyone else waits.", statDeltas = fixed_array(-2, 0, 0, 0, 0, 0, -3, 0, 0)),
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
            prompt = "Your Majesty, Lord Dunmore's lands have been empty since he fled with Edwin's treasure. Squatters farm them now — families with no land of their own. His heir wants them thrown out.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Give the land to the squatters", response = "New farmers, loyal farmers. The heir joins your enemies.", statDeltas = fixed_array(10, 0, 0, 0, 0, 0, -10, 5, 0)),
            DialogueChoice(choiceText = "Return it to the heir", response = "Law upheld. Families on the road. Raymond takes note.", statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 8, -3, 0)),
            DialogueChoice(choiceText = "The heir keeps it, but must rent to them", response = "Nobody owns everything, everybody eats something.", statDeltas = fixed_array(4, 0, 0, 0, 0, 0, 2, 2, 0)),
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
            prompt = "Your Majesty, I have letters showing that Lady Ashford's steward sold your grain to the north. Not Ashford herself — probably. Use the letters, sell them back to her, or burn them.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accuse the steward publicly", response = "The steward hangs. Ashford smiles and hates you for the embarrassment.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -8, 4, 0)),
            DialogueChoice(choiceText = "Give the letters to Ashford privately", response = "Now she owes you. She does not like owing.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Burn them", response = "Then the steward keeps selling, and you keep wondering.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, -5, 0)),
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
            prompt = "Your Majesty, the noble academy trains young lords in law, war, and dancing. It asks for royal funds. Its graduates will run your realm one day — the question is what they will learn.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Fund it and add lessons in governance", response = "Future lords who can count. A rare and valuable thing.", statDeltas = fixed_array(0, 0, 2, -12, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Open it to merchant sons as well", response = "The lords protest. The merchants pay double to get in.", statDeltas = fixed_array(4, 0, 0, 5, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Refuse the funds", response = "Then the academy teaches only dancing. Graceful, useless lords.", statDeltas = fixed_array(0, 0, 0, 3, 0, 0, -4, 0, 0)),
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
        characterIdx = CHAR_MARIANNA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, my house has captured a famous bandit, the Red Fox, who robbed only noble wagons. The people call him a hero. We want to hang him in our square.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let House Dell hang him", response = "The nobles applaud. The people make him a martyr and sing about him for years.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Pardon him into the royal army", response = "A famous bandit in your colors. The nobles are furious; the recruits multiply.", statDeltas = fixed_array(8, 0, 6, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Imprison him quietly", response = "No rope, no legend. Just a cell and a rumor.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 2, 0, 0)),
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
            prompt = "Your Majesty, Lord Fenwick has hoarded three barns of grain while prices rise. It is legal. It is also why the bakers are rioting in his town.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Buy his grain at a fair price", response = "The riot ends. Fenwick gets rich, which was his plan all along.", statDeltas = fixed_array(5, 0, 0, -12, 0, 0, 4, 10, 0)),
            DialogueChoice(choiceText = "Seize the grain", response = "Bread for the town, fear for the castles.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -12, 12, 0)),
            DialogueChoice(choiceText = "It is legal — do nothing", response = "Then the bakers keep rioting and Fenwick keeps waiting.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 6, -4, 0)),
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
            prompt = "Your Majesty, my daughter turns sixteen. The east expects a royal gift for her name-day. A small thing. The size of the gift will be measured by every house.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "A rich gift — a silver tiara", response = "The east is honored. The south asks when its daughters turn sixteen.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "A modest gift — a book of poems", response = "Tasteful. Cheap. Ashford wonders whether it is an insult.", statDeltas = fixed_array(0, 0, 0, -2, 0, 0, 2, 0, 0)),
            DialogueChoice(choiceText = "Invite her to court as a lady-in-waiting", response = "A great honor — and an Ashford in your halls every day.", statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 10, 0, 0)),
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
            prompt = "Your Majesty, the lords complain that I sit too close to you at feasts. They say a fool should sit with the dogs. I say the dogs are better company than most of them.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Keep the Goose by my side", response = "The lords sulk. The Goose honks in triumph. The people find it hilarious.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Seat him with the dogs, as they ask", response = "The Goose bows and eats from a silver bowl on the floor. Somehow the lords look worse.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Make him Lord of the Feast for one night", response = "A fool gives orders to the nobles. Chaos, songs, and one very long night.", statDeltas = fixed_array(8, 0, 0, -5, 0, 0, -8, 0, 0)),
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
            prompt = "Your Majesty, I hold the eastern pass, and I have done it for free since the coup. My men need winter coats and my walls need stone. The east asks for nothing — except this.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay for coats and stone", response = "The pass stays closed to raiders. Kaspar speaks warmly of you all winter.", statDeltas = fixed_array(0, 0, 6, -12, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Send royal soldiers to replace his men", response = "Your soldiers on his pass. He calls it help. He means occupation.", statDeltas = fixed_array(0, 0, 4, -6, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "The east can afford its own coats", response = "The east remembers who paid and who did not.", statDeltas = fixed_array(0, 0, -4, 0, 0, 0, -6, 0, 0)),
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
            prompt = "Your Majesty, a noble cannot trade without losing his honor, says the old law. So the lords hide behind merchant partners and pay no trade tax. Let them trade openly — and pay like us.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Allow nobles to trade openly and tax them", response = "Honor survives. Hidden profits do not.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -4, 0, 0)),
            DialogueChoice(choiceText = "Enforce the old law strictly", response = "The lords lose their hidden partners. They blame you, loudly.", statDeltas = fixed_array(0, 0, 0, 4, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Change nothing", response = "The guilds pay, the lords hide, and Fara remembers.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 5, 0, 0)),
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
            prompt = "Your Majesty, the great book of noble families must be updated. Three families claim to be older than the crown itself. If I write it, it becomes truth in a hundred years.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Write what the families say", response = "Three proud houses. One slightly smaller crown.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Write only what can be proven", response = "Honest history. Three families now hate historians.", statDeltas = fixed_array(0, 2, 0, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Sell the right to be 'ancient'", response = "History for sale. The treasury is grateful. Future scholars are not.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, 2, 0, 0)),
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
            prompt = "Your Majesty, the noble officers refuse to take orders from common-born captains, even good ones. In battle, that kind of pride gets men killed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Promote by merit only", response = "The army fights better. The noble officers resign in a huff — some of them.", statDeltas = fixed_array(3, 0, 10, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Separate noble and common companies", response = "Two armies inside one. It works until they must fight together.", statDeltas = fixed_array(0, 0, 2, -4, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Noble birth keeps its rank", response = "The lords are pleased. The best captains look for other work.", statDeltas = fixed_array(-3, 0, -8, 0, 0, 0, 8, 0, 0)),
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
            prompt = "Your Majesty, the lords order silks, spices, and glass from the south — on credit, in your name, as 'royal guests.' The merchants want the crown to pay their bills.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay the bills this once", response = "Paid. The lords learn that your name is a purse.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Send the bills to the lords", response = "Embarrassed lords pay, slowly. The merchants trust the crown again.", statDeltas = fixed_array(0, 0, 0, 3, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Forbid buying in the crown's name", response = "A simple decree. The lords call it stingy; the merchants call it sane.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -3, 0, 0)),
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
            prompt = "Your Majesty, Lord Graves was caught selling forged land deeds. By noble custom he may choose his own death — wine with poison, or the sword. Or you may simply hang him.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Let him choose, as custom says", response = "He chooses wine, and dies like a lord. The custom survives.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Hang him like a common forger", response = "The commons cheer. Every noble feels the rope a little.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Take his lands and spare his life", response = "A poor lord is a living lesson. The treasury likes this lesson.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -4, 0, 0)),
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
            prompt = "Your Majesty, the lords' winter balls waste enough food to feed my lower ward for a month. I ask only that the leftovers come to my kitchen, not the pigs.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Order the leftovers sent to the poor", response = "Noble scraps in the soup line. The lords call it humiliating. The poor call it dinner.", statDeltas = fixed_array(8, 4, 0, 0, 3, 0, -6, 3, 0)),
            DialogueChoice(choiceText = "Ask the lords politely", response = "Two lords agree. The rest feed their pigs out of spite.", statDeltas = fixed_array(2, 2, 0, 0, 0, 0, 0, 1, 0)),
            DialogueChoice(choiceText = "Their feasts are their business", response = "The pigs are very fat this winter.", statDeltas = fixed_array(-5, -2, 0, 0, 0, 0, 4, 0, 0)),
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
            prompt = "Your Majesty, a northern prince wishes to visit your court with two hundred riders. As a guest. Your lords ask whether a guest with two hundred riders is still a guest.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Welcome him with all his riders", response = "A brave welcome. The lords keep their swords near the table.", statDeltas = fixed_array(0, 0, -4, -8, 0, 0, 4, -4, 0)),
            DialogueChoice(choiceText = "Welcome him with twenty riders only", response = "A reasonable host. The prince is offended, but comes.", statDeltas = fixed_array(0, 0, 3, -4, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Refuse the visit", response = "Your lords sleep easier. The north sleeps less.", statDeltas = fixed_array(0, 0, 2, 0, 0, 0, 3, 0, 0)),
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

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
            DialogueChoice(choiceText = "Refuse", response = "Bold. The great houses will remember who refused insurance.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the match.", response = "Then ink binds blood. The realm sees a dynasty forming, not a blade.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Counter with a trade charter instead.", response = "Commerce instead of cousins. Cold, but cheaper.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Decline", response = "Pride keeps the crown light. The houses will call it arrogance.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            DialogueChoice(choiceText = "Refuse", response = "Then the landless become dangerous. You chose principle over peace.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
        characterIdx = CHAR_ILANA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant the barony", response = "Land for a legal claim abroad. The eastern lords will riot.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Pride intact. Diplomacy colder. Soldiers may benefit.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_DOMINIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay the feast", response = "Full tables, empty purse. They toast your name tonight.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
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
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Revoke Crow's rights.", response = "One house fed, one house furious. Forests do not vote.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Uphold Crow's ancient charter.", response = "Tradition wins. Vayne's mercenaries look elsewhere.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
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
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant a title", response = "Cheap nobility. True claimants will notice.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Hard line. The petitioner's friends become whisperers.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
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
            DialogueChoice(choiceText = "Recall all seals and reissue.", response = "Expensive order. fake seal dies slowly, dies nonetheless.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Ignore", response = "Lazy. Someone will test that theory with rebellion.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            DialogueChoice(choiceText = "Decline", response = "Insult dressed as principle. Army approves.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_SELENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant Ashford's cousin a seat.", response = "Then blood buys silence. Efficient, if you can stomach the receipt.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Offer a lesser title without council voice.", response = "Half a crown for half a loyalty. They will negotiate louder tomorrow.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Bold. The great houses will remember who refused insurance.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the match.", response = "Then ink binds blood. The realm sees a dynasty forming, not a blade.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Counter with a trade charter instead.", response = "Commerce instead of cousins. Cold, but cheaper.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Decline", response = "Pride keeps the crown light. The houses will call it arrogance.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant eastern manors to loyal lords.", response = "Land buys swords. The peasants on those manors will scream.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Sell the estates at auction.", response = "Gold now, grudges later. The treasury breathes.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Then the landless become dangerous. You chose principle over peace.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
        characterIdx = CHAR_KASPAR,
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
        characterIdx = CHAR_MARIANNA,
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
        characterIdx = CHAR_ILANA,
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
        characterIdx = CHAR_DOMINIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant the barony", response = "Land for a legal claim abroad. The eastern lords will riot.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Pride intact. Diplomacy colder. Soldiers may benefit.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay the feast", response = "Full tables, empty purse. They toast your name tonight.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
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
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Revoke Crow's rights.", response = "One house fed, one house furious. Forests do not vote.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Uphold Crow's ancient charter.", response = "Tradition wins. Vayne's mercenaries look elsewhere.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
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
        characterIdx = CHAR_ARVEL,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant a title", response = "Cheap nobility. True claimants will notice.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Hard line. The petitioner's friends become whisperers.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the mint master says fake noble seals flood the markets — your face on false decrees.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the forgers publicly.", response = "Fear refreshes respect. Merchants tremble honestly.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Recall all seals and reissue.", response = "Expensive order. fake seal dies slowly, dies nonetheless.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Ignore", response = "Lazy. Someone will test that theory with rebellion.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            DialogueChoice(choiceText = "Decline", response = "Insult dressed as principle. Army approves.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant Ashford's cousin a seat.", response = "Then blood buys silence. Efficient, if you can stomach the receipt.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Offer a lesser title without council voice.", response = "Half a crown for half a loyalty. They will negotiate louder tomorrow.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Bold. The great houses will remember who refused insurance.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the match.", response = "Then ink binds blood. The realm sees a dynasty forming, not a blade.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Counter with a trade charter instead.", response = "Commerce instead of cousins. Cold, but cheaper.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Decline", response = "Pride keeps the crown light. The houses will call it arrogance.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_ASHFORD,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant eastern manors to loyal lords.", response = "Land buys swords. The peasants on those manors will scream.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Sell the estates at auction.", response = "Gold now, grudges later. The treasury breathes.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Then the landless become dangerous. You chose principle over peace.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
        characterIdx = CHAR_YVETTE,
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
        characterIdx = CHAR_ILANA,
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
        characterIdx = CHAR_DOMINIC,
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
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the ambassador says northern princes will recognize your crown if you grant a border barony to their cousin.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant the barony", response = "Land for a legal claim abroad. The eastern lords will riot.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Pride intact. Diplomacy colder. Soldiers may benefit.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, cook's feast for the great houses exceeded the budget. The treasurer blames the steward; the steward blames your generosity.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Pay the feast", response = "Full tables, empty purse. They toast your name tonight.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
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
        characterIdx = CHAR_ARVEL,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, Vayne house offers swords if you revoke Crow's hunting rights on crown forest.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Revoke Crow's rights.", response = "One house fed, one house furious. Forests do not vote.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Uphold Crow's ancient charter.", response = "Tradition wins. Vayne's mercenaries look elsewhere.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
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
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, a bastard son of Edwin's cousin petitions for a minor title — proof the old blood still breathes.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant a title", response = "Cheap nobility. True claimants will notice.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Hard line. The petitioner's friends become whisperers.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the mint master says fake noble seals flood the markets — your face on false decrees.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Hang the forgers publicly.", response = "Fear refreshes respect. Merchants tremble honestly.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Recall all seals and reissue.", response = "Expensive order. fake seal dies slowly, dies nonetheless.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Ignore", response = "Lazy. Someone will test that theory with rebellion.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            DialogueChoice(choiceText = "Decline", response = "Insult dressed as principle. Army approves.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the eastern lords want a seat on the king's council before winter — or they will call your reign a coup of merchants.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant Ashford's cousin a seat.", response = "Then blood buys silence. Efficient, if you can stomach the receipt.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Offer a lesser title without council voice.", response = "Half a crown for half a loyalty. They will negotiate louder tomorrow.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Bold. The great houses will remember who refused insurance.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Your Majesty, a marriage proposal arrived from the Dell house — land for your lawful rule, and your lawful name for the king who took the throne.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Accept the match.", response = "Then ink binds blood. The realm sees a dynasty forming, not a blade.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Counter with a trade charter instead.", response = "Commerce instead of cousins. Cold, but cheaper.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Decline", response = "Pride keeps the crown light. The houses will call it arrogance.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_KASPAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, landless lords camp outside the walls. They want estates from Edwin's seized holdings — or they will fund your enemies.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Grant eastern manors to loyal lords.", response = "Land buys swords. The peasants on those manors will scream.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Sell the estates at auction.", response = "Gold now, grudges later. The treasury breathes.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Refuse", response = "Then the landless become dangerous. You chose principle over peace.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
        characterIdx = CHAR_MARIANNA,
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
    )
)

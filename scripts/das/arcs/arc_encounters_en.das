require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
module arc_encounters_en public

let public arc0BeatsEn : Encounter[8] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_GROMM,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, the nobles await your first royal feast. If I set the table as tradition demands, the city granaries will grow thin.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hold a lavish feast", response = "The feast will be such that guests forget hunger. The city, perhaps, will not.", statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, -20, 0)),
                        DialogueChoice(choiceText = "Hold a modest feast", response = "A modest feast is when nobles still eat, but complain more quietly.", statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 0, -8, 0)),
                        DialogueChoice(choiceText = "Cancel the feast and feed the poor", response = "Bread below will be valued more than peacock above.", statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)),
                        DialogueChoice(choiceText = "Can we fool the guests?", response = "", statDeltas = NO_STAT_CHANGE, nextNodeIdx = 1),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(
                    prompt = "We can. Cheap meat, costly sauce, many candles — and half the guests will swear they ate a rarity.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Serve a cheap feast dressed as luxury", response = "I like it when royal wisdom smells of garlic and deceit.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, -5, 0)),
                        DialogueChoice(choiceText = "No — if there is a feast, make it real", response = "It will be real. So will the hunger afterward.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, -20, 0)),
                        DialogueChoice(choiceText = "Cancel the feast entirely", response = "Then I will save the meat. In our times that is almost treason.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, 5, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
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
                    prompt = "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. I heard you kept Gromm in the kitchens — my men want to know if old swords get the same mercy, or only old spoons. Give me an order before they give themselves one.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Replace them", response = "Done by morning. The old ones will hate you. The new ones will owe you. That is the trade.", statDeltas = fixed_array(0, 0, 10, -5, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Swear them to me", response = "I will extract their oaths before dawn. If one refuses, you will hear it from me first.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, -3)),
                        DialogueChoice(choiceText = "Arrest the ringleaders", response = "Selective steel. The barracks will call it justice or spite depending on tomorrow's rations.", statDeltas = fixed_array(0, 2, 3, 0, 0, -2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. I heard you kept Gromm, and Varn reforged the guard. Yet warrants signed in a dead king's name still leave this room. Which fake seal is yours: the seal, the clerk, or the silence?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Burn Edwin's seal", response = "The archives will riot in parchment before steel. But the throne will sign in your name alone.", statDeltas = fixed_array(0, 0, 0, 12, 0, -8, 0, 0, 4)),
                        DialogueChoice(choiceText = "Pay one season", response = "A soft landing. Expensive. The copyists will use the season to plot or pray.", statDeltas = fixed_array(0, 0, 0, -10, 0, 3, 0, 0, 2)),
                        DialogueChoice(choiceText = "Investigate", response = "Then we follow the wax. Names will surface. Some will be innocent. None will be cheap.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Brother Aldo confessed King Edwin every seventh day — he still does, to an empty throne. I heard you burned Edwin's seal or cut his ghost offices last week. Three of them fled to my gate with Osric's ink on their fingers. Aldo asks whether the new king shelters priests, or only hungers for names.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Shelter Aldo", response = "Then he stays under my roof and your risk. Malrik will hear of it before sunset.", statDeltas = fixed_array(0, 8, 0, 0, 0, 4, 0, 0, -5)),
                        DialogueChoice(choiceText = "Surrender him to the crown for questioning", response = "He will come quietly. What he knows about lords and sins could fill a scaffold schedule.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -8, 0, 8)),
                        DialogueChoice(choiceText = "Exile him", response = "Gold buys silence and distance. Whether it buys enough depends on how loudly he prays on the road.", statDeltas = fixed_array(0, 3, 0, -8, 0, 0, 0, 0, 3)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, loyalist households still buy grain through my caravans — they pay in Edwin's sealed notes and curse your name between mouthfuls. I heard Captain Varn tightened the gates after you purged his old guard. That squeezes my routes and their purses. Do you want loyalists starved, spied on, or sold to you?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Seize loyalist storehouses", response = "Hungry enemies are slow enemies. Hungry subjects are loud subjects. Choose which noise you prefer.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, 15, 0)),
                        DialogueChoice(choiceText = "Spy through Selena's routes", response = "I will sell you names, not honor. Remember I can sell yours as well if the price changes.", statDeltas = fixed_array(0, 0, 0, -6, 0, -3, 0, 0, 10)),
                        DialogueChoice(choiceText = "Ignore loyalist trade", response = "Then they eat in shadows and thank Edwin by candlelight. You will not see the cost until a province stops paying tax.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, -5, -4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I wore Edwin's tabard at Grey Pass and I wear yours now — but three companies still toast the dead king in the barracks. I heard you kept his cook, reforged his guard, cut his scribes, and bought names from Selena — each week a different message. Soldiers follow clarity. Tell me whether we purge brothers, pay them, or parade them before the men who replaced them.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Purge the veteran companies", response = "Then blood in the barracks before spring. The rest will kneel harder — if you pay the rest.", statDeltas = fixed_array(0, 0, 12, 0, 0, -12, 0, 0, 6)),
                        DialogueChoice(choiceText = "Pay them off", response = "Expensive peace. Cheaper than mutiny until the next empty purse.", statDeltas = fixed_array(0, 0, 8, -18, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Parade a pardon", response = "Theater with swords. If it works, you gain a song. If it fails, you gain a riot.", statDeltas = fixed_array(0, 0, 5, 0, 0, 6, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my post is your door — not the yard below. Yet Varn sent prisoners here, Osric's audit named clerks, and Arvel's gate still shelters whispers unless you forbade it. I heard mercy in the kitchens, steel in the barracks, gold in the market, and prayer in the cloister. The stair asks a simpler question: who do I turn away when the palace is full of Edwin's names?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Amnesty", response = "The stair goes quiet. The whispers do not. You have chosen mercy twice — pray it rhymes.", statDeltas = fixed_array(0, 0, -6, 0, 0, 12, 0, 0, -8)),
                        DialogueChoice(choiceText = "Send ringleaders to Morwen", response = "A few swings below, many sighs above. The middle path — until the next crisis.", statDeltas = fixed_array(0, 0, 6, 0, 0, -4, 0, 0, 5)),
                        DialogueChoice(choiceText = "Bar the door", response = "Then I hold the stair and the realm learns coldness by knocking. You will not lack for enemies at dawn.", statDeltas = fixed_array(0, 5, 8, 0, 0, -15, 0, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, eighty-six days since you told me how you would bear Edwin's household — and the court has its answer. I heard Gromm dismissed or driven out, Varn replaced, Osric's ghosts locked away. The kitchens are quiet. The barracks call you iron. You cleansed the court. History will argue justice. It will not argue hesitation.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard enough", response = "Then I write *iron* once, and close the chapter. You bought clarity at the price of warmth.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, 0, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc1BeatsEn : Encounter[8] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_LISSA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Lissa — I change sheets and pretend not to count the stains. The night of the coup, three chambers lit candles after midnight. I heard you cleansed Edwin's household, turned them, or let ghosts keep their shifts. Servants know who slept where. Hang gossip, pay gossip, or learn from it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hear her privately", response = "Then I speak softly and charge dearly. Truth is employment, not loyalty.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Silence her", response = "Then whispers go underground. Underground whispers grow mold. You chose silence.", statDeltas = fixed_array(0, 0, 3, 0, -3, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Reward her silence", response = "Gold buys lips closed. It does not buy hearts open. I will take the coin anyway.", statDeltas = fixed_array(0, 0, 0, -10, 0, 3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I am Til — licensed fool, unlicensed mirror. The court wants laughter before the granaries empty. I can mock the king who took the throne, mock the court that serves him, or mock neither and let tension rot. Malrik hates my mouth. The barracks love it. You hire the joke — choose the target.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Mock the court", response = "Then nobles blush and commons cheer. Dangerous comedy. Delicious comedy.", statDeltas = fixed_array(0, 0, 4, 0, 0, 8, -6, 0, 0)),
                        DialogueChoice(choiceText = "Mock the king who took the throne", response = "Bold. Rare. The court relaxes because you do not flinch. They may forget to fear you.", statDeltas = fixed_array(0, 0, 0, 0, 5, 5, 0, 0, -4)),
                        DialogueChoice(choiceText = "Silence Til", response = "Then the hall learns to whisper instead of laugh. Whispers are less funny and more pointed.", statDeltas = fixed_array(0, 4, 0, 0, 0, -5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the kitchen hears vows the chapel does not. I heard Lissa's gossip, Til's rhymes, and whether Edwin's cook still feeds a king who took the throne. Borvin counts grain while Ruta counts dust. Tell me whether the crown feeds the staff first, audits the staff, or pretends kitchens are not politics.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Staff rations first", response = "Then pots bless your name before heralds do. Expensive — but the stairs warm.", statDeltas = fixed_array(0, 0, 0, 0, 4, 10, 0, -6, 0)),
                        DialogueChoice(choiceText = "Audit the kitchens", response = "Then spoons hide and whispers sharpen. Order without love. Familiar palace music.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, 0, 3, 0)),
                        DialogueChoice(choiceText = "Shared hardship", response = "Dangerous solidarity. I will not call it noble until it works.", statDeltas = fixed_array(4, 0, 0, 0, 0, 6, 0, -4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Lissa sells stories. I sell silence. I heard you opened the stairs, silenced them, or bought them. My sword guards your door — not your reputation. Double my post, gag the maids, or let gossip flow and prove you can survive it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Trust Raena", response = "Then Lissa learns fear. I learn overtime. The door stays yours.", statDeltas = fixed_array(-4, 0, 5, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Trust the stairs", response = "Then I hear everything and repeat nothing — unless you ask. Harder job. Better court.", statDeltas = fixed_array(0, 0, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Trust neither", response = "Then both hate you equally. Paranoia loves rotation. So does Knox, apparently.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Edwin's chamber still receives candles — not from piety, from habit. I heard you haunt the palace, cleanse it, or ledger it case by case. Lock the room and anger ghosts, use it and anger nobles, or turn it into servant quarters and anger poets. The stairs watch which king you become at night.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Seal the chamber", response = "Then poets mourn and servants breathe easier. Both matter — on different floors.", statDeltas = fixed_array(0, 5, 0, 0, 3, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Use the chamber openly", response = "Bold insult to memory. The court calls it strength or insult to the sacred depending on who lost kin.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -8, 0, 8)),
                        DialogueChoice(choiceText = "Gift chamber to loyal staff", response = "Then Gromm weeps or curses. I cannot tell which. You bought warmth with symbolism.", statDeltas = fixed_array(0, 0, 0, 0, 0, 12, -4, -3, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the square wants bread — but it will take a joke first. I can roast the king who took the throne before the hungry finale, roast Ashford before she rides, or roast Malrik and dare the Church to laugh. Public roast builds trust or builds mobs. Choose the victim — or cancel the show.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Roast the crown", response = "Then they love you for a day. A day is currency this year.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, 0, -6)),
                        DialogueChoice(choiceText = "Roast the Church", response = "Malrik will call it treason. The market calls it overdue. I call it employment.", statDeltas = fixed_array(8, -12, 0, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Cancel the roast", response = "Then the square goes home angry without a punchline. Hunger remains. You chose caution.", statDeltas = fixed_array(0, 0, 4, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I bought a maid's memory and a pot-boy's schedule. Lissa's coup-night story walks in three ledgers already — Salt's, Ashford's eventual, and mine. I heard open stairs, silenced stairs, or loyal stairs. Purge the sellers, outbid the buyers, or let the leak teach you who still wants Edwin's chair.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Purge sellers", response = "Then the stairs freeze. Fear works. Loyalty pretends to work. Both invoice you.", statDeltas = fixed_array(-8, 0, 6, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Outbid Knox", response = "Then you rent silence weekly. I appreciate repeat customers.", statDeltas = fixed_array(0, 0, 0, -15, 0, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let coup story leak", response = "Then the court controls nothing — but learns who moves. Dangerous pedagogy.", statDeltas = fixed_array(4, 0, 0, 0, 0, -4, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, forty days since Lissa counted coup-night candles — and the stairs speak your name without spitting. I heard kitchens fed, doors guarded, jokes aimed at court not crown, Knox outbid. Loyal staff. Rare beneath a king who took the throne. Guard it before Ashford measures the upper halls.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the stairs", response = "Then I write *warm stairs*. Upper halls will test it soon.", statDeltas = fixed_array(6, 0, 0, 0, 6, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc2BeatsEn : Encounter[8] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUDOLF,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, the men who put you on the throne assembled for muster at dawn. The treasury sent silence. I heard Edric warn you that blades alone cannot keep a crown — he did not mention they still expect coin. Pay, promise, or tell them honor feeds barracks better than bread.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay half now", response = "Half a purse buys half loyalty. Today that may suffice. Do not make it habit.", statDeltas = fixed_array(0, 0, 10, -15, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Full payment", response = "Generous. The men will remember — until the next muster.", statDeltas = fixed_array(0, 0, 18, -25, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Honor is payment", response = "Then pray your walls are stronger than my captains' patience.", statDeltas = fixed_array(0, 0, -12, 5, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my house paid for the coup — the captains at the gates and the blades that crowned you. Time to settle the debt. Default, and the army learns who truly owns their captain.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Take Salt's loan on harsh terms", response = "Then my ink owns your mornings until the debt sleeps. The army will not know — yet.", statDeltas = fixed_array(0, 0, 5, 20, 0, -4, 0, 0, -8)),
                        DialogueChoice(choiceText = "Seize his rivals' ledgers", response = "You will find my books clean and my enemies' dirty. Useful — until every merchant fears you.", statDeltas = fixed_array(0, 0, 8, 12, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Renegotiate the debt", response = "Time is also currency. I will wait — and charge for waiting.", statDeltas = fixed_array(0, 0, 0, -5, 0, 4, 0, 0, -3)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I deserted Edwin's third company the week before your coup — and I did not return for yours. Forty men hide in the southern hills because the paymaster forgot them twice. I heard you kept Gromm or purged him, paid Rudolf or preached. We ask simpler questions: forgiveness, coin, or rope?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "forgiveness and enlistment", response = "Then we march for you until someone pays better. Today that is you.", statDeltas = fixed_array(0, 0, 12, -10, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pay them off", response = "Cheap peace. They will drink your coin and remember your name in songs you will not like.", statDeltas = fixed_array(0, 0, 3, -15, 0, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hunt them", response = "Then send men who are paid. Unpaid hunters become deserters by supper.", statDeltas = fixed_array(0, 0, -8, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three ledgers scream at once: Salt's coup debt, Rudolf's muster, and Edwin's ghost offices Osric still signs. I heard you paid soldiers, bargained with bankers, or fed them honor. Malrik's church tax has not yet arrived — but winter will. Which purse empties first: army, court, or crown reserves?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Army first", response = "Hungry scribes plot slower than hungry soldiers march. Arithmetic, not mercy.", statDeltas = fixed_array(0, 0, 12, -8, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Balance all three", response = "Everyone hates you equally. Politically efficient.", statDeltas = fixed_array(0, 0, 5, -5, 0, -2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hold reserves", response = "Promises are coins you mint yourself. Spend carefully.", statDeltas = fixed_array(0, 0, -6, 8, 0, -4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, two companies stack wagons at the lower gate — not to leave, they swear, but to remind you they could. I heard you chose which ledger bleeds, sheltered deserters or hunted them, and knelt or defied Malrik in the same fortnight. Soldiers listen to priests when pay is silence. Pay, punish, or parade.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Emergency pay from reserves", response = "Bought time. Not bought loyalty. Know the difference.", statDeltas = fixed_array(0, 0, 15, -20, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hang wagon captains", response = "Steel solves one company. The rest calculate whether rope pays better than gold.", statDeltas = fixed_array(0, 3, 6, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Parade and promise after church tax negotiation", response = "Theatre. If Malrik takes your purse on Sunday, cancel the play with interest.", statDeltas = fixed_array(0, 5, -4, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my company escorts grain — when grain pays. Rudolf wants a crown contract. Salt wants collateral. I heard your purse rattles emptier each week. Hire us on the throne's tab, let us sell to whoever pays today, or seize our wagons and pray unpaid men fight for free.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown contract", response = "Then my bolts point where you point — until your purse stops singing.", statDeltas = fixed_array(0, 0, 14, -18, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Free company", response = "Gold flows. Loyalties blur. War gets cheaper for everyone except you.", statDeltas = fixed_array(0, 0, -5, 8, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Seize wagons", response = "Then you gain bolts and lose reputation. Mercenaries remember seizures longer than kings remember pay.", statDeltas = fixed_array(0, 0, 10, 0, 0, -10, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I swore to Edwin as his household knight — and you sit in Edwin's chair. I have not spoken in court since the coup because speech costs coin I was not paid. I heard your army grumbles, your banker counts, your mercenary haggles. My silence is not loyalty. It is arithmetic. Swear me a wage, or swear me release.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Knight's stipend", response = "Then I draw steel when you ask. I still prefer not to speak. Saves us both embarrassment.", statDeltas = fixed_array(0, 0, 8, -12, 0, 6, 4, 0, 0)),
                        DialogueChoice(choiceText = "Release with honor", response = "Clean exit. The court loses a sword. You gain a witness who may testify elsewhere.", statDeltas = fixed_array(0, 0, -3, 0, 0, 3, 0, 0, -4)),
                        DialogueChoice(choiceText = "Service without pay", response = "Then my silence means contempt, not devotion. Remember I warned you.", statDeltas = fixed_array(0, 0, -5, 0, 0, -6, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, fifty-four days since muster without coin — and the men still answer when you call. I heard Salt paid, Otto sworn, wagons funded, deserters judged. The barracks call you a king who pays when it hurts. That is rarer than courage. Guard it.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the barracks", response = "Then march when I say march. Coin bought this loyalty. Spend it wisely.", statDeltas = fixed_array(0, 0, 12, -5, 0, 10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc3BeatsEn : Encounter[12] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUTA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Ruta from the western mills. The granaries cough dust where they once coughed grain. I heard Malrik's church tax collectors reach the villages before your tax men. I did not ride here for poetry — I rode because hungry millers remember who stole the harvest, and they do not always mean the weather.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Open crown reserves", response = "Then the mills will bless you until the next wagon. Expensive. Remembered.", statDeltas = fixed_array(0, 0, 0, -15, 0, 8, 0, 12, 0)),
                        DialogueChoice(choiceText = "Investigate hoarders", response = "Rope frightens merchants faster than sermons. You may hang the wrong man. The mills will not care if the right one squeals.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 0, 5, 4)),
                        DialogueChoice(choiceText = "The provinces must endure", response = "Then I return with more women and fewer manners. Remember I warned you before the ballads start.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the court expects roast on holy days and every day is holy when kings are nervous. I heard western mills send dust instead of flour. My ovens can bake for the palace or bake for the city — not both without coin or lies. Do I cook silence in the kitchens, or honesty at your table?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Public feast", response = "Then the commons see smoke and believe you. The treasury sees smoke and weeps.", statDeltas = fixed_array(0, 0, 0, -12, 0, 10, 0, 10, 0)),
                        DialogueChoice(choiceText = "Private court", response = "Hypocrisy with spices. The servants talk. They always talk.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 4, -5, 0)),
                        DialogueChoice(choiceText = "Fast with the city", response = "Thin soup for thin times. Malrik will call it piety. I call it politics that fills bellies a little.", statDeltas = fixed_array(0, 5, 0, 0, 0, 4, 0, 6, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my soup line wraps around the lower ward — longer each dawn. I heard Malrik named meat unclean or grain God's property. I heard you fed soldiers in secret or starved the faithful. The poor do not care which sermon wins. They care which pot boils.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund Arvel's lines", response = "Then the poor bless your name before Malrik's. He will call it theft of holiness. I call it lunch.", statDeltas = fixed_array(0, -6, 0, -10, 0, 8, 0, 8, 0)),
                        DialogueChoice(choiceText = "Let Malrik feed them", response = "Then he owns their knees. You own the walls. Standard trade.", statDeltas = fixed_array(0, 10, 0, 0, 0, -4, 0, -5, 0)),
                        DialogueChoice(choiceText = "Shut the lines", response = "Then riot becomes theology. You chose clarity. Clarity is not always mercy.", statDeltas = fixed_array(0, 0, 6, 0, 0, -12, 0, -6, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_BRAN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I speak for nine villages that still call you the king who took the throne — and still ask you for bread. I heard Ruta from the mills and Arvel from the soup line. We do not want your soul. We want your granary keys. Grant provincial charters to store grain, or send soldiers to guard empty bins.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Grant provincial grain charters", response = "Then villages guard their own winter. You guard your reputation. Both are work.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 10, -5)),
                        DialogueChoice(choiceText = "Refuse", response = "Then we bury our dead and remember your answer. Ruta will rhyme it.", statDeltas = fixed_array(0, 0, 4, 0, 0, -10, 0, -6, 0)),
                        DialogueChoice(choiceText = "Hire Bran's militia", response = "Dangerous peasants with spears. Cheaper than knights — until it isn't.", statDeltas = fixed_array(0, 0, 8, -8, 0, -3, 0, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the mountain eats men and spits ore. I heard villages store grain while miners eat pebbles. We can stop the forges that pay your army, or you can price bread in iron instead of gold. The crown buys our sweat — will it buy our supper?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Bread for ore", response = "Then the forges breathe and the mountains whisper your name. Until the price changes.", statDeltas = fixed_array(0, 0, 5, -10, 0, 6, 0, 8, 0)),
                        DialogueChoice(choiceText = "Crush the strike", response = "Steel on starving men. The ore flows. The story spreads.", statDeltas = fixed_array(0, 0, 8, 0, 0, -14, 0, -4, 0)),
                        DialogueChoice(choiceText = "Let Fara's guild broker", response = "Merchants profit. Forges turn. You owe Fara a favor — she will collect.", statDeltas = fixed_array(0, 0, 0, 6, 0, -5, 0, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I speak for the grain guild — not the Church, not the army, not the romantic millers. I heard you opened reserves, fed soup lines, or threatened strikers. Caravans will move if the crown guarantees prices. They will stop if you seize wagons. Hunger is a market. I am its priest.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown-guild compact", response = "Then the realm eats steadily and I grow rich steadily. Fair, if you control the word *fair*.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 12, 0)),
                        DialogueChoice(choiceText = "Seize guild granaries", response = "Then the guild calls you tyrant. The people call you fed — briefly.", statDeltas = fixed_array(0, 0, 0, 10, 0, -12, 0, 15, 0)),
                        DialogueChoice(choiceText = "Free market", response = "Gold flows upward. Bellies empty downward. Economics as theology.", statDeltas = fixed_array(0, 0, 0, 12, 0, -8, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I sing for coins and causes. I heard mills empty, soup lines grow, miners strike, and merchants count. My new verse names you — the king who took the throne — hungry or generous, depending what you fed the city this week. Sponsor the song, silence it, or let the market choose your reputation.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Sponsor the generous ballad", response = "Flattering lyrics. Expensive chorus. The commons hum your name until the next hunger.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 3, 0)),
                        DialogueChoice(choiceText = "Ban hunger ballads", response = "Banned songs sing loudest. I will whisper where you cannot hang.", statDeltas = fixed_array(0, 0, 3, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let her mock you", response = "Brave or stupid. The crowd will decide. I will still eat.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -4, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my caravans still move — when paid triple. I heard crown reserves opened, guilds compacted, or markets left to rot. Loyalists hoard in Edwin's name. Your peasants hoard in God's. I can sell you routes, sell you names, or sell your enemies grain you refuse to price.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown escorts", response = "Then Rudolf's men guard wheat. Merchants guard grudges. Food moves.", statDeltas = fixed_array(0, 0, -4, -10, 0, 5, 0, 12, 0)),
                        DialogueChoice(choiceText = "Pay Selena's premium", response = "I will deliver. I will also remember you could not negotiate. Inflation is a memoir.", statDeltas = fixed_array(0, 0, 0, -18, 0, 2, 0, 10, 0)),
                        DialogueChoice(choiceText = "Let hoarders starve each other", response = "Then routes die and bandits feast. Arithmetic of cruelty.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, -12, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_RUTA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I return from the mills — and from the ford, where northern refugees camp beside our own hungry. I heard you sheltered strangers, turned them back, or let Arvel boil soup for Ingvar's politics. The Peasantry now has a name in your court. Do you feed your own first, share with the ford, or tell us all to pray?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Feed locals first", response = "Then the ford curses you. The mills bless you. Politics as portion control.", statDeltas = fixed_array(8, 0, 0, 0, 0, 4, 0, 8, 0)),
                        DialogueChoice(choiceText = "Shared ration", response = "Expensive fairness. The only kind that sometimes keeps both song and sword quiet.", statDeltas = fixed_array(12, 0, 0, -15, 0, 6, 0, 6, 0)),
                        DialogueChoice(choiceText = "Church feeds the ford", response = "Split mercy. Malrik gains converts. You gain arithmetic. Ruta gains grudges.", statDeltas = fixed_array(4, 8, 0, 0, 0, 0, 0, -6, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, ninety-nine days since your blade and still the city asks whether the king who took the throne starves them on purpose. I heard refugees, guilds, miners, and Malrik's fasts. My kitchens can stretch one more month — or confess we already serve the court before the commons. Tell the truth at table, or tell a better lie.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Halve court rations", response = "Thin plates for thin times. Nobles sulk. Servants remember.", statDeltas = fixed_array(8, 0, 0, 0, 0, 6, -5, 10, 0)),
                        DialogueChoice(choiceText = "Double court rations", response = "Then the market smells roast while children lick pots. Elina will rhyme it.", statDeltas = fixed_array(-10, 0, 0, 0, 0, -8, 6, -10, 0)),
                        DialogueChoice(choiceText = "Export palace stores to provinces", response = "Dangerous symbolism. I will cook barley and call it policy.", statDeltas = fixed_array(12, 0, 0, -5, 0, 10, 0, 15, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the army must eat before it must love you. I heard guilds compact, peasants charter, and Elina sing your sins. I can requisition grain from villages that still have it — legal theft with banners — or march on empty stomachs and call it virtue. Soldiers are not ballads. They are appetites.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Authorize requisition", response = "Then villages hate you efficiently. The army marches on full bellies. Choose your enemy.", statDeltas = fixed_array(-10, 0, 12, 0, 0, -8, 0, -12, 0)),
                        DialogueChoice(choiceText = "Half rations for soldiers", response = "Discipline with hunger. Mutiny with honor. A familiar recipe.", statDeltas = fixed_array(4, 0, -6, 0, 0, 6, 0, 6, 0)),
                        DialogueChoice(choiceText = "Buy grain at market", response = "Expensive peace. Cheaper than revolt — if the treasury survives.", statDeltas = fixed_array(0, 0, 6, -20, 0, 4, 0, 10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, seventy-seven days since Ruta coughed dust at your feet — and the provinces still have breath to praise you. I heard soup lines, open granaries, guild deals that bent without breaking. The commons call you the bread king. Ashford will sneer. The mills will not.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *bread* before *blade*. Rare for a king who took the throne. Do not waste it.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, 8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc4BeatsEn : Encounter[13] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_FARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, the grain guild remembers compacts and betrayals. I heard you fed provinces, seized wagons, or let markets rot during the hungry months. Credit to the crown is frozen until king-killers prove they can pay more than sermons. Reopen trade on guild terms, or watch caravans route around your capital.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept guild terms", response = "Then my ledgers own your mornings until you pay. The treasury breathes — on my schedule.", statDeltas = fixed_array(0, 0, 0, 20, 0, -4, 0, 0, -8)),
                        DialogueChoice(choiceText = "Reject", response = "Paper is not coin. Merchants will learn that at your expense.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, -5, 0, 0)),
                        DialogueChoice(choiceText = "Seize a guild house", response = "Then the guild calls you brigand — accurately. The trade ban hardens. Enjoy solitude.", statDeltas = fixed_array(0, 0, 4, 15, 0, -12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the men who rented your coup want returns — with interest compounding while you fed peasants and paid soldiers. I heard Fara froze credit or you froze her. My house holds the shorter leash. Pay Salt first, pay Fara second, or pay neither and learn who forecloses faster.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay Salt in full", response = "Then my quill clears your name — temporarily. The guild will hate your priority. The army will love it.", statDeltas = fixed_array(0, 0, 5, -25, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Renegotiate Salt", response = "Time is coin. I sell both. You will buy again.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, -6)),
                        DialogueChoice(choiceText = "Default on coup debt", response = "Then I sell your defaults to whoever hates you most. Ingvar reads ledgers too.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, -10)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, false crowns circulate — struck with King Edwin's face, spent with your throne-stealer's blessing. I heard Osric's ghost seals and Salt's hungry loans. My mint can purge the fake seals, or your treasury can pretend they are tribute. Fake coins are a tax on kings who cannot count.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund a mint purge", response = "Expensive honesty. Markets stall, then trust returns — if you finish.", statDeltas = fixed_array(0, 0, 0, -18, 0, 8, 0, 0, 6)),
                        DialogueChoice(choiceText = "Ignore", response = "Then prices lie and taxes lie with them. Borvin will scream. Thieves will cheer.", statDeltas = fixed_array(0, 0, 0, 10, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Blame Nerius", response = "Convenient scapegoat. The fake seals continue without a neck to blame. You chose theatre.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik's church tax, Salt's interest, and Fara's fees eat the same chest — and Rudolf still wants rations. I heard you purged fake seals or let them spread. Choose which creditor starves this month: heaven, merchants, or steel.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay merchants first", response = "Then Malrik calls you usurer. The army calls you prudent. Both may be right.", statDeltas = fixed_array(0, -5, 0, -15, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pay Church first", response = "Then Fara tightens the trade ban. Malrik smiles. Arithmetic weeps.", statDeltas = fixed_array(0, 10, 0, -12, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pay army", response = "Soldiers eat. Merchants remember. A classic throne-stealer's triangle.", statDeltas = fixed_array(0, 0, 8, -10, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Fara froze crown credit and Salt called your notes — I heard both before my caravans left the yard. I move grain and gold, not loyalty. Extend me crown escorts and premium pay, or I sell your shortages to your enemies at markup.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown escorts and premium", response = "I will deliver. I will also tell Fara you paid retail for wholesale problems.", statDeltas = fixed_array(0, 0, 0, -20, 0, 4, 0, 8, 0)),
                        DialogueChoice(choiceText = "Nationalize one caravan line", response = "Then I sell to Ingvar. You get wagons and a reputation for theft.", statDeltas = fixed_array(0, 0, 4, 12, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let routes fail", response = "Hungry markets remember. So do ballads. You chose purity over portions.", statDeltas = fixed_array(0, 0, 0, 8, 0, -8, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, in six days Lady Ashford measures whether you are a ruler or a debtor in ermine. I heard Fara withhold credit, Salt compound interest, and Nerius find false coin. Great houses lend to kings who can pay — not to king-killers who owe merchants more than bishops.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Prepare ability to pay", response = "Theatre with receipts. Expensive. Ashford respects expensive truths.", statDeltas = fixed_array(0, 0, 0, -15, 0, 4, 5, 0, 0)),
                        DialogueChoice(choiceText = "Prepare bluff", response = "Confidence with varnish. Ashford peels paint for sport.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -3, 0, 6)),
                        DialogueChoice(choiceText = "Prepare seizure", response = "Bold piracy. Fara will scream. Ashford may applaud — if you win.", statDeltas = fixed_array(0, 0, 5, 15, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_FARA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, Ashford offers your lawful rule at a price. I offer money in the treasury at a sharper one. Sign the Guild Compact — crown tariffs fixed, private credit open, church tax capped by merchants not Malrik — or we call your notes due before sunset.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Sign the compact", response = "Then we are partners until you try to break us. Read the ink twice.", statDeltas = fixed_array(0, -8, 0, 15, 0, 0, -6, 0, -5), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Refuse", response = "Then Salt finishes this conversation. I have done my courtesy.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Counter", response = "Half a compact. Half a war. Salt will price the difference.", statDeltas = fixed_array(0, 5, 0, -8, 0, 0, 0, 0, 4), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Pay", response = "Then you are poor and alive. A respectable combination.", statDeltas = fixed_array(0, 0, 0, -40, 0, 6, 0, 0, 5)),
                        DialogueChoice(choiceText = "Offer Ashford marriage dowry as collateral", response = "Then you mortgage bloodlines for coin. Ashford will notice. So will history.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
                    )
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
                    prompt = "Your Majesty, false coin reached the army's pay chest — or would have, if Rudolf were less suspicious. I heard you defaulted on Salt or signed Fara's compact. My mint begs authority to seize every bad piece in the capital. Grant it, and trust returns slowly. Deny it, and trust never arrives.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Grant seizure", response = "Then coin is honest at the cost of riots. Honesty is not free.", statDeltas = fixed_array(0, 0, 6, -10, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Private seizure", response = "Shared blame. Shared credit. Fara owns the muscle. You own the headline.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, -4, 0, 0)),
                        DialogueChoice(choiceText = "Deny", response = "Markets do not self-correct. They self-devour. You chose faith over mint.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the payment deadline strikes — Salt's agents camp at the lower gate, Fara's clerks audit your cellars, and Rudolf asks for war coin you do not have. I heard you signed, refused, or bluffed. Pay one final big sum, say you have no money left, or sell Edwin's crown jewels to merchants who will display them in shop windows.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay one big sum", response = "Expensive silence. The rarest music in finance.", statDeltas = fixed_array(0, 0, 0, -35, 0, 8, 0, 0, 6)),
                        DialogueChoice(choiceText = "Admit we have no money", response = "Honest catastrophe. Creditors take pieces. You keep the chair — maybe.", statDeltas = fixed_array(0, 0, 0, 10, 0, -12, -15, 0, -10)),
                        DialogueChoice(choiceText = "Sell crown jewels", response = "Then the realm sees your mother's rubies in a guild window. You eat nonetheless.", statDeltas = fixed_array(0, 0, 0, 25, 0, -10, -12, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I sold a copy of Borvin's true ledger — not the court version — to whoever paid highest this week. Fara, Salt, Ingvar, and Ashford each hold pages you wished private. I can buy pages back, sell you fake seals instead, or vanish. Your treasury's shame is now a commodity.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Buy the ledger back", response = "Then you rent silence. I will sell again if the price improves.", statDeltas = fixed_array(0, 0, 0, -18, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Feed fake seals", response = "Clever until two liars compare notes. Still — buy time.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Arrest Knox", response = "Too late. The copies already walk. You chose theatre over arithmetic.", statDeltas = fixed_array(0, 0, 2, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I write the second draft — not who bowed, but who owns your mornings. I heard Fara's compact, Salt's clock, Nerius's false coin, Selena's premiums, and Knox's stolen numbers. Title this chapter *King Who Can Pay*, *Debt Crown*, or *The Merchant's Throne* — the realm copies my verbs into law.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "*King Who Can Pay*", response = "Flattering if true. Dangerous if not. I will verify before I print.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 4, 0, 0)),
                        DialogueChoice(choiceText = "*Debt Crown*", response = "Honest prose. Creditors hate it. Commons love it. You chose truth over tone.", statDeltas = fixed_array(0, 0, 0, 5, 0, 8, -8, 0, 0)),
                        DialogueChoice(choiceText = "Bribe the chapter", response = "Expensive fiction. Knox sells the footnotes anyway.", statDeltas = fixed_array(0, 0, 0, -12, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, ninety-four days since Fara froze your credit — and the counting houses speak your name without spitting. I heard Salt paid, fake seals purged, Borvin's ledgers matched. You bought time with gold. The oldest miracle. The crown owns its coffers again — for now.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the creditors", response = "Then I write *able to pay* before *loyal*. Winter has other invoices — pay them too.", statDeltas = fixed_array(0, 0, 0, 5, 0, 8, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, the people know your crown, but do not know whether it is blessed. Today the Church must decide whether to name you king or one who took the throne. I did not come for your soul — I came for your name in the square.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ask the Church for a blessing", response = "Humility is a fitting mask for one who reached the throne through blood. The faithful will hear it.", statDeltas = fixed_array(0, 15, 0, -8, 0, 3, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Demand recognition", response = "Orders reach soldiers. They rise to heaven far less well. You will learn that soon.", statDeltas = fixed_array(0, -12, 8, 0, 0, -4, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Offer an alliance", response = "An alliance of crown and crosier may save Estedor. Or smother it. We will see which hungers more.", statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, 0, 3), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Name the church split", response = "Then you align yourself with Arvel's muttering monks and against my choir. Dangerous. Popular, perhaps, among the hungry.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice()
                    )
                ),
                DialogueNode(
                    prompt = "Your Majesty, blessing is not a gift — it is a leash. I can preach you king and make the mob kneel. I can preach you king who took the throne and make them sharpen knives. Or I can preach silence — and let every lord decide whether you rule tomorrow. I heard you chose your tone on the threshold. Now choose what the Church buys with it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Church custody of your rule", response = "Then kneel in the square when I bid it. The king who took the throne becomes blessed by the church — or becomes a lesson.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Refuse — the crown recognizes itself", response = "Then prepare for a sermon that names you killing a king. I heard defiance. The faithful heard a challenge.", statDeltas = fixed_array(0, -10, 5, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Shared ledger — tax and church tax negotiated, not decreed", response = "A merchant's peace. Borvin will hate it. I will tolerate it — until I do not.", statDeltas = fixed_array(0, 5, -8, 0, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice()
                    )
                ),
                DialogueNode(),
                DialogueNode(),
            )
        )
)

let public arc5BeatsEn : Encounter[10] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 2,
            characterIdx = CHAR_MALRIK,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, the people know your crown, but do not know whether it is blessed. Today the Church must decide whether to name you king or one who took the throne. I did not come for your soul — I came for your name in the square.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ask the Church for a blessing", response = "Humility is a fitting mask for one who reached the throne through blood. The faithful will hear it.", statDeltas = fixed_array(0, 15, 0, -8, 0, 3, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Demand recognition", response = "Orders reach soldiers. They rise to heaven far less well. You will learn that soon.", statDeltas = fixed_array(0, -12, 8, 0, 0, -4, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Offer an alliance", response = "An alliance of crown and crosier may save Estedor. Or smother it. We will see which hungers more.", statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, 0, 3), nextNodeIdx = 1),
                        DialogueChoice(choiceText = "Name the church split", response = "Then you align yourself with Arvel's muttering monks and against my choir. Dangerous. Popular, perhaps, among the hungry.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(
                    prompt = "Your Majesty, blessing is not a gift — it is a leash. I can preach you king and make the mob kneel. I can preach you king who took the throne and make them sharpen knives. Or I can preach silence — and let every lord decide whether you rule tomorrow. I heard you chose your tone on the threshold. Now choose what the Church buys with it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Church custody of your rule", response = "Then kneel in the square when I bid it. The king who took the throne becomes blessed by the church — or becomes a lesson.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Refuse — the crown recognizes itself", response = "Then prepare for a sermon that names you killing a king. I heard defiance. The faithful heard a challenge.", statDeltas = fixed_array(0, -10, 5, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Shared ledger — tax and church tax negotiated, not decreed", response = "A merchant's peace. Borvin will hate it. I will tolerate it — until I do not.", statDeltas = fixed_array(0, 5, -8, 0, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_CYRUS,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, Malrik names you king or one who took the throne in the square. I name you suspect in God's ledger. I heard you knelt, defied, or bargained on day thirty — and I heard Edwin's confessor still breathes in Arvel's cloister if rumour serves. My commission is inquiry, not sermon. Surrender names, surrender Aldo, or surrender patience.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Cooperate", response = "Useful. Malrik will call it crown justice. Arvel will call it cowardice. Both may be right.", statDeltas = fixed_array(0, 8, 0, 0, 0, -6, 0, 0, 6)),
                        DialogueChoice(choiceText = "Refuse inquiry", response = "Then I write *obstruction* beside *king who took the throne* and sleep well. You may not.", statDeltas = fixed_array(0, -12, 5, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Trade Aldo's exile for ending the inquiry", response = "One priest for one peace. Malrik gains a scalp. You gain a week. Weeks add up.", statDeltas = fixed_array(0, 5, 0, 0, 0, -4, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, church tax reached the treasury's throat this week — more coin to Malrik's house than to yours. I heard you opened day thirty with blessings or threats. The faithful pay God first now. If I cut clerks, he calls it insult to the sacred. If I pay soldiers, the altar calls it theft. Which king goes hungry — you or heaven?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Cap the church tax", response = "The altar will hiss. The treasury will breathe. Malrik will call it persecution by sunset.", statDeltas = fixed_array(0, -18, 0, 15, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pay the church tax from treasury", response = "Expensive holiness. Soldiers will ask why God eats before they do.", statDeltas = fixed_array(0, 10, -6, -20, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Audit both", response = "Then we follow ink and incense. Names will surface. None will thank you.", statDeltas = fixed_array(0, -5, 0, -8, 0, 6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I served three kings and buried two. Malrik does not need a blade to end you — he has a ledger, a pulpit, and a word: *forfeit*. I heard you capped the church tax — or fed it. His scribes copy your name with a strike through it when forfeit is preached. Interdict next: no rites, no lawful rule, no guards who fear hell. Do you understand the machine you argued with on day thirty?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Prepare secular law", response = "Bold. The faithful call it heresy. Soldiers may call it clarity. Write it before Sunday.", statDeltas = fixed_array(0, -8, 6, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Negotiate boundaries", response = "A treaty with heaven's broker. It holds until it does not. Usually until gold runs thin.", statDeltas = fixed_array(0, 5, 0, -6, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let him try forfeit", response = "Then you bet steel against scripture. I have seen scripture win in the square and lose in the barracks. Rarely in that order.", statDeltas = fixed_array(0, -12, 10, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik's church tax buys grain at prices my caravans cannot match. I heard you fought him in ledgers on day forty — he answered in bread. Temples feed the hungry and preach who saved them. Your crown feeds soldiers and preaches who paid them. Which sermon fills the belly faster?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Outbid the Church", response = "Hungry praise is expensive. Worth it, until the next empty purse.", statDeltas = fixed_array(0, -6, 0, -18, 0, 8, 0, 12, 0)),
                        DialogueChoice(choiceText = "Seize temple granaries", response = "Then hear forfeit by dawn. You will have bread and sermons about your black soul.", statDeltas = fixed_array(0, -20, 5, 0, 0, -5, 0, 15, 0)),
                        DialogueChoice(choiceText = "Let Selena broker", response = "I will sell you grain and sell Malrik your caution. Remember I sell both ways.", statDeltas = fixed_array(0, 3, 0, -10, 0, 0, 0, 8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik named meat unclean this week — penance for a killing a king's reign. My sisters still boil broth for Grey Lung wards while the faithful fast in the square. I heard you purged Edwin's kitchens or kept them; either way, the court must eat and the sick must drink. Soldiers ask why God hates their supper. I ask why heaven starves hospitals to feed sermons.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ignore the decree", response = "Then the faithful call you glutton and sinner. The soldiers call you king. My patients call you sensible.", statDeltas = fixed_array(0, -15, 8, 0, 3, -4, 0, 5, 0)),
                        DialogueChoice(choiceText = "Observe the fast", response = "Humility in public, resentment in the wards. Malrik will call it conversion. I call it theatre that kills slowly.", statDeltas = fixed_array(0, 12, -6, 0, -5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Feed the barracks in secret", response = "Hypocrisy feeds armies. A time-honored recipe. Do not let Malrik smell the roast — or my soup.", statDeltas = fixed_array(0, -5, 10, -8, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three thousand pilgrims camp at the lower gate — Malrik's doing, though he swears innocence. They chant forfeit or blessing, whichever comes first. I heard you defied fasting in the yards or knelt at table — they heard both from spies. My guards will not disperse a holy crowd without your word on blood.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Disperse them", response = "Blood in a holy crowd buys martyrs. Malrik knows that. He hopes you do not.", statDeltas = fixed_array(0, -18, -10, 0, 0, -12, 0, 0, 6)),
                        DialogueChoice(choiceText = "Address them yourself", response = "Brave or foolish. The square will hear one king today. Pray it is you.", statDeltas = fixed_array(0, 5, 3, 0, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let Malrik disperse his own flock", response = "Then he owns the miracle and the riot. You own the walls. For now.", statDeltas = fixed_array(0, 12, 0, 0, 0, -8, 0, 0, -5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, two companies crossed themselves instead of marching when I ordered dispersal at the gate. I heard pilgrims camped because you would not or could not clear them. Borvin says church tax ate their pay. Malrik says heaven outranks you. I heard Salt's coup debt and Kara's wagons in the same breath. Tell me whether I discipline soldiers, pay them, or let the Church feed their families and steal their oaths.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay the army from crown reserves", response = "Gold before God. A soldier's theology. Expensive — until cheaper than mutiny.", statDeltas = fixed_array(0, -8, 15, -22, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Arrest the ringleaders", response = "Then hang men who crossed themselves. The barracks will remember. The chaplains will scream.", statDeltas = fixed_array(0, -15, 8, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let Malrik feed their families", response = "You ask the altar to pay and the sword to obey. I give it one month.", statDeltas = fixed_array(0, 10, -6, 5, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I heard you capped my church tax, seized my grain, fed sinners in barracks, and let pilgrims name you forfeit at the gate. I do not need a blade. I suspend sacraments in the capital — no baptisms, no last rites, no quiet conscience for your guards. Either you submit the crown to God's ledger, or you rule a city that fears hell more than you.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Kneel", response = "Then forfeit dies in the square and lives in the chapter house. You survive. You serve.", statDeltas = fixed_array(0, 20, -8, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Defy the interdict", response = "Then every pulpit names you cursed. I heard steel in your voice on day thirty. Steel must finish what it began.", statDeltas = fixed_array(0, -20, 12, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Counter with Arvel", response = "Two churches, one bleeding city. You chose the fracture. May it not fracture you.", statDeltas = fixed_array(0, -5, 0, 0, 0, 10, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the conclave met without you — and heaven voted pragmatic. I heard you knelt, bargained, or bent before interdict became pyre. Forfeit dies in the square and lives in the chapter house. You leave blessed by the church. You leave leashed. The mob kneels. Rudolf grimaces. You breathe.",
                    choiceCount = 2,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the conclave", response = "Then kneel when I ask. Heaven owns part of your mornings now.", statDeltas = fixed_array(0, 15, -5, 0, 0, 8, 0, 0, 12)),
                        DialogueChoice(choiceText = "I have heard the brethren", response = "Then Estedor has two faiths. May neither fracture you before spring.", statDeltas = fixed_array(0, -12, 0, 0, 0, 12, 0, -8, 6)),
                        DialogueChoice(),
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

let public arc6BeatsEn : Encounter[16] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_INGVAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Ambassador Ingvar of the northern princes. You took Edwin's throne by blade — they have not decided whether that makes you a king, a regicide, or a storm that will pass. I am here to learn how you mean to hold what you seized, before their banners learn it for them.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Receive him as an equal envoy", response = "Then they will call you prudent. For a week. After that they price respect in coin and corpses.", statDeltas = fixed_array(0, 0, 2, 0, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Insult the princes — the throne was ours by right of conquest", response = "I will carry your eloquence north. They will answer with winter and horses. You slammed the door on the princes — expect them to knock back.", statDeltas = fixed_array(0, 0, 5, 3, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Placate him with gold for time", response = "I am not cheap, but I am persuadable. They will hear you are buying days, not alliances.", statDeltas = fixed_array(0, 0, 0, -10, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? They want the same answer in writing before they recognize your seal.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Send recognition papers", response = "Then you ask wolves to bless the lamb. Brave. They will answer with conditions, not hymns.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Refuse all forms", response = "Ink is cheaper than cavalry. You will learn which runs out first.", statDeltas = fixed_array(0, 0, 4, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Trade receipts", response = "A merchant's peace. Borvin will curse you. The princes will read your ledgers before your titles.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. I heard Ingvar left your hall on day five pleased or furious. The north tests borders when words fail. Do I reinforce the pass, raid in answer, or send you to negotiate what steel should not?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Reinforce Grey Pass", response = "Then the treasury bleeds and the north knows you flinch with walls, not horses.", statDeltas = fixed_array(0, 0, 8, -12, 0, 0, 0, -5, 0)),
                        DialogueChoice(choiceText = "Raid northern scouts", response = "A border war by breakfast. Ingvar will call it banditry. The princes will call it invitation.", statDeltas = fixed_array(0, 0, 5, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Send Ingvar to the pass", response = "Then we bet diplomacy on a man who sells all sides. Cheaper than graves — if it works.", statDeltas = fixed_array(0, 0, 0, -6, 0, 4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, in three days your priests will ask whether heaven blesses killing a king. I heard Rudolf reinforced the pass — or raided it. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal. God can wait. Politics cannot.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay northern tribute", response = "Then Borvin weeps and the pass stays quiet. Malrik will call it selling your soul to merchants instead of priests.", statDeltas = fixed_array(0, -3, 0, -18, 0, 0, 0, 0, 6)),
                        DialogueChoice(choiceText = "Refuse", response = "Then you enter day thirty with two enemies and no ledger. Bold arithmetic.", statDeltas = fixed_array(0, 2, 3, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Offer double trade", response = "Commerce as diplomacy. Selena will grow rich. Rudolf will grow suspicious. Useful tensions.", statDeltas = fixed_array(0, 0, 0, -5, 0, 3, 0, 5, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Ingvar's treaty still smells of your day-twenty-seven choice — tribute paid, border held, or insult banked. The princes offer a loan for forts on the Grey Pass, or a trade ban if we arm further. I heard Malrik eats our church tax. The north eats our trade. Which wolf do we feed?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Take the northern loan", response = "Gold in the chest, rope around the crown. Standard diplomacy.", statDeltas = fixed_array(0, 0, 5, 20, 0, 0, 0, 0, -5)),
                        DialogueChoice(choiceText = "Refuse foreign coin", response = "Honorable and slow. Rudolf approves. Ingvar smiles elsewhere.", statDeltas = fixed_array(0, 0, 6, -15, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let Selena finance the pass", response = "Merchants own the battlements. For a time. Then they own the conversation.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. I heard you sheltered Edwin's clerks or cut them; these men carry lists of who still mourns the old king. Ingvar calls them merchants. I call them a map of your enemies. Torture, trade, or return them with a message?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Return them politely", response = "Courtesy with shackles. He will call it trust. I call it habit.", statDeltas = fixed_array(0, 0, -2, 0, 0, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Interrogate", response = "Ink and screams. Useful mix. Ingvar will hear before sunset.", statDeltas = fixed_array(0, 0, 0, 0, 0, -5, 0, 0, 6)),
                        DialogueChoice(choiceText = "Execute as spies", response = "Then war speaks a dialect everyone understands.", statDeltas = fixed_array(0, -3, 6, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I heard you returned my agents — or questioned them — or hung them. The princes read your habit as clearly as I do. They offer a charter: mutual defence, shared tolls, your seal beside theirs on the Grey Pass. Sign, and the north calls you king in every market from here to winter.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Sign the alliance", response = "Then we are partners in more than ink. Rudolf grumbles. Malrik fumes. You breathe.", statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 10)),
                        DialogueChoice(choiceText = "Sign trade only", response = "Half a friendship. Cheaper until the first raid.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 8, 0)),
                        DialogueChoice(choiceText = "Refuse", response = "Alone is how kings who took the throne often end. You chose it with eyes open.", statDeltas = fixed_array(0, 0, 5, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Accept terms", response = "Then you are tributary, not king. Cheaper than graves — for now.", statDeltas = fixed_array(0, 0, -8, -25, 0, 0, 0, 0, -8)),
                        DialogueChoice(choiceText = "Reject", response = "Then Rudolf earns his keep. Ingvar earns his commission. Winter earns its reputation.", statDeltas = fixed_array(0, 0, 12, -10, 0, 0, 0, 0, 0)),
                    )
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
                    prompt = "Your Majesty, blood at the Grey Pass — our men or theirs, depending who lies. I heard you signed Ingvar's charter — or spat on his terms. The north tests whether the throne-stealer's army is real. Do I hold, pursue, or sue for parley while the snow still owns the heights?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pursue into the pass", response = "Victory wins songs. Defeat wins northern sermons about killing a king's price.", statDeltas = fixed_array(0, 0, -8, -12, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hold the line", response = "Discipline before glory. The men will call it caution. The treasury will call it wisdom.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, -6, 0)),
                        DialogueChoice(choiceText = "Parley under white banner", response = "Then we bet words again. Cheaper if you still have credit with him.", statDeltas = fixed_array(0, 0, -3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, two thousand northern refugees crowd the ford — famine in the princes' hills, or a leash to embarrass you. I heard you allied with us — or declared us enemies. The commons already watch whether the king who took the throne feeds strangers while Edwin's widows beg. Malrik offers baptisms. I offer politics.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Shelter refugees", response = "Mercy with a bill. The People will see it — if they are allowed to look.", statDeltas = fixed_array(12, 0, 0, -10, 0, 6, 0, -15, 0)),
                        DialogueChoice(choiceText = "Turn them back", response = "Cold borders make clean arithmetic. Loud sermons follow.", statDeltas = fixed_array(-10, 0, 4, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let Arvel feed them", response = "Then Malrik owns the miracle. You own the wall. Standard trade.", statDeltas = fixed_array(6, 8, 0, 0, 0, 0, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, half the year gone. I heard you sheltered our refugees — or closed the ford. The princes ask whether Estedor is ally, market, or future province. Renew the charter, share Grey Lung physic if your wards still cough, or stand alone before winter returns.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Renew alliance", response = "Then your seal and ours share winter. Rudolf mutters. You endure.", statDeltas = fixed_array(0, 0, 6, -8, 0, 0, 0, 0, 8)),
                        DialogueChoice(choiceText = "Offer plague formula", response = "Then we owe you breath. Dangerous debt. Better than siege.", statDeltas = fixed_array(5, -5, 0, 0, 5, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "End alliance", response = "Then we are strangers who remember each other's ledgers. War becomes possible again.", statDeltas = fixed_array(0, 0, 4, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Withdraw from the pass", response = "Then you gift them the heights. The court will call it peace. The barracks will call it something else.", statDeltas = fixed_array(0, 0, -10, 5, 0, 0, 0, 0, -6)),
                        DialogueChoice(choiceText = "Refuse", response = "Then Rudolf stops pretending diplomacy is a career.", statDeltas = fixed_array(0, 0, 15, -20, 0, 0, 0, -10, 0)),
                    )
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
                    prompt = "Your Majesty, I heard Ingvar's final demand on day one-twenty-two — alliance, retreat, or war. Northern buyers want crossbows. Rudolf wants them first. I sell to whoever pays and remembers — I heard your purse on day forty-seven. Do you seize my caravan, match their price, or let steel flow north and hope it points away from you?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown monopoly", response = "Then the army is fed and Kara is angry. A familiar balance.", statDeltas = fixed_array(0, 0, 10, -12, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Free trade", response = "Gold flows. Loyalties blur. War gets cheaper for everyone.", statDeltas = fixed_array(0, 0, -5, 15, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Sell only to the north", response = "Then Rudolf calls it treason. Ingvar calls it friendship. You call it Tuesday.", statDeltas = fixed_array(0, 0, -8, 8, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, in three days the great houses stop watching from their estates and start measuring your throat. I heard you allied with the north, or angered it, or fed its refugees while your own provinces hunger. Ashford will ask whether you can win a war abroad and a ledger at home. Before she arrives — do you seek noble levies for the pass, or keep this a crown war the houses can ignore?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Summon noble levies", response = "Then they bleed with you — or plot while you bleed. Ashford will note who came.", statDeltas = fixed_array(0, 0, 12, 0, 0, 0, -8, 0, 5)),
                        DialogueChoice(choiceText = "Keep war a crown matter", response = "Privacy preserves options. It also preserves their knives until later.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, 5, 0, 0)),
                        DialogueChoice(choiceText = "Marry war to peace", response = "Ledger diplomacy. Ashford respects ledgers. Whether she respects you remains her hobby.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, northern hosts gather beyond the pass — or so my scouts swear. I heard the great houses offer levies — or withhold them. Ingvar says it is training. I say it is a clock. Mobilize fully and empty the treasury. Bluff with parades and hope. Or strike first and dare the north to answer before Ashford's couriers spread the tale.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Full mobilization", response = "Then every coin feeds steel until steel feeds us back or buries us.", statDeltas = fixed_array(0, 0, 18, -25, 0, 5, 0, -12, 0)),
                        DialogueChoice(choiceText = "Parade bluff", response = "Theater with drums. Cheaper until someone calls the bluff with cavalry.", statDeltas = fixed_array(0, 0, 5, -8, 0, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pre-emptive strike", response = "Aggression as policy. Ingvar will call it banditry. History may call it survival.", statDeltas = fixed_array(0, 0, -10, -15, 0, 0, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, in eight days your court's loyalty becomes a counted thing. I heard whispers that my princes already priced several of your advisors. I am not here to confess — I am here to bid. Match northern gold, expose the buyers, or let the market decide who owns your tomorrow.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay crown gold", response = "Expensive throne. Still a throne — if the payments hold.", statDeltas = fixed_array(0, 0, 0, -22, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Expose northern bribes", response = "Scandal as hygiene. Someone swings. Someone talks. The court learns fear.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, -6, 0, 0)),
                        DialogueChoice(choiceText = "Secret deal", response = "Then you are merchant and monarch both. Edric would call it familiar. He would not call it wise.", statDeltas = fixed_array(0, 0, 0, 10, 0, -15, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, palace guard sold patrol maps to northern buyers — I heard Ingvar's gold on day two-fifty-two land in familiar pockets. I also heard you starved the barracks on day sixty-five. Loyalty is arithmetic. Purge the guard, feed them better, or feed Ingvar a lie and hope he buys it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Purge the guard", response = "Steel solves loyalty until it becomes the next problem.", statDeltas = fixed_array(0, 0, 6, -10, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Double pay and investigation", response = "Gold and gallows. Traditional pairing.", statDeltas = fixed_array(0, 0, 4, -15, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Feed Ingvar false maps", response = "Clever. If he believes you, the pass is yours for a month. If not, you armed him twice.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three hundred and fifty days since a blade gave you a crown the north did not grant. I heard tribute refused, charter signed, refugees housed, maps guarded. The princes end the year calling you ally — not friend, not vassal, but the king who took the throne worth binding. Your heirs and ours will argue together. Better than arguing alone.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the princes", response = "Then may your heirs argue with mine in ledgers, not pass graves.", statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc7BeatsEn : Encounter[14] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KASPAR,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, Lady Ashford rides from the eastern marches in seventeen days. I ride from the east beside her — not beneath. I heard you bled for this throne without our swords. Fair. Neither did we kneel. Will you seat one eastern house and call it peace, or seat two and call it balance?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Promise Kaspar equal standing with Ashford", response = "Then I will remember you when she tries to own the king's close advisors. Eastern levies may follow — if coin follows first.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 4)),
                        DialogueChoice(choiceText = "Ashford leads the east", response = "Sulking is cheaper than war. For now. I will find other allies — Dell, Crow, or your gallows.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -3, 0, 0)),
                        DialogueChoice(choiceText = "Play them against each other", response = "Honest cynicism. I respect it. They will not. Expect poison in the hospitality.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Ashford offers condescension and a nephew's noose. I offer coin, cousins, and a marriage bed that could make the realm forget a blade put you here. My dowry is real — unlike certain eastern ledgers I could name. Do you open treasury doors to Dell, or wait for Ashford's permission?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Dell's marriage terms in principle", response = "Then my couriers ride before Ashford's banners crest the hill. Love is politics at speed.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 8, 0, 10)),
                        DialogueChoice(choiceText = "Reject", response = "Then I sell my cousins to Crow instead of you. Do not act surprised when the bidding starts.", statDeltas = fixed_array(0, 0, 0, 0, 0, 3, -5, 0, 0)),
                        DialogueChoice(choiceText = "Demand proof of dowry", response = "Wise. Insulting. Kaspar will forge something regardless. I will bring receipts — and guards.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I heard Dell offered you marriage and arithmetic. I offer more arithmetic. Double the dowry, half the sermons, and no Ashford on the king's close advisors. Marry Crow, and the southern roads fund your throne. Marry Dell, and you marry her debt.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Favor Crow's bid", response = "Then Dell will call me thief. She is not wrong. She is also not louder than my coin.", statDeltas = fixed_array(0, 0, 4, 12, 0, 0, 6, 0, 0)),
                        DialogueChoice(choiceText = "Force Dell and Crow to share terms", response = "Shared? We will smile in public and cut in linen. Useful for you. Expensive for someone.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 4, 0, 8)),
                        DialogueChoice(choiceText = "Reject both", response = "Everything is a market. You are merely bad at haggling. Watch what Ashford prices you at.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, -8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Ashford, Kaspar, Dell, and Crow measure your throat in velvet. I measure it in men who own nothing but hunger. I heard you paid soldiers before you paid truth. Give the landless titles from seized estates, or we take fields while lords debate dowries.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Promise Raymond crown lands from Edwin's loyalists", response = "Then lords will scream theft. I will scream hunger. You will scream order. One of us will be heard.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, -10, 0, 0)),
                        DialogueChoice(choiceText = "Refuse", response = "Then we are a storm. Storms do not need titles. Remember I warned you before the march.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 5, 0, 0)),
                        DialogueChoice(choiceText = "Use Raymond against the great houses", response = "Dangerous hire. I will march where you point — until I point somewhere you dislike.", statDeltas = fixed_array(0, 0, 0, 0, 0, -3, -5, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, in three days Lady Ashford enters your hall and nobility becomes a meter the realm can read. I heard Kaspar watch the east, Dell and Crow bid for your bed, and Raymond gather men with nothing to lose. You can arrive divided, married, or armed. You cannot arrive surprised.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Prepare conciliation", response = "Feasts buy time. Time buys options. Do not confuse either with safety.", statDeltas = fixed_array(0, 0, 0, -10, 0, 4, 5, 0, 0)),
                        DialogueChoice(choiceText = "Prepare division", response = "Then steel hides behind napkins. Efficient — if you control the cutlery.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -3, 0, 5)),
                        DialogueChoice(choiceText = "Prepare terror", response = "Fear opens councils and closes throats. Ashford will notice. So will history.", statDeltas = fixed_array(0, 0, 6, 0, 0, -5, -8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Countess Dell's dowry receipts are eastern fake seals — or Ashford fake seals meant to look like mine. I heard you promised someone marriage, someone balance, someone terror. I accuse Dell before she accuses me. Do you judge, defer, or let us duel without you?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Side with Kaspar", response = "Then Dell screams theft. Crow will whisper alliance. Ashford will call it weak kingship. Enjoy the noise.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, -6, 0, 8)),
                        DialogueChoice(choiceText = "Side with Dell", response = "Exile is a kind of death. He may return with armies if you are not careful.", statDeltas = fixed_array(0, 0, -4, 0, 0, 4, -8, 0, 0)),
                        DialogueChoice(choiceText = "Defer judgment", response = "Then blood on marble before supper ends. At least you will learn who wants you alive.", statDeltas = fixed_array(0, 0, 0, 0, 0, -5, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I am Duke the Goose — by baptism, by theatre, and by a genealogy my fool swears is truer than yours. I heard great houses measure your throat. I measure your funny bone. Support my claim and the commons love you. Hang me and the commons still love me — from a distance.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Patronize the claim", response = "Honk and politics. Ashford will gag. The people will cheer. I accept your danger.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -12, 0, -5)),
                        DialogueChoice(choiceText = "Arrest the fool", response = "Then the cells learn comedy. My supporters learn knives. Choose which worries you more.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Tournament proof", response = "Steel versus poultry. I accept. Bring your best knight — or your worst, for the story.", statDeltas = fixed_array(0, 0, 4, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, your king's close advisors is a cage of eastern tigers — and one goose outside the bars. I heard Kaspar accuse Dell, Crow outbid Dell, and Raymond gather landless steel. I will not share a council with Kaspar unless you mean to split the east. Choose who sits, who stands, who leaves in chains.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ashford leads council", response = "Then eastern levies die with Kaspar's patience. He will blame you — correctly.", statDeltas = fixed_array(0, 0, -6, 0, 0, 0, 10, 0, 5)),
                        DialogueChoice(choiceText = "Dual eastern seats", response = "Shared power. Shared knives. I will smile until one of us stops.", statDeltas = fixed_array(0, 0, 4, -8, 0, 0, 5, 0, 0)),
                        DialogueChoice(choiceText = "Exclude Ashford", response = "Then you declare war on my house in all but name. I will answer in all but mercy.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, -12, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Baroness Crow told the hall my dowry was pig iron and my cousins were pig farmers. I heard you laughed — or did not stop her. I demand satisfaction: public apology, private divorce from this politics, or a duel by proxy before the realm chooses a side.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Force Crow to apologize", response = "Then Crow is enemy. Dell is not friend. You have two fewer allies and one fewer problem — for a week.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -8, 0, 0)),
                        DialogueChoice(choiceText = "Force Dell to yield bid", response = "Dell will remember. Crow will collect. You bought quiet at someone's expense.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 4, 0, 6)),
                        DialogueChoice(choiceText = "Let them duel by proxy", response = "Then blood before breakfast. The victor claims your favor. The loser claims a grudge.", statDeltas = fixed_array(0, 0, -4, 0, 0, 6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three hundred men without fields camp on Ashford's border — or Dell's — or yours, depending who you angered least. I heard great houses feud while commons starve. I march tomorrow unless you grant titles now, hang a lord for sport, or send Ashford's knights to stop me.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang a small lord's title", response = "Then nobility screams. Raymond kneels — today. You have bought a dangerous friend.", statDeltas = fixed_array(0, 0, 8, 0, 0, 10, -15, 0, 0)),
                        DialogueChoice(choiceText = "Send Ashford's knights to crush the march", response = "Steel on peasants. Ashford gains glory. You gain guilt. Raymond gains martyrs.", statDeltas = fixed_array(0, 0, 6, 0, 0, -12, 5, 0, 0)),
                        DialogueChoice(choiceText = "Let houses fight Raymond themselves", response = "Then I war on all of them. Chaos is also a policy. You chose spectator.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, -8, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, northern smoke still rises — I heard Rudolf mobilize while you host feuds. Ashford refuses eastern levies unless she leads them. I refuse levies unless I am not her subordinate. Dell and Crow refuse unless marriage is signed. Raymond refuses unless land is deeded. Goose refuses unless bread is thrown. Levy the houses, or levy the scaffold.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Levy Ashford first", response = "Then she marches with hatred and banners. Useful — if she returns.", statDeltas = fixed_array(0, 0, 10, -8, 0, 0, -8, 0, 0)),
                        DialogueChoice(choiceText = "Levy Kaspar", response = "Then east splits openly. War may come from your own marches.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
                        DialogueChoice(choiceText = "Levy no one", response = "Then houses call you bankrupt and correct. Kara will love you. Rudolf will not.", statDeltas = fixed_array(0, 0, 6, -15, 0, 0, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, knives move tonight — Kaspar's on Dell, Crow's on Ashford, Ashford's on Raymond, Raymond's on everyone with a field. I heard who you hanged and who you spared. I can sell you the map, stop one blade, or let winter sort the peerage. Who dies in the dark is yours if you act — or theirs if you sleep.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Stop the attack on Ashford", response = "Then someone else bleeds instead. I will tell you who — after.", statDeltas = fixed_array(0, 0, 0, -8, 0, -4, 8, 0, 0)),
                        DialogueChoice(choiceText = "Allow Ashford's death", response = "Then the east belongs to whoever survives dawn. You chose speed over mercy.", statDeltas = fixed_array(0, 0, -8, 0, 0, 0, -15, 0, 12)),
                        DialogueChoice(choiceText = "Stop Dell-Crow blood", response = "Peace in the south for a price. Kaspar or Raymond pays it in the dark.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 4, 0, 0)),
                        DialogueChoice(choiceText = "Let the knives fall", response = "Then I sell memoirs. You inherit a shorter council and longer nightmares.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 10)),
                        DialogueChoice(choiceText = "Knox takes the contract", response = "Clean. Criminal. Yours. Name them and pay.", statDeltas = fixed_array(0, 0, 0, -12, 0, -8, 0, 0, 8)),
                    )
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
                    prompt = "Your Majesty, I write the first draft of your reign while blood dries.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Title it Conciliation", response = "Flattering. Fragile. I will write what you need — not what you earned.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 6, 0, 0)),
                        DialogueChoice(choiceText = "Title it Terror", response = "Honest. Cruel. Future lords will read it before they plot.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -6, 0, 6)),
                        DialogueChoice(choiceText = "Bribe the chronicle", response = "Expensive fiction. Knox will sell the true chapter anyway.", statDeltas = fixed_array(0, 0, 0, -15, 0, -8, 3, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the great houses have reached their verdict.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the peerage", response = "Then rule with Ashford's shadow on your shoulder. Efficient — if you like knives at your back.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 12, 0, 10)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc8BeatsEn : Encounter[9] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MORWEN,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Morwen — the woman who turns policy into rope. Edwin's cells still hold men who swore to his ghost. I heard you cleansed the court, turned the household, or let whispers walk the halls. The lower dungeon breathes overcrowded. Hang the loyalists, sell forgiveness for coin, or empty the cells and dare the realm to test you.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang ringleaders", response = "Then fear learns your handwriting. The loyalists die. The frightened obey.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 0, 0, 5)),
                        DialogueChoice(choiceText = "Sell forgiveness", response = "Justice as tariff. Borvin will call it crude. I call it employment.", statDeltas = fixed_array(0, 0, 0, 15, 0, -4, -5, 0, 0)),
                        DialogueChoice(choiceText = "Empty the cells", response = "Dangerous mercy. Men you free may love you — or stab you. I sharpen steel either way.", statDeltas = fixed_array(0, 0, -5, 0, 0, 10, 0, 0, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik sends names — church splitatics, soup-preachers, men who call you forfeit in rhyme. I heard you knelt, defied, or fractured the Church. Heaven wants heretics. The crown wants traitors. My scaffold fits both if you widen it. Burn Church lists, hang crown lists, or hang everyone and let the mob sort scripture.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang Church's list", response = "Then Malrik smiles and the streets whisper *puppet*. Efficient — if you like holy collars.", statDeltas = fixed_array(-6, 12, 0, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hang crown traitors only", response = "Then Malrik calls you secular tyrant. Soldiers call you consistent. I call it busy.", statDeltas = fixed_array(0, -8, 5, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Commute to fines", response = "Gold instead of necks. Priests hate it. Merchants love it. I oil the hinges.", statDeltas = fixed_array(0, -4, 0, 8, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Yarek's miners and Ruta's millers knocked on the granary with tools that were not for milling. I heard requisition, soup lines, or rotting stores. The hungry do not read statutes — they read empty bowls. Hang rioters to teach arithmetic, pardon them to teach mercy, or hang the captain who fired first and pardon the rest.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Mass hanging", response = "Then the provinces learn fear. They may not learn loyalty. Both keep thrones — briefly.", statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, -3, 0)),
                        DialogueChoice(choiceText = "Hang officers, pardon miners", response = "Surgical rope. The commons may call it justice. Officers call it betrayal. Both can be true.", statDeltas = fixed_array(4, 0, -4, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pardon all", response = "Then Rudolf grumbles and Arvel prays. I idle. Rare and dangerous.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the fever wards sent me three men who woke screaming and never stopped. I heard Mira's bottles, Malrik's miracles, or Odo's cheaper brew. Madness is not treason — but treason is easier to explain to mobs. Hang the mad to quiet the square, lock them in Morwen's quiet cells, or fund Mira's care and call it crown mercy.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang the mad", response = "Cruel clarity. The square sleeps. The wards scream louder where no one listens.", statDeltas = fixed_array(0, 0, 4, 0, -5, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Crown-funded asylums", response = "Expensive mercy. Mira will call it late. The families will call it something.", statDeltas = fixed_array(0, 0, 0, -12, 8, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Morwen's private cells", response = "Quiet horror. Better than loud horror. The chronicles may still find out.", statDeltas = fixed_array(0, 0, 0, 0, 3, -4, 0, 0, 3)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, great houses send preliminary lists — names they want gone before they bow. I heard Ashford, Kaspar, Dell, and Crow in the same sentence as *treason*. Nobility unlock approaches on day one-seventy-five. Hang commoners now to warn peers, refuse all noble lists until Ashford rides, or sell expedited trials to the highest bidder.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Refuse noble lists", response = "Then peers hate you early. You may hate them later. Fair trade.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, -6, 0, 4)),
                        DialogueChoice(choiceText = "Hang two commoners as warning", response = "Theatre for the soon-to-arrive. Cruel. Effective. I am employed.", statDeltas = fixed_array(-5, 0, 4, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Sell expedited trials", response = "Commerce precedes the feast. Knox smiles somewhere. I sharpen steel.", statDeltas = fixed_array(0, 0, 0, 12, 0, -5, -8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Lady Ashford rides soon and she will measure your scaffold like a tailor measures spine. I heard you blocked noble lists, sold trials, or filled the yard with rioters and heretics. Hang a traitor from Edwin's guard to impress her, empty the yard to disarm her, or let her send the first name and see whether you obey.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang Edwin's last captain", response = "Then eastern eyes see rope. Western ghosts see warning. Both look at you.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 4, 0, 0)),
                        DialogueChoice(choiceText = "Empty the yard", response = "Bold mercy before nobility unlocks. She will call it bribery of conscience.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, 5)),
                        DialogueChoice(choiceText = "Accept Ashford's first name", response = "Then you hang before she bows. Partnership — or submission. She will know which.", statDeltas = fixed_array(0, 0, 0, 0, 0, -10, 8, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I am Talen — I fix problems the scaffold cannot price. I heard Morwen's rope busy, Knox's ledgers louder, and Ashford's lists longer. For a chest of silver I can lose a noble's name before dawn. For a secret I can hang a commoner instead. For nothing I can tell the market which king you are. What do you buy?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay Talen", response = "Then one throat breathes who should not. You will forget which. I will not.", statDeltas = fixed_array(0, 0, 0, -18, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Refuse and expose him", response = "Then I vanish before Morwen wakes. You gain sermon fodder and lose convenience.", statDeltas = fixed_array(0, 0, 3, 0, 0, 8, -4, 0, 0)),
                        DialogueChoice(choiceText = "Hire him for the crown", response = "Republic of rope. Morwen will hate me. You will love the quiet lists.", statDeltas = fixed_array(0, 0, 0, -25, 0, -12, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the cells are full again — rioters, heretics, madmen, names Talen misplaced, names lords prepaid. I heard Great Houses sharpening knives for each other. Declare mass forgiveness and empty my yard, declare mass hanging and teach the realm silence, or continue case by case while peers murder in alleys without me.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Mass forgiveness", response = "Then I oil unused hinges. The realm calls it weakness until it calls it wisdom.", statDeltas = fixed_array(8, 0, -6, 0, 0, 15, 0, 0, 0)),
                        DialogueChoice(choiceText = "Mass hanging", response = "Then birds avoid the square. Order arrives. Mercy leaves on horseback.", statDeltas = fixed_array(-10, 4, 10, 0, 0, -15, 0, 0, 0)),
                        DialogueChoice(choiceText = "Case by case", response = "The hardest throne. I will sleep less. You will sleep barely.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 3, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, ninety-three days since Morwen first counted Edwin's loyalists — and the realm knows you by rope. I heard heretics, rioters, madmen, and Talen's misplaced names. The square is quiet. The heart is not. You bought bloody peace. It holds — until it does not.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the scaffold", response = "Then I write *rope* and hope fear outlasts resentment.", statDeltas = fixed_array(0, 0, 10, 0, 0, -10, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc9BeatsEn : Encounter[7] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Meribald — I read what heaven writes in numbers, not rhymes. A comet crosses Edwin's constellation on the night you took his chair. I heard a blade, a household purged or haunted, and Malrik still deciding your soul's tax bracket. The comet confirms killing a king to anyone who looks up. Silence me, regulate me, or crown the sky your king's close advisors.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Proclaim the comet", response = "Then nobles look up before they look at you. Dangerous — if heaven changes its mind.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 8, 0, 6)),
                        DialogueChoice(choiceText = "Private audience only", response = "Prudent. Boring. The mob will still look up without your permission.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hand him to Cyrus", response = "Inquisitors love comets — briefly. You will not hear my tower again until you do.", statDeltas = fixed_array(0, 12, 0, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Lady Ashford's birth-house sits in the eastern quadrant — ambitious, brittle, fond of nephews and rope. I heard hunger, scaffold mercy, and Church forfeit machinery. The chart says she will measure your reign on day one-seventy-five. Publish her omen and she will hate you. Withhold it and she will fear you. Sell it and she will own you.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publish Ashford's chart", response = "Then she arrives already insulted. Prepared. Dangerous. Like eastern weather.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -6, 0, 5)),
                        DialogueChoice(choiceText = "Share chart privately with Ashford", response = "Then you buy her entrance with prophecy. She will bill you in council seats.", statDeltas = fixed_array(0, 0, 0, -8, 0, -4, 8, 0, 0)),
                        DialogueChoice(choiceText = "Burn the chart", response = "Then you rule without heaven's preview. She will bring her own omens — and soldiers.", statDeltas = fixed_array(0, 4, 4, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the market square fills for two sermons — my eclipse math and the Prophet's winter rhyme. I heard Dell and Crow insult each other in verse while Knox sells maps. The mob wants one truth. Heaven offers two. Regulate both, embrace mine, or let the square choose and call it policy.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown astronomy", response = "Then the Prophet's rhymes go underground. Underground rhymes grow teeth.", statDeltas = fixed_array(-10, 6, 0, 0, 0, 0, 0, 0, 8)),
                        DialogueChoice(choiceText = "License both", response = "Bureaucracy of miracles. Malrik hates it. Borvin loves it. I tolerate it.", statDeltas = fixed_array(0, -4, 0, 10, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let the mob choose", response = "Then you are not king of signs — you are referee. Referees get hit by both teams.", statDeltas = fixed_array(8, -6, 0, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Meribald counts lights while I count breaths. I heard you proclaimed his comet, burned Ashford's chart, or sold omens like salt. The mob asked which king winter serves. I say: the one who feeds lungs and ears. He says: the one who reads charts. Choose a victor, choose both, or choose silence and let faith fight faith without your badge.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Back the Prophet", response = "Then Meribald's tower darkens. Malrik roars. The poor hum your name. Dangerous music.", statDeltas = fixed_array(12, -12, 0, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Back Meribald", response = "Then my market shrinks. His tower brightens. Nobles smile. Peasants calculate.", statDeltas = fixed_array(-8, 4, 0, 0, 0, 0, 8, 0, 0)),
                        DialogueChoice(choiceText = "Hang neither", response = "Steel solves sermons until it becomes the next sermon. Both of us remember.", statDeltas = fixed_array(-6, 0, 8, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the succession house flickers — Edwin's line, your line, no line. I heard nephews whisper, Ashford map her council, and Ilana write chapters in blood or ink. The chart shows a child-shaped gap before day three-twenty. Publish it and rivals move. Suppress it and rivals guess. Forge it and rivals laugh — until they do not.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publish the gap", response = "Honest terror. Honest policy. Ingvar will read it before Malrik does.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 4, 0, -10)),
                        DialogueChoice(choiceText = "Suppress the chart", response = "Then Knox sells fake seals by Friday. You chose mystery. Mystery is expensive.", statDeltas = fixed_array(0, 0, 0, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Forge a favorable heir-omen", response = "Beautiful fraud. Ashford will audit heaven. I will watch.", statDeltas = fixed_array(0, -8, 0, 0, 0, -10, 0, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Knox sold your birth hour to Ingvar, Ashford, and a prophet who pretends not to buy. I heard northern steel, guild ledgers, and street rhymes share my tower's trash. The stars align for a leak — not water, secrets. Hang Knox, buy my silence, or publish everything and dare the realm to digest truth at once.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publish Knox's buyers", response = "Then the court panics uniformly. Rare achievement. Stars approve chaos sometimes.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -12, 0, 5)),
                        DialogueChoice(choiceText = "Buy Meribald's silence", response = "Expensive astronomy. Knox forgets nothing. Neither do I — for a time.", statDeltas = fixed_array(0, 0, 0, -20, 0, -4, 0, 0, 6)),
                        DialogueChoice(choiceText = "Hang Knox", response = "Too late for copies. Early enough for sermon. Both of us knew that.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, two hundred and thirteen days since a comet confirmed what the blade began — and the court looks up before it looks down. I heard charts proclaimed, Ashford mapped, Knox exposed, succession weighed in angles. You rule as astrologer king. Malrik calls it heresy. Nobles call it service. The tower calls it Tuesday.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the stars", response = "Then govern by chart and chair. May both agree on succession.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 10, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc10BeatsEn : Encounter[6] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_PROPHET,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I have no name because names are for men who die once. I have a winter — three frosts, three kings, one throne. I heard a blade gave you Edwin's chair while his household still breathes. I heard Malrik still chooses whether heaven knows your face. The market wants a sign. Do you silence me, hear me, or sell me to the Church?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hear him publicly", response = "Then winter has a third voice — yours, Malrik's, and mine. Dangerous music. The poor will hum it.", statDeltas = fixed_array(0, -8, 0, 0, 0, 8, 0, -3, 0)),
                        DialogueChoice(choiceText = "Give him to Cyrus", response = "Inquisitors love unnamed tongues. You will not hear mine again — until you do.", statDeltas = fixed_array(0, 10, 0, 0, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ignore him", response = "Wise. Boring. Most winters are. I will be back when the cough reaches the altar.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the wards cough and the bells toll. I heard you funded Mira's bottles — or Malrik's holy water — or neither and called it prudence. I preach what the fever teaches: the throne is a lung, the realm exhales debt, and the king who took the throne is whichever king stops breathing last. Do you baptize my sermon, ban it, or let the sick decide?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Let him preach in the wards", response = "Then the sick hear two cures. One may save you. One may save me. Neither is guaranteed.", statDeltas = fixed_array(0, -10, 0, 0, 5, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ban street sermons during the plague", response = "Bans feed martyrs. The cough does not read decrees. Remember I warned you.", statDeltas = fixed_array(0, 6, 4, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Co-opt him", response = "Then I speak your winter with your accent. Useful. False. Popular enough.", statDeltas = fixed_array(0, 3, 0, -8, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the fox appeared on three legs and left on four. I am the voice it borrowed — ridiculous, yes. The lame walked in the lower market yesterday. Malrik calls it mockery. The people call it hope with a tail. Crown the fox, crown the Church, or crown your common sense and deny us all.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Embrace the fox cult", response = "Then banners will carry whiskers. Malrik will cast out from church a mammal. You will laugh until the levies refuse to march.", statDeltas = fixed_array(0, -18, 0, 0, 0, 12, 0, -5, 0)),
                        DialogueChoice(choiceText = "Burn the shrine", response = "Ash and squeals. The people will remember who killed the miracle. So will the chronicles.", statDeltas = fixed_array(0, 15, 5, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Investigate fraud", response = "Clever. There are always handlers. There are also always believers. You cannot jail both.", statDeltas = fixed_array(0, 0, 0, -5, 0, -3, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Lady Ashford measured your throat and the great houses took notes — I heard Kaspar accuse, Dell shriek, Crow bid, Raymond march, and Goose honk before the scaffold even warmed. I prophesy a house that bowed in public and plots in linen — or plots in the grave. Name the liar, or name yourself — winter returns either way.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Use the prophecy against a rival house", response = "Then you wield my tongue like a dagger. Flattering. Unworthy. Effective.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -8, 0, 10)),
                        DialogueChoice(choiceText = "Denounce prophecy in the hall", response = "Brave words. Ashford will smile. The provinces will shrug. Winter keeps its calendar.", statDeltas = fixed_array(0, 4, 0, 0, 0, -4, 6, 0, 0)),
                        DialogueChoice(choiceText = "Invite him to Ashford's table", response = "Dangerous theatre. I will speak in tongues they understand: debt, heirs, and hunger.", statDeltas = fixed_array(0, 0, 0, -6, 0, 8, -4, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Loyalty is no longer a sermon — it is arithmetic. I heard Ingvar's gold and Knox's nets in the same sentence last month. I prophesy the knife that buys you dawn and the kiss that sells your maps. Do you hang the prophet who names traitors, or hang the traitors he names?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Let him name names in the square", response = "Then the square decides before your judges do. Fast. Filthy. Yours if you control the outcome.", statDeltas = fixed_array(0, 0, 6, 0, 0, -10, 0, 0, 8)),
                        DialogueChoice(choiceText = "Arrest him", response = "Then I become the martyr Malrik wanted and Cyrus could not make. Hang the voice, not the message.", statDeltas = fixed_array(0, 8, -3, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Private audience", response = "Then we sin together in silence. I will point at Knox. You will point at whoever serves you least.", statDeltas = fixed_array(0, 0, 0, -10, 0, 8, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three hundred and twenty-five days since a blade made you king and winter made me your shadow. The streets call you the Winter King — not for cruelty, for listening. Malrik calls it heresy. The people call it the first honest reign. You crowned the omen. History will rhyme your name.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the last sign", response = "Then rule sermons and steel. Malrik will cast out from church the year. The people will remember rhymes.", statDeltas = fixed_array(12, -20, 0, 0, 0, 15, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc11BeatsEn : Encounter[10] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_KNOX,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, Ingvar is not my only buyer this month. I heard northern steel, guild ledgers, and servant names from below your stairs. A foreign house offers coin for your council roster — who sleeps at the door, who signs your decrees, who still whispers Edwin. Sell the court map, refuse and hunt buyers, or hire me exclusively and pray I stay hungry.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Refuse and purge buyers", response = "Then I vanish before dusk — or sell to someone angrier. You chose steel over commerce.", statDeltas = fixed_array(0, 0, 8, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Accept foreign retainer", response = "Then your court has a landlord overseas. Efficient. Treasonous. Often both.", statDeltas = fixed_array(0, 0, 0, 20, 0, -15, 0, 0, -10)),
                        DialogueChoice(choiceText = "Exclusive crown contract", response = "Expensive pet. I bite other hands. Not yours — until the price changes.", statDeltas = fixed_array(0, 0, 0, -18, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, loyalty is about to become a meter the realm reads aloud. I heard Knox's foreign offer, servant leaks from the stairs, and northern maps sold twice. Paranoia keeps thrones — policy keeps realms. Purge the court before day two-sixty, manage spies like a treasury, or trust someone — name who — and dare the statistic.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Policy of purge", response = "Then I write *iron* early. The court will not thank you. It will obey — briefly.", statDeltas = fixed_array(0, 0, 10, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Policy of managed spies", response = "Clever. Exhausting. Like ruling two courts — one visible, one numbered.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Policy of trust", response = "Dangerous simplicity. If you are wrong, you are wrong magnificently.", statDeltas = fixed_array(0, 0, 4, 0, 0, 10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, decrees circulate in Edwin's hand — my hand — your hand — and the fake seal is exquisite. I heard Knox sell maps, foreign houses bid, and Loyalty unlock approach. Hang the forger, authenticate every seal with pain, or use false decrees to feed false buyers and learn who bites.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Authenticate all seals", response = "Then policy crawls and trust inches upward. Rare. Boring. Useful.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 6)),
                        DialogueChoice(choiceText = "Feed fake seals to Knox's buyers", response = "Then liars eat liars. If they compare notes, you burn. Until then, you learn.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hang Osric", response = "Convenient. fake seals continue without a neck to blame. You chose theatre.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I wear a mask because names are contracts — and I have not decided whom I serve. The court demands audience. I heard forged decrees, foreign offers, and Edwin's chamber still debated below stairs. Unmask me publicly, grant private council, or refuse audience and let rumor name me nephew, ghost, or merchant prince.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Public audience", response = "Then rumor becomes spectacle. Spectacle is cheaper than truth and twice as loud.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 10)),
                        DialogueChoice(choiceText = "Private council", response = "Then you govern whispers. I will whisper back. Knox will try to listen.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, 8)),
                        DialogueChoice(choiceText = "Refuse audience", response = "Then I vanish and ten masks appear. You chose mystery. Mystery multiplies.", statDeltas = fixed_array(0, 0, 4, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three men claim my post — mercenary, Edwin's veteran, foreign sworn sword. I heard Knox's offer, Osric's fake seals, and a mask in your council. Loyalty meter says the realm watches who you trust at the door. Keep me, rotate guards, or double posts and bankrupt trust.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Keep Raena", response = "Then I stay. If you fail me, you fail simplicity.", statDeltas = fixed_array(0, 0, 4, -8, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Rotate guard", response = "Then assassins schedule around shifts. So will you.", statDeltas = fixed_array(0, 0, 6, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hire foreign sword", response = "Then I leave before dusk. You chose novelty over memory.", statDeltas = fixed_array(0, 0, 10, -15, 0, -15, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I write the first draft of your reign while knives sell second drafts abroad. I heard Knox, foreign houses, and Talen price your mornings. Buy my chapter exclusively, let chapters leak and learn who reads, or burn drafts and rule without chronicle — blind, but unquoted.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Exclusive chronicle", response = "Then you buy sentences. Expensive. Worth it if you finish the book.", statDeltas = fixed_array(0, 0, 0, -12, 0, 8, 0, 0, 8)),
                        DialogueChoice(choiceText = "Let chapters leak", response = "Then Knox profits and you learn. Both can be true. Both hurt.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -6, 0, 0)),
                        DialogueChoice(choiceText = "Burn drafts", response = "Then rumor owns your verbs. Soldiers may prefer it that way.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, true ledgers walk while court ledgers lie. I heard Knox sold pages, Ilana sold chapters, foreign houses bought both. Borvin's numbers say Loyalty is a luxury line-item. Publish true accounts, feed false numbers to spies, or hang the clerks and pretend arithmetic is moral.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publish true accounts", response = "Then the court panics uniformly. Honesty is a kind of purge.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, -8, 0, 0)),
                        DialogueChoice(choiceText = "Feed false ledgers", response = "Clever until two liars compare. Still — buy time.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hang clerks", response = "Theatre. The numbers continue without necks to blame.", statDeltas = fixed_array(0, 0, 0, 8, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I am Talen — fixer, whisperer, bill presented after damage. I heard Knox works for three crowns: yours, Ingvar's, and a masked third who pays in succession rumors. Expose Knox, join the auction, or hire me to lie to all three and call it policy.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Expose Knox publicly", response = "Then he vanishes and ten smaller Knoxes appear. You chose sermon over solution.", statDeltas = fixed_array(0, 0, 5, -5, 0, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Join the auction", response = "Then you rent loyalty weekly. I approve of subscriptions.", statDeltas = fixed_array(0, 0, 0, -25, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hire Talen to lie to all three crowns", response = "Then truth dies of overwork. You survive — until the lies meet.", statDeltas = fixed_array(0, 0, 0, -12, 0, -8, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the yard lists traitors — or loyalists — depending who writes lists. I heard Knox, Talen, foreign swords, and forged decrees. Purge the guard and teach fear, reform oaths and teach patience, or ignore the yard and teach contempt. Loyalty meter will read your choice aloud.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Purge the guard", response = "Then fear keeps order until fear finds a leader.", statDeltas = fixed_array(0, 0, 10, -10, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Reform oaths", response = "Gold and ledgers. Traditional pairing. Less bloody. Not bloodless.", statDeltas = fixed_array(0, 0, 4, -15, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ignore the yard", response = "Then gossip becomes policy without your signature.", statDeltas = fixed_array(0, 0, -5, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, sixty-seven days since Knox's foreign offer — and the court knows you by purge. I heard fake seals hunted, masks refused, guards replaced, ledgers scapegoated. Iron chancellor — fear keeps the council in line. Loyalty survives. Warmth does not.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the court", response = "Then I write *iron* and hope fear outlasts resentment.", statDeltas = fixed_array(0, 0, 12, 0, 0, -6, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc12BeatsEn : Encounter[10] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_EDRIC,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I speak for a boy you hoped was fog — Edwin's nephew, exiled, hungry, and tired of your chair. I heard guild creditors, star-charts, and great houses measure your reign. Deny him and call me liar, seek him and call me guide, or use my claim to frighten Ashford before she rides again. The mask stays. The question does not.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Deny the nephew", response = "Then the fog thickens. Someone will believe anyway. Lies need only patience.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 6, 0, 8)),
                        DialogueChoice(choiceText = "Seek the nephew", response = "Then hunters multiply. I sell directions. Others sell traps. You bought motion.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, -6)),
                        DialogueChoice(choiceText = "Weaponize the claim", response = "Dangerous theatre. Ashford will call it slander. The market will call it policy.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -8, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, a marriage was arranged to silence Edwin's nephew — my family's insurance, not your romance. I heard a mask speaks his name in the capital. Marry the silence properly, hunt the boy for me, or admit the nephew lives and let Ashford broker his cage. I do not share power with fog.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Ashford marriage", response = "Then my house owns eastern peace and your succession story. You gain a leash. I gain a crown-adjacent future.", statDeltas = fixed_array(0, 0, 4, 0, 0, -8, 12, 0, 10)),
                        DialogueChoice(choiceText = "Refuse marriage", response = "Then we are rivals, not kin. I will remember who refused insurance.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -10, 0, -5)),
                        DialogueChoice(choiceText = "Broker nephew to Ashford", response = "Shared custody of a kinglet. Humiliating. Efficient. Very eastern.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 6, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three buyers want the boy's location — Ashford, Ingvar, and a masked fixer who pays in succession rumors. I heard you denied, hunted, or brokered the nephew. I sell coordinates to the highest bidder unless you outbid everyone and buy fog outright.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Outbid all buyers", response = "Then fog is rented, not cleared. I appreciate subscriptions.", statDeltas = fixed_array(0, 0, 0, -25, 0, 4, 0, 0, 8)),
                        DialogueChoice(choiceText = "Sell to Ashford", response = "Then eastern insurance activates. You bought peace with a boy's leash.", statDeltas = fixed_array(0, 0, 0, 0, 0, -10, 10, 0, 6)),
                        DialogueChoice(choiceText = "Let auction run", response = "Then Knox profits and you learn. Both hurt. Standard Tuesday.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Ingvar's clerks offer coin for a boy matching the nephew's description — alive, dead, or convincingly dead. I heard Talen's auction and Ashford's marriage plots. Sell the nephew north and buy peace, refuse and arm a legend, or fake a corpse and sell the fake seal twice.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Refuse", response = "Then Ingvar prices your stubbornness in steel. Domestic problems beat foreign crowns — usually.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, -4)),
                        DialogueChoice(choiceText = "Sell location north", response = "Then you rent peace with blood you may never see. Efficient. Monstrous. Familiar.", statDeltas = fixed_array(0, 0, 0, 15, 0, -12, 0, 0, -15)),
                        DialogueChoice(choiceText = "Fake death", response = "Then three ledgers own a dead boy who may still breathe. I admire the accounting.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, -6, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, birth records disagree — Edwin's nephew born in spring, summer, or not at all. I heard Knox sold north, Talen sold coordinates, Ashford sold marriage. Forge records proving nephew bastard, restore Edwin's original line, or burn the archive and let fog win.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Forge bastardy", response = "Then ink kills boys whom steel cannot find. Ashford will call it crude. It may work.", statDeltas = fixed_array(0, 4, 0, 0, 0, -8, 0, 0, 12)),
                        DialogueChoice(choiceText = "Restore Edwin's records", response = "Honest paperwork. Dangerous honesty. The realm reads ledgers like sermons.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, -10)),
                        DialogueChoice(choiceText = "Burn the archive", response = "Then historians hate you. Historians are not armies. Yet.", statDeltas = fixed_array(0, 0, 6, 0, 0, -6, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I write two succession chapters — yours by blade, his by blood. I heard forged births, northern bids, and masks in council. Publish the nephew chapter and split the realm, publish yours only and call him myth, or publish both and let the realm choose its headache.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publish nephew chapter", response = "Then the realm reads civil war before breakfast. Honest — if you survive it.", statDeltas = fixed_array(8, 0, 0, 0, 0, 6, 0, 0, -12)),
                        DialogueChoice(choiceText = "Crown chapter only", response = "Then footnotes grow teeth in alley sermons. You chose narrative discipline.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 5, 0, 10)),
                        DialogueChoice(choiceText = "Dual publication", response = "Democracy of disaster. Bold. Exhausting. Very this year.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 0, -6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the northern princes want Edwin's nephew — as hostage, heir, or saint. I heard Knox sold coordinates, Ilana published chapters, Osric forged births. Surrender the boy for alliance, deny him and fight spring, or offer your own succession story and dare them to call it lie.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Deny the north", response = "Then we price your denial in steel next spring. Consistent diplomacy.", statDeltas = fixed_array(0, 0, 8, 0, 0, 4, 0, 0, 6)),
                        DialogueChoice(choiceText = "Surrender nephew", response = "Then you buy peace with Edwin's bloodline. Humiliating. Durable, sometimes.", statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, -12)),
                        DialogueChoice(choiceText = "Offer throne-stealer's charter", response = "Bold insult to the sacred against blood. I will carry the message north. They will laugh — then calculate.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the mask comes off because stories must end or explode. I heard chapters, fake seals, northern bids, and your reign measured in fog. I may be Edwin's nephew, Ashford's pawn, a merchant's son, or a mask Knox wears for profit. Demand truth publicly, accept private answer, or declare the mask itself the only heir that matters.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Public unmasking", response = "Then the realm gasps collectively. Useful sound. Dangerous sound.", statDeltas = fixed_array(8, 0, 0, 0, 0, 10, 0, 0, -15)),
                        DialogueChoice(choiceText = "Private answer", response = "Then you carry truth alone awhile. Heavier than crowns. Lighter than mobs.", statDeltas = fixed_array(0, 0, 0, -8, 0, 6, 0, 0, 5)),
                        DialogueChoice(choiceText = "Reject unmasking", response = "Then fog persists. Fog elected kings before. It may again.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, ninety-four days since a mask named Edwin's nephew — and the boy is dead on paper, in fact, or convincingly enough. I heard hunts, fake seals, northern bids, and Ashford's insurance. Nephew dead. Your line stands on blade and ledger. Guard it — fog has cousins.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the line", response = "Then I write *survivor* and close the nephew ledger.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, winter ends and the true line sleeps in earth or ink. I heard you killed a boy, a myth, or both. My last succession omen is short: **the chair eats names**. Yours remains — for now.  *(Should not fire — game over on day 328. Edge case: Prophet mocks empty throne.)*  Your Majesty, I heard the nephew walks northern snow. Exile is a kind of crown — cold, far, patient. The true line breathes where you cannot reach.  Your Majesty, I heard the realm chose your story over Edwin's blood. Your right to rule is a sermon the living preach. My omen: **the king who took the throne becomes dynasty** — if you survive the next winter.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the omen", response = "Then fog closes. Spring opens other ledgers.", statDeltas = fixed_array(0, -4, 0, 0, 0, 3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
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

let public arc13BeatsEn : Encounter[29] <- fixed_array(
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_MIRA,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, Grey Lung has returned in the southern ports — the same fever that hollowed Estedor under King Edwin. I have a physic's formula from the eastern courts: distilled willow bark, sulfur smoke, and a tincture that breaks the lung-cough. My apprentices can brew it within the month, but I need the crown's gold and your word that no priest will burn my stills as witchcraft.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund the cure in full", response = "Then let the realm see a king who spends on breath, not banners. I will begin the distilleries tonight.", statDeltas = fixed_array(0, 0, 0, -22, 8, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fund half", response = "Half buys half a chance. I will not let the sick wait for your caution, but I will try.", statDeltas = fixed_array(0, 0, 0, -12, 4, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "The treasury cannot spare it", response = "Then prepare your coffers for funeral candles instead of soldiers. I will do what I can without your coin.", statDeltas = fixed_array(0, 5, 0, 0, -6, -4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Return in two weeks", response = "Two weeks is a thousand coughs. I will count them for you, Majesty.", statDeltas = fixed_array(0, 0, 0, 0, 0, -2, 0, 0, 0)),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the tincture works in the test wards — but slowly. Three patients who coughed blood on Sunday could speak full sentences by Thursday. To brew enough for the lower wards I need either more gold from your treasurer, or your permission to press conscripted laborers into the distilleries. I will not pretend this is a gentle request.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay for faster production", response = "Then the sick will have bottles before the next moon. Borvin will hate me, but the wards will bless you.", statDeltas = fixed_array(0, 0, 0, -15, 6, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Use army labor in the distilleries", response = "Soldiers smell of pitch and vinegar, but their hands are steady. Rudolf will call it humiliation. I call it survival.", statDeltas = fixed_array(0, 0, -8, 0, 8, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "The formula is enough", response = "Patience is a virtue for the healthy. I will stretch what we have and pray it reaches in time.", statDeltas = fixed_array(0, 0, 0, 0, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the fever has crossed the river. I did not come to beg — I came to count. Forty dead in the lower wards this week, and the priests already call it judgment on the throne. You refused me once. Will you refuse the arithmetic as well?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "You were right", response = "Late coin still buys breath. I will not shame you for changing your mind — only for how many died while you did.", statDeltas = fixed_array(0, 0, 0, -25, 10, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Quarantine the lower wards", response = "Walls keep the cough in and the hatred in with it. It may slow the fever. It will not slow the rumors.", statDeltas = fixed_array(0, 0, -5, 0, 5, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Stand by the refusal", response = "Then record my words, Majesty: when the pyres smoke, do not ask why the people call you King of Ash.", statDeltas = fixed_array(0, 8, 0, 0, -12, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, you asked for two weeks. I gave them. Twenty-seven dead in the lower wards while your treasurer counted coins. I am back — not to plead, but to learn whether a king who took the throne can afford to save the realm he seized, or whether Estedor must burn twice.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund the cure in full", response = "Then let the realm see a king who spends on breath, not banners. I will begin the distilleries tonight.", statDeltas = fixed_array(0, 0, 0, -22, 8, 1, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fund half", response = "Half buys half a chance. At least you did not make me wait a third week.", statDeltas = fixed_array(0, 0, 0, -12, 4, -1, 0, 0, 0)),
                        DialogueChoice(choiceText = "The treasury still cannot spare it", response = "Then prepare your coffers for funeral candles instead of soldiers.", statDeltas = fixed_array(0, 5, 0, 0, -6, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the faithful already whisper that your crown poisons souls with foreign physic. Healer Mira's tincture may break the cough, but it will not mend a realm that thinks its king trusts herbs more than heaven. Grant the Church stewardship of the cure, and the people will thank God — and perhaps forget the blade that put you here.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Medicine stays with Mira", response = "Then let the sick thank the physic, and let the priests learn humility. I will not burn her stills — but I will not bless them either.", statDeltas = fixed_array(0, -12, 0, 0, 5, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Shared distribution", response = "A prudent compromise. The faithful see God's hand; the sick still swallow the tincture. Both may call it mercy.", statDeltas = fixed_array(0, 8, 0, -5, 3, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let the Church take the cure", response = "Then the miracle belongs to the altar, and Mira's name fades from the ledger. The realm will hear that heaven saved Estedor — not you.", statDeltas = fixed_array(0, 15, 0, 0, -5, -3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, you refused the physic and the fever climbs. My brothers offer what Mira cannot: relics, prayer, and holy water from the shrine of Saint Alaric. The people are frightened. If you will not buy eastern tinctures, will you at least let God try?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept holy remedies", response = "Then kneel with your subjects and pray. If the fever breaks, heaven receives the glory. If it does not, you will have no one left to blame.", statDeltas = fixed_array(0, 18, 0, 0, -8, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Mira's last offer", response = "A king who waits until the pyres smoke to buy mercy deserves the physic he refused. Fund her, or bury your pride with the dead.", statDeltas = fixed_array(0, -5, 0, -20, 8, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Neither physic nor miracle", response = "Then the realm will know its king trusts nothing: not gold, not God, not the breath of his people.", statDeltas = fixed_array(0, -8, 0, 0, -10, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my men cough before battle. Mira's bottles reach the great houses first and the barracks last — if they reach them at all. Either the cure marches with the army, or the army marches on your throne. I do not make threats lightly. I make them when soldiers cannot draw breath.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Soldiers first", response = "Then my men will remember who kept them breathing. The nobles will scream. Let them.", statDeltas = fixed_array(0, 0, 12, 0, 5, 3, -10, 0, 0)),
                        DialogueChoice(choiceText = "Common wards first", response = "Bread and breath win more loyalty than banners. My soldiers will curse you — until they stop coughing too.", statDeltas = fixed_array(0, 0, -8, 0, 4, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Sell doses to nobles to refill the treasury", response = "Gold in the coffers, fever in the barracks. I hope your walls are stronger than your arithmetic.", statDeltas = fixed_array(0, 0, -5, 15, -5, -12, 10, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the cough is in the palace kitchens and the guard barracks. I have patients on straw in the great hall. This is no longer a ward in the lower city — it is the capital itself. Either you find the gold you denied me, or you find the men to wall off half your city before the court catches what the commons have.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Emergency funding", response = "Too late for elegance, but not too late for breath. Give me the coin and stand clear of my tables.", statDeltas = fixed_array(0, 0, 0, -30, 15, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fire-quarantine the infected quarter", response = "Torches at the gates and screams behind the walls. It may slow the fever. It will not slow the songs they sing about you.", statDeltas = fixed_array(0, 0, -15, 0, 8, -15, 0, 0, 0)),
                        DialogueChoice(choiceText = "It will burn itself out", response = "Then write my report for the chronicles: the king who took the throne watched Estedor cough itself hollow and called it patience.", statDeltas = fixed_array(0, 0, 0, 0, -20, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the priests anoint the sick with holy water and call it cure. In two wards the coughing stopped. In four wards it worsened — because they were given blessed water instead of tincture. I will not stand in your chapel and call it fraud, but I will stand in your court and tell you: heaven is not brewing willow bark. Take the bottles back from Malrik, or bury more than sinners.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Return the cure to the physic", response = "Then let the priests keep their miracles and I will keep my patients. Choose who lives by fact, not by sermon.", statDeltas = fixed_array(0, -15, 0, 0, 10, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Double the Church's share", response = "Belief does not stop lung-cough. But it may stop riots. I wash my hands — you will need more than holy water for that.", statDeltas = fixed_array(0, 12, 0, 0, -8, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Split the city", response = "A kingdom divided by bottles and blessings. May you outlive the experiment, Majesty.", statDeltas = fixed_array(0, 5, 0, -8, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the cough has broken. In the lower wards they shout your name without spitting — I did not think I would live to hear that under a throne-stealer's reign. The formula holds. The chronicles will call you the king who saved breath. I will call you the king who paid for bottles when others paid for prayers.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the wards", response = "Then may the next plague find a crown that remembers the price of air.", statDeltas = fixed_array(0, 0, 0, -5, 5, 12, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the fever fades — but not before it carved a scar across three provinces. We saved many. We buried more. I will not lie and call it triumph. The realm will call you the Scarred King — or the king who took the throne who did enough. Both are true. Neither is comfort.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the dead counted", response = "Grief named aloud heals faster than grief denied. You counted the dead. That matters.", statDeltas = fixed_array(0, 0, 0, -10, 3, 10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the pyres smoke day and night. Estedor burns twice — once under Edwin, once under you. I have no more bottles and no more patience for kings who count coins while lungs fill with blood. The survivors already name you King of Ash. I will not argue with them.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the pyres", response = "Then I say it once for the ledger: King of Ash, second of his name. Outlive it if you can.", statDeltas = fixed_array(0, 10, 0, 0, -5, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, God cured the realm. The fever broke where holy water fell and prayer did not cease. The people kneel — not to the blade that took the throne, but to the hand that held the chalice. The conclave will call you the king blessed by the church. Mira will call it theatre. The faithful will call it salvation.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard heaven's verdict", response = "Then kneel when I ask. Heaven owns part of this story now.", statDeltas = fixed_array(0, 15, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        ),
        Encounter(
            startNodeIdx = 0,
            nodeCount = 1,
            characterIdx = CHAR_ODO,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I warned you Mira's eastern tincture was not the only brew, nor the safest. Three wards took my mask-and-vinegar compound — the cough broke faster, but two men woke screaming and never slept again. The families knock with stones. The chronicles will call you the Mad King's Physic. I call you the king who chose haste.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the screaming wards", response = "Madness in the square is worse than fever in the ward. Remember I warned you.", statDeltas = fixed_array(0, 0, 0, -15, 5, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the northern princes sent me with congratulations and a sharper question. Their ports sniff the wind from Estedor and want Mira's formula before Grey Lung crosses the mountains. Share it freely and earn allies. Sell it and earn coin. Refuse, and earn their suspicion at the worst possible season.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Share the formula", response = "Generous. The princes will call you a statesman. Borvin will call you a fool. Both may be right.", statDeltas = fixed_array(0, 0, 0, -5, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Sell the formula", response = "Commerce, not charity. They will pay and resent you. A familiar diplomacy.", statDeltas = fixed_array(0, 0, 0, 20, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Refuse", response = "Then arm your borders. Fever travels faster than envoys, but suspicion travels faster still.", statDeltas = fixed_array(0, 0, 5, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the square kneels to Malrik and his holy water. My distilleries still run at night — you know whose bottles broke the cough. I do not ask for statues. I ask whether the crown remembers who brewed the mercy the Church now sells with incense.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publicly credit Mira", response = "Then I will stand beside you, and let the priests choke on their hymns. Dangerous. Honest. Like you.", statDeltas = fixed_array(0, -10, 0, 0, 3, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Private thanks", response = "Gold I will take. Glory I would have earned. I will stay — for the sick, not for you.", statDeltas = fixed_array(0, 0, 0, -12, 5, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "The Church won peace", response = "Then I pack my stills and leave your court. The wards will find me. You will find Malrik.", statDeltas = fixed_array(0, 8, 0, 0, -5, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the survivors want a day to name their dead before the heralds shout victory. Three provinces scarred, and you have not yet spoken the count aloud. Give them a memorial, or give them silence — but know that silence also travels.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Grant a national day of mourning", response = "Then the realm will know its king counts the dead as well as the living. That is rarer than cure.", statDeltas = fixed_array(5, 0, 0, -8, 0, 12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Local vigils only", response = "Cold. Practical. The people will bury their own and remember who did not come.", statDeltas = fixed_array(0, 0, 3, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Turn mourning into tax relief for the worst provinces", response = "Bread and remission — the oldest mercy. They will take it. They will still whisper the names.", statDeltas = fixed_array(8, 0, 0, -15, 0, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I have served three kings and buried two. The court whispers that Grey Lung will finish what the coup began. I do not bring comfort. I bring arithmetic: rebellions germinate in graveyards. Tell me whether you intend to outlive this fever, or merely outlast the next audit.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Marshal every resource", response = "Then stop counting coins and start counting breath. I will bring what counsel I have left.", statDeltas = fixed_array(0, 0, 8, -10, 5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Seek the Church's blessing", response = "Incense will not empty the pyres. But frightened men kill kings before fevers do. A grim trade.", statDeltas = fixed_array(0, 12, 0, 0, -3, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "If the realm wants a new king, let them try", response = "Bold words. The graveyard is full of bold kings. I hope you are the exception.", statDeltas = fixed_array(0, 0, 5, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the scandal wards cost you more than bottles of tincture. Families demand compensation, Odo's creditors demand answers, and my ledgers demand a king who can still count. The realm will pay for madness one way or another. How do you want your treasury to bleed?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Open the coffers", response = "Expensive. Honest. The sort of choice that keeps a crown on your head — if anything still can.", statDeltas = fixed_array(0, 0, 0, -25, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fine Odo's estate and seize his stock", response = "Blood from a stone, but stones crack. The families will call it justice. Odo will call it theft.", statDeltas = fixed_array(0, 0, 0, 12, -3, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Say the crown was misled", response = "Cowardice dressed as policy. Cheap today. Priced in daggers tomorrow.", statDeltas = fixed_array(0, 0, 0, 5, 0, -12, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the lower wards want a statue — not of a saint, not of a soldier, but of the king who funded the bottles. Vulgar, flattering, and politically useful. Borvin says it costs gold. I say it buys something rarer: a king who took the throne remembered for breath instead of blood.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund the statue", response = "Then stand still long enough to be carved. Even kings who took the throne may have one honest portrait.", statDeltas = fixed_array(5, 0, 0, -10, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Refuse vanity", response = "Wiser. Stone does not cough. Living patients do.", statDeltas = fixed_array(0, 0, 0, -8, 8, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Put Malrik on the plinth instead", response = "You mock us both. I will take the ward. Let the priests take the stone.", statDeltas = fixed_array(0, 8, 0, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the northern princes closed their mountain passes to Estedor caravans. They call it caution. I call it the smell of pyres carried on the wind. Your neighbors do not fear the throne-stealer's blade anymore. They fear your cough.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Send physic and gold", response = "Too late for pride. If you can prove the fever wanes, they may unlock the gates. May.", statDeltas = fixed_array(0, 0, 0, -18, 5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Threaten reprisal if they keep the passes shut", response = "Threaten a kingdom that wheezes? Their archers do not cough. Yours may.", statDeltas = fixed_array(0, 0, 8, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Accept isolation", response = "Alone is how empires shrink. But it is how some kings survive the winter.", statDeltas = fixed_array(0, 0, 0, -5, 3, 0, 0, -8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the Holy See sends word: they would canonize the miracle of Estedor and name you its instrument on earth. A king who took the throne blessed by the church by Rome itself. Mira calls it theft. The faithful call it destiny. What shall I answer?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept canonization", response = "Then kneel once more. The throne becomes altar. Your enemies lose their best argument.", statDeltas = fixed_array(0, 18, 0, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Decline", response = "Proud. The See will not forget. Neither will the peasants who saw holy water work.", statDeltas = fixed_array(0, -8, 3, 0, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Propose Mira as the saint", response = "You would make Rome choke on truth. I admire the impulse. I will not deliver the letter.", statDeltas = fixed_array(0, -15, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the mad wards produced three rioters who broke a tax collector's skull with a bedpan. The prisons are full and the families want blood for blood. I can hang rioters and quiet the square, or you can find another way to answer madness born from your physic.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang the rioters", response = "The scaffold creaks. The square goes quiet. Quiet is not the same as forgiven.", statDeltas = fixed_array(-8, 0, 5, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pardon them", response = "Merciful. Dangerous. The collectors will arm themselves. The people will remember.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fund asylums", response = "Expensive mercy. The rioters live. The realm learns you count madness as your sin.", statDeltas = fixed_array(0, 0, 0, -20, 5, 8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I feed the poor at my monastery gate. Lately they speak of Grey Lung more than bread. The fever faded, but the grief did not. They ask whether the king who took the throne who funded bottles will fund a name for their dead — or whether survival is the only mercy they will ever see.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund provincial memorials", response = "Then I will read their names aloud at my gate. That is more than most thrones offer.", statDeltas = fixed_array(5, 0, 0, -12, 0, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Send Church prayers", response = "Prayers cost less than stone. The hungry will know which you chose.", statDeltas = fixed_array(0, 8, 0, 0, 0, -3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Survival is mercy enough", response = "Then they will move on — and remember that you told them to.", statDeltas = fixed_array(0, 0, 3, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the year turns and the cough is memory. When the chronicles write of your reign, they will begin with the fever — and end with breath restored. I buried patients and praised you in the same breath. The realm will call you the Physician King. I will not argue.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the legacy", response = "Then may the next plague find a crown that remembers the price of air.", statDeltas = fixed_array(0, 0, 0, 0, 5, 10, 0, 0, 8)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the year turns and the cough is memory — but scars remain in three provinces. The chronicles will not call it triumph. They will call it survival with a bill. The Scarred King. Honest. Unpopular. Like most truths worth keeping.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the legacy", response = "Survival is its own hymn. The dead may disagree.", statDeltas = fixed_array(0, 0, 3, 0, 0, 3, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, I have served three kings and buried two. The year ends and the pyres still warm. When the realm names your reign, they will not begin with the coup — they will begin with the cough. They already call you King of Ash. I will not soften it.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the legacy", response = "Then outlive the name. Names are lighter than coffins, but they last longer.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the year closes and heaven still owns the story. The people call you the king the saints saved. The soldiers call you the priest's puppet. The nobles call you useful. The See will write *the king blessed by the church*. Mira will not. History rarely pleases everyone.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard heaven's ledger", response = "Then kneel when I ask. Heaven owns part of your memory now.", statDeltas = fixed_array(0, 12, 0, 0, 0, 5, 0, 0, 12)),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the year ends and men still wake screaming in the night. The cough broke, but something else broke with it. The chronicles will not speak of willow bark — they will speak of the cheaper brew and the king who chose haste. The Mad King's Physic. I still tend the wards. I still remember.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I have heard the legacy", response = "Too late for some. Not too late for the next ward. I will stay — not for you, for them.", statDeltas = fixed_array(0, 0, 0, -10, 8, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Use Odo's compound in two test wards", response = "Fast and dangerous. If the men scream, remember you chose discount over caution.", statDeltas = fixed_array(0, 0, 0, 5, 5, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Stick with Mira's formula", response = "Wise. Boring. Expensive. The qualities of a king who may survive the year.", statDeltas = fixed_array(0, 0, 0, 0, 3, 2, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fund both", response = "Science by rivalry. I like it. Mira will not. The sick may benefit — or pay.", statDeltas = fixed_array(0, 0, 0, -10, 6, 0, 0, 0, 0)),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)


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
                    prompt = "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. I heard you kept Gromm, and Varn reforged the guard. Yet warrants signed in a dead king's name still leave this room. Which lie do you end first: the seal, the clerk, or the silence?",
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
                    prompt = "Your Majesty, I am Lissa. I change the sheets and pretend not to count the stains. On the night of the coup, three bedchambers had candles burning after midnight. Servants know who slept where — and who did not sleep at all. You can hang gossip, pay for it, or learn from it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hear her privately", response = "Then I speak softly and charge dearly. Truth is employment, not loyalty.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Silence her", response = "Then whispers go underground. Underground whispers grow mold. You chose silence.", statDeltas = fixed_array(0, 0, 3, 0, -3, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pay for her silence", response = "Gold buys lips closed. It does not buy hearts open. I will take the coin anyway.", statDeltas = fixed_array(0, 0, 0, -10, 0, 3, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, they call me Duke the Goose — the court's licensed fool. The court wants laughter before the granaries empty. I can mock the court, mock you, or keep quiet and let the tension rot. Malrik hates my beak. The barracks love it. Choose my target.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Mock the court", response = "Then nobles blush and commons cheer. Dangerous comedy. Delicious comedy.", statDeltas = fixed_array(0, 0, 4, 0, 0, 8, -6, 0, 0)),
                        DialogueChoice(choiceText = "Mock me — I can take it", response = "Bold. The court relaxes because you do not flinch. Some may forget to fear you.", statDeltas = fixed_array(0, 0, 0, 0, 5, 5, 0, 0, -4)),
                        DialogueChoice(choiceText = "Silence the fool", response = "Then the hall learns to whisper instead of laugh. Whispers are less funny and more pointed.", statDeltas = fixed_array(0, 4, 0, 0, 0, -5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the kitchen hears oaths the chapel never does. The staff whisper about Lissa's stories and the fool's jokes, and they ask one thing: will the new king feed the people who cook for him? Feed the staff first, audit the kitchens, or pretend kitchens are not politics.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Staff rations first", response = "Then pots bless your name before heralds do. Expensive — but the stairs warm.", statDeltas = fixed_array(0, 0, 0, 0, 4, 10, 0, -6, 0)),
                        DialogueChoice(choiceText = "Audit the kitchens", response = "Then spoons hide and whispers sharpen. Order without love. Familiar palace music.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, 0, 3, 0)),
                        DialogueChoice(choiceText = "One pot for everyone", response = "Dangerous solidarity. I will not call it noble until it works.", statDeltas = fixed_array(4, 0, 0, 0, 0, 6, 0, -4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Lissa sells stories. I sell silence. My sword guards your door, not your reputation. Let me double my post and scare the gossips, let the stairs talk freely and prove you can survive it — or trust neither of us.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Trust Raena", response = "Then Lissa learns fear. I learn overtime. The door stays yours.", statDeltas = fixed_array(-4, 0, 5, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Trust the stairs", response = "Then I hear everything and repeat nothing — unless you ask. Harder job. Better court.", statDeltas = fixed_array(0, 0, 0, 0, 3, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Trust neither", response = "Then both of us will resent you equally. Suspicion loves company. So does Knox.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, someone still lights candles in Edwin's bedchamber — not from faith, from habit. Seal the room and the ghosts stay. Use it yourself and the nobles call it an insult. Give it to the loyal staff and the poets will weep. The stairs are watching what kind of king you are at night.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Seal the chamber", response = "Then poets mourn and servants breathe easier. Both matter — on different floors.", statDeltas = fixed_array(0, 5, 0, 0, 3, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Use the chamber openly", response = "A bold insult to his memory. Some will call it strength, others sacrilege — it depends who lost family.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -8, 0, 8)),
                        DialogueChoice(choiceText = "Gift chamber to loyal staff", response = "Gromm will weep or curse — I cannot tell which. You bought warmth with a symbol.", statDeltas = fixed_array(0, 0, 0, 0, 0, 12, -4, -3, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the square wants bread, but it will take a joke first. I can roast the crown in front of the hungry crowd, or roast Malrik and see if the Church can laugh. A public roast builds trust — or a mob. Choose the victim, or cancel the show.",
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
                    prompt = "Your Majesty, I bought a maid's memory and a pot-boy's schedule. Lissa's story about the coup night is already written in three ledgers — Salt's, mine, and soon Ashford's. Purge the servants who sell, outbid the buyers, or let the story leak and watch who still wants Edwin's chair.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Purge sellers", response = "Then the stairs freeze. Fear works. Loyalty pretends to work. Both invoice you.", statDeltas = fixed_array(-8, 0, 6, 0, 0, -12, 0, 0, 0)),
                        DialogueChoice(choiceText = "Outbid Knox", response = "Then you rent silence weekly. I appreciate repeat customers.", statDeltas = fixed_array(0, 0, 0, -15, 0, 8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let coup story leak", response = "Then the court controls nothing — but you learn who moves. A dangerous lesson.", statDeltas = fixed_array(4, 0, 0, 0, 0, -4, 0, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, forty days since Lissa counted coup-night candles — and the stairs speak your name without spitting. I heard kitchens fed, doors guarded, jokes aimed at court not crown, Knox outbid. Loyal staff. Rare beneath a usurper. Guard it before Ashford measures the upper halls.",
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
                    prompt = "Your Majesty, I am Ruta from the western mills. The granaries cough dust where they once held grain. Malrik's church collectors reach the villages before your tax men do. I did not ride here for poetry. Hungry millers remember who took the harvest — and they do not always blame the weather.",
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
                    prompt = "Your Majesty, the court expects roast meat on holy days, and every day is holy when lords are nervous. Ruta says the western mills send dust instead of flour. My ovens can bake for the city or keep the court's table full — not both. Which do I fire?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Bake bread for the city", response = "Then the commons smell bread from the palace and believe you. The treasury smells smoke and weeps.", statDeltas = fixed_array(4, 0, 0, -8, 0, 8, 0, -6, 0)),
                        DialogueChoice(choiceText = "Keep the court's table full", response = "Hypocrisy with spices. The servants talk. They always talk.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 4, -5, 0)),
                        DialogueChoice(choiceText = "Fast with the city", response = "Thin soup for thin times. Malrik will call it piety. I call it politics that fills bellies a little.", statDeltas = fixed_array(2, 5, 0, 0, 0, 4, -3, 4, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my soup line wraps around the lower ward and grows longer each dawn. Malrik offers to feed them — if they kneel first. The poor do not care which sermon wins. They care which pot boils. Fund my line, let the bishop feed them, or close the lines before they become a crowd.",
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
                    prompt = "Your Majesty, I speak for nine villages that still call you the usurper — and still ask you for bread. Ruta told you about the mills, Arvel about the soup. We do not want your soul. We want the right to keep our own grain. Grant the villages grain charters, or send soldiers to guard empty bins.",
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
                    prompt = "Your Majesty, the mountain eats men and spits out ore. My miners eat pebbles while the forges pay your army. Pay us in bread instead of coin, crush the strike, or let Fara's guild set the price — but decide before the forges go cold.",
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
                    prompt = "Your Majesty, I speak for the grain guild — not the Church, not the army, not the romantic millers. Caravans will move if the crown guarantees prices. They will stop if you seize wagons. Hunger is a market, and I know its prices better than anyone.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Crown-guild compact", response = "Then the realm eats steadily and I grow rich steadily. Fair, if you control the word *fair*.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 12, 0)),
                        DialogueChoice(choiceText = "Seize guild granaries", response = "Then the guild calls you a tyrant, and the people call you their feeder — for a while.", statDeltas = fixed_array(0, 0, 0, 10, 0, -12, 0, 15, 0)),
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
                    prompt = "Your Majesty, I sing for coins and causes. My new song is about you, and I have two endings: the generous king or the hungry one. Pay for the kind ending, ban hunger songs, or let me sing what the city sees.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Sponsor the generous ballad", response = "Flattering lyrics. Expensive chorus. The commons hum your name until the next hunger.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 3, 0)),
                        DialogueChoice(choiceText = "Ban hunger ballads", response = "Banned songs sing loudest. I will whisper where you cannot hang.", statDeltas = fixed_array(0, 0, 3, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let her sing what she sees", response = "Brave or stupid. The crowd will decide. I will still eat.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -4, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, my caravans still move — when paid triple. Loyalists hoard grain in Edwin's name, peasants hide it in God's. I can carry grain under crown escort, sell it to you at my premium, or let the hoarders choke on their own stores.",
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
                    prompt = "Your Majesty, I am back from the mills — and from the ford, where northern refugees camp beside our own hungry. The people now have a voice in your court. Do you feed your own first, share the ration with the ford, or let the Church feed the strangers?",
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
                    prompt = "Your Majesty, ninety-nine days since your blade, and the city still asks whether the new king lets them starve on purpose. My kitchens can stretch one more month. Cut the court's portions, double them to keep the lords happy, or send the palace stores to the provinces.",
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
                    prompt = "Your Majesty, the army must eat before it can love you. I can take grain from the villages that still have it — legal theft with banners — put the men on half rations, or buy grain at market prices that will make Borvin weep.",
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
                        DialogueChoice(choiceText = "I have heard the provinces", response = "Then I write *bread* before *blade*. Rare for a usurper. Do not waste it.", statDeltas = fixed_array(10, 0, 0, 0, 0, 8, 0, 8, 0)),
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
                    prompt = "Your Majesty, the grain guild remembers every promise and every broken one. Crown credit is frozen until the crown proves it can pay more than sermons. Reopen trade on guild terms, or watch the caravans go around your capital.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept guild terms", response = "Then my ledgers own your mornings until you pay. The treasury breathes — on my schedule.", statDeltas = fixed_array(0, 0, 0, 20, 0, -4, 0, 0, -8)),
                        DialogueChoice(choiceText = "Reject", response = "Paper is not coin. You will learn that at your own expense.", statDeltas = fixed_array(0, 0, 0, 8, 0, -6, -5, 0, 0)),
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
                    prompt = "Your Majesty, the men who paid for your coup want their money back — with interest. Fara has frozen your credit, so my house holds the shorter leash. Pay Salt in full, ask for new terms, or refuse and learn who takes your property faster.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay Salt in full", response = "Then my quill clears your name — temporarily. The guild will hate your priority. The army will love it.", statDeltas = fixed_array(0, 0, 5, -25, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ask Salt for new terms", response = "Time is coin. I sell both. You will buy again.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, -6)),
                        DialogueChoice(choiceText = "Refuse to pay the coup debt", response = "Then I sell your defaults to whoever hates you most. Ingvar reads ledgers too.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, -10)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, false crowns are spreading — struck with King Edwin's face and spent in your markets. My mint can hunt the false coin, or the treasury can pretend it does not exist. False coin is a tax on kings who cannot count.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund a mint purge", response = "Expensive honesty. Markets stall, then trust returns — if you finish.", statDeltas = fixed_array(0, 0, 0, -18, 0, 8, 0, 0, 6)),
                        DialogueChoice(choiceText = "Ignore the false coin", response = "Then prices lie and taxes lie with them. Borvin will scream. Thieves will cheer.", statDeltas = fixed_array(0, 0, 0, 10, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Blame Nerius", response = "A convenient scapegoat. The false coin keeps flowing — just without a neck to blame.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 4)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik's church tax, Salt's interest, and Fara's fees all eat from the same chest — and Rudolf still wants rations. This month one creditor goes hungry: the merchants, the Church, or the army.",
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
                    prompt = "Your Majesty, Fara froze crown credit and Salt called in your notes — I heard both before my caravans left the yard. I move grain and gold, not loyalty. Give me crown escorts and a premium, or I sell your shortages to your enemies.",
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
                    prompt = "Your Majesty, in six days Lady Ashford comes to see whether you are a ruler or a debtor in ermine. Great houses lend to kings who can pay, not to kings who owe merchants more than bishops. How do we meet her?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Show her real money", response = "Theatre with receipts. Expensive. Ashford respects expensive truths.", statDeltas = fixed_array(0, 0, 0, -15, 0, 4, 5, 0, 0)),
                        DialogueChoice(choiceText = "Bluff with borrowed silver", response = "Confidence with varnish. Ashford peels paint for sport.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -3, 0, 6)),
                        DialogueChoice(choiceText = "Seize a guild warehouse first", response = "Bold piracy. Fara will scream. Ashford may applaud — if you win.", statDeltas = fixed_array(0, 0, 5, 15, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
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
                    prompt = "Your Majesty, Ashford offers you lawful rule at a price. I offer money in the treasury at a sharper one. Sign the Guild Compact — tariffs fixed by the guilds, private credit open, church tax capped by merchants instead of Malrik — or we call in your notes before sunset.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Sign the compact", response = "Then we are partners until you try to break us. Read the ink twice.", statDeltas = fixed_array(0, -8, 0, 15, 0, 0, -6, 0, -5)),
                        DialogueChoice(choiceText = "Refuse", response = "Then Salt finishes this conversation. I have done my courtesy.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Counter", response = "Half a compact. Half a war. Salt will price the difference.", statDeltas = fixed_array(0, 5, 0, -8, 0, 0, 0, 0, 4)),
                        DialogueChoice(choiceText = "Pay the notes in full", response = "Then you are poor and alive. A respectable combination.", statDeltas = fixed_array(0, 0, 0, -40, 0, 6, 0, 0, 5)),
                        DialogueChoice(choiceText = "Offer the Ashford dowry as collateral", response = "Then you mortgage bloodlines for coin. Ashford will notice. So will history.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
                    )
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
                    prompt = "Your Majesty, false coin reached the army's pay chest — or would have, if Rudolf were less suspicious. My mint asks for the power to seize every bad coin in the capital. Grant it and trust returns slowly. Deny it and trust never comes back.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Grant seizure", response = "Then coin is honest at the cost of riots. Honesty is not free.", statDeltas = fixed_array(0, 0, 6, -10, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let the guild do the seizing", response = "Shared blame. Shared credit. Fara owns the muscle. You own the headline.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, -4, 0, 0)),
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
                    prompt = "Your Majesty, the deadline has come. Salt's agents camp at the lower gate, Fara's clerks count your cellars, and Rudolf asks for war coin we do not have. Pay one final large sum, admit we cannot pay, or sell Edwin's crown jewels to merchants who will put them in shop windows.",
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
                    prompt = "Your Majesty, I sold a copy of Borvin's true ledger — not the court version — to whoever paid the most this week. Fara, Salt, Ingvar, and Ashford each hold pages you wanted private. I can sell them back, help you feed them false numbers, or simply vanish.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Buy the ledger back", response = "Then you rent silence. I will sell again if the price improves.", statDeltas = fixed_array(0, 0, 0, -18, 0, 6, 0, 0, 4)),
                        DialogueChoice(choiceText = "Feed the buyers false numbers", response = "Clever until two liars compare notes. Still — buy time.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
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
                    prompt = "Your Majesty, I am writing the chapter about your treasury — not who bowed, but who owns your mornings. Salt's interest, Fara's compact, the false coin, Knox's stolen numbers: it is all in my notes. How should it read?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "*The King Who Pays*", response = "Flattering if true. Dangerous if not. I will verify before I print.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 4, 0, 0)),
                        DialogueChoice(choiceText = "*The Debt Crown* — tell the truth", response = "Honest prose. Creditors hate it. Commons love it. You chose truth over tone.", statDeltas = fixed_array(0, 0, 0, 5, 0, 8, -8, 0, 0)),
                        DialogueChoice(choiceText = "Pay to soften the chapter", response = "Expensive fiction. Knox sells the footnotes anyway.", statDeltas = fixed_array(0, 0, 0, -12, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, ninety-four days since Fara froze your credit — and the counting houses speak your name without spitting. I heard Salt paid, false coin purged, Borvin's ledgers matched. You bought time with gold. The oldest miracle. The crown owns its coffers again — for now.",
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
                    prompt = "Your Majesty, blessing is not a gift — it is a leash. I can preach you king and make the mob kneel. I can preach you a usurper and make them sharpen knives. Or I can preach silence — and let every lord decide whether you rule tomorrow. I heard you chose your tone on the threshold. Now choose what the Church buys with it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Church custody of your rule", response = "Then kneel in the square when I bid it. The usurper becomes an anointed king — or a lesson.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Refuse — the crown recognizes itself", response = "Then prepare for a sermon that names you a king-killer. I heard defiance. The faithful heard a challenge.", statDeltas = fixed_array(0, -10, 5, 0, 0, -6, 0, 0, 0)),
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
                        DialogueChoice(choiceText = "Side with Arvel's poor monks", response = "Then you align yourself with Arvel's muttering monks and against my choir. Dangerous. Popular, perhaps, among the hungry.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0), nextNodeIdx = 1),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(
                    prompt = "Your Majesty, a blessing is not a gift — it is a leash. I can preach you king and make the crowd kneel. I can preach you usurper and make them sharpen knives. Or I can preach silence and let every lord decide for himself whether you rule tomorrow. You have chosen your tone. Now choose what the Church gets for it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Church custody of your rule", response = "Then kneel in the square when I ask. The crown will be blessed — and watched.", statDeltas = fixed_array(0, 12, -3, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Refuse — the crown recognizes itself", response = "Then prepare for a sermon that calls you a king-killer. The faithful heard a challenge.", statDeltas = fixed_array(0, -10, 5, 0, 0, -6, 0, 0, 0)),
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
                    prompt = "Your Majesty, Malrik judges you in the square. I judge you in God's ledger. Rumor says Edwin's old confessor, Brother Aldo, still hides in Arvel's cloister. My commission is inquiry, not sermon. Give me names, give me Aldo, or test my patience.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Cooperate", response = "Useful. Malrik will call it crown justice. Arvel will call it cowardice. Both may be right.", statDeltas = fixed_array(0, 8, 0, 0, 0, -6, 0, 0, 6)),
                        DialogueChoice(choiceText = "Refuse inquiry", response = "Then I write *obstruction* next to your name and sleep well. You may not.", statDeltas = fixed_array(0, -12, 5, 0, 0, 4, 0, 0, 0)),
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
                    prompt = "Your Majesty, this week more coin went to Malrik's church tax than to the crown. The faithful pay God first now. If I cut the church's share, he calls it an insult to heaven. If I pay soldiers instead, the altar calls it theft. Which purse goes hungry — yours or heaven's?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Cap the church tax", response = "The altar will hiss. The treasury will breathe. Malrik will call it persecution by sunset.", statDeltas = fixed_array(0, -18, 0, 15, 0, -5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Pay the church tax from the treasury", response = "Expensive holiness. Soldiers will ask why God eats before they do.", statDeltas = fixed_array(0, 10, -6, -20, 0, 0, 0, 0, 0)),
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
                    prompt = "Your Majesty, I have served three kings and buried two. Malrik does not need a blade to end you. He has a ledger, a pulpit, and one word: *forfeit*. Next comes the interdict — no rites, no blessing, no guards who fear hell. Do you prepare laws that stand without him, set clear limits with him, or let him try?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Prepare secular law", response = "Bold. The faithful will call it heresy. The soldiers may call it clarity. Write it before Sunday.", statDeltas = fixed_array(0, -8, 6, 0, 0, 0, 0, 0, 5)),
                        DialogueChoice(choiceText = "Negotiate limits with Malrik", response = "A treaty with heaven's broker. It holds until the gold runs thin.", statDeltas = fixed_array(0, 5, 0, -6, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Let him try the interdict", response = "Then you bet steel against scripture. I have seen scripture win in the square and lose in the barracks.", statDeltas = fixed_array(0, -12, 10, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik's church tax buys grain at prices my caravans cannot match. The temples feed the hungry and preach about who saved them. Your crown feeds soldiers and preaches about who paid them. Which sermon fills a belly faster?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Outbid the Church for grain", response = "Grateful bellies are expensive. Worth it — until the next empty purse.", statDeltas = fixed_array(0, -6, 0, -18, 0, 8, 0, 12, 0)),
                        DialogueChoice(choiceText = "Seize the temple granaries", response = "Then expect *forfeit* by dawn. You will have bread and sermons about your black soul.", statDeltas = fixed_array(0, -20, 5, 0, 0, -5, 0, 15, 0)),
                        DialogueChoice(choiceText = "Let Selena trade with both", response = "I will sell you grain and sell Malrik your caution. Remember: I sell both ways.", statDeltas = fixed_array(0, 3, 0, -10, 0, 0, 0, 8, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Malrik has declared meat unclean this week — a penance, he says, for how you took the crown. My sisters still boil broth for the fever wards while the faithful fast in the square. The soldiers ask why God hates their supper. I ask why heaven starves the sick to feed a sermon.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Ignore the decree", response = "Then the faithful will call you a glutton and a sinner. The soldiers will call you king. My patients will call you sensible.", statDeltas = fixed_array(0, -15, 8, 0, 3, -4, 0, 5, 0)),
                        DialogueChoice(choiceText = "Keep the fast", response = "Humility in public, resentment in the wards. Malrik will call it conversion. I call it theatre that kills slowly.", statDeltas = fixed_array(0, 12, -6, 0, -5, 3, 0, 0, 0)),
                        DialogueChoice(choiceText = "Feed the barracks and wards in secret", response = "Hypocrisy feeds armies. An old recipe. Do not let Malrik smell the roast — or my soup.", statDeltas = fixed_array(0, -5, 10, -8, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three thousand pilgrims camp at the lower gate. Malrik swears he did not call them. They chant *forfeit* and *blessing*, whichever is louder that hour. My guards will not drive back a holy crowd without your word on blood.",
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
                    prompt = "Your Majesty, two companies crossed themselves instead of marching when I ordered them to clear the gate. Borvin says the church tax ate their pay. Malrik says heaven outranks you. Tell me: do I punish them, pay them, or let the Church feed their families and steal their oaths?",
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
                    prompt = "Your Majesty, I have suspended the sacraments in the capital — no baptisms, no last rites, no quiet conscience for your guards. I do not need a blade. Either you place the crown under God's ledger, or you rule a city that fears hell more than it fears you.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Kneel", response = "Then forfeit dies in the square and lives in the chapter house. You survive. You serve.", statDeltas = fixed_array(0, 20, -8, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Defy the interdict", response = "Then every pulpit will call you cursed. Steel must finish what it began.", statDeltas = fixed_array(0, -20, 12, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Raise Arvel's church against him", response = "Two churches, one bleeding city. You chose the fracture. May it not fracture you.", statDeltas = fixed_array(0, -5, 0, 0, 0, 10, 0, -10, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the conclave met without you — and heaven voted pragmatic. I heard you knelt, bargained, or bent before interdict became pyre. Forfeit dies in the square and lives in the chapter house. You leave with the Church's blessing. You leave leashed. The mob kneels. Rudolf grimaces. You breathe.",
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
                    prompt = "Your Majesty, in three days your priests will ask whether heaven blesses the killing of a king. I heard Rudolf reinforced the pass — or raided it. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal. God can wait. Politics cannot.",
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
                        DialogueChoice(choiceText = "Refuse", response = "Alone is how usurpers often end. You chose it with eyes open.", statDeltas = fixed_array(0, 0, 5, 0, 0, -4, 0, 0, 0)),
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
                        DialogueChoice(choiceText = "Pursue into the pass", response = "Victory wins songs. Defeat wins northern sermons about the price of a stolen crown.", statDeltas = fixed_array(0, 0, -8, -12, 0, 5, 0, 0, 0)),
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
                    prompt = "Your Majesty, two thousand northern refugees crowd the ford — famine in the princes' hills, or a leash to embarrass you. I heard you allied with us — or declared us enemies. The commons already watch whether the usurper feeds strangers while Edwin's widows beg. Malrik offers baptisms. I offer politics.",
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
                    prompt = "Your Majesty, northern buyers want crossbows. Rudolf wants them first. I sell to whoever pays and remembers. Make my bolts a crown monopoly, let the market decide, or sell only to the north and hope they point the other way.",
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
                    prompt = "Your Majesty, in three days the great houses stop watching from their estates and start measuring your throat. Ashford will ask whether you can win a war abroad and balance a ledger at home. Do you ask the houses for levies for the pass, or keep the north a crown matter they can ignore?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Summon noble levies", response = "Then they bleed with you — or plot while you bleed. Ashford will note who came.", statDeltas = fixed_array(0, 0, 12, 0, 0, 0, -8, 0, 5)),
                        DialogueChoice(choiceText = "Keep war a crown matter", response = "Privacy preserves options. It also preserves their knives until later.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, 5, 0, 0)),
                        DialogueChoice(choiceText = "Offer the houses a share of the northern trade", response = "Ledger diplomacy. Ashford respects ledgers. Whether she respects you remains her hobby.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 8, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, northern hosts gather beyond the pass — or so my scouts swear. Ingvar says it is training. I say it is a clock. Mobilize fully and empty the treasury, put on a parade and hope they believe it, or strike first and dare the north to answer.",
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
                    prompt = "Your Majesty, I will not pretend: my princes have already priced several of your advisors. I am not here to confess — I am here to bid. Match northern gold, expose the buyers, or make a quiet deal with me and let the market decide who owns your tomorrow.",
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
                    prompt = "Your Majesty, palace guards sold patrol maps to northern buyers — Ingvar's gold landed in very familiar pockets. Loyalty is arithmetic, and your guards can count. Purge the guard, double their pay and investigate, or feed Ingvar false maps and hope he buys them.",
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
                    prompt = "Your Majesty, three hundred and fifty days since a blade gave you a crown the north did not grant. I heard tribute refused, charter signed, refugees housed, maps guarded. The princes end the year calling you ally — not friend, not vassal, but the usurper worth binding. Your heirs and ours will argue together. Better than arguing alone.",
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
                    prompt = "Your Majesty, Lady Ashford rides from the eastern marches in seventeen days. I ride from the east beside her — not beneath her. You took this throne without our swords. Fair. We did not kneel either. Will you seat one eastern house and call it peace, or two and call it balance?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Promise Kaspar equal standing with Ashford", response = "Then I will remember you when she tries to own your council. Eastern levies may follow — if coin follows first.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 4)),
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
                    prompt = "Your Majesty, Dell has offered you marriage and arithmetic. I offer better arithmetic: twice the dowry, half the sermons, and no Ashford in your council. Marry into Crow and the southern roads pay for your throne. Marry Dell and you marry her debts.",
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
                    prompt = "Your Majesty, Ashford, Kaspar, Dell, and Crow measure your throat in velvet. I measure it in men who own nothing but hunger. Give the landless titles from Edwin's seized estates, or we will take the fields while the lords argue about dowries.",
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
                    prompt = "Your Majesty, in three days Lady Ashford enters your hall and the nobles will finally be counted. Kaspar watches the east, Dell and Crow bid for your hand, and Raymond gathers men with nothing to lose. You can arrive friendly, divided, or armed. You cannot arrive surprised.",
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
                    prompt = "Your Majesty, Countess Dell's dowry receipts are forged — or Ashford forged them to look like mine. I accuse Dell before she accuses me. Will you judge, side with her, or put it off and let us settle it ourselves?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Side with Kaspar", response = "Then Dell screams theft. Crow will whisper alliance. Ashford will call it weak kingship. Enjoy the noise.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, -6, 0, 8)),
                        DialogueChoice(choiceText = "Side with Dell", response = "Then I leave your hall tonight. Exile is a kind of death — but I may come back with friends.", statDeltas = fixed_array(0, 0, -4, 0, 0, 4, -8, 0, 0)),
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
                    prompt = "Your Majesty, I am Duke the Goose — by baptism, by theatre, and by a family tree my lawyer swears is older than yours. The great houses measure your throat. I measure your sense of humor. Support my claim and the people will love you. Arrest me and they will love me from a distance.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Patronize the claim", response = "Honk and politics. Ashford will gag. The people will cheer. I accept your danger.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -12, 0, -5)),
                        DialogueChoice(choiceText = "Arrest the fool", response = "Then the cells learn comedy. My supporters learn knives. Choose which worries you more.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Settle it by tournament", response = "Steel versus poultry. I accept. Bring your best knight — or your worst, for the story.", statDeltas = fixed_array(0, 0, 4, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, your council is a cage of eastern tigers — with one goose outside the bars. I will not share a table with Kaspar unless you mean to split the east. Choose who sits, who stands, and who leaves in chains.",
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
                    prompt = "Your Majesty, Baroness Crow told the whole hall that my dowry is pig iron and my cousins are pig farmers — and nobody stopped her. I demand satisfaction: a public apology, or a duel by champions before the realm chooses a side.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Force Crow to apologize", response = "Then Crow is enemy. Dell is not friend. You have two fewer allies and one fewer problem — for a week.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -8, 0, 0)),
                        DialogueChoice(choiceText = "Make both ladies share one contract", response = "One contract, two signatures, two grudges. Quiet — and someone paid for it.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 4, 0, 6)),
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
                    prompt = "Your Majesty, three hundred men without fields camp on the eastern border. The great houses feud while the commons starve. I march tomorrow unless you give us titles now, send Ashford's knights to stop me, or let the houses deal with me themselves.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Strip a minor lord and give Raymond his title", response = "Then nobility screams. Raymond kneels — today. You have bought a dangerous friend.", statDeltas = fixed_array(0, 0, 8, 0, 0, 10, -15, 0, 0)),
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
                    prompt = "Your Majesty, northern smoke still rises. Ashford refuses to send levies unless she leads them. I refuse unless I am not her subordinate. Dell and Crow want a marriage signed first. Choose whose levy you take — and whose pride you pay for.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Levy Ashford first", response = "Then she marches with hatred and banners. Useful — if she returns.", statDeltas = fixed_array(0, 0, 10, -8, 0, 0, -8, 0, 0)),
                        DialogueChoice(choiceText = "Levy Kaspar", response = "Then east splits openly. War may come from your own marches.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
                        DialogueChoice(choiceText = "Hire mercenaries instead", response = "Then houses call you bankrupt and correct. Kara will love you. Rudolf will not.", statDeltas = fixed_array(0, 0, 6, -15, 0, 0, -5, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, knives move tonight — Kaspar's against Dell, Crow's against Ashford, Ashford's against Raymond. I can sell you the map, stop one blade, or let the night sort the peerage. Who dies in the dark is your choice if you act — and theirs if you sleep.",
                    choiceCount = 5,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Stop the attack on Ashford", response = "Then Ashford wakes up alive and owes you. Someone smaller bleeds instead.", statDeltas = fixed_array(0, 0, 0, -8, 0, -4, 8, 0, 0)),
                        DialogueChoice(choiceText = "Allow Ashford's death", response = "Then the east belongs to whoever survives dawn. You chose speed over mercy.", statDeltas = fixed_array(0, 0, -8, 0, 0, 0, -15, 0, 12)),
                        DialogueChoice(choiceText = "Stop Dell-Crow blood", response = "Peace in the south. Dell and Crow both wake up — and neither knows who saved her.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 4, 0, 0)),
                        DialogueChoice(choiceText = "Let the knives fall", response = "Then by morning Dell and Crow are both dead, and the hall has two empty chairs.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 10)),
                        DialogueChoice(choiceText = "Pay Knox to remove Kaspar", response = "Clean. Criminal. Yours. Kaspar will not see the east again.", statDeltas = fixed_array(0, 0, 0, -12, 0, -8, 0, 0, 8)),
                    )
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
                    prompt = "Your Majesty, I am writing the first draft of your dealings with the great houses while the blood is still drying. What should the title be?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "*Reconciliation*", response = "Flattering. Fragile. I will write what you need — not what you earned.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 6, 0, 0)),
                        DialogueChoice(choiceText = "*Terror*", response = "Honest. Cruel. Future lords will read it before they plot.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -6, 0, 6)),
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
                    prompt = "Your Majesty, I am Morwen — the woman who turns policy into rope. Edwin's cells still hold men who swore to his ghost, and the lower dungeon is overflowing. Hang the ringleaders, sell pardons for coin, or empty the cells and dare the realm to test you.",
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
                    prompt = "Your Majesty, Malrik sends names — heretics, street preachers, men who call your crown forfeit in rhyme. Heaven wants heretics. The crown wants traitors. My scaffold fits both if you widen it. Hang the Church's list, hang only your own traitors, or turn the sentences into fines.",
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
                    prompt = "Your Majesty, Yarek's miners and Ruta's millers broke into a granary with tools that were not meant for milling. Hungry people do not read laws — they read empty bowls. Hang the rioters, hang only the officer who fired first and pardon the rest, or pardon them all.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Mass hanging", response = "Then the provinces learn fear. They may not learn loyalty. Both keep thrones — briefly.", statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, -3, 0)),
                        DialogueChoice(choiceText = "Hang the officer, pardon the miners", response = "Surgical rope. The commons may call it justice. Officers call it betrayal. Both can be true.", statDeltas = fixed_array(4, 0, -4, 0, 0, 5, 0, 0, 0)),
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
                    prompt = "Your Majesty, the fever wards sent me three men who woke up screaming and never stopped. Madness is not treason — but treason is easier to explain to a crowd. Hang the mad to quiet the square, fund Mira's care, or hide them in my quiet cells.",
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
                    prompt = "Your Majesty, the great houses already send lists — names they want gone before they bow. Ashford arrives soon. Refuse every noble list until she comes, hang two commoners as a warning to the peers, or sell quick trials to the highest bidder.",
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
                    prompt = "Your Majesty, Lady Ashford will measure your scaffold the way a tailor measures a spine. Hang the last captain of Edwin's guard to impress her, empty the yard to disarm her, or let her name the first prisoner and see whether you obey.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Hang Edwin's last captain", response = "Then eastern eyes see rope. Western ghosts see warning. Both look at you.", statDeltas = fixed_array(0, 0, 6, 0, 0, -8, 4, 0, 0)),
                        DialogueChoice(choiceText = "Empty the yard", response = "Bold mercy before the nobles arrive. She will call it buying consciences.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, 5)),
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
                    prompt = "Your Majesty, I am Talen. I fix problems the scaffold cannot price. For a chest of silver I can lose a noble's name before dawn. For a little more I can run your whole justice for you — quietly, and at a profit. What will you buy?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Pay Talen for one name", response = "Then one throat breathes who should not. You will forget which. I will not.", statDeltas = fixed_array(0, 0, 0, -18, 0, -8, 6, 0, 0)),
                        DialogueChoice(choiceText = "Refuse and expose him", response = "Then I vanish before Morwen wakes. You gain sermon fodder and lose convenience.", statDeltas = fixed_array(0, 0, 3, 0, 0, 8, -4, 0, 0)),
                        DialogueChoice(choiceText = "Hire Talen to run justice", response = "Justice with a price list. Morwen will hate me. You will love how quiet the lists become.", statDeltas = fixed_array(0, 0, 0, -25, 0, -12, 0, 0, -8)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the cells are full again — rioters, heretics, madmen, names Talen lost, names lords paid for. Declare a mass pardon and empty my yard, a mass hanging to teach the realm silence, or keep judging case by case.",
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Meribald — I read what heaven writes in numbers, not in rhymes. A comet crossed Edwin's constellation on the very night you took his chair. Anyone who looks up can see it. You can proclaim the comet as your sign, hear me in private, or hand me to the Inquisitor.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Proclaim the comet as my sign", response = "Then nobles look up before they look at you. Dangerous — if heaven changes its mind.", statDeltas = fixed_array(0, -10, 0, 0, 0, 0, 8, 0, 6)),
                        DialogueChoice(choiceText = "Hear him in private", response = "Prudent. Boring. The mob will still look up without your permission.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hand him to Inquisitor Cyrus", response = "Inquisitors love comets — briefly. You will not hear my tower again until you do.", statDeltas = fixed_array(0, 12, 0, 0, 0, -6, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, Lady Ashford was born under the eastern quarter — ambitious, brittle, fond of nephews and rope. My chart says she will judge your reign the day she arrives. Publish her omen and she will hate you. Share it with her alone and she will owe you. Burn it and she will bring her own omens — and soldiers.",
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, the market square fills for two sermons: my eclipse math and the Nameless Prophet's winter rhymes. The crowd wants one truth. Heaven offers two. Make astronomy a crown office, license both of us, or let the crowd choose.",
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
                    prompt = "Your Majesty, Meribald counts lights while I count breaths. The crowd asks which king winter serves. I say: the one who feeds lungs and ears. He says: the one who reads charts. Back me, back him, or silence us both and let faith fight faith without your badge.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Back the Prophet", response = "Then Meribald's tower darkens. Malrik roars. The poor hum your name. Dangerous music.", statDeltas = fixed_array(12, -12, 0, 0, 0, 6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Back Meribald", response = "Then my market shrinks. His tower brightens. Nobles smile. Peasants calculate.", statDeltas = fixed_array(-8, 4, 0, 0, 0, 0, 8, 0, 0)),
                        DialogueChoice(choiceText = "Silence both of them", response = "Steel ends sermons until it becomes the next sermon. We will both remember.", statDeltas = fixed_array(-6, 0, 8, 0, 0, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the house of succession flickers in my charts: Edwin's line, your line, no line. The stars show a child-shaped gap before winter's end. Publish it and rivals will move. Hide it and rivals will guess. Forge a better omen and rivals will laugh — until they stop.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Publish the gap", response = "Honest terror. Honest policy. Ingvar will read it before Malrik does.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 4, 0, -10)),
                        DialogueChoice(choiceText = "Suppress the chart", response = "Then Knox sells forged charts by Friday. You chose mystery. Mystery is expensive.", statDeltas = fixed_array(0, 0, 0, -8, 0, -6, 0, 0, 0)),
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
            characterIdx = CHAR_WIZARD,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, Knox sold your birth hour to Ingvar, Ashford, and a prophet who pretends not to buy. The stars line up for a leak — not of water, but of secrets. Publish who bought it, buy my silence, or hang Knox.",
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
            characterIdx = CHAR_WIZARD,
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
                    prompt = "Your Majesty, I have no name, because names are for men who die once. I have a winter: three frosts, three kings, one throne. The market wants a sign, and Malrik still has not decided whether heaven knows your face. Will you hear me, give me to the Church, or ignore me?",
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
                    prompt = "Your Majesty, the wards cough and the bells toll. I preach what the fever teaches: the throne is a lung, and the king is whoever stops breathing last. Let me preach in the wards, ban street sermons while the sickness lasts, or make me speak for the crown.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Let him preach in the wards", response = "Then the sick hear two cures. One may save you. One may save me. Neither is guaranteed.", statDeltas = fixed_array(0, -10, 0, 0, 5, 10, 0, 0, 0)),
                        DialogueChoice(choiceText = "Ban street sermons during the plague", response = "Bans feed martyrs. The cough does not read decrees. Remember I warned you.", statDeltas = fixed_array(0, 6, 4, 0, 0, -8, 0, 0, 0)),
                        DialogueChoice(choiceText = "Make him preach for the crown", response = "Then I speak your winter with your accent. Useful. False. Popular enough.", statDeltas = fixed_array(0, 3, 0, -8, 0, 5, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, a fox came to the lower market on three legs and left on four. Yesterday a lame woman walked after touching its den. Malrik calls it mockery of God. The people call it hope with a tail. Crown the fox, burn its shrine, or look for the trickster behind it.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Embrace the fox cult", response = "Then your banners will carry whiskers. Malrik will try to excommunicate an animal. You will laugh — until the levies refuse to march.", statDeltas = fixed_array(0, -18, 0, 0, 0, 12, 0, -5, 0)),
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
                    prompt = "Your Majesty, the great houses have come to measure your throat, and I have an omen for them: a house that bows in public and plots in linen. Use my prophecy against a rival house, denounce prophecy in the hall, or seat me at Ashford's table and let me speak.",
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
                    prompt = "Your Majesty, loyalty is no longer a sermon — it is arithmetic. Ingvar's gold and Knox's nets are in every corridor. I prophesy the knife that buys you dawn and the kiss that sells your maps. Let me name the traitors in the square, arrest me, or hear the names in private.",
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
                        DialogueChoice(choiceText = "I have heard the last sign", response = "Then rule sermons and steel. Malrik will curse the whole year from the pulpit. The people will remember rhymes.", statDeltas = fixed_array(12, -20, 0, 0, 0, 15, 0, 0, -8)),
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
                    prompt = "Your Majesty, Ingvar is not my only buyer this month. A foreign house offers coin for your council roster — who sleeps at your door, who signs your decrees, who still whispers Edwin's name. Refuse and hunt the buyers, take their money and sell, or hire me only for yourself and pray I stay hungry.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Refuse and purge buyers", response = "Then I vanish before dusk — or sell to someone angrier. You chose steel over commerce.", statDeltas = fixed_array(0, 0, 8, -8, 0, -6, 0, 0, 0)),
                        DialogueChoice(choiceText = "Sell them the roster", response = "Then your court has a landlord overseas. Efficient. Treasonous. Often both.", statDeltas = fixed_array(0, 0, 0, 20, 0, -15, 0, 0, -10)),
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
                    prompt = "Your Majesty, soon the realm will measure your court's loyalty out loud. Knox has foreign buyers, the stairs leak, and northern maps have been sold twice. Paranoia keeps thrones; policy keeps realms. Choose a policy: purge the court, manage the spies like a treasury, or trust your people and dare the numbers.",
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
                    prompt = "Your Majesty, decrees are circulating in Edwin's hand — my hand — your hand — and the forged seal is exquisite. Check every seal, however slow and painful, use the false decrees to trap false buyers, or hang me and call the problem solved.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Authenticate all seals", response = "Then policy crawls and trust inches upward. Rare. Boring. Useful.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 6)),
                        DialogueChoice(choiceText = "Feed forged decrees to Knox's buyers", response = "Then liars eat liars. If they compare notes, you burn. Until then, you learn.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
                        DialogueChoice(choiceText = "Hang Osric", response = "Convenient. The forged seals continue — just without a neck to blame.", statDeltas = fixed_array(0, 0, 0, 0, 0, -12, 0, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, a masked man asks for an audience. He says names are contracts and he has not decided whom he serves. The court is buzzing. Receive him publicly, meet him in private, or refuse and let rumor call him nephew, ghost, or merchant prince.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Public audience", response = "Then rumor becomes a show. Shows are cheaper than truth and twice as loud.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 10)),
                        DialogueChoice(choiceText = "Private council", response = "Then you govern whispers. He will whisper back. Knox will try to listen.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, 8)),
                        DialogueChoice(choiceText = "Refuse audience", response = "Then he vanishes and ten masks appear. Mystery multiplies.", statDeltas = fixed_array(0, 0, 4, 0, 0, -4, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three men want my post — a mercenary, one of Edwin's veterans, and a foreign sword. The realm watches who you trust at your own door. Keep me, rotate the guard every night, or hire the foreigner and pay what he asks.",
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
                    prompt = "Your Majesty, I write the first draft of your reign while knives sell second drafts abroad. Buy my chronicle so only you read it first, let chapters leak and learn who reads them, or burn the drafts and rule without a chronicle — blind, but unquoted.",
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
                    prompt = "Your Majesty, the true ledgers walk out of the palace while the court ledgers lie. Knox sold pages, Ilana sold chapters, foreign houses bought both. Publish the true accounts, feed false numbers to the spies, or hang the clerks and pretend arithmetic is a crime.",
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
                    prompt = "Your Majesty, I am Talen — fixer, whisperer, the bill that arrives after the damage. Knox works for three crowns: yours, Ingvar's, and a masked third who pays in rumors about your heir. Expose Knox, join the auction for his loyalty, or hire me to lie to all three.",
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
                    prompt = "Your Majesty, the guard yard keeps lists of traitors — or loyalists, depending on who writes them. Purge the guard and teach fear, reform the oaths and teach patience, or ignore the yard and teach contempt. The realm will read your answer.",
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
                    prompt = "Your Majesty, sixty-seven days since Knox's foreign offer — and the court knows you by purge. I heard forgeries hunted, masks refused, guards replaced, ledgers scapegoated. Iron chancellor — fear keeps the council in line. Loyalty survives. Warmth does not.",
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
                    prompt = "Your Majesty, the masked man returned last night and spoke a name you hoped was fog: Edwin's nephew — exiled, hungry, and tired of your chair. He wants an answer. Deny the boy exists, send men to find him, or use the claim to frighten Ashford before she rides again.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Deny the nephew", response = "Then the fog thickens. Someone will believe anyway. Lies only need patience.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 6, 0, 8)),
                        DialogueChoice(choiceText = "Seek the nephew", response = "Then hunters multiply. Some sell directions. Others sell traps.", statDeltas = fixed_array(0, 0, 0, -10, 0, 6, 0, 0, -6)),
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
                    prompt = "Your Majesty, a marriage was arranged years ago to keep Edwin's nephew quiet — my family's insurance, not your romance. Now a mask speaks his name in your capital. Marry into my house and close the question, refuse, or let Ashford keep the boy in a comfortable cage. I do not share power with fog.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept Ashford marriage", response = "Then my house owns eastern peace and your succession story. You gain a leash. I gain a crown-adjacent future.", statDeltas = fixed_array(0, 0, 4, 0, 0, -8, 12, 0, 10)),
                        DialogueChoice(choiceText = "Refuse marriage", response = "Then we are rivals, not kin. I will remember who refused insurance.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, -10, 0, -5)),
                        DialogueChoice(choiceText = "Let Ashford keep the boy", response = "Shared custody of a kinglet. Humiliating. Efficient. Very eastern.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 6, 0, 6)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, three buyers want the boy's location: Ashford, Ingvar, and a masked fixer who pays in rumors. I sell to the highest bidder — unless you outbid everyone and buy the fog yourself.",
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
                    prompt = "Your Majesty, Ingvar's clerks offer coin for a boy matching the nephew's description — alive, dead, or convincingly dead. Refuse them, sell them the location, or stage his death with a body and a record, and sell the forgery twice.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Refuse", response = "Then Ingvar prices your stubbornness in steel. Domestic problems beat foreign crowns — usually.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, -4)),
                        DialogueChoice(choiceText = "Sell location north", response = "Then you rent peace with blood you may never see. Efficient. Monstrous. Familiar.", statDeltas = fixed_array(0, 0, 0, 15, 0, -12, 0, 0, -15)),
                        DialogueChoice(choiceText = "Stage his death", response = "Then three ledgers own a dead boy who may still breathe. I admire the accounting.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, -6, 0, 5)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the birth records disagree: the nephew was born in spring, in summer, or not at all. I can forge records proving he is a bastard, restore Edwin's original records, or burn the archive and let fog win.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Forge bastardy", response = "Then ink kills boys whom steel cannot find. Ashford will call it crude. It may work.", statDeltas = fixed_array(0, 4, 0, 0, 0, -8, 0, 0, 12)),
                        DialogueChoice(choiceText = "Restore Edwin's records", response = "Honest paperwork. Dangerous honesty. Now the boy's claim is real on paper.", statDeltas = fixed_array(0, 0, 0, 0, 0, 10, -6, 0, -10)),
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
                    prompt = "Your Majesty, I am writing two succession chapters — yours by blade, his by blood. Publish the nephew's chapter and split the realm, publish yours only and call him a myth, or publish both and let the realm choose its headache.",
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
                    prompt = "Your Majesty, the northern princes want Edwin's nephew — as hostage, heir, or saint. Deny them and fight in spring, hand the boy over for an alliance, or offer them your own succession charter and dare them to call it a lie.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Deny the north", response = "Then we price your denial in steel next spring. Consistent diplomacy.", statDeltas = fixed_array(0, 0, 8, 0, 0, 4, 0, 0, 6)),
                        DialogueChoice(choiceText = "Hand the nephew to the north", response = "Then you buy peace with Edwin's bloodline. Humiliating. Durable, sometimes.", statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, -12)),
                        DialogueChoice(choiceText = "Offer my own succession charter", response = "A bold claim against blood. I will carry it north. They will laugh — then calculate.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -8, 0, 15)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the masked man says the mask must come off, because stories must end or explode. He may be Edwin's nephew, Ashford's pawn, a merchant's son, or Knox in disguise. Demand the truth in public, accept a private answer, or refuse the unmasking and let the fog keep its face.",
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
                    prompt = "Your Majesty, ninety-four days since a masked man spoke the nephew's name. Hunters, forgers, and buyers have all had their turn. Whatever the boy is now — hostage, rumor, or a name on a grave — your line must stand on its own. Guard it. Fog has cousins.",
                    choiceCount = 1,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "I will guard it", response = "Then I close the nephew ledger — until someone opens it again.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 15)),
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
                    prompt = "Your Majesty, winter ends, and the true line sleeps in earth or in ink. My last omen is short: the chair eats names.",
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
                        DialogueChoice(choiceText = "Make do with what we have", response = "Patience is a virtue for the healthy. I will stretch what we have and pray it reaches the wards in time.", statDeltas = fixed_array(0, 0, 0, 0, 2, 0, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, you asked for two weeks. I gave them. Twenty-seven dead in the lower wards while your treasurer counted coins. I am back — not to plead, but to learn whether a usurper can afford to save the realm he took, or whether Estedor must burn twice.",
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
                        DialogueChoice(choiceText = "It will burn itself out", response = "Then write my report for the chronicles: the usurper watched Estedor cough itself hollow and called it patience.", statDeltas = fixed_array(0, 0, 0, 0, -20, -10, 0, 0, 0)),
                        DialogueChoice(),
                        DialogueChoice(),
                    )
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
                    prompt = "Your Majesty, the fever fades — but not before it carved a scar across three provinces. We saved many. We buried more. I will not lie and call it triumph. The realm will call you the Scarred King — or the usurper who did enough. Both are true. Neither is comfort.",
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
                    prompt = "Your Majesty, God cured the realm. The fever broke where holy water fell and prayer did not cease — so the faithful say, and they say it loudly. The people kneel, not to the blade that took the throne, but to the hand that held the chalice. The conclave will call you the Church's anointed king. Mira will call it theatre. The faithful will call it salvation.",
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
                    prompt = "Your Majesty, I warned you that Mira's eastern tincture was not the only brew — I never said mine was the safest. Every ward took my mask-and-vinegar compound. The cough broke faster than anyone dreamed, but men woke screaming and never slept again. The families knock with stones. The chronicles will call you the Mad King's Physic. I call you the king who chose haste.",
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
                    prompt = "Your Majesty, the lower wards want a statue — not of a saint, not of a soldier, but of the king who funded the bottles. Vulgar, flattering, and politically useful. Borvin says it costs gold. I say it buys something rarer: a usurper remembered for breath instead of blood.",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Fund the statue", response = "Then stand still long enough to be carved. Even usurpers may have one honest portrait.", statDeltas = fixed_array(5, 0, 0, -10, 0, 10, 0, 0, 0)),
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
                    prompt = "Your Majesty, the Holy See has written. They wish to declare the healing of Estedor a miracle and name you its instrument on earth. A crown taken by the sword, blessed by heaven's highest office. Mira calls it theft. The faithful call it destiny. What shall I answer?",
                    choiceCount = 3,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Accept the miracle", response = "Then kneel once more. The throne becomes altar. Your enemies lose their best argument.", statDeltas = fixed_array(0, 18, 0, 0, 0, 5, 0, 0, 10)),
                        DialogueChoice(choiceText = "Decline politely", response = "Proud. The See will not forget. Neither will the peasants who saw holy water work.", statDeltas = fixed_array(0, -8, 3, 0, 0, 5, 0, 0, 0)),
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
                    prompt = "Your Majesty, I feed the poor at my monastery gate. Lately they speak of Grey Lung more than bread. The fever faded, but the grief did not. They ask whether the usurper who paid for the bottles will fund a name for their dead — or whether survival is the only mercy they will ever see.",
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
                    prompt = "Your Majesty, the year closes and heaven still owns the story. The people call you the king the saints saved. The soldiers call you the priest's puppet. The nobles call you useful. The Holy See will write that the Church anointed you. Mira will not. History rarely pleases everyone.",
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
            characterIdx = CHAR_ODO,
            nodes = fixed_array(
                DialogueNode(
                    prompt = "Your Majesty, I am Odo, plague doctor. Mira's tincture is slow and dear. My compound — vinegar, mask-smoke, and a few things I will not name — breaks the cough in three days and costs a tenth as much. I will not lie: some patients see things afterwards. Most of them stop. Try it, or keep waiting for willow bark.",
                    choiceCount = 4,
                    choices = fixed_array(
                        DialogueChoice(choiceText = "Send Odo away", response = "Then wait for Mira's bottles. I will be in the lower city if your patience runs out before the sick do.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Try it in two test wards", response = "A cautious king. Two wards will tell us whether I am a genius or a poisoner.", statDeltas = fixed_array(0, 0, 0, -3, 5, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Use it in every ward — speed matters", response = "Fast and cheap. If the men scream, remember you chose haste over caution.", statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, 0, 0)),
                        DialogueChoice(choiceText = "Fund both brews side by side", response = "Science by rivalry. I like it. Mira will not. The sick may benefit — or pay.", statDeltas = fixed_array(0, 0, 0, -12, 6, 0, 0, 0, 0)),
                        DialogueChoice(),
                    )
                ),
                DialogueNode(),
                DialogueNode(),
                DialogueNode(),
            )
        )
)


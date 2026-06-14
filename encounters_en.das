require engine.core
require constants
require dialogue_types

module encounters_en public


let public allEncountersEnEarly : Encounter[POOL_EARLY_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The soldiers shed blood to put you on the throne. Now they are waiting for coins. If the treasury remains silent, the swords may also speak.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay the army in full.",
                response = "The soldiers will remember the generous king. At least until the next salary.",
                statDeltas = fixed_array(0, 0, 20, -25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Pay half and promise the rest later.",
                response = "Half a coin buys half peace of mind. But today that's enough.",
                statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Serving the king is already an honor.",
                response = "Honor does not ring in your wallet. I hope your walls are stronger than your generosity.",
                statDeltas = fixed_array(0, 0, -20, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How many soldiers actually took part in the coup?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Less than listed. The commanders attributed the dead, the lame and those who slept drunk that night.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay only honest people.",
                response = "Fair. But the deceived commanders will begin to grumble.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Pay everyone so as not to anger the army.",
                response = "Generous order. Even liars will praise you loudly.",
                statDeltas = fixed_array(0, 0, 18, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Freeze payments until verification.",
                response = "Checks feed paper, not soldiers. I warned you.",
                statDeltas = fixed_array(0, 0, -12, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or usurper.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ask the church for a blessing.",
                response = "Humility is a fitting beginning for one who reached the throne through blood.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand recognition of my authority.",
                response = "Orders reach soldiers. They rise to heaven far less well.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Offer the church an alliance.",
                response = "An alliance of throne and altar may save the realm. Or smother it.",
                statDeltas = fixed_array(0, 10, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Send grain to the monastery.",
                response = "Today faith will smell of bread.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Let the monastery feed them on its own.",
                response = "We will try. But an empty pot does not become holy through prayer.",
                statDeltas = fixed_array(0, -5, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Send guards to disperse the line.",
                response = "You can scatter the hungry. Hunger itself will stay.",
                statDeltas = fixed_array(0, -10, 8, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples collect tithe. The treasury collects taxes. Soon the people will see they pay twice.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Limit the church tithe.",
                response = "The treasury is grateful. The altar will hiss.",
                statDeltas = fixed_array(0, -20, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the tithe to the church.",
                response = "Priests love it when their gold is called faith.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Collect taxes together with the church.",
                response = "Two hands in one pocket. Convenient, yet dangerous.",
                statDeltas = fixed_array(0, 5, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow priests in the barracks.",
                response = "If they start teaching mercy to soldiers, I will throw them out myself.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid them entry.",
                response = "The barracks will remain barracks, not a hall of prayer.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them in only before battles.",
                response = "Before death, men listen to gods more willingly. Hard to argue with that.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban the sale of holy water.",
                response = "Thank you. Disease does not vanish when filth is blessed.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Order temples to boil water before consecration.",
                response = "Good. Let faith at least stop carrying infection.",
                statDeltas = fixed_array(0, 5, 0, -3, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere with rites.",
                response = "Then I will treat the consequences of your caution.",
                statDeltas = fixed_array(0, 8, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Fast for all, army included.",
                response = "Turnips will be holy. Soldiers will be furious.",
                statDeltas = fixed_array(0, 10, -15, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Fast only for the palace.",
                response = "Now that is a sight: courtiers suffering almost like common folk.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Exempt the army from fasting.",
                response = "Soldiers will be fed. Priests will be hungry for outrage.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Post guards at the temple.",
                response = "Spears may hold doors. Not questions.",
                statDeltas = fixed_array(0, -5, 8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the crowd hear the sermon.",
                response = "Very well. But if words turn to sparks, I warned you.",
                statDeltas = fixed_array(0, 8, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute bread before the temple.",
                response = "A fed man shouts less. Sometimes that is the best guard.",
                statDeltas = fixed_array(0, 5, 0, 0, 10, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Grant the church broader rights.",
                response = "The altar will smile. The throne will stand a little lower.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Bind the church by law.",
                response = "A bold move. Such footsteps are often heard near a scaffold.",
                statDeltas = fixed_array(0, -20, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the balance.",
                response = "Balance is seldom elegant, but sometimes it survives longer.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Permit trade in holy wares.",
                response = "Faith sells better than bread, and keeps longer.",
                statDeltas = fixed_array(0, -8, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid profit from faith.",
                response = "Noble. Very unprofitable.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow only temple-controlled goods.",
                response = "A monopoly of holiness. The church learns commerce quickly.",
                statDeltas = fixed_array(0, 8, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests brought a man who spat upon temple doors. They demand a public execution.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Execute him.",
                response = "The square will receive its lesson again. I hope it is worth the blood.",
                statDeltas = fixed_array(0, 15, 5, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Throw him in the dungeon.",
                response = "A dungeon is quieter than a gallows, but priests prefer loud answers.",
                statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Force a public apology.",
                response = "A rare day when a tongue replaces a noose.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy herbs from Sivil.",
                response = "Herbs are rougher than prayers, yet they work more often.",
                statDeltas = fixed_array(0, -5, 0, -12, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Support the temple incense.",
                response = "Then let disease choke on fragrance, if it can.",
                statDeltas = fixed_array(0, 10, 0, -5, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Mix herbs with church incense.",
                response = "Now that is almost clever. It is almost insulting.",
                statDeltas = fixed_array(0, 5, 0, -10, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "My prince asks whether your church now rules beside you. In the north, such kings are called soft.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Say the church is my ally.",
                response = "The north will hear and decide you share your sword with prayer.",
                statDeltas = fixed_array(0, 10, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Say the church bends to the throne.",
                response = "Good. The north respects those who keep the altar by the throat.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse to answer the provocation.",
                response = "Silence can be wise, but neighbors often hear fear in it.",
                statDeltas = fixed_array(0, 0, -3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The people of the former king still serve in the palace. If you drive everyone away, the palace will go blind. If you leave everyone, you will sleep among someone else's memory.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Drive away all the old servants.",
                response = "The palace will become cleaner. And much more stupid.",
                statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Leave those who take a new oath.",
                response = "An oath is not always loyalty. But this is a start.",
                statDeltas = fixed_array(0, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave everyone.",
                response = "The palace machine will continue to work. The question is - to whom.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Which one is dangerous?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "The most dangerous of all are those who are too silent. A devoted servant is always a little human. A spy is always furniture.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Make a list of suspects.",
                response = "The list won't save you, but it will tell you who not to trust with wine.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace only those closest to the throne.",
                response = "Soft cleaning. Sometimes a soft knife cuts more accurately.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't touch anyone.",
                response = "Then the palace will smile at you with its old teeth.",
                statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Northern scouts crossed the border. This could be a test. May I strike first?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Strike first.",
                response = "So say kings who are never tried twice.",
                statDeltas = fixed_array(0, 0, 20, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Strengthen the border, but do not attack.",
                response = "Cautious force. Not the worst language for the border.",
                statDeltas = fixed_array(0, 0, 10, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Send an ambassador.",
                response = "Words are cheaper than blood. Until the other side decides otherwise.",
                statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Ignore the scouts.",
                response = "The border will hear your silence. And the enemy too.",
                statDeltas = fixed_array(0, 0, -15, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Grant the church judicial power.",
                response = "Faith without judgment is a plea. Faith with judgment is law.",
                statDeltas = fixed_array(0, 20, -5, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep judgment under the crown.",
                response = "Then do not be surprised when sinners begin to love royal law.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow church courts for heresy alone.",
                response = "Not all we asked, but enough to begin.",
                statDeltas = fixed_array(0, 8, 3, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Demand their surrender.",
                response = "Temple doors will open, but people will remember holiness did not protect them.",
                statDeltas = fixed_array(0, -10, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave them in sanctuary.",
                response = "Thank you. At times, sanctuary matters more than statute.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forgive debt for those who come out willingly.",
                response = "Mercy brought out more souls than guards.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allocate funds for the cathedral.",
                response = "Stone for the temple. Emptiness for the treasury.",
                statDeltas = fixed_array(0, 20, 0, -25, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "The treasury thanks you. The temple will curse you with excellent acoustics.",
                statDeltas = fixed_array(0, -15, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Build a small chapel instead of a cathedral.",
                response = "Inexpensive piety. At times, even that sells.",
                statDeltas = fixed_array(0, 8, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Add crosses to the banners.",
                response = "Now soldiers carry not only your crest. A dangerous symbol.",
                statDeltas = fixed_array(0, 15, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid church signs on banners.",
                response = "Good. In battle a soldier must see orders, not sermons.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Add a small symbol on separate regimental ribbons.",
                response = "Tolerable. Prayer stays at the edge where it belongs.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The sick queue for a saint's relics. They stand hours in rain instead of going to the infirmary.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid the relic queue.",
                response = "You will save bodies. Souls will rage.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Place healers beside the relics.",
                response = "Good. Let miracle work beside bandages.",
                statDeltas = fixed_array(0, 5, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not hinder the faithful.",
                response = "Then rain and disease continue their service.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples want the best flour for holy bread. I could feed orphans with that flour.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give the best flour to temples.",
                response = "Holy bread will be soft. Orphans' porridge thin.",
                statDeltas = fixed_array(0, 12, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Give the flour to orphans.",
                response = "Children will thank you. Priests something longer.",
                statDeltas = fixed_array(0, -8, 0, 0, 12, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Divide the flour.",
                response = "Half holiness, half mercy. Edible.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A priest refused temple gates to guards. Inside is church land, not royal.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Break in by force.",
                response = "The door falls. And something greater with it.",
                statDeltas = fixed_array(0, -20, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Withdraw.",
                response = "The guard will remember. Priests too.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand talks at the gate.",
                response = "Good. Let them talk for now, not break.",
                statDeltas = fixed_array(0, 3, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church's opening brought not peace but a new center of power. Every order is compared to a sermon.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Make the church official support of the throne.",
                response = "You gained a holy shield. And a holy chain.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the church at distance.",
                response = "Safer for the throne. Riskier for the people's soul.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Show unity without yielding power.",
                response = "A tightrope walk. Do not look down.",
                statDeltas = fixed_array(0, 8, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid preaching about the coup.",
                response = "Silence is bought. But it does not always keep long.",
                statDeltas = fixed_array(0, 8, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them speak the truth.",
                response = "Truth in the temple rings louder than in the square.",
                statDeltas = fixed_array(0, 5, -8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them speak of peace, not blood.",
                response = "Peace is a convenient truth. The church knows how to speak it.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Support the shelter.",
                response = "You gave the children not only a roof, but a tomorrow.",
                statDeltas = fixed_array(0, 8, 0, -12, 20, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Give grain only.",
                response = "They will eat. For now that is already a miracle.",
                statDeltas = fixed_array(0, 3, 0, 0, 10, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Then the street will be their teacher again.",
                statDeltas = fixed_array(0, -5, 0, 5, -10, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church sells letters of absolution. Tax them and the treasury will revive.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tax the letters.",
                response = "Sin will finally work for the treasury.",
                statDeltas = fixed_array(0, -10, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban the sale of letters.",
                response = "Moral. But morality does not jingle.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "The temple will keep selling heaven without our share.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests say the northerners are godless. If they continue, soldiers will start waiting for war.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow such sermons.",
                response = "Soldiers love an enemy they were blessed to hate.",
                statDeltas = fixed_array(0, 15, 10, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid war sermons.",
                response = "Sensible. There is war enough without holy cries.",
                statDeltas = fixed_array(0, -12, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow only prayers for protection.",
                response = "Defense sounds quieter than attack. Sometimes that helps.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Require monastery healers to keep records.",
                response = "Ink will save those prayers heal blindly.",
                statDeltas = fixed_array(0, -5, 0, -3, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban monastery healing.",
                response = "It will stop mistakes. And some help too.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not touch monastery traditions.",
                response = "Traditions are fine until medicine is mistaken for poison.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed the pilgrims.",
                response = "Holy folk eat like anyone else. Sometimes even more.",
                statDeltas = fixed_array(0, 15, 0, 0, 10, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Admit only those who bring their own food.",
                response = "The city keeps grain. Pilgrims keep resentment.",
                statDeltas = fixed_array(0, -8, 0, 0, -3, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Organize cheap porridge.",
                response = "Thin but honest. Good enough for pilgrims.",
                statDeltas = fixed_array(0, 8, 0, -5, 5, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims enter the city. Among them one can hide spies, killers, and deserters.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Search all pilgrims.",
                response = "Safer. But holiness will wait in line for inspection.",
                statDeltas = fixed_array(0, -8, 10, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let all pass unchecked.",
                response = "Open gates are loved by more than the faithful.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Search only armed men.",
                response = "A compromise. Not perfect, but livable.",
                statDeltas = fixed_array(0, 3, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    )
)


let public allEncountersEnMid : Encounter[POOL_MID_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Return the lands to the church.",
                response = "The altar grows richer. The throne — more grateful or weaker.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the lands for the crown.",
                response = "The land stays yours. So do the curses.",
                statDeltas = fixed_array(0, -20, 0, 10, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Return only part.",
                response = "Half a concession is often better than full war.",
                statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the market and take a toll.",
                response = "Faith brings buyers. The crown takes the coins.",
                statDeltas = fixed_array(0, -5, 0, 20, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Allow the market without toll.",
                response = "Rare generosity. Merchants will pray for you.",
                statDeltas = fixed_array(0, 8, 0, -5, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban the market by the temple.",
                response = "Holiness preserved. Profit passed by.",
                statDeltas = fixed_array(0, 5, 0, -10, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow penance instead of execution.",
                response = "The monastery gets sinners. I get a free day.",
                statDeltas = fixed_array(0, 12, -8, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute as sentenced.",
                response = "Faith came late. The axe — on time.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace execution with labor at monasteries.",
                response = "Sin will dig the earth. Almost poetic.",
                statDeltas = fixed_array(0, 5, -3, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "My prince congratulates you on your crown. He asks only for a small thing: to reduce the duty on northern furs.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Reduce the duty.",
                response = "The North will appreciate your wisdom. And your need for friends.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Solid answer. I hope your boundaries are just as strong.",
                statDeltas = fixed_array(0, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Increase the duty.",
                response = "Boldly. My prince loves the brave almost as much as he loves testing them.",
                statDeltas = fixed_array(0, 0, -10, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Why is your prince asking now?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because the new king is either looking for friends or showing his teeth. My prince wants to understand who he sees.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tell me: I'm looking for friends.",
                response = "Then the north will extend its hand. Cold, but open.",
                statDeltas = fixed_array(0, 0, -3, -8, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Tell me: I'm showing my teeth.",
                response = "I'll pass. And I'll make sure he doesn't laugh too loudly.",
                statDeltas = fixed_array(0, 0, 10, 5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Tell me: I trade, but I don’t bow.",
                response = "Nice phrase. It can be sold for more than fur.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban holy salve.",
                response = "Good sense beat fragrant lies.",
                statDeltas = fixed_array(0, -12, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow both salves.",
                response = "Let people choose between faith and stink. Amusing.",
                statDeltas = fixed_array(0, 5, 0, 5, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Inspect salves before sale.",
                response = "Inspection is the swindler's foe. So almost medicine.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Northerners in the capital ask to open their own temple. Your priests call it heresy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow a northern temple.",
                response = "The north will approve. Your priests will not.",
                statDeltas = fixed_array(0, -20, 0, 5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid it.",
                response = "Then northerners will see your faith outweighs hospitality.",
                statDeltas = fixed_array(0, 15, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow private prayers without a temple.",
                response = "Half-freedom. The north lives with it, but does not love it.",
                statDeltas = fixed_array(0, -5, 0, 3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Require soldiers to confess.",
                response = "Sin is named. Now it can be leashed.",
                statDeltas = fixed_array(0, 15, -10, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Confession voluntary only.",
                response = "Voluntary cleansing is slower, but cleaner.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the army alone.",
                response = "Then swords stay sharp. Souls stay dirty.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims sell their belongings for bread. Some already fall on the road to the temple.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Open a free kitchen.",
                response = "The road to the temple will be less deadly today.",
                statDeltas = fixed_array(0, 10, 0, 0, 18, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Sell them cheap bread.",
                response = "Not mercy, but help. Sometimes that is all there is.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Close the city to new pilgrims.",
                response = "The gates keep bread. And lose hearts.",
                statDeltas = fixed_array(0, -15, 0, 0, -5, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If the church declares giving to the crown a holy deed, people will bring coins themselves.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ask the church to declare a collection.",
                response = "When greed is blessed, it is called service.",
                statDeltas = fixed_array(0, 8, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Collect donations without the church.",
                response = "People give less when heaven does not frighten them.",
                statDeltas = fixed_array(0, 0, 0, 8, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not collect from the people.",
                response = "Mercy robbed the treasury again.",
                statDeltas = fixed_array(0, 0, 0, -10, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests want prayer before every parade. It turns the army into a church procession.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow prayers before inspection.",
                response = "Soldiers will stand longer. I hope enemies wait too.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid it.",
                response = "Good. Inspection should sound of steps, not psalms.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Prayer only before a campaign.",
                response = "Before death people tolerate long speeches.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow secret autopsies.",
                response = "Secret truth still heals better than open lies.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid autopsies.",
                response = "Then disease keeps its secrets.",
                statDeltas = fixed_array(0, 10, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Autopsy only bodies without kin.",
                response = "Cruel but useful. Like much in medicine.",
                statDeltas = fixed_array(0, -3, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In three days is the saint's feast. The temple asks a feast for the poor. The poor ask for feasts every day.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allocate food for the feast.",
                response = "The feast will be hearty. The next day ordinary.",
                statDeltas = fixed_array(0, 12, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Allocate half.",
                response = "Half a miracle. Not bad for the kitchen.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Bread stays. Gratitude leaves.",
                statDeltas = fixed_array(0, -10, 0, 0, -5, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Salt preserves meat and fish. Give me security and I will bring her to the city.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Provide military protection.",
                response = "The salt will come quickly. The soldiers will also finally do something useful for trade.",
                statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Pay the mercenaries.",
                response = "Expensive, but convenient. Mercenaries ask fewer questions.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Let the caravan go on its own.",
                response = "Then pray that thieves do not like salt.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Why do you need royal security?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because the robbers fear the banner more than my people. And the royal guard also makes the goods royally expensive.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give protection, but take away some of the salt.",
                response = "Fair. Unpleasant, but fair.",
                statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 0, 18, 0)
            ),
            DialogueChoice(
                choiceText = "Provide security for a fee.",
                response = "You are learning to trade. It's scary.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Hire your own security.",
                response = "Certainly. And then I'll name a price you won't like.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik is forming a temple guard. For now sticks and robes. Later, swords.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid the temple guard.",
                response = "Good. One law and one guard in the city.",
                statDeltas = fixed_array(0, -15, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow the temple guard.",
                response = "Then the temple grows teeth. Do not be surprised if it bites.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Fold temple guard into the royal guard.",
                response = "Better in the ranks than against them.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Speak to the people more often.",
                response = "The throne must have a voice, or others speak for it.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the church speak for the crown.",
                response = "Convenient. But one day you will hear your orders in a stranger's voice.",
                statDeltas = fixed_array(0, 15, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bread after royal speeches.",
                response = "Good. Words go down better with bread.",
                statDeltas = fixed_array(0, 3, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church wants a book of faithful subjects. Those listed receive help first.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the book of the faithful.",
                response = "Ordered mercy beats chaotic mercy.",
                statDeltas = fixed_array(0, 15, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid dividing people by faith.",
                response = "You want equality where people seek chosenness.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Make the book voluntary.",
                response = "Voluntary entry is a soft door. Many will pass.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Those who argued with priests were barred from the monastery kitchen. They are hungry.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed all regardless of faith.",
                response = "This is the mercy I hoped to hear.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Feed only the faithful.",
                response = "Then soup becomes a test, not salvation.",
                statDeltas = fixed_array(0, 12, 0, 0, -10, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Create a royal kitchen apart from the monastery.",
                response = "Then the hungry need not choose between bread and conscience.",
                statDeltas = fixed_array(0, 0, 0, -10, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith's name.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forgive the debts.",
                response = "Faith loves forgiveness. The treasury does not.",
                statDeltas = fixed_array(0, 15, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand payment.",
                response = "Debt is holier than prayer if recorded well.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take payment in grain.",
                response = "Let their penance be edible.",
                statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests ask to stop executing deserters. Every soldier can repent, they say.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Stop executing deserters.",
                response = "Mercy in the barracks smells of mutiny.",
                statDeltas = fixed_array(0, 10, -15, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Continue executions.",
                response = "Order holds. Souls can catch up later.",
                statDeltas = fixed_array(0, -10, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace execution with hard service.",
                response = "A living coward with a shovel beats a dead one.",
                statDeltas = fixed_array(0, 5, 5, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Move the sick to infirmaries.",
                response = "They will rage. But survive more often.",
                statDeltas = fixed_array(0, -10, 0, 0, 18, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Open temple infirmaries.",
                response = "If the temple heals, let it learn to scrub floors.",
                statDeltas = fixed_array(0, 8, 0, -10, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave things as they are.",
                response = "Then we will all need a miracle.",
                statDeltas = fixed_array(0, 8, 0, 0, -18, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "During the fast fish costs more than meat. Merchants pray to the fast louder than priests.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Cap fish prices.",
                response = "The fast grows less luxurious for traders.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Merchants stay fed. People fast holily.",
                statDeltas = fixed_array(0, 0, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give salted fish from stores.",
                response = "Salty mercy. Wash it down if the water is clean.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Signs on the walls: 'A king without blessing is no king.' This is no longer a whisper.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Erase signs and arrest the writers.",
                response = "Walls grow clean. People grow careful.",
                statDeltas = fixed_array(0, -8, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Answer with a public speech.",
                response = "Words against graffiti. Sometimes it works.",
                statDeltas = fixed_array(0, 0, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ask the church to condemn the signs.",
                response = "If the temple speaks, walls fall silent faster.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ask the church to dispel the rumor.",
                response = "Curses fear candles, especially paid ones.",
                statDeltas = fixed_array(0, 10, 0, -8, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid talk of the curse.",
                response = "A ban is a poor lid on a boiling pot.",
                statDeltas = fixed_array(0, 0, 8, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Mock the rumor publicly.",
                response = "Laughter cures fear. Not always faith.",
                statDeltas = fixed_array(0, -5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Grant the monopoly.",
                response = "Candles will burn. So will coins.",
                statDeltas = fixed_array(0, 5, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid the monopoly.",
                response = "A free market in candles. How nobly dull.",
                statDeltas = fixed_array(0, 0, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Set a royal price on wax.",
                response = "You spoil profit but call it order.",
                statDeltas = fixed_array(0, 3, 0, 8, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I received a list of suspected heretics. Half the names in another's hand, half in a trembling one.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Begin arrests.",
                response = "The list grows shorter. Fear grows longer.",
                statDeltas = fixed_array(0, 15, 8, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Verify the list.",
                response = "A rare night when paper outlives the axe.",
                statDeltas = fixed_array(0, -5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Burn the list.",
                response = "Fire works for me today.",
                statDeltas = fixed_array(0, -15, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some sick stopped buying remedies. A priest told them to pray and endure.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Order temples not to hinder healing.",
                response = "Thank you. Disease is glad when you treat it instead of telling patients to endure.",
                statDeltas = fixed_array(0, -10, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Support the church.",
                response = "Then let prayers break the fever. I will watch.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow both prayer and medicine.",
                response = "Let them heal with everything at once. Sometimes desperation helps.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your priests want to ride north to preach. My prince will call it meddling.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the mission.",
                response = "The north does not love foreign prayers. Especially from the south.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid the mission.",
                response = "My prince will value your caution.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Send only healer-monks.",
                response = "A healer passes where a preacher meets spears.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In the north they say that you are busy with the sick and with bread, not with the sword. I, of course, don't believe this.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Show a military parade.",
                response = "Beautiful rows. The North loves to count spears.",
                statDeltas = fixed_array(0, 0, 15, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Show full barns.",
                response = "Bread is also a weapon. Especially in winter.",
                statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Give gold and send it home.",
                response = "A generous gesture. Or dear request to remain silent.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What else do they say in the north?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "They say that the new king puts out fires inside the palace and therefore does not see the smoke on the border.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Strengthen the northern fortresses.",
                response = "The north will see the stone. Stone is always clearer than words.",
                statDeltas = fixed_array(0, 0, 20, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Send scouts.",
                response = "Fine. Eyes are cheaper than war.",
                statDeltas = fixed_array(0, 0, 8, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't give in to provocation.",
                response = "Peace fit for a king. If there is power behind him.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Agree to a temple coronation.",
                response = "Now your crown will shine with gold and godly fear.",
                statDeltas = fixed_array(0, 25, -5, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Then the temple will be silent. But silence in the temple carries far.",
                statDeltas = fixed_array(0, -25, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hold a small rite without a new coronation.",
                response = "Not full victory for the altar. But a step toward it.",
                statDeltas = fixed_array(0, 10, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "City poor are angry: pilgrims are fed while locals starve. Mercy became envy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed city dwellers first.",
                response = "Save the house before the guests. That is clear.",
                statDeltas = fixed_array(0, -5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Feed all equally.",
                response = "Hard, costly, right.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Feed only pilgrims at the temple.",
                response = "Then the city will think faith came for others.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tax the shops.",
                response = "Fairness finally brought coins.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave shops tax-free.",
                response = "Holiness is cheaper for the temple than the treasury again.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Introduce a small tax.",
                response = "A small sting. Perhaps the temple will not scream.",
                statDeltas = fixed_array(0, -3, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Young fanatics want to join the army. They are brave but ignore orders when they hear 'heresy'.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept them.",
                response = "Bravery gained. Discipline in question.",
                statDeltas = fixed_array(0, 8, 15, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse the fanatics.",
                response = "Better fewer soldiers than a crowd with swords and songs.",
                statDeltas = fixed_array(0, -10, -5, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Form a separate church unit under army oversight.",
                response = "I will keep them close. And far from decisions.",
                statDeltas = fixed_array(0, 5, 10, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some priests say women must not treat men. Today three refused my help.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid such preaching.",
                response = "Thank you. Disease does not choose healers by sex.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Let pride bandage their wounds.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Assign women healers only to women and children.",
                response = "Conceding to prejudice rarely saves a life.",
                statDeltas = fixed_array(0, 5, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tax monastery beer.",
                response = "Beer grows costly. Prayers grow irritable.",
                statDeltas = fixed_array(0, -8, -3, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave it untaxed.",
                response = "Soldiers will drink to the church's health.",
                statDeltas = fixed_array(0, 8, 5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take part of the beer for the army.",
                response = "Holy beer in the barracks. I have seen that before brawls.",
                statDeltas = fixed_array(0, -5, 10, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A young priest says the king must listen only to the church. The crowd applauds.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Arrest the priest.",
                response = "The crowd sees force. And remembers the arrested face.",
                statDeltas = fixed_array(0, -15, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Summon him to talk.",
                response = "Softer. But he may take softness for weakness.",
                statDeltas = fixed_array(0, 3, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ignore.",
                response = "Unanswered words often grow.",
                statDeltas = fixed_array(0, 5, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik proposes a church council at court. Robed advisers will speak for people and gods.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Create the church council.",
                response = "You let the altar into the throne room. Harder to remove.",
                statDeltas = fixed_array(0, 20, -5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Priests stay outside. And speak louder.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow one church representative.",
                response = "One robe is lighter than a council. Until it speaks for all.",
                statDeltas = fixed_array(0, 8, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church proposes a luxury tax. Money for the poor — through temple hands, of course.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Levy through the church.",
                response = "The rich will hate us both. The poor will eat.",
                statDeltas = fixed_array(0, 15, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Levy through the crown.",
                response = "You took mercy from church hands. Bold.",
                statDeltas = fixed_array(0, -5, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Luxury untouched. So is hunger.",
                statDeltas = fixed_array(0, -8, 0, 3, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Leave beggars at the altar.",
                response = "Prayer beside poverty is honester.",
                statDeltas = fixed_array(0, -3, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Move beggars outside.",
                response = "The temple grows prettier. And colder.",
                statDeltas = fixed_array(0, 8, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Create a separate food handout after service.",
                response = "Good. Mercy should not block prayer, but stay near.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Fund the bell.",
                response = "The bell will ring. The treasury will empty.",
                statDeltas = fixed_array(0, 15, 0, -15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Silence is cheaper than silver.",
                statDeltas = fixed_array(0, -10, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bronze instead of silver.",
                response = "A poorer bell, still louder than my displeasure.",
                statDeltas = fixed_array(0, 5, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "My prince has sent you barrels of salted fish. For free. Almost free. He asks to accept his friendship.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept the gift.",
                response = "Wise. Pisces doesn't like to wait, and neither does friendship.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Accept and send gold in return.",
                response = "Generous answer. The North loves equal gestures.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Caution deserves respect. Hunger - no.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "What does 'almost free' mean?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "This means that today you accept fish, and tomorrow my prince will remind you that friends do not close bridges and ports.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept fish and friendship.",
                response = "Then the north will remember the open doors.",
                statDeltas = fixed_array(0, 0, -3, 3, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Pay for fish as if it were a commodity.",
                response = "This is how a gift becomes a transaction. Clean but cold.",
                statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "I will tell the prince that your pride is richer than your city.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Order the army to fast.",
                response = "If the enemy strikes, we will throw prayers.",
                statDeltas = fixed_array(0, 15, -15, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Exempt the army from fasting.",
                response = "Thank you. A soldier with meat in his belly beats a holy skeleton.",
                statDeltas = fixed_array(0, -10, 12, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Fast only for officers.",
                response = "Officers suffer prettily. Rank and file eat.",
                statDeltas = fixed_array(0, 5, -3, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If the army itself runs the kitchens, the soldiers will not go hungry.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Transfer the kitchens to the military.",
                response = "The soldiers will feed the soldiers. It's more reliable this way.",
                statDeltas = fixed_array(0, 0, 15, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the kitchens to the chefs.",
                response = "Then let the cooks remember: a hungry soldier is a bad guest.",
                statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Share control.",
                response = "Compromise. I don't like them, but at least this one is edible.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Do you want to control the bread?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "I want to control what, without which a soldier ceases to be a soldier and becomes a hungry man with a spear.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give the army separate warehouses.",
                response = "That's enough. Until the warehouses are empty.",
                statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Appoint a general caretaker.",
                response = "If he's honest, it will work. If not, I'll find out.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Reduce army rations.",
                response = "Then prepare not only the barns, but also the gallows.",
                statDeltas = fixed_array(0, 0, -20, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims brought a new disease. Priests call it a trial. I call it plague.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Close the city to pilgrims.",
                response = "It saves the city. And angers those bound for the shrine.",
                statDeltas = fixed_array(0, -15, 0, 0, 20, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Screen pilgrims at the gates.",
                response = "Slow, but better than letting sickness in with hymns.",
                statDeltas = fixed_array(0, -3, 0, -8, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not hinder pilgrimage.",
                response = "Then the trial becomes mass.",
                statDeltas = fixed_array(0, 12, 0, 0, -20, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Fish for the fast is sold by the temple. Half already smells like a sermon after rain.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Seize spoiled fish.",
                response = "People lose supper but keep their guts.",
                statDeltas = fixed_array(0, -3, 0, 0, 12, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Allow sale after salting.",
                response = "Salt is not magic. Though merchants believe otherwise.",
                statDeltas = fixed_array(0, 0, 0, 0, -8, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Close the market by the temple.",
                response = "The stench leaves. So does profit.",
                statDeltas = fixed_array(0, -8, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Meet them with guards.",
                response = "Candles die fast. Anger does not.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Go out to them yourself.",
                response = "I will be near. If candles turn to torches, run first.",
                statDeltas = fixed_array(0, 3, -5, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bread and admit representatives.",
                response = "Bread cools hands better than water.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If the church names you pious, many will forget the coup. But the church gives no such gifts for free.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy a pious reputation.",
                response = "Reputation bought. Now hide the receipt.",
                statDeltas = fixed_array(0, 20, 0, -20, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Earn it by deeds.",
                response = "Slower. But stronger.",
                statDeltas = fixed_array(0, 5, 0, -10, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "I need no church reputation.",
                response = "Kings say that until the first sermon against them.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Bakers sell 'holy bread' triple the price. People buy from fear of disease.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban holy bread.",
                response = "You forbade fear as merchandise. Bold.",
                statDeltas = fixed_array(0, -8, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Tax holy bread.",
                response = "If people pay for fear, the crown gets a share.",
                statDeltas = fixed_array(0, -3, 0, 15, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow it but set a price.",
                response = "Controlled superstition. Almost state policy.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church demands burning books found with a scholar. They corrupt souls, they say.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Burn the books.",
                response = "Paper burns fast. Ideas — differently.",
                statDeltas = fixed_array(0, 15, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hide books in the royal archive.",
                response = "Secret fire can be deadlier than open flame.",
                statDeltas = fixed_array(0, -10, 0, -3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow reading after review.",
                response = "A rare book that lived to face judgment.",
                statDeltas = fixed_array(0, -5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Protect Sivil.",
                response = "Thank you. I am almost moved. Almost.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban her herbs.",
                response = "Let monks cure coughs with psalms.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow herbs through temple inspection.",
                response = "The temple will sniff my pouches. What honor.",
                statDeltas = fixed_array(0, 5, 0, -3, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Families from the north came to your gates. They flee war but pray to other gods.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept the refugees.",
                response = "The north will remember your mercy. Your priests too.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse them.",
                response = "Cold mercy. Almost northern.",
                statDeltas = fixed_array(0, 10, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Accept if they live apart.",
                response = "Half-shelter. Better than the road, worse than home.",
                statDeltas = fixed_array(0, -5, 0, -5, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    )
)


let public allEncountersEnLateA : Encounter[POOL_LATE_A_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or usurper.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ask the church for a blessing.",
                response = "Humility is a fitting beginning for one who reached the throne through blood.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand recognition of my authority.",
                response = "Orders reach soldiers. They rise to heaven far less well.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Offer the church an alliance.",
                response = "An alliance of throne and altar may save the realm. Or smother it.",
                statDeltas = fixed_array(0, 10, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Send grain to the monastery.",
                response = "Today faith will smell of bread.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Let the monastery feed them on its own.",
                response = "We will try. But an empty pot does not become holy through prayer.",
                statDeltas = fixed_array(0, -5, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Send guards to disperse the line.",
                response = "You can scatter the hungry. Hunger itself will stay.",
                statDeltas = fixed_array(0, -10, 8, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples collect tithe. The treasury collects taxes. Soon the people will see they pay twice.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Limit the church tithe.",
                response = "The treasury is grateful. The altar will hiss.",
                statDeltas = fixed_array(0, -20, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the tithe to the church.",
                response = "Priests love it when their gold is called faith.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Collect taxes together with the church.",
                response = "Two hands in one pocket. Convenient, yet dangerous.",
                statDeltas = fixed_array(0, 5, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow priests in the barracks.",
                response = "If they start teaching mercy to soldiers, I will throw them out myself.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid them entry.",
                response = "The barracks will remain barracks, not a hall of prayer.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them in only before battles.",
                response = "Before death, men listen to gods more willingly. Hard to argue with that.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban the sale of holy water.",
                response = "Thank you. Disease does not vanish when filth is blessed.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Order temples to boil water before consecration.",
                response = "Good. Let faith at least stop carrying infection.",
                statDeltas = fixed_array(0, 5, 0, -3, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere with rites.",
                response = "Then I will treat the consequences of your caution.",
                statDeltas = fixed_array(0, 8, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Fast for all, army included.",
                response = "Turnips will be holy. Soldiers will be furious.",
                statDeltas = fixed_array(0, 10, -15, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Fast only for the palace.",
                response = "Now that is a sight: courtiers suffering almost like common folk.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Exempt the army from fasting.",
                response = "Soldiers will be fed. Priests will be hungry for outrage.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Post guards at the temple.",
                response = "Spears may hold doors. Not questions.",
                statDeltas = fixed_array(0, -5, 8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the crowd hear the sermon.",
                response = "Very well. But if words turn to sparks, I warned you.",
                statDeltas = fixed_array(0, 8, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute bread before the temple.",
                response = "A fed man shouts less. Sometimes that is the best guard.",
                statDeltas = fixed_array(0, 5, 0, 0, 10, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Grant the church broader rights.",
                response = "The altar will smile. The throne will stand a little lower.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Bind the church by law.",
                response = "A bold move. Such footsteps are often heard near a scaffold.",
                statDeltas = fixed_array(0, -20, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the balance.",
                response = "Balance is seldom elegant, but sometimes it survives longer.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Permit trade in holy wares.",
                response = "Faith sells better than bread, and keeps longer.",
                statDeltas = fixed_array(0, -8, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid profit from faith.",
                response = "Noble. Very unprofitable.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow only temple-controlled goods.",
                response = "A monopoly of holiness. The church learns commerce quickly.",
                statDeltas = fixed_array(0, 8, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests brought a man who spat upon temple doors. They demand a public execution.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Execute him.",
                response = "The square will receive its lesson again. I hope it is worth the blood.",
                statDeltas = fixed_array(0, 15, 5, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Throw him in the dungeon.",
                response = "A dungeon is quieter than a gallows, but priests prefer loud answers.",
                statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Force a public apology.",
                response = "A rare day when a tongue replaces a noose.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy herbs from Sivil.",
                response = "Herbs are rougher than prayers, yet they work more often.",
                statDeltas = fixed_array(0, -5, 0, -12, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Support the temple incense.",
                response = "Then let disease choke on fragrance, if it can.",
                statDeltas = fixed_array(0, 10, 0, -5, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Mix herbs with church incense.",
                response = "Now that is almost clever. It is almost insulting.",
                statDeltas = fixed_array(0, 5, 0, -10, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "My prince asks whether your church now rules beside you. In the north, such kings are called soft.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Say the church is my ally.",
                response = "The north will hear and decide you share your sword with prayer.",
                statDeltas = fixed_array(0, 10, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Say the church bends to the throne.",
                response = "Good. The north respects those who keep the altar by the throat.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse to answer the provocation.",
                response = "Silence can be wise, but neighbors often hear fear in it.",
                statDeltas = fixed_array(0, 0, -3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Grant the church judicial power.",
                response = "Faith without judgment is a plea. Faith with judgment is law.",
                statDeltas = fixed_array(0, 20, -5, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep judgment under the crown.",
                response = "Then do not be surprised when sinners begin to love royal law.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow church courts for heresy alone.",
                response = "Not all we asked, but enough to begin.",
                statDeltas = fixed_array(0, 8, 3, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Demand their surrender.",
                response = "Temple doors will open, but people will remember holiness did not protect them.",
                statDeltas = fixed_array(0, -10, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave them in sanctuary.",
                response = "Thank you. At times, sanctuary matters more than statute.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forgive debt for those who come out willingly.",
                response = "Mercy brought out more souls than guards.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allocate funds for the cathedral.",
                response = "Stone for the temple. Emptiness for the treasury.",
                statDeltas = fixed_array(0, 20, 0, -25, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "The treasury thanks you. The temple will curse you with excellent acoustics.",
                statDeltas = fixed_array(0, -15, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Build a small chapel instead of a cathedral.",
                response = "Inexpensive piety. At times, even that sells.",
                statDeltas = fixed_array(0, 8, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Add crosses to the banners.",
                response = "Now soldiers carry not only your crest. A dangerous symbol.",
                statDeltas = fixed_array(0, 15, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid church signs on banners.",
                response = "Good. In battle a soldier must see orders, not sermons.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Add a small symbol on separate regimental ribbons.",
                response = "Tolerable. Prayer stays at the edge where it belongs.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The sick queue for a saint's relics. They stand hours in rain instead of going to the infirmary.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid the relic queue.",
                response = "You will save bodies. Souls will rage.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Place healers beside the relics.",
                response = "Good. Let miracle work beside bandages.",
                statDeltas = fixed_array(0, 5, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not hinder the faithful.",
                response = "Then rain and disease continue their service.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples want the best flour for holy bread. I could feed orphans with that flour.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give the best flour to temples.",
                response = "Holy bread will be soft. Orphans' porridge thin.",
                statDeltas = fixed_array(0, 12, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Give the flour to orphans.",
                response = "Children will thank you. Priests something longer.",
                statDeltas = fixed_array(0, -8, 0, 0, 12, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Divide the flour.",
                response = "Half holiness, half mercy. Edible.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A priest refused temple gates to guards. Inside is church land, not royal.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Break in by force.",
                response = "The door falls. And something greater with it.",
                statDeltas = fixed_array(0, -20, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Withdraw.",
                response = "The guard will remember. Priests too.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand talks at the gate.",
                response = "Good. Let them talk for now, not break.",
                statDeltas = fixed_array(0, 3, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church's opening brought not peace but a new center of power. Every order is compared to a sermon.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Make the church official support of the throne.",
                response = "You gained a holy shield. And a holy chain.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the church at distance.",
                response = "Safer for the throne. Riskier for the people's soul.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Show unity without yielding power.",
                response = "A tightrope walk. Do not look down.",
                statDeltas = fixed_array(0, 8, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid preaching about the coup.",
                response = "Silence is bought. But it does not always keep long.",
                statDeltas = fixed_array(0, 8, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them speak the truth.",
                response = "Truth in the temple rings louder than in the square.",
                statDeltas = fixed_array(0, 5, -8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them speak of peace, not blood.",
                response = "Peace is a convenient truth. The church knows how to speak it.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Support the shelter.",
                response = "You gave the children not only a roof, but a tomorrow.",
                statDeltas = fixed_array(0, 8, 0, -12, 20, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Give grain only.",
                response = "They will eat. For now that is already a miracle.",
                statDeltas = fixed_array(0, 3, 0, 0, 10, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Then the street will be their teacher again.",
                statDeltas = fixed_array(0, -5, 0, 5, -10, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church sells letters of absolution. Tax them and the treasury will revive.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tax the letters.",
                response = "Sin will finally work for the treasury.",
                statDeltas = fixed_array(0, -10, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban the sale of letters.",
                response = "Moral. But morality does not jingle.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "The temple will keep selling heaven without our share.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests say the northerners are godless. If they continue, soldiers will start waiting for war.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow such sermons.",
                response = "Soldiers love an enemy they were blessed to hate.",
                statDeltas = fixed_array(0, 15, 10, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid war sermons.",
                response = "Sensible. There is war enough without holy cries.",
                statDeltas = fixed_array(0, -12, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow only prayers for protection.",
                response = "Defense sounds quieter than attack. Sometimes that helps.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Require monastery healers to keep records.",
                response = "Ink will save those prayers heal blindly.",
                statDeltas = fixed_array(0, -5, 0, -3, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban monastery healing.",
                response = "It will stop mistakes. And some help too.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not touch monastery traditions.",
                response = "Traditions are fine until medicine is mistaken for poison.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed the pilgrims.",
                response = "Holy folk eat like anyone else. Sometimes even more.",
                statDeltas = fixed_array(0, 15, 0, 0, 10, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Admit only those who bring their own food.",
                response = "The city keeps grain. Pilgrims keep resentment.",
                statDeltas = fixed_array(0, -8, 0, 0, -3, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Organize cheap porridge.",
                response = "Thin but honest. Good enough for pilgrims.",
                statDeltas = fixed_array(0, 8, 0, -5, 5, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims enter the city. Among them one can hide spies, killers, and deserters.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Search all pilgrims.",
                response = "Safer. But holiness will wait in line for inspection.",
                statDeltas = fixed_array(0, -8, 10, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let all pass unchecked.",
                response = "Open gates are loved by more than the faithful.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Search only armed men.",
                response = "A compromise. Not perfect, but livable.",
                statDeltas = fixed_array(0, 3, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Return the lands to the church.",
                response = "The altar grows richer. The throne — more grateful or weaker.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the lands for the crown.",
                response = "The land stays yours. So do the curses.",
                statDeltas = fixed_array(0, -20, 0, 10, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Return only part.",
                response = "Half a concession is often better than full war.",
                statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the market and take a toll.",
                response = "Faith brings buyers. The crown takes the coins.",
                statDeltas = fixed_array(0, -5, 0, 20, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Allow the market without toll.",
                response = "Rare generosity. Merchants will pray for you.",
                statDeltas = fixed_array(0, 8, 0, -5, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban the market by the temple.",
                response = "Holiness preserved. Profit passed by.",
                statDeltas = fixed_array(0, 5, 0, -10, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow penance instead of execution.",
                response = "The monastery gets sinners. I get a free day.",
                statDeltas = fixed_array(0, 12, -8, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute as sentenced.",
                response = "Faith came late. The axe — on time.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace execution with labor at monasteries.",
                response = "Sin will dig the earth. Almost poetic.",
                statDeltas = fixed_array(0, 5, -3, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban holy salve.",
                response = "Good sense beat fragrant lies.",
                statDeltas = fixed_array(0, -12, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow both salves.",
                response = "Let people choose between faith and stink. Amusing.",
                statDeltas = fixed_array(0, 5, 0, 5, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Inspect salves before sale.",
                response = "Inspection is the swindler's foe. So almost medicine.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Northerners in the capital ask to open their own temple. Your priests call it heresy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow a northern temple.",
                response = "The north will approve. Your priests will not.",
                statDeltas = fixed_array(0, -20, 0, 5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid it.",
                response = "Then northerners will see your faith outweighs hospitality.",
                statDeltas = fixed_array(0, 15, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow private prayers without a temple.",
                response = "Half-freedom. The north lives with it, but does not love it.",
                statDeltas = fixed_array(0, -5, 0, 3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Require soldiers to confess.",
                response = "Sin is named. Now it can be leashed.",
                statDeltas = fixed_array(0, 15, -10, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Confession voluntary only.",
                response = "Voluntary cleansing is slower, but cleaner.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the army alone.",
                response = "Then swords stay sharp. Souls stay dirty.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims sell their belongings for bread. Some already fall on the road to the temple.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Open a free kitchen.",
                response = "The road to the temple will be less deadly today.",
                statDeltas = fixed_array(0, 10, 0, 0, 18, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Sell them cheap bread.",
                response = "Not mercy, but help. Sometimes that is all there is.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Close the city to new pilgrims.",
                response = "The gates keep bread. And lose hearts.",
                statDeltas = fixed_array(0, -15, 0, 0, -5, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If the church declares giving to the crown a holy deed, people will bring coins themselves.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ask the church to declare a collection.",
                response = "When greed is blessed, it is called service.",
                statDeltas = fixed_array(0, 8, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Collect donations without the church.",
                response = "People give less when heaven does not frighten them.",
                statDeltas = fixed_array(0, 0, 0, 8, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not collect from the people.",
                response = "Mercy robbed the treasury again.",
                statDeltas = fixed_array(0, 0, 0, -10, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests want prayer before every parade. It turns the army into a church procession.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow prayers before inspection.",
                response = "Soldiers will stand longer. I hope enemies wait too.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid it.",
                response = "Good. Inspection should sound of steps, not psalms.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Prayer only before a campaign.",
                response = "Before death people tolerate long speeches.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow secret autopsies.",
                response = "Secret truth still heals better than open lies.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid autopsies.",
                response = "Then disease keeps its secrets.",
                statDeltas = fixed_array(0, 10, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Autopsy only bodies without kin.",
                response = "Cruel but useful. Like much in medicine.",
                statDeltas = fixed_array(0, -3, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In three days is the saint's feast. The temple asks a feast for the poor. The poor ask for feasts every day.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allocate food for the feast.",
                response = "The feast will be hearty. The next day ordinary.",
                statDeltas = fixed_array(0, 12, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Allocate half.",
                response = "Half a miracle. Not bad for the kitchen.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Bread stays. Gratitude leaves.",
                statDeltas = fixed_array(0, -10, 0, 0, -5, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik is forming a temple guard. For now sticks and robes. Later, swords.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid the temple guard.",
                response = "Good. One law and one guard in the city.",
                statDeltas = fixed_array(0, -15, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow the temple guard.",
                response = "Then the temple grows teeth. Do not be surprised if it bites.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Fold temple guard into the royal guard.",
                response = "Better in the ranks than against them.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Speak to the people more often.",
                response = "The throne must have a voice, or others speak for it.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the church speak for the crown.",
                response = "Convenient. But one day you will hear your orders in a stranger's voice.",
                statDeltas = fixed_array(0, 15, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bread after royal speeches.",
                response = "Good. Words go down better with bread.",
                statDeltas = fixed_array(0, 3, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church wants a book of faithful subjects. Those listed receive help first.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the book of the faithful.",
                response = "Ordered mercy beats chaotic mercy.",
                statDeltas = fixed_array(0, 15, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid dividing people by faith.",
                response = "You want equality where people seek chosenness.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Make the book voluntary.",
                response = "Voluntary entry is a soft door. Many will pass.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Those who argued with priests were barred from the monastery kitchen. They are hungry.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed all regardless of faith.",
                response = "This is the mercy I hoped to hear.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Feed only the faithful.",
                response = "Then soup becomes a test, not salvation.",
                statDeltas = fixed_array(0, 12, 0, 0, -10, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Create a royal kitchen apart from the monastery.",
                response = "Then the hungry need not choose between bread and conscience.",
                statDeltas = fixed_array(0, 0, 0, -10, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith's name.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forgive the debts.",
                response = "Faith loves forgiveness. The treasury does not.",
                statDeltas = fixed_array(0, 15, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand payment.",
                response = "Debt is holier than prayer if recorded well.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take payment in grain.",
                response = "Let their penance be edible.",
                statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests ask to stop executing deserters. Every soldier can repent, they say.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Stop executing deserters.",
                response = "Mercy in the barracks smells of mutiny.",
                statDeltas = fixed_array(0, 10, -15, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Continue executions.",
                response = "Order holds. Souls can catch up later.",
                statDeltas = fixed_array(0, -10, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace execution with hard service.",
                response = "A living coward with a shovel beats a dead one.",
                statDeltas = fixed_array(0, 5, 5, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Move the sick to infirmaries.",
                response = "They will rage. But survive more often.",
                statDeltas = fixed_array(0, -10, 0, 0, 18, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Open temple infirmaries.",
                response = "If the temple heals, let it learn to scrub floors.",
                statDeltas = fixed_array(0, 8, 0, -10, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave things as they are.",
                response = "Then we will all need a miracle.",
                statDeltas = fixed_array(0, 8, 0, 0, -18, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "During the fast fish costs more than meat. Merchants pray to the fast louder than priests.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Cap fish prices.",
                response = "The fast grows less luxurious for traders.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Merchants stay fed. People fast holily.",
                statDeltas = fixed_array(0, 0, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give salted fish from stores.",
                response = "Salty mercy. Wash it down if the water is clean.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Signs on the walls: 'A king without blessing is no king.' This is no longer a whisper.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Erase signs and arrest the writers.",
                response = "Walls grow clean. People grow careful.",
                statDeltas = fixed_array(0, -8, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Answer with a public speech.",
                response = "Words against graffiti. Sometimes it works.",
                statDeltas = fixed_array(0, 0, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ask the church to condemn the signs.",
                response = "If the temple speaks, walls fall silent faster.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ask the church to dispel the rumor.",
                response = "Curses fear candles, especially paid ones.",
                statDeltas = fixed_array(0, 10, 0, -8, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid talk of the curse.",
                response = "A ban is a poor lid on a boiling pot.",
                statDeltas = fixed_array(0, 0, 8, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Mock the rumor publicly.",
                response = "Laughter cures fear. Not always faith.",
                statDeltas = fixed_array(0, -5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Grant the monopoly.",
                response = "Candles will burn. So will coins.",
                statDeltas = fixed_array(0, 5, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid the monopoly.",
                response = "A free market in candles. How nobly dull.",
                statDeltas = fixed_array(0, 0, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Set a royal price on wax.",
                response = "You spoil profit but call it order.",
                statDeltas = fixed_array(0, 3, 0, 8, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I received a list of suspected heretics. Half the names in another's hand, half in a trembling one.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Begin arrests.",
                response = "The list grows shorter. Fear grows longer.",
                statDeltas = fixed_array(0, 15, 8, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Verify the list.",
                response = "A rare night when paper outlives the axe.",
                statDeltas = fixed_array(0, -5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Burn the list.",
                response = "Fire works for me today.",
                statDeltas = fixed_array(0, -15, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some sick stopped buying remedies. A priest told them to pray and endure.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Order temples not to hinder healing.",
                response = "Thank you. Disease is glad when you treat it instead of telling patients to endure.",
                statDeltas = fixed_array(0, -10, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Support the church.",
                response = "Then let prayers break the fever. I will watch.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow both prayer and medicine.",
                response = "Let them heal with everything at once. Sometimes desperation helps.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your priests want to ride north to preach. My prince will call it meddling.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the mission.",
                response = "The north does not love foreign prayers. Especially from the south.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid the mission.",
                response = "My prince will value your caution.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Send only healer-monks.",
                response = "A healer passes where a preacher meets spears.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Agree to a temple coronation.",
                response = "Now your crown will shine with gold and godly fear.",
                statDeltas = fixed_array(0, 25, -5, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Then the temple will be silent. But silence in the temple carries far.",
                statDeltas = fixed_array(0, -25, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hold a small rite without a new coronation.",
                response = "Not full victory for the altar. But a step toward it.",
                statDeltas = fixed_array(0, 10, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "City poor are angry: pilgrims are fed while locals starve. Mercy became envy.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed city dwellers first.",
                response = "Save the house before the guests. That is clear.",
                statDeltas = fixed_array(0, -5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Feed all equally.",
                response = "Hard, costly, right.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Feed only pilgrims at the temple.",
                response = "Then the city will think faith came for others.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tax the shops.",
                response = "Fairness finally brought coins.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave shops tax-free.",
                response = "Holiness is cheaper for the temple than the treasury again.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Introduce a small tax.",
                response = "A small sting. Perhaps the temple will not scream.",
                statDeltas = fixed_array(0, -3, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Young fanatics want to join the army. They are brave but ignore orders when they hear 'heresy'.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept them.",
                response = "Bravery gained. Discipline in question.",
                statDeltas = fixed_array(0, 8, 15, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse the fanatics.",
                response = "Better fewer soldiers than a crowd with swords and songs.",
                statDeltas = fixed_array(0, -10, -5, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Form a separate church unit under army oversight.",
                response = "I will keep them close. And far from decisions.",
                statDeltas = fixed_array(0, 5, 10, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some priests say women must not treat men. Today three refused my help.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid such preaching.",
                response = "Thank you. Disease does not choose healers by sex.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Let pride bandage their wounds.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Assign women healers only to women and children.",
                response = "Conceding to prejudice rarely saves a life.",
                statDeltas = fixed_array(0, 5, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Tax monastery beer.",
                response = "Beer grows costly. Prayers grow irritable.",
                statDeltas = fixed_array(0, -8, -3, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave it untaxed.",
                response = "Soldiers will drink to the church's health.",
                statDeltas = fixed_array(0, 8, 5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take part of the beer for the army.",
                response = "Holy beer in the barracks. I have seen that before brawls.",
                statDeltas = fixed_array(0, -5, 10, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A young priest says the king must listen only to the church. The crowd applauds.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Arrest the priest.",
                response = "The crowd sees force. And remembers the arrested face.",
                statDeltas = fixed_array(0, -15, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Summon him to talk.",
                response = "Softer. But he may take softness for weakness.",
                statDeltas = fixed_array(0, 3, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ignore.",
                response = "Unanswered words often grow.",
                statDeltas = fixed_array(0, 5, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik proposes a church council at court. Robed advisers will speak for people and gods.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Create the church council.",
                response = "You let the altar into the throne room. Harder to remove.",
                statDeltas = fixed_array(0, 20, -5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Priests stay outside. And speak louder.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow one church representative.",
                response = "One robe is lighter than a council. Until it speaks for all.",
                statDeltas = fixed_array(0, 8, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church proposes a luxury tax. Money for the poor — through temple hands, of course.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Levy through the church.",
                response = "The rich will hate us both. The poor will eat.",
                statDeltas = fixed_array(0, 15, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Levy through the crown.",
                response = "You took mercy from church hands. Bold.",
                statDeltas = fixed_array(0, -5, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Luxury untouched. So is hunger.",
                statDeltas = fixed_array(0, -8, 0, 3, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Leave beggars at the altar.",
                response = "Prayer beside poverty is honester.",
                statDeltas = fixed_array(0, -3, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Move beggars outside.",
                response = "The temple grows prettier. And colder.",
                statDeltas = fixed_array(0, 8, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Create a separate food handout after service.",
                response = "Good. Mercy should not block prayer, but stay near.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Fund the bell.",
                response = "The bell will ring. The treasury will empty.",
                statDeltas = fixed_array(0, 15, 0, -15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Silence is cheaper than silver.",
                statDeltas = fixed_array(0, -10, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bronze instead of silver.",
                response = "A poorer bell, still louder than my displeasure.",
                statDeltas = fixed_array(0, 5, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Order the army to fast.",
                response = "If the enemy strikes, we will throw prayers.",
                statDeltas = fixed_array(0, 15, -15, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Exempt the army from fasting.",
                response = "Thank you. A soldier with meat in his belly beats a holy skeleton.",
                statDeltas = fixed_array(0, -10, 12, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Fast only for officers.",
                response = "Officers suffer prettily. Rank and file eat.",
                statDeltas = fixed_array(0, 5, -3, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Pilgrims brought a new disease. Priests call it a trial. I call it plague.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Close the city to pilgrims.",
                response = "It saves the city. And angers those bound for the shrine.",
                statDeltas = fixed_array(0, -15, 0, 0, 20, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Screen pilgrims at the gates.",
                response = "Slow, but better than letting sickness in with hymns.",
                statDeltas = fixed_array(0, -3, 0, -8, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not hinder pilgrimage.",
                response = "Then the trial becomes mass.",
                statDeltas = fixed_array(0, 12, 0, 0, -20, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Fish for the fast is sold by the temple. Half already smells like a sermon after rain.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Seize spoiled fish.",
                response = "People lose supper but keep their guts.",
                statDeltas = fixed_array(0, -3, 0, 0, 12, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Allow sale after salting.",
                response = "Salt is not magic. Though merchants believe otherwise.",
                statDeltas = fixed_array(0, 0, 0, 0, -8, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Close the market by the temple.",
                response = "The stench leaves. So does profit.",
                statDeltas = fixed_array(0, -8, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Meet them with guards.",
                response = "Candles die fast. Anger does not.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Go out to them yourself.",
                response = "I will be near. If candles turn to torches, run first.",
                statDeltas = fixed_array(0, 3, -5, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bread and admit representatives.",
                response = "Bread cools hands better than water.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If the church names you pious, many will forget the coup. But the church gives no such gifts for free.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy a pious reputation.",
                response = "Reputation bought. Now hide the receipt.",
                statDeltas = fixed_array(0, 20, 0, -20, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Earn it by deeds.",
                response = "Slower. But stronger.",
                statDeltas = fixed_array(0, 5, 0, -10, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "I need no church reputation.",
                response = "Kings say that until the first sermon against them.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Bakers sell 'holy bread' triple the price. People buy from fear of disease.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban holy bread.",
                response = "You forbade fear as merchandise. Bold.",
                statDeltas = fixed_array(0, -8, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Tax holy bread.",
                response = "If people pay for fear, the crown gets a share.",
                statDeltas = fixed_array(0, -3, 0, 15, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow it but set a price.",
                response = "Controlled superstition. Almost state policy.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church demands burning books found with a scholar. They corrupt souls, they say.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Burn the books.",
                response = "Paper burns fast. Ideas — differently.",
                statDeltas = fixed_array(0, 15, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hide books in the royal archive.",
                response = "Secret fire can be deadlier than open flame.",
                statDeltas = fixed_array(0, -10, 0, -3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow reading after review.",
                response = "A rare book that lived to face judgment.",
                statDeltas = fixed_array(0, -5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Protect Sivil.",
                response = "Thank you. I am almost moved. Almost.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban her herbs.",
                response = "Let monks cure coughs with psalms.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow herbs through temple inspection.",
                response = "The temple will sniff my pouches. What honor.",
                statDeltas = fixed_array(0, 5, 0, -3, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Families from the north came to your gates. They flee war but pray to other gods.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept the refugees.",
                response = "The north will remember your mercy. Your priests too.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse them.",
                response = "Cold mercy. Almost northern.",
                statDeltas = fixed_array(0, 10, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Accept if they live apart.",
                response = "Half-shelter. Better than the road, worse than home.",
                statDeltas = fixed_array(0, -5, 0, -5, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Foreign gods are worshipped in the city. Leave it and heresy moves from cellars to the market.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid foreign rites.",
                response = "Purity of faith needs a firm hand.",
                statDeltas = fixed_array(0, 20, 5, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow private rites.",
                response = "Quiet heresy is still heresy. But quiet.",
                statDeltas = fixed_array(0, -8, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Tolerance enters as a guest and stays as host.",
                statDeltas = fixed_array(0, -15, 0, 5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A village accused a woman of witchcraft. Her house burned without trial. Children sleep on ash.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Punish the guilty.",
                response = "Justice was late, but came.",
                statDeltas = fixed_array(0, -10, 5, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Help the children and leave the village.",
                response = "Softly. Sometimes softness saves more than punishment.",
                statDeltas = fixed_array(0, 0, 0, -8, 12, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Then ash becomes law.",
                statDeltas = fixed_array(0, 5, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Print simple prayer books cheaply and the people stay busy with faith and the treasury with income.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Print prayer books.",
                response = "Fine. Paper that brings faith and coins.",
                statDeltas = fixed_array(0, 10, 0, 12, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give them free.",
                response = "Free faith. A costly idea.",
                statDeltas = fixed_array(0, 12, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Spend no paper on prayers.",
                response = "Paper stays for taxes. A steadier genre.",
                statDeltas = fixed_array(0, -8, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A priest told soldiers not to touch fugitives in sanctuary. It undermines command.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Support the priest.",
                response = "Then soldiers will look to the altar before every order.",
                statDeltas = fixed_array(0, 12, -12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Support the army.",
                response = "Good. Orders from above, not from the side.",
                statDeltas = fixed_array(0, -12, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Sanctuary for three days only.",
                response = "Three days is tolerable. On the fourth I take the fugitive myself.",
                statDeltas = fixed_array(0, 5, 5, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests oppose new graves outside the walls. The ground is unconsecrated. The old cemetery is full.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Consecrate new ground and bury there.",
                response = "At last sense and faith do not fight.",
                statDeltas = fixed_array(0, 5, 0, -5, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Bury outside without consecration.",
                response = "The dead need earth. The living need safety.",
                statDeltas = fixed_array(0, -12, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep using the old cemetery.",
                response = "Then the old graveyard returns disease to us.",
                statDeltas = fixed_array(0, 8, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Temples open kitchens but cook poorly. If people poison themselves on holy stew, they will blame you.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Send palace cooks to train temples.",
                response = "I will teach them not to kill with soup.",
                statDeltas = fixed_array(0, 5, 0, -8, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Close temple kitchens.",
                response = "People hunger more but visit healers less.",
                statDeltas = fixed_array(0, -12, 0, 0, 8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Leave as is.",
                response = "Then let god bless their pots. They will need it.",
                statDeltas = fixed_array(0, 5, 0, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The temple bell rings at night. People wake, soldiers fret, the sick cannot sleep.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid night ringing.",
                response = "Night grows quiet. Priests louder by day.",
                statDeltas = fixed_array(0, -10, 3, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Keep the ringing.",
                response = "The city will pray instead of sleep.",
                statDeltas = fixed_array(0, 10, -3, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ring only in danger.",
                response = "Good. The bell becomes signal, not torture.",
                statDeltas = fixed_array(0, 3, 5, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If you stand too often beside Malrik, people stop seeing the king. They see a man in the priest's shadow.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Appear with Malrik more often.",
                response = "Holiness will cover you. And hide you too.",
                statDeltas = fixed_array(0, 15, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Appear apart from the church.",
                response = "The throne needs its own silhouette.",
                statDeltas = fixed_array(0, -8, 5, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Appear together only on great feasts.",
                response = "Rarity makes the alliance stronger. And safer.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    )
)


let public allEncountersEnLateB : Encounter[POOL_LATE_B_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I propose every official swear loyalty not only to the crown but to the true faith.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Institute the oath of faith.",
                response = "Power will kneel twice: before throne and altar.",
                statDeltas = fixed_array(0, 20, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Oath to crown alone.",
                response = "The throne wants loyalty without soul. Dangerous thrift.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Voluntary faith oath.",
                response = "Voluntary piety often becomes mandatory on its own.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People confess petty thefts of food. Priests want to give names to guards.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid passing names.",
                response = "Confession stays refuge, not trap.",
                statDeltas = fixed_array(0, 5, -5, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give thieves' names.",
                response = "Then people stop confessing. And start staying silent.",
                statDeltas = fixed_array(0, -8, 8, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Report only dangerous criminals.",
                response = "That resembles justice. It is rarely simple.",
                statDeltas = fixed_array(0, 3, 5, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Old temples need repair. If roofs fall, priests blame the crown. If you pay, the treasury falls.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay for repairs.",
                response = "Roofs saved. My soul — not.",
                statDeltas = fixed_array(0, 15, 0, -18, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Repair only main temples.",
                response = "Selective holiness. Cheaper than full.",
                statDeltas = fixed_array(0, 8, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let temples repair themselves.",
                response = "Treasury dry. Temples perhaps not.",
                statDeltas = fixed_array(0, -12, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wants relics with the army. If the enemy takes the train, it is disgrace.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Take relics with the army.",
                response = "Soldiers march bolder. The train becomes a target.",
                statDeltas = fixed_array(0, 15, 5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave relics in the capital.",
                response = "Right. War hauls enough already.",
                statDeltas = fixed_array(0, -10, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take copies of relics.",
                response = "Fakes for courage. Strange, but easier to guard.",
                statDeltas = fixed_array(0, 5, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Priests say quarantine denies prayer. They demand quarantine houses opened.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Keep quarantine.",
                response = "Thank you. Disease hates closed doors.",
                statDeltas = fixed_array(0, -15, 0, 0, 20, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let priests into quarantine.",
                response = "They enter to the sick. I hope they leave without plague.",
                statDeltas = fixed_array(0, 8, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Open quarantine houses.",
                response = "Then the city gets freedom of disease.",
                statDeltas = fixed_array(0, 15, 0, 0, -25, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If the church declares a winter fast, we need more fish and turnip. Less meat, but people will hate the cold more.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Stock for the fast.",
                response = "Winter will be holy and smell of turnip.",
                statDeltas = fixed_array(0, 8, 0, -12, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Do not support the winter fast.",
                response = "People eat better. Priests preach worse.",
                statDeltas = fixed_array(0, -10, 0, 0, 5, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Fast only for the rich.",
                response = "A rare miracle: the rich suffer first.",
                statDeltas = fixed_array(0, 5, 0, 0, 8, 0, 0, 8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A guard confessed bribes to a priest. The priest will not give his name.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Respect confession secrecy.",
                response = "Guards learn the temple is above law. A dangerous lesson.",
                statDeltas = fixed_array(0, 12, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand the name.",
                response = "Good. Bribes hide poorly when confession is no shield.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Amnesty for those who confess themselves.",
                response = "A soft trap. Sometimes the best.",
                statDeltas = fixed_array(0, 5, 5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church feeds the poor, heals the sick, judges sinners, and says who deserves the throne. What remains for the king?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Return some duties to the crown.",
                response = "The throne visible again. The temple offended.",
                statDeltas = fixed_array(0, -15, 8, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the church strong.",
                response = "Rule is easy — while church wants what you want.",
                statDeltas = fixed_array(0, 20, -10, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Divide duties in writing.",
                response = "A fragile pact beats solid hatred.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, some priests think you a temporary punishment of the gods. I can silence them.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Make them silent.",
                response = "Silence bought with fear. Fear serves too.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them speak.",
                response = "The temple becomes a market of opinions. Dangerous.",
                statDeltas = fixed_array(0, -5, 0, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Name them.",
                response = "You would heal faith with the sword. Sometimes that scars the throne.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People ask a service for the former king's soul. Forbid it — cruel. Allow it — dangerous.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the service.",
                response = "The dead sometimes calm the living.",
                statDeltas = fixed_array(0, 8, -5, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid the service.",
                response = "Memory will not vanish. It goes to the cellar.",
                statDeltas = fixed_array(0, -8, 8, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow without the former king's name.",
                response = "A compromise for those who fear even dead names.",
                statDeltas = fixed_array(0, 3, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "New coin may bear your profile or a church symbol. One strengthens the throne, the other people's trust.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "The king's profile.",
                response = "The coin will look at the people with your face.",
                statDeltas = fixed_array(0, -8, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "A church symbol.",
                response = "Holy coin spends as fast, but argued over less.",
                statDeltas = fixed_array(0, 12, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Both sides: crown and altar.",
                response = "A two-faced coin. Honest for politics.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik wants a priest on the war council. I do not discuss flanks with a man who believes in miracles.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow the priest on council.",
                response = "Then let him pray not to interfere.",
                statDeltas = fixed_array(0, 12, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Forbid it.",
                response = "Good. The map stays a map, not an icon.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow without a vote.",
                response = "Let him listen. I still tolerate silence.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Women go to the temple to give birth for promised blessing. There are no clean linens.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Forbid births in the temple.",
                response = "Children will be born in cleanliness, not candle smoke.",
                statDeltas = fixed_array(0, -10, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Equip a temple birthing room.",
                response = "If they go to the temple, let it wash its hands.",
                statDeltas = fixed_array(0, 8, 0, -10, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere.",
                response = "Blessing beside infection.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The temple wants the best wine for service. Soldiers want the same without service.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give wine to the temple.",
                response = "The holy cup full. Soldiers' mugs empty.",
                statDeltas = fixed_array(0, 10, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give wine to the army.",
                response = "Soldiers drink to your health. The temple against it.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Dilute the wine and share.",
                response = "All get less than wanted. So, fair.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "During service by the temple a man with a knife was caught. He says he meant to kill not you but Malrik.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Hand him to the church.",
                response = "The temple tries an attack on the temple. Convenient for them.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Try him in royal court.",
                response = "Good. A knife in the capital is the crown's business.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Interrogate in secret.",
                response = "If he sought Malrik, we should learn who sent him.",
                statDeltas = fixed_array(0, -3, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People now fear the royal sword and church curse. Together they hold order. Together they can break the realm.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Use both fears.",
                response = "Order strong as a cage.",
                statDeltas = fixed_array(0, 10, 10, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Soften royal punishments.",
                response = "The throne less fearsome. Risk and hope.",
                statDeltas = fixed_array(0, 3, -8, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Limit church curses.",
                response = "You took thunder from the temple. Now await lightning.",
                statDeltas = fixed_array(0, -12, 5, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If you keep quarreling with the temple, some priests may refuse you prayers. The people will hear that as verdict.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Yield to the temple.",
                response = "Prayers continue. Peace costs less than schism.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Threaten the temple.",
                response = "You may frighten a priest. Not the faith behind him.",
                statDeltas = fixed_array(0, -20, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Negotiate.",
                response = "Talk is a thin bridge. We are still on it.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I opened monastery stores without Malrik's leave. People ate. Now I may be punished.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Protect Arvel.",
                response = "Thank you. I feared not punishment but your order to close the doors.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Return him to church judgment.",
                response = "I accept judgment. But the hungry will wait again.",
                statDeltas = fixed_array(0, 12, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Make him return the grain.",
                response = "Then I take bread from hands that already thanked us.",
                statDeltas = fixed_array(0, 5, 0, 0, -15, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Malrik hints a large gift will speed the church's official recognition of your rule.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay.",
                response = "Congratulations. Blessing is a premium product.",
                statDeltas = fixed_array(0, 25, 0, -25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse to pay.",
                response = "Treasury saved. Heaven can wait.",
                statDeltas = fixed_array(0, -15, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Offer grain instead of gold.",
                response = "Holy recognition for sacks of grain. Almost honest.",
                statDeltas = fixed_array(0, 12, 0, 0, 3, 0, 0, -15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church no longer merely prays. It feeds, judges, heals, collects gold, and says who deserves the throne. Little remains before the ninetieth day. You must decide what it becomes.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "The church will be the throne's pillar.",
                response = "The throne gains a holy pillar. And holy dependence.",
                statDeltas = fixed_array(0, 25, -10, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The church will be subject to the crown.",
                response = "You chose force. Now the temple may choose resistance.",
                statDeltas = fixed_array(0, -25, 15, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Church and crown will share power.",
                response = "Balance is reached. Who breaks it first remains to be seen.",
                statDeltas = fixed_array(0, 10, 5, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Weaken the church through royal aid to the people.",
                response = "If the people eat from your hand, they kiss another less often.",
                statDeltas = fixed_array(0, -10, 0, -10, 20, 0, 0, -15, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    )
)


let public allEncountersEnPeople : Encounter[POOL_PEOPLE_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The people whisper the word 'usurper'. But if the church performs a rite of purification of the crown, the whisper will become a prayer.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Carry out an expensive ritual.",
                response = "The gods love humility. And the people love to see the king bow his head.",
                statDeltas = fixed_array(5, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Perform a modest ceremony.",
                response = "Modesty is also a virtue. Although gold shines more convincingly.",
                statDeltas = fixed_array(2, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The crown doesn't need prayers.",
                response = "The throne without blessing stands high, but sways more.",
                statDeltas = fixed_array(-5, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What does the church want in return?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Little. Return the grain warehouses to the temple. We will feed souls and bodies, and you will get silence on the streets.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Return the warehouses to the temple.",
                response = "Wise. Bread given to the temple is returned through prayer.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Give away only part of the grain.",
                response = "Half mercy is still better than complete pride.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -7, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Then let the crown itself answer hunger prayers.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, there is more cobwebs in the treasury than gold. A temporary tax on city gates can be introduced.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Implement the tax immediately.",
                response = "Wonderful. The gate will finally begin to bring in more than a draft.",
                statDeltas = fixed_array(-5, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Introduce a tax only for merchants.",
                response = "Merchants will complain. But they even complain about the sun if it shines freely.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Don't touch the gate.",
                response = "Free trade is a noble idea. It’s a pity that she doesn’t give out coins right away.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Find another source of income.",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "You can sell some of the royal jewelry. Jewels are beautiful, but dead. At least the treasury is breathing.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Sell ​​secretly.",
                response = "No one will notice. Except for those who counted the stones on the crown.",
                statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Sell ​​publicly, as a sacrifice for the sake of the people.",
                response = "Good move. Poverty looks better when it is called a virtue.",
                statDeltas = fixed_array(3, 0, 0, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't sell.",
                response = "Greatness will remain intact. Treasury - no.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In the lower city there is fever and cough. It could be a cold, or it could be the beginning of a pestilence. We need to act now.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Close the block for quarantine.",
                response = "Cruel, but reasonable. Sometimes a door saves more lives than a sword.",
                statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Send healers and leave the gates open.",
                response = "We'll do what we can. But disease loves the open road.",
                statDeltas = fixed_array(8, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't cause panic.",
                response = "Panic kills quickly. Illness is more patient.",
                statDeltas = fixed_array(-20, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How serious is it?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "So far three have died. If this is what I fear, in a week we will not be counting people, but streets.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Quarantine only infected streets.",
                response = "This will give us time. And time is the best medicine after clean water.",
                statDeltas = fixed_array(12, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Burn down infected houses.",
                response = "Fire will stop the disease. But people will remember the smoke.",
                statDeltas = fixed_array(20, 0, 0, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Hide news.",
                response = "Secrets don't cure fever. She's just waiting until it's too late.",
                statDeltas = fixed_array(-15, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The nobles are waiting for the first royal feast. But if I set the table properly, the city barns will lose weight.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Have a luxurious feast.",
                response = "The feast will be such that the guests will forget hunger. True, the city is not.",
                statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Have a modest feast.",
                response = "A modest feast is when the nobles still eat, but complain more quietly.",
                statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Call off the feast and give the food to the poor.",
                response = "The bread below will be more appreciated than the peacock above.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Is it possible to deceive guests?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Can. Cheap meat, expensive sauce, a lot of candles - and half of the guests will decide that they ate something rare.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Make a cheap feast disguised as a luxurious one.",
                response = "I love it when royal wisdom smells of garlic and deceit.",
                statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "No, the feast must be real.",
                response = "It will be real. And hunger after it too.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Cancel the feast altogether.",
                response = "Then I'll save the meat. In our time, this is almost high treason.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the coup, the palace is full of strangers. I ask that the night watch be doubled. It's expensive, but you'll sleep longer.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Double the guards.",
                response = "Fine. The night will become more expensive, but safer.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Supply only proven soldiers.",
                response = "Fewer people, more trust. I can work with this.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't waste money on fears.",
                response = "Then let's hope that fears don't waste their knives either.",
                statDeltas = fixed_array(-2, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Who do you suspect?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Servants of the former king. Not everyone. But one with a key is enough for the door to become a grave.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Replace servants with soldiers.",
                response = "The palace will become rougher, but the doors will obey.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Check on the servants secretly.",
                response = "A quiet check catches more truth than a loud order.",
                statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave them.",
                response = "Then I will look into their hands. Especially when they bring you wine.",
                statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Everyone will remember the first decree of the new king. It should be simple. Grace, tax or sword?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Reduce the price of bread.",
                response = "Bread is the quietest way to tell the people that the king still needs it.",
                statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Increase tax collection.",
                response = "The treasury will come to life. People may be the opposite.",
                statDeltas = fixed_array(-10, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Announce recruitment into the army.",
                response = "There will be more swords. There are fewer hands in the fields.",
                statDeltas = fixed_array(0, 0, 15, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Don't issue a decree yet.",
                response = "Sometimes silence is wise. But in the early days of the throne, it is often mistaken for weakness.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Six deserters were captured. They say that they fled not from fear, but from hunger. The army is watching what you do.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Execute them publicly.",
                response = "Cruel. But tomorrow no one will run first.",
                statDeltas = fixed_array(-5, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Return them to duty after punishment.",
                response = "They will limp, but serve. It's better than hanging.",
                statDeltas = fixed_array(-2, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Have mercy and feed.",
                response = "Mercy is good at the hearth. In the barracks she smells of weakness.",
                statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Why are soldiers starving?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because quartermasters steal. War always feeds rats - in barns and in uniforms.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Hang the quartermasters.",
                response = "After this, grain will begin to be counted more honestly.",
                statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Force them to return what they stole.",
                response = "Fine. Let their greed at least feed the soldiers.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Hide the scandal.",
                response = "Hidden rot still smells. Just later.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People are sick not only with their bodies, but also with fear. Allow churches to hold night services. Crowds will come to pray.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow services.",
                response = "People will leave with a prayer on their lips. Sometimes that's enough to get you through the night.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -3, 0)
            ),
            DialogueChoice(
                choiceText = "Ban large gatherings.",
                response = "You save bodies. I hope the souls will wait.",
                statDeltas = fixed_array(10, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Services are only in open areas.",
                response = "The sky is also the vault of the temple. The gods will hear.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the church pay for security itself.",
                response = "The church will pay. And he will remember that the king is counting candles.",
                statDeltas = fixed_array(2, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "You can issue a new coin with your face on it. If you add less silver, the treasury will benefit. People won't notice right away.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Mint an honest coin.",
                response = "Expensive, but beautiful. Honesty always costs more than copper.",
                statDeltas = fixed_array(5, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Dilute silver with copper.",
                response = "The coin will become lighter. As does the conscience of those who spend it.",
                statDeltas = fixed_array(-8, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Set aside minting.",
                response = "The old coins will continue to circulate. Along with the old memory.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Who will know about the fake?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Masters of the Mint. But silence is worth less than silver.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay the masters and dilute the coin.",
                response = "Good deal. Bad coin. Great policy.",
                statDeltas = fixed_array(-8, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't take risks.",
                response = "Caution rarely fills chests, but sometimes saves heads.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Arrest the masters.",
                response = "Silence will become reliable. And very scared.",
                statDeltas = fixed_array(-5, 0, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "You haven't slept for three nights. If you collapse, the palace will begin to share power without you. You need rest.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Cancel appointments for the day.",
                response = "A living king is better than a busy dead one.",
                statDeltas = fixed_array(3, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Continue working.",
                response = "Then at least fall next to the chair to make it easier to lift you up.",
                statDeltas = fixed_array(-5, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take a strengthening potion.",
                response = "It will help. But don't confuse cheerfulness with healing.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What's in the potion?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Herbs, honey and a little something to get your heart pumping. After it comes weakness.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Drink anyway.",
                response = "You bought a day of strength at the price of tomorrow's trembling.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give up and go to bed.",
                response = "Finally an order that doesn't harm the body.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give the potion to officials and messengers.",
                response = "They will run faster. And then they will fall together.",
                statDeltas = fixed_array(-5, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some of the grain in the western barn was covered with gray mold. If we throw it away, there will be less food. If we cook it stronger, maybe no one will die.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Throw away spoiled grain.",
                response = "Sorry for the grain. But the dead eat even less.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Use for soldier's porridge.",
                response = "The soldiers will notice. Especially those who run to the bucket.",
                statDeltas = fixed_array(-10, 0, -5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Mix with good things and give to the poor.",
                response = "The poor are accustomed to the worst. But this does not mean that their stomachs are iron.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Can some be saved?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "A third can be dried. The rest is only suitable for rats, and even evil ones.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Save a third, throw the rest away.",
                response = "Reasonable. Not generous, not stupid. Rare recipe.",
                statDeltas = fixed_array(7, 0, 0, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Save everything and take risks.",
                response = "Then I'll have it prepared next to the infirmary.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Throw everything away.",
                response = "A clean barn is better than a full grave.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A crowd gathered at the palace gates. They are not armed, but they demand bread and an answer: who rules them now?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Go out to them in person.",
                response = "A bold move. I'll put people close, but not too noticeable.",
                statDeltas = fixed_array(10, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute bread through the guards.",
                response = "Bread speaks more simply than a king. Sometimes even more convincing.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Disperse the crowd.",
                response = "It will be done. But bruises can also remember.",
                statDeltas = fixed_array(-15, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Say that the king is busy.",
                response = "Then they will decide that you are not busy with them.",
                statDeltas = fixed_array(-8, 0, 0, 2, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The church can open its barns to the poor. But the decree should say that this was done out of our mercy.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Agree and praise the church.",
                response = "Mercy loves witnesses. Today the whole city will become them.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Help must come in the name of the king.",
                response = "The crown wants glory even for someone else's bread. Well, this is also hunger.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse church help.",
                response = "Pride is rarely satisfying.",
                statDeltas = fixed_array(-10, 0, 0, 3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Share the glory.",
                response = "Let the people give thanks to both the throne and the altar. It's safer for everyone.",
                statDeltas = fixed_array(7, 0, 0, 0, 0, 0, 0, 7, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In the houses of executed supporters of the past king, silver, paintings, and horses remained. By law, everything can be taken away.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Take everything to the treasury.",
                response = "The dead don't need luxury. Very lively treasury.",
                statDeltas = fixed_array(-5, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take only weapons and coins.",
                response = "Moderately. I'm almost upset at your decency.",
                statDeltas = fixed_array(0, 0, 5, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave some property to families.",
                response = "Mercy is dear. But sometimes revenge is cheaper.",
                statDeltas = fixed_array(8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not touch the houses of the dead.",
                response = "Nice gesture. The treasury will not appreciate him, but widows may.",
                statDeltas = fixed_array(10, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In the city they drink from a canal where waste is dumped. If the water is not purified, the disease will return stronger.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allocate money to clean wells.",
                response = "Clean water will save more people than a dozen sermons and a hundred executions.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Make residents clean for free.",
                response = "They will be angry. But at least be angry with the living.",
                statDeltas = fixed_array(10, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't spend any money yet.",
                response = "Then the disease has already received your first gift.",
                statDeltas = fixed_array(-20, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the army help.",
                response = "Soldiers with shovels are more useful than soldiers with clubs. They'll hate it though.",
                statDeltas = fixed_array(15, 0, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The army eats better than city children. I can dilute the soldiers' stew and send the grain to shelters.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Thin the stew.",
                response = "The children will eat. The soldiers curse. A typical day in the kitchen.",
                statDeltas = fixed_array(10, 0, -10, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Don't touch the soldiers' rations.",
                response = "The soldiers will be well fed. Shelters will smell like empty bowls.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Only dilute the officer's kitchen.",
                response = "The officers will notice first. They always notice when they suffer, almost like humans.",
                statDeltas = fixed_array(5, 0, -3, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Will the soldiers notice?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Privates - not right away. Officers - after the first spoon. Their tongue is more spoiled than their conscience.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Take some of the officers' supplies.",
                response = "Finally a dish that I enjoy cooking.",
                statDeltas = fixed_array(5, 0, -5, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Take from everyone equally.",
                response = "Fair. This means that everyone will be unhappy.",
                statDeltas = fixed_array(8, 0, -10, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Leave everything as is.",
                response = "A well-fed sword is better than a hungry one. But children don't eat swords.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the coup, residents were left with a lot of weapons. If you collect it, it will become calmer. If not, every basement can become a fortress.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Collect all weapons.",
                response = "The city will become quieter. Not necessarily calmer.",
                statDeltas = fixed_array(-10, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow weapons only to guilds and guards.",
                response = "Compromise. Firm enough not to fall apart right away.",
                statDeltas = fixed_array(0, 0, 8, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't touch people.",
                response = "They will appreciate the trust. Or they will use it.",
                statDeltas = fixed_array(8, 0, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Buy back weapons.",
                response = "Coins instead of searches. Expensive, but with less shouting.",
                statDeltas = fixed_array(5, 0, 10, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some old ministers are ready to serve you. They are experienced, but their hands smell of the past throne.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Bring them back to the council.",
                response = "The experience will return. Along with old habits.",
                statDeltas = fixed_array(0, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave only the most useful ones.",
                response = "Fine. Old knives can be used if you hold them by the handle.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Expel everyone.",
                response = "Clean table. Empty table. The difference will be noticeable tomorrow.",
                statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them take a public oath.",
                response = "Vows don't change hearts. But tongues are tied.",
                statDeltas = fixed_array(3, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "We need new people. The villages are full of tough guys. The fields will wait if the throne falls.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Take recruits by force.",
                response = "The army will grow quickly. Fields will miss the hands.",
                statDeltas = fixed_array(-10, 0, 25, 0, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Take volunteers for a fee.",
                response = "Slower, but cleaner. The volunteer looks back less.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do not touch the villages until the harvest.",
                response = "Bread defeated the sword. I hope the enemy likes to wait too.",
                statDeltas = fixed_array(0, 0, -10, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Take criminals instead of peasants.",
                response = "Bad people sometimes make good shields.",
                statDeltas = fixed_array(-5, 0, 8, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People will forgive a lot if the king bows his head to the gods. Not in front of people. Before the gods.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Repent for the blood of the coup.",
                response = "Humility strengthens the soul. Although the soldiers love him less.",
                statDeltas = fixed_array(10, 0, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Say that blood was needed.",
                response = "The sword will like your words. The altar will remain silent.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the temple make a speech on my behalf.",
                response = "The Church knows how to speak where it is dangerous for the king.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse to repent.",
                response = "A proud neck looks good under a crown. And under the ax too.",
                statDeltas = fixed_array(-10, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Doctors demand payment for work in the lower city. If we don't pay, they will leave to treat the rich.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay doctors in full.",
                response = "Dear mercy. But living taxpayers are more useful than dead ones.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Pay half.",
                response = "Half the pay is half the effort. Sometimes this is enough.",
                statDeltas = fixed_array(8, 0, 0, -7, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Order treatment for free.",
                response = "Great for the treasury. Dangerous for patients.",
                statDeltas = fixed_array(-5, 0, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow patients to be charged.",
                response = "The treasury will sigh. Poor people might stop.",
                statDeltas = fixed_array(-15, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Bodies are still being found on the streets after the night of the coup. If they are not buried quickly, the city will become sick.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Organize a general funeral.",
                response = "The dead don't care anymore. Alive - no.",
                statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Burn the bodies outside the city.",
                response = "Fast and safe. But they will remember the smell.",
                statDeltas = fixed_array(15, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the families pick up the bodies themselves.",
                response = "Families will suffer. The city is an infection.",
                statDeltas = fixed_array(-10, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hide bodies in old pits.",
                response = "The pits keep no secrets. They breed diseases.",
                statDeltas = fixed_array(-25, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If you distribute a little bread at the gate every day in the name of the king, people will begin to speak more softly. But bread doesn't appear out of thin air.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Distribute bread daily.",
                response = "People will wait for you not with stones, but with bowls. This is better.",
                statDeltas = fixed_array(20, 0, 0, 0, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute only to children and the sick.",
                response = "Less bread, more meaning. Good order.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute once, for show.",
                response = "Enough for appearance. For hunger - no.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Don't feed the old king's supporters.",
                response = "Hunger does not ask for whom the person shouted yesterday.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "We caught a messenger with a letter to the north. The letter is encrypted. He says he is bringing family news.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Torture the messenger.",
                response = "He will speak. The only question is whether it will be true.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Pay the clerks to do the decoding.",
                response = "Ink is sometimes more honest than blood.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let go, but follow up.",
                response = "Fine. Sometimes it is better to follow the thread than to break it.",
                statDeltas = fixed_array(0, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What do you think of the letter?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Family news is not encrypted with military code. If this letter is about an aunt, the aunt commands the fortress.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Decipher the letter.",
                response = "Reasonable. A dead messenger will not lead us to the sender.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute the messenger and burn the letter.",
                response = "The trail will disappear. Perhaps along with the answer.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Change the letter.",
                response = "Dangerous game. But the enemy can open the door himself.",
                statDeltas = fixed_array(0, 0, 8, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The city says you only rule because the general holds a sword at your back. We need to show who is the king here.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Review the army.",
                response = "The swords shine convincingly. But they cast long shadows.",
                statDeltas = fixed_array(0, 0, 10, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Try a corrupt official.",
                response = "Fine. Justice is louder than a parade if you choose the right square.",
                statDeltas = fixed_array(8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Enter the market without armor.",
                response = "Courage or recklessness. Sometimes people don't differentiate.",
                statDeltas = fixed_array(12, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't respond to rumors.",
                response = "Rumors love empty space. You left the hall for them.",
                statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The banners of the former king still hang in the barracks. The soldiers say it's a memory. I say it's doubt.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Burn the old banners.",
                response = "The flame quickly teaches which color is now the main one.",
                statDeltas = fixed_array(-5, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Put them in the archive.",
                response = "Soft. But at least they won't look at the soldiers anymore.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave it, but add my coat of arms.",
                response = "Compromise. Soldiers like clarity more.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Prohibit discussion of the former king.",
                response = "Prohibition does not kill memory. But he makes her speak in a whisper.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the kingdom cannot be saved by everyone at once. In the first month you need to choose what is more important: bread, sword, treasury or people's lives.",
            choiceCount = 5,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "First feed the city.",
                response = "Bread is a silent ally. As long as it exists, people are still listening.",
                statDeltas = fixed_array(10, 0, 0, -15, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "First strengthen the army.",
                response = "The sword will protect the throne. But it won't feed the city.",
                statDeltas = fixed_array(0, 0, 25, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "First fill the treasury.",
                response = "Gold will give time. The question is who will survive this time.",
                statDeltas = fixed_array(-10, 0, 0, 25, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Stop the disease first.",
                response = "Living subjects can still forgive. The dead only pursue the name.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Can you hold everything at once?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            )
            )
        ),
        DialogueNode(
            prompt = "You can try. But balance is not a gentle path. This is a rope over an abyss.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Distribute forces equally.",
                response = "Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.",
                statDeltas = fixed_array(7, 0, 7, 7, 0, 0, 0, 7, 0)
            ),
            DialogueChoice(
                choiceText = "No, first the army.",
                response = "Then let the soldiers remember that they are protecting the kingdom, not just your door.",
                statDeltas = fixed_array(0, 0, 20, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "No, health first.",
                response = "You chose life. Now we need to make sure that the living have something to live on.",
                statDeltas = fixed_array(20, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "My caravans can bring grain in just three days. But I want the exclusive right to sell bread in the capital.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give you a monopoly.",
                response = "Wise. The people will receive bread, and I will receive gratitude in coins.",
                statDeltas = fixed_array(-8, 0, 0, 10, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(
                choiceText = "Buy grain without a monopoly.",
                response = "You buy food, but not friendship. It's more expensive in the future.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "The crown will not depend on merchants.",
                response = "Proud crown. Let's see how proud hunger can be.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Why do you already have so much grain?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because I buy when others are praying. Villages were sold cheaply, Your Majesty. I was simply faster than your officials.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy back the grain at your price.",
                response = "It's nice to deal with a crown that understands the market.",
                statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Sell ​​it cheaper.",
                response = "Ah, royal trade: first the order, then the price.",
                statDeltas = fixed_array(0, 0, 3, -8, 0, 0, 0, 18, 0)
            ),
            DialogueChoice(
                choiceText = "Confiscate half.",
                response = "You will receive grain. And merchants who will begin to hide everything else.",
                statDeltas = fixed_array(-8, 0, 0, -5, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The prisons are full of supporters of the former king. If everyone is executed, the square will not have time to be cleaned.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Execute the main ones.",
                response = "Intelligent horror. It's easier to bear than slaughter.",
                statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute everyone.",
                response = "Then send more executioners. Or less conscience.",
                statDeltas = fixed_array(-20, 0, 20, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Send them to work.",
                response = "Living traitors are more useful than dead ones if you keep them under chain.",
                statDeltas = fixed_array(-5, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How many of them are real conspirators?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Less than half. But fear does not ask for proof. It works without them.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Execute only those proven.",
                response = "A rare case: justice and order did not fight to the death.",
                statDeltas = fixed_array(3, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Fear is more useful than truth.",
                response = "Fear will serve you. Until he finds a new owner.",
                statDeltas = fixed_array(-15, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The guilty are to be executed, the rest are to be sent to work.",
                response = "Nice section. Everyone will get their own ax and pickaxe.",
                statDeltas = fixed_array(-5, 0, 5, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Children are sleeping at the monastery gates. They ask not for gold, but for stew. May I open the royal reserves?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Distribute the stew to the children.",
                response = "Today they will fall asleep not from weakness, but from warmth. Thank you.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Give to all the poor.",
                response = "This is a favor that the city will remember with its stomach.",
                statDeltas = fixed_array(25, 0, 0, 0, 0, 0, 0, -25, 0)
            ),
            DialogueChoice(
                choiceText = "Let the monastery feed them itself.",
                response = "We'll try. But an empty bowl does not become full from prayer.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Why did they come to the monastery and not to the palace?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because the palace gates are guarded by spears, and the monastery gates are guarded only by old hinges. Hungry people go where they are not beaten.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Open the royal kitchen near the palace.",
                response = "Then people will see not the walls of the palace, but the hand of the king.",
                statDeltas = fixed_array(20, 0, 0, -5, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Donate the grain to the monastery.",
                response = "We will feed them without question. This is sometimes the best justice.",
                statDeltas = fixed_array(18, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Place a guard at the monastery.",
                response = "The guards will disperse the crowd. But not hunger.",
                statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I can prepare medicine for the lower city. It is bitter and smells like a swamp, but many will survive.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy medicine for all patients.",
                response = "Generous order. The swamp will be enough, and the sick - even more so.",
                statDeltas = fixed_array(25, 0, 0, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Buy for children only.",
                response = "The children will survive. Their parents might be grateful enough not to curse you out loud.",
                statDeltas = fixed_array(12, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let the patients pay themselves.",
                response = "As you wish. The disease rarely asks if a person has coins.",
                statDeltas = fixed_array(-15, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Why is it so expensive?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because the swamp lily blooms three nights a year. And also because I’m not going to die poor saving your poor.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay your price.",
                response = "Wise. Sometimes life is cheaper to buy than to mourn later.",
                statDeltas = fixed_array(25, 0, 0, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Reduce the price or I'll take the recipe by force.",
                response = "Ah, royal medicine. First the threat, then the treatment.",
                statDeltas = fixed_array(20, 0, 3, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Sell ​​the recipe to the crown.",
                response = "The recipe is yours. If your people confuse a lily with a nettle, don't invite me to the funeral.",
                statDeltas = fixed_array(18, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The army holds the throne, but the throne feeds the army poorly. Enter the military levy.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Introduce a fee for everyone.",
                response = "The soldiers will be well fed. The rest are careful.",
                statDeltas = fixed_array(-15, 0, 15, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Introduce a tax only from the rich.",
                response = "Less gold, less anger. Acceptable.",
                statDeltas = fixed_array(0, 0, 8, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse the army.",
                response = "The army knows how to wait. But he is bad at forgiving.",
                statDeltas = fixed_array(0, 0, -15, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How long will the army last without gathering?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Three weeks - with discipline. Five - with thefts. Seven - with rebellion. I'd rather not check the eighth.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Introduce a temporary fee for a month.",
                response = "Temporary orders often outlast kings. But now he is needed.",
                statDeltas = fixed_array(-8, 0, 10, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give the army grain instead of gold.",
                response = "Soldiers can be calmed down with bread. But not for long.",
                statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Let the army endure.",
                response = "Patience is a bad ration.",
                statDeltas = fixed_array(0, 0, -20, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If you bring the holy relics to the capital, people will forget their fear. But the road and security will be expensive.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Organize a procession.",
                response = "The city will see that the heavens are still looking in its direction.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Bring the relics without a holiday.",
                response = "The quiet shrine is less comforting, but also comforting.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't waste money on dice.",
                response = "Not all bones are dead to the people, Your Majesty.",
                statDeltas = fixed_array(-5, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do people really believe in these powers?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "People don't believe in dice. They believe that someone above them has not yet turned their back.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "May the relics arrive with honor.",
                response = "Hope will enter the city before the relic.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The church will pay half.",
                response = "Altar will split the price. And he will remember that the throne knows how to bargain.",
                statDeltas = fixed_array(10, 0, 0, -7, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace the procession with the distribution of bread.",
                response = "Bread is also a prayer if given on time.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "There are merchants ready to buy official positions. They will steal, of course. But first they will pay us.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Sell ​​positions.",
                response = "The treasury will come to life. Let your conscience breathe later.",
                statDeltas = fixed_array(-15, 0, 0, 30, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Sell ​​only small positions.",
                response = "Petty theft is almost a tradition.",
                statDeltas = fixed_array(-5, 0, 0, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Prohibit the sale of positions.",
                response = "Commendable. Unprofitable, but commendable.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How much will they steal?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "As much as they are allowed to. That is, a lot if we look the other way. And moderately, if we take a share.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Sell ​​and take a share.",
                response = "Dirty income is still income.",
                statDeltas = fixed_array(-20, 0, 0, 35, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Sell, but appoint inspectors.",
                response = "Thieves steal more slowly under supervision. Usually.",
                statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand payment in grain.",
                response = "Fine. Let at least their ambition be edible.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After the public punishment there was a stampede in the square. There are more wounded than criminals. This is not justice, this is carnage.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban public executions.",
                response = "Today the square will become less bloody. This is already a victory.",
                statDeltas = fixed_array(15, 0, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave only closed executions.",
                response = "Death behind a wall is still death. But at least without the crush.",
                statDeltas = fixed_array(8, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The area must see the strength.",
                response = "Then the area will also see broken ribs.",
                statDeltas = fixed_array(-15, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Is it the crowd's fault?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "The crowd's only fault is that it is afraid. And fear pushes, falls, breaks ribs and crushes children.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Place healers in the square.",
                response = "If you are showing death, let there be at least someone nearby for life.",
                statDeltas = fixed_array(8, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Move executions outside the city.",
                response = "The executioner will move on. People will breathe closer.",
                statDeltas = fixed_array(10, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave everything as is.",
                response = "Then call me not to the sick, but to your consequences.",
                statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Rats eat better than some soldiers. If you don't clean out the barn, in a week they will be fatter than the treasurer.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Hire rat catchers.",
                response = "Finally a war where I root for the killers.",
                statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Let the cats into the barn.",
                response = "The cats will be happy. Rats are surprised.",
                statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Use poison.",
                response = "The food will be saved. If people then do not escape from food.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "How bad is it?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "One rat stole a piece of cheese yesterday and looked at me as if I owed her taxes.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Hire the best rat catchers.",
                response = "Fine. Let at least someone in this palace honestly catch thieves.",
                statDeltas = fixed_array(8, 0, 0, -12, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Give poison, but close the barn.",
                response = "There is a risk. But the rats will not leave on their own out of politeness.",
                statDeltas = fixed_array(-3, 0, 0, -3, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Let the soldiers clean out the barn.",
                response = "The soldiers will swear. Rats too.",
                statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The soldiers say that you listen to merchants more often than to generals. This is a dangerous whisper.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Arrange an army review.",
                response = "The parade will drown out the whispers. For a while.",
                statDeltas = fixed_array(0, 0, 15, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute bread and beer to the soldiers.",
                response = "A well-fed soldier argues more softly.",
                statDeltas = fixed_array(0, 0, 10, -5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Arrest the instigators.",
                response = "Some whispers end in the basement.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Who started this whispering?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Not just one person. Several fires, several mugs, one phrase: ‘merchants eat, soldiers wait’.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed the barracks today.",
                response = "Bread will shut their mouths better than an order.",
                statDeltas = fixed_array(0, 0, 12, 0, 0, 0, 0, -12, 0)
            ),
            DialogueChoice(
                choiceText = "Find the talkers and punish them.",
                response = "They will shut up. The rest will think more quietly.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Address the soldiers in person.",
                response = "Risky. But soldiers like to see who they serve.",
                statDeltas = fixed_array(0, 0, 10, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Creditors demand payment of the former king's debts. Formally, these are not your debts. But the throne is the same.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay off some of your debts.",
                response = "You buy trust at a high price. But trust is rarely sold cheap.",
                statDeltas = fixed_array(5, 0, 0, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse to pay.",
                response = "The treasury will smile. Merchants - no.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Pay in grain.",
                response = "The debt will go away. Stocks too.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Are these papers real?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Some are real. Some are written in ink too fresh for an old debt. Dead people, as a rule, do not borrow money yesterday.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Pay only proven debts.",
                response = "The fair way. Not the fastest, but strong.",
                statDeltas = fixed_array(5, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Declare counterfeits treason.",
                response = "Lenders will become more careful. And angrier.",
                statDeltas = fixed_array(0, 0, 5, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't pay anyone.",
                response = "Sometimes refusal sounds like strength. Sometimes it's like bankruptcy.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The boy's father raised his sword against you. The boy himself is too small for the sword, but old enough to remember.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Send the boy to a monastery.",
                response = "Monastery walls are better than prison walls. For children - definitely.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Send him to the army as a servant.",
                response = "He will grow up next to the swords. It's either medicine or poison.",
                statDeltas = fixed_array(-3, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute as a warning.",
                response = "The area will understand. Whether he will forgive is another question.",
                statDeltas = fixed_array(-20, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Is he dangerous?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Today - no. Tomorrow - who knows. Children have a good memory, especially if the king left her an orphan.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Let him live under supervision.",
                response = "Soft collar. Sometimes it holds better than iron.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give it to the monastery.",
                response = "Prayer can dull vengeance. Sometimes.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't abandon future enemies.",
                response = "Then you will have fewer enemies. And more ghosts.",
                statDeltas = fixed_array(-20, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The bells ring every hour. People count the dead and lose their will. Maybe we should ban ringing?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ban the death knell.",
                response = "The city will become quieter. I hope it's not more insensitive.",
                statDeltas = fixed_array(5, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Allow ringing only in the morning.",
                response = "One ringing for memory. The rest of the day is for the living.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Let them call.",
                response = "The dead deserve to be remembered. The living deserve a break.",
                statDeltas = fixed_array(-3, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Will silence comfort the living?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "No. But the constant ringing turns the city into a grave, where the living already consider themselves next.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Call only at dawn.",
                response = "Let the day begin with memory and not end with fear.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace the ringing with common prayer.",
                response = "Prayer brings people together more gently than a bell.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "After each ringing, distribute bread.",
                response = "Bread after tribulation is mercy that you can hold in your hands.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "We have doctors who know cold diseases. They can help your city. For a reasonable price.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Hire doctors.",
                response = "Northern hands are cold but helpful.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Exchange services for reduced duties.",
                response = "Mutual benefit. The most honest form of friendship.",
                statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse strangers.",
                response = "Your city is sick, but your pride is healthy.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Why do you offer help so readily?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because a sick neighbor is a bad trader and a good source of infection. The North knows how to calculate benefits.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Hire all healers.",
                response = "They will arrive before sunset. It’s better not to give the disease a head start.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hire two people to check.",
                response = "Carefully. The North respects the cautious almost as much as the strong.",
                statDeltas = fixed_array(10, 0, 0, -6, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Receive doctors, but not let them into the palace.",
                response = "Your trust is faltering, but still going strong.",
                statDeltas = fixed_array(12, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I have powder for restful sleep. It can be given to patients. Or soldiers who argue too loudly.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give to the sick.",
                response = "Sleep is a cheap healer. My powder just charges for entry.",
                statDeltas = fixed_array(10, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give to restless soldiers.",
                response = "A quiet barracks is a rare miracle. Don't ask how natural.",
                statDeltas = fixed_array(3, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Buy stock for the palace.",
                response = "Palaces sleep worse than slums. There are more pillows and more fears.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How safe is it?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "In a small dose, a person sleeps. In the big one, he also sleeps, just longer than his relatives would like.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy a small batch for the sick.",
                response = "Carefully. Almost boring. But the patients will like it.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Buy a lot. Entrust the dosage to you.",
                response = "Finally a king who respects dangerous talent.",
                statDeltas = fixed_array(12, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban this powder.",
                response = "Prohibitions also put you to sleep. Mainly the mind.",
                statDeltas = fixed_array(3, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "In the markets they fight for bread. Give me soldiers, and in an hour there will be order there.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Send armed soldiers.",
                response = "Order will come quickly. With shouts, but quickly.",
                statDeltas = fixed_array(-10, 0, 5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Send soldiers without weapons.",
                response = "Soldiers without weapons is almost a request. But let's try.",
                statDeltas = fixed_array(5, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Entrust markets to elders.",
                response = "Headmen are good for arguing about price. Not for a fight.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Do you call it order or fear?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "At the market, a hungry person does not distinguish between these words. He sees a spear and remembers that it has legs.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Let the soldiers restore order.",
                response = "There will be order. Even with bruises.",
                statDeltas = fixed_array(-10, 0, 8, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "The soldiers guard the bread, but do not touch the people.",
                response = "A fine line. I'll make sure it's not stepped over too often.",
                statDeltas = fixed_array(5, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Set up food distributors.",
                response = "Bread instead of a club. Soft. Sometimes it works.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "One healer says that diseases are born in dirty water, not in sins. People listen to him too closely.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Protect the doctor.",
                response = "You are choosing water over preaching. The temple will notice this.",
                statDeltas = fixed_array(15, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Make the doctor apologize.",
                response = "Humility is beneficial even to those who wash their hands more often than their souls.",
                statDeltas = fixed_array(-3, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give the doctor to the church court.",
                response = "The altar will sort itself out. Quick or edifying.",
                statDeltas = fixed_array(-15, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Does clean water contradict faith?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "No. But when people believe only in water, they cease to be afraid of sin. And without fear the temple is empty.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "The doctor speaks about water, the temple speaks about the soul.",
                response = "The division is wise. If both sides remember their place.",
                statDeltas = fixed_array(10, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The doctor must speak more carefully.",
                response = "Careful words rarely burn bridges.",
                statDeltas = fixed_array(3, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Clean the wells and conduct a service.",
                response = "Water for the body, prayer for fear. Good order.",
                statDeltas = fixed_array(18, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "There is a lot of silver in the temples. If you borrow part of it, the treasury will come to life.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Take the temple silver.",
                response = "The treasury will come to life. The temples will start screaming, but not right away.",
                statDeltas = fixed_array(-10, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ask for a donation.",
                response = "Asking brings less, but less often leads to stones.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't touch the temples.",
                response = "Sanctity preserved. Emptiness too.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Will this cause a riot?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Not right away. First there will be sermons. Then the crying old women. Then stones hit the tax collectors. But we will already have the silver.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Take it quickly and secretly.",
                response = "Secret is cheaper than war. As long as it remains a mystery.",
                statDeltas = fixed_array(-8, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Take only from rich monasteries.",
                response = "Moderate sacrilege. Almost financial reform.",
                statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't touch the temples.",
                response = "Sometimes a king buys peace by not taking anything.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Women give birth in dirt and cold. Give me an old warehouse, I will turn it into a home for women in labor.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give me a warehouse and money.",
                response = "You save those who have not yet even had time to be afraid of your rule.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Give a warehouse without money.",
                response = "Walls are better than streets. But walls without healers do not save everyone.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -3, 0)
            ),
            DialogueChoice(
                choiceText = "A warehouse is needed for grain.",
                response = "Bread is important. But dead babies don't eat it.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "How many lives will this save?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "I'm not a goddess to count in advance. But a dirty floor takes away babies more often than swords take away soldiers.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give me a warehouse and money.",
                response = "Then today the crown did something truly lively.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Provide a small room at the infirmary.",
                response = "Few. But it’s better than nothing, and sometimes salvation begins with this.",
                statDeltas = fixed_array(12, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Now the grain is more important.",
                response = "Then I will return when the price of this choice begins to cry.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The meat came from the south. Cheap. Too cheap. It smells like a victory over common sense.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy and feed the poor.",
                response = "The poor will eat. Then, perhaps, they will regret it.",
                statDeltas = fixed_array(-15, 0, 0, -5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Buy only for dogs and army.",
                response = "Dogs will forgive. Soldiers are not a fact.",
                statDeltas = fixed_array(-5, 0, -3, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Avoid meat.",
                response = "Fine. Sometimes the best food is the one you don't eat.",
                statDeltas = fixed_array(5, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do you think it's ruined?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "If the meat smells like it has already met death, I prefer not to introduce it to the stomachs.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Burn the meat.",
                response = "Smoke is better than a funeral song.",
                statDeltas = fixed_array(10, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Pickle and take your chances.",
                response = "Salt hides a lot. But not everything forgives.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Return to sellers.",
                response = "Let them dine on their own profit.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Some of the king's grain disappears and appears on the black market at night. Someone inside the palace is feeding the thieves.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Organize a raid.",
                response = "We'll catch someone for sure. The question is - a thief or a convenient victim.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Set up secret surveillance.",
                response = "Silent hunt. I like.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Increase penalties for grain theft.",
                response = "Fear will reduce theft. Or it will make thieves more careful.",
                statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Do you know who helps the thieves?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "I know where the smell comes from. From warehouse keys and people who got rich too quickly after the coup.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Arrest the warehouse supervisors.",
                response = "Hard. But keys love strict hands.",
                statDeltas = fixed_array(-3, 0, 5, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Replace bags and trace the path.",
                response = "Fine. Let the thieves lead us home themselves.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(
                choiceText = "Close the case so as not to disgrace the palace.",
                response = "The shame will remain. Just full.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "There is a statue of the former king in the main square. Some put flowers on it, others spit on it. What to do?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Demolish the statue.",
                response = "You will remove the stone. It will take longer to clear the memory.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the statue.",
                response = "A gentle gesture. Proponents of strength will call it weakness.",
                statDeltas = fixed_array(5, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Melt it down into coins.",
                response = "History will become small coin. Symbolic, but dangerous.",
                statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What would a wise king do?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "A wise king does not argue with a stone. He takes it to a place where memory ceases to be a banner.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Move the statue to the old garden.",
                response = "The memory will remain, but will no longer command the area.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Place a new coat of arms next to it.",
                response = "You don't erase the past. You put your stamp on it.",
                statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demolish at night.",
                response = "The night will hide the workers. But in the morning everyone will see emptiness.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If you cap the price of bread, bakers will hide the flour. If you don't limit it, the poor will start eating bark.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Limit the price.",
                response = "The poor will be grateful. The bakers will start counting the caches.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Do not interfere with the market.",
                response = "The market will survive. Not all people - but the market certainly is.",
                statDeltas = fixed_array(-15, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Compensate bakers for the difference.",
                response = "This is the language of trade. Finally.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How to keep the price and not lose flour?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "It’s very simple: you pay the bakers, the bakers smile at the people, the people thank you, and the treasurer cries into his pillow.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Compensate bakers.",
                response = "Expensive, beautiful, almost reasonable.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give bakers grain instead of gold.",
                response = "Bread for bread. A simple transaction, rare for the palace.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Let the market decide for itself.",
                response = "The market will decide. Then the crowd too.",
                statDeltas = fixed_array(-15, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "One condemned man asks not to hang him in the square, but to kill him quickly and quietly. He says he has children.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow silent execution.",
                response = "Less spectacle. More human.",
                statDeltas = fixed_array(3, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Public execution is necessary for order.",
                response = "The area will receive a lesson. Children are memories.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace execution with hard labor.",
                response = "A living criminal can still be useful.",
                statDeltas = fixed_array(0, 0, -5, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Is he really guilty?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Guilty enough to die as ordered. But not enough for me to remember his name.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Reconsider the case.",
                response = "Rarely does an ax wait for paper. But today it will wait.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute quietly.",
                response = "A silent death is still death. But no crowd.",
                statDeltas = fixed_array(3, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Execute publicly.",
                response = "Understood. The square will learn fear again.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "A hungry man does not hear prayer. Give us grain and we will feed people before services.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give grain to the monastery.",
                response = "Thank you. Today the sermon will begin with a spoonful of soup.",
                statDeltas = fixed_array(20, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Give some grain.",
                response = "A little warmth is better than complete cold.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, -7, 0)
            ),
            DialogueChoice(
                choiceText = "Let them pray first, then eat.",
                response = "An empty stomach does not hold prayer well.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Do you want to feed or convert?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "I want them to live until tomorrow. If they pray tomorrow, good. If they just breathe, it’s already a miracle.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give grain without conditions.",
                response = "This is mercy. No hook. A rare thing at court.",
                statDeltas = fixed_array(20, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Give grain only to children and the sick.",
                response = "I'll accept. Although hungry adults are people too.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Don't waste supplies.",
                response = "Then I will pray that the supplies will forgive you.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I have a strong poison. For rats, of course. Although rats are different.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy for barns.",
                response = "The rats will die. I hope the chefs know how to read the warnings.",
                statDeltas = fixed_array(-3, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Buy secretly for the palace.",
                response = "Palace rats walk on two legs. Understand.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ban the sale of poison.",
                response = "Forbid it. Rats, however, do not read decrees.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Are you offering me poison?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "I offer a remedy. Poison is when the remedy ends up in the wrong cup.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy for barns only.",
                response = "How boring. How prudent.",
                statDeltas = fixed_array(-3, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Buy and keep in the palace.",
                response = "Let your enemies hope that you do not know how to choose cups.",
                statDeltas = fixed_array(0, 0, 3, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give the poison to the guards.",
                response = "Oh, now the poison will be under the supervision of men with swords. What could go wrong?",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The infirmaries are filled with civilians. Wounded soldiers have nowhere to go. Who is more important for the throne?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Make room for soldiers.",
                response = "The soldiers will remember. Civilians too.",
                statDeltas = fixed_array(-15, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the civilians.",
                response = "Mercy for the city. Bitterness in the barracks.",
                statDeltas = fixed_array(15, 0, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Expand the infirmary.",
                response = "Expensive. But at least no one can say that you chose the dead.",
                statDeltas = fixed_array(10, 0, 5, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Do you want me to choose between the sword and the people?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "No. I want you to understand: a sword that bleeds on the floor will not protect the people tomorrow.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Expand the infirmary.",
                response = "Good order. Even I won't argue.",
                statDeltas = fixed_array(10, 0, 5, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Half the places are for soldiers.",
                response = "Half justice is better than a complete quarrel.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Soldiers first.",
                response = "The army will repay with loyalty. The rest - as best they can.",
                statDeltas = fixed_array(-15, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Even a traitor has a soul. Let the priest speak to everyone before they die.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow.",
                response = "Mercy before death is still mercy.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Only important prisoners.",
                response = "Souls, it turns out, are also divided by rank.",
                statDeltas = fixed_array(2, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "No. A quick execution is cheaper.",
                response = "A cheap death often comes at a high cost to the living.",
                statDeltas = fixed_array(-5, 0, 3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Why console traitors?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "We do not console traitors. We console those who look and think, ‘If I am accused, will I die like an animal?’",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Allow everyone to pray.",
                response = "Today fear will become a little less animalistic.",
                statDeltas = fixed_array(6, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Only to those who admit guilt.",
                response = "Confession in exchange for mercy. Strict, but understandable.",
                statDeltas = fixed_array(3, 0, 2, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse.",
                response = "Then the ax will speak last. And loudest of all.",
                statDeltas = fixed_array(-5, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I found the old hiding place of the former king. There is gold there, but it is marked with the seals of the old dynasty.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Melt down the gold.",
                response = "The old king will become the new coin. Ironic and useful.",
                statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Use it secretly.",
                response = "Secret money is the best money. Until they are found.",
                statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Show it to the people and call it a trophy.",
                response = "Boldly. But some people still love old seals.",
                statDeltas = fixed_array(-5, 0, 5, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Why did the former king hide it?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Kings hide gold for two reasons: to survive trouble or to escape from it. The deceased did not manage to do either of these things.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Melt everything down.",
                response = "Wonderful. Gold has no memory after the smelter.",
                statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave some as a reserve.",
                response = "Wise. A secret chest is sometimes better than advice.",
                statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Give some away to the people.",
                response = "Generosity from someone else's stash. People won't elaborate.",
                statDeltas = fixed_array(10, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People eat whatever is given to them. Yesterday's free stew was too rich for hungry stomachs. Now half the street is sick.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Organize proper kitchens.",
                response = "Feeding is not enough. You still need to not kill with kindness.",
                statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Stop food distribution.",
                response = "You will stop stomach pain. And you will bring back hunger.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Entrust recipes to chefs.",
                response = "Let them cook for the sick, not for a feast.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Can food harm the hungry?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "After a long hunger, the stomach looks like a wounded one. If you throw a feast at him, he doesn’t thank you - he gives up.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Create healing kitchens.",
                response = "This will save more than it seems. Quietly, without fanfare.",
                statDeltas = fixed_array(22, 0, 0, -10, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Distribute only liquid stew.",
                response = "Fine. Simple food is the best medicine for an empty belly.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Don't change anything.",
                response = "Then call me not to the kitchen, but to the dead.",
                statDeltas = fixed_array(-12, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "If you replace meat with turnips, the city will last longer. But the soldiers are already calling it ‘the slop of the world’.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Transfer everyone to turnip.",
                response = "Everyone will be equally unhappy. There is almost justice in this.",
                statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Only feed the poor turnips.",
                response = "The poor will again receive the cheapest share of mercy.",
                statDeltas = fixed_array(-5, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "The palace also eats turnips.",
                response = "This is what I want to see: courtiers versus root crops.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Is it possible to make turnips tasty?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "You can if you add oil, salt and hope. Oil is scarce, salt is expensive, let the throne provide hope.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Add salt from stock.",
                response = "Salt will save the taste. A little honor too.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Make turnips a common food.",
                response = "Then no one will say that hunger has a class.",
                statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the meat to the army.",
                response = "The soldiers will be happy. Turnip - no, she was humiliated again.",
                statDeltas = fixed_array(0, 0, 8, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "One guard let a merchant's cart through at night without inspection. He says he only took two coins.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Execute the guard.",
                response = "The guards will understand the value of two coins.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Carve and leave to serve.",
                response = "Pain teaches faster than command.",
                statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Fire and fine.",
                response = "Soft. But it's not pointless.",
                statDeltas = fixed_array(0, 0, -3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What was in the cart?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "He swears he doesn't know. And I don’t like the oaths of people who sell their eyes for two coins.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Find the cart and confiscate the cargo.",
                response = "Let's catch the trail while the wheels are still fresh.",
                statDeltas = fixed_array(0, 0, 3, -3, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Interrogate the guard harshly.",
                response = "He will remember. Or he'll come up with an idea. We'll have to differentiate.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Introduce double inspection.",
                response = "More expensive. But the gate will finally become a gate.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "People are not afraid of punishment, but of punishment without trial. Even a usurper needs a law.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Create a temporary court.",
                response = "Law is a slow shield. But still a shield.",
                statDeltas = fixed_array(15, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Try only important defendants.",
                response = "Not justice, but its shadow. Sometimes shade is better than darkness.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The royal command is superior to the court.",
                response = "This is what strong kings say. And those who don’t remain them for long.",
                statDeltas = fixed_array(-15, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Will the law help maintain the throne?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "The sword will hold the door today. The law will convince people tomorrow not to look for another door.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Create a temporary court.",
                response = "Wise. Fear subdues, law binds.",
                statDeltas = fixed_array(15, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Appoint speedy military courts.",
                response = "Fast. Dangerous. But at least not completely without form.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't waste time on the law.",
                response = "Then it will not be the law that will rule, but the nearest hand with the sword.",
                statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "My warehouses are full. But the road to them is dangerous. Give me soldiers and you will get bread.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give soldiers.",
                response = "Wonderful. Your swords will bring my bread to your hungry.",
                statDeltas = fixed_array(0, 0, -8, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Pay private security.",
                response = "Expensive, but without an extra military boot on the trade road.",
                statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Take warehouses by force.",
                response = "You will receive grain. And merchants who will learn to hide better.",
                statDeltas = fixed_array(-10, 0, 5, 0, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(
                choiceText = "Are you threatening the crown with famine?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "I? Never. Hunger threatens itself. I'm just standing next to the barn key.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give soldiers and tax some of the grain.",
                response = "Tough, but smart. This is unpleasant for me, so you are learning.",
                statDeltas = fixed_array(0, 0, -8, 3, 0, 0, 0, 22, 0)
            ),
            DialogueChoice(
                choiceText = "Buy grain honestly.",
                response = "Honesty feels good. Especially when it's paid in full.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse the deal.",
                response = "Then let your barns prove that they are fuller than my pride.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After each execution the crowd becomes quieter. Do you want to make executions weekly?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Yes, fear is needed.",
                response = "Then I will prepare the area. And people who will then wash it.",
                statDeltas = fixed_array(-20, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Only for proven traitors.",
                response = "Moderate horror. It's easier to swallow.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "No. Fear quickly rots.",
                response = "A rare order that reduces my work.",
                statDeltas = fixed_array(10, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Is the crowd really getting quieter?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Quiet - yes. Or rather, no. Silence is not always true. Sometimes it's just clenched teeth.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Executions are only carried out in major cases.",
                response = "The ax will be rare. That's why it's probably scarier.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Replace some executions with hard labor.",
                response = "A pick instead of a loop. She also has an educational sound.",
                statDeltas = fixed_array(0, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Continue public executions.",
                response = "The square will be silent. But don't sleep.",
                statDeltas = fixed_array(-20, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The soldiers were brought to the monastery with fervor. If we accept them, the poor will get sick. If not, the defenders of the throne will die.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Receive soldiers.",
                response = "We will accept them. And we will pray that the disease does not go further.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Leave places for the poor.",
                response = "The poor will survive. The soldiers may not forgive.",
                statDeltas = fixed_array(10, 0, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Divide the monastery with partitions.",
                response = "A wooden wall is better than a stone heart.",
                statDeltas = fixed_array(3, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What does your conscience say?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "She says that a soldier and a beggar have the same fever. But we have one bed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Accept the heaviest, regardless of rank.",
                response = "This seems like justice. It's rarely convenient.",
                statDeltas = fixed_array(8, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Soldiers are more important.",
                response = "I will obey. But illness does not respect uniforms.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The poor are more important.",
                response = "Then I will pray for both the poor and your army.",
                statDeltas = fixed_array(10, 0, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "There have been strange poisonings in the city. I can make an antidote. But rare herbs are expensive.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy herbs.",
                response = "Life has defeated the wallet again. What a rarity.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Buy small stock.",
                response = "A small reserve saves a small part of the trouble.",
                statDeltas = fixed_array(8, 0, 0, -6, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Accuse you of creating poison.",
                response = "Comfortable. When you don’t know who is to blame, grab someone who knows herbs.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "How do you know it's poison?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because people don't turn blue from bad thoughts. Although, I admit, your subjects are trying.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Buy full stock.",
                response = "Fine. Death will earn less today.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Buy a small supply and look for a source.",
                response = "Reasonable. Treating water without finding a well is stupid.",
                statDeltas = fixed_array(12, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Make them sell cheaper.",
                response = "Royal discount always smells like iron.",
                statDeltas = fixed_array(12, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Announce a day of fasting. People will eat less and think about their souls.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Announce a general post.",
                response = "The city will come to terms. Although the hungry humble themselves worse than the well-fed.",
                statDeltas = fixed_array(-5, 0, 0, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "This post is for the palace only.",
                response = "Good example from above. People love it when the palace tolerates it too.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Post for the army too.",
                response = "Strong humility. The soldiers will call him differently.",
                statDeltas = fixed_array(0, 0, -15, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "The hungry are already fasting.",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "That is why the palace should begin the fast. When a well-fed person refuses meat, a hungry person at least sees that his suffering has been noticed.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "This post is for the palace only.",
                response = "Humility above sometimes cures anger below.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "A general fast with the distribution of stew to the poor.",
                response = "Wise. An empty stomach doesn't have to be a death sentence.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Refuse the post.",
                response = "Then at least let the palace not feast too loudly.",
                statDeltas = fixed_array(3, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Citizens are willing to pay for patrols in their areas. Essentially, security will become a service.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Introduce paid patrols.",
                response = "Security will finally start to pay off.",
                statDeltas = fixed_array(-10, 0, 8, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Patrols are free.",
                response = "Noble. Unprofitable. Very royal.",
                statDeltas = fixed_array(10, 0, 5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Patrols only in dangerous areas.",
                response = "Reasonable expense. I'm almost satisfied.",
                statDeltas = fixed_array(5, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "What about poor areas?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Poor areas will pay less. Or they won't pay at all. Then they will have less security. Mathematics is cruel, but fair.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "The rich pay for themselves and the poor.",
                response = "Wonderful. A tax that can be called mercy.",
                statDeltas = fixed_array(8, 0, 8, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Whoever pays gets the patrol.",
                response = "Clean system. Dirty consequences.",
                statDeltas = fixed_array(-10, 0, 8, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Patrols are free for everyone.",
                response = "The treasury will sigh with pain. The city is relieved.",
                statDeltas = fixed_array(10, 0, 5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "The pharmacy burned down at night. People say it's a punishment from the gods, but I see traces of oil.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Investigate arson.",
                response = "Thank you. Fire rarely lights itself where there is benefit.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Restore the pharmacy at the expense of the treasury.",
                response = "People will get medicine before rumors become poison.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Hand over the matter to the guards.",
                response = "Let them search. If only they wouldn’t find a convenient poor man.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Who benefits from arson?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "To the one who sells medicines at a higher price. Or to someone who wants the sick to go not to the doctor, but to the altar.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Investigate drug dealers.",
                response = "Look for money. They often stand next to fire.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Restore the pharmacy and provide security.",
                response = "Now patients will receive a door that will not burn without witnesses.",
                statDeltas = fixed_array(22, 0, 3, -18, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't make a big deal.",
                response = "Then the next fire will be bolder.",
                statDeltas = fixed_array(-10, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Prisoners are hardly fed. If they die in the cells, Morven will have less work to do, but the stench will reach the throne room.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feeding prisoners is fine.",
                response = "It's not mercy, it's sanitation. Sometimes they are similar.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Feed only those who work.",
                response = "Food for work. Prison justice.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Don't waste food on traitors.",
                response = "Then the cameras will soon begin to prepare their own scent.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Are they really dying of hunger?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Not yet. For now they only gnaw at crusts, walls and each other with their eyes. But a couple more days and it will start to smell like a problem.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Feed all prisoners.",
                response = "Fine. Dead enemies are less dangerous, but smell worse.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Send prisoners to work for food.",
                response = "At least let them dig their own graves.",
                statDeltas = fixed_array(-3, 0, 0, 10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Let them endure.",
                response = "Patience does not feed. But it decomposes slowly.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Carts without seals go through the night gate. If you close the gates, the city will be safer, but the food will be delayed.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Close the gate at night.",
                response = "Safer. But the morning will greet us with a line of hungry carts.",
                statDeltas = fixed_array(3, 0, 8, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the gate open.",
                response = "Food will come in. Hopefully not with knives.",
                statDeltas = fixed_array(0, 0, -8, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Check every cart.",
                response = "Slow but sure. The gates will become eyes.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "What is more often carried at night - food or danger?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Both. The trouble is that sacks of grain and sacks of daggers look the same until they are untied.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Check every cart.",
                response = "Then we will be slow, but not blind.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Introduce night duty and inspection.",
                response = "Fine. Even danger will pay an entrance fee.",
                statDeltas = fixed_array(0, 0, 3, 8, 0, 0, 0, -3, 0)
            ),
            DialogueChoice(
                choiceText = "Leave the gate open.",
                response = "I'll put in the best people. And I won't sleep well.",
                statDeltas = fixed_array(0, 0, -8, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "After blood and fear, people need a holiday. But the holiday is worth gold, food and peace of mind.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Have a big celebration.",
                response = "The city will smile. Even with empty barns.",
                statDeltas = fixed_array(20, 0, 0, -20, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Have a modest celebration.",
                response = "Modest joy is sometimes stronger than luxurious joy.",
                statDeltas = fixed_array(10, 0, 0, -8, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Ban holidays until stability.",
                response = "The order has been preserved. Mood - no.",
                statDeltas = fixed_array(-10, 0, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Is now the time to celebrate?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Right now. When people hear only orders and funeral bells for a long time, they begin to wait not for the king, but for the end.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "A modest holiday for the whole city.",
                response = "Fine. Enough light so that the night doesn't seem forever.",
                statDeltas = fixed_array(10, 0, 0, -8, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "A holiday with the distribution of bread.",
                response = "Expensive. But people will remember the taste of this day.",
                statDeltas = fixed_array(25, 0, 0, -20, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Postpone the holiday.",
                response = "Then joy will wait. I hope she doesn't go away completely.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "I can give the treasury gold. In exchange, I want the right to collect tolls on the south bridge. This benefits you now and always benefits me.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give the bridge away for a month.",
                response = "Wonderful. A bridge is not a stone. This is a river of coins.",
                statDeltas = fixed_array(-8, 0, 0, 25, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Give the bridge away for a week.",
                response = "A week is a short excuse to become rich. I can handle it.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Don't give the bridge to merchants.",
                response = "The crown keeps the stones. I'll find another way to gold.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Why do you need a bridge?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Because everything passes through the bridge: grain, salt, rumors, debtors and people who think they know how to hide money.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Give the bridge away for a week and install a caretaker.",
                response = "You give me the door, but leave your eye on the lock. Not bad.",
                statDeltas = fixed_array(-3, 0, 0, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Demand grain instead of gold.",
                response = "Bread instead of coins. During the fasting month it is almost the same thing.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "The bridge will remain with the crown.",
                response = "Then let the crown itself count each cart. It's boring work.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Your first decisions are already costing the kingdom blood, gold, bread and trust. Now we need to choose what price we are willing to pay next.",
            choiceCount = 5,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Power rests on the army.",
                response = "The sword will hold the throne. But the sword does not know how to sow grain.",
                statDeltas = fixed_array(-10, 0, 25, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Power rests on bread.",
                response = "Hungry people are dangerous. Well-fed people at least listen.",
                statDeltas = fixed_array(5, 0, 0, -15, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(
                choiceText = "Power rests on the treasury.",
                response = "Gold will give us time. But time bought by suffering often ends in screaming.",
                statDeltas = fixed_array(-10, 0, 0, 25, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Power rests on living people.",
                response = "Living subjects can still forgive the king. The dead only pursue his name.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "What if you try to hold on to everything?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            )
            )
        ),
        DialogueNode(
            prompt = "Can. But kingdoms perish not only from bad decisions. Sometimes they die from good decisions made too late.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Distribute forces equally.",
                response = "Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.",
                statDeltas = fixed_array(7, 0, 7, 7, 0, 0, 0, 7, 0)
            ),
            DialogueChoice(
                choiceText = "No, first the army.",
                response = "Then let the soldiers remember that they are protecting the kingdom, not just your door.",
                statDeltas = fixed_array(0, 0, 20, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "No, first the bread.",
                response = "Bread is the king's quietest ally. While it is there.",
                statDeltas = fixed_array(5, 0, 0, -12, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "No, first the health of the residents.",
                response = "You chose life. Now we need to make sure that the living have something to live on.",
                statDeltas = fixed_array(20, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    )
)

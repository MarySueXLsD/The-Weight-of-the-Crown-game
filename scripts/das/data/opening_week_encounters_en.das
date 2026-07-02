require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
module opening_week_encounters_en public

let public openingWeekEncountersEn : Encounter[OPENING_WEEK_ENC_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, the soldiers shed blood to put you on the throne. Now they wait for coin. If the treasury stays silent, the swords may speak too.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Pay the army in full.",
                        response = "The soldiers will remember a generous king — at least until the next payday.",
                        statDeltas = fixed_array(0, 0, 20, -25, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Pay half and promise the rest later.",
                        response = "Half a coin buys half the peace. For today, that will have to do.",
                        statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Serving the king is honor enough.",
                        response = "Honor does not jingle in a purse. I hope your walls are sturdier than your generosity.",
                        statDeltas = fixed_array(0, 0, -20, 5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "How many soldiers truly took part in the coup?",
                        response = "",
                        statDeltas = NO_STAT_CHANGE,
                        nextNodeIdx = 1
                    ),
                    DialogueChoice()
                )
            ),
            DialogueNode(
                prompt = "Fewer than the rolls claim. Commanders padded the lists with the dead, the lame, and men who slept drunk that night.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Pay only the honest men.",
                        response = "Fair. The cheated commanders will grumble.",
                        statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Pay everyone to keep the army quiet.",
                        response = "A generous order. Even liars will praise you loudly.",
                        statDeltas = fixed_array(0, 0, 18, -20, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Freeze payments until the rolls are checked.",
                        response = "Audits feed paper, not soldiers. I warned you.",
                        statDeltas = fixed_array(0, 0, -12, 10, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode()
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, the streets whisper the word usurper. If the church performs a rite to cleanse the crown, whispers may become prayers.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Hold a costly rite in the great temple.",
                        response = "The gods love humility. The people love to see a king bow his head.",
                        statDeltas = fixed_array(5, 0, 0, -15, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Hold a modest rite without excess.",
                        response = "Modesty is a virtue too — though gold shines more convincingly.",
                        statDeltas = fixed_array(2, 0, 0, -5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "The crown needs no prayers.",
                        response = "A throne without blessing stands high — but sways harder.",
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
                prompt = "Little. Return the temple granaries Edwin seized. We will feed souls and bellies — you will buy quiet streets.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Return the granaries to the church.",
                        response = "Wise. Bread given to the temple returns as prayer.",
                        statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Give only part of the grain.",
                        response = "Half a mercy is still better than full pride.",
                        statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -7, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Refuse.",
                        response = "Then let the crown answer hungry prayers itself.",
                        statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 5, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode()
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, the treasury holds more cobwebs than gold. We could levy a temporary tax on the city gates.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Levy the tax at once.",
                        response = "Excellent. The gates may finally earn more than a draft.",
                        statDeltas = fixed_array(-5, 0, 0, 20, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Tax merchants only.",
                        response = "Merchants will complain — they complain when the sun shines for free.",
                        statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Leave the gates alone.",
                        response = "Free trade is noble. Pity it pays so slowly.",
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
                prompt = "We could sell part of the crown jewels. Gems are beautiful but dead. The treasury, at least, would breathe.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Sell them in secret.",
                        response = "No one will notice — except whoever counted the stones on the crown.",
                        statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Sell them publicly as a sacrifice for the people.",
                        response = "Clever. Poverty looks better when you call it virtue.",
                        statDeltas = fixed_array(3, 0, 0, 12, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Do not sell.",
                        response = "Splendor stays intact. The treasury does not.",
                        statDeltas = NO_STAT_CHANGE
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode()
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, fever and cough spread in the lower city. It may be a cold — or the start of something worse. We must act now.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Quarantine the district.",
                        response = "Harsh, but sensible. Sometimes a door saves more lives than a sword.",
                        statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, -5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Send healers and keep the gates open.",
                        response = "We will do what we can. Disease loves open roads.",
                        statDeltas = fixed_array(8, 0, 0, -8, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Do not spread panic.",
                        response = "Panic kills quickly. Disease is more patient.",
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
                prompt = "Three dead so far. If this is what I fear, in a week we will count streets, not people.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Quarantine only the infected streets.",
                        response = "That buys time — and time is the best cure after clean water.",
                        statDeltas = fixed_array(12, 0, 0, -5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Burn the infected houses.",
                        response = "Fire will stop the sickness. People will remember the smoke.",
                        statDeltas = fixed_array(20, 0, 0, -5, 0, 0, 0, -5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Hide the news.",
                        response = "Secrets do not cool a fever. They only wait until it is too late.",
                        statDeltas = fixed_array(-15, 0, 0, 5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode()
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, after the coup the palace crawls with unfamiliar faces. I ask to double the night watch. It is costly — but you may sleep longer.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Double the watch.",
                        response = "Good. Night grows expensive — and safer.",
                        statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Post only vetted soldiers.",
                        response = "Fewer men, more trust. I can work with that.",
                        statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Do not spend coin on fear.",
                        response = "Then let us hope fear does not spend knives.",
                        statDeltas = fixed_array(-2, 0, -5, 5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Whom do you suspect?",
                        response = "",
                        statDeltas = NO_STAT_CHANGE,
                        nextNodeIdx = 1
                    ),
                    DialogueChoice()
                )
            ),
            DialogueNode(
                prompt = "The old king's servants. Not all of them — but one with a key is enough to turn a door into a grave.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Replace servants with soldiers.",
                        response = "The palace will grow rougher. The doors will obey.",
                        statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, -5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Investigate the servants quietly.",
                        response = "Quiet checks catch more truth than loud orders.",
                        statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Leave them in place.",
                        response = "Then I will watch their hands — especially when they bring your wine.",
                        statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode()
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, the first decree of a new king is remembered forever. Keep it simple — mercy, tax, or steel?",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Lower the price of bread.",
                        response = "Bread is the quietest way to tell the people they still matter to the crown.",
                        statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, -10, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Raise taxes.",
                        response = "The treasury will stir. The people, perhaps, the other way.",
                        statDeltas = fixed_array(-10, 0, 0, 20, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Call a levy for the army.",
                        response = "More swords. Fewer hands in the fields.",
                        statDeltas = fixed_array(0, 0, 15, -5, 0, 0, 0, -5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Issue no decree yet.",
                        response = "Sometimes silence is wise. In the first days on a throne, it is often read as weakness.",
                        statDeltas = NO_STAT_CHANGE
                    ),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode()
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Your Majesty, six deserters were caught. They say they fled hunger, not fear. The army watches what you do.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Execute them publicly.",
                        response = "Cruel — but tomorrow no one runs first.",
                        statDeltas = fixed_array(-5, 0, 15, 0, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Return them to the ranks after punishment.",
                        response = "They will limp, but serve. Better than the rope.",
                        statDeltas = fixed_array(-2, 0, 5, 0, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Pardon and feed them.",
                        response = "Mercy by the hearth smells like weakness in the barracks.",
                        statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, -5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Why are the soldiers hungry?",
                        response = "",
                        statDeltas = NO_STAT_CHANGE,
                        nextNodeIdx = 1
                    ),
                    DialogueChoice()
                )
            ),
            DialogueNode(
                prompt = "Because the quartermasters steal. War always feeds rats — in the granaries and in the uniforms.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Hang the quartermasters.",
                        response = "After that, grain will be counted more honestly.",
                        statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, 5, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Force them to return what they stole.",
                        response = "Good. Let their greed at least feed the soldiers.",
                        statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 10, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Hide the scandal.",
                        response = "Buried rot still stinks — only later.",
                        statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(),
            DialogueNode()
        )
    )
)

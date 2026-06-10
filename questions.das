require engine.core
require constants


[safe_when_uninitialized]
struct DialogueChoice {
    choiceText : string
    response : string
    statDeltas : int[STAT_COUNT]
    nextNodeIdx : int = NO_NEXT_NODE
}


[safe_when_uninitialized]
struct DialogueNode {
    prompt : string
    choiceCount : int
    choices : DialogueChoice[MAX_CHOICES]
}


[safe_when_uninitialized]
struct Encounter {
    startNodeIdx : int
    nodeCount : int
    nodes : DialogueNode[MAX_NODES_PER_ENCOUNTER]
}


let NO_STAT_CHANGE : int[STAT_COUNT] <- fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)

let encounters : Encounter[5] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
            DialogueNode(
                prompt = "My liege, the people are starving. We must open the granaries.",
                choiceCount = 2,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Open the granaries",
                        response = "Thank you, my liege. The people will remember your kindness.",
                        statDeltas = fixed_array(15, 0, 0, -12, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "They must endure",
                        response = "As you wish... though unrest grows in the streets.",
                        statDeltas = fixed_array(-18, 0, 0, 0, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice(),
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
        nodes = fixed_array(
            DialogueNode(
                prompt = "The church requests funding for a new cathedral.",
                choiceCount = 3,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Fund the cathedral",
                        response = "The bells will ring across the kingdom.",
                        statDeltas = fixed_array(0, 15, 0, -12, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Refuse the request",
                        response = "The bishops mutter in the shadows, my liege.",
                        statDeltas = fixed_array(5, -15, 0, 0, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Ask what they offer",
                        response = "They promise to crown your legitimacy in the eyes of the faithful. Shall we accept their blessing in exchange for modest funding?",
                        statDeltas = NO_STAT_CHANGE,
                        nextNodeIdx = 1
                    ),
                    DialogueChoice(),
                    DialogueChoice()
                )
            ),
            DialogueNode(
                prompt = "Shall we accept their blessing in exchange for modest funding?",
                choiceCount = 2,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Accept the deal",
                        response = "A wise compromise. The church and crown stand united.",
                        statDeltas = fixed_array(0, 10, 0, -8, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Send them away",
                        response = "They leave offended, but the treasury remains intact.",
                        statDeltas = fixed_array(0, -8, 0, 3, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
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
        nodes = fixed_array(
            DialogueNode(
                prompt = "The army demands new weapons before the next campaign.",
                choiceCount = 4,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Arm the soldiers",
                        response = "Steel gleams on every battlement. The generals are pleased.",
                        statDeltas = fixed_array(0, 0, 15, -12, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Make do with what we have",
                        response = "The soldiers grumble, but they will fight nonetheless.",
                        statDeltas = fixed_array(0, 5, -15, 0, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Hold a tournament instead",
                        response = "Morale rises, though the armory stays bare.",
                        statDeltas = fixed_array(5, 8, -5, -5, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Ask the merchants to donate",
                        response = "They agree reluctantly. No crown gold is spent.",
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
        nodeCount = 1,
        nodes = fixed_array(
            DialogueNode(
                prompt = "The treasury is empty. Shall we raise taxes on the peasantry?",
                choiceCount = 2,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Raise the taxes",
                        response = "The coffers swell, but the peasants curse your name.",
                        statDeltas = fixed_array(-15, 0, 0, 18, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Find another way",
                        response = "We sell crown horses and scrape by another season.",
                        statDeltas = fixed_array(8, 0, 0, -10, 0, 0, 0, 0, 0)
                    ),
                    DialogueChoice(),
                    DialogueChoice(),
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
        nodeCount = 1,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Many are sick in the capital. A hospital could save thousands.",
                choiceCount = 5,
                choices = fixed_array(
                    DialogueChoice(
                        choiceText = "Build the hospital",
                        response = "Healers gather. The sick have hope once more.",
                        statDeltas = fixed_array(0, 0, 0, -12, 15, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "We cannot afford it",
                        response = "The ill are turned away. Whispers of cruelty spread.",
                        statDeltas = fixed_array(0, 0, 0, 0, -15, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Quarantine the sick",
                        response = "The plague is contained, at terrible human cost.",
                        statDeltas = fixed_array(-10, 0, 0, 0, 5, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Pray for divine aid",
                        response = "The faithful take comfort, though fevers still burn.",
                        statDeltas = fixed_array(0, 12, 0, 0, -5, 0, 0, 0, 0)
                    ),
                    DialogueChoice(
                        choiceText = "Send for foreign physicians",
                        response = "They arrive at great expense, but their methods are untested here.",
                        statDeltas = NO_STAT_CHANGE
                    )
                )
            ),
            DialogueNode(),
            DialogueNode(),
            DialogueNode()
        )
    )
)


def public encounter_count() : int {
    return length(encounters)
}


def public get_encounter(index : int) : Encounter {
    return encounters[index]
}


def public get_dialogue_node(encounterIdx : int; nodeIdx : int) : DialogueNode {
    return encounters[encounterIdx].nodes[nodeIdx]
}


let defeatDialogueNodes : DialogueNode[1] <- fixed_array(
    DialogueNode(
        prompt = "The treasury is empty and the people are furious. Your reign is over, my liege.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Why are you doing this?",
                response = "Sorry bro, we're gonna kill you.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Surely we can talk this through?",
                response = "Sorry bro, we're gonna kill you.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    )
)


def public get_defeat_dialogue_node(nodeIdx : int) : DialogueNode {
    return defeatDialogueNodes[nodeIdx]
}

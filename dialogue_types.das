require engine.core
require constants


module dialogue_types public


[safe_when_uninitialized]
struct DialogueChoice {
    choiceText : string
    response : string
    statDeltas : int[STAT_COUNT]
    nextNodeIdx : int = NO_NEXT_NODE
    // Stable reply ID — see dialogue_ids.reply_id(questionId, choiceIdx).
    replyId : int = 0
}


[safe_when_uninitialized]
struct DialogueNode {
    prompt : string
    choiceCount : int
    choices : DialogueChoice[MAX_CHOICES]
    // Stable question ID — see dialogue_ids.main_question_id / ashford_question_id.
    questionId : int = 0
}


[safe_when_uninitialized]
struct Encounter {
    startNodeIdx : int
    nodeCount : int
    nodes : DialogueNode[MAX_NODES_PER_ENCOUNTER]
    characterIdx : int = 0
}


// Stat order: People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession
let public NO_STAT_CHANGE : int[STAT_COUNT] <- fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)

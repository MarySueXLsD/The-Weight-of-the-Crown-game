require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_effects
require scripts/das/localization/localization public
module edric_opener public


let edricDayOneEncounter : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_EDRIC,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty. That is what I am advised to call you now. The city has not decided whether to do the same. The people outside are waiting for proof that last night was not only a murder with better furniture. Now comes the harder work. How shall I tell the court to read you?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "I am king by necessity, not appetite.",
                    response = "A careful beginning. Men forgive ambition more easily when it wears a funeral cloak.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Tell them I took what weakness could not hold.",
                    response = "Then they will hear strength. Some will admire it. Some will begin sharpening reasons to fear it.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Tell them nothing. Let them wonder.",
                    response = "Mystery is useful, sire. For a day. After that, people fill silence with treason.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -3, 0, 0, 2),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Tell them I will be judged by what I do next.",
                    response = "Dangerous words. They invite memory. But they may also buy you a little patience.",
                    statDeltas = fixed_array(3, 2, 0, 0, 0, 2, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "There is one more matter before the first petitioner enters. King Edwin is dead. His household is not. Six of his closest servants still sleep under this roof. How do you mean to treat the old king's household?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Root them out. No ghost of Edwin serves my court.",
                    response = "Then the palace will learn quickly that the dead king is dead. The court will call it cruelty — until they need a word for something worse.",
                    statDeltas = fixed_array(0, 0, 3, 0, 0, -3, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Keep those who kneel. Usefulness before blood.",
                    response = "Pragmatic. Old hands know where the passages leak, which locks lie, and which lords still toast Edwin in private. Only remember: a servant who kneels may simply be closer to your cup.",
                    statDeltas = fixed_array(0, 0, 0, -3, 0, 4, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Leave them. I have larger fires to put out.",
                    response = "You do. But small embers under a royal bed have ended more dynasties than foreign armies. I will count the ghosts for you, if you will not.",
                    statDeltas = fixed_array(0, 3, 0, 0, 0, 0, 0, 0, -4)
                ),
                DialogueChoice(
                    choiceText = "Question them. Punish the guilty, spare the useful and innocent.",
                    response = "A just answer. That makes it expensive, slow, and inconvenient. Naturally, it may also be the right one.",
                    statDeltas = fixed_array(0, 2, 0, 0, 0, 2, 0, 0, 0)
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)

let edricDayOneEncounterRu : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_EDRIC,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество. Так мне велено называть вас теперь. Город ещё не решил, делать ли то же. Народ за стенами ждёт доказательства, что прошлой ночью пролилась не только кровь — ещё и сменилась обстановка в покоях. Впереди — работа потруднее. Как мне велеть двору вас воспринимать?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Я король по необходимости, не по аппетиту.",
                    response = "Осторожное начало. Люди охотнее прощают честолюбие в похоронном плаще.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Скажите, что я взял то, что слабость не удержала.",
                    response = "Тогда услышат силу. Одни восхитятся. Другие начнут точить причины бояться.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Ничего не говорите. Пусть гадают.",
                    response = "Тайна полезна, государь. На день. Потом люди наполняют молчание изменой.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -3, 0, 0, 2),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Скажите — меня судят по тому, что будет дальше.",
                    response = "Опасные слова. Они пробуждают память. Но могут купить вам немного терпения.",
                    statDeltas = fixed_array(3, 2, 0, 0, 0, 2, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Есть ещё одно дело — прежде чем войдёт первый проситель. Король Эдвин мёртв. Его дом — нет. Шестеро ближайших слуг до сих пор спят под этой крышей. Как вы намерены обращаться с домашней челядью прежнего короля?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Выгнать их. Ни одного призрака Эдвина при моём троне.",
                    response = "Тогда дворец быстро узнает, что мёртвый король мёртв. Двор назовёт это жестокостью — пока не понадобится слово для чего-то худшего.",
                    statDeltas = fixed_array(0, 0, 3, 0, 0, -3, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Оставить тех, кто преклонит колено. Польза важнее крови.",
                    response = "Прагматично. Старые руки знают, где текут ходы, какие замки лгут и какие лорды по-прежнему чокаются за Эдвина наедине. Только помните: слуга на коленях может быть просто ближе к вашей чаше.",
                    statDeltas = fixed_array(0, 0, 0, -3, 0, 4, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Оставить их. У меня пожары поважнее.",
                    response = "И правда. Но мелкие угли под королевской постелью кончили больше династий, чем чужие армии. Я сосчитаю призраков за вас, раз вы не хотите.",
                    statDeltas = fixed_array(0, 3, 0, 0, 0, 0, 0, 0, -4)
                ),
                DialogueChoice(
                    choiceText = "Допросить их. Казнить виновных, пощадить полезных и невинных.",
                    response = "Справедливый ответ. Он делает всё дорогим, медленным и неудобным. Впрочем, может быть и правильным.",
                    statDeltas = fixed_array(0, 2, 0, 0, 0, 2, 0, 0, 0)
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)


def public is_edric_day_one_encounter(encounterIdx : int) : bool {
    return encounterIdx == POOL_EARLY_FIXED_IDX
}


def public get_edric_day_one_encounter() : Encounter {
    if (is_russian()) {
        return edricDayOneEncounterRu
    }
    return edricDayOneEncounter
}


def public get_edric_day_one_dialogue_node(nodeIdx : int) : DialogueNode {
    return get_edric_day_one_encounter().nodes[nodeIdx]
}


def public apply_edric_day_one_choice(nodeIdx : int; choiceIdx : int) {
    if (nodeIdx == 0) {
        apply_household_edric_tone(choiceIdx)
    } elif (nodeIdx == 1) {
        apply_household_edric_stance(choiceIdx)
    }
}

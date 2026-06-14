require engine.core
require constants
require dialogue_types
require localization public


module edric_opener public


let edricDayOneEncounter : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 1,
    characterIdx = CHAR_EDRIC,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I am Old Advisor Edric. The blade has placed you on the throne, but blades alone cannot keep it. From this day forward, each dawn will bring a petitioner through your door. Every answer you give will shift the measures of the realm. Let any measure fall to nothing, and your reign ends. How do you mean to bear it?",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Steadily — I will weigh each crisis before I decide",
                    response = "Wise. Haste crowned many kings and buried them faster. I will bring the first petitioner when you are ready to listen.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Boldly — a king who hesitates is a king who falls",
                    response = "Then let none mistake silence for weakness. The court will test you soon enough.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Mercifully — I will not rule as the old king did",
                    response = "Mercy wins hearts the sword cannot touch. Guard it — the realm devours soft kings as readily as cruel ones.",
                    statDeltas = fixed_array(0, 2, -2, 0, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
    )
)

let edricDayOneEncounterRu : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 1,
    characterIdx = CHAR_EDRIC,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Государь, я старый советник Эдрик. Клинок посадил вас на трон, но одним клинком трон не удержать. С этого дня каждое утро к вашей двери придёт проситель. Каждый ваш ответ сдвинет мерила королевства. Пусть любое мерило упадёт до нуля — и правление кончится. Как намерены его нести?",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Размеренно — каждый кризис взвешу, прежде чем решу",
                    response = "Мудро. Поспешность короновала многих — и быстрее хоронила. Первого просителя подведу, когда вы будете готовы слушать.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Смело — король, что медлит, король, что падает",
                    response = "Тогда пусть никто не примет молчание за слабость. Двор испытает вас скоро.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Милостиво — не буду править, как прежний король",
                    response = "Милость берёт сердца, которых не возьмёт меч. Берегите её — царство пожирает мягких королей не меньше, чем жестоких.",
                    statDeltas = fixed_array(0, 2, -2, 0, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
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

require engine.core
require constants
require game_state
require dialogue_types
require questions
require localization public
require localization_dialogue public


module ashford public


let ASHFORD_CUTSCENE_TITLE = "Lady Ashford"
let ASHFORD_CUTSCENE_BODY = "The great houses of Loria have watched your reign from their country estates — measuring every decree, every insult, every sign of weakness. Today the most dangerous of them steps through your gates."
let ASHFORD_CUTSCENE_TITLE_RU = "Леди Эшфорд"
let ASHFORD_CUTSCENE_BODY_RU = "Великие дома Лории наблюдали за вашим правлением из своих загородных поместий — взвешивая каждый указ, каждое оскорбление, каждый признак слабости. Сегодня самый опасный из них переступает ваши ворота."
let ashfordDebutEncounter : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 4,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Your Grace, I am Lady Ashford of the eastern marches. My house did not bleed for your coup, nor did we kneel when the old king fell. We have waited seven days to see whether this throne belongs to a ruler — or a brigand who got lucky with a blade.",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "You may speak freely, my lady",
                    response = "",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 8, 0, 5),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Mind your tone. I hold the sword of Loria",
                    response = "",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -5, -10, 0, 0),
                    nextNodeIdx = 2
                ),
                DialogueChoice(
                    choiceText = "The throne has no time for noble vanity",
                    response = "Vanity keeps bloodlines alive. Dismiss me, and every house in Loria will hear that the usurper fears a woman with a ledger.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -8, -15, 0, -5)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Freely? How refreshing. Most usurpers prefer flattery. So — the question every great house whispers in their halls: will you legitimise your reign through noble blood, or rule as a lone wolf until the realm tears you apart? My house can crown you in the eyes of the elite — or bury you beside the king you replaced.",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Grant Ashford a seat on the privy council",
                    response = "A seat, not merely a title. My house will speak for you in halls where your name still tastes of treason.",
                    statDeltas = fixed_array(0, 0, 0, -10, 0, 10, 18, 0, 8)
                ),
                DialogueChoice(
                    choiceText = "Propose a marriage alliance",
                    response = "",
                    statDeltas = fixed_array(3, 5, 0, -8, 0, 8, 15, 0, 12),
                    nextNodeIdx = 3
                ),
                DialogueChoice(
                    choiceText = "The nobility will bow or be broken",
                    response = "You mistake fear for loyalty. My house will remember this audience — and so will every lord who asked whether you could endure.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, -10, -20, 0, -8)
                ),
                DialogueChoice(
                    choiceText = "I need time to consider",
                    response = "Time is the luxury of secure kings. Take your days — we shall see how many remain.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 3, -5, 0, -5)
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "A sword rusts without gold to sharpen it. I did not come to trade threats — I came to learn whether you are worth the risk of an alliance. Will you legitimise your reign through noble blood, or rule as a lone wolf until the realm tears you apart?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Grant Ashford a seat on the privy council",
                    response = "A seat, not merely a title. My house will speak for you in halls where your name still tastes of treason.",
                    statDeltas = fixed_array(0, 0, 0, -10, 0, 10, 18, 0, 8)
                ),
                DialogueChoice(
                    choiceText = "Propose a marriage alliance",
                    response = "",
                    statDeltas = fixed_array(3, 5, 0, -8, 0, 8, 15, 0, 12),
                    nextNodeIdx = 3
                ),
                DialogueChoice(
                    choiceText = "The nobility will bow or be broken",
                    response = "You mistake fear for loyalty. My house will remember this audience — and so will every lord who asked whether you could endure.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, -10, -20, 0, -8)
                ),
                DialogueChoice(
                    choiceText = "I need time to consider",
                    response = "Time is the luxury of secure kings. Take your days — we shall see how many remain.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 3, -5, 0, -5)
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "One final matter before I withdraw: the old king's nephew still lives. Marry into my house, and we can silence that threat together — or leave it to fester while lesser lords choose their side.",
            choiceCount = 2,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "We will deal with the nephew together",
                    response = "Then we are partners in more than name. My couriers ride tonight — let the realm see unity where it expected collapse.",
                    statDeltas = fixed_array(0, 0, 3, -5, 0, 12, 10, 0, 15)
                ),
                DialogueChoice(
                    choiceText = "That is a matter for the crown alone",
                    response = "Alone is how usurpers end. I wish you better fortune than your predecessor, Your Grace.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -5, -8, 0, -10)
                ),
                DialogueChoice(),
                DialogueChoice(),
                DialogueChoice()
            )
        )
    )
)


let ashfordDebutEncounterRu : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 4,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Государь, я леди Эшфорд с восточных марок. Мой дом не проливал кровь за ваш переворот и не преклонил колена, когда пал старый король. Мы ждали семь дней, чтобы увидеть: этот трон принадлежит правителю — или разбойнику, которому повезло с клинком.",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Говорите открыто, леди",
                    response = "",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 8, 0, 5),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Следите за тоном. Меч Лории в моих руках",
                    response = "",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -5, -10, 0, 0),
                    nextNodeIdx = 2
                ),
                DialogueChoice(
                    choiceText = "У трона нет времени на дворянское тщеславие",
                    response = "Тщеславие держит роды живыми. Отшлите меня — и каждый дом в Лории услышит, что узурпатор боится женщины с книгой долгов.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -8, -15, 0, -5)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Открыто? Как освежительно. Большинство узурпаторов предпочитают лесть. Итак — вопрос, который каждый великий дом шепчет в своих залах: легитимизируете ли вы правление через дворянскую кровь, или будете править в одиночку, пока страна не разорвёт вас? Мой дом может короновать вас в глазах знати — или похоронить рядом с королём, которого вы сменили.",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Дать Эшфорд место в тайном совете",
                    response = "Место, а не просто титул. Мой дом будет говорить за вас в залах, где ваше имя ещё пахнет изменой.",
                    statDeltas = fixed_array(0, 0, 0, -10, 0, 10, 18, 0, 8)
                ),
                DialogueChoice(
                    choiceText = "Предложить брачный союз",
                    response = "",
                    statDeltas = fixed_array(3, 5, 0, -8, 0, 8, 15, 0, 12),
                    nextNodeIdx = 3
                ),
                DialogueChoice(
                    choiceText = "Дворянство склонится — или будет сломлено",
                    response = "Вы путаете страх с верностью. Мой дом запомнит эту аудиенцию — и каждый лорд, спрашивавший, сможете ли вы удержаться.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, -10, -20, 0, -8)
                ),
                DialogueChoice(
                    choiceText = "Мне нужно время подумать",
                    response = "Время — роскошь для уверенных королей. Берите свои дни — посмотрим, сколько их останется.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 3, -5, 0, -5)
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Меч ржавеет без золота, что его точит. Я пришла не торговаться угрозами — узнать, стоите ли вы риска союза. Легитимизируете ли вы правление через дворянскую кровь, или будете править в одиночку, пока страна не разорвёт вас?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Дать Эшфорд место в тайном совете",
                    response = "Место, а не просто титул. Мой дом будет говорить за вас в залах, где ваше имя ещё пахнет изменой.",
                    statDeltas = fixed_array(0, 0, 0, -10, 0, 10, 18, 0, 8)
                ),
                DialogueChoice(
                    choiceText = "Предложить брачный союз",
                    response = "",
                    statDeltas = fixed_array(3, 5, 0, -8, 0, 8, 15, 0, 12),
                    nextNodeIdx = 3
                ),
                DialogueChoice(
                    choiceText = "Дворянство склонится — или будет сломлено",
                    response = "Вы путаете страх с верностью. Мой дом запомнит эту аудиенцию — и каждый лорд, спрашивавший, сможете ли вы удержаться.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, -10, -20, 0, -8)
                ),
                DialogueChoice(
                    choiceText = "Мне нужно время подумать",
                    response = "Время — роскошь для уверенных королей. Берите свои дни — посмотрим, сколько их останется.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 3, -5, 0, -5)
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Последнее, прежде чем я уйду: племянник старого короля всё ещё жив. Вступите в мой дом браком — и мы вместе заставим эту угрозу замолчать. Или оставьте её гнить, пока мелкие лорды выбирают сторону.",
            choiceCount = 2,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Мы разберёмся с племянником вместе",
                    response = "Тогда мы партнёры не только на словах. Мои гонцы выезжают сегодня ночью — пусть страна увидит единство там, где ждала краха.",
                    statDeltas = fixed_array(0, 0, 3, -5, 0, 12, 10, 0, 15)
                ),
                DialogueChoice(
                    choiceText = "Это дело одной только короны",
                    response = "В одиночку так заканчивают узурпаторы. Желаю вам большей удачи, чем у вашего предшественника, государь.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -5, -8, 0, -10)
                ),
                DialogueChoice(),
                DialogueChoice(),
                DialogueChoice()
            )
        )
    )
)


def public is_lady_ashford_visitor_allowed() : bool {
    return ashfordIntroduced
}


def public get_ashford_cutscene_title() : string {
    if (is_russian()) {
        return ASHFORD_CUTSCENE_TITLE_RU
    }
    return ASHFORD_CUTSCENE_TITLE
}


def public get_ashford_cutscene_body() : string {
    if (is_russian()) {
        return ASHFORD_CUTSCENE_BODY_RU
    }
    return ASHFORD_CUTSCENE_BODY
}


def public get_ashford_debut_dialogue_node(nodeIdx : int) : DialogueNode {
    if (is_russian()) {
        return get_ashford_debut_dialogue_node_ru(nodeIdx)
    }
    return ashfordDebutEncounter.nodes[nodeIdx]
}


def public get_ashford_debut_dialogue_node_ru(nodeIdx : int) : DialogueNode {
    return ashfordDebutEncounterRu.nodes[nodeIdx]
}

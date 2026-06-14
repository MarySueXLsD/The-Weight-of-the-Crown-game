require engine.core
require constants
require game_state
require dialogue_types
require questions
require localization public
require localization_dialogue public


module defeat public


// Visitor texture index per stat: People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession
let DEFEAT_VISITOR_INDICES : int[STAT_COUNT] <- fixed_array(4, 2, 0, 0, 1, 1, 3, 4, 1)

let DEFEAT_SCREEN_TEXTURE_PATHS : string[STAT_COUNT] <- fixed_array(
    "static/Death_Screens/death_people.png",
    "static/Death_Screens/death_church.png",
    "static/Death_Screens/death_army.png",
    "static/Death_Screens/death_treasury.png",
    "static/Death_Screens/death_health.png",
    "static/Death_Screens/death_loyalty.png",
    "static/Death_Screens/death_nobility.png",
    "static/Death_Screens/death_food.png",
    "static/Death_Screens/death_succession.png"
)

let defeatDialogueNodes : DialogueNode[STAT_COUNT] <- fixed_array(
    DialogueNode(
        prompt = "The commons are at the gates, Your Grace. They say the usurper stole a crown and left their children hungry. Your reign ends here.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Send the guards!",
                response = "Your soldiers lower their spears. Even they have hungry kin in the mob below.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "I can still win them over",
                response = "They do not want speeches. They want bread — and your head upon a pike.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The bells toll for a cursed reign. The faithful will not kneel to a regicide whose soul is black in the eyes of heaven.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "The church needs me more than I need it",
                response = "Excommunication echoes from every pulpit. Even your guards cross themselves and step aside.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Name your price, Bishop",
                response = "Heaven is not traded in coin. Your crown is forfeit — and your soul with it.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The men who crowned you have turned their blades. An unpaid army does not guard a bankrupt usurper.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "I am still your king!",
                response = "The captain spits at your feet. The throne room belongs to soldiers who were promised gold.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Double their pay — tomorrow",
                response = "Tomorrow is a long way off for men with empty purses and sharper memories.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The treasury is empty and the mob remembers why you sit on that throne. Your reign ends here, usurper.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "I won this crown fairly!",
                response = "The old king's coins are gone and the people are done with your lies. Seize him.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Surely we can negotiate?",
                response = "You bargained your way to power once. This time the price is your head.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The sick crowd the courtyards and the healers have fled. A realm in fever will not long endure a king who let plague run wild.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "I am not sick — the realm is",
                response = "Coughing guards abandon their posts. Death does not distinguish usurper from sovereign.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Summon every physician in Loria",
                response = "The physicians come too late. The capital has already chosen a healthier master.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Your own chancellor slides a dagger across the table. The court you bought with fear has sold you to the highest bidder.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Who gave you leave to betray me?",
                response = "Loyalty, like coin, runs out. Yours ran dry before sunset.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "I trusted you",
                response = "Trust is a luxury for kings who keep their friends alive. You did not.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The great houses have signed in secret. They will not bow to an upstart who insulted their blood and emptied their coffers.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "I hold the sword of Loria",
                response = "Nobles fund swords sharper than yours. The gates open from within.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "We can still be allies",
                response = "Alliances are for equals. You are already a footnote in their ledgers.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The granaries are bare and famine walks the streets. Hungry men do not debate legitimacy — they tear down thrones.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "There must be grain somewhere",
                response = "There is — in the storehouses you refused to open. The mob knows where to look.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "The people must endure",
                response = "They endured long enough. Tonight they feast — on your reign.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "The old king's blood still lives in exile, and every lord without an heir has measured your throat. Your line ends with you.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "I will name an heir tonight",
                response = "Tonight is too late. The succession you neglected has already been sold.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "The nephew is a myth",
                response = "Myths do not ride at the head of armies. Your lack of an heir rides with them.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    )
)

let defeatDialogueNodesRu : DialogueNode[STAT_COUNT] <- fixed_array(
    DialogueNode(
        prompt = "Чернь у ворот, государь. Говорят, узурпатор украл корону и оставил их детей голодными. Здесь ваше правление кончается.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Послать стражу!",
                response = "Ваши солдаты опускают копья. У многих в толпе тоже голодные родные.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Я ещё могу их переубедить",
                response = "Им не нужны речи. Им нужен хлеб — и ваша голова на пике.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Колокола бьют по проклятому правлению. Верующие не преклонят колена перед узурпатором, чья душа чёрна в глазах небес.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Церкви нужен я больше, чем мне она",
                response = "Отлучение звучит с каждой кафедры. Даже стража крестит себя и отходит в сторону.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Назовите цену, епископ",
                response = "Небо не торгуют монетами. Ваша корона недействительна — и душа с ней.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Люди, что возвели вас на трон, обернули клинки. Неоплаченная армия не охраняет разорённого узурпатора.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Я всё ещё ваш король!",
                response = "Капитан плюёт у ваших ног. Тронный зал принадлежит солдатам, которым обещали золото.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Удвоить плату — завтра",
                response = "Завтра далеко для людей с пустыми кошельками и острой памятью.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Казна пуста, и толпа помнит, почему вы сидите на этом троне. Ваше правление кончается здесь, узурпатор.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Я честно завоевал эту корону!",
                response = "Монеты старого короля исчезли, и люди устали от ваших лжей. Хватайте его.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Наверняка мы можем договориться?",
                response = "Вы однажды торговались за власть. На этот раз цена — ваша голова.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Больные заполняют дворы, а лекари бежали. Лихорадящее королевство не долго терпит короля, что пустил чуму.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Я не болен — болеет страна",
                response = "Кашляющая стража бросает посты. Смерть не различает узурпатора и суверена.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Созвать каждого врача в Лории",
                response = "Врачи приходят слишком поздно. Столица уже выбрала более здорового хозяина.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Ваш собственный канцлер кладёт кинжал на стол. Двор, купленный страхом, продал вас тому, кто больше заплатил.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Кто позволил тебе предать меня?",
                response = "Верность, как монета, кончается. Ваша кончилась до заката.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Я тебе доверял",
                response = "Доверие — роскошь для королей, что держат друзей живыми. Вы — нет.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Великие дома подписали соглашение тайно. Они не поклонятся выскочке, что оскорбил их кровь и опустошил их сундуки.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Меч Лории в моих руках",
                response = "Дворяне содержат мечи острее вашего. Ворота открываются изнутри.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Мы ещё можем быть союзниками",
                response = "Союзы — для равных. Вы уже сноска в их книгах.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Амбары пусты, и голод идёт по улицам. Голодные люди не спорят о законности — они рушат троны.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Где-то должен быть зерно",
                response = "Оно есть — в закромах, которые вы не открыли. Толпа знает, куда идти.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Народ должен терпеть",
                response = "Они терпели достаточно. Сегодня они пируют — вашим правлением.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    ),
    DialogueNode(
        prompt = "Кровь старого короля жива в изгнании, и каждый лорд без наследника уже мерил ваше горло. Ваша линия кончится с вами.",
        choiceCount = 2,
        choices = fixed_array(
            DialogueChoice(
                choiceText = "Я назову наследника сегодня ночью",
                response = "Сегодня поздно. Преемственность, которую вы пренебрегли, уже продана.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Племянник — выдумка",
                response = "Выдумки не едут во главе армий. Ваше отсутствие наследника едет с ними.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice(),
            DialogueChoice()
        )
    )
)


def public find_defeating_stat_idx_from_deltas(deltas : int[STAT_COUNT]) : int {
    if (defeatPhase != DEFEAT_NONE) {
        return -1
    }
    for (i in range(STAT_COUNT)) {
        if (!statUnlocked[i]) {
            continue
        }
        let statAfter = clamp_stat(kingdomStats[i] + deltas[i])
        if (statAfter <= STAT_MIN) {
            return i
        }
    }
    return -1
}


def public find_defeating_stat_idx(choice : DialogueChoice) : int {
    return find_defeating_stat_idx_from_deltas(choice.statDeltas)
}


def public get_defeat_dialogue_node(statIdx : int; nodeIdx : int) : DialogueNode {
    if (is_russian()) {
        return get_defeat_dialogue_node_ru(statIdx)
    }
    return defeatDialogueNodes[statIdx]
}


def public get_defeat_visitor_index(statIdx : int) : int {
    return DEFEAT_VISITOR_INDICES[statIdx]
}


def public get_defeat_screen_texture_path(statIdx : int) : string {
    return DEFEAT_SCREEN_TEXTURE_PATHS[statIdx]
}


def public format_defeat_summary_text(statIdx : int; days : int) : string {
    if (is_russian()) {
        return format_defeat_summary_text_ru(statIdx, days)
    }
    let dw = (days == 1) ? "day" : "days"
    if (statIdx == 0) {
        return "The mob stormed the palace on day {days}. Loria fed kings — not thieves on thrones."
    }
    if (statIdx == 1) {
        return "After {days} {dw}, the church declared your crown forfeit. Heaven had spoken."
    }
    if (statIdx == 2) {
        return "Your army broke on day {days}. Men you refused to pay opened the gates."
    }
    if (statIdx == 3) {
        return "On day {days}, the coffers ran dry and your creditors called their due."
    }
    if (statIdx == 4) {
        return "Plague took the capital by day {days}. A sick realm casts out sick rulers."
    }
    if (statIdx == 5) {
        return "On day {days}, your own court turned the key. Trust was your last casualty."
    }
    if (statIdx == 6) {
        return "The great houses moved against you on day {days}. Blood remembers blood."
    }
    if (statIdx == 7) {
        return "Famine reached the palace gates on day {days}. Empty granaries topple crowns."
    }
    return "With no heir and no legitimacy, your reign collapsed on day {days}."
}


def public get_defeat_dialogue_node_ru(statIdx : int) : DialogueNode {
    return defeatDialogueNodesRu[statIdx]
}


def public format_defeat_summary_text_ru(statIdx : int; days : int) : string {
    let dw = day_word(days)
    var text = "Без наследника и без законности ваше правление рухнуло на {days} {dw}."
    if (statIdx == 0) {
        text = "На {days} {dw} чернь штурмовала дворец. Лория кормила королей — не воров на тронах."
    } elif (statIdx == 1) {
        text = "Через {days} {dw} церковь объявила вашу корону недействительной. Небо уже высказалось."
    } elif (statIdx == 2) {
        text = "На {days} {dw} армия сломалась. Люди, которым вы отказали в плате, открыли ворота."
    } elif (statIdx == 3) {
        text = "На {days} {dw} сундуки опустели, и кредиторы потребовали расплаты."
    } elif (statIdx == 4) {
        text = "К {days} {dw} чума взяла столицу. Больное королевство отвергает больных правителей."
    } elif (statIdx == 5) {
        text = "На {days} {dw} ваш собственный двор повернул ключ. Доверие стало последней жертвой."
    } elif (statIdx == 6) {
        text = "На {days} {dw} великие дома двинулись против вас. Кровь помнит кровь."
    } elif (statIdx == 7) {
        text = "К {days} {dw} голод дошёл до дворцовых ворот. Пустые амбары валят короны."
    }
    return text
}

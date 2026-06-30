require engine.core
require constants
require dialogue_types
require game_state
require arc_state
require arc_effects
require localization public


module stat_unlock_intro public


let peopleUnlockEncounterEn : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_BRAN,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, I am Bran — elder of Millford, speaker for villages that fed Edwin's wars and starved through your coup. Yesterday the court learned a new word for us on the bar. Today we learn whether you hear it. The commons do not read ledgers — they read bellies, boots, and whether the king's guard kicks down doors. I heard hunger in the provinces before your throne was warm. Do you rule for the people, tax the people, or fear the people?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Hear the commons",
                    response = "Then hear this: empty granaries are louder than trumpets. Feed us, and we forget Edwin. Starve us, and we remember him fondly.",
                    statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, -10, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Tax fairly",
                    response = "Fair words. Fair collectors are rarer than fair kings. We will watch the scales.",
                    statDeltas = fixed_array(-8, 0, 0, 15, 0, 0, 0, -5, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Fear keeps order",
                    response = "Fear feeds riots slower than hunger — but it feeds them nonetheless. You chose the shorter leash.",
                    statDeltas = fixed_array(-15, 0, 10, 0, 0, -6, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "What do the villages want first?",
                    response = "",
                    statDeltas = NO_STAT_CHANGE,
                    nextNodeIdx = 1
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Your Majesty, three things — grain, justice, and a king who does not pretend the coup was a blessing. I heard you chose your tone. Grain we can measure. Justice we will test when your bailiff beats a widow. Blessing we leave to Malrik.",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Open crown granaries to the commons",
                    response = "Then Millford will sing your name before winter. One village — many ears.",
                    statDeltas = fixed_array(18, 0, 0, -8, 0, 0, 0, -15, 0)
                ),
                DialogueChoice(
                    choiceText = "Promise justice",
                    response = "Promises are cheap. Judges are expensive. We will see which you keep.",
                    statDeltas = fixed_array(10, 0, 3, -10, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "The crown cannot feed every village",
                    response = "Then survive we shall — without loving you. Remember that on the day the mob learns your name.",
                    statDeltas = fixed_array(-12, 0, 5, 8, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)

let peopleUnlockEncounterRu : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_BRAN,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, я — Бран, старейшина Милфорда, голос деревень, кормивших войны Эдвина и голодавших через ваш переворот. Вчера двор узнал новое слово для нас в трактире. Сегодня мы узнаем, слышите ли вы его. Простой люд не читает записи казны — он читает животы, сапоги и то, бьёт ли королевская стража в двери. Я слышал голод в провинциях, пока ваш трон ещё не остыл. Вы правите для народа, облагаете народ налогом или боитесь народа?",
            choiceCount = 4,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Слушать народ",
                    response = "Тогда слушайте: пустые амбары громче труб. Накормите нас — и мы забудем Эдвина. Оставьте голодным — и вспомним его с нежностью.",
                    statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, -10, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Справедливый налог",
                    response = "Справедливые слова. Справедливые сборщики реже справедливых королей.",
                    statDeltas = fixed_array(-8, 0, 0, 15, 0, 0, 0, -5, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Страх держит порядок",
                    response = "Страх кормит бунты медленнее голода — но кормит.",
                    statDeltas = fixed_array(-15, 0, 10, 0, 0, -6, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Чего хотят деревни в первую очередь?",
                    response = "",
                    statDeltas = NO_STAT_CHANGE,
                    nextNodeIdx = 1
                ),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Ваше Величество, три вещи — зерно, правосудие и король, не притворяющийся, что переворот был благословением. Я слышал ваш тон. Зерно измерим. Правосудие проверим, когда ваш судья ударит вдову. Благословение оставим Малрику.",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Открыть королевские амбары для народа",
                    response = "Тогда Милфорд будет петь ваше имя до зимы.",
                    statDeltas = fixed_array(18, 0, 0, -8, 0, 0, 0, -15, 0)
                ),
                DialogueChoice(
                    choiceText = "Обещать правосудие",
                    response = "Обещания дешёвы. Судьи дороги.",
                    statDeltas = fixed_array(10, 0, 3, -10, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Корона не может кормить каждую деревню",
                    response = "Тогда выживем — без любви к вам.",
                    statDeltas = fixed_array(-12, 0, 5, 8, 0, 0, 0, 0, 0)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)

let loyaltyUnlockEncounterEn : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_VARN,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the court has a new measure today — loyalty. I command the palace guard. I heard smiles at your coronation; I hear prices now. Every chamberlain, cook, and clerk sells whispers. My men swear to the crown. The question is whether the crown swears back. Do you demand oaths, buy loyalty, or spy on your own house?",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Demand fresh oaths",
                    response = "Words bind some. The rest count coins. I will muster them at dawn.",
                    statDeltas = fixed_array(0, 0, 8, -5, 0, 12, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Pay for silence",
                    response = "Then we purchase peace by the week. Expensive habit for a usurper.",
                    statDeltas = fixed_array(0, 0, 0, -15, 0, 10, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Spy on the court",
                    response = "Patience catches rats. The court will sweat politely.",
                    statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 0, 0, 5),
                    nextNodeIdx = 1
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Your Majesty, one more thing before the whispers spread. A guard heard two chamberlains naming a price for your death. I can arrest them tonight — or you can pretend you did not hear.",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Arrest them",
                    response = "Steel before sunrise. The court will call it justice or terror.",
                    statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Watch them",
                    response = "Soft trap. They will know. They may behave.",
                    statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Dismiss it",
                    response = "Trust is a luxury. I hope yours is not misplaced.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -10, 0, 0, 0)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)

let loyaltyUnlockEncounterRu : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_VARN,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, при дворе сегодня новая мера — верность. Я командую дворцовой стражей. На коронации я слышал улыбки; теперь слышу цены. Каждый камергер, повар и писец продаёт шёпот. Мои люди клянутся короне. Вопрос — клянётся ли корона им. Требовать клятв, покупать верность или шпионить за собственным домом?",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Потребовать новые клятвы",
                    response = "Слова связывают одних. Остальные считают монеты. Я соберу их на рассвете.",
                    statDeltas = fixed_array(0, 0, 8, -5, 0, 12, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Заплатить за молчание",
                    response = "Тогда мы покупаем мир по неделям. Дорогая привычка для узурпатора.",
                    statDeltas = fixed_array(0, 0, 0, -15, 0, 10, 0, 0, 0),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Шпионить за двором",
                    response = "Терпение ловит крыс. Двор будет потеть вежливо.",
                    statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 0, 0, 5),
                    nextNodeIdx = 1
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Ваше Величество, ещё одно, пока шёпот не разошёлся. Стражник слышал, как двое камергеров назвали цену за вашу смерть. Могу арестовать их сегодня — или вы можете сделать вид, что не слышали.",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Арестовать",
                    response = "Сталь до рассвета. Двор назовет это правосудием или террором.",
                    statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Следить",
                    response = "Мягкая ловушка. Они узнают. Может, будут вести себя.",
                    statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)
                ),
                DialogueChoice(
                    choiceText = "Отмахнуться",
                    response = "Доверие — роскошь. Надеюсь, ваше не напрасно.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -10, 0, 0, 0)
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)

let successionUnlockEncounterEn : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_EDRIC,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Your Majesty, the realm now measures succession — who inherits if you fall. Since the coup you avoided the question. The great houses ask it openly. Do you name an heir, invite claimants, or rule as if the blade made you immortal?",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Name a successor",
                    response = "Then ink and blood align. The houses will test your choice before winter.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 0, 0, 15),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Summon claimants",
                    response = "Dangerous theatre. Knives attend auditions.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, -5, 0, 0, 10),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "The throne is mine",
                    response = "Wait long enough and someone else stops asking.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, -10),
                    nextNodeIdx = 1
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Your Majesty, one counsel before the petitioners return. Edwin left nephews, cousins, and ghosts. Your answer today will be quoted when you cannot answer yourself.",
            choiceCount = 2,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "I have chosen",
                    response = "Then I write it once, and close the chapter for today.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 8)
                ),
                DialogueChoice(
                    choiceText = "Not yet",
                    response = "The court is never ready. It is always listening.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -5, 0, 0, -5)
                ),
                DialogueChoice(),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)

let successionUnlockEncounterRu : Encounter <- Encounter(
    startNodeIdx = 0,
    nodeCount = 2,
    characterIdx = CHAR_EDRIC,
    nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, королевство теперь измеряет преемственность — кто наследует, если вы падёте. С переворота вы избегали вопроса. Великие дома спрашивают открыто. Назовете наследника, пригласите претендентов или будете править, словно клинок сделал вас бессмертным?",
            choiceCount = 3,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Назначить наследника",
                    response = "Тогда чернила и кровь совпадут. Дома проверят ваш выбор до зимы.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 0, 0, 15),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Созвать претендентов",
                    response = "Опасный театр. На прослушивания приходят с ножами.",
                    statDeltas = fixed_array(0, 0, 5, 0, 0, -5, 0, 0, 10),
                    nextNodeIdx = 1
                ),
                DialogueChoice(
                    choiceText = "Трон мой",
                    response = "Подождите достаточно — и кто-то другой перестанет спрашивать.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, -10),
                    nextNodeIdx = 1
                ),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Ваше Величество, один совет, пока просители не вернулись. У Эдвина остались племянники, двоюродные и призраки. Ваш ответ сегодня будут цитировать, когда вы уже не сможете ответить.",
            choiceCount = 2,
            choices = fixed_array(
                DialogueChoice(
                    choiceText = "Я выбрал",
                    response = "Тогда я запишу это один раз и закрою главу на сегодня.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 8)
                ),
                DialogueChoice(
                    choiceText = "Ещё нет",
                    response = "Двор никогда не готов. Он всегда слушает.",
                    statDeltas = fixed_array(0, 0, 0, 0, 0, -5, 0, 0, -5)
                ),
                DialogueChoice(),
                DialogueChoice(),
                DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
    )
)


def public begin_stat_unlock_people_encounter() {
    usingArcEncounter = false
    usingStatUnlockEncounter = true
    activeArcId = ARC_NONE
    activeArcBeatIdx = -1
    statUnlockEncounterKind = 0
    currentEncounterIdx = -1
    currentNodeIdx = 0
    pendingNextNodeIdx = NO_NEXT_NODE
    currentCourtCharacterIdx = CHAR_BRAN
}


def public begin_stat_unlock_loyalty_encounter() {
    usingArcEncounter = false
    usingStatUnlockEncounter = true
    activeArcId = ARC_NONE
    activeArcBeatIdx = -1
    statUnlockEncounterKind = 1
    currentEncounterIdx = -1
    currentNodeIdx = 0
    pendingNextNodeIdx = NO_NEXT_NODE
    currentCourtCharacterIdx = CHAR_VARN
}


def public begin_stat_unlock_succession_encounter() {
    usingArcEncounter = false
    usingStatUnlockEncounter = true
    activeArcId = ARC_NONE
    activeArcBeatIdx = -1
    statUnlockEncounterKind = 2
    currentEncounterIdx = -1
    currentNodeIdx = 0
    pendingNextNodeIdx = NO_NEXT_NODE
    currentCourtCharacterIdx = CHAR_EDRIC
}


def public is_using_stat_unlock_encounter() : bool {
    return usingStatUnlockEncounter
}


def public get_stat_unlock_dialogue_node(nodeIdx : int) : DialogueNode {
    if (statUnlockEncounterKind == 0) {
        if (is_russian()) {
            return peopleUnlockEncounterRu.nodes[nodeIdx]
        }
        return peopleUnlockEncounterEn.nodes[nodeIdx]
    }
    if (statUnlockEncounterKind == 1) {
        if (is_russian()) {
            return loyaltyUnlockEncounterRu.nodes[nodeIdx]
        }
        return loyaltyUnlockEncounterEn.nodes[nodeIdx]
    }
    if (is_russian()) {
        return successionUnlockEncounterRu.nodes[nodeIdx]
    }
    return successionUnlockEncounterEn.nodes[nodeIdx]
}


def public clear_stat_unlock_encounter_mode() {
    usingStatUnlockEncounter = false
    statUnlockEncounterKind = -1
}

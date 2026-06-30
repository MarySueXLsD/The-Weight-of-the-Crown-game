require engine.core
require constants
require dialogue_types

module encounters_nobility_ru public

let public allEncountersRuNobility : Encounter[POOL_NOBILITY_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать кузену Эшфорда место в совете.", response = "Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Предложить менее значимый титул без права голоса в совете.", response = "Полкороны за полверности. Завтра они станут торговаться громче.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Дерзко. Великие дома запомнят, кто отверг страховку.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять союз.", response = "Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Ответить торговой грамотой вместо свадьбы.", response = "Торговля вместо кузенов. Холодно, но дешевле.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость облегчает корону. Дома назовут это высокомерием.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заплатить за новый герб.", response = "Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Оставить герб Эдвина и объявить преемственность.", response = "Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.", statDeltas = fixed_array(-5, 5, -5, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Поднять простой стяг", response = "Скромно. Скучно. Порой выживание носит серый цвет.", statDeltas = fixed_array(0, 0, 3, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Передать восточные поместья верным лордам.", response = "Земля покупает мечи. Крестьяне в тех поместьях завоют.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Продать усадьбы с аукциона.", response = "Золото сейчас, обиды потом. Казна вздохнёт.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Тогда безземельные становятся опасными. Вы выбрали принцип вместо мира.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
            prompt = "Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Встать на сторону цехов", response = "Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.", statDeltas = fixed_array(8, 0, 0, 12, 0, 0, -12, 5, 0)),
            DialogueChoice(choiceText = "Встать на сторону знати", response = "Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.", statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 12, -8, 0)),
            DialogueChoice(choiceText = "Поделить разницу и одинаково разозлить всех.", response = "Справедливость, которая никого не удовлетворяет. Удивительно стабильно — ненадолго.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить молчание.", response = "Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Публично опровергнуть и наказать писца.", response = "Жёсткое опровержение. Двор вам верит или делает вид.", statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Предложить барону место в совете.", response = "Честолюбие лечит ревность — порой. Дорогостоящее средство.", statDeltas = fixed_array(-3, 0, 0, -10, 0, 0, 12, 0, 0)),
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
            prompt = "Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Восстановление", response = "История становится союзником. Живые приверженцы Эдвина становятся врагами.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Узурпация", response = "Честно и унизительно. Потомки будут судить без прикрас.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Опустить суждение", response = "Трусливая мудрость. Учёные ненавидят. Нередко действует.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, восточные банкиры предлагают ссуду под налог на зерно следующего года — если великие дома поставят поручительство. Сначала они хотят вашего слова.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Подписать", response = "Долг привязывает корону к элите. Быстрое золото, медленный поводок.", statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 8, -5, 0)),
            DialogueChoice(choiceText = "Отказаться от иностранных бумаг.", response = "Независимость имеет горький вкус. Армия может заметить пустую казну.", statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Обложить банкиров налогом вместо займа.", response = "Дерзость. Они назовут это разбоем. Ваша казна называет это политикой.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -5, 0, 0)),
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
            prompt = "Ваше Величество, молодой лорд вызвал вашего рыцаря на поединок за оскорбление на пиру. Двор наблюдает — закон правит или кровь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить дуэль", response = "Сталь решает то, что сломали слова. Простолюдины зовут это правосудием.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Запретить дуэли", response = "Порядок побеждает. Знать шепчет, что вы боитесь их клинков.", statDeltas = fixed_array(5, 0, -3, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Оштрафовать оба дома и отменить поединок.", response = "Торговый мир. Обе стороны ненавидят арифметику.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, посол говорит, что северные принцы признают вашу корону, если вы пожалуете пограничное баронство их двоюродному брату.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать баронство", response = "Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Предложить торговые права вместо земли.", response = "Более дешёвая дань. Они назовут это оскорблением. Может устоять.", statDeltas = fixed_array(3, 0, 0, 8, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, пир повара для великих домов превысил бюджет. Казначей винит дворецкого; дворецкий винит вашу щедрость.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить пир", response = "Полные столы, пустая казна. Этой ночью они пьют за ваше имя.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Подать скромную трапезу и объяснить жёсткую экономию.", response = "Жидкий суп, густая гордость. Некоторые лорды это оценят.", statDeltas = fixed_array(5, 0, 0, 5, 0, 0, -5, 5, 0)),
            DialogueChoice(choiceText = "Отменить пир", response = "Упущенный повод для союзов. Сохранённое золото для солдат.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, дом Вейн предлагает мечи, если вы лишите Кроу охотничьих прав в королевском лесу.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лишить Кроу прав.", response = "Один дом доволен, другой в ярости. Леса не голосуют.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отстоять старинную грамоту Кроу.", response = "Традиция побеждает. Наёмники Вейна ищут другого нанимателя.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Поделить лес между обоими.", response = "Никто не рад. Меньше браконьеров, больше тяжб.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать титул", response = "Дешёвое дворянство. Истинные претенденты заметят.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Жёсткая позиция. Друзья просителя превращаются в шептунов.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Отправить его в изгнание с золотом.", response = "Ушёл вместе со сплетнями. Золото потрачено, пожалуй, не зря.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, монетный мастер говорит, что рынки наводнены поддельными дворянскими печатями — ваш лик на фальшивых указах.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Публично повесить фальшивомонетчиков.", response = "Страх освежает уважение. Купцы трепещут по-честному.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отозвать все печати и перевыпустить.", response = "Дорогостоящий порядок. Фальшивые монеты умирают медленно — но умирают.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Игнорировать", response = "Беспечность. Кто-нибудь проверит эту теорию бунтом.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, посланник Эшфорда спрашивает, прибудете ли вы на восточную охоту — или вас назовут слишком простым для благородной потехи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять участие в охоте", response = "Потеха покупает сплетни. Между кабанами вы услышите полезное.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Послать доверенное лицо", response = "Практичная пощёчина. Они измерят ранг посланника.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Оскорбление в облике принципа. Армия одобряет.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, два дома оспаривают приданое невесты — жених погиб в вашем призыве. Оба хотят, чтобы корона рассудила.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Решить в пользу дома невесты.", response = "Милосердие, которое воспринимают как слабость или правосудие — зависит от зала.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Решить в пользу дома жениха", response = "Жёсткий закон. Семьи солдат ликуют.", statDeltas = fixed_array(-5, 0, 5, 8, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Забрать приданое в казну.", response = "Все ненавидят вас одинаково. Казна улыбается.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать кузену Эшфорда место в совете.", response = "Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Предложить менее значимый титул без права голоса в совете.", response = "Полкороны за полверности. Завтра они станут торговаться громче.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Дерзко. Великие дома запомнят, кто отверг страховку.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять союз.", response = "Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Ответить торговой грамотой вместо свадьбы.", response = "Торговля вместо кузенов. Холодно, но дешевле.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость облегчает корону. Дома назовут это высокомерием.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заплатить за новый герб.", response = "Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Оставить герб Эдвина и объявить преемственность.", response = "Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.", statDeltas = fixed_array(-5, 5, -5, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Поднять простой стяг", response = "Скромно. Скучно. Порой выживание носит серый цвет.", statDeltas = fixed_array(0, 0, 3, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Передать восточные поместья верным лордам.", response = "Земля покупает мечи. Крестьяне в тех поместьях завоют.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Продать усадьбы с аукциона.", response = "Золото сейчас, обиды потом. Казна вздохнёт.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Тогда безземельные становятся опасными. Вы выбрали принцип вместо мира.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
            prompt = "Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Встать на сторону цехов", response = "Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.", statDeltas = fixed_array(8, 0, 0, 12, 0, 0, -12, 5, 0)),
            DialogueChoice(choiceText = "Встать на сторону знати", response = "Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.", statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 12, -8, 0)),
            DialogueChoice(choiceText = "Поделить разницу и одинаково разозлить всех.", response = "Справедливость, которая никого не удовлетворяет. Удивительно стабильно — ненадолго.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить молчание.", response = "Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Публично опровергнуть и наказать писца.", response = "Жёсткое опровержение. Двор вам верит или делает вид.", statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Предложить барону место в совете.", response = "Честолюбие лечит ревность — порой. Дорогостоящее средство.", statDeltas = fixed_array(-3, 0, 0, -10, 0, 0, 12, 0, 0)),
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
            prompt = "Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Восстановление", response = "История становится союзником. Живые приверженцы Эдвина становятся врагами.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Узурпация", response = "Честно и унизительно. Потомки будут судить без прикрас.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Опустить суждение", response = "Трусливая мудрость. Учёные ненавидят. Нередко действует.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, восточные банкиры предлагают ссуду под налог на зерно следующего года — если великие дома поставят поручительство. Сначала они хотят вашего слова.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Подписать", response = "Долг привязывает корону к элите. Быстрое золото, медленный поводок.", statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 8, -5, 0)),
            DialogueChoice(choiceText = "Отказаться от иностранных бумаг.", response = "Независимость имеет горький вкус. Армия может заметить пустую казну.", statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Обложить банкиров налогом вместо займа.", response = "Дерзость. Они назовут это разбоем. Ваша казна называет это политикой.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -5, 0, 0)),
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
            prompt = "Ваше Величество, молодой лорд вызвал вашего рыцаря на поединок за оскорбление на пиру. Двор наблюдает — закон правит или кровь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить дуэль", response = "Сталь решает то, что сломали слова. Простолюдины зовут это правосудием.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Запретить дуэли", response = "Порядок побеждает. Знать шепчет, что вы боитесь их клинков.", statDeltas = fixed_array(5, 0, -3, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Оштрафовать оба дома и отменить поединок.", response = "Торговый мир. Обе стороны ненавидят арифметику.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, посол говорит, что северные принцы признают вашу корону, если вы пожалуете пограничное баронство их двоюродному брату.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать баронство", response = "Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Предложить торговые права вместо земли.", response = "Более дешёвая дань. Они назовут это оскорблением. Может устоять.", statDeltas = fixed_array(3, 0, 0, 8, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, пир повара для великих домов превысил бюджет. Казначей винит дворецкого; дворецкий винит вашу щедрость.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить пир", response = "Полные столы, пустая казна. Этой ночью они пьют за ваше имя.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Подать скромную трапезу и объяснить жёсткую экономию.", response = "Жидкий суп, густая гордость. Некоторые лорды это оценят.", statDeltas = fixed_array(5, 0, 0, 5, 0, 0, -5, 5, 0)),
            DialogueChoice(choiceText = "Отменить пир", response = "Упущенный повод для союзов. Сохранённое золото для солдат.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, дом Вейн предлагает мечи, если вы лишите Кроу охотничьих прав в королевском лесу.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лишить Кроу прав.", response = "Один дом доволен, другой в ярости. Леса не голосуют.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отстоять старинную грамоту Кроу.", response = "Традиция побеждает. Наёмники Вейна ищут другого нанимателя.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Поделить лес между обоими.", response = "Никто не рад. Меньше браконьеров, больше тяжб.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать титул", response = "Дешёвое дворянство. Истинные претенденты заметят.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Жёсткая позиция. Друзья просителя превращаются в шептунов.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Отправить его в изгнание с золотом.", response = "Ушёл вместе со сплетнями. Золото потрачено, пожалуй, не зря.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, монетный мастер говорит, что рынки наводнены поддельными дворянскими печатями — ваш лик на фальшивых указах.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Публично повесить фальшивомонетчиков.", response = "Страх освежает уважение. Купцы трепещут по-честному.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отозвать все печати и перевыпустить.", response = "Дорогостоящий порядок. Фальшивые монеты умирают медленно — но умирают.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Игнорировать", response = "Беспечность. Кто-нибудь проверит эту теорию бунтом.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, посланник Эшфорда спрашивает, прибудете ли вы на восточную охоту — или вас назовут слишком простым для благородной потехи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять участие в охоте", response = "Потеха покупает сплетни. Между кабанами вы услышите полезное.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Послать доверенное лицо", response = "Практичная пощёчина. Они измерят ранг посланника.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Оскорбление в облике принципа. Армия одобряет.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, два дома оспаривают приданое невесты — жених погиб в вашем призыве. Оба хотят, чтобы корона рассудила.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Решить в пользу дома невесты.", response = "Милосердие, которое воспринимают как слабость или правосудие — зависит от зала.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Решить в пользу дома жениха", response = "Жёсткий закон. Семьи солдат ликуют.", statDeltas = fixed_array(-5, 0, 5, 8, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Забрать приданое в казну.", response = "Все ненавидят вас одинаково. Казна улыбается.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать кузену Эшфорда место в совете.", response = "Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Предложить менее значимый титул без права голоса в совете.", response = "Полкороны за полверности. Завтра они станут торговаться громче.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Дерзко. Великие дома запомнят, кто отверг страховку.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять союз.", response = "Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Ответить торговой грамотой вместо свадьбы.", response = "Торговля вместо кузенов. Холодно, но дешевле.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость облегчает корону. Дома назовут это высокомерием.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заплатить за новый герб.", response = "Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Оставить герб Эдвина и объявить преемственность.", response = "Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.", statDeltas = fixed_array(-5, 5, -5, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Поднять простой стяг", response = "Скромно. Скучно. Порой выживание носит серый цвет.", statDeltas = fixed_array(0, 0, 3, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Передать восточные поместья верным лордам.", response = "Земля покупает мечи. Крестьяне в тех поместьях завоют.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Продать усадьбы с аукциона.", response = "Золото сейчас, обиды потом. Казна вздохнёт.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Тогда безземельные становятся опасными. Вы выбрали принцип вместо мира.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
            prompt = "Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Встать на сторону цехов", response = "Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.", statDeltas = fixed_array(8, 0, 0, 12, 0, 0, -12, 5, 0)),
            DialogueChoice(choiceText = "Встать на сторону знати", response = "Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.", statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 12, -8, 0)),
            DialogueChoice(choiceText = "Поделить разницу и одинаково разозлить всех.", response = "Справедливость, которая никого не удовлетворяет. Удивительно стабильно — ненадолго.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить молчание.", response = "Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Публично опровергнуть и наказать писца.", response = "Жёсткое опровержение. Двор вам верит или делает вид.", statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Предложить барону место в совете.", response = "Честолюбие лечит ревность — порой. Дорогостоящее средство.", statDeltas = fixed_array(-3, 0, 0, -10, 0, 0, 12, 0, 0)),
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
            prompt = "Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Восстановление", response = "История становится союзником. Живые приверженцы Эдвина становятся врагами.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Узурпация", response = "Честно и унизительно. Потомки будут судить без прикрас.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Опустить суждение", response = "Трусливая мудрость. Учёные ненавидят. Нередко действует.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, восточные банкиры предлагают ссуду под налог на зерно следующего года — если великие дома поставят поручительство. Сначала они хотят вашего слова.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Подписать", response = "Долг привязывает корону к элите. Быстрое золото, медленный поводок.", statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 8, -5, 0)),
            DialogueChoice(choiceText = "Отказаться от иностранных бумаг.", response = "Независимость имеет горький вкус. Армия может заметить пустую казну.", statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Обложить банкиров налогом вместо займа.", response = "Дерзость. Они назовут это разбоем. Ваша казна называет это политикой.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -5, 0, 0)),
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
            prompt = "Ваше Величество, молодой лорд вызвал вашего рыцаря на поединок за оскорбление на пиру. Двор наблюдает — закон правит или кровь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить дуэль", response = "Сталь решает то, что сломали слова. Простолюдины зовут это правосудием.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Запретить дуэли", response = "Порядок побеждает. Знать шепчет, что вы боитесь их клинков.", statDeltas = fixed_array(5, 0, -3, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Оштрафовать оба дома и отменить поединок.", response = "Торговый мир. Обе стороны ненавидят арифметику.", statDeltas = fixed_array(0, 0, 0, 8, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, посол говорит, что северные принцы признают вашу корону, если вы пожалуете пограничное баронство их двоюродному брату.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать баронство", response = "Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Предложить торговые права вместо земли.", response = "Более дешёвая дань. Они назовут это оскорблением. Может устоять.", statDeltas = fixed_array(3, 0, 0, 8, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, пир повара для великих домов превысил бюджет. Казначей винит дворецкого; дворецкий винит вашу щедрость.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить пир", response = "Полные столы, пустая казна. Этой ночью они пьют за ваше имя.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Подать скромную трапезу и объяснить жёсткую экономию.", response = "Жидкий суп, густая гордость. Некоторые лорды это оценят.", statDeltas = fixed_array(5, 0, 0, 5, 0, 0, -5, 5, 0)),
            DialogueChoice(choiceText = "Отменить пир", response = "Упущенный повод для союзов. Сохранённое золото для солдат.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, дом Вейн предлагает мечи, если вы лишите Кроу охотничьих прав в королевском лесу.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лишить Кроу прав.", response = "Один дом доволен, другой в ярости. Леса не голосуют.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отстоять старинную грамоту Кроу.", response = "Традиция побеждает. Наёмники Вейна ищут другого нанимателя.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Поделить лес между обоими.", response = "Никто не рад. Меньше браконьеров, больше тяжб.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать титул", response = "Дешёвое дворянство. Истинные претенденты заметят.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Жёсткая позиция. Друзья просителя превращаются в шептунов.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Отправить его в изгнание с золотом.", response = "Ушёл вместе со сплетнями. Золото потрачено, пожалуй, не зря.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, монетный мастер говорит, что рынки наводнены поддельными дворянскими печатями — ваш лик на фальшивых указах.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Публично повесить фальшивомонетчиков.", response = "Страх освежает уважение. Купцы трепещут по-честному.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отозвать все печати и перевыпустить.", response = "Дорогостоящий порядок. Фальшивые монеты умирают медленно — но умирают.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Игнорировать", response = "Беспечность. Кто-нибудь проверит эту теорию бунтом.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, посланник Эшфорда спрашивает, прибудете ли вы на восточную охоту — или вас назовут слишком простым для благородной потехи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять участие в охоте", response = "Потеха покупает сплетни. Между кабанами вы услышите полезное.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Послать доверенное лицо", response = "Практичная пощёчина. Они измерят ранг посланника.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Оскорбление в облике принципа. Армия одобряет.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, два дома оспаривают приданое невесты — жених погиб в вашем призыве. Оба хотят, чтобы корона рассудила.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Решить в пользу дома невесты.", response = "Милосердие, которое воспринимают как слабость или правосудие — зависит от зала.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Решить в пользу дома жениха", response = "Жёсткий закон. Семьи солдат ликуют.", statDeltas = fixed_array(-5, 0, 5, 8, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Забрать приданое в казну.", response = "Все ненавидят вас одинаково. Казна улыбается.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, восточные лорды требуют места в тайном совете до зимы — иначе назовут ваше правление купеческим переворотом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать кузену Эшфорда место в совете.", response = "Тогда кровь покупает молчание. Эффективно — если вы готовы принять счёт.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 15, 0, 0)),
            DialogueChoice(choiceText = "Предложить менее значимый титул без права голоса в совете.", response = "Полкороны за полверности. Завтра они станут торговаться громче.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Дерзко. Великие дома запомнят, кто отверг страховку.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, из дома Делл прибыло предложение руки — земля в обмен на законность, и законность в обмен на ваше имя того, кто взял трон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять союз.", response = "Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Ответить торговой грамотой вместо свадьбы.", response = "Торговля вместо кузенов. Холодно, но дешевле.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость облегчает корону. Дома назовут это высокомерием.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            prompt = "Ваше Величество, геральдическая канцелярия требует золота за регистрацию вашего герба — иначе на каждых воротах останется герб прежнего короля.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заплатить за новый герб.", response = "Тогда ваша эмблема взовьётся раньше, чем имя станет безопасным. Тщеславие с умыслом.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Оставить герб Эдвина и объявить преемственность.", response = "Опасная символика. Лоялисты ликуют; солдаты переворота хмурятся.", statDeltas = fixed_array(-5, 5, -5, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Поднять простой стяг", response = "Скромно. Скучно. Порой выживание носит серый цвет.", statDeltas = fixed_array(0, 0, 3, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, безземельные лорды разбили лагерь у стен. Они хотят поместья из конфискованных владений Эдвина — иначе будут финансировать ваших врагов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Передать восточные поместья верным лордам.", response = "Земля покупает мечи. Крестьяне в тех поместьях завоют.", statDeltas = fixed_array(-10, 0, 8, -10, 0, 0, 15, -5, 0)),
            DialogueChoice(choiceText = "Продать усадьбы с аукциона.", response = "Золото сейчас, обиды потом. Казна вздохнёт.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Тогда безземельные становятся опасными. Вы выбрали принцип вместо мира.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
            prompt = "Ваше Величество, цеховые мастера говорят, что дворянские пошлины душат торговлю. Знать говорит, что богатство цехов душит родословные. Обе стороны ждут вашей подписи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Встать на сторону цехов", response = "Купцы торжествуют. Великие дома плетут заговоры. Золото течёт быстрее.", statDeltas = fixed_array(8, 0, 0, 12, 0, 0, -12, 5, 0)),
            DialogueChoice(choiceText = "Встать на сторону знати", response = "Знатная кровь аплодирует. Обозы объезжают стороной. Казна пухнет.", statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 12, -8, 0)),
            DialogueChoice(choiceText = "Поделить разницу и одинаково разозлить всех.", response = "Справедливость, которая никого не удовлетворяет. Удивительно стабильно — ненадолго.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 3, 0, 0)),
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
            prompt = "Ваше Величество, по дворцу ходит скандальное письмо — ваше имя рядом с именем баронессы. Барон требует удовлетворения или тишины.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить молчание.", response = "Золото смазывает сплетни. История спит, пока кто-то поголоднее её не разбудит.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Публично опровергнуть и наказать писца.", response = "Жёсткое опровержение. Двор вам верит или делает вид.", statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Предложить барону место в совете.", response = "Честолюбие лечит ревность — порой. Дорогостоящее средство.", statDeltas = fixed_array(-3, 0, 0, -10, 0, 0, 12, 0, 0)),
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
            prompt = "Ваше Величество, хронист спрашивает, как записать ваше правление в летописях родословных — «восстановление» или «узурпация».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Восстановление", response = "История становится союзником. Живые приверженцы Эдвина становятся врагами.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Узурпация", response = "Честно и унизительно. Потомки будут судить без прикрас.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Опустить суждение", response = "Трусливая мудрость. Учёные ненавидят. Нередко действует.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 0)),
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

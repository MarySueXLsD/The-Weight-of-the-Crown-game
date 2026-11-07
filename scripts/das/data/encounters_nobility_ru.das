require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
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
            DialogueChoice(choiceText = "Отказать им в месте", response = "Дерзко. Великие дома запомнят, кто отверг страховку.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, -12, 0, 0)),
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
            prompt = "Ваше Величество, мой дом предлагает брак: земли и родню Деллов — вашей короне, а ваше имя — нашему дому, чтобы он стал королевским. Королевство увидит рождение династии, а не клинок.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять союз.", response = "Тогда чернила скрепляют кровь. Королевство видит рождение династии, а не клинка.", statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 18, 0, 0)),
            DialogueChoice(choiceText = "Ответить торговой грамотой вместо свадьбы.", response = "Торговля вместо кузенов. Холодно, но дешевле.", statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 6, -3, 0)),
            DialogueChoice(choiceText = "Отклонить брак", response = "Гордость облегчает корону. Дома назовут это высокомерием.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, -10, 0, 0)),
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
            DialogueChoice(choiceText = "Отказать безземельным лордам", response = "Тогда безземельные становятся опасными. Вы выбрали принцип вместо мира.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 0, -15, 0, 0)),
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
        characterIdx = CHAR_FARA,
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
        characterIdx = CHAR_INGVAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, мои князья признают вашу корону, если вы пожалуете приграничное баронство их кузену. Маленький клочок земли за большой кусок мира.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать баронство", response = "Земля в обмен на законность за рубежом. Восточные лорды взбунтуются.", statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать в баронстве", response = "Гордость цела. Дипломатия холоднее. Солдаты, возможно, выиграют.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, пир Громма для великих домов сильно превысил смету. Я виню управляющего, управляющий — вашу щедрость. А лорды уже за столом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить пир полностью", response = "Полные столы, пустая казна. Этой ночью они пьют за ваше имя.", statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 15, -5, 0)),
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
        characterIdx = CHAR_KASPAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, дом Вейнов предлагает вам двести мечей, если вы заберёте у Кроу право охоты в королевском лесу и отдадите его Вейнам. Кроу этого так не оставит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лишить Кроу прав.", response = "Один дом доволен, другой в ярости. Леса не голосуют.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отстоять старинную грамоту Кроу.", response = "Традиция побеждает. Мечи Вейнов отправятся искать другого короля.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 10, 0, 0)),
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
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, незаконный сын кузена Эдвина просит о малом титуле — доказательство того, что старая кровь ещё дышит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать ему скромный титул", response = "Дешёвое дворянство. Истинные претенденты заметят.", statDeltas = fixed_array(-3, 0, 0, -8, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Отказать в прошении", response = "Жёсткая позиция. Друзья просителя превращаются в шептунов.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -6, 0, 0)),
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
            DialogueChoice(choiceText = "Отозвать все печати и перевыпустить.", response = "Дорогой порядок. Поддельные печати умирают медленно — но умирают.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Не обращать внимания на подделки", response = "Беспечность. Кто-нибудь проверит эту теорию бунтом.", statDeltas = fixed_array(0, 0, -5, 5, 0, 0, -8, 0, 0)),
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
            DialogueChoice(choiceText = "Отклонить приглашение", response = "Оскорбление в одеждах принципа. Армия одобряет, восток — нет.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, -10, 0, 0)),
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
        characterIdx = CHAR_KASPAR,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, барон Холт отказывается платить королевский налог. Говорит, что его дед воевал за деда Эдвина и этот долг так и не вернули. Половина восточных баронов смотрит, взыщете ли вы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Послать солдат за налогом", response = "Монеты вернутся вместе с выбитыми воротами. Бароны заплатят — и запомнят.", statDeltas = fixed_array(-3, 0, 4, 12, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Простить налог за этот год", response = "Щедро. Теперь каждый барон, у которого был дед, напишет вам письмо.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Заплатить старый долг титулом, а не монетой", response = "Ловко. Титул стоит вам только чернил. Холт будет хвастаться им на каждом пиру.", statDeltas = fixed_array(0, 0, 0, 4, 0, 0, 5, 0, 0)),
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
        characterIdx = CHAR_YVETTE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, мои баржи платят пошлину у каждого лордского моста отсюда до моря — всего одиннадцать пошлин. Пока зерно доплывает до столицы, оно дорожает втрое. Отмените пошлины — или мои баржи встанут.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Отменить речные пошлины", response = "Хлеб подешевеет, а одиннадцать лордов разозлятся. Реке всё равно.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -12, 8, 0)),
            DialogueChoice(choiceText = "Выкупить пошлины в пользу короны", response = "Дорого. Зато теперь пошлину берёт корона — и сама решает её размер.", statDeltas = fixed_array(3, 0, 0, -15, 0, 0, 4, 4, 0)),
            DialogueChoice(choiceText = "Не трогать пошлины", response = "Тогда лорды улыбнутся, а пекари поднимут цены.", statDeltas = fixed_array(-6, 0, 0, 0, 0, 0, 6, -5, 0)),
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
            prompt = "Ваше Величество, на сегодняшнем пиру кто-то должен сидеть по правую руку от вас. Каждый дом уверен, что это он. Ошибётесь — и три дома уйдут до десерта.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Посадить леди Эшфорд", response = "Тогда восток доволен, а юг запоминает обиду.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Посадить старейшего из лордов", response = "С традицией трудно спорить. Старый лорд Фенн уснёт ещё до супа.", statDeltas = fixed_array(0, 2, 0, 0, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Посадить героя из армии", response = "Лорды оскорблены. К полуночи об этом узнают солдаты — и обрадуются.", statDeltas = fixed_array(3, 0, 8, 0, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, крестьяне в поместье лорда Варроу сожгли его амбары. Он избивал их за то, что в голодную зиму они ставили силки на кроликов. Он просит солдат. Они просят справедливости.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Послать солдат к Варроу", response = "Пожары потушат. Злость — нет.", statDeltas = fixed_array(-10, 0, 3, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Судить Варроу за жестокость", response = "Лорда судят за избиение крестьян. Деревни поют. Замки дрожат.", statDeltas = fixed_array(12, 0, 0, 0, 0, 0, -12, 0, 0)),
            DialogueChoice(choiceText = "Оплатить новые амбары и простить всех", response = "Мир, купленный за брёвна. Дорого, зато на этой неделе никого не повесят.", statDeltas = fixed_array(4, 0, 0, -10, 0, 0, 3, 2, 0)),
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
            prompt = "Ваше Величество, три знатных дома хотят купить звание «Поставщик вина королевского двора». Оно ничего не значит — кроме печати на бочке и цены повыше. Устроить аукцион?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Продать звание с аукциона", response = "Два дома проиграют и надуются. Один выиграет и задерёт цены. Казна поёт.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -3, 0, 0)),
            DialogueChoice(choiceText = "Отдать дому, что служил лучше всех", response = "Верность вознаграждена вином. Проигравшие пьют своё с горечью.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Не продавать королевских званий", response = "Благородно. Дома сочтут вас наивным. Купцы — честным.", statDeltas = fixed_array(3, 0, 0, -3, 0, 0, -2, 0, 0)),
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
            prompt = "Ваше Величество, лорды хотят, чтобы их старшие сыновья служили пажами при дворе. Старый обычай: их дети в вашем дворце. Одни называют это честью, другие — заложничеством.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять знатных пажей", response = "Теперь у каждого лорда есть причина беречь вашу жизнь. И шпион в ваших залах.", statDeltas = fixed_array(0, 0, 2, -5, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Взять пажей из купеческих семей", response = "Купцы в восторге. Лорды оскорблены.", statDeltas = fixed_array(4, 0, 0, 5, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Отменить обычай", response = "Ни заложников, ни шпионов, ни услуг. Двор опустел.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -4, 0, 0)),
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
            prompt = "Ваше Величество, личное войско лорда Браннока больше моего восточного гарнизона. Он говорит, что охраняет рудники. А я говорю: лорд с тремя тысячами копий охраняет не рудники.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Приказать распустить половину", response = "Он подчинится — неспешно. Половина его людей уйдёт в разбойники, половина — ко мне.", statDeltas = fixed_array(0, 0, 6, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Нанять его войско на службу короне", response = "Тогда его копья ваши — пока вы платите. Браннок слишком доволен таким уговором.", statDeltas = fixed_array(0, 0, 10, -12, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Оставить его в покое", response = "Тогда молитесь, чтобы рудники оставались его единственным интересом.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, мой кузен хочет жениться на дочери мельника. Наш дом запрещает. Деревня девушки говорит, что любовь сильнее титулов. Скажет ли что-нибудь корона?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Благословить брак", response = "Народ обожает истории о любви. Моя семья не пригласит вас на свадьбу.", statDeltas = fixed_array(8, 3, 0, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Поддержать решение дома", response = "Порядок сохранён. Одно сердце разбито. О порядке песен не поют.", statDeltas = fixed_array(-4, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Дать дочери мельника скромный титул", response = "Вопрос решён чернилами. Другие дома боятся, что вы повторите.", statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)),
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
        characterIdx = CHAR_MORWEN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, сын лорда Тесселя убил слугу в пьяной драке. По старому закону знатный платит виру вместо петли. Семья слуги хочет верёвки.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить, как любого другого", response = "Один закон для всех. Народ будет помнить это годами. Тессель — тоже.", statDeltas = fixed_array(12, 0, 0, 0, 0, 0, -14, 0, 0)),
            DialogueChoice(choiceText = "По старому закону — вира", response = "Золото за жизнь. По закону. Улицы называют это иначе.", statDeltas = fixed_array(-10, 0, 0, 3, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Изгнать сына, удвоить виру", response = "Без петли и без пощады. Никто не рад, но жить с этим можно.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -3, 0, 0)),
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
        characterIdx = CHAR_GOOSE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, я хочу устроить турнир в вашу честь. Конные поединки, стрельба из лука и гусиные бега. Лорды приедут похвастаться. Народ — посмеяться. А заплатите вы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Устроить большой турнир", response = "Знамёна, трубы и гусь, выигравший забег, укусив фаворита. Незабываемо.", statDeltas = fixed_array(8, 0, 3, -15, 0, 0, 10, -3, 0)),
            DialogueChoice(choiceText = "Скромный турнир, без гусей", response = "Достойно. Скучно. Лорды всё равно приедут, народ останется дома.", statDeltas = fixed_array(0, 0, 2, -6, 0, 0, 5, 0, 0)),
            DialogueChoice(choiceText = "Отменить турнир", response = "Лорды ворчат о короле, который не умеет праздновать.", statDeltas = fixed_array(-2, 0, 0, 4, 0, 0, -6, 0, 0)),
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
            prompt = "Ваше Величество, знать не платит ни соляной, ни дорожной, ни мостовой подати — привилегии со времён прадеда Эдвина. Если бы они платили как купцы, к весне казна была бы полна.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Отменить привилегии знати", response = "Полная казна, пустая дружба. Каждый замок назовёт вас купеческим королём.", statDeltas = fixed_array(6, 0, 0, 18, 0, 0, -15, 0, 0)),
            DialogueChoice(choiceText = "Обложить только богатейшие дома", response = "Половина золота, половина злости. Бедные лорды втайне благодарны.", statDeltas = fixed_array(2, 0, 0, 8, 0, 0, -5, 0, 0)),
            DialogueChoice(choiceText = "Сохранить старые привилегии", response = "Лорды пьют за вашу мудрость. Борвин не пьёт ни за что.", statDeltas = fixed_array(-4, 0, 0, -4, 0, 0, 8, 0, 0)),
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
            prompt = "Ваше Величество, на прошлой неделе лорд Корран совершил набег на северную деревню — для забавы, по его словам. Мои князья спрашивают, подчиняются ли ваши лорды вам — или только самим себе.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выдать Коррана северу на суд", response = "Князья впечатлены. Ваши лорды в ужасе: вы отдали одного из них.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, -12, 0, 0)),
            DialogueChoice(choiceText = "Наказать его самому и заплатить деревне", response = "Суд дома, монета за границей. Обе стороны могут назвать это честным.", statDeltas = fixed_array(0, 0, 2, -10, 0, 0, -4, 0, 0)),
            DialogueChoice(choiceText = "Защитить Коррана — это была пограничная стычка", response = "Ваши лорды ликуют. Север точит копья.", statDeltas = fixed_array(0, 0, -6, 0, 0, 0, 10, 0, 0)),
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
        characterIdx = CHAR_ILANA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, леди Рен держит салон, где поэты читают стихи о королях. Есть стихи и о вас. Не все из них добрые. Лорды обожают её вечера.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Явиться в салон лично", response = "Поэты заикаются. Леди Рен очарована. К пятнице стихи становятся добрее.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Закрыть салон", response = "Тогда стихи переберутся в таверны и зарифмуются со словами похуже.", statDeltas = fixed_array(-4, 0, 0, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Заплатить поэту за хвалебные стихи", response = "Одна хвалебная поэма среди десяти насмешливых. Все знают, кто заплатил.", statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 2, 0, 0)),
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
            prompt = "Ваше Величество, лорд Пенхоллоу не пускает моих лекарей за свои стены. В его деревнях лихорадка, но он боится, что его семья заразится от «простых рук».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Открыть ворота лекарям силой", response = "Больные получат лекарства, а Пенхоллоу — обиду. Честный обмен.", statDeltas = fixed_array(4, 0, -2, 0, 10, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Послать придворного лекаря, а не простых", response = "Дорого, вежливо и медленно. Лихорадка не вежлива.", statDeltas = fixed_array(0, 0, 0, -8, 5, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Уважить его волю", response = "Его семья в безопасности за стенами. Его деревни — нет.", statDeltas = fixed_array(-6, 0, 0, 0, -10, 0, 5, 0, 0)),
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
            prompt = "Ваше Величество, половина вашей знати должна моему банку больше, чем стоят их земли. Я мог бы забрать их замки хоть завтра. Но предпочёл бы, чтобы корона выкупила их долги — с честной скидкой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выкупить долги знати", response = "Теперь лорды должны вам, а не мне. Поводок есть поводок, в чьей бы руке он ни был.", statDeltas = fixed_array(0, 0, 0, -18, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Пусть Солт забирает замки", response = "Лорды-банкиры. Старые дома никогда не простят, что вы это позволили.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, -15, 0, 0)),
            DialogueChoice(choiceText = "Отменить проценты королевским указом", response = "Лорды вас полюбят. Мой банк — нет. Другие банки запомнят.", statDeltas = fixed_array(0, 0, 0, -6, 0, 0, 10, 0, 0)),
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
            prompt = "Ваше Величество, в старом зале совета для каждого великого дома вырезано кресло. Четыре кресла пустуют со дня переворота. Заполнить их новыми семьями — или оставить пустыми в назидание?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Возвысить четыре новых семьи", response = "Новые лорды, благодарные лорды. Старые дома зовут их выскочками.", statDeltas = fixed_array(3, 0, 0, -6, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Вернуть кресла наследникам старых семей", response = "Щедрость к бывшим врагам. Кто-то отплатит добром. Кто-то — нет.", statDeltas = fixed_array(0, 0, -3, 0, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Оставить пустыми", response = "Четыре пустых кресла громче любой речи.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_GROMM,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, лорды охотятся в королевском лесу и бросают половину оленей гнить. Деревни у леса голодают. Они спрашивают, можно ли им забирать то, что лорды выбрасывают.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Разрешить деревням забирать остатки", response = "Оленина в крестьянских котлах. Лорды находят это вульгарным, деревни — вкусным.", statDeltas = fixed_array(8, 0, 0, 0, 2, 0, -4, 5, 0)),
            DialogueChoice(choiceText = "Ограничить, сколько оленей лорды могут убить", response = "Меньше трофеев, больше дичи в лесу. Лорды дуются за ужином.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -6, 3, 0)),
            DialogueChoice(choiceText = "Лес принадлежит лордам", response = "Тогда олени спокойно гниют, а деревни браконьерствуют тайком.", statDeltas = fixed_array(-6, 0, 0, 0, 0, 0, 6, 0, 0)),
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
            prompt = "Ваше Величество, лорд Остранд нашёл серебро в своих холмах. По закону треть каждого серебряного рудника принадлежит короне. Он говорит, что закон старше вашего правления и к вам не относится.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Потребовать долю короны", response = "Закон есть закон, даже для серебра. Остранд заплатит — и затаит злобу.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Взять долю поменьше в обмен на мир", response = "Десятина сейчас, друг потом. Возможно.", statDeltas = fixed_array(0, 0, 0, 6, 0, 0, 3, 0, 0)),
            DialogueChoice(choiceText = "Оставить ему всё", response = "Остранд станет очень богат и очень к вам привязан. Пока к нему не привяжется кто-то богаче.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 8, 0, 0)),
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
            prompt = "Ваше Величество, мой дом оскорблён: один южный лорд нарисовал мой герб на двери своего нужника. Я требую публичных извинений — или получу удовлетворение сталью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Приказать публично извиниться", response = "Он извинится сквозь зубы. Дверь перекрасят. Своего рода мир.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Позволить им поединок", response = "Кровь из-за двери нужника. Летописцы будут смеяться сто лет.", statDeltas = fixed_array(-2, 0, 2, 0, 0, 0, -4, 0, 0)),
            DialogueChoice(choiceText = "Отшутиться при всём дворе", response = "Двор смеётся вместе с вами. Каспар не смеётся вовсе.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -6, 0, 0)),
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
            prompt = "Ваше Величество, леди Марроу, кузина Эдвина, всё ещё носит траур и отказывается вам кланяться. Больше она ничего не делала. Стража спрашивает, считается ли отказ поклониться изменой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пусть горюет спокойно", response = "Милость к вдове. Старые семьи это заметят и немного смягчатся.", statDeltas = fixed_array(2, 2, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Удалить её от двора", response = "Одним чёрным платьем на пирах меньше. Шёпота за спиной — больше.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Навестить её и предложить содержание", response = "От денег она откажется, но визит запомнит.", statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 5, 0, 0)),
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
        characterIdx = CHAR_ELINA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, лорды платят мне за песни о славе их предков. Народ — за песни о жадности лордов. Обе продаются. Какую песню дворец услышит в праздник?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Песню о славе знати", response = "Лорды плачут в вино. Кухонная прислуга закатывает глаза.", statDeltas = fixed_array(-3, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Песню о жадности знати", response = "В зале тишина. Слуги напевают её целый месяц.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Новую песню о королевстве", response = "Никто не оскорблён, и завтра никто не вспомнит. Безопасная песня.", statDeltas = fixed_array(2, 0, 0, -3, 0, 0, 2, 0, 0)),
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
        characterIdx = CHAR_OTTO,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, молодые лорды хотят собрать королевскую конную роту — за свой счёт и под своими цветами. Храбрые юнцы. Они хотят скакать под вашим знаменем, но командовать собой сами.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Согласиться, но под командой королевского капитана", response = "Ворчат на капитана, но скачут хорошо.", statDeltas = fixed_array(0, 0, 8, 0, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Согласиться на их условиях", response = "Прекрасные кони, прекрасные доспехи — и никто не слушает Рудольфа.", statDeltas = fixed_array(0, 0, 4, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Отказать знатным ротам", response = "Одна армия, одно командование. Молодые лорды уедут домой скучать, а скука опасна.", statDeltas = fixed_array(0, 0, 2, 0, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, лорд Харгрейв хочет завещать своё поместье Церкви, чтобы обойти королевский налог на наследство. Его сыновья в ярости. Церковь очень довольна.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Разрешить дар Церкви", response = "Бог получает поместье. Корона теряет налог. Сыновья теряют всё.", statDeltas = fixed_array(0, 12, 0, -5, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Запретить — земля остаётся в семье", response = "Сыновья благодарят. Церковь упомянет вас в воскресной проповеди, и недобро.", statDeltas = fixed_array(0, -8, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Разрешить, но обложить дар налогом", response = "Каждый что-то платит. Каждый немного недоволен.", statDeltas = fixed_array(0, 4, 0, 6, 0, 0, -2, 0, 0)),
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
        characterIdx = CHAR_YVETTE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, мой дом построит вам каменный мост через Быструю — если на нём высекут имя нашей семьи, а пошлину с него пятьдесят лет будем собирать мы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять сделку", response = "Мост бесплатно, пошлина — навечно. Юг стал чуть больше принадлежать Кроу.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, 8, 3, 0)),
            DialogueChoice(choiceText = "Построить на деньги короны", response = "Ваше имя на камне и ваши деньги в реке. Дорого, зато своё.", statDeltas = fixed_array(5, 0, 0, -15, 0, 0, -3, 3, 0)),
            DialogueChoice(choiceText = "Пока без моста", response = "Паромщики довольны. Остальные ждут.", statDeltas = fixed_array(-2, 0, 0, 0, 0, 0, -3, 0, 0)),
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
            prompt = "Ваше Величество, земли лорда Данмора пустуют с тех пор, как он сбежал с казной Эдвина. Теперь их обрабатывают поселенцы — семьи без своей земли. Его наследник требует их выгнать.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Отдать землю поселенцам", response = "Новые крестьяне, верные крестьяне. Наследник уходит к вашим врагам.", statDeltas = fixed_array(10, 0, 0, 0, 0, 0, -10, 5, 0)),
            DialogueChoice(choiceText = "Вернуть землю наследнику", response = "Закон соблюдён. Семьи на дороге. Раймонд это запомнит.", statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 8, -3, 0)),
            DialogueChoice(choiceText = "Земля за наследником, но он сдаёт её им", response = "Никто не владеет всем, но все хоть что-то едят.", statDeltas = fixed_array(4, 0, 0, 0, 0, 0, 2, 2, 0)),
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
        characterIdx = CHAR_KNOX,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, у меня есть письма о том, что управляющий леди Эшфорд продавал ваше зерно северу. Не сама Эшфорд — скорее всего. Используйте письма, продайте их ей обратно — или сожгите.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Публично обвинить управляющего", response = "Управляющего повесят. Эшфорд улыбнётся и возненавидит вас за позор.", statDeltas = fixed_array(3, 0, 0, 0, 0, 0, -8, 4, 0)),
            DialogueChoice(choiceText = "Тайно передать письма Эшфорд", response = "Теперь она вам обязана. А быть обязанной она не любит.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Сжечь их", response = "Тогда управляющий продолжит торговать, а вы — гадать.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, -5, 0)),
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
            prompt = "Ваше Величество, академия для знати учит молодых лордов закону, войне и танцам. Она просит денег у короны. Её выпускники однажды будут управлять вашим королевством — вопрос лишь, чему их научат.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить и добавить уроки управления", response = "Будущие лорды, умеющие считать. Редкая и ценная вещь.", statDeltas = fixed_array(0, 0, 2, -12, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Открыть её и для купеческих сыновей", response = "Лорды протестуют. Купцы платят вдвое, лишь бы попасть.", statDeltas = fixed_array(4, 0, 0, 5, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Отказать в деньгах", response = "Тогда академия будет учить только танцам. Грациозные, бесполезные лорды.", statDeltas = fixed_array(0, 0, 0, 3, 0, 0, -4, 0, 0)),
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
            prompt = "Ваше Величество, мой дом поймал знаменитого разбойника, Рыжего Лиса, который грабил только знатные повозки. Народ зовёт его героем. Мы хотим повесить его на нашей площади.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пусть дом Делл его повесит", response = "Знать аплодирует. Народ сделает его мучеником и будет петь о нём годами.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Помиловать и взять в королевскую армию", response = "Знаменитый разбойник в ваших цветах. Знать в ярости, новобранцев прибавилось.", statDeltas = fixed_array(8, 0, 6, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Тихо заточить в тюрьму", response = "Ни петли, ни легенды. Просто камера и слухи.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 2, 0, 0)),
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
            prompt = "Ваше Величество, лорд Фенвик спрятал три амбара зерна, пока цены растут. Это законно. И именно поэтому в его городе бунтуют пекари.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить его зерно по честной цене", response = "Бунт кончится. Фенвик разбогатеет — чего он и добивался.", statDeltas = fixed_array(5, 0, 0, -12, 0, 0, 4, 10, 0)),
            DialogueChoice(choiceText = "Отобрать зерно", response = "Хлеб для города, страх для замков.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -12, 12, 0)),
            DialogueChoice(choiceText = "Это законно — ничего не делать", response = "Тогда пекари продолжат бунтовать, а Фенвик — ждать.", statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 6, -4, 0)),
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
            prompt = "Ваше Величество, моей дочери исполняется шестнадцать. Восток ждёт королевского подарка на её именины. Мелочь. Но размер подарка измерит каждый дом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Богатый подарок — серебряная диадема", response = "Восток польщён. Юг спрашивает, когда шестнадцать исполнится его дочерям.", statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 12, 0, 0)),
            DialogueChoice(choiceText = "Скромный подарок — книга стихов", response = "Со вкусом. Недорого. Эшфорд гадает, не оскорбление ли это.", statDeltas = fixed_array(0, 0, 0, -2, 0, 0, 2, 0, 0)),
            DialogueChoice(choiceText = "Пригласить её ко двору фрейлиной", response = "Великая честь — и Эшфорд в ваших залах каждый день.", statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 10, 0, 0)),
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
        characterIdx = CHAR_GOOSE,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, лорды жалуются, что я сижу на пирах слишком близко к вам. Говорят, шуту место с собаками. А я говорю, что собаки — компания получше большинства из них.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оставить Гуся рядом", response = "Лорды дуются. Гусь торжествующе гогочет. Народу смешно.", statDeltas = fixed_array(5, 0, 0, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Посадить его с собаками, как просят", response = "Гусь кланяется и ест из серебряной миски на полу. Почему-то хуже выглядят лорды.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Сделать его Лордом пира на одну ночь", response = "Шут командует знатью. Хаос, песни и одна очень долгая ночь.", statDeltas = fixed_array(8, 0, 0, -5, 0, 0, -8, 0, 0)),
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
            prompt = "Ваше Величество, я держу восточный перевал и делаю это бесплатно со дня переворота. Моим людям нужны зимние плащи, а стенам — камень. Восток ни о чём не просит — кроме этого.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить плащи и камень", response = "Перевал закрыт для налётчиков. Всю зиму Каспар говорит о вас тепло.", statDeltas = fixed_array(0, 0, 6, -12, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Прислать королевских солдат на смену его людям", response = "Ваши солдаты на его перевале. Он называет это помощью, а думает — захват.", statDeltas = fixed_array(0, 0, 4, -6, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Восток может сам купить себе плащи", response = "Восток запомнит, кто платил, а кто нет.", statDeltas = fixed_array(0, 0, -4, 0, 0, 0, -6, 0, 0)),
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
        characterIdx = CHAR_FARA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, по старому закону знатный, занявшись торговлей, теряет честь. Поэтому лорды прячутся за купцами-компаньонами и не платят торговую пошлину. Пусть торгуют открыто — и платят, как мы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Разрешить знати открыто торговать и обложить налогом", response = "Честь уцелела. Скрытые доходы — нет.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -4, 0, 0)),
            DialogueChoice(choiceText = "Строго соблюдать старый закон", response = "Лорды теряют тайных компаньонов. И громко винят вас.", statDeltas = fixed_array(0, 0, 0, 4, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Ничего не менять", response = "Гильдии платят, лорды прячутся, а Фара запоминает.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 5, 0, 0)),
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
        characterIdx = CHAR_ILANA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, великую книгу знатных родов пора обновить. Три семьи утверждают, что они древнее самой короны. Если я это запишу, через сто лет это станет правдой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Записать, как говорят семьи", response = "Три гордых дома. Одна чуть меньшая корона.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 0)),
            DialogueChoice(choiceText = "Записать только то, что доказано", response = "Честная история. Три семьи теперь ненавидят историков.", statDeltas = fixed_array(0, 2, 0, 0, 0, 0, -6, 0, 0)),
            DialogueChoice(choiceText = "Продавать право быть «древним»", response = "История на продажу. Казна благодарна. Будущие учёные — нет.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, 2, 0, 0)),
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
            prompt = "Ваше Величество, знатные офицеры отказываются подчиняться капитанам из простых, даже хорошим. В бою такая гордость стоит жизней.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повышать только по заслугам", response = "Армия воюет лучше. Знатные офицеры обиженно уходят в отставку — некоторые.", statDeltas = fixed_array(3, 0, 10, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Разделить знатные и простые роты", response = "Две армии в одной. Работает, пока не придётся воевать вместе.", statDeltas = fixed_array(0, 0, 2, -4, 0, 0, 4, 0, 0)),
            DialogueChoice(choiceText = "Знатное происхождение сохраняет чин", response = "Лорды довольны. Лучшие капитаны ищут другую работу.", statDeltas = fixed_array(-3, 0, -8, 0, 0, 0, 8, 0, 0)),
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
            prompt = "Ваше Величество, лорды заказывают шёлк, пряности и стекло с юга — в кредит, от вашего имени, как «королевские гости». Купцы хотят, чтобы счета оплатила корона.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Оплатить счета один раз", response = "Оплачено. Лорды узнали, что ваше имя — кошелёк.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 8, 0, 0)),
            DialogueChoice(choiceText = "Отправить счета лордам", response = "Смущённые лорды платят — медленно. Купцы снова верят короне.", statDeltas = fixed_array(0, 0, 0, 3, 0, 0, -8, 0, 0)),
            DialogueChoice(choiceText = "Запретить покупки от имени короны", response = "Простой указ. Лорды зовут его скупостью, купцы — здравым смыслом.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -3, 0, 0)),
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
        characterIdx = CHAR_MORWEN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, лорда Грейвза поймали на продаже поддельных грамот на землю. По обычаю знати он может сам выбрать смерть — отравленное вино или меч. А можно просто его повесить.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить выбрать, как велит обычай", response = "Он выберет вино и умрёт как лорд. Обычай уцелел.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Повесить, как простого подделыщика", response = "Народ ликует. Каждый знатный немного чувствует верёвку на шее.", statDeltas = fixed_array(8, 0, 0, 0, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Забрать земли и сохранить жизнь", response = "Нищий лорд — живой урок. Казне этот урок нравится.", statDeltas = fixed_array(0, 0, 0, 12, 0, 0, -4, 0, 0)),
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
            prompt = "Ваше Величество, на зимних балах знать выбрасывает столько еды, что моему нижнему кварталу хватило бы на месяц. Я прошу лишь, чтобы объедки шли на мою кухню, а не свиньям.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Приказать отдавать объедки бедным", response = "Объедки знати в очереди за похлёбкой. Лорды зовут это унижением. Бедные — ужином.", statDeltas = fixed_array(8, 4, 0, 0, 3, 0, -6, 3, 0)),
            DialogueChoice(choiceText = "Вежливо попросить лордов", response = "Двое лордов согласятся. Остальные из упрямства накормят свиней.", statDeltas = fixed_array(2, 2, 0, 0, 0, 0, 0, 1, 0)),
            DialogueChoice(choiceText = "Их пиры — их дело", response = "Свиньи этой зимой очень жирные.", statDeltas = fixed_array(-5, -2, 0, 0, 0, 0, 4, 0, 0)),
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
            prompt = "Ваше Величество, северный князь хочет посетить ваш двор с двумястами всадников. Как гость. Ваши лорды спрашивают, гость ли тот, кто едет с двумястами всадников.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять его со всеми всадниками", response = "Смелый приём. Лорды держат мечи под рукой за столом.", statDeltas = fixed_array(0, 0, -4, -8, 0, 0, 4, -4, 0)),
            DialogueChoice(choiceText = "Принять, но только с двадцатью всадниками", response = "Разумный хозяин. Князь обижен, но приедет.", statDeltas = fixed_array(0, 0, 3, -4, 0, 0, 6, 0, 0)),
            DialogueChoice(choiceText = "Отказать в визите", response = "Ваши лорды спят спокойнее. Север — меньше.", statDeltas = fixed_array(0, 0, 2, 0, 0, 0, 3, 0, 0)),
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

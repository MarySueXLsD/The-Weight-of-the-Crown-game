require engine.core
require constants
require dialogue_types

module encounters_ru public


let public allEncountersRuEarly : Encounter[POOL_EARLY_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Солдаты проливали кровь, чтобы посадить вас на трон. Теперь они ждут монет. Если казна промолчит, мечи тоже могут заговорить.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить армии полностью.",
                response = "Солдаты запомнят щедрого короля. По крайней мере, до следующего жалования.",
                statDeltas = fixed_array(0, 0, 20, -25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить половину и пообещать остальное позже.",
                response = "Половина монеты покупает половину спокойствия. Но сегодня этого хватит.",
                statDeltas = fixed_array(0, 0, 8, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Служба королю — уже честь.",
                response = "Честь не звенит в кошеле. Я надеюсь, ваши стены крепче вашей щедрости.",
                statDeltas = fixed_array(0, 0, -20, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сколько солдат действительно участвовало в перевороте?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Меньше, чем указано в списках. Командиры приписали мёртвых, хромых и тех, кто в ту ночь спал пьяным.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить только честным.",
                response = "Справедливо. Но обманутые командиры начнут ворчать.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить всем, чтобы не злить армию.",
                response = "Щедрый приказ. Даже лжецы будут славить вас громко.",
                statDeltas = fixed_array(0, 0, 18, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заморозить выплаты до проверки.",
                response = "Проверки кормят бумагу, не солдат. Я предупреждал.",
                statDeltas = fixed_array(0, 0, -12, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, народ знает вашу корону, но не знает, благословлена ли она. Сегодня церковь должна решить, как называть вас: королём или узурпатором.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Попросить церковь о благословении.",
                response = "Смирение — хорошее начало для того, кто пришёл к трону через кровь.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать признания моей власти.",
                response = "Приказы доходят до солдат. До небес они поднимаются хуже.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Предложить церкви союз.",
                response = "Союз трона и алтаря может спасти страну. Или задушить её.",
                statDeltas = fixed_array(0, 10, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После проповеди к монастырю пришло больше голодных, чем обычно. Они верят, что храм накормит их, если король не может.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Передать монастырю зерно.",
                response = "Сегодня вера будет пахнуть хлебом.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть монастырь сам кормит людей.",
                response = "Мы попробуем. Но пустой котёл не становится святым от молитвы.",
                statDeltas = fixed_array(0, -5, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить стражу разогнать очередь.",
                response = "Голодных можно разогнать. Голод — нет.",
                statDeltas = fixed_array(0, -10, 8, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы собирают десятину. Казна собирает налоги. Народ скоро поймёт, что платит дважды.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ограничить церковную десятину.",
                response = "Казна благодарна. Алтарь будет шипеть.",
                statDeltas = fixed_array(0, -20, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить десятину церкви.",
                response = "Священники любят, когда их золото называют верой.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Собирать налоги вместе с церковью.",
                response = "Двойная рука в одном кармане. Удобно, но опасно.",
                statDeltas = fixed_array(0, 5, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет отправить священников в казармы. Говорит, солдатам нужна душа. Солдатам нужен хлеб и сталь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить священников в казармах.",
                response = "Если они начнут учить солдат милосердию, я выставлю их сам.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить им вход.",
                response = "Казармы останутся казармами, а не молитвенным залом.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пускать только перед битвами.",
                response = "Перед смертью люди охотнее слушают богов. С этим спорить трудно.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди отказываются пить кипячённую воду. Они покупают святую. Она из того же грязного колодца.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить продажу святой воды.",
                response = "Спасибо. Болезнь не исчезнет от молитвы над грязью.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Приказать храмам кипятить воду перед освящением.",
                response = "Хорошо. Пусть вера хотя бы не переносит заразу.",
                statDeltas = fixed_array(0, 5, 0, -3, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться в обряды.",
                response = "Тогда я буду лечить последствия вашей осторожности.",
                statDeltas = fixed_array(0, 8, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь объявила пост. Мяса есть будут меньше, это хорошо. Но солдаты уже спрашивают, почему богам нужна их похлёбка.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пост для всех, включая армию.",
                response = "Репа станет святой. Солдаты — злые.",
                statDeltas = fixed_array(0, 10, -15, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Пост только для дворца.",
                response = "Вот это зрелище: придворные страдают почти как люди.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отменить пост для армии.",
                response = "Солдаты будут сыты. Священники — голодны до возмущения.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У главного храма собралась толпа. Они требуют, чтобы церковь сказала, законный ли вы король.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Поставить стражу у храма.",
                response = "Копья удержат двери. Не вопросы.",
                statDeltas = fixed_array(0, -5, 8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Позволить толпе слушать проповедь.",
                response = "Хорошо. Но если слова станут искрами, я предупреждал.",
                statDeltas = fixed_array(0, 8, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать хлеб перед храмом.",
                response = "Сытый человек кричит реже. Иногда это лучшая охрана.",
                statDeltas = fixed_array(0, 5, 0, 0, 10, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Король, который спорит с церковью, получает врага в каждом храме. Король, который ей подчиняется, теряет трон без боя.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать церкви больше прав.",
                response = "Алтарь улыбнётся. Трон станет чуть ниже.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ограничить церковь законом.",
                response = "Смелый шаг. Такие шаги часто слышны у эшафота.",
                statDeltas = fixed_array(0, -20, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сохранять равновесие.",
                response = "Равновесие редко красиво. Зато иногда живёт дольше.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После открытия церкви люди покупают свечи, иконы, амулеты. Я могу наладить торговлю. И отдать вам долю.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить торговлю святынями.",
                response = "Вера продаётся лучше хлеба. И хранится дольше.",
                statDeltas = fixed_array(0, -8, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить наживаться на вере.",
                response = "Благородно. Очень невыгодно.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить только храмовые товары.",
                response = "Монополия святости. Церковь быстро учится торговле.",
                statDeltas = fixed_array(0, 8, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники привели человека, который плевал на храмовые двери. Они требуют публичной казни.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казнить его.",
                response = "Площадь снова получит урок. Надеюсь, он будет стоить этой крови.",
                statDeltas = fixed_array(0, 15, 5, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Посадить в темницу.",
                response = "Тюрьма тише виселицы. Но священники любят громкие ответы.",
                statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить его публично извиниться.",
                response = "Редкий день, когда язык заменил петлю.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы жгут ладан против заразы. Красиво пахнет. Бесполезно лечит. У меня есть травы получше.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить травы у Сивил.",
                response = "Травы грубее молитв, зато чаще работают.",
                statDeltas = fixed_array(0, -5, 0, -12, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поддержать храмовый ладан.",
                response = "Тогда пусть болезнь задохнётся от аромата. Если сможет.",
                statDeltas = fixed_array(0, 10, 0, -5, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Смешать травы с церковным ладаном.",
                response = "Вот это уже почти умно. Даже обидно.",
                statDeltas = fixed_array(0, 5, 0, -10, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мой князь спрашивает, правда ли ваша церковь теперь правит вместе с вами. На севере таких королей называют мягкими.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сказать, что церковь — мой союзник.",
                response = "Север услышит. И решит, что вы делите меч с молитвой.",
                statDeltas = fixed_array(0, 10, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сказать, что церковь подчиняется трону.",
                response = "Хорошо. Север уважает тех, кто держит алтарь за горло.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не отвечать на провокацию.",
                response = "Молчание бывает мудрым. Но соседи часто слышат в нём страх.",
                statDeltas = fixed_array(0, 0, -3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Во дворце ещё служат люди прежнего короля. Если прогнать всех, дворец ослепнет. Если оставить всех, вы будете спать среди чужой памяти.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Прогнать всех старых слуг.",
                response = "Дворец станет чище. И куда глупее.",
                statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить тех, кто принесёт новую клятву.",
                response = "Клятва не всегда верность. Но это начало.",
                statDeltas = fixed_array(0, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить всех.",
                response = "Машина дворца продолжит работать. Вопрос — на кого.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Кто из них опасен?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Опаснее всех те, кто молчит слишком правильно. Преданный слуга всегда немного человек. Шпион — всегда мебель.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Составить список подозрительных.",
                response = "Список не спасёт вас сам, но подскажет, кому не доверять вино.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить только ближайших к трону.",
                response = "Мягкая чистка. Иногда мягкий нож режет точнее.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Никого не трогать.",
                response = "Тогда дворец будет улыбаться вам прежними зубами.",
                statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Северные разведчики перешли границу. Это может быть проверка. Разрешите ударить первыми?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ударить первыми.",
                response = "Так говорят короли, которых не пробуют дважды.",
                statDeltas = fixed_array(0, 0, 20, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Усилить границу, но не атаковать.",
                response = "Осторожная сила. Не худший язык для границы.",
                statDeltas = fixed_array(0, 0, 10, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить посла.",
                response = "Слова дешевле крови. Пока другая сторона не решит иначе.",
                statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Игнорировать разведчиков.",
                response = "Граница услышит ваше молчание. И враг тоже.",
                statDeltas = fixed_array(0, 0, -15, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь просит право судить преступления против веры. Без этого храм остаётся без зубов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать церкви право суда.",
                response = "Вера без суда — просьба. Вера с судом — закон.",
                statDeltas = fixed_array(0, 20, -5, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить суд короне.",
                response = "Тогда не удивляйтесь, если грешники начнут любить королевский закон.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить церковный суд только за ересь.",
                response = "Не всё, чего мы просили. Но достаточно, чтобы начать.",
                statDeltas = fixed_array(0, 8, 3, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В храме укрылись люди, бежавшие от сборщиков налогов. Они голодны и напуганы. Вы потребуете их выдачи?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Потребовать выдачи.",
                response = "Храмовые двери откроются. Но люди запомнят, что святость не защитила их.",
                statDeltas = fixed_array(0, -10, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить их в храме.",
                response = "Спасибо. Иногда убежище важнее закона.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Простить долг тем, кто выйдет сам.",
                response = "Милость вывела больше людей, чем стража.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет строить новый собор. В казне дыра, но собор может успокоить народ.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выделить деньги на собор.",
                response = "Камни для храма. Пустота для казны.",
                statDeltas = fixed_array(0, 20, 0, -25, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Казна благодарит. Храм проклянёт с хорошей акустикой.",
                statDeltas = fixed_array(0, -15, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Построить маленькую часовню вместо собора.",
                response = "Дешёвое благочестие. Иногда и такое покупают.",
                statDeltas = fixed_array(0, 8, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники хотят вышить церковные кресты на военных знамёнах. Солдаты служат королю, не храму.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Добавить кресты на знамёна.",
                response = "Теперь солдаты будут нести не только ваш герб. Опасный символ.",
                statDeltas = fixed_array(0, 15, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить церковные знаки на знамёнах.",
                response = "Хорошо. В бою солдат должен видеть приказ, а не проповедь.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Добавить маленький символ на отдельные полковые ленты.",
                response = "Терпимо. Молитва останется на краю, где ей место.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Больные выстраиваются к мощам святого. Они стоят часами под дождём вместо того, чтобы идти в лазарет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить очередь к мощам.",
                response = "Вы спасёте тела. Души будут возмущаться.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить лекарей рядом с мощами.",
                response = "Хорошо. Пусть чудо работает рядом с бинтами.",
                statDeltas = fixed_array(0, 5, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не мешать верующим.",
                response = "Тогда дождь и болезнь продолжат свою службу.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы просят лучшую муку для священного хлеба. А я этой мукой могу накормить сирот.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отдать лучшую муку храмам.",
                response = "Святой хлеб выйдет мягким. Детские каши — жидкими.",
                statDeltas = fixed_array(0, 12, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать муку сиротам.",
                response = "Дети скажут спасибо. Священники — что-нибудь длиннее.",
                statDeltas = fixed_array(0, -8, 0, 0, 12, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Разделить муку.",
                response = "Половина святости, половина милости. Съедобно.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священник отказался открыть ворота храма стражникам. Говорит, внутри церковная земля, а не королевская.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вломиться силой.",
                response = "Дверь падёт. А вместе с ней что-то большее.",
                statDeltas = fixed_array(0, -20, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отступить.",
                response = "Стража это запомнит. Священники тоже.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать переговоров у входа.",
                response = "Хорошо. Пусть пока говорят, а не ломают.",
                statDeltas = fixed_array(0, 3, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Открытие церкви принесло не мир, а новый центр власти. Теперь каждый ваш приказ будут сравнивать с проповедью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сделать церковь официальной опорой трона.",
                response = "Вы получили святой щит. И святую цепь.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Удерживать церковь на расстоянии.",
                response = "Безопаснее для трона. Опаснее для души народа.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Показывать единство, но не отдавать власть.",
                response = "Это путь канатоходца. Главное — не смотреть вниз.",
                statDeltas = fixed_array(0, 8, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые священники хотят в воскресенье говорить о крови переворота. Я могу запретить им. Но запреты в храме стоят дорого.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить проповедь о перевороте.",
                response = "Молчание куплено. Но оно не всегда хранится долго.",
                statDeltas = fixed_array(0, 8, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть говорят правду.",
                response = "Правда в храме звучит громче, чем на площади.",
                statDeltas = fixed_array(0, 5, -8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть говорят о мире, не о крови.",
                response = "Мир — удобная правда. Церковь умеет её произносить.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я хочу открыть приют при монастыре. Сироты будут жить, учиться и работать. Но нам нужен хлеб и немного золота.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Поддержать приют.",
                response = "Вы дали детям не только крышу, но и завтра.",
                statDeltas = fixed_array(0, 8, 0, -12, 20, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Дать только зерно.",
                response = "Они будут есть. Пока это уже чудо.",
                statDeltas = fixed_array(0, 3, 0, 0, 10, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Тогда улица снова станет их учителем.",
                statDeltas = fixed_array(0, -5, 0, 5, -10, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь продаёт грамоты отпущения грехов. Если взять с этого налог, казна оживёт.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обложить грамоты налогом.",
                response = "Грех наконец начнёт работать на казну.",
                statDeltas = fixed_array(0, -10, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить продажу грамот.",
                response = "Морально. Но мораль не звенит.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Храм продолжит торговать небом без нашей доли.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники говорят, что северяне — безбожники. Если они продолжат, солдаты сами начнут ждать войны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить такие проповеди.",
                response = "Солдаты любят врага, которого им благословили ненавидеть.",
                statDeltas = fixed_array(0, 15, 10, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить военные проповеди.",
                response = "Разумно. Войны хватает и без святых криков.",
                statDeltas = fixed_array(0, -12, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить только молитвы за защиту.",
                response = "Оборона звучит тише нападения. Иногда это полезно.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Монахи лечат травами, но не записывают дозы. Сегодня один ребёнок чуть не умер от слишком крепкого отвара.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обязать монастырских лекарей вести записи.",
                response = "Чернила спасут тех, кого молитвы лечат вслепую.",
                statDeltas = fixed_array(0, -5, 0, -3, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить монастырское лечение.",
                response = "Это остановит ошибки. И часть помощи тоже.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать монастырские традиции.",
                response = "Традиции хороши, пока не путают лекарство с ядом.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "К столице идут паломники. Если их не накормить, они рухнут у ворот. Если накормить — рухнут наши запасы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Накормить паломников.",
                response = "Святые люди едят как обычные. Иногда даже больше.",
                statDeltas = fixed_array(0, 15, 0, 0, 10, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Пустить только тех, кто несёт еду с собой.",
                response = "Город сохранит зерно. Паломники сохранят обиду.",
                statDeltas = fixed_array(0, -8, 0, 0, -3, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Организовать дешёвую похлёбку.",
                response = "Жидко, но честно. Для паломников сойдёт.",
                statDeltas = fixed_array(0, 8, 0, -5, 5, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В город идут паломники. Среди них легко спрятать шпионов, убийц и беглых солдат.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обыскивать всех паломников.",
                response = "Безопаснее. Но святость будет стоять в очереди на досмотр.",
                statDeltas = fixed_array(0, -8, 10, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пускать всех без проверки.",
                response = "Открытые ворота любят не только верующие.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять только мужчин с оружием.",
                response = "Компромисс. Не идеальный, но живой.",
                statDeltas = fixed_array(0, 3, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    )
)


let public allEncountersRuMid : Encounter[POOL_MID_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы требуют вернуть земли, конфискованные прежним королём. Земли дают хлеб. Хлеб даёт власть.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вернуть земли церкви.",
                response = "Алтарь станет богаче. Трон — благодарнее или слабее.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить земли короне.",
                response = "Земля останется у вас. Проклятия тоже.",
                statDeltas = fixed_array(0, -20, 0, 10, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Вернуть только часть.",
                response = "Половина уступки часто лучше полной войны.",
                statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Паломники покупают всё: хлеб, свечи, воду, тряпки, надежду. Разрешите временный рынок у храма.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить рынок и взять пошлину.",
                response = "Вера приведёт покупателей. Корона заберёт монеты.",
                statDeltas = fixed_array(0, -5, 0, 20, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить рынок без пошлины.",
                response = "Редкая щедрость. Купцы будут молиться за вас.",
                statDeltas = fixed_array(0, 8, 0, -5, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить рынок у храма.",
                response = "Святость сохранена. Прибыль ушла мимо.",
                statDeltas = fixed_array(0, 5, 0, -10, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые заключённые вдруг стали очень набожными. Просят заменить казнь монастырским покаянием.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить покаяние вместо казни.",
                response = "Монастырь получит грешников. Я — свободный день.",
                statDeltas = fixed_array(0, 12, -8, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить по приговору.",
                response = "Вера пришла поздно. Топор — вовремя.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить казнь каторгой при монастырях.",
                response = "Грех будет копать землю. Почти поэтично.",
                statDeltas = fixed_array(0, 5, -3, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мой князь поздравляет вас с короной. Он просит лишь малого: снизить пошлину на северные меха.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Снизить пошлину.",
                response = "Север оценит вашу мудрость. И вашу нужду в друзьях.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Твёрдый ответ. Надеюсь, ваши границы так же тверды.",
                statDeltas = fixed_array(0, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Повысить пошлину.",
                response = "Смело. Мой князь любит смелых почти так же, как любит проверять их.",
                statDeltas = fixed_array(0, 0, -10, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Почему твой князь просит именно сейчас?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что новый король либо ищет друзей, либо показывает зубы. Мой князь хочет понять, кого он видит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Передай: я ищу друзей.",
                response = "Тогда север протянет руку. Холодную, но открытую.",
                statDeltas = fixed_array(0, 0, -3, -8, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Передай: я показываю зубы.",
                response = "Я передам. И прослежу, чтобы он не рассмеялся слишком громко.",
                statDeltas = fixed_array(0, 0, 10, 5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Передай: я торгую, но не кланяюсь.",
                response = "Хорошая фраза. Её можно продать дороже меха.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храм продаёт святую мазь от язв. В ней жир, воск и ложь. Мои мази хотя бы честно воняют.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить святую мазь.",
                response = "Здравый смысл победил ароматную ложь.",
                statDeltas = fixed_array(0, -12, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить обе мази.",
                response = "Пусть люди выбирают между верой и запахом. Забавно.",
                statDeltas = fixed_array(0, 5, 0, 5, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять мази перед продажей.",
                response = "Проверка — враг мошенника. Значит, почти лекарство.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Северяне в столице просят открыть свой храм. Ваши священники называют это ересью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить северный храм.",
                response = "Север оценит. Ваши священники — нет.",
                statDeltas = fixed_array(0, -20, 0, 5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить.",
                response = "Тогда северяне поймут, что ваша вера сильнее гостеприимства.",
                statDeltas = fixed_array(0, 15, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить частные молитвы без храма.",
                response = "Полусвобода. С ней север умеет жить, но не любит её.",
                statDeltas = fixed_array(0, -5, 0, 3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Солдаты, пролившие кровь в ночь переворота, должны исповедаться. Иначе грех останется на вашем войске.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обязать солдат к исповеди.",
                response = "Грех назван. Теперь его можно держать на поводке.",
                statDeltas = fixed_array(0, 15, -10, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Исповедь только добровольно.",
                response = "Добровольное очищение медленнее, но чище.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать армию.",
                response = "Тогда мечи останутся острыми. Души — грязными.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Паломники продают свои вещи за кусок хлеба. Некоторые уже падают на дороге к храму.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Открыть бесплатную кухню.",
                response = "Дорога к храму сегодня станет менее смертельной.",
                statDeltas = fixed_array(0, 10, 0, 0, 18, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Продавать им дешёвый хлеб.",
                response = "Не милость, но помощь. Иногда это всё, что есть.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Закрыть город для новых паломников.",
                response = "Ворота сохранят хлеб. И потеряют сердца.",
                statDeltas = fixed_array(0, -15, 0, 0, -5, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если церковь объявит пожертвование короне святым делом, люди сами принесут монеты.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Попросить церковь объявить сбор.",
                response = "Когда жадность благословлена, её называют служением.",
                statDeltas = fixed_array(0, 8, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Собирать пожертвования без церкви.",
                response = "Люди дают меньше, когда их не пугают небесами.",
                statDeltas = fixed_array(0, 0, 0, 8, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не собирать с народа.",
                response = "Милосердие снова ограбило казну.",
                statDeltas = fixed_array(0, 0, 0, -10, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники хотят читать молитву перед каждым строевым смотром. Это превращает армию в церковную процессию.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить молитвы перед смотром.",
                response = "Солдаты будут стоять дольше. Надеюсь, враги тоже подождут.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить.",
                response = "Хорошо. Смотр должен звучать шагами, не псалмами.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Молитва только перед походом.",
                response = "Перед смертью люди терпимее к длинным речам.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь запрещает вскрывать умерших от болезни. Без этого мы не поймём, что убивает людей.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить вскрытия тайно.",
                response = "Тайная правда всё равно лечит лучше открытой лжи.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить вскрытия.",
                response = "Тогда болезнь сохранит свои секреты.",
                statDeltas = fixed_array(0, 10, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вскрывать только тела без родственников.",
                response = "Жестоко, но полезно. Как многое в медицине.",
                statDeltas = fixed_array(0, -3, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Через три дня праздник святого. Храм просит пир для бедных. Бедные просят пир каждый день.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выделить еду на праздник.",
                response = "Праздник будет сытным. Следующий день — обычным.",
                statDeltas = fixed_array(0, 12, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Выделить половину.",
                response = "Половина чуда. Для кухни это уже неплохо.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Хлеб останется. Благодарность уйдёт.",
                statDeltas = fixed_array(0, -10, 0, 0, -5, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Соль сохраняет мясо и рыбу. Дайте мне охрану, и я привезу её в город.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать военную охрану.",
                response = "Соль придёт быстро. Солдаты тоже наконец сделают что-то полезное для торговли.",
                statDeltas = fixed_array(0, 0, -5, -5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить наёмникам.",
                response = "Дорого, но удобно. Наёмники задают меньше вопросов.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть караван идёт сам.",
                response = "Тогда молитесь, чтобы разбойники не любили соль.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Почему тебе нужна именно королевская охрана?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что разбойники боятся знамени больше, чем моих людей. А ещё королевская охрана делает товар королевски дорогим.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать охрану, но забрать часть соли.",
                response = "Справедливо. Неприятно, но справедливо.",
                statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 0, 18, 0)
            ),
            DialogueChoice(
                choiceText = "Дать охрану за плату.",
                response = "Вы учитесь торговать. Это пугает.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Нанимай охрану сама.",
                response = "Конечно. А потом я назову цену, которая вам не понравится.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик собирает собственную храмовую стражу. Пока это палки и рясы. Потом будут мечи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить храмовую стражу.",
                response = "Хорошо. В городе должен быть один закон и одна стража.",
                statDeltas = fixed_array(0, -15, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить храмовую стражу.",
                response = "Тогда у храма появятся зубы. Не удивляйтесь, если он начнёт кусаться.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Включить храмовую стражу в королевскую.",
                response = "Лучше держать их в строю, чем напротив строя.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Народ слушает вас на площади и Малрика в храме. Но в храме люди плачут. На площади они боятся.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Говорить с народом чаще.",
                response = "Трон должен иметь голос, иначе за него будут говорить другие.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть церковь говорит за корону.",
                response = "Удобно. Но однажды вы услышите свои приказы чужим голосом.",
                statDeltas = fixed_array(0, 15, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздавать хлеб после королевских речей.",
                response = "Хорошо. Слова лучше входят вместе с хлебом.",
                statDeltas = fixed_array(0, 3, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь хочет вести книгу верных подданных. Кто записан, тот получает помощь первым.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить книгу верных.",
                response = "Порядок милосердия лучше хаоса милосердия.",
                statDeltas = fixed_array(0, 15, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить делить людей по вере.",
                response = "Вы хотите равенства там, где люди ищут избранность.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть книга будет добровольной.",
                response = "Добровольность — мягкая дверь. Через неё войдут многие.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Людей, которые спорили со священниками, перестали пускать к монастырской кухне. Они голодны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Кормить всех, независимо от веры.",
                response = "Это милость, которую я хотел услышать.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить только верных.",
                response = "Тогда суп станет испытанием, а не спасением.",
                statDeltas = fixed_array(0, 12, 0, 0, -10, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Создать королевскую кухню отдельно от монастыря.",
                response = "Тогда голодные не будут выбирать между хлебом и совестью.",
                statDeltas = fixed_array(0, 0, 0, -10, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые монастыри должны казне за старые поставки. Малрик просит простить долги во имя веры.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Простить долги.",
                response = "Вера любит прощение. Казна — нет.",
                statDeltas = fixed_array(0, 15, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать оплату.",
                response = "Долг святее молитвы, если записан правильно.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Взять оплату зерном.",
                response = "Пусть их покаяние будет съедобным.",
                statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники просят остановить казни дезертиров. Говорят, каждый солдат может покаяться.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Остановить казни дезертиров.",
                response = "Милость в казармах пахнет мятежом.",
                statDeltas = fixed_array(0, 10, -15, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продолжать казни.",
                response = "Порядок сохранится. Души пусть догоняют позже.",
                statDeltas = fixed_array(0, -10, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить казнь тяжёлой службой.",
                response = "Живой трус с лопатой полезнее мёртвого.",
                statDeltas = fixed_array(0, 5, 5, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Больные ночуют внутри храма, надеясь на чудо. Тёплый воздух и теснота разносят болезнь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вывести больных в лазареты.",
                response = "Они будут злиться. Но выживут чаще.",
                statDeltas = fixed_array(0, -10, 0, 0, 18, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Открыть храмовые лазареты.",
                response = "Если храм хочет лечить, пусть учится мыть полы.",
                statDeltas = fixed_array(0, 8, 0, -10, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить всё как есть.",
                response = "Тогда чудо понадобится нам всем.",
                statDeltas = fixed_array(0, 8, 0, 0, -18, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Во время поста рыба стала дороже мяса. Купцы молятся на пост громче священников.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ограничить цену на рыбу.",
                response = "Пост станет чуть менее роскошным для торговцев.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Купцы будут сыты. Люди будут свято голодать.",
                statDeltas = fixed_array(0, 0, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать солёную рыбу из запасов.",
                response = "Солёная милость. Запивать придётся водой, если она чистая.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "На стенах появились знаки: 'Король без благословения — не король'. Это уже не шёпот.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Стереть знаки и арестовать писцов.",
                response = "Стены станут чистыми. Люди — осторожнее.",
                statDeltas = fixed_array(0, -8, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ответить публичной речью.",
                response = "Слова против надписей. Иногда работает.",
                statDeltas = fixed_array(0, 0, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Попросить церковь осудить надписи.",
                response = "Если храм скажет — стены замолчат быстрее.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Говорят, что прежний король проклял трон перед смертью. Церковь может развеять слух. Или подтвердить его.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Попросить церковь развеять слух.",
                response = "Проклятия боятся свечей, особенно оплаченных.",
                statDeltas = fixed_array(0, 10, 0, -8, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить говорить о проклятии.",
                response = "Запрет — плохая крышка для кипящего котла.",
                statDeltas = fixed_array(0, 0, 8, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Высмеять слух публично.",
                response = "Смех лечит страх. Но не всегда лечит веру.",
                statDeltas = fixed_array(0, -5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы требуют тысячи свечей. Дайте мне монополию на воск, и половина прибыли ваша.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать монополию.",
                response = "Свечи будут гореть. Монеты тоже.",
                statDeltas = fixed_array(0, 5, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить монополию.",
                response = "Свободный рынок свечей. Как возвышенно скучно.",
                statDeltas = fixed_array(0, 0, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить королевскую цену на воск.",
                response = "Вы портите прибыль, но красиво называете это порядком.",
                statDeltas = fixed_array(0, 3, 0, 8, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мне передали список подозреваемых в ереси. Половина имён написана чужой рукой, половина — дрожащей.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Начать аресты.",
                response = "Список станет короче. Страх — длиннее.",
                statDeltas = fixed_array(0, 15, 8, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Проверить список.",
                response = "Редкий случай, когда бумага переживёт ночь.",
                statDeltas = fixed_array(0, -5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сжечь список.",
                response = "Огонь сегодня поработает вместо меня.",
                statDeltas = fixed_array(0, -15, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые больные перестали покупать лекарства. Говорят, священник велел им молиться и терпеть.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Приказать храмам не мешать лечению.",
                response = "Спасибо. Болезни терпение не раздражает, а радует.",
                statDeltas = fixed_array(0, -10, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поддержать церковь.",
                response = "Тогда пусть молитвы сбивают жар. Я посмотрю.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить и молитвы, и лекарства.",
                response = "Пусть лечатся всем сразу. Иногда отчаяние полезно.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваши священники хотят ехать на север проповедовать. Мой князь сочтёт это вмешательством.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить миссию.",
                response = "Север не любит чужие молитвы. Особенно с юга.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить миссию.",
                response = "Мой князь оценит вашу осторожность.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить только лекарей-монахов.",
                response = "Лекарь проходит там, где проповедника встречают копьём.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "На севере говорят, что вы заняты больными и хлебом, а не мечом. Я, конечно, этому не верю.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Показать военный парад.",
                response = "Красивые ряды. Север любит считать копья.",
                statDeltas = fixed_array(0, 0, 15, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Показать полные амбары.",
                response = "Хлеб тоже оружие. Особенно зимой.",
                statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Подарить золото и отправить домой.",
                response = "Щедрый жест. Или дорогая просьба молчать.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Что ещё говорят на севере?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Говорят, что новый король тушит пожары внутри дворца и потому не видит дыма на границе.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Укрепить северные крепости.",
                response = "Север увидит камень. Камень всегда понятнее слов.",
                statDeltas = fixed_array(0, 0, 20, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить разведчиков.",
                response = "Хорошо. Глаза дешевле войны.",
                statDeltas = fixed_array(0, 0, 8, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не поддаваться на провокацию.",
                response = "Спокойствие достойно короля. Если за ним есть сила.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Нужна новая коронация. Не во дворце, а в храме. Тогда народ увидит, что власть дана не только мечом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Согласиться на храмовую коронацию.",
                response = "Теперь ваша корона будет сиять не только золотом, но и страхом Божьим.",
                statDeltas = fixed_array(0, 25, -5, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться.",
                response = "Тогда храм будет молчать. Но молчание в храме слышно далеко.",
                statDeltas = fixed_array(0, -25, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Провести малый обряд без новой коронации.",
                response = "Не полная победа для алтаря. Но шаг к нему.",
                statDeltas = fixed_array(0, 10, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Городские бедняки злятся: паломников кормят, а местные голодают. Милость стала поводом для зависти.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Кормить сначала жителей города.",
                response = "Дом нужно спасать до гостей. Это понятно.",
                statDeltas = fixed_array(0, -5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить всех поровну.",
                response = "Трудно, дорого, правильно.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить только паломников у храма.",
                response = "Тогда город решит, что вера пришла не к нему.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмовые лавки не платят торговый налог. Купцы требуют справедливости. Я требую дохода.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обложить лавки налогом.",
                response = "Справедливость наконец-то принесла монеты.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить лавки свободными от налогов.",
                response = "Святость снова оказалась дешевле для храма, чем для казны.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести малый налог.",
                response = "Малый укол. Возможно, храм не закричит.",
                statDeltas = fixed_array(0, -3, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Молодые фанатики просятся в армию. Они храбры, но не слушают приказов, когда слышат слово 'ересь'.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять их в армию.",
                response = "Храбрость получена. Дисциплина под вопросом.",
                statDeltas = fixed_array(0, 8, 15, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать фанатикам.",
                response = "Лучше меньше солдат, чем толпа с мечами и песнями.",
                statDeltas = fixed_array(0, -10, -5, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Создать отдельный церковный отряд под надзором армии.",
                response = "Я буду держать их рядом. И подальше от решений.",
                statDeltas = fixed_array(0, 5, 10, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые священники говорят, что женщины не должны лечить мужчин. Сегодня трое отказались от моей помощи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить такие проповеди.",
                response = "Спасибо. Болезнь не выбирает лекаря по полу.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Тогда пусть гордость перевязывает им раны.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Назначить женщин-лекарей только к женщинам и детям.",
                response = "Уступка предрассудку редко спасает жизнь.",
                statDeltas = fixed_array(0, 5, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Монастырь варит пиво и продаёт его без налога. Солдаты довольны, казначей нет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обложить монастырское пиво налогом.",
                response = "Пиво станет дороже. Молитвы — раздражённее.",
                statDeltas = fixed_array(0, -8, -3, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить без налога.",
                response = "Солдаты будут пить за здоровье церкви.",
                statDeltas = fixed_array(0, 8, 5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Забрать часть пива для армии.",
                response = "Святое пиво в казармах. Я такое уже видел перед драками.",
                statDeltas = fixed_array(0, -5, 10, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один молодой священник говорит, что король должен слушать только церковь. Толпа хлопает.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Арестовать священника.",
                response = "Толпа увидит силу. И запомнит лицо арестованного.",
                statDeltas = fixed_array(0, -15, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вызвать его на разговор.",
                response = "Мягче. Но он может принять мягкость за слабость.",
                statDeltas = fixed_array(0, 3, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Игнорировать.",
                response = "Слова, оставленные без ответа, часто вырастают.",
                statDeltas = fixed_array(0, 5, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик предлагает создать церковный совет при троне. Советники в рясах будут говорить от имени народа и богов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Создать церковный совет.",
                response = "Вы впустили алтарь в тронный зал. Вывести будет сложнее.",
                statDeltas = fixed_array(0, 20, -5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Священники останутся снаружи. И начнут говорить громче.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить одному представителю церкви.",
                response = "Одна ряса легче совета. Пока она не заговорит за всех.",
                statDeltas = fixed_array(0, 8, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь предлагает налог на роскошь. Деньги пойдут бедным. И, разумеется, через храмовые руки.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести налог через церковь.",
                response = "Богатые возненавидят нас обоих. Бедные будут есть.",
                statDeltas = fixed_array(0, 15, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести налог через корону.",
                response = "Вы забрали милосердие из рук церкви. Смело.",
                statDeltas = fixed_array(0, -5, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться.",
                response = "Роскошь останется нетронутой. Как и голод.",
                statDeltas = fixed_array(0, -8, 0, 3, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Во время службы нищие протягивают руки прямо у алтаря. Богатые прихожане жалуются, что им мешают молиться.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Оставить нищих у алтаря.",
                response = "Молитва рядом с бедностью честнее.",
                statDeltas = fixed_array(0, -3, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вывести нищих наружу.",
                response = "Храм станет красивее. И холоднее.",
                statDeltas = fixed_array(0, 8, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Создать отдельную раздачу еды после службы.",
                response = "Хорошо. Милость не должна мешать молитве, но должна быть рядом.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храм просит серебро на новый колокол. Говорят, его звон будет защищать город. Я бы предпочёл защитные стены.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать серебро на колокол.",
                response = "Колокол будет звонить. Казна — пустеть.",
                statDeltas = fixed_array(0, 15, 0, -15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Тишина дешевле серебра.",
                statDeltas = fixed_array(0, -10, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Дать бронзу вместо серебра.",
                response = "Колокол будет беднее, но всё ещё громче моего недовольства.",
                statDeltas = fixed_array(0, 5, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мой князь прислал вам бочки солёной рыбы. Бесплатно. Почти бесплатно. Он просит принять его дружбу.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять подарок.",
                response = "Мудро. Рыба не любит ждать, как и дружба.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Принять и отправить золото в ответ.",
                response = "Щедрый ответ. Север любит равные жесты.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться.",
                response = "Осторожность достойна уважения. Голод — нет.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Что значит ‘почти бесплатно’?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Это значит, что сегодня вы принимаете рыбу, а завтра мой князь напомнит, что друзья не закрывают мосты и порты.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять рыбу и дружбу.",
                response = "Тогда север запомнит открытые двери.",
                statDeltas = fixed_array(0, 0, -3, 3, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить за рыбу как за товар.",
                response = "Так подарок становится сделкой. Чисто, но холодно.",
                statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться.",
                response = "Передам князю, что ваша гордость сытее вашего города.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет, чтобы армия постилась перед походом. Голодный солдат хуже молится и хуже бьёт.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Приказать армии поститься.",
                response = "Если враг нападёт, будем бросать в него молитвы.",
                statDeltas = fixed_array(0, 15, -15, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Освободить армию от поста.",
                response = "Спасибо. Солдат с мясом в животе полезнее святого скелета.",
                statDeltas = fixed_array(0, -10, 12, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Пост только для офицеров.",
                response = "Офицеры будут страдать красиво. Рядовые — есть.",
                statDeltas = fixed_array(0, 5, -3, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если армия сама будет управлять кухнями, солдаты не останутся голодными.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Передать кухни военным.",
                response = "Солдаты будут кормить солдат. Так надёжнее.",
                statDeltas = fixed_array(0, 0, 15, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить кухни поварам.",
                response = "Тогда пусть повара помнят: голодный солдат — плохой гость.",
                statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Разделить контроль.",
                response = "Компромисс. Я не люблю их, но этот хотя бы съедобен.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Ты хочешь контролировать хлеб?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Я хочу контролировать то, без чего солдат перестаёт быть солдатом и становится голодным мужиком с копьём.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать армии отдельные склады.",
                response = "Этого хватит. Пока склады не опустеют.",
                statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Назначить общего смотрителя.",
                response = "Если он будет честен, это сработает. Если нет — я узнаю.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Сократить армейские пайки.",
                response = "Тогда готовьте не только амбары, но и виселицы.",
                statDeltas = fixed_array(0, 0, -20, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Паломники принесли новую болезнь. Священники называют её испытанием. Я называю её заразой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Закрыть город для паломников.",
                response = "Это спасёт город. И разозлит тех, кто идёт к святыне.",
                statDeltas = fixed_array(0, -15, 0, 0, 20, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять паломников у ворот.",
                response = "Медленно, но лучше, чем пускать болезнь с песнями.",
                statDeltas = fixed_array(0, -3, 0, -8, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не мешать паломничеству.",
                response = "Тогда испытание станет массовым.",
                statDeltas = fixed_array(0, 12, 0, 0, -20, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У храма продают рыбу для поста. Половина уже пахнет как проповедь после дождя.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Конфисковать испорченную рыбу.",
                response = "Люди потеряют ужин, но сохранят животы.",
                statDeltas = fixed_array(0, -3, 0, 0, 12, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить продавать после засолки.",
                response = "Соль — не магия. Хотя купцы верят обратному.",
                statDeltas = fixed_array(0, 0, 0, 0, -8, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Закрыть рынок у храма.",
                response = "Вонь уйдёт. Прибыль тоже.",
                statDeltas = fixed_array(0, -8, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После проповеди толпа идёт к дворцу. Они несут свечи, не оружие. Но свечой тоже можно поджечь дверь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Встретить толпу стражей.",
                response = "Свечи погаснут быстро. Гнев — нет.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Выйти к ним лично.",
                response = "Я буду рядом. Если свечи станут факелами, бегите первым.",
                statDeltas = fixed_array(0, 3, -5, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать хлеб и пустить представителей внутрь.",
                response = "Хлеб остужает руки лучше воды.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если церковь назовёт вас благочестивым, многие забудут переворот. Но церковь не делает таких подарков бесплатно.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить благочестивую репутацию.",
                response = "Репутация куплена. Теперь важно, чтобы чек не нашли.",
                statDeltas = fixed_array(0, 20, 0, -20, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заслужить её делами.",
                response = "Медленнее. Но крепче.",
                statDeltas = fixed_array(0, 5, 0, -10, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не нуждаюсь в церковной репутации.",
                response = "Так говорят короли до первой проповеди против них.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Пекари продают 'святой хлеб' втрое дороже обычного. Народ покупает, потому что боится болезни.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить святой хлеб.",
                response = "Вы запретили страху быть товаром. Смело.",
                statDeltas = fixed_array(0, -8, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Обложить святой хлеб налогом.",
                response = "Если люди платят за страх, корона хотя бы получит долю.",
                statDeltas = fixed_array(0, -3, 0, 15, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить, но установить цену.",
                response = "Контролируемое суеверие. Почти государственная политика.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь требует сжечь книги, найденные у учёного. Говорят, они портят души.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сжечь книги.",
                response = "Бумага горит быстро. Идеи — по-разному.",
                statDeltas = fixed_array(0, 15, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Спрятать книги в королевском архиве.",
                response = "Тайный огонь иногда опаснее открытого.",
                statDeltas = fixed_array(0, -10, 0, -3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить читать после проверки.",
                response = "Редкий случай, когда книга дожила до суда.",
                statDeltas = fixed_array(0, -5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники называют мои травы ведьмовством. Забавно, что их монахи покупают те же травы через заднюю дверь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Защитить Сивил.",
                response = "Спасибо. Я почти тронута. Почти.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить её травы.",
                response = "Тогда пусть монахи лечат кашель псалмами.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить травы через храмовую проверку.",
                response = "Храм будет нюхать мои мешочки. Какая честь.",
                statDeltas = fixed_array(0, 5, 0, -3, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "К вашим воротам пришли семьи с севера. Они бегут от войны, но молятся не вашим богам.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять беженцев.",
                response = "Север запомнит вашу милость. Ваши священники — тоже.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать им.",
                response = "Холодная милость. Почти северная.",
                statDeltas = fixed_array(0, 10, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Принять, если они будут жить отдельно.",
                response = "Полуприют. Лучше дороги, хуже дома.",
                statDeltas = fixed_array(0, -5, 0, -5, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    )
)


let public allEncountersRuLateA : Encounter[POOL_LATE_A_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, народ знает вашу корону, но не знает, благословлена ли она. Сегодня церковь должна решить, как называть вас: королём или узурпатором.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Попросить церковь о благословении.",
                response = "Смирение — хорошее начало для того, кто пришёл к трону через кровь.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать признания моей власти.",
                response = "Приказы доходят до солдат. До небес они поднимаются хуже.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Предложить церкви союз.",
                response = "Союз трона и алтаря может спасти страну. Или задушить её.",
                statDeltas = fixed_array(0, 10, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После проповеди к монастырю пришло больше голодных, чем обычно. Они верят, что храм накормит их, если король не может.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Передать монастырю зерно.",
                response = "Сегодня вера будет пахнуть хлебом.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть монастырь сам кормит людей.",
                response = "Мы попробуем. Но пустой котёл не становится святым от молитвы.",
                statDeltas = fixed_array(0, -5, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить стражу разогнать очередь.",
                response = "Голодных можно разогнать. Голод — нет.",
                statDeltas = fixed_array(0, -10, 8, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы собирают десятину. Казна собирает налоги. Народ скоро поймёт, что платит дважды.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ограничить церковную десятину.",
                response = "Казна благодарна. Алтарь будет шипеть.",
                statDeltas = fixed_array(0, -20, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить десятину церкви.",
                response = "Священники любят, когда их золото называют верой.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Собирать налоги вместе с церковью.",
                response = "Двойная рука в одном кармане. Удобно, но опасно.",
                statDeltas = fixed_array(0, 5, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет отправить священников в казармы. Говорит, солдатам нужна душа. Солдатам нужен хлеб и сталь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить священников в казармах.",
                response = "Если они начнут учить солдат милосердию, я выставлю их сам.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить им вход.",
                response = "Казармы останутся казармами, а не молитвенным залом.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пускать только перед битвами.",
                response = "Перед смертью люди охотнее слушают богов. С этим спорить трудно.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди отказываются пить кипячённую воду. Они покупают святую. Она из того же грязного колодца.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить продажу святой воды.",
                response = "Спасибо. Болезнь не исчезнет от молитвы над грязью.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Приказать храмам кипятить воду перед освящением.",
                response = "Хорошо. Пусть вера хотя бы не переносит заразу.",
                statDeltas = fixed_array(0, 5, 0, -3, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться в обряды.",
                response = "Тогда я буду лечить последствия вашей осторожности.",
                statDeltas = fixed_array(0, 8, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь объявила пост. Мяса есть будут меньше, это хорошо. Но солдаты уже спрашивают, почему богам нужна их похлёбка.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пост для всех, включая армию.",
                response = "Репа станет святой. Солдаты — злые.",
                statDeltas = fixed_array(0, 10, -15, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Пост только для дворца.",
                response = "Вот это зрелище: придворные страдают почти как люди.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отменить пост для армии.",
                response = "Солдаты будут сыты. Священники — голодны до возмущения.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У главного храма собралась толпа. Они требуют, чтобы церковь сказала, законный ли вы король.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Поставить стражу у храма.",
                response = "Копья удержат двери. Не вопросы.",
                statDeltas = fixed_array(0, -5, 8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Позволить толпе слушать проповедь.",
                response = "Хорошо. Но если слова станут искрами, я предупреждал.",
                statDeltas = fixed_array(0, 8, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать хлеб перед храмом.",
                response = "Сытый человек кричит реже. Иногда это лучшая охрана.",
                statDeltas = fixed_array(0, 5, 0, 0, 10, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Король, который спорит с церковью, получает врага в каждом храме. Король, который ей подчиняется, теряет трон без боя.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать церкви больше прав.",
                response = "Алтарь улыбнётся. Трон станет чуть ниже.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ограничить церковь законом.",
                response = "Смелый шаг. Такие шаги часто слышны у эшафота.",
                statDeltas = fixed_array(0, -20, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сохранять равновесие.",
                response = "Равновесие редко красиво. Зато иногда живёт дольше.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После открытия церкви люди покупают свечи, иконы, амулеты. Я могу наладить торговлю. И отдать вам долю.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить торговлю святынями.",
                response = "Вера продаётся лучше хлеба. И хранится дольше.",
                statDeltas = fixed_array(0, -8, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить наживаться на вере.",
                response = "Благородно. Очень невыгодно.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить только храмовые товары.",
                response = "Монополия святости. Церковь быстро учится торговле.",
                statDeltas = fixed_array(0, 8, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники привели человека, который плевал на храмовые двери. Они требуют публичной казни.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казнить его.",
                response = "Площадь снова получит урок. Надеюсь, он будет стоить этой крови.",
                statDeltas = fixed_array(0, 15, 5, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Посадить в темницу.",
                response = "Тюрьма тише виселицы. Но священники любят громкие ответы.",
                statDeltas = fixed_array(0, -5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить его публично извиниться.",
                response = "Редкий день, когда язык заменил петлю.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы жгут ладан против заразы. Красиво пахнет. Бесполезно лечит. У меня есть травы получше.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить травы у Сивил.",
                response = "Травы грубее молитв, зато чаще работают.",
                statDeltas = fixed_array(0, -5, 0, -12, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поддержать храмовый ладан.",
                response = "Тогда пусть болезнь задохнётся от аромата. Если сможет.",
                statDeltas = fixed_array(0, 10, 0, -5, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Смешать травы с церковным ладаном.",
                response = "Вот это уже почти умно. Даже обидно.",
                statDeltas = fixed_array(0, 5, 0, -10, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мой князь спрашивает, правда ли ваша церковь теперь правит вместе с вами. На севере таких королей называют мягкими.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сказать, что церковь — мой союзник.",
                response = "Север услышит. И решит, что вы делите меч с молитвой.",
                statDeltas = fixed_array(0, 10, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сказать, что церковь подчиняется трону.",
                response = "Хорошо. Север уважает тех, кто держит алтарь за горло.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не отвечать на провокацию.",
                response = "Молчание бывает мудрым. Но соседи часто слышат в нём страх.",
                statDeltas = fixed_array(0, 0, -3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь просит право судить преступления против веры. Без этого храм остаётся без зубов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать церкви право суда.",
                response = "Вера без суда — просьба. Вера с судом — закон.",
                statDeltas = fixed_array(0, 20, -5, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить суд короне.",
                response = "Тогда не удивляйтесь, если грешники начнут любить королевский закон.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить церковный суд только за ересь.",
                response = "Не всё, чего мы просили. Но достаточно, чтобы начать.",
                statDeltas = fixed_array(0, 8, 3, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В храме укрылись люди, бежавшие от сборщиков налогов. Они голодны и напуганы. Вы потребуете их выдачи?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Потребовать выдачи.",
                response = "Храмовые двери откроются. Но люди запомнят, что святость не защитила их.",
                statDeltas = fixed_array(0, -10, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить их в храме.",
                response = "Спасибо. Иногда убежище важнее закона.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Простить долг тем, кто выйдет сам.",
                response = "Милость вывела больше людей, чем стража.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет строить новый собор. В казне дыра, но собор может успокоить народ.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выделить деньги на собор.",
                response = "Камни для храма. Пустота для казны.",
                statDeltas = fixed_array(0, 20, 0, -25, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Казна благодарит. Храм проклянёт с хорошей акустикой.",
                statDeltas = fixed_array(0, -15, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Построить маленькую часовню вместо собора.",
                response = "Дешёвое благочестие. Иногда и такое покупают.",
                statDeltas = fixed_array(0, 8, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники хотят вышить церковные кресты на военных знамёнах. Солдаты служат королю, не храму.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Добавить кресты на знамёна.",
                response = "Теперь солдаты будут нести не только ваш герб. Опасный символ.",
                statDeltas = fixed_array(0, 15, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить церковные знаки на знамёнах.",
                response = "Хорошо. В бою солдат должен видеть приказ, а не проповедь.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Добавить маленький символ на отдельные полковые ленты.",
                response = "Терпимо. Молитва останется на краю, где ей место.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Больные выстраиваются к мощам святого. Они стоят часами под дождём вместо того, чтобы идти в лазарет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить очередь к мощам.",
                response = "Вы спасёте тела. Души будут возмущаться.",
                statDeltas = fixed_array(0, -15, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить лекарей рядом с мощами.",
                response = "Хорошо. Пусть чудо работает рядом с бинтами.",
                statDeltas = fixed_array(0, 5, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не мешать верующим.",
                response = "Тогда дождь и болезнь продолжат свою службу.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы просят лучшую муку для священного хлеба. А я этой мукой могу накормить сирот.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отдать лучшую муку храмам.",
                response = "Святой хлеб выйдет мягким. Детские каши — жидкими.",
                statDeltas = fixed_array(0, 12, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать муку сиротам.",
                response = "Дети скажут спасибо. Священники — что-нибудь длиннее.",
                statDeltas = fixed_array(0, -8, 0, 0, 12, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Разделить муку.",
                response = "Половина святости, половина милости. Съедобно.",
                statDeltas = fixed_array(0, 5, 0, 0, 5, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священник отказался открыть ворота храма стражникам. Говорит, внутри церковная земля, а не королевская.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вломиться силой.",
                response = "Дверь падёт. А вместе с ней что-то большее.",
                statDeltas = fixed_array(0, -20, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отступить.",
                response = "Стража это запомнит. Священники тоже.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать переговоров у входа.",
                response = "Хорошо. Пусть пока говорят, а не ломают.",
                statDeltas = fixed_array(0, 3, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Открытие церкви принесло не мир, а новый центр власти. Теперь каждый ваш приказ будут сравнивать с проповедью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сделать церковь официальной опорой трона.",
                response = "Вы получили святой щит. И святую цепь.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Удерживать церковь на расстоянии.",
                response = "Безопаснее для трона. Опаснее для души народа.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Показывать единство, но не отдавать власть.",
                response = "Это путь канатоходца. Главное — не смотреть вниз.",
                statDeltas = fixed_array(0, 8, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые священники хотят в воскресенье говорить о крови переворота. Я могу запретить им. Но запреты в храме стоят дорого.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить проповедь о перевороте.",
                response = "Молчание куплено. Но оно не всегда хранится долго.",
                statDeltas = fixed_array(0, 8, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть говорят правду.",
                response = "Правда в храме звучит громче, чем на площади.",
                statDeltas = fixed_array(0, 5, -8, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть говорят о мире, не о крови.",
                response = "Мир — удобная правда. Церковь умеет её произносить.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я хочу открыть приют при монастыре. Сироты будут жить, учиться и работать. Но нам нужен хлеб и немного золота.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Поддержать приют.",
                response = "Вы дали детям не только крышу, но и завтра.",
                statDeltas = fixed_array(0, 8, 0, -12, 20, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Дать только зерно.",
                response = "Они будут есть. Пока это уже чудо.",
                statDeltas = fixed_array(0, 3, 0, 0, 10, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Тогда улица снова станет их учителем.",
                statDeltas = fixed_array(0, -5, 0, 5, -10, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь продаёт грамоты отпущения грехов. Если взять с этого налог, казна оживёт.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обложить грамоты налогом.",
                response = "Грех наконец начнёт работать на казну.",
                statDeltas = fixed_array(0, -10, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить продажу грамот.",
                response = "Морально. Но мораль не звенит.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Храм продолжит торговать небом без нашей доли.",
                statDeltas = fixed_array(0, 10, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники говорят, что северяне — безбожники. Если они продолжат, солдаты сами начнут ждать войны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить такие проповеди.",
                response = "Солдаты любят врага, которого им благословили ненавидеть.",
                statDeltas = fixed_array(0, 15, 10, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить военные проповеди.",
                response = "Разумно. Войны хватает и без святых криков.",
                statDeltas = fixed_array(0, -12, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить только молитвы за защиту.",
                response = "Оборона звучит тише нападения. Иногда это полезно.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Монахи лечат травами, но не записывают дозы. Сегодня один ребёнок чуть не умер от слишком крепкого отвара.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обязать монастырских лекарей вести записи.",
                response = "Чернила спасут тех, кого молитвы лечат вслепую.",
                statDeltas = fixed_array(0, -5, 0, -3, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить монастырское лечение.",
                response = "Это остановит ошибки. И часть помощи тоже.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать монастырские традиции.",
                response = "Традиции хороши, пока не путают лекарство с ядом.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "К столице идут паломники. Если их не накормить, они рухнут у ворот. Если накормить — рухнут наши запасы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Накормить паломников.",
                response = "Святые люди едят как обычные. Иногда даже больше.",
                statDeltas = fixed_array(0, 15, 0, 0, 10, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Пустить только тех, кто несёт еду с собой.",
                response = "Город сохранит зерно. Паломники сохранят обиду.",
                statDeltas = fixed_array(0, -8, 0, 0, -3, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Организовать дешёвую похлёбку.",
                response = "Жидко, но честно. Для паломников сойдёт.",
                statDeltas = fixed_array(0, 8, 0, -5, 5, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В город идут паломники. Среди них легко спрятать шпионов, убийц и беглых солдат.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обыскивать всех паломников.",
                response = "Безопаснее. Но святость будет стоять в очереди на досмотр.",
                statDeltas = fixed_array(0, -8, 10, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пускать всех без проверки.",
                response = "Открытые ворота любят не только верующие.",
                statDeltas = fixed_array(0, 10, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять только мужчин с оружием.",
                response = "Компромисс. Не идеальный, но живой.",
                statDeltas = fixed_array(0, 3, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы требуют вернуть земли, конфискованные прежним королём. Земли дают хлеб. Хлеб даёт власть.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вернуть земли церкви.",
                response = "Алтарь станет богаче. Трон — благодарнее или слабее.",
                statDeltas = fixed_array(0, 20, 0, -10, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить земли короне.",
                response = "Земля останется у вас. Проклятия тоже.",
                statDeltas = fixed_array(0, -20, 0, 10, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Вернуть только часть.",
                response = "Половина уступки часто лучше полной войны.",
                statDeltas = fixed_array(0, 8, 0, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Паломники покупают всё: хлеб, свечи, воду, тряпки, надежду. Разрешите временный рынок у храма.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить рынок и взять пошлину.",
                response = "Вера приведёт покупателей. Корона заберёт монеты.",
                statDeltas = fixed_array(0, -5, 0, 20, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить рынок без пошлины.",
                response = "Редкая щедрость. Купцы будут молиться за вас.",
                statDeltas = fixed_array(0, 8, 0, -5, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить рынок у храма.",
                response = "Святость сохранена. Прибыль ушла мимо.",
                statDeltas = fixed_array(0, 5, 0, -10, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые заключённые вдруг стали очень набожными. Просят заменить казнь монастырским покаянием.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить покаяние вместо казни.",
                response = "Монастырь получит грешников. Я — свободный день.",
                statDeltas = fixed_array(0, 12, -8, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить по приговору.",
                response = "Вера пришла поздно. Топор — вовремя.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить казнь каторгой при монастырях.",
                response = "Грех будет копать землю. Почти поэтично.",
                statDeltas = fixed_array(0, 5, -3, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храм продаёт святую мазь от язв. В ней жир, воск и ложь. Мои мази хотя бы честно воняют.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить святую мазь.",
                response = "Здравый смысл победил ароматную ложь.",
                statDeltas = fixed_array(0, -12, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить обе мази.",
                response = "Пусть люди выбирают между верой и запахом. Забавно.",
                statDeltas = fixed_array(0, 5, 0, 5, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять мази перед продажей.",
                response = "Проверка — враг мошенника. Значит, почти лекарство.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Северяне в столице просят открыть свой храм. Ваши священники называют это ересью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить северный храм.",
                response = "Север оценит. Ваши священники — нет.",
                statDeltas = fixed_array(0, -20, 0, 5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить.",
                response = "Тогда северяне поймут, что ваша вера сильнее гостеприимства.",
                statDeltas = fixed_array(0, 15, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить частные молитвы без храма.",
                response = "Полусвобода. С ней север умеет жить, но не любит её.",
                statDeltas = fixed_array(0, -5, 0, 3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Солдаты, пролившие кровь в ночь переворота, должны исповедаться. Иначе грех останется на вашем войске.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обязать солдат к исповеди.",
                response = "Грех назван. Теперь его можно держать на поводке.",
                statDeltas = fixed_array(0, 15, -10, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Исповедь только добровольно.",
                response = "Добровольное очищение медленнее, но чище.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать армию.",
                response = "Тогда мечи останутся острыми. Души — грязными.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Паломники продают свои вещи за кусок хлеба. Некоторые уже падают на дороге к храму.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Открыть бесплатную кухню.",
                response = "Дорога к храму сегодня станет менее смертельной.",
                statDeltas = fixed_array(0, 10, 0, 0, 18, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Продавать им дешёвый хлеб.",
                response = "Не милость, но помощь. Иногда это всё, что есть.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Закрыть город для новых паломников.",
                response = "Ворота сохранят хлеб. И потеряют сердца.",
                statDeltas = fixed_array(0, -15, 0, 0, -5, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если церковь объявит пожертвование короне святым делом, люди сами принесут монеты.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Попросить церковь объявить сбор.",
                response = "Когда жадность благословлена, её называют служением.",
                statDeltas = fixed_array(0, 8, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Собирать пожертвования без церкви.",
                response = "Люди дают меньше, когда их не пугают небесами.",
                statDeltas = fixed_array(0, 0, 0, 8, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не собирать с народа.",
                response = "Милосердие снова ограбило казну.",
                statDeltas = fixed_array(0, 0, 0, -10, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники хотят читать молитву перед каждым строевым смотром. Это превращает армию в церковную процессию.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить молитвы перед смотром.",
                response = "Солдаты будут стоять дольше. Надеюсь, враги тоже подождут.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить.",
                response = "Хорошо. Смотр должен звучать шагами, не псалмами.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Молитва только перед походом.",
                response = "Перед смертью люди терпимее к длинным речам.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь запрещает вскрывать умерших от болезни. Без этого мы не поймём, что убивает людей.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить вскрытия тайно.",
                response = "Тайная правда всё равно лечит лучше открытой лжи.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить вскрытия.",
                response = "Тогда болезнь сохранит свои секреты.",
                statDeltas = fixed_array(0, 10, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вскрывать только тела без родственников.",
                response = "Жестоко, но полезно. Как многое в медицине.",
                statDeltas = fixed_array(0, -3, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Через три дня праздник святого. Храм просит пир для бедных. Бедные просят пир каждый день.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выделить еду на праздник.",
                response = "Праздник будет сытным. Следующий день — обычным.",
                statDeltas = fixed_array(0, 12, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Выделить половину.",
                response = "Половина чуда. Для кухни это уже неплохо.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Хлеб останется. Благодарность уйдёт.",
                statDeltas = fixed_array(0, -10, 0, 0, -5, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик собирает собственную храмовую стражу. Пока это палки и рясы. Потом будут мечи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить храмовую стражу.",
                response = "Хорошо. В городе должен быть один закон и одна стража.",
                statDeltas = fixed_array(0, -15, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить храмовую стражу.",
                response = "Тогда у храма появятся зубы. Не удивляйтесь, если он начнёт кусаться.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Включить храмовую стражу в королевскую.",
                response = "Лучше держать их в строю, чем напротив строя.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Народ слушает вас на площади и Малрика в храме. Но в храме люди плачут. На площади они боятся.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Говорить с народом чаще.",
                response = "Трон должен иметь голос, иначе за него будут говорить другие.",
                statDeltas = fixed_array(0, -3, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть церковь говорит за корону.",
                response = "Удобно. Но однажды вы услышите свои приказы чужим голосом.",
                statDeltas = fixed_array(0, 15, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздавать хлеб после королевских речей.",
                response = "Хорошо. Слова лучше входят вместе с хлебом.",
                statDeltas = fixed_array(0, 3, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь хочет вести книгу верных подданных. Кто записан, тот получает помощь первым.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить книгу верных.",
                response = "Порядок милосердия лучше хаоса милосердия.",
                statDeltas = fixed_array(0, 15, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить делить людей по вере.",
                response = "Вы хотите равенства там, где люди ищут избранность.",
                statDeltas = fixed_array(0, -15, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть книга будет добровольной.",
                response = "Добровольность — мягкая дверь. Через неё войдут многие.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Людей, которые спорили со священниками, перестали пускать к монастырской кухне. Они голодны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Кормить всех, независимо от веры.",
                response = "Это милость, которую я хотел услышать.",
                statDeltas = fixed_array(0, -8, 0, 0, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить только верных.",
                response = "Тогда суп станет испытанием, а не спасением.",
                statDeltas = fixed_array(0, 12, 0, 0, -10, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Создать королевскую кухню отдельно от монастыря.",
                response = "Тогда голодные не будут выбирать между хлебом и совестью.",
                statDeltas = fixed_array(0, 0, 0, -10, 15, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые монастыри должны казне за старые поставки. Малрик просит простить долги во имя веры.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Простить долги.",
                response = "Вера любит прощение. Казна — нет.",
                statDeltas = fixed_array(0, 15, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать оплату.",
                response = "Долг святее молитвы, если записан правильно.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Взять оплату зерном.",
                response = "Пусть их покаяние будет съедобным.",
                statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники просят остановить казни дезертиров. Говорят, каждый солдат может покаяться.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Остановить казни дезертиров.",
                response = "Милость в казармах пахнет мятежом.",
                statDeltas = fixed_array(0, 10, -15, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продолжать казни.",
                response = "Порядок сохранится. Души пусть догоняют позже.",
                statDeltas = fixed_array(0, -10, 12, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить казнь тяжёлой службой.",
                response = "Живой трус с лопатой полезнее мёртвого.",
                statDeltas = fixed_array(0, 5, 5, 0, -3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Больные ночуют внутри храма, надеясь на чудо. Тёплый воздух и теснота разносят болезнь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вывести больных в лазареты.",
                response = "Они будут злиться. Но выживут чаще.",
                statDeltas = fixed_array(0, -10, 0, 0, 18, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Открыть храмовые лазареты.",
                response = "Если храм хочет лечить, пусть учится мыть полы.",
                statDeltas = fixed_array(0, 8, 0, -10, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить всё как есть.",
                response = "Тогда чудо понадобится нам всем.",
                statDeltas = fixed_array(0, 8, 0, 0, -18, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Во время поста рыба стала дороже мяса. Купцы молятся на пост громче священников.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ограничить цену на рыбу.",
                response = "Пост станет чуть менее роскошным для торговцев.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Купцы будут сыты. Люди будут свято голодать.",
                statDeltas = fixed_array(0, 0, 0, 10, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать солёную рыбу из запасов.",
                response = "Солёная милость. Запивать придётся водой, если она чистая.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "На стенах появились знаки: 'Король без благословения — не король'. Это уже не шёпот.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Стереть знаки и арестовать писцов.",
                response = "Стены станут чистыми. Люди — осторожнее.",
                statDeltas = fixed_array(0, -8, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ответить публичной речью.",
                response = "Слова против надписей. Иногда работает.",
                statDeltas = fixed_array(0, 0, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Попросить церковь осудить надписи.",
                response = "Если храм скажет — стены замолчат быстрее.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Говорят, что прежний король проклял трон перед смертью. Церковь может развеять слух. Или подтвердить его.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Попросить церковь развеять слух.",
                response = "Проклятия боятся свечей, особенно оплаченных.",
                statDeltas = fixed_array(0, 10, 0, -8, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить говорить о проклятии.",
                response = "Запрет — плохая крышка для кипящего котла.",
                statDeltas = fixed_array(0, 0, 8, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Высмеять слух публично.",
                response = "Смех лечит страх. Но не всегда лечит веру.",
                statDeltas = fixed_array(0, -5, 0, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы требуют тысячи свечей. Дайте мне монополию на воск, и половина прибыли ваша.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать монополию.",
                response = "Свечи будут гореть. Монеты тоже.",
                statDeltas = fixed_array(0, 5, 0, 20, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить монополию.",
                response = "Свободный рынок свечей. Как возвышенно скучно.",
                statDeltas = fixed_array(0, 0, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить королевскую цену на воск.",
                response = "Вы портите прибыль, но красиво называете это порядком.",
                statDeltas = fixed_array(0, 3, 0, 8, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мне передали список подозреваемых в ереси. Половина имён написана чужой рукой, половина — дрожащей.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Начать аресты.",
                response = "Список станет короче. Страх — длиннее.",
                statDeltas = fixed_array(0, 15, 8, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Проверить список.",
                response = "Редкий случай, когда бумага переживёт ночь.",
                statDeltas = fixed_array(0, -5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сжечь список.",
                response = "Огонь сегодня поработает вместо меня.",
                statDeltas = fixed_array(0, -15, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые больные перестали покупать лекарства. Говорят, священник велел им молиться и терпеть.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Приказать храмам не мешать лечению.",
                response = "Спасибо. Болезни терпение не раздражает, а радует.",
                statDeltas = fixed_array(0, -10, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поддержать церковь.",
                response = "Тогда пусть молитвы сбивают жар. Я посмотрю.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить и молитвы, и лекарства.",
                response = "Пусть лечатся всем сразу. Иногда отчаяние полезно.",
                statDeltas = fixed_array(0, 5, 0, -5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваши священники хотят ехать на север проповедовать. Мой князь сочтёт это вмешательством.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить миссию.",
                response = "Север не любит чужие молитвы. Особенно с юга.",
                statDeltas = fixed_array(0, 15, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить миссию.",
                response = "Мой князь оценит вашу осторожность.",
                statDeltas = fixed_array(0, -10, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить только лекарей-монахов.",
                response = "Лекарь проходит там, где проповедника встречают копьём.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Нужна новая коронация. Не во дворце, а в храме. Тогда народ увидит, что власть дана не только мечом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Согласиться на храмовую коронацию.",
                response = "Теперь ваша корона будет сиять не только золотом, но и страхом Божьим.",
                statDeltas = fixed_array(0, 25, -5, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться.",
                response = "Тогда храм будет молчать. Но молчание в храме слышно далеко.",
                statDeltas = fixed_array(0, -25, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Провести малый обряд без новой коронации.",
                response = "Не полная победа для алтаря. Но шаг к нему.",
                statDeltas = fixed_array(0, 10, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Городские бедняки злятся: паломников кормят, а местные голодают. Милость стала поводом для зависти.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Кормить сначала жителей города.",
                response = "Дом нужно спасать до гостей. Это понятно.",
                statDeltas = fixed_array(0, -5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить всех поровну.",
                response = "Трудно, дорого, правильно.",
                statDeltas = fixed_array(0, 8, 0, 0, 15, 0, 0, -18, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить только паломников у храма.",
                response = "Тогда город решит, что вера пришла не к нему.",
                statDeltas = fixed_array(0, 10, 0, 0, -12, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмовые лавки не платят торговый налог. Купцы требуют справедливости. Я требую дохода.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обложить лавки налогом.",
                response = "Справедливость наконец-то принесла монеты.",
                statDeltas = fixed_array(0, -12, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить лавки свободными от налогов.",
                response = "Святость снова оказалась дешевле для храма, чем для казны.",
                statDeltas = fixed_array(0, 10, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести малый налог.",
                response = "Малый укол. Возможно, храм не закричит.",
                statDeltas = fixed_array(0, -3, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Молодые фанатики просятся в армию. Они храбры, но не слушают приказов, когда слышат слово 'ересь'.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять их в армию.",
                response = "Храбрость получена. Дисциплина под вопросом.",
                statDeltas = fixed_array(0, 8, 15, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать фанатикам.",
                response = "Лучше меньше солдат, чем толпа с мечами и песнями.",
                statDeltas = fixed_array(0, -10, -5, 0, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Создать отдельный церковный отряд под надзором армии.",
                response = "Я буду держать их рядом. И подальше от решений.",
                statDeltas = fixed_array(0, 5, 10, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые священники говорят, что женщины не должны лечить мужчин. Сегодня трое отказались от моей помощи.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить такие проповеди.",
                response = "Спасибо. Болезнь не выбирает лекаря по полу.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Тогда пусть гордость перевязывает им раны.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Назначить женщин-лекарей только к женщинам и детям.",
                response = "Уступка предрассудку редко спасает жизнь.",
                statDeltas = fixed_array(0, 5, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Монастырь варит пиво и продаёт его без налога. Солдаты довольны, казначей нет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Обложить монастырское пиво налогом.",
                response = "Пиво станет дороже. Молитвы — раздражённее.",
                statDeltas = fixed_array(0, -8, -3, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить без налога.",
                response = "Солдаты будут пить за здоровье церкви.",
                statDeltas = fixed_array(0, 8, 5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Забрать часть пива для армии.",
                response = "Святое пиво в казармах. Я такое уже видел перед драками.",
                statDeltas = fixed_array(0, -5, 10, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один молодой священник говорит, что король должен слушать только церковь. Толпа хлопает.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Арестовать священника.",
                response = "Толпа увидит силу. И запомнит лицо арестованного.",
                statDeltas = fixed_array(0, -15, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вызвать его на разговор.",
                response = "Мягче. Но он может принять мягкость за слабость.",
                statDeltas = fixed_array(0, 3, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Игнорировать.",
                response = "Слова, оставленные без ответа, часто вырастают.",
                statDeltas = fixed_array(0, 5, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик предлагает создать церковный совет при троне. Советники в рясах будут говорить от имени народа и богов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Создать церковный совет.",
                response = "Вы впустили алтарь в тронный зал. Вывести будет сложнее.",
                statDeltas = fixed_array(0, 20, -5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Священники останутся снаружи. И начнут говорить громче.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить одному представителю церкви.",
                response = "Одна ряса легче совета. Пока она не заговорит за всех.",
                statDeltas = fixed_array(0, 8, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь предлагает налог на роскошь. Деньги пойдут бедным. И, разумеется, через храмовые руки.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести налог через церковь.",
                response = "Богатые возненавидят нас обоих. Бедные будут есть.",
                statDeltas = fixed_array(0, 15, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести налог через корону.",
                response = "Вы забрали милосердие из рук церкви. Смело.",
                statDeltas = fixed_array(0, -5, 0, 15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться.",
                response = "Роскошь останется нетронутой. Как и голод.",
                statDeltas = fixed_array(0, -8, 0, 3, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Во время службы нищие протягивают руки прямо у алтаря. Богатые прихожане жалуются, что им мешают молиться.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Оставить нищих у алтаря.",
                response = "Молитва рядом с бедностью честнее.",
                statDeltas = fixed_array(0, -3, 0, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вывести нищих наружу.",
                response = "Храм станет красивее. И холоднее.",
                statDeltas = fixed_array(0, 8, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Создать отдельную раздачу еды после службы.",
                response = "Хорошо. Милость не должна мешать молитве, но должна быть рядом.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храм просит серебро на новый колокол. Говорят, его звон будет защищать город. Я бы предпочёл защитные стены.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать серебро на колокол.",
                response = "Колокол будет звонить. Казна — пустеть.",
                statDeltas = fixed_array(0, 15, 0, -15, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Тишина дешевле серебра.",
                statDeltas = fixed_array(0, -10, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Дать бронзу вместо серебра.",
                response = "Колокол будет беднее, но всё ещё громче моего недовольства.",
                statDeltas = fixed_array(0, 5, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет, чтобы армия постилась перед походом. Голодный солдат хуже молится и хуже бьёт.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Приказать армии поститься.",
                response = "Если враг нападёт, будем бросать в него молитвы.",
                statDeltas = fixed_array(0, 15, -15, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Освободить армию от поста.",
                response = "Спасибо. Солдат с мясом в животе полезнее святого скелета.",
                statDeltas = fixed_array(0, -10, 12, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Пост только для офицеров.",
                response = "Офицеры будут страдать красиво. Рядовые — есть.",
                statDeltas = fixed_array(0, 5, -3, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Паломники принесли новую болезнь. Священники называют её испытанием. Я называю её заразой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Закрыть город для паломников.",
                response = "Это спасёт город. И разозлит тех, кто идёт к святыне.",
                statDeltas = fixed_array(0, -15, 0, 0, 20, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять паломников у ворот.",
                response = "Медленно, но лучше, чем пускать болезнь с песнями.",
                statDeltas = fixed_array(0, -3, 0, -8, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не мешать паломничеству.",
                response = "Тогда испытание станет массовым.",
                statDeltas = fixed_array(0, 12, 0, 0, -20, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У храма продают рыбу для поста. Половина уже пахнет как проповедь после дождя.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Конфисковать испорченную рыбу.",
                response = "Люди потеряют ужин, но сохранят животы.",
                statDeltas = fixed_array(0, -3, 0, 0, 12, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить продавать после засолки.",
                response = "Соль — не магия. Хотя купцы верят обратному.",
                statDeltas = fixed_array(0, 0, 0, 0, -8, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Закрыть рынок у храма.",
                response = "Вонь уйдёт. Прибыль тоже.",
                statDeltas = fixed_array(0, -8, 0, -8, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После проповеди толпа идёт к дворцу. Они несут свечи, не оружие. Но свечой тоже можно поджечь дверь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Встретить толпу стражей.",
                response = "Свечи погаснут быстро. Гнев — нет.",
                statDeltas = fixed_array(0, -5, 10, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Выйти к ним лично.",
                response = "Я буду рядом. Если свечи станут факелами, бегите первым.",
                statDeltas = fixed_array(0, 3, -5, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать хлеб и пустить представителей внутрь.",
                response = "Хлеб остужает руки лучше воды.",
                statDeltas = fixed_array(0, 5, 0, 0, 12, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если церковь назовёт вас благочестивым, многие забудут переворот. Но церковь не делает таких подарков бесплатно.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить благочестивую репутацию.",
                response = "Репутация куплена. Теперь важно, чтобы чек не нашли.",
                statDeltas = fixed_array(0, 20, 0, -20, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заслужить её делами.",
                response = "Медленнее. Но крепче.",
                statDeltas = fixed_array(0, 5, 0, -10, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не нуждаюсь в церковной репутации.",
                response = "Так говорят короли до первой проповеди против них.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Пекари продают 'святой хлеб' втрое дороже обычного. Народ покупает, потому что боится болезни.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить святой хлеб.",
                response = "Вы запретили страху быть товаром. Смело.",
                statDeltas = fixed_array(0, -8, 0, -5, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Обложить святой хлеб налогом.",
                response = "Если люди платят за страх, корона хотя бы получит долю.",
                statDeltas = fixed_array(0, -3, 0, 15, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить, но установить цену.",
                response = "Контролируемое суеверие. Почти государственная политика.",
                statDeltas = fixed_array(0, 0, 0, 5, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь требует сжечь книги, найденные у учёного. Говорят, они портят души.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сжечь книги.",
                response = "Бумага горит быстро. Идеи — по-разному.",
                statDeltas = fixed_array(0, 15, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Спрятать книги в королевском архиве.",
                response = "Тайный огонь иногда опаснее открытого.",
                statDeltas = fixed_array(0, -10, 0, -3, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить читать после проверки.",
                response = "Редкий случай, когда книга дожила до суда.",
                statDeltas = fixed_array(0, -5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники называют мои травы ведьмовством. Забавно, что их монахи покупают те же травы через заднюю дверь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Защитить Сивил.",
                response = "Спасибо. Я почти тронута. Почти.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить её травы.",
                response = "Тогда пусть монахи лечат кашель псалмами.",
                statDeltas = fixed_array(0, 12, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить травы через храмовую проверку.",
                response = "Храм будет нюхать мои мешочки. Какая честь.",
                statDeltas = fixed_array(0, 5, 0, -3, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "К вашим воротам пришли семьи с севера. Они бегут от войны, но молятся не вашим богам.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять беженцев.",
                response = "Север запомнит вашу милость. Ваши священники — тоже.",
                statDeltas = fixed_array(0, -15, 0, 0, 8, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать им.",
                response = "Холодная милость. Почти северная.",
                statDeltas = fixed_array(0, 10, 0, 0, -8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Принять, если они будут жить отдельно.",
                response = "Полуприют. Лучше дороги, хуже дома.",
                statDeltas = fixed_array(0, -5, 0, -5, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В городе молятся чужим богам. Если это оставить, завтра ересь будет не в подвалах, а на рынке.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить чужие обряды.",
                response = "Чистота веры требует твёрдой руки.",
                statDeltas = fixed_array(0, 20, 5, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить частные обряды.",
                response = "Тихая ересь всё равно ересь. Но хотя бы тихая.",
                statDeltas = fixed_array(0, -8, 0, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Терпимость часто входит в город как гость, а остаётся как хозяин.",
                statDeltas = fixed_array(0, -15, 0, 5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В деревне обвинили женщину в колдовстве. Её дом сожгли без суда. Теперь дети спят на пепле.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Наказать виновных.",
                response = "Справедливость запоздала, но хотя бы пришла.",
                statDeltas = fixed_array(0, -10, 5, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Помочь детям и не трогать деревню.",
                response = "Мягко. Иногда мягкость спасает больше, чем наказание.",
                statDeltas = fixed_array(0, 0, 0, -8, 12, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Тогда пепел станет законом.",
                statDeltas = fixed_array(0, 5, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если печатать простые молитвенники и продавать их дёшево, народ будет занят верой, а казна — доходом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Печатать молитвенники.",
                response = "Прекрасно. Бумага, которая приносит и веру, и монеты.",
                statDeltas = fixed_array(0, 10, 0, 12, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздавать бесплатно.",
                response = "Бесплатная вера. Очень дорогая идея.",
                statDeltas = fixed_array(0, 12, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не тратить бумагу на молитвы.",
                response = "Бумага останется для налогов. Более надёжного жанра.",
                statDeltas = fixed_array(0, -8, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один священник велел солдатам не трогать беглецов, если те укрылись в храме. Это подрывает командование.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Поддержать священника.",
                response = "Тогда солдаты начнут смотреть на алтарь перед каждым приказом.",
                statDeltas = fixed_array(0, 12, -12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поддержать армию.",
                response = "Хорошо. Приказ должен идти сверху, не сбоку.",
                statDeltas = fixed_array(0, -12, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Установить правило храмового убежища на три дня.",
                response = "Три дня терпимо. На четвёртый я заберу беглеца сам.",
                statDeltas = fixed_array(0, 5, 5, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники против новых могильных ям за городом. Говорят, земля там не освящена. А старое кладбище переполнено.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Освятить новую землю и хоронить там.",
                response = "Наконец-то решение, где здравый смысл и вера не дерутся.",
                statDeltas = fixed_array(0, 5, 0, -5, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Хоронить за городом без освящения.",
                response = "Мёртвым нужна земля. Живым — безопасность.",
                statDeltas = fixed_array(0, -12, 0, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продолжать хоронить на старом кладбище.",
                response = "Тогда старое кладбище начнёт возвращать нам болезни.",
                statDeltas = fixed_array(0, 8, 0, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмы открывают кухни, но готовят плохо. Если люди начнут травиться святой похлёбкой, винить будут вас.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отправить дворцовых поваров обучать храмы.",
                response = "Научу их хотя бы не убивать супом.",
                statDeltas = fixed_array(0, 5, 0, -8, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Закрыть храмовые кухни.",
                response = "Люди будут голоднее, но меньше бегать к лекарям.",
                statDeltas = fixed_array(0, -12, 0, 0, 8, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить как есть.",
                response = "Тогда пусть бог благословит их котлы. Им понадобится.",
                statDeltas = fixed_array(0, 5, 0, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храмовый колокол звонит ночью. Люди просыпаются, солдаты нервничают, больные не спят.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить ночной звон.",
                response = "Ночь станет тише. Священники — громче днём.",
                statDeltas = fixed_array(0, -10, 3, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить звон.",
                response = "Тогда город будет молиться вместо сна.",
                statDeltas = fixed_array(0, 10, -3, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Звон только при опасности.",
                response = "Хорошо. Колокол станет сигналом, а не пыткой.",
                statDeltas = fixed_array(0, 3, 5, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если вы слишком часто стоите рядом с Малриком, народ перестанет видеть короля. Он увидит человека в тени жреца.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Появляться с Малриком чаще.",
                response = "Святость укроет вас. И скроет тоже.",
                statDeltas = fixed_array(0, 15, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Появляться отдельно от церкви.",
                response = "Трону нужен собственный силуэт.",
                statDeltas = fixed_array(0, -8, 5, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Появляться вместе только на больших праздниках.",
                response = "Редкость делает союз сильнее. И безопаснее.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    )
)


let public allEncountersRuLateB : Encounter[POOL_LATE_B_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я предлагаю, чтобы каждый чиновник принёс клятву верности не только короне, но и истинной вере.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести клятву веры.",
                response = "Теперь власть будет стоять на двух коленях: перед троном и алтарём.",
                statDeltas = fixed_array(0, 20, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Клятва только короне.",
                response = "Трон хочет верность без души. Опасная экономия.",
                statDeltas = fixed_array(0, -15, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Клятва веры добровольная.",
                response = "Добровольное благочестие часто становится обязательным само.",
                statDeltas = fixed_array(0, 5, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди приходят исповедоваться и признаются в мелких кражах еды. Священники хотят передавать имена стражникам.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить передавать имена.",
                response = "Исповедь останется убежищем, не ловушкой.",
                statDeltas = fixed_array(0, 5, -5, 0, 12, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Передавать имена воров.",
                response = "Тогда люди перестанут каяться. И начнут молчать.",
                statDeltas = fixed_array(0, -8, 8, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Передавать только имена опасных преступников.",
                response = "Это похоже на справедливость. Она редко бывает простой.",
                statDeltas = fixed_array(0, 3, 5, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Старые храмы требуют ремонта. Если крыши рухнут, священники обвинят корону. Если платить, рухнет казна.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Оплатить ремонт.",
                response = "Крыши спасены. Моя душа — нет.",
                statDeltas = fixed_array(0, 15, 0, -18, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ремонтировать только главные храмы.",
                response = "Выборочная святость. Дешевле полной.",
                statDeltas = fixed_array(0, 8, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть храмы чинятся сами.",
                response = "Казна суха. Храмы, возможно, нет.",
                statDeltas = fixed_array(0, -12, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет везти реликвии вместе с армией. Если враг захватит обоз, это станет позором.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Взять реликвии с армией.",
                response = "Солдаты пойдут смелее. Обоз станет целью.",
                statDeltas = fixed_array(0, 15, 5, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить реликвии в столице.",
                response = "Правильно. Война и так тащит достаточно лишнего.",
                statDeltas = fixed_array(0, -10, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Взять копии реликвий.",
                response = "Подделка для храбрости. Странно, но легче защищать.",
                statDeltas = fixed_array(0, 5, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Священники говорят, что закрывать больных — значит лишать их молитвы. Они требуют открыть карантинные дома.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Оставить карантин.",
                response = "Спасибо. Болезнь ненавидит закрытые двери.",
                statDeltas = fixed_array(0, -15, 0, 0, 20, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пустить священников внутрь карантина.",
                response = "Они войдут к больным. Надеюсь, не выйдут к здоровым с заразой.",
                statDeltas = fixed_array(0, 8, 0, 0, -5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Открыть карантинные дома.",
                response = "Тогда город получит свободу болезни.",
                statDeltas = fixed_array(0, 15, 0, 0, -25, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если церковь объявит зимний пост, нам нужно больше рыбы и репы. Мяса будет меньше, но люди возненавидят холод сильнее.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Готовить запасы для поста.",
                response = "Зима будет святой и пахнуть репой.",
                statDeltas = fixed_array(0, 8, 0, -12, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Не поддерживать зимний пост.",
                response = "Люди будут есть лучше. Священники — говорить хуже.",
                statDeltas = fixed_array(0, -10, 0, 0, 5, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Пост только для богатых.",
                response = "О, редкое чудо: богатые страдают первыми.",
                statDeltas = fixed_array(0, 5, 0, 0, 8, 0, 0, 8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один стражник признался священнику, что брал взятки. Священник не хочет выдавать его имя.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Уважать тайну исповеди.",
                response = "Стража поймёт, что храм над законом. Опасный урок.",
                statDeltas = fixed_array(0, 12, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать имя.",
                response = "Хорошо. Взятки прячутся хуже, когда исповедь не щит.",
                statDeltas = fixed_array(0, -12, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Объявить амнистию тем, кто признается сам.",
                response = "Мягкий капкан. Иногда лучшие.",
                statDeltas = fixed_array(0, 5, 5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь уже кормит бедных, лечит больных, судит грешников и говорит, кто достоин трона. Что остаётся королю?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вернуть часть функций короне.",
                response = "Трон снова станет видимым. Храм — обиженным.",
                statDeltas = fixed_array(0, -15, 8, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить церковь сильной.",
                response = "Тогда править будет легко. Пока церковь хочет того же, что и вы.",
                statDeltas = fixed_array(0, 20, -10, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разделить обязанности письменно.",
                response = "Хрупкий договор лучше крепкой ненависти.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, среди священников есть те, кто считает вас временным наказанием богов. Я могу заставить их молчать.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заставь их молчать.",
                response = "Молчание будет куплено страхом. Но страх тоже служит.",
                statDeltas = fixed_array(0, 10, 0, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть говорят.",
                response = "Тогда храм станет рынком мнений. Опасное зрелище.",
                statDeltas = fixed_array(0, -5, 0, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Назови их имена.",
                response = "Вы хотите лечить веру мечом. Иногда это оставляет шрамы на троне.",
                statDeltas = fixed_array(0, -15, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди просят провести службу за душу прежнего короля. Запретить — жестоко. Разрешить — опасно.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить службу.",
                response = "Мёртвые иногда успокаивают живых.",
                statDeltas = fixed_array(0, 8, -5, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить службу.",
                response = "Память не исчезнет. Она просто уйдёт в подвал.",
                statDeltas = fixed_array(0, -8, 8, 0, -10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить без имени прежнего короля.",
                response = "Компромисс для тех, кто боится даже мёртвых имён.",
                statDeltas = fixed_array(0, 3, 0, 0, 3, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Новая монета может нести ваш профиль или церковный символ. Первый вариант укрепит трон, второй — доверие народа.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Профиль короля.",
                response = "Монета будет смотреть на народ вашим лицом.",
                statDeltas = fixed_array(0, -8, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Церковный символ.",
                response = "Святая монета тратится так же быстро, но спорят с ней меньше.",
                statDeltas = fixed_array(0, 12, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Обе стороны: корона и алтарь.",
                response = "Двуликая монета. Очень честно для политики.",
                statDeltas = fixed_array(0, 5, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик хочет прислать священника на военный совет. Я не обсуждаю фланги с человеком, который верит в чудеса.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пустить священника на совет.",
                response = "Тогда пусть он молится, чтобы не мешал.",
                statDeltas = fixed_array(0, 12, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить.",
                response = "Хорошо. Карта останется картой, не иконой.",
                statDeltas = fixed_array(0, -10, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пускать только без права голоса.",
                response = "Пусть слушает. Молчание я ещё терплю.",
                statDeltas = fixed_array(0, 5, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Женщины идут рожать в храм, потому что им обещают благословение. Но там нет чистых простыней.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить роды в храме.",
                response = "Дети будут рождаться в чистоте, а не в дыму свечей.",
                statDeltas = fixed_array(0, -10, 0, 0, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оборудовать храмовую комнату для родов.",
                response = "Если уж они идут к храму, пусть храм хотя бы моет руки.",
                statDeltas = fixed_array(0, 8, 0, -10, 15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться.",
                response = "Тогда благословение будет стоять рядом с заражением.",
                statDeltas = fixed_array(0, 8, 0, 0, -12, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Храм просит лучшее вино для службы. Солдаты просят то же самое без службы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отдать вино храму.",
                response = "Святая чаша будет полной. Солдатские кружки — пустыми.",
                statDeltas = fixed_array(0, 10, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать вино армии.",
                response = "Солдаты выпьют за ваше здоровье. Храм — против него.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разбавить вино и разделить.",
                response = "Все получат меньше, чем хотели. Значит, справедливо.",
                statDeltas = fixed_array(0, 5, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Во время службы у храма поймали человека с ножом. Он говорит, что хотел убить не вас, а Малрика.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отдать его церкви.",
                response = "Храм будет судить нападение на храм. Удобно для них.",
                statDeltas = fixed_array(0, 12, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Судить королевским судом.",
                response = "Хорошо. Нож в столице — дело короны.",
                statDeltas = fixed_array(0, -8, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Допросить тайно.",
                response = "Если он правда шёл за Малриком, нам стоит узнать, кто его послал.",
                statDeltas = fixed_array(0, -3, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Народ теперь боится двух вещей: королевского меча и церковного проклятия. Вместе они держат порядок. Вместе они могут сломать страну.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Использовать оба страха.",
                response = "Порядок будет крепким. Как клетка.",
                statDeltas = fixed_array(0, 10, 10, 0, -15, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Смягчить королевские наказания.",
                response = "Трон станет менее страшным. Это риск и надежда.",
                statDeltas = fixed_array(0, 3, -8, 0, 10, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ограничить церковные проклятия.",
                response = "Вы забрали у храма гром. Теперь ждите молний.",
                statDeltas = fixed_array(0, -12, 5, 0, 8, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если вы продолжите спорить с храмом, некоторые священники могут отказать вам в молитвах. Народ услышит это как приговор.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Уступить храму.",
                response = "Молитвы продолжатся. Цена мира всегда ниже цены раскола.",
                statDeltas = fixed_array(0, 20, -5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пригрозить храму.",
                response = "Вы можете напугать священника. Но не веру, которая стоит за ним.",
                statDeltas = fixed_array(0, -20, 12, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Провести переговоры.",
                response = "Разговор — тонкий мост. Но мы пока ещё на нём.",
                statDeltas = fixed_array(0, 5, 0, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я открыл монастырские склады без разрешения Малрика. Люди ели. Теперь меня могут наказать.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Защитить Арвела.",
                response = "Спасибо. Я боялся не наказания, а того, что вы велите закрыть двери.",
                statDeltas = fixed_array(0, -12, 0, 0, 15, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Вернуть его под суд церкви.",
                response = "Я приму суд. Но голодные снова будут ждать.",
                statDeltas = fixed_array(0, 12, 0, 0, -8, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить его вернуть зерно.",
                response = "Тогда я заберу хлеб из рук тех, кто уже сказал спасибо.",
                statDeltas = fixed_array(0, 5, 0, 0, -15, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Малрик намекает, что большое пожертвование ускорит официальное признание вашей власти церковью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить.",
                response = "Поздравляю. Благословение оказалось товаром премиального качества.",
                statDeltas = fixed_array(0, 25, 0, -25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться платить.",
                response = "Казна сохранена. Небеса, похоже, подождут.",
                statDeltas = fixed_array(0, -15, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Предложить зерно вместо золота.",
                response = "Святое признание за мешки зерна. Почти честно.",
                statDeltas = fixed_array(0, 12, 0, 0, 3, 0, 0, -15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь больше не просто молится. Она кормит, судит, лечит, собирает золото и говорит, кто достоин трона. До девяностого дня осталось немного. Нужно решить, кем она станет.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Церковь станет опорой трона.",
                response = "Трон обретёт святую опору. И святую зависимость.",
                statDeltas = fixed_array(0, 25, -10, -10, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Церковь будет подчинена короне.",
                response = "Вы выбрали силу. Теперь храм может выбрать сопротивление.",
                statDeltas = fixed_array(0, -25, 15, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Церковь и корона разделят власть.",
                response = "Равновесие достигнуто. Осталось понять, кто первым его нарушит.",
                statDeltas = fixed_array(0, 10, 5, -5, 5, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ослабить церковь через народную помощь от короны.",
                response = "Если народ ест из вашей руки, он реже целует чужую.",
                statDeltas = fixed_array(0, -10, 0, -10, 20, 0, 0, -15, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    )
)


let public allEncountersRuPeople : Encounter[POOL_PEOPLE_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Народ шепчет слово ‘узурпатор’. Но если церковь проведёт обряд очищения короны, шёпот станет молитвой.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Провести дорогой обряд.",
                response = "Боги любят смирение. А народ любит видеть, что король склоняет голову.",
                statDeltas = fixed_array(5, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Провести скромный обряд.",
                response = "Скромность тоже добродетель. Хотя золото сияет убедительнее.",
                statDeltas = fixed_array(2, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Короне не нужны молитвы.",
                response = "Трон без благословения стоит высоко, но качается сильнее.",
                statDeltas = fixed_array(-5, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Чего церковь хочет взамен?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Немногое. Верните храму зерновые склады. Мы накормим души и тела, а вы получите тишину на улицах.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вернуть склады храму.",
                response = "Мудро. Хлеб, отданный храму, возвращается молитвой.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать только часть зерна.",
                response = "Половина милости всё же лучше полной гордыни.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -7, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Тогда пусть корона сама отвечает на голодные молитвы.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, в казне больше паутины, чем золота. Можно ввести временный налог на городские ворота.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести налог немедленно.",
                response = "Прекрасно. Ворота наконец начнут приносить больше, чем сквозняк.",
                statDeltas = fixed_array(-5, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести налог только для купцов.",
                response = "Купцы будут жаловаться. Но они жалуются даже на солнце, если оно светит бесплатно.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать ворота.",
                response = "Свободная торговля — благородная мысль. Жаль, что монет она даёт не сразу.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Найди другой источник дохода.",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Можно продать часть королевских украшений. Драгоценности красивы, но мёртвы. Казна хотя бы дышит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Продать тайно.",
                response = "Никто не заметит. Кроме тех, кто считал камни на короне.",
                statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продать публично, как жертву ради народа.",
                response = "Хороший ход. Бедность выглядит лучше, когда её называют добродетелью.",
                statDeltas = fixed_array(3, 0, 0, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не продавать.",
                response = "Величие останется целым. Казна — нет.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В нижнем городе жар и кашель. Это может быть простуда, а может быть начало мора. Нужно действовать сейчас.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Закрыть квартал на карантин.",
                response = "Жестоко, но разумно. Иногда дверь спасает больше жизней, чем меч.",
                statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить лекарей и оставить ворота открытыми.",
                response = "Мы сделаем, что сможем. Но болезнь любит открытые дороги.",
                statDeltas = fixed_array(8, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не сеять панику.",
                response = "Паника убивает быстро. Болезнь — терпеливее.",
                statDeltas = fixed_array(-20, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Насколько всё серьёзно?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Пока умерли трое. Если это то, чего я боюсь, через неделю мы будем считать не людей, а улицы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Карантин только заражённых улиц.",
                response = "Это даст нам время. А время — лучшее лекарство после чистой воды.",
                statDeltas = fixed_array(12, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сжечь заражённые дома.",
                response = "Огонь остановит болезнь. Но люди запомнят дым.",
                statDeltas = fixed_array(20, 0, 0, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Скрыть новость.",
                response = "Тайна не лечит жар. Она только ждёт, пока станет поздно.",
                statDeltas = fixed_array(-15, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Знать ждёт первого королевского пира. Но если я накрою стол как положено, городские амбары похудеют.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Устроить роскошный пир.",
                response = "Пир будет таким, что гости забудут голод. Правда, город — нет.",
                statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Устроить скромный пир.",
                response = "Скромный пир — это когда дворяне всё равно едят, но жалуются тише.",
                statDeltas = fixed_array(0, 0, 0, -4, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Отменить пир и раздать еду бедным.",
                response = "Хлеб внизу оценят больше, чем павлина наверху.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Можно обмануть гостей?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Можно. Дешёвое мясо, дорогой соус, много свечей — и половина гостей решит, что ела редкость.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сделать дешёвый пир под видом роскошного.",
                response = "Люблю, когда королевская мудрость пахнет чесноком и обманом.",
                statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Нет, пир должен быть настоящим.",
                response = "Будет настоящий. И голод после него тоже.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Вообще отменить пир.",
                response = "Тогда я приберегу мясо. В наше время это почти государственная измена.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После переворота дворец полон чужих лиц. Я прошу удвоить ночную стражу. Это дорого, но вы будете спать дольше.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Удвоить стражу.",
                response = "Хорошо. Ночь станет дороже, но безопаснее.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить только проверенных солдат.",
                response = "Меньше людей, больше доверия. Я смогу с этим работать.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не тратить деньги на страхи.",
                response = "Тогда будем надеяться, что страхи тоже не тратят ножи.",
                statDeltas = fixed_array(-2, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Кого ты подозреваешь?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Слуг прежнего короля. Не всех. Но достаточно одного с ключом, чтобы дверь стала могилой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заменить слуг солдатами.",
                response = "Дворец станет грубее, зато двери будут слушаться.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Проверить слуг тайно.",
                response = "Тихая проверка ловит больше правды, чем громкий приказ.",
                statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить их.",
                response = "Тогда я буду смотреть им в руки. Особенно когда они несут вам вино.",
                statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Первый указ нового короля запомнят все. Он должен быть простым. Милость, налог или меч?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Снизить цену на хлеб.",
                response = "Хлеб — самый тихий способ сказать народу, что он ещё нужен королю.",
                statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Увеличить сбор налогов.",
                response = "Казна оживёт. Народ, возможно, наоборот.",
                statDeltas = fixed_array(-10, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Объявить набор в армию.",
                response = "Мечей станет больше. Рук в полях — меньше.",
                statDeltas = fixed_array(0, 0, 15, -5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Пока не издавать указ.",
                response = "Иногда молчание мудро. Но в первые дни трона его часто принимают за слабость.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Пойманы шесть дезертиров. Они говорят, что бежали не от страха, а от голода. Армия смотрит, как вы поступите.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казнить их публично.",
                response = "Жестоко. Зато завтра никто не побежит первым.",
                statDeltas = fixed_array(-5, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Вернуть их в строй после наказания.",
                response = "Они будут хромать, но служить. Это лучше, чем висеть.",
                statDeltas = fixed_array(-2, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Помиловать и накормить.",
                response = "Милость хороша у очага. В казарме она пахнет слабостью.",
                statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Почему солдаты голодают?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что интенданты воруют. Война всегда кормит крыс — в амбарах и в мундирах.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Повесить интендантов.",
                response = "После этого зерно начнут считать честнее.",
                statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить вернуть украденное.",
                response = "Хорошо. Пусть их жадность хотя бы накормит солдат.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Скрыть скандал.",
                response = "Скрытая гниль всё равно пахнет. Просто позже.",
                statDeltas = fixed_array(0, 0, -5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди болеют не только телом, но и страхом. Позвольте храмам провести ночные службы. Толпы придут молиться.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить службы.",
                response = "Люди уйдут с молитвой на губах. Иногда этого достаточно, чтобы пережить ночь.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -3, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить большие собрания.",
                response = "Вы спасаете тела. Надеюсь, души подождут.",
                statDeltas = fixed_array(10, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Службы только на открытых площадях.",
                response = "Небо тоже свод храма. Боги услышат.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть церковь сама платит за охрану.",
                response = "Церковь заплатит. И запомнит, что король считает свечи.",
                statDeltas = fixed_array(2, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Можно выпустить новую монету с вашим лицом. Если добавить меньше серебра, казна выиграет. Народ заметит не сразу.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Чеканить честную монету.",
                response = "Дорого, но красиво. Честность всегда обходится дороже меди.",
                statDeltas = fixed_array(5, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разбавить серебро медью.",
                response = "Монета станет легче. Как и совесть тех, кто её тратит.",
                statDeltas = fixed_array(-8, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отложить чеканку.",
                response = "Старые монеты продолжат ходить. Вместе со старой памятью.",
                statDeltas = NO_STAT_CHANGE
            ),
            DialogueChoice(
                choiceText = "Кто узнает о подделке?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Мастера монетного двора. Но молчание стоит дешевле серебра.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить мастерам и разбавить монету.",
                response = "Хорошая сделка. Плохая монета. Прекрасная политика.",
                statDeltas = fixed_array(-8, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не рисковать.",
                response = "Осторожность редко наполняет сундуки, но иногда сохраняет головы.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Арестовать мастеров.",
                response = "Тишина станет надёжной. И очень испуганной.",
                statDeltas = fixed_array(-5, 0, 5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Вы не спали три ночи. Если вы рухнете, дворец начнёт делить власть без вас. Вам нужен отдых.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отменить приёмы на день.",
                response = "Живой король лучше занятого мертвеца.",
                statDeltas = fixed_array(3, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продолжить работать.",
                response = "Тогда хотя бы падайте рядом с креслом, чтобы вас легче было поднять.",
                statDeltas = fixed_array(-5, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Принять укрепляющее зелье.",
                response = "Оно поможет. Но не путайте бодрость с исцелением.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Что в зелье?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Травы, мёд и немного того, что заставит сердце биться быстрее. После него придёт слабость.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выпить всё равно.",
                response = "Вы купили день силы ценой завтрашней дрожи.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться и лечь спать.",
                response = "Наконец-то приказ, который не вредит телу.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Дать зелье чиновникам и гонцам.",
                response = "Они побегут быстрее. А потом упадут дружнее.",
                statDeltas = fixed_array(-5, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Часть зерна в западном амбаре покрылась серой плесенью. Если выбросим — еды станет меньше. Если сварим крепче — может, никто не умрёт.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выбросить испорченное зерно.",
                response = "Жаль зерно. Но мёртвые едят ещё меньше.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Использовать для солдатской каши.",
                response = "Солдаты заметят. Особенно те, кто добежит до ведра.",
                statDeltas = fixed_array(-10, 0, -5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Смешать с хорошим и раздать бедным.",
                response = "Бедняки привыкли к худшему. Но это не значит, что их желудки железные.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Можно спасти часть?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Треть можно просушить. Остальное уже годится только для крыс, и то злых.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Спасти треть, остальное выбросить.",
                response = "Разумно. Не щедро, не глупо. Редкий рецепт.",
                statDeltas = fixed_array(7, 0, 0, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Спасти всё и рискнуть.",
                response = "Тогда я велю готовить рядом с лазаретом.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Выбросить всё.",
                response = "Чистый амбар лучше полной могилы.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У дворцовых ворот собралась толпа. Они не вооружены, но требуют хлеба и ответа: кто теперь правит ими?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выйти к ним лично.",
                response = "Смелый ход. Я поставлю людей близко, но не слишком заметно.",
                statDeltas = fixed_array(10, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать хлеб через стражу.",
                response = "Хлеб говорит проще короля. Иногда даже убедительнее.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Разогнать толпу.",
                response = "Будет сделано. Но синяки тоже умеют помнить.",
                statDeltas = fixed_array(-15, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сказать, что король занят.",
                response = "Тогда они решат, что вы заняты не ими.",
                statDeltas = fixed_array(-8, 0, 0, 2, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Церковь может открыть свои амбары для бедных. Но в указе должно быть сказано, что это сделано по нашему милосердию.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Согласиться и похвалить церковь.",
                response = "Милосердие любит свидетелей. Сегодня ими станет весь город.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Помощь должна идти от имени короля.",
                response = "Корона хочет славы даже за чужой хлеб. Что ж, это тоже голод.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться от церковной помощи.",
                response = "Гордость редко бывает сытной.",
                statDeltas = fixed_array(-10, 0, 0, 3, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Разделить славу.",
                response = "Пусть народ благодарит и трон, и алтарь. Так безопаснее для всех.",
                statDeltas = fixed_array(7, 0, 0, 0, 0, 0, 0, 7, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В домах казнённых сторонников прошлого короля осталось серебро, картины, лошади. По закону всё можно забрать.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Забрать всё в казну.",
                response = "Мёртвым роскошь не нужна. Живой казне — очень.",
                statDeltas = fixed_array(-5, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Забрать только оружие и монеты.",
                response = "Умеренно. Я почти расстроен вашей порядочностью.",
                statDeltas = fixed_array(0, 0, 5, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить семьям часть имущества.",
                response = "Милосердие дорого. Но иногда дешевле мести.",
                statDeltas = fixed_array(8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать дома мёртвых.",
                response = "Красивый жест. Казна его не оценит, но вдовы — возможно.",
                statDeltas = fixed_array(10, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В городе пьют из канала, куда сбрасывают отходы. Если не очистить воду, болезнь вернётся сильнее.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выделить деньги на очистку колодцев.",
                response = "Чистая вода спасёт больше людей, чем десяток проповедей и сотня казней.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить жителей чистить бесплатно.",
                response = "Они будут злиться. Но хотя бы злиться живыми.",
                statDeltas = fixed_array(10, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пока не тратить деньги.",
                response = "Тогда болезнь уже получила ваш первый подарок.",
                statDeltas = fixed_array(-20, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть армия поможет.",
                response = "Солдаты с лопатами полезнее солдат с дубинками. Хотя они это возненавидят.",
                statDeltas = fixed_array(15, 0, -5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Армия ест лучше, чем городские дети. Я могу разбавить солдатскую похлёбку и направить крупу в приюты.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разбавить похлёбку.",
                response = "Дети поедят. Солдаты выругаются. Обычный день кухни.",
                statDeltas = fixed_array(10, 0, -10, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать солдатские пайки.",
                response = "Солдаты будут сыты. Приюты будут пахнуть пустыми мисками.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разбавить только офицерскую кухню.",
                response = "Офицеры заметят первыми. Они всегда замечают, когда страдают почти как люди.",
                statDeltas = fixed_array(5, 0, -3, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Солдаты заметят?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Рядовые — не сразу. Офицеры — после первой ложки. У них язык избалованнее совести.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Забрать часть офицерских припасов.",
                response = "Наконец-то блюдо, которое я готовлю с удовольствием.",
                statDeltas = fixed_array(5, 0, -5, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Забрать у всех поровну.",
                response = "Справедливо. Значит, недовольны будут все.",
                statDeltas = fixed_array(8, 0, -10, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить всё как есть.",
                response = "Сытый меч лучше голодного. Но дети мечи не едят.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После переворота у жителей осталось много оружия. Если собрать его, станет спокойнее. Если нет — каждый подвал может стать крепостью.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Собрать всё оружие.",
                response = "Город станет тише. Не обязательно спокойнее.",
                statDeltas = fixed_array(-10, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить оружие только гильдиям и стражникам.",
                response = "Компромисс. Достаточно твёрдый, чтобы не развалиться сразу.",
                statDeltas = fixed_array(0, 0, 8, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать людей.",
                response = "Они оценят доверие. Или воспользуются им.",
                statDeltas = fixed_array(8, 0, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Выкупить оружие.",
                response = "Монеты вместо обысков. Дорого, но с меньшим количеством криков.",
                statDeltas = fixed_array(5, 0, 10, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Некоторые старые министры готовы служить вам. Они опытны, но их руки пахнут прошлым троном.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Вернуть их в совет.",
                response = "Опыт вернётся. Вместе со старыми привычками.",
                statDeltas = fixed_array(0, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить только самых полезных.",
                response = "Хорошо. Старые ножи можно использовать, если держать их за рукоять.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Изгнать всех.",
                response = "Чистый стол. Пустой стол. Разница станет заметна завтра.",
                statDeltas = fixed_array(0, 0, 5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть принесут публичную клятву.",
                response = "Клятвы не меняют сердца. Но связывают языки.",
                statDeltas = fixed_array(3, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Нам нужны новые люди. Деревни полны крепких парней. Поля подождут, если трон рухнет.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Забрать рекрутов силой.",
                response = "Армия вырастет быстро. Поля будут скучать по рукам.",
                statDeltas = fixed_array(-10, 0, 25, 0, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Взять добровольцев за плату.",
                response = "Медленнее, но чище. Доброволец меньше смотрит назад.",
                statDeltas = fixed_array(0, 0, 10, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать деревни до урожая.",
                response = "Хлеб победил меч. Надеюсь, враг тоже любит ждать.",
                statDeltas = fixed_array(0, 0, -10, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Взять преступников вместо крестьян.",
                response = "Из плохих людей иногда выходят хорошие щиты.",
                statDeltas = fixed_array(-5, 0, 8, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди простят многое, если король склонит голову перед богами. Не перед людьми. Перед богами.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Покаяться за кровь переворота.",
                response = "Смирение укрепляет душу. Хотя солдаты любят его меньше.",
                statDeltas = fixed_array(10, 0, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сказать, что кровь была необходима.",
                response = "Мечу понравятся ваши слова. Алтарь промолчит.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть храм произнесёт речь от моего имени.",
                response = "Церковь умеет говорить там, где королю опасно.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться от покаяния.",
                response = "Гордая шея хорошо смотрится под короной. И под топором тоже.",
                statDeltas = fixed_array(-10, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Лекари требуют оплату за работу в нижнем городе. Если мы не заплатим, они уйдут лечить богатых.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить лекарям полностью.",
                response = "Дорогое милосердие. Но живые налогоплательщики полезнее мёртвых.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить половину.",
                response = "Половина платы — половина усердия. Иногда этого хватает.",
                statDeltas = fixed_array(8, 0, 0, -7, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Приказать лечить бесплатно.",
                response = "Прекрасно для казны. Опасно для больных.",
                statDeltas = fixed_array(-5, 0, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Позволить брать плату с больных.",
                response = "Казна вздохнёт. Бедняки, возможно, перестанут.",
                statDeltas = fixed_array(-15, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "На улицах ещё находят тела после ночи переворота. Если их не похоронить быстро, город заболеет.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Организовать общие похороны.",
                response = "Мёртвым уже всё равно. Живым — нет.",
                statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сжечь тела за городом.",
                response = "Быстро и безопасно. Но запах запомнят.",
                statDeltas = fixed_array(15, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть семьи сами забирают тела.",
                response = "Семьи получат горе. Город — заразу.",
                statDeltas = fixed_array(-10, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Скрыть тела в старых ямах.",
                response = "Ямы не хранят тайны. Они выращивают болезни.",
                statDeltas = fixed_array(-25, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если каждый день раздавать у ворот немного хлеба от имени короля, люди начнут говорить мягче. Но хлеб не появляется из воздуха.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Раздавать хлеб ежедневно.",
                response = "Люди будут ждать вас не с камнями, а с мисками. Это лучше.",
                statDeltas = fixed_array(20, 0, 0, 0, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Раздавать только детям и больным.",
                response = "Меньше хлеба, больше смысла. Хороший приказ.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать один раз, для вида.",
                response = "Для вида хватит. Для голода — нет.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Не кормить сторонников старого короля.",
                response = "Голод не спрашивает, за кого человек вчера кричал.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мы поймали гонца с письмом на север. Письмо зашифровано. Он говорит, что несёт семейные новости.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пытать гонца.",
                response = "Он заговорит. Вопрос только в том, будет ли это правда.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить писарям за расшифровку.",
                response = "Чернила иногда честнее крови.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отпустить, но проследить.",
                response = "Хорошо. Иногда лучше идти за нитью, чем рвать её.",
                statDeltas = fixed_array(0, 0, 3, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Что ты думаешь о письме?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Семейные новости не шифруют военным кодом. Если это письмо о тёте, тётя командует крепостью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Расшифровать письмо.",
                response = "Разумно. Мёртвый гонец не приведёт нас к отправителю.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить гонца и сжечь письмо.",
                response = "След исчезнет. Возможно, вместе с ответом.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Подменить письмо.",
                response = "Опасная игра. Но враг может сам открыть дверь.",
                statDeltas = fixed_array(0, 0, 8, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Город говорит, что вы правите только потому, что генерал держит меч у вашей спины. Надо показать, кто здесь король.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Провести смотр армии.",
                response = "Мечи блестят убедительно. Но они бросают длинные тени.",
                statDeltas = fixed_array(0, 0, 10, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Судить коррумпированного чиновника.",
                response = "Хорошо. Справедливость громче парада, если выбрать правильную площадь.",
                statDeltas = fixed_array(8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Выйти на рынок без доспехов.",
                response = "Смелость или безрассудство. Иногда народ не различает.",
                statDeltas = fixed_array(12, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не отвечать на слухи.",
                response = "Слухи любят пустое место. Вы оставили им зал.",
                statDeltas = fixed_array(0, 0, -5, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В казармах ещё висят знамёна прежнего короля. Солдаты говорят, что это память. Я говорю — это сомнение.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сжечь старые знамёна.",
                response = "Пламя быстро учит, какой цвет теперь главный.",
                statDeltas = fixed_array(-5, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сложить их в архив.",
                response = "Мягко. Но хотя бы они больше не будут смотреть на солдат.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить, но добавить мой герб.",
                response = "Компромисс. Солдаты любят ясность больше.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить обсуждать прежнего короля.",
                response = "Запрет не убивает память. Но заставляет её говорить шёпотом.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, королевство нельзя спасти всем сразу. В первый месяц нужно выбрать, что важнее: хлеб, меч, казна или жизнь людей.",
            choiceCount = 5,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сначала накормить город.",
                response = "Хлеб — тихий союзник. Пока он есть, люди ещё слушают.",
                statDeltas = fixed_array(10, 0, 0, -15, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Сначала укрепить армию.",
                response = "Меч защитит трон. Но не накормит город.",
                statDeltas = fixed_array(0, 0, 25, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Сначала наполнить казну.",
                response = "Золото даст время. Вопрос — кто переживёт это время.",
                statDeltas = fixed_array(-10, 0, 0, 25, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Сначала остановить болезни.",
                response = "Живые подданные ещё могут простить. Мёртвые — только преследовать имя.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Можно удержать всё сразу?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            )
            )
        ),
        DialogueNode(
            prompt = "Можно попытаться. Но равновесие — это не мягкий путь. Это канат над пропастью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Распределить силы поровну.",
                response = "Осторожный выбор. Не великий, не позорный. Иногда именно такие переживают зиму.",
                statDeltas = fixed_array(7, 0, 7, 7, 0, 0, 0, 7, 0)
            ),
            DialogueChoice(
                choiceText = "Нет, сначала армия.",
                response = "Тогда пусть солдаты помнят, что защищают королевство, а не только вашу дверь.",
                statDeltas = fixed_array(0, 0, 20, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Нет, сначала здоровье.",
                response = "Вы выбрали жизнь. Теперь нужно сделать так, чтобы живым было чем жить.",
                statDeltas = fixed_array(20, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мои караваны могут привезти зерно уже через три дня. Но я хочу исключительное право продавать хлеб в столице.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать тебе монополию.",
                response = "Мудро. Народ получит хлеб, а я — благодарность в монетах.",
                statDeltas = fixed_array(-8, 0, 0, 10, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(
                choiceText = "Купить зерно без монополии.",
                response = "Вы покупаете еду, но не дружбу. Это дороже в будущем.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Корона не будет зависеть от купцов.",
                response = "Гордая корона. Посмотрим, насколько гордым бывает голод.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Почему у тебя уже есть столько зерна?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что я покупаю, когда другие молятся. Деревни продавали дёшево, Ваше Величество. Я просто была быстрее ваших чиновников.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Выкупить зерно по твоей цене.",
                response = "Приятно иметь дело с короной, которая понимает рынок.",
                statDeltas = fixed_array(0, 0, 0, -20, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Продашь дешевле.",
                response = "Ах, королевская торговля: сначала приказ, потом цена.",
                statDeltas = fixed_array(0, 0, 3, -8, 0, 0, 0, 18, 0)
            ),
            DialogueChoice(
                choiceText = "Конфисковать половину.",
                response = "Вы получите зерно. И купцов, которые начнут прятать всё остальное.",
                statDeltas = fixed_array(-8, 0, 0, -5, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Тюрьмы полны сторонников прежнего короля. Если казнить всех, площадь не успеют отмыть.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казнить главных.",
                response = "Разумный ужас. Его легче вынести, чем бойню.",
                statDeltas = fixed_array(-5, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить всех.",
                response = "Тогда пришлите больше палачей. Или меньше совести.",
                statDeltas = fixed_array(-20, 0, 20, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить их на работы.",
                response = "Живые предатели полезнее мёртвых, если держать их под цепью.",
                statDeltas = fixed_array(-5, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сколько среди них настоящих заговорщиков?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Меньше половины. Но страх не спрашивает доказательств. Он работает и без них.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казнить только доказанных.",
                response = "Редкий случай: правосудие и порядок не подрались насмерть.",
                statDeltas = fixed_array(3, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Страх полезнее правды.",
                response = "Страх будет служить вам. Пока не найдёт нового хозяина.",
                statDeltas = fixed_array(-15, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Виновных — на казнь, остальных — на работы.",
                response = "Хороший раздел. Топор и кирка получат каждый своё.",
                statDeltas = fixed_array(-5, 0, 5, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У ворот монастыря спят дети. Они просят не золота, а похлёбки. Разрешите открыть королевские запасы?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Раздать похлёбку детям.",
                response = "Сегодня они уснут не от слабости, а от тепла. Благодарю вас.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать всем бедным.",
                response = "Это милость, которую город запомнит желудком.",
                statDeltas = fixed_array(25, 0, 0, 0, 0, 0, 0, -25, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть монастырь кормит их сам.",
                response = "Мы попробуем. Но пустая миска не становится полной от молитвы.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Почему они пришли к монастырю, а не к дворцу?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что дворцовые ворота охраняют копья, а монастырские — только старые петли. Голодные идут туда, где их не бьют.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Открыть королевскую кухню у дворца.",
                response = "Тогда люди увидят не стены дворца, а руку короля.",
                statDeltas = fixed_array(20, 0, 0, -5, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Передать зерно монастырю.",
                response = "Мы накормим их без вопросов. Это иногда лучшее правосудие.",
                statDeltas = fixed_array(18, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить стражу у монастыря.",
                response = "Стража разгонит толпу. Но не голод.",
                statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я могу приготовить лекарство для нижнего города. Оно горькое, пахнет болотом, но многие выживут.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить лекарство для всех больных.",
                response = "Щедрый приказ. Болото будет довольно, а больные — тем более.",
                statDeltas = fixed_array(25, 0, 0, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Купить только для детей.",
                response = "Дети выживут. Их родители, возможно, будут достаточно благодарны, чтобы не проклинать вас вслух.",
                statDeltas = fixed_array(12, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть больные платят сами.",
                response = "Как пожелаете. Болезнь редко спрашивает, есть ли у человека монеты.",
                statDeltas = fixed_array(-15, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Почему оно такое дорогое?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что болотная лилия цветёт три ночи в году. А ещё потому что я не собираюсь умирать бедной, спасая ваших бедняков.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить твою цену.",
                response = "Мудро. Иногда жизнь дешевле купить, чем потом оплакивать.",
                statDeltas = fixed_array(25, 0, 0, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Снизь цену, или я заберу рецепт силой.",
                response = "Ах, королевская медицина. Сначала угроза, потом лечение.",
                statDeltas = fixed_array(20, 0, 3, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продай рецепт короне.",
                response = "Рецепт ваш. Если ваши люди перепутают лилию с крапивой, не зовите меня на похороны.",
                statDeltas = fixed_array(18, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Армия держит трон, но трон кормит армию плохо. Введите военный сбор.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести сбор со всех.",
                response = "Солдаты будут сыты. Остальные — осторожны.",
                statDeltas = fixed_array(-15, 0, 15, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести сбор только с богатых.",
                response = "Меньше золота, меньше злости. Приемлемо.",
                statDeltas = fixed_array(0, 0, 8, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать армии.",
                response = "Армия умеет ждать. Но плохо умеет прощать.",
                statDeltas = fixed_array(0, 0, -15, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сколько армия продержится без сбора?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Три недели — с дисциплиной. Пять — с кражами. Семь — с мятежом. Я предпочёл бы не проверять восьмую.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести временный сбор на месяц.",
                response = "Временный приказ часто живёт дольше королей. Но сейчас он нужен.",
                statDeltas = fixed_array(-8, 0, 10, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Выдать армии зерно вместо золота.",
                response = "Солдат можно успокоить хлебом. Но ненадолго.",
                statDeltas = fixed_array(0, 0, 10, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть армия терпит.",
                response = "Терпение — плохой паёк.",
                statDeltas = fixed_array(0, 0, -20, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если привезти святые мощи в столицу, люди забудут страх. Но дорога и охрана обойдутся дорого.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Организовать процессию.",
                response = "Город увидит, что небеса ещё смотрят в его сторону.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Привезти мощи без праздника.",
                response = "Тихая святыня утешает меньше, но тоже утешает.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не тратить деньги на кости.",
                response = "Не все кости мертвы для народа, Ваше Величество.",
                statDeltas = fixed_array(-5, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Люди действительно верят в эти мощи?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Люди верят не в кости. Они верят, что кто-то над ними ещё не отвернулся.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пусть мощи прибудут с почестями.",
                response = "Надежда войдёт в город раньше реликвии.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Церковь оплатит половину.",
                response = "Алтарь разделит цену. И запомнит, что трон умеет торговаться.",
                statDeltas = fixed_array(10, 0, 0, -7, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить процессию раздачей хлеба.",
                response = "Хлеб — тоже молитва, если дать его вовремя.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Есть купцы, готовые купить чиновничьи места. Они будут воровать, конечно. Но сначала заплатят нам.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Продать должности.",
                response = "Казна оживёт. Совесть пусть подышит позже.",
                statDeltas = fixed_array(-15, 0, 0, 30, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продать только мелкие должности.",
                response = "Мелкое воровство — почти традиция.",
                statDeltas = fixed_array(-5, 0, 0, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить продажу должностей.",
                response = "Похвально. Убыточно, но похвально.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Насколько сильно они будут воровать?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Настолько, насколько им позволят. То есть много, если мы будем смотреть в другую сторону. И умеренно, если будем брать долю.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Продать и брать долю.",
                response = "Грязный доход всё ещё доход.",
                statDeltas = fixed_array(-20, 0, 0, 35, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продать, но назначить проверяющих.",
                response = "Воры под присмотром воруют медленнее. Обычно.",
                statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать оплату зерном.",
                response = "Хорошо. Пусть хотя бы их честолюбие будет съедобным.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После публичных наказаний на площади давка. Раненых больше, чем преступников. Это не правосудие, это бойня.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить публичные казни.",
                response = "Сегодня площадь станет менее кровавой. Это уже победа.",
                statDeltas = fixed_array(15, 0, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить только закрытые казни.",
                response = "Смерть за стеной всё ещё смерть. Но хотя бы без давки.",
                statDeltas = fixed_array(8, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Площадь должна видеть силу.",
                response = "Тогда площадь увидит ещё и сломанные рёбра.",
                statDeltas = fixed_array(-15, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Толпа сама виновата?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Толпа виновата только в том, что боится. А страх толкается, падает, ломает рёбра и давит детей.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ставить лекарей на площади.",
                response = "Если уж вы показываете смерть, пусть рядом будет хоть кто-то за жизнь.",
                statDeltas = fixed_array(8, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Перенести казни за город.",
                response = "Палач уйдёт дальше. Люди вздохнут ближе.",
                statDeltas = fixed_array(10, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить всё как есть.",
                response = "Тогда зовите меня не к больным, а к вашим последствиям.",
                statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Крысы жрут лучше некоторых солдат. Если не очистить амбар, через неделю они станут жирнее казначея.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Нанять крысоловов.",
                response = "Наконец-то война, где я болею за убийц.",
                statDeltas = fixed_array(5, 0, 0, -8, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Пустить кошек в амбар.",
                response = "Кошки будут довольны. Крысы — удивлены.",
                statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Использовать отраву.",
                response = "Еда спасётся. Если люди потом не спасутся от еды.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Насколько всё плохо?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Одна крыса вчера утащила кусок сыра и посмотрела на меня так, будто я ей должен налоги.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Нанять лучших крысоловов.",
                response = "Хорошо. Пусть хоть кто-то в этом дворце честно ловит воров.",
                statDeltas = fixed_array(8, 0, 0, -12, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Дать отраву, но закрыть амбар.",
                response = "Риск есть. Но крысы не уйдут сами из вежливости.",
                statDeltas = fixed_array(-3, 0, 0, -3, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть солдаты чистят амбар.",
                response = "Солдаты будут ругаться. Крысы тоже.",
                statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Солдаты говорят, что вы слушаете купцов чаще, чем генералов. Это опасный шёпот.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Устроить смотр армии.",
                response = "Парад заглушит шёпот. На время.",
                statDeltas = fixed_array(0, 0, 15, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать солдатам хлеб и пиво.",
                response = "Сытый солдат спорит мягче.",
                statDeltas = fixed_array(0, 0, 10, -5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Арестовать зачинщиков.",
                response = "Некоторые шёпоты заканчиваются в подвале.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Кто начал этот шёпот?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Не один человек. Несколько костров, несколько кружек, одна фраза: ‘купцы едят, солдаты ждут’.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Накормить казармы сегодня.",
                response = "Хлеб закроет им рты лучше приказа.",
                statDeltas = fixed_array(0, 0, 12, 0, 0, 0, 0, -12, 0)
            ),
            DialogueChoice(
                choiceText = "Найти говорунов и наказать.",
                response = "Они замолчат. Остальные будут думать тише.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Выступить перед солдатами лично.",
                response = "Рискованно. Но солдаты любят видеть, кому служат.",
                statDeltas = fixed_array(0, 0, 10, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Кредиторы требуют выплаты долгов прежнего короля. Формально это не ваши долги. Но трон тот же.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Заплатить часть долгов.",
                response = "Вы покупаете доверие дорого. Но доверие редко продают дёшево.",
                statDeltas = fixed_array(5, 0, 0, -20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться платить.",
                response = "Казна улыбнётся. Торговцы — нет.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить зерном.",
                response = "Долг уйдёт. Запасы тоже.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Эти бумаги настоящие?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Часть — настоящие. Часть — написаны слишком свежими чернилами для старого долга. Покойники, как правило, не занимают деньги вчера.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Оплатить только доказанные долги.",
                response = "Справедливый путь. Не самый быстрый, но крепкий.",
                statDeltas = fixed_array(5, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Объявить подделки изменой.",
                response = "Кредиторы станут осторожнее. И злее.",
                statDeltas = fixed_array(0, 0, 5, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не платить никому.",
                response = "Иногда отказ звучит как сила. Иногда как банкротство.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Отец мальчика поднял меч против вас. Сам мальчик слишком мал для меча, но достаточно взрослый, чтобы помнить.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отправить мальчика в монастырь.",
                response = "Монастырские стены лучше тюремных. Для детей — точно.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить его в армию слугой.",
                response = "Он вырастет рядом с мечами. Это либо лекарство, либо яд.",
                statDeltas = fixed_array(-3, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить как предупреждение.",
                response = "Площадь поймёт. Простит ли — другой вопрос.",
                statDeltas = fixed_array(-20, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Он опасен?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Сегодня — нет. Завтра — кто знает. У детей хорошая память, особенно если король оставил её сиротой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пусть живёт под надзором.",
                response = "Мягкий ошейник. Иногда он держит лучше железного.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать его монастырю.",
                response = "Молитва может притупить месть. Иногда.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не оставлять будущих врагов.",
                response = "Тогда у вас станет меньше врагов. И больше призраков.",
                statDeltas = fixed_array(-20, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Колокола звонят каждый час. Люди считают мёртвых и теряют волю. Может, стоит запретить звон?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Запретить похоронный звон.",
                response = "Город станет тише. Надеюсь, не бесчувственнее.",
                statDeltas = fixed_array(5, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разрешить звон только утром.",
                response = "Один звон для памяти. Остальной день — для живых.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть звонят.",
                response = "Мёртвые заслужили память. Живые заслужили передышку.",
                statDeltas = fixed_array(-3, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разве молчание утешит живых?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Нет. Но постоянный звон превращает город в могилу, где живые уже считают себя следующими.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Звонить только на рассвете.",
                response = "Пусть день начинается с памяти, а не заканчивается страхом.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить звон общей молитвой.",
                response = "Молитва собирает людей мягче, чем колокол.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "После каждого звона раздавать хлеб.",
                response = "Хлеб после скорби — милость, которую можно держать в руках.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У нас есть лекари, знающие холодные болезни. Они могут помочь вашему городу. За разумную цену.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Нанять лекарей.",
                response = "Северные руки холодные, но полезные.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Обменять услуги на снижение пошлин.",
                response = "Взаимная выгода. Самая честная форма дружбы.",
                statDeltas = fixed_array(15, 0, 0, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать чужеземцам.",
                response = "Ваш город болеет, но ваша гордость здорова.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Почему ты предлагаешь помощь так охотно?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что больной сосед — плохой торговец и хороший источник заразы. Север умеет считать выгоду.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Нанять всех лекарей.",
                response = "Они прибудут до заката. Болезни лучше не давать фору.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Нанять двоих для проверки.",
                response = "Осторожно. Север уважает осторожных почти так же, как сильных.",
                statDeltas = fixed_array(10, 0, 0, -6, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Принять лекарей, но не пускать во дворец.",
                response = "Ваше доверие хромает, но всё же идёт.",
                statDeltas = fixed_array(12, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_INGVAR
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У меня есть порошок для спокойного сна. Его можно дать больным. Или солдатам, которые слишком громко спорят.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать больным.",
                response = "Сон — дешёвый лекарь. Мой порошок просто берёт за вход.",
                statDeltas = fixed_array(10, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Дать беспокойным солдатам.",
                response = "Тихая казарма — редкое чудо. Не спрашивайте, насколько естественное.",
                statDeltas = fixed_array(3, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Купить запас для дворца.",
                response = "Дворцы спят хуже трущоб. Там больше подушек и больше страхов.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Насколько он безопасен?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "В малой дозе человек спит. В большой — тоже спит, просто дольше, чем его родственникам хотелось бы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить малую партию для больных.",
                response = "Осторожно. Почти скучно. Но больным понравится.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Купить много. Дозировку доверить тебе.",
                response = "Наконец-то король, который уважает опасные таланты.",
                statDeltas = fixed_array(12, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить этот порошок.",
                response = "Запреты тоже усыпляют. В основном разум.",
                statDeltas = fixed_array(3, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "На рынках дерутся за хлеб. Дайте мне солдат, и через час там будет порядок.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отправить вооружённых солдат.",
                response = "Порядок придёт быстро. С криками, но быстро.",
                statDeltas = fixed_array(-10, 0, 5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить солдат без оружия.",
                response = "Солдаты без оружия — это почти просьба. Но попробуем.",
                statDeltas = fixed_array(5, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поручить рынки старостам.",
                response = "Старосты хороши для споров о цене. Не для драки.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Ты называешь это порядком или страхом?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "На рынке голодный человек не различает эти слова. Он видит копьё и вспоминает, что у него есть ноги.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пусть солдаты наведут порядок.",
                response = "Будет порядок. Пусть даже с синяками.",
                statDeltas = fixed_array(-10, 0, 8, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Солдаты охраняют хлеб, но не трогают людей.",
                response = "Тонкая грань. Я прослежу, чтобы её не перешагнули слишком часто.",
                statDeltas = fixed_array(5, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить раздатчиков еды.",
                response = "Хлеб вместо дубинки. Мягко. Иногда работает.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один лекарь говорит, что болезни рождаются в грязной воде, а не в грехах. Народ слушает его слишком внимательно.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Защитить лекаря.",
                response = "Вы выбираете воду против проповеди. Храм это заметит.",
                statDeltas = fixed_array(15, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить лекаря извиниться.",
                response = "Смирение полезно даже тем, кто моет руки чаще души.",
                statDeltas = fixed_array(-3, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать лекаря церковному суду.",
                response = "Алтарь разберётся. Быстро или назидательно.",
                statDeltas = fixed_array(-15, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Чистая вода противоречит вере?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Нет. Но когда люди верят только воде, они перестают бояться греха. А без страха храм пустеет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Лекарь говорит о воде, храм — о душе.",
                response = "Разделение мудрое. Если обе стороны помнят своё место.",
                statDeltas = fixed_array(10, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Лекарь должен говорить осторожнее.",
                response = "Осторожные слова редко жгут мосты.",
                statDeltas = fixed_array(3, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Очистить колодцы и провести службу.",
                response = "Вода для тела, молитва для страха. Хороший порядок.",
                statDeltas = fixed_array(18, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В храмах много серебра. Если взять часть ‘в долг’, казна оживёт.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Взять храмовое серебро.",
                response = "Казна оживёт. Храмы начнут кричать, но не сразу.",
                statDeltas = fixed_array(-10, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Попросить пожертвование.",
                response = "Просьба приносит меньше, зато реже приводит к камням.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать храмы.",
                response = "Святость сохранена. Пустота тоже.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Это вызовет бунт?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Не сразу. Сначала будут проповеди. Потом плачущие старухи. Потом камни в сборщиков налогов. Но серебро будет уже у нас.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Взять быстро и тайно.",
                response = "Тайна дешевле войны. До тех пор, пока остаётся тайной.",
                statDeltas = fixed_array(-8, 0, 0, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Взять только у богатых монастырей.",
                response = "Умеренное святотатство. Почти финансовая реформа.",
                statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не трогать храмы.",
                response = "Иногда король покупает покой тем, что ничего не берёт.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Женщины рожают в грязи и холоде. Дайте мне старый склад, я сделаю из него дом для рожениц.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать склад и деньги.",
                response = "Вы спасаете тех, кто ещё даже не успел испугаться вашего правления.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Дать склад без денег.",
                response = "Стены лучше улицы. Но стены без лекарей спасают не всех.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -3, 0)
            ),
            DialogueChoice(
                choiceText = "Склад нужен для зерна.",
                response = "Хлеб важен. Но мёртвые младенцы его не едят.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Сколько жизней это спасёт?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Я не богиня, чтобы считать заранее. Но грязный пол забирает младенцев чаще, чем мечи забирают солдат.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать склад и деньги.",
                response = "Тогда сегодня корона сделала что-то по-настоящему живое.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Дать маленькое помещение при лазарете.",
                response = "Мало. Но лучше, чем ничего, а с этого иногда начинается спасение.",
                statDeltas = fixed_array(12, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Сейчас важнее зерно.",
                response = "Тогда я вернусь, когда цена этого выбора начнёт плакать.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Пришло мясо с юга. Дёшево. Слишком дёшево. Оно пахнет победой над здравым смыслом.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить и накормить бедных.",
                response = "Бедные поедят. Потом, возможно, пожалеют.",
                statDeltas = fixed_array(-15, 0, 0, -5, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Купить только для собак и армии.",
                response = "Собаки простят. Солдаты — не факт.",
                statDeltas = fixed_array(-5, 0, -3, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться от мяса.",
                response = "Хорошо. Иногда лучшая еда — та, которую не съели.",
                statDeltas = fixed_array(5, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ты думаешь, оно испорчено?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Если мясо пахнет так, будто уже познакомилось со смертью, я предпочитаю не знакомить его с желудками.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Сжечь мясо.",
                response = "Дым лучше похоронной песни.",
                statDeltas = fixed_array(10, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Засолить и рискнуть.",
                response = "Соль многое скрывает. Но не всё прощает.",
                statDeltas = fixed_array(-8, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Вернуть продавцам.",
                response = "Пусть они сами ужинают своей выгодой.",
                statDeltas = fixed_array(0, 0, 0, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Часть королевского зерна исчезает и появляется ночью на чёрном рынке. Кто-то внутри дворца кормит воров.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Устроить облаву.",
                response = "Поймаем кого-то точно. Вопрос — вора или удобную жертву.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить тайную слежку.",
                response = "Тихая охота. Мне нравится.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Повысить наказания за кражу зерна.",
                response = "Страх уменьшит кражи. Или сделает воров осторожнее.",
                statDeltas = fixed_array(-8, 0, 5, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Ты знаешь, кто помогает ворам?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Знаю, откуда пахнет. От складских ключей и людей, которые слишком быстро разбогатели после переворота.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Арестовать складских смотрителей.",
                response = "Жёстко. Но ключи любят строгие руки.",
                statDeltas = fixed_array(-3, 0, 5, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Подменить мешки и проследить путь.",
                response = "Хорошо. Пусть воры сами приведут нас домой.",
                statDeltas = fixed_array(0, 0, 0, -5, 0, 0, 0, 12, 0)
            ),
            DialogueChoice(
                choiceText = "Закрыть дело, чтобы не позорить дворец.",
                response = "Позор останется. Просто сытый.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "На главной площади стоит статуя прежнего короля. Одни кладут к ней цветы, другие плюют. Что делать?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Снести статую.",
                response = "Вы уберёте камень. Память придётся убирать дольше.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить статую.",
                response = "Мягкий жест. Сторонники силы назовут его слабостью.",
                statDeltas = fixed_array(5, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Переплавить её на монеты.",
                response = "История станет мелкой монетой. Символично, но опасно.",
                statDeltas = fixed_array(-5, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Что бы сделал мудрый король?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Мудрый король не спорит с камнем. Он переносит его туда, где память перестаёт быть знаменем.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Перенести статую в старый сад.",
                response = "Память останется, но перестанет командовать площадью.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить рядом новый герб.",
                response = "Вы не стираете прошлое. Вы ставите над ним свою печать.",
                statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Снести ночью.",
                response = "Ночь скроет рабочих. Но утром все увидят пустоту.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если вы ограничите цену на хлеб, пекари спрячут муку. Если не ограничите, бедные начнут есть кору.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ограничить цену.",
                response = "Бедные будут благодарны. Пекари начнут считать тайники.",
                statDeltas = fixed_array(15, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Не вмешиваться в рынок.",
                response = "Рынок выживет. Не все люди — но рынок точно.",
                statDeltas = fixed_array(-15, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Компенсировать пекарям разницу.",
                response = "Вот это язык торговли. Наконец-то.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Как удержать цену и не потерять муку?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Очень просто: вы платите пекарям, пекари улыбаются народу, народ благодарит вас, а казначей плачет в подушку.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Компенсировать пекарям.",
                response = "Дорого, красиво, почти разумно.",
                statDeltas = fixed_array(15, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Дать пекарям зерно вместо золота.",
                response = "Хлеб за хлеб. Простая сделка, редкость для дворца.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть рынок решает сам.",
                response = "Рынок решит. Потом толпа тоже.",
                statDeltas = fixed_array(-15, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один приговорённый просит не вешать его на площади, а убить быстро и тихо. Он говорит, что у него дети.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить тихую казнь.",
                response = "Меньше зрелища. Больше человеческого.",
                statDeltas = fixed_array(3, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Публичная казнь нужна порядку.",
                response = "Площадь получит урок. Дети — память.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить казнь каторгой.",
                response = "Живой преступник ещё может приносить пользу.",
                statDeltas = fixed_array(0, 0, -5, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Он действительно виновен?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Виновен достаточно, чтобы умереть по приказу. Но недостаточно, чтобы я запомнил его имя.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пересмотреть дело.",
                response = "Редко топор ждёт бумаги. Но сегодня подождёт.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить тихо.",
                response = "Тихая смерть всё равно смерть. Но без толпы.",
                statDeltas = fixed_array(3, 0, -3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Казнить публично.",
                response = "Понял. Площадь снова будет учиться страху.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Голодный человек не слышит молитвы. Дайте нам зерно, и мы будем кормить людей перед службами.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать зерно монастырю.",
                response = "Спасибо. Сегодня проповедь начнётся с ложки супа.",
                statDeltas = fixed_array(20, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Дать немного зерна.",
                response = "Немного тепла лучше полного холода.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, -7, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть сначала молятся, потом едят.",
                response = "Пустой желудок плохо держит молитву.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Ты хочешь кормить или обращать?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Я хочу, чтобы они дожили до завтра. Если завтра они будут молиться — хорошо. Если просто будут дышать — уже чудо.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать зерно без условий.",
                response = "Это милосердие. Без крючка. Редкая вещь при дворе.",
                statDeltas = fixed_array(20, 0, 0, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Дать зерно только детям и больным.",
                response = "Я приму. Хотя голодные взрослые тоже люди.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Не тратить запасы.",
                response = "Тогда я буду молиться, чтобы запасы простили вас.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "У меня есть сильная отрава. Для крыс, разумеется. Хотя крысы бывают разными.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить для амбаров.",
                response = "Крысы умрут. Надеюсь, повара умеют читать предупреждения.",
                statDeltas = fixed_array(-3, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Купить тайно для дворца.",
                response = "Дворцовые крысы ходят на двух ногах. Понимаю.",
                statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить продажу отравы.",
                response = "Запретите. Крысы, правда, указов не читают.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Ты предлагаешь мне яд?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Я предлагаю средство. Яд — это когда средство попадает не в ту чашу.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить только для амбаров.",
                response = "Как скучно. Как благоразумно.",
                statDeltas = fixed_array(-3, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Купить и держать во дворце.",
                response = "Пусть ваши враги надеются, что вы не умеете выбирать чаши.",
                statDeltas = fixed_array(0, 0, 3, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Передать отраву стражникам.",
                response = "О, теперь яд будет под присмотром людей с мечами. Что может пойти не так?",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Лазареты забиты гражданскими. Раненым солдатам некуда лечь. Кто важнее для трона?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Освободить места для солдат.",
                response = "Солдаты будут помнить. Гражданские тоже.",
                statDeltas = fixed_array(-15, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить гражданских.",
                response = "Милосердие к городу. Горечь в казармах.",
                statDeltas = fixed_array(15, 0, -10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Расширить лазарет.",
                response = "Дорого. Но хотя бы никто не сможет сказать, что вы выбрали мёртвых.",
                statDeltas = fixed_array(10, 0, 5, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Ты хочешь, чтобы я выбрал между мечом и народом?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Нет. Я хочу, чтобы вы поняли: меч, который истекает кровью на полу, завтра не защитит народ.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Расширить лазарет.",
                response = "Хороший приказ. Даже я не стану спорить.",
                statDeltas = fixed_array(10, 0, 5, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Половину мест солдатам.",
                response = "Половина справедливости лучше полной ссоры.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Солдаты первыми.",
                response = "Армия отплатит верностью. Остальные — как смогут.",
                statDeltas = fixed_array(-15, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_RUDOLF
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Даже предатель имеет душу. Пусть священник говорит с каждым перед смертью.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить.",
                response = "Милость перед смертью — всё ещё милость.",
                statDeltas = fixed_array(5, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Только важным заключённым.",
                response = "Души, выходит, тоже делятся по рангу.",
                statDeltas = fixed_array(2, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Нет. Быстрая казнь дешевле.",
                response = "Дешёвая смерть часто дорого обходится живым.",
                statDeltas = fixed_array(-5, 0, 3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Зачем утешать предателей?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Мы утешаем не предателей. Мы утешаем тех, кто смотрит и думает: ‘если меня обвинят, умру ли я как зверь?’",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Разрешить молитву всем.",
                response = "Сегодня страх станет чуть менее звериным.",
                statDeltas = fixed_array(6, 0, 0, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Только тем, кто признаёт вину.",
                response = "Исповедь в обмен на милость. Строго, но понятно.",
                statDeltas = fixed_array(3, 0, 2, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Отказать.",
                response = "Тогда топор будет говорить последним. И громче всех.",
                statDeltas = fixed_array(-5, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я нашёл старый тайник прежнего короля. Там золото, но оно отмечено печатями старой династии.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Переплавить золото.",
                response = "Старый король станет новой монетой. Иронично и полезно.",
                statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Использовать его тайно.",
                response = "Тайные деньги — лучшие деньги. Пока их не найдут.",
                statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Показать народу и назвать трофеем.",
                response = "Смело. Но некоторые всё ещё любят старые печати.",
                statDeltas = fixed_array(-5, 0, 5, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Почему прежний король его спрятал?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Короли прячут золото по двум причинам: чтобы пережить беду или чтобы сбежать от неё. Покойный не успел ни того, ни другого.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Переплавить всё.",
                response = "Прекрасно. У золота нет памяти после плавильни.",
                statDeltas = fixed_array(0, 0, 0, 25, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить часть как резерв.",
                response = "Мудро. Тайный сундук иногда вернее совета.",
                statDeltas = fixed_array(0, 0, 0, 15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Раздать часть народу.",
                response = "Щедрость из чужого тайника. Народ не станет уточнять.",
                statDeltas = fixed_array(10, 0, 0, 8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди едят всё, что им дают. Вчерашняя бесплатная похлёбка была слишком жирной для голодных желудков. Теперь половина улицы болеет.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Организовать правильные кухни.",
                response = "Накормить — мало. Нужно ещё не убить добротой.",
                statDeltas = fixed_array(20, 0, 0, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Прекратить раздачи еды.",
                response = "Вы остановите боль в животах. И вернёте голод.",
                statDeltas = fixed_array(-10, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Поручить рецепты поварам.",
                response = "Пусть готовят для больных, а не для пира.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Еда может вредить голодным?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "После долгого голода желудок похож на раненого. Если бросить в него пир, он не благодарит — он сдаётся.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Создать лечебные кухни.",
                response = "Это спасёт больше, чем кажется. Тихо, без фанфар.",
                statDeltas = fixed_array(22, 0, 0, -10, 0, 0, 0, -8, 0)
            ),
            DialogueChoice(
                choiceText = "Раздавать только жидкую похлёбку.",
                response = "Хорошо. Простая еда — лучшее лекарство для пустого живота.",
                statDeltas = fixed_array(12, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Не менять ничего.",
                response = "Тогда зовите меня не к кухне, а к мёртвым.",
                statDeltas = fixed_array(-12, 0, 0, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Если заменить мясо репой, город протянет дольше. Но солдаты уже называют это ‘помоями мира’.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Перевести всех на репу.",
                response = "Все будут недовольны одинаково. В этом есть почти справедливость.",
                statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Только бедных кормить репой.",
                response = "Бедные снова получат самую дешёвую часть милости.",
                statDeltas = fixed_array(-5, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Дворец тоже ест репу.",
                response = "Вот это я хочу увидеть: придворные против корнеплода.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 8, 0)
            ),
            DialogueChoice(
                choiceText = "Можно сделать репу вкусной?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Можно, если добавить масло, соль и надежду. Масла мало, соль дорогая, надежду пусть поставляет трон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Добавить соль из запасов.",
                response = "Соль спасёт вкус. Немного честь тоже.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Сделать репу общей пищей.",
                response = "Тогда никто не скажет, что голод имеет сословие.",
                statDeltas = fixed_array(5, 0, -10, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить мясо армии.",
                response = "Солдаты будут довольны. Репа — нет, её снова унизили.",
                statDeltas = fixed_array(0, 0, 8, 0, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Один стражник пропустил ночью купеческую телегу без досмотра. Говорит, что взял только две монеты.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казнить стражника.",
                response = "Стража поймёт цену двух монет.",
                statDeltas = fixed_array(-8, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Высечь и оставить служить.",
                response = "Боль учит быстрее приказа.",
                statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Уволить и оштрафовать.",
                response = "Мягко. Но не бессмысленно.",
                statDeltas = fixed_array(0, 0, -3, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Что было в телеге?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Он клянётся, что не знает. А я не люблю клятвы людей, которые продают глаза за две монеты.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Найти телегу и конфисковать груз.",
                response = "Поймаем след, пока колёса ещё свежие.",
                statDeltas = fixed_array(0, 0, 3, -3, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Допросить стражника жёстко.",
                response = "Он вспомнит. Или придумает. Придётся различать.",
                statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Поставить двойной досмотр.",
                response = "Дороже. Но ворота наконец станут воротами.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Люди боятся не наказаний, а наказаний без суда. Даже узурпатору нужен закон.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Создать временный суд.",
                response = "Закон — медленный щит. Но щит всё же.",
                statDeltas = fixed_array(15, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Судить только важных обвиняемых.",
                response = "Не справедливость, но её тень. Иногда тень лучше темноты.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Королевский приказ выше суда.",
                response = "Так говорят сильные короли. И те, кто недолго ими остаётся.",
                statDeltas = fixed_array(-15, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Закон поможет удержать трон?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Меч удержит дверь сегодня. Закон убедит людей завтра не искать другую дверь.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Создать временный суд.",
                response = "Мудро. Страх подчиняет, закон привязывает.",
                statDeltas = fixed_array(15, 0, 0, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Назначить быстрые военные суды.",
                response = "Быстро. Опасно. Но хотя бы не совсем без формы.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не тратить время на закон.",
                response = "Тогда править будет не закон, а ближайшая рука с мечом.",
                statDeltas = fixed_array(-12, 0, 8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Мои склады полны. Но дорога к ним опасна. Дайте мне солдат — получите хлеб.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать солдат.",
                response = "Прекрасно. Ваши мечи приведут мой хлеб к вашим голодным.",
                statDeltas = fixed_array(0, 0, -8, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Заплатить частной охране.",
                response = "Дорого, но без лишнего военного сапога на торговой дороге.",
                statDeltas = fixed_array(0, 0, 0, -12, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Забрать склады силой.",
                response = "Вы получите зерно. И купцов, которые научатся прятать лучше.",
                statDeltas = fixed_array(-10, 0, 5, 0, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(
                choiceText = "Ты угрожаешь короне голодом?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Я? Никогда. Голод угрожает сам. Я лишь стою рядом с ключом от амбара.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Дать солдат и забрать часть зерна налогом.",
                response = "Жёстко, но умно. Мне это неприятно, значит, вы учитесь.",
                statDeltas = fixed_array(0, 0, -8, 3, 0, 0, 0, 22, 0)
            ),
            DialogueChoice(
                choiceText = "Купить зерно честно.",
                response = "Честность приятна. Особенно когда оплачена полностью.",
                statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться от сделки.",
                response = "Тогда пусть ваши амбары докажут, что они полнее моей гордости.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После каждой казни толпа становится тише. Хотите сделать казни еженедельными?",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Да, страх нужен.",
                response = "Тогда я подготовлю площадь. И людей, которые потом её отмоют.",
                statDeltas = fixed_array(-20, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Только для доказанных предателей.",
                response = "Умеренный ужас. Его легче проглотить.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Нет. Страх быстро гниёт.",
                response = "Редкий приказ, от которого моя работа уменьшается.",
                statDeltas = fixed_array(10, 0, -5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Толпа правда становится тише?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Тише — да. Вернее — нет. Молчание не всегда верность. Иногда это просто стиснутые зубы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Казни только по большим делам.",
                response = "Топор будет редким. Оттого, возможно, страшнее.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заменить часть казней каторгой.",
                response = "Кирка вместо петли. У неё тоже есть воспитательный звук.",
                statDeltas = fixed_array(0, 0, -5, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Продолжать публичные казни.",
                response = "Площадь будет молчать. Но не спать.",
                statDeltas = fixed_array(-20, 0, 15, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MORWEN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В монастырь принесли солдат с жаром. Если мы примем их, заболеют бедные. Если нет — умрут защитники трона.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принять солдат.",
                response = "Мы примем их. И будем молиться, чтобы болезнь не пошла дальше.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить места для бедных.",
                response = "Бедные выживут. Солдаты, возможно, не простят.",
                statDeltas = fixed_array(10, 0, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разделить монастырь перегородками.",
                response = "Деревянная стена лучше каменного сердца.",
                statDeltas = fixed_array(3, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Что говорит твоя совесть?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Она говорит, что у солдата и нищего жар одинаковый. Но койка у нас одна.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Принимать самых тяжёлых, независимо от звания.",
                response = "Это похоже на справедливость. Она редко удобна.",
                statDeltas = fixed_array(8, 0, 3, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Солдаты важнее.",
                response = "Я подчинюсь. Но болезнь не уважает мундиры.",
                statDeltas = fixed_array(-8, 0, 10, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Бедные важнее.",
                response = "Тогда я буду молиться и за бедных, и за вашу армию.",
                statDeltas = fixed_array(10, 0, -8, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_ARVEL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "В городе пошли странные отравления. Я могу сделать противоядие. Но редкие травы стоят дорого.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить травы.",
                response = "Жизнь снова победила кошелёк. Какая редкость.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Купить малый запас.",
                response = "Малый запас спасает малую часть беды.",
                statDeltas = fixed_array(8, 0, 0, -6, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Обвинить тебя в создании яда.",
                response = "Удобно. Когда не знаешь, кто виноват, хватай того, кто знает травы.",
                statDeltas = fixed_array(-5, 0, 5, 0, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Откуда ты знаешь, что это яд?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что люди не синеют от плохих мыслей. Хотя, признаю, ваши подданные стараются.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Купить полный запас.",
                response = "Хорошо. Смерть сегодня заработает меньше.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Купить малый запас и искать источник.",
                response = "Разумно. Лечить воду, не найдя колодец, глупо.",
                statDeltas = fixed_array(12, 0, 0, -8, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Заставить продать дешевле.",
                response = "Королевская скидка всегда пахнет железом.",
                statDeltas = fixed_array(12, 0, 3, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SIVIL
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Объявите день поста. Люди будут есть меньше и думать о душе.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Объявить общий пост.",
                response = "Город смирится. Хотя голодные смиряются хуже сытых.",
                statDeltas = fixed_array(-5, 0, 0, 0, 0, 0, 0, 15, 0)
            ),
            DialogueChoice(
                choiceText = "Пост только для дворца.",
                response = "Хороший пример сверху. Народ любит, когда дворец тоже терпит.",
                statDeltas = fixed_array(5, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Пост для армии тоже.",
                response = "Сильное смирение. Солдаты назовут его иначе.",
                statDeltas = fixed_array(0, 0, -15, 0, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Голодные и так постятся.",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Именно поэтому пост должен начать дворец. Когда сытый отказывается от мяса, голодный хотя бы видит, что его страдание заметили.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Пост только для дворца.",
                response = "Смирение наверху иногда лечит злость внизу.",
                statDeltas = fixed_array(8, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Общий пост с раздачей похлёбки бедным.",
                response = "Мудро. Пустота в желудке не должна быть смертным приговором.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отказаться от поста.",
                response = "Тогда пусть дворец хотя бы не пирует слишком громко.",
                statDeltas = fixed_array(3, 0, 0, 0, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MALRIK
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Горожане готовы платить за патрули в своих районах. По сути, безопасность станет услугой.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Ввести платные патрули.",
                response = "Безопасность наконец начнёт окупаться.",
                statDeltas = fixed_array(-10, 0, 8, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Патрули бесплатны.",
                response = "Благородно. Убыточно. Очень по-королевски.",
                statDeltas = fixed_array(10, 0, 5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Патрули только в опасных районах.",
                response = "Разумный расход. Я почти доволен.",
                statDeltas = fixed_array(5, 0, 5, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "А бедные районы?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Бедные районы заплатят меньше. Или не заплатят вовсе. Тогда они получат меньше безопасности. Математика жестока, но честна.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Богатые платят за себя и бедных.",
                response = "Прекрасно. Налог, который можно назвать милосердием.",
                statDeltas = fixed_array(8, 0, 8, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Кто платит, тот получает патруль.",
                response = "Чистая система. Грязные последствия.",
                statDeltas = fixed_array(-10, 0, 8, 20, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Патрули бесплатны для всех.",
                response = "Казна вздохнёт с болью. Город — с облегчением.",
                statDeltas = fixed_array(10, 0, 5, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_BORVIN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ночью сгорела аптека. Люди говорят, что это кара богов, но я вижу следы масла.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Расследовать поджог.",
                response = "Спасибо. Огонь редко загорается сам там, где есть выгода.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Восстановить аптеку за счёт казны.",
                response = "Люди получат лекарства раньше, чем слухи станут ядом.",
                statDeltas = fixed_array(20, 0, 0, -15, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Передать дело страже.",
                response = "Пусть ищут. Только бы не нашли удобного бедняка.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Кому выгоден поджог?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Тому, кто продаёт лекарства дороже. Или тому, кто хочет, чтобы больные шли не к лекарю, а к алтарю.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Расследовать торговцев лекарствами.",
                response = "Ищите деньги. Они часто стоят рядом с огнём.",
                statDeltas = fixed_array(8, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Восстановить аптеку и поставить охрану.",
                response = "Теперь больные получат дверь, которая не сгорит без свидетелей.",
                statDeltas = fixed_array(22, 0, 3, -18, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не раздувать дело.",
                response = "Тогда следующий огонь будет смелее.",
                statDeltas = fixed_array(-10, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_MIRA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Заключённых почти не кормят. Если они умрут в камерах, Морвену работы меньше, но вонь дойдёт до тронного зала.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Кормить заключённых нормально.",
                response = "Не милость, так санитария. Иногда они похожи.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Кормить только тех, кто работает.",
                response = "Пища за труд. Тюремная справедливость.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Не тратить еду на предателей.",
                response = "Тогда камеры скоро начнут готовить свой собственный запах.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Они правда умирают от голода?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Пока нет. Пока они только грызут корки, стены и друг друга глазами. Но ещё пару дней — и начнут пахнуть как проблема.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Кормить всех заключённых.",
                response = "Хорошо. Мёртвые враги опасны меньше, но пахнут хуже.",
                statDeltas = fixed_array(10, 0, 0, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Отправить заключённых на работы за еду.",
                response = "Пусть хотя бы роют не себе могилы.",
                statDeltas = fixed_array(-3, 0, 0, 10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Пусть терпят.",
                response = "Терпение не кормит. Зато разлагается медленно.",
                statDeltas = fixed_array(-15, 0, 0, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_GROMM
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Через ночные ворота идут телеги без печатей. Если закрыть ворота, город станет безопаснее, но еда задержится.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Закрыть ворота ночью.",
                response = "Безопаснее. Но утро встретит нас с очередью голодных телег.",
                statDeltas = fixed_array(3, 0, 8, 0, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить ворота открытыми.",
                response = "Еда войдёт. Надеюсь, не вместе с ножами.",
                statDeltas = fixed_array(0, 0, -8, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(
                choiceText = "Проверять каждую телегу.",
                response = "Медленно, но надёжно. Ворота станут глазами.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Что чаще везут ночью — еду или опасность?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "И то, и другое. Беда в том, что мешки с зерном и мешки с кинжалами выглядят одинаково, пока их не развязать.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Проверять каждую телегу.",
                response = "Тогда мы будем медленными, но не слепыми.",
                statDeltas = fixed_array(0, 0, 5, -5, 0, 0, 0, 3, 0)
            ),
            DialogueChoice(
                choiceText = "Ввести ночную пошлину и досмотр.",
                response = "Хорошо. Даже опасность будет платить за вход.",
                statDeltas = fixed_array(0, 0, 3, 8, 0, 0, 0, -3, 0)
            ),
            DialogueChoice(
                choiceText = "Оставить ворота открытыми.",
                response = "Я поставлю лучших людей. И буду плохо спать.",
                statDeltas = fixed_array(0, 0, -8, 0, 0, 0, 0, 10, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_VARN
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "После крови и страха люди нуждаются в празднике. Но праздник стоит золота, еды и спокойствия.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Устроить большой праздник.",
                response = "Город улыбнётся. Пусть даже с пустеющими амбарами.",
                statDeltas = fixed_array(20, 0, 0, -20, 0, 0, 0, -15, 0)
            ),
            DialogueChoice(
                choiceText = "Устроить скромный праздник.",
                response = "Скромная радость иногда крепче роскошной.",
                statDeltas = fixed_array(10, 0, 0, -8, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Запретить праздники до стабильности.",
                response = "Порядок сохранён. Настроение — нет.",
                statDeltas = fixed_array(-10, 0, 5, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Разве сейчас время для праздника?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Именно сейчас. Когда люди долго слышат только приказы и похоронные колокола, они начинают ждать не короля, а конца.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Скромный праздник для всего города.",
                response = "Хорошо. Достаточно света, чтобы ночь не казалась вечной.",
                statDeltas = fixed_array(10, 0, 0, -8, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Праздник с раздачей хлеба.",
                response = "Дорого. Но народ запомнит вкус этого дня.",
                statDeltas = fixed_array(25, 0, 0, -20, 0, 0, 0, -20, 0)
            ),
            DialogueChoice(
                choiceText = "Отложить праздник.",
                response = "Тогда радость подождёт. Надеюсь, она не уйдёт совсем.",
                statDeltas = fixed_array(-8, 0, 0, 5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Я могу дать казне золото. Взамен хочу право собирать пошлины на южном мосту. Это выгодно вам сейчас и мне всегда.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отдать мост на месяц.",
                response = "Прекрасно. Мост — это не камень. Это река монет.",
                statDeltas = fixed_array(-8, 0, 0, 25, 0, 0, 0, 5, 0)
            ),
            DialogueChoice(
                choiceText = "Отдать мост на неделю.",
                response = "Неделя — короткий повод стать богатой. Я справлюсь.",
                statDeltas = fixed_array(0, 0, 0, 10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Не отдавать мост купцам.",
                response = "Корона оставляет себе камни. Я найду другой путь к золоту.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Почему тебе нужен именно мост?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(
            prompt = "Потому что через мост проходит всё: зерно, соль, слухи, должники и люди, которые думают, что умеют прятать деньги.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Отдать мост на неделю и поставить смотрителя.",
                response = "Вы даёте мне дверь, но оставляете глаз у замка. Неплохо.",
                statDeltas = fixed_array(-3, 0, 0, 12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Потребовать зерно вместо золота.",
                response = "Хлеб вместо монет. В голодный месяц это почти одно и то же.",
                statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Мост останется короне.",
                response = "Тогда пусть корона сама считает каждую телегу. Это скучная работа.",
                statDeltas = fixed_array(5, 0, 0, -5, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_SELENA
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваши первые решения уже стоят королевству крови, золота, хлеба и доверия. Теперь нужно выбрать, какую цену мы готовы платить дальше.",
            choiceCount = 5,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Власть держится на армии.",
                response = "Меч удержит трон. Но меч не умеет сеять хлеб.",
                statDeltas = fixed_array(-10, 0, 25, -10, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Власть держится на хлебе.",
                response = "Голодный народ опасен. Сытый народ хотя бы слушает.",
                statDeltas = fixed_array(5, 0, 0, -15, 0, 0, 0, 25, 0)
            ),
            DialogueChoice(
                choiceText = "Власть держится на казне.",
                response = "Золото даст нам время. Но время, купленное страданием, часто заканчивается криком.",
                statDeltas = fixed_array(-10, 0, 0, 25, 0, 0, 0, -10, 0)
            ),
            DialogueChoice(
                choiceText = "Власть держится на живых людях.",
                response = "Живые подданные ещё могут простить короля. Мёртвые — только преследовать его имя.",
                statDeltas = fixed_array(25, 0, 0, -15, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "А если попытаться удержать всё?",
                response = "",
                statDeltas = NO_STAT_CHANGE,
                nextNodeIdx = 1
            )
            )
        ),
        DialogueNode(
            prompt = "Можно. Но королевства гибнут не только от плохих решений. Иногда они гибнут от хороших решений, принятых слишком поздно.",
            choiceCount = 4,
            choices = fixed_array(
            DialogueChoice(
                choiceText = "Распределить силы поровну.",
                response = "Осторожный выбор. Не великий, не позорный. Иногда именно такие переживают зиму.",
                statDeltas = fixed_array(7, 0, 7, 7, 0, 0, 0, 7, 0)
            ),
            DialogueChoice(
                choiceText = "Нет, сначала армию.",
                response = "Тогда пусть солдаты помнят, что защищают королевство, а не только вашу дверь.",
                statDeltas = fixed_array(0, 0, 20, -10, 0, 0, 0, -5, 0)
            ),
            DialogueChoice(
                choiceText = "Нет, сначала хлеб.",
                response = "Хлеб — самый тихий союзник короля. Пока он есть.",
                statDeltas = fixed_array(5, 0, 0, -12, 0, 0, 0, 20, 0)
            ),
            DialogueChoice(
                choiceText = "Нет, сначала здоровье жителей.",
                response = "Вы выбрали жизнь. Теперь нужно сделать так, чтобы живым было чем жить.",
                statDeltas = fixed_array(20, 0, 0, -12, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )
        ),
        DialogueNode(),
        DialogueNode()
        ),
        characterIdx = CHAR_EDRIC
    )
)

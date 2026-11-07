require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
module encounters_succession_ru public

let public allEncountersRuSuccession : Encounter[POOL_SUCCESSION_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, церковь требует обряда преемственности — назовите наследника, иначе они объявят ваше правление временным в литургии.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Назвать верного генерала наследником.", response = "Сталь наследует. Родословные кричат ересь.", statDeltas = fixed_array(-8, 10, 15, 0, 0, 5, -10, 0, 12)),
            DialogueChoice(choiceText = "Отказаться называть наследника", response = "Вызов. Шёпот о наследнике отращивает зубы.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, -8)),
            DialogueChoice(choiceText = "Тихо усыновить дальнего кузена.", response = "Наследник на бумаге. Хрупкий мир.", statDeltas = fixed_array(0, 5, 0, -10, 0, 5, 12, 0, 8)),
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
            prompt = "Ваше Величество, северные принцы спрашивают, кто унаследует, если вы погибнете в весеннем походе. Им нужен ответ — прежде чем они решат, кто им друг, а кто враг.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Обещать, что трон перейдёт по голосованию совета.", response = "Институциональный ответ. Слабые короли его любят.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 8, 0, 10)),
            DialogueChoice(choiceText = "Заявить, что наследник мне не нужен", response = "Прямая угроза. Война становится вероятнее.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, -6)),
            DialogueChoice(choiceText = "Предложить родственный союз с их родословной.", response = "Дипломатический наследник. Дорогостоящее завтра.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 10)),
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
            prompt = "Ваше Величество, законники знают три пути к трону: кровь, избрание и завоевание. Вы прошли только третий. Династии нужен один из двух других.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Добиться выборов великими домами.", response = "Право править куплено голосами. Эшфорд улыбается.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Добиваться крови", response = "Отчаянная геральдика. Преемственность, возможно, стабилизируется.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 8)),
            DialogueChoice(choiceText = "Держаться завоевания", response = "Честная жестокость. Будущее неопределённо.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 2)),
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
        characterIdx = CHAR_PROPHET,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, пророк говорит без приглашения: «Когда узурпатор не называет наследника, королевство называет троих».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выслушать его наедине.", response = "Предзнаменование принято. Двор нервничает.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 2)),
            DialogueChoice(choiceText = "Арестовать его за угрозу преемственности.", response = "Молчание куплено. Слухи дешевле.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, -2)),
            DialogueChoice(choiceText = "Публично назвать наследника, чтобы опровергнуть его.", response = "Театральный ответ. Стабильность — или цель обозначена.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, 10)),
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
        characterIdx = CHAR_WIZARD,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, мои карты показывают пустоту в доме наследования. Я могу её заполнить: в провинции есть ребёнок, рождённый под яркой звездой. Усыновите звёздное дитя — и народ назовёт это судьбой.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Усыновить ребёнка звезды.", response = "Миф становится политикой. Крестьяне ликуют.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Изгнать астрологию из государственных дел.", response = "Рациональная корона. Суеверные волнения.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, -2)),
            DialogueChoice(choiceText = "Заплатить только за частный гороскоп.", response = "Тайны на небесах. Утечки на земле.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 0)),
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
            prompt = "Ваше Величество, человек в маске вернулся — на этот раз не ради совета. Он спрашивает, что вы оставите после себя, когда туман над вашим правлением рассеется.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Обещать реформы", response = "Надежда продана. Враги устанавливают цену.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 8)),
            DialogueChoice(choiceText = "Обещать кровь", response = "Жёсткий ответ. Стабильность через страх.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 4)),
            DialogueChoice(choiceText = "Не обещать ничего", response = "Тайна поддерживается. Тревога распространяется.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, -6)),
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
            prompt = "Ваше Величество, мой дом требует места в порядке наследования. В конце концов, это мы снесли золотое яйцо, которое наполняет вашу казну. Спросите Борвина. Хотя нет, не спрашивайте Борвина.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать церемониальный титул", response = "Абсурд покупает мир. Хронисты плачут.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 0)),
            DialogueChoice(choiceText = "Выставить его из двора.", response = "Смех и опасность. Он может вернуться злее.", statDeltas = fixed_array(-2, 0, 3, 0, 0, -3, -5, 0, 0)),
            DialogueChoice(choiceText = "Назначить его регентом по птичьим счетам.", response = "Шутка становится должностью. Удивительно верная птица.", statDeltas = fixed_array(5, 0, 0, 8, 0, 8, 3, 5, 0)),
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
            prompt = "Ваше Величество, я опубликую вашу родословную таблицу, если вы сами не одобрите главу. У меня три черновика: кровь, клинок и сделка. Выберите один — королевство перепишет его в закон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Одобрить главу о крови.", response = "Нарратив династии. Соперники мобилизуются.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 10, 0, 12)),
            DialogueChoice(choiceText = "Одобрить главу о клинке.", response = "Честная история узурпатора. Честные волнения.", statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, -5, 0, 4)),
            DialogueChoice(choiceText = "Одобрить главу о сделке.", response = "Выборная фикция. Дома красуются.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 12, 0, 8)),
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
        characterIdx = CHAR_TALEN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, я продаю слух, будто вы назвали тайного наследника. На этой неделе он очень в ходу. Купите его у меня, позвольте разнести его для вас — или попробуйте остановить.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выкупить и заглушить слух.", response = "Тихие монеты. Громкие вопросы остаются.", statDeltas = fixed_array(0, 0, 0, -15, 0, 5, 0, 0, 2)),
            DialogueChoice(choiceText = "Распустить слух", response = "Ложный наследник защищает истинный трон. Хрупкая уловка.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 5, 0, 4)),
            DialogueChoice(choiceText = "Публично опровергнуть и выследить источник.", response = "Хаос сдержан. Двор потеет.", statDeltas = fixed_array(0, 0, 5, 0, 0, 6, 0, 0, 6)),
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
            prompt = "Ваше Величество, мои князья признают вашего наследника, если вы признаете права нашего князя на приграничное герцогство после вашей смерти. Обещание о будущем, которого никто из нас не увидит.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять сделку", response = "Будущее продано ради нынешнего покоя.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, -5, 0, 6)),
            DialogueChoice(choiceText = "Отказать — земли за обещания не отдаю", response = "Гордость цела. Северные ножи точатся.", statDeltas = fixed_array(0, 0, 10, 0, 0, 5, 3, 0, -4)),
            DialogueChoice(choiceText = "Предложить вместо этого торговые права", response = "Дипломатическая ничья. Обе стороны ворчат.", statDeltas = fixed_array(3, 0, 5, 0, 0, 5, 3, 0, 5)),
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
            prompt = "Ваше Величество, в склепе собора хранится завещание Эдвина. Со дня переворота его никто не читал. В нём может быть назван наследник. А может — проклятие вам. Вскрыть его, прочесть наедине — или сжечь, не открывая.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Вскрыть завещание публично.", response = "Ритуал истины. Возможен хаос преемственности.", statDeltas = fixed_array(0, 12, 0, 0, 0, 0, -8, 0, 6)),
            DialogueChoice(choiceText = "Прочитать в тайне, затем решать.", response = "Знание — рычаг. Подозрения растут.", statDeltas = fixed_array(0, 5, 0, 0, 0, 5, 0, 0, 4)),
            DialogueChoice(choiceText = "Сжечь, не вскрывая.", response = "Мир незнания. Бумаги достались аду.", statDeltas = fixed_array(0, -10, 5, 0, 0, -5, 5, 0, -4)),
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
            prompt = "Ваше Величество, бедняки в моей очереди за похлёбкой молятся о «имени после короля». Они боятся того, что будет с ними, если вы умрёте. Дайте им имя — или дайте им хлеб.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Объявить наследника публично.", response = "Имя дано. Цель обозначена.", statDeltas = fixed_array(8, 5, 0, 0, 0, 8, 0, -5, 10)),
            DialogueChoice(choiceText = "Объявить о зерне вместо наследников.", response = "Хлеб сейчас. Преемственность потом.", statDeltas = fixed_array(12, 0, 0, -12, 0, 5, 0, 15, 5)),
            DialogueChoice(choiceText = "Объявить и то и другое", response = "Великий жест. Дорогостоящая вера.", statDeltas = fixed_array(10, 5, 0, -18, 0, 10, 5, 10, 8)),
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
            prompt = "Ваше Величество, я хочу, чтобы закон о наследовании отдавал предпочтение генералам. Знать хочет крови. Церковь — обрядов. А вы, подозреваю, хотите выспаться. Выберите одну статью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Военная статья о преемственности.", response = "Армия довольна. Элита в ярости.", statDeltas = fixed_array(-5, 0, 15, 0, 0, 5, -12, 0, 12)),
            DialogueChoice(choiceText = "Статья о дворянской крови.", response = "Дома довольны. Солдаты насторожены.", statDeltas = fixed_array(0, 0, -5, 0, 0, 0, 15, 0, 10)),
            DialogueChoice(choiceText = "Церковная статья об обряде.", response = "Алтарь скрепляет преемственность. Корона делит власть.", statDeltas = fixed_array(0, 15, 0, 0, 0, 5, 5, 0, 8)),
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
            prompt = "Ваше Величество, предлагаю налог на пустые наследственные титулы: пусть лорды платят за то, чтобы держать на бумаге воображаемых наследников. Они выдумывают кузенов, чтобы захватывать землю. Пусть кузены платят.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять налог.", response = "Казна смеётся. Знать замышляет.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 0)),
            DialogueChoice(choiceText = "Отклонить налог", response = "Уважение куплено. Золото потеряно.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 2)),
            DialogueChoice(choiceText = "Облагать налогом только иностранных претендентов.", response = "Узкая политика. Ингвар раздражён.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, 3, 0, 4)),
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
            prompt = "Ваше Величество, я лечу лорда в лихорадке, который всё время бормочет имя племянника Эдвина. Если он выживет — заговорит. Если я перестану его лечить, лихорадка договорит за него.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Спасти его", response = "Жизнь куплена. Слух о преемственности окреп.", statDeltas = fixed_array(0, 0, 0, -5, 10, 5, 0, 0, -4)),
            DialogueChoice(choiceText = "Прекратить лечение", response = "Я подчинюсь. Но не забуду. Шёпот назовёт это убийством.", statDeltas = fixed_array(-8, 0, 0, 0, -5, -5, 0, 0, 2)),
            DialogueChoice(choiceText = "Спасти, но изолировать от двора.", response = "Средний путь. Тайны в спальне больного.", statDeltas = fixed_array(0, 0, 0, -8, 8, 6, 0, 0, 2)),
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
            prompt = "Ваше Величество, я нашёл в казармах листовки о наследовании — кому править после вас, а кому нет. Повесить печатников, сжечь листовки — или ответить своими.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить печатников.", response = "Страх останавливает прессы. Возможны мученики.", statDeltas = fixed_array(-8, 0, 8, 0, 0, -4, 0, 0, 2)),
            DialogueChoice(choiceText = "Сжечь только памфлеты.", response = "Мягкая цензура. Идеи тлеют.", statDeltas = fixed_array(0, 0, 3, 0, 0, 2, 0, 0, 2)),
            DialogueChoice(choiceText = "Опубликовать королевский памфлет в ответ.", response = "Война слов. Преемственность обсуждается открыто.", statDeltas = fixed_array(5, 0, 0, -10, 0, 8, 5, 0, 6)),
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
            prompt = "Ваше Величество, я могу сделать вашу линию законной через кровь моего дома — если в законе о наследовании мой племянник будет назван регентом на случай, если вы умрёте до совершеннолетия наследника.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять регентский торг.", response = "Преемственность привязана к Эшфорду. Мир дорого стоит.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 18, 0, 6)),
            DialogueChoice(choiceText = "Отказать в регентстве", response = "Независимость сохранена. Восточная угроза возвращается.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, -10, 0, -4)),
            DialogueChoice(choiceText = "Предложить вместо этого место в регентском совете", response = "Полусоюз. Полуоскорбление.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 10, 0, 3)),
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
            prompt = "Ваше Величество, если завтра вы упадёте с лошади, закон не говорит, кто будет править. Я составил проект регентского совета: пять человек, которые удержат королевство, пока не выберут наследника. Пятерых выбираете вы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пятеро великих лордов", response = "Дома чувствуют себя в безопасности. Если вы умрёте, они будут спорить годами.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 10, 0, 6)),
            DialogueChoice(choiceText = "Мои самые верные советники", response = "Эдрик, Рудольф, Борвин, Мира, Малрик. Деловой совет — и ревнивая знать.", statDeltas = fixed_array(0, 2, 3, 0, 0, 6, -6, 0, 10)),
            DialogueChoice(choiceText = "Никакого совета — я не умру", response = "Смелый план. Королевство молится, чтобы вы были правы.", statDeltas = fixed_array(0, 0, 0, 0, 0, -3, 0, 0, -10)),
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
            prompt = "Ваше Величество, кухонная девушка говорит, что носит вашего ребёнка. Может, лжёт. А может, и нет. Двор уже знает. Так или иначе, кто-нибудь этим воспользуется.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Взять её под защиту и ждать родов", response = "Честно и опасно. Возможный наследник в крыле для слуг.", statDeltas = fixed_array(4, -3, 0, -4, 0, 4, -4, 0, 8)),
            DialogueChoice(choiceText = "Отослать её с золотом", response = "Пока тихо. Ребёнок, если он есть, вырастет далеко — и услышит рассказы.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 2, 0, -4)),
            DialogueChoice(choiceText = "Публично назвать её лгуньей", response = "Её опозорят. Если она сказала правду — опозорены и вы.", statDeltas = fixed_array(-6, 2, 0, 0, 0, -4, 3, 0, -6)),
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
            prompt = "Ваше Величество, моей племяннице двадцать, она умна и не замужем. Женитесь на ней — и восток станет вашим наследством. У ваших детей будет кровь Эшфордов — и друзья Эшфордов.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять брак", response = "Свадьба весной. Восток ваш. Как и мнение Эшфорд по любому поводу.", statDeltas = fixed_array(3, 3, 0, -10, 0, 0, 12, 0, 15)),
            DialogueChoice(choiceText = "Попросить время, чтобы узнать её", response = "Эшфорд удивлена. Король, который хочет узнать невесту. Романтично — или умно.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 3, 0, 3)),
            DialogueChoice(choiceText = "Отказать", response = "Восток остывает. Ваш наследник, если будет, придёт откуда-то ещё.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -10, 0, -6)),
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
            prompt = "Ваше Величество, наследника короля благословляют при рождении или называют перед Богом. У вас нет ни ребёнка, ни названного наследника. Церковь предлагает молиться о нём — публично, каждое воскресенье.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять воскресные молитвы", response = "Каждое воскресенье королевству мягко напоминают, что у вас нет наследника.", statDeltas = fixed_array(2, 8, 0, 0, 0, 0, 0, 0, 4)),
            DialogueChoice(choiceText = "Вместо этого назвать наследника перед Богом", response = "Торжественный обряд. Имя в книге собора. И мишень.", statDeltas = fixed_array(0, 10, 0, -6, 0, 0, 3, 0, 12)),
            DialogueChoice(choiceText = "Мой наследник — не дело Церкви", response = "Малрик это запишет. Он записывает всё.", statDeltas = fixed_array(0, -8, 0, 0, 0, 0, 0, 0, -4)),
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
            prompt = "Ваше Величество, у каждого костра солдаты задают один вопрос: если король падёт, за кем нам идти? Мне нужен ответ, который я смогу им дать, — имя или закон.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Рудольф командует, пока не выберут наследника", response = "Армия спокойна. Знать видит генерала в шаге от трона.", statDeltas = fixed_array(0, 0, 10, 0, 0, 0, -8, 0, 6)),
            DialogueChoice(choiceText = "Подчиняться закону о регентском совете", response = "Закон любить труднее, чем имя. Зато его труднее убить.", statDeltas = fixed_array(0, 0, 4, 0, 0, 3, 3, 0, 8)),
            DialogueChoice(choiceText = "Сказать им следовать короне и не спрашивать", response = "Они перестанут спрашивать вас. И продолжат спрашивать друг друга.", statDeltas = fixed_array(0, 0, -4, 0, 0, -4, 0, 0, -6)),
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
            prompt = "Ваше Величество, старые короли вырезали имя наследника на самом троне ещё до коронации. На вашем троне до сих пор имя сына Эдвина — мальчик умер от лихорадки десять лет назад. Соскоблить его?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Соскоблить и оставить пустым", response = "Пустое место на троне. Все на него смотрят.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -3)),
            DialogueChoice(choiceText = "Оставить имя мальчика в его память", response = "Добрый жест. Сторонники Эдвина тронуты. Пустое будущее остаётся пустым.", statDeltas = fixed_array(3, 3, 0, 0, 0, 6, 3, 0, -2)),
            DialogueChoice(choiceText = "Вырезать новое имя — избранного наследника", response = "Камень не лжёт. Теперь королевство точно знает, кого защищать — и кого убивать.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, 0, 12)),
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
            prompt = "Ваше Величество, южный купеческий князь предлагает вам усыновить его сына как наследника. Вместе с мальчиком — флот, состояние и семья, которая покупает целые города. Ваши лорды подавятся.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Усыновить сына купца", response = "Флот и состояние. И знать, которая никогда его не примет.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -15, 0, 8)),
            DialogueChoice(choiceText = "Вместо этого предложить ему место при дворе", response = "Торговля без крови. Князь соглашается, немного разочарован.", statDeltas = fixed_array(0, 0, 0, 6, 0, 0, -2, 0, 0)),
            DialogueChoice(choiceText = "Отказать — корона не продаётся", response = "Лорды ликуют. Борвин тихо плачет у себя в кабинете.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, -2)),
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
        characterIdx = CHAR_ORM,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, у ветеранов есть обычай: старый солдат без сыновей называет наследником молодого товарища. Говорят, король, взявший корону мечом, мог бы поступить так же.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Назвать наследником молодого офицера", response = "Армия ревёт от восторга. Великие дома бледнеют.", statDeltas = fixed_array(3, 0, 12, 0, 0, 4, -12, 0, 10)),
            DialogueChoice(choiceText = "Почтить обычай, но не для короны", response = "Прекрасная речь о традиции. Наследника нет.", statDeltas = fixed_array(0, 0, 3, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Корона — не солдатский меч", response = "Ветераны кивают. Они хотели, чтобы было иначе.", statDeltas = fixed_array(0, 0, -4, 0, 0, -2, 4, 0, -2)),
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
            prompt = "Ваше Величество, трое при дворе тихо готовятся заявить права на трон, если вы умрёте. У меня есть их имена. Могу назвать, могу продать вам — а могу продать им.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заплатить за имена", response = "Три имени. Одно вас удивит. Одно напугает.", statDeltas = fixed_array(0, 0, 0, -12, 0, 4, 0, 0, 10)),
            DialogueChoice(choiceText = "Арестовать Нокса за измену", response = "Тогда трое претендентов так и не узнают, что их раскрыли. А Нокс надуется в камере.", statDeltas = fixed_array(0, 0, 2, 0, 0, -3, 0, 0, -4)),
            DialogueChoice(choiceText = "Пусть продаёт им — а мы проследим за деньгами", response = "Претенденты платят ни за что и выдают себя. Нокс получает плату дважды.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 6)),
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
            prompt = "Ваше Величество, у сирот в моей обители есть игра: они играют в выборы короля. Вчера они выбрали девочку, которая поделилась хлебом. Дети видят больше, чем лорды.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Навестить сирот и познакомиться с девочкой", response = "По городу разлетается трогательная история. Вы становитесь королём, который слушает детей.", statDeltas = fixed_array(8, 4, 0, 0, 0, 4, 0, 0, 2)),
            DialogueChoice(choiceText = "Оплатить школу при обители", response = "Будущие писцы, будущие лекари, а может, и будущая королева.", statDeltas = fixed_array(4, 3, 0, -8, 2, 0, 0, 0, 4)),
            DialogueChoice(choiceText = "Милая история, не более", response = "Арвель улыбается и возвращается к своей похлёбке.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)),
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
            prompt = "Ваше Величество, у северных князей много дочерей и мало союзников. Брак с севером покончил бы с пограничными войнами на целое поколение. Ваш наследник говорил бы на двух языках.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять северную невесту", response = "Мир на перевале. Ваши лорды боятся северной королевы.", statDeltas = fixed_array(0, -3, 6, 0, 0, 0, -8, 3, 12)),
            DialogueChoice(choiceText = "Предложить вместо себя королевскую кузину", response = "Брак поменьше, мир поменьше. Но всё же мир.", statDeltas = fixed_array(0, 0, 3, -5, 0, 0, 0, 0, 4)),
            DialogueChoice(choiceText = "Отказать", response = "Князья найдут других союзников. Быть может, ваших врагов.", statDeltas = fixed_array(0, 0, -4, 0, 0, 0, 3, 0, -4)),
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
            prompt = "Ваше Величество, когда король умирает без наследника, его земли делят претенденты, а казну разграбляют за неделю. Предлагаю королевский фонд: золото, которое сможет открыть только названный вами наследник.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Создать королевский фонд", response = "Запертый сундук, ради которого стоит защищать наследника.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 0, 0, 12)),
            DialogueChoice(choiceText = "Создать фонд поменьше", response = "Половина золота, половина надёжности. Лучше, чем ничего.", statDeltas = fixed_array(0, 0, 0, -6, 0, 0, 0, 0, 5)),
            DialogueChoice(choiceText = "Казне золото нужно сейчас", response = "Разумно сегодня. Беда завтра — если завтра наступит слишком скоро.", statDeltas = fixed_array(0, 0, 0, 4, 0, 0, 0, 0, -4)),
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
            prompt = "Ваше Величество, я требую назвать меня наследником. Я верен, любим народом и никогда не убивал королей. Может ли другой претендент сказать о себе то же? К тому же я несу яйца. Династиям нужны яйца.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Назвать Гуся «Наследником пира»", response = "Шуточный титул. Народ смеётся, напряжение при дворе немного спадает.", statDeltas = fixed_array(8, 0, 0, 0, 0, 4, -4, 0, 2)),
            DialogueChoice(choiceText = "Отнестись серьёзно и отказать", response = "Гусь низко кланяется и всю ночь гогочет печальную песню.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 2, 0, 0)),
            DialogueChoice(choiceText = "Выгнать его со двора", response = "Народ его любил. Теперь он любит вас чуть меньше.", statDeltas = fixed_array(-6, 0, 0, 0, 0, -3, 4, 0, 0)),
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
        characterIdx = CHAR_OSRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, я нашёл последнее письмо Эдвина — так и не отправленное. В нём назван наследник на случай смерти сына: внук его кузена, тихо живущий учителем на западе. Сам он об этом не знает.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Сжечь письмо", response = "Учитель сохранит свою тихую жизнь. История лишится страницы.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Привезти учителя ко двору и наблюдать", response = "Напуганный человек в позолоченной комнате. Сторонники Эдвина сразу его находят.", statDeltas = fixed_array(0, 0, 0, -4, 0, 4, 0, 0, -6)),
            DialogueChoice(choiceText = "Назвать его наследником — объединить линии Эдвина и мою", response = "Ошеломляющий ход. Сторонники Эдвина плачут от радости. Ваши — в замешательстве.", statDeltas = fixed_array(4, 4, -4, 0, 0, 12, 4, 0, 12)),
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
            prompt = "Ваше Величество, поймали человека, писавшего на стенах дворца «у короля нет наследника». Это правда. Но из такой правды обычно рождается пожар. Что мне с ним делать?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Высечь его прилюдно", response = "Стены чистые. Зато слова теперь в каждой таверне.", statDeltas = fixed_array(-4, 0, 2, 0, 0, 0, 0, 0, -3)),
            DialogueChoice(choiceText = "Отпустить — он написал правду", response = "Король, который не боится правды. Смело — или беспечно.", statDeltas = fixed_array(4, 0, 0, 0, 0, 3, 0, 0, -2)),
            DialogueChoice(choiceText = "Ответить: объявить, что наследник будет назван", response = "Слух умирает. Теперь придётся сдержать обещание.", statDeltas = fixed_array(2, 0, 0, 0, 0, 4, 2, 0, 8)),
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
            prompt = "Ваше Величество, южные дома поддержат любого названного вами наследника — при одном условии: три года наследника растят на юге. Чтобы он узнал наши обычаи, разумеется.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Согласиться", response = "Юг ваш. Ваш наследник станет немного южанином.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 8, 0, 6)),
            DialogueChoice(choiceText = "Один год, а не три", response = "Иветта смеётся и соглашается. Похоже, она с самого начала хотела один.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 4, 0, 4)),
            DialogueChoice(choiceText = "Наследник остаётся при короне", response = "Юг вежливо кивает и прибережёт свою поддержку на потом.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, -6, 0, 0)),
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
            prompt = "Ваше Величество, я стар. Если я умру, двор потеряет единственного человека, который помнит каждый закон, каждый договор и каждую тайну. Я хочу подготовить преемника — но выбрать его должны вы.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Молодой знатный с хорошими манерами", response = "Лощёный и со связями. Забудет половину того, чему я его научу.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 6, 0, 4)),
            DialogueChoice(choiceText = "Толковый писец из казначейства", response = "Из простых, но острый ум. Лордам будет противно слушать его советы.", statDeltas = fixed_array(2, 0, 0, 3, 0, 3, -4, 0, 6)),
            DialogueChoice(choiceText = "Ты будешь жить вечно, Эдрик", response = "Добрые слова. Неправда. Я буду хранить записи в запертом ящике.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, -4)),
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
            prompt = "Ваше Величество, в городе новая песня — «Одинокая корона», о короле без наследника. Она грустная, она прекрасная, и её поют все. Даже ваша стража.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заказать песню повеселее", response = "Весёлая песня о будущем. Люди напевают обе.", statDeltas = fixed_array(2, 0, 0, -4, 0, 2, 0, 0, 2)),
            DialogueChoice(choiceText = "Пусть поют", response = "Грустная песня — безопасная песня. Обычно.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -2)),
            DialogueChoice(choiceText = "Попросить спеть её при дворе, передо мной", response = "Король, который плачет над песней о себе. Город любит его чуть сильнее.", statDeltas = fixed_array(6, 0, 0, 0, 0, 4, 0, 0, 0)),
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
            prompt = "Ваше Величество, на востоке простое правило: наследник — тот, кого умирающий лорд коснётся последним. Звучит глупо. Но это остановило много войн. Может, короне стоит перенять его?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Перенять восточный обычай", response = "Теперь каждый захочет быть поближе к вашей постели. Раэна недовольна.", statDeltas = fixed_array(0, -2, 0, 0, 0, -3, 6, 0, -4)),
            DialogueChoice(choiceText = "Вместо этого написать ясный закон", response = "Чернила вместо прикосновения. Менее романтично, гораздо надёжнее.", statDeltas = fixed_array(0, 0, 0, -3, 0, 2, 2, 0, 10)),
            DialogueChoice(choiceText = "Поблагодарить и ничего не менять", response = "Каспар пожимает плечами. Восток хранит свои обычаи, вы — свою неопределённость.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -2)),
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
        characterIdx = CHAR_PROPHET,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, мне снился ваш наследник. Ребёнок с чернилами на пальцах и грязью на сапогах, смеющийся в пустом тронном зале. Чей это ребёнок, не знаю. Знаю только, что он смеялся.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Искать такого ребёнка по всему королевству", response = "Появятся сотни чумазых, перепачканных чернилами детей. Один из них очень умён.", statDeltas = fixed_array(6, -4, 0, -5, 0, 0, 0, 0, 6)),
            DialogueChoice(choiceText = "Попросить пророка держать сны при себе", response = "Он кивнёт. Но сон уже на рынке.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, 0)),
            DialogueChoice(choiceText = "Сны — не закон", response = "Верно. Но смеющиеся дети — хорошая история.", statDeltas = fixed_array(-2, 2, 0, 0, 0, 0, 0, 0, -2)),
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
            prompt = "Ваше Величество, безземельные говорят: раз у короны нет наследника, пусть она достанется тому, кто лучше всех накормит народ. Опасная мысль. И популярная.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Ответить пиром для бедных", response = "Хлеб сегодня — и мысль немного угаснет. Но идеи трудно закормить насмерть.", statDeltas = fixed_array(10, 0, 0, -8, 0, 4, -2, -8, 2)),
            DialogueChoice(choiceText = "Арестовать тех, кто её распространяет", response = "Тюрьмы наполняются. У идеи появляется мученик.", statDeltas = fixed_array(-8, 0, 3, 0, 0, -4, 4, 0, -2)),
            DialogueChoice(choiceText = "Назвать наследника и прекратить разговоры", response = "Имя закрывает вопрос. Но не голод.", statDeltas = fixed_array(2, 0, 0, 0, 0, 2, 0, 0, 10)),
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
            prompt = "Ваше Величество, если вы назовёте наследника, ему нужна стража. Слишком мала — наследник погибнет. Слишком велика — у наследника появится второй двор. Сколько мечей?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Двенадцать верных стражников", response = "Достаточно, чтобы остановить нож. Мало, чтобы начать войну.", statDeltas = fixed_array(0, 0, 2, -6, 0, 4, 0, 0, 8)),
            DialogueChoice(choiceText = "Целая рота в сто человек", response = "Надёжно — и капитан наследника становится очень важной персоной.", statDeltas = fixed_array(0, 0, 4, -12, 0, -2, 0, 0, 10)),
            DialogueChoice(choiceText = "Никакой стражи — наследника пока нет", response = "Значит, этот разговор был репетицией.", statDeltas = fixed_array(0, 0, 0, 0, 0, 0, 0, 0, -3)),
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
            prompt = "Ваше Величество, гильдии дают в долг королю — но долги умирают вместе с королями. Назовёте наследника — гильдии дадут взаймы на двадцать лет. Не назовёте — только на год.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Назвать наследника перед гильдиями", response = "Займы на двадцать лет. Теперь гильдии очень заботит здоровье вашего наследника.", statDeltas = fixed_array(0, 0, 0, 15, 0, 0, -3, 0, 10)),
            DialogueChoice(choiceText = "Взять займы на год", response = "Короткие займы, высокие проценты. Борвин вздыхает.", statDeltas = fixed_array(0, 0, 0, 5, 0, 0, 0, 0, -2)),
            DialogueChoice(choiceText = "Никаких займов", response = "Ни долгов, ни сделок. Гильдии подождут.", statDeltas = fixed_array(0, 0, 0, -3, 0, 0, 0, 0, 0)),
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

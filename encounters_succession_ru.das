require engine.core
require constants
require dialogue_types

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
            DialogueChoice(choiceText = "Отказать", response = "Вызов. Шёпот о преемственности обрастает зубами.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, 15)),
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
            DialogueChoice(choiceText = "Объявить отсутствие наследника", response = "Прямая угроза. Война становится вероятнее.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, 18)),
            DialogueChoice(choiceText = "Предложить родственный союз с их родословной.", response = "Дипломатический наследник. Дорогостоящее завтра.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 6)),
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
            prompt = "Ваше Величество, Эдрик говорит, что в законниках описаны три пути преемственности — кровь, выборы и завоевание. Вы воспользовались лишь третьим.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Добиться выборов великими домами.", response = "Право править куплено голосами. Эшфорд улыбается.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Добиваться крови", response = "Отчаянная геральдика. Преемственность, возможно, стабилизируется.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 12)),
            DialogueChoice(choiceText = "Держаться завоевания", response = "Честная жестокость. Будущее неопределённо.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 15)),
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
            prompt = "Ваше Величество, пророк говорит без приглашения: «Когда тот, кто взял трон, не называет наследника, королевство называет троих».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выслушать его наедине.", response = "Предзнаменование принято. Двор нервничает.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Арестовать его за угрозу преемственности.", response = "Молчание куплено. Слухи дешевле.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, 12)),
            DialogueChoice(choiceText = "Публично назвать наследника, чтобы опровергнуть его.", response = "Театральный ответ. Стабильность — или цель обозначена.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, -5)),
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
            prompt = "Ваше Величество, астролог находит пустоту в доме преемственности — он предлагает заполнить её ребёнком, рождённым под счастливой звездой, из провинций.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Усыновить ребёнка звезды.", response = "Миф становится политикой. Крестьяне ликуют.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Изгнать астрологию из государственных дел.", response = "Рациональная корона. Суеверные волнения.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Заплатить только за частный гороскоп.", response = "Тайны на небесах. Утечки на земле.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 5)),
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
            prompt = "Ваше Величество, таинственный незнакомец возвращается — не за советом, а чтобы спросить, что вы оставите, когда туман рассеется над вашим правлением.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Обещать реформы", response = "Надежда продана. Враги устанавливают цену.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 12)),
            DialogueChoice(choiceText = "Обещать кровь", response = "Жёсткий ответ. Стабильность через страх.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 15)),
            DialogueChoice(choiceText = "Не обещать ничего", response = "Тайна поддерживается. Тревога распространяется.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 10)),
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
            prompt = "Ваше Величество, герцог, именующий себя гусем, требует прав преемственности, ибо его дом «снёс золотое яйцо казны».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать церемониальный титул", response = "Абсурд покупает мир. Хронисты плачут.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Выставить его из двора.", response = "Смех и опасность. Он может вернуться злее.", statDeltas = fixed_array(0, 0, 3, 0, 0, -3, -5, 0, 8)),
            DialogueChoice(choiceText = "Назначить его регентом по птичьим счетам.", response = "Шутка становится должностью. Удивительно верная птица.", statDeltas = fixed_array(5, 0, 0, 8, 0, 8, 3, 5, 3)),
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
            prompt = "Ваше Величество, Илана опубликует вашу таблицу преемственности, если вы не одобрите главу. У неё три черновика — кровь, клинок и сделка.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Одобрить главу о крови.", response = "Нарратив династии. Соперники мобилизуются.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 10, 0, 12)),
            DialogueChoice(choiceText = "Одобрить главу о клинке.", response = "Честный миф узурпатора. Честные волнения.", statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, -5, 0, 15)),
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
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, Тален продаёт слух, что вы назвали тайного наследника. Выкупить слух, распустить его или дать идти своим путём?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выкупить и заглушить слух.", response = "Тихие монеты. Громкие вопросы остаются.", statDeltas = fixed_array(0, 0, 0, -15, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Распустить слух", response = "Ложный наследник защищает истинный трон. Хрупкая уловка.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 5, 0, 10)),
            DialogueChoice(choiceText = "Публично опровергнуть и выследить источник.", response = "Хаос сдержан. Двор потеет.", statDeltas = fixed_array(0, 0, 5, 0, 0, 10, 0, 0, 12)),
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
            prompt = "Ваше Величество, Ингвар предлагает признать вашего наследника, если вы признаете притязания его принца на пограничное герцогство после вашей смерти.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять", response = "Будущее продано ради нынешнего покоя.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 5, 0, -8)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость цела. Северные ножи точатся.", statDeltas = fixed_array(0, 0, 10, 0, 0, 5, 0, 0, 15)),
            DialogueChoice(choiceText = "Предложить взаимный пакт о ненападении.", response = "Дипломатическая ничья. Обе стороны ворчат.", statDeltas = fixed_array(3, 0, 5, 0, 0, 5, 3, 0, 5)),
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
            prompt = "Ваше Величество, Малрик говорит, что в соборном хранилище лежит завещание Эдвина — непрочитанное со времён переворота. Вскрыть его или сжечь?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Вскрыть завещание публично.", response = "Ритуал истины. Возможен хаос преемственности.", statDeltas = fixed_array(0, 12, 0, 0, 0, 0, -8, 0, 15)),
            DialogueChoice(choiceText = "Прочитать в тайне, затем решать.", response = "Знание — рычаг. Подозрения растут.", statDeltas = fixed_array(0, 5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Сжечь, не вскрывая.", response = "Мир незнания. Бумаги достались аду.", statDeltas = fixed_array(0, -10, 5, 0, 0, -5, 5, 0, 12)),
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
            prompt = "Ваше Величество, Арвел говорит, что бедные молятся о «имени после того, кто взял трон». Дать им имя или дать им хлеб?",
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
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, Рудольф хочет, чтобы закон о преемственности благоприятствовал генералам. Знать хочет крови. Церковь хочет обрядов. Вы хотите спать.",
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
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, Борвин предлагает обложить налогом пустые наследственные титулы — лорды платят за то, чтобы держать гипотетических наследников на бумаге.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять налог.", response = "Казна смеётся. Знать замышляет.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
            DialogueChoice(choiceText = "Отклонить", response = "Уважение куплено. Золото потеряно.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Облагать налогом только иностранных претендентов.", response = "Узкая политика. Ингвар раздражён.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, 3, 0, 10)),
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
            prompt = "Ваше Величество, Мира лечит лихорадящего лорда, который бормочет имя племянника Эдвина. Спасти его и услышать пророчество — или позволить лихорадке закончить фразу?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Спасти его", response = "Жизнь куплена. Слух о преемственности окреп.", statDeltas = fixed_array(0, 0, 0, -5, 10, 5, 0, 0, 12)),
            DialogueChoice(choiceText = "Позволить природе закончить", response = "Жёсткий выбор. Шёпот зовёт это убийством.", statDeltas = fixed_array(-8, 0, 0, 0, 0, -5, 0, 0, 8)),
            DialogueChoice(choiceText = "Спасти, но изолировать от двора.", response = "Средний путь. Тайны в спальне больного.", statDeltas = fixed_array(0, 0, 0, -8, 8, 8, 0, 0, 5)),
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
            prompt = "Ваше Величество, Варн нашёл памфлеты о преемственности в казармах. Повесить печатников, сжечь памфлеты или переписать их с вашим наследником?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить печатников.", response = "Страх останавливает прессы. Возможны мученики.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 8, 0, 0, 10)),
            DialogueChoice(choiceText = "Сжечь только памфлеты.", response = "Мягкая цензура. Идеи тлеют.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Опубликовать королевский памфлет в ответ.", response = "Война слов. Преемственность обсуждается открыто.", statDeltas = fixed_array(5, 0, 0, -10, 0, 8, 5, 0, 12)),
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
            prompt = "Ваше Величество, Эшфорд предлагает узаконить вашу линию через кровь своего дома — если преемственность назовёт её племянника регентом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять регентский торг.", response = "Преемственность привязана к Эшфорду. Мир дорого стоит.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 18, 0, -5)),
            DialogueChoice(choiceText = "Отказать", response = "Независимость сохранена. Восточная угроза возвращается.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, -10, 0, 15)),
            DialogueChoice(choiceText = "Предложить только брак, без регентства.", response = "Полусоюз. Полуоскорбление.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 10, 0, 8)),
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
            prompt = "Ваше Величество, церковь требует обряда преемственности — назовите наследника, иначе они объявят ваше правление временным в литургии.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Назвать верного генерала наследником.", response = "Сталь наследует. Родословные кричат ересь.", statDeltas = fixed_array(-8, 10, 15, 0, 0, 5, -10, 0, 12)),
            DialogueChoice(choiceText = "Отказать", response = "Вызов. Шёпот о преемственности обрастает зубами.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, 15)),
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
            DialogueChoice(choiceText = "Объявить отсутствие наследника", response = "Прямая угроза. Война становится вероятнее.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, 18)),
            DialogueChoice(choiceText = "Предложить родственный союз с их родословной.", response = "Дипломатический наследник. Дорогостоящее завтра.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 6)),
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
            prompt = "Ваше Величество, Эдрик говорит, что в законниках описаны три пути преемственности — кровь, выборы и завоевание. Вы воспользовались лишь третьим.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Добиться выборов великими домами.", response = "Право править куплено голосами. Эшфорд улыбается.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Добиваться крови", response = "Отчаянная геральдика. Преемственность, возможно, стабилизируется.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 12)),
            DialogueChoice(choiceText = "Держаться завоевания", response = "Честная жестокость. Будущее неопределённо.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 15)),
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
            prompt = "Ваше Величество, пророк говорит без приглашения: «Когда тот, кто взял трон, не называет наследника, королевство называет троих».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выслушать его наедине.", response = "Предзнаменование принято. Двор нервничает.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Арестовать его за угрозу преемственности.", response = "Молчание куплено. Слухи дешевле.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, 12)),
            DialogueChoice(choiceText = "Публично назвать наследника, чтобы опровергнуть его.", response = "Театральный ответ. Стабильность — или цель обозначена.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, -5)),
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
            prompt = "Ваше Величество, астролог находит пустоту в доме преемственности — он предлагает заполнить её ребёнком, рождённым под счастливой звездой, из провинций.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Усыновить ребёнка звезды.", response = "Миф становится политикой. Крестьяне ликуют.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Изгнать астрологию из государственных дел.", response = "Рациональная корона. Суеверные волнения.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Заплатить только за частный гороскоп.", response = "Тайны на небесах. Утечки на земле.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 5)),
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
            prompt = "Ваше Величество, таинственный незнакомец возвращается — не за советом, а чтобы спросить, что вы оставите, когда туман рассеется над вашим правлением.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Обещать реформы", response = "Надежда продана. Враги устанавливают цену.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 12)),
            DialogueChoice(choiceText = "Обещать кровь", response = "Жёсткий ответ. Стабильность через страх.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 15)),
            DialogueChoice(choiceText = "Не обещать ничего", response = "Тайна поддерживается. Тревога распространяется.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 10)),
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
            prompt = "Ваше Величество, герцог, именующий себя гусем, требует прав преемственности, ибо его дом «снёс золотое яйцо казны».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пожаловать церемониальный титул", response = "Абсурд покупает мир. Хронисты плачут.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Выставить его из двора.", response = "Смех и опасность. Он может вернуться злее.", statDeltas = fixed_array(0, 0, 3, 0, 0, -3, -5, 0, 8)),
            DialogueChoice(choiceText = "Назначить его регентом по птичьим счетам.", response = "Шутка становится должностью. Удивительно верная птица.", statDeltas = fixed_array(5, 0, 0, 8, 0, 8, 3, 5, 3)),
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
            prompt = "Ваше Величество, Илана опубликует вашу таблицу преемственности, если вы не одобрите главу. У неё три черновика — кровь, клинок и сделка.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Одобрить главу о крови.", response = "Нарратив династии. Соперники мобилизуются.", statDeltas = fixed_array(0, 0, 0, 0, 0, 5, 10, 0, 12)),
            DialogueChoice(choiceText = "Одобрить главу о клинке.", response = "Честный миф узурпатора. Честные волнения.", statDeltas = fixed_array(-5, 0, 8, 0, 0, 0, -5, 0, 15)),
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
        characterIdx = CHAR_BORVIN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, Тален продаёт слух, что вы назвали тайного наследника. Выкупить слух, распустить его или дать идти своим путём?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выкупить и заглушить слух.", response = "Тихие монеты. Громкие вопросы остаются.", statDeltas = fixed_array(0, 0, 0, -15, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Распустить слух", response = "Ложный наследник защищает истинный трон. Хрупкая уловка.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 5, 0, 10)),
            DialogueChoice(choiceText = "Публично опровергнуть и выследить источник.", response = "Хаос сдержан. Двор потеет.", statDeltas = fixed_array(0, 0, 5, 0, 0, 10, 0, 0, 12)),
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
            prompt = "Ваше Величество, Ингвар предлагает признать вашего наследника, если вы признаете притязания его принца на пограничное герцогство после вашей смерти.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять", response = "Будущее продано ради нынешнего покоя.", statDeltas = fixed_array(0, 0, 5, 0, 0, 0, 5, 0, -8)),
            DialogueChoice(choiceText = "Отказать", response = "Гордость цела. Северные ножи точатся.", statDeltas = fixed_array(0, 0, 10, 0, 0, 5, 0, 0, 15)),
            DialogueChoice(choiceText = "Предложить взаимный пакт о ненападении.", response = "Дипломатическая ничья. Обе стороны ворчат.", statDeltas = fixed_array(3, 0, 5, 0, 0, 5, 3, 0, 5)),
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
            prompt = "Ваше Величество, Малрик говорит, что в соборном хранилище лежит завещание Эдвина — непрочитанное со времён переворота. Вскрыть его или сжечь?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Вскрыть завещание публично.", response = "Ритуал истины. Возможен хаос преемственности.", statDeltas = fixed_array(0, 12, 0, 0, 0, 0, -8, 0, 15)),
            DialogueChoice(choiceText = "Прочитать в тайне, затем решать.", response = "Знание — рычаг. Подозрения растут.", statDeltas = fixed_array(0, 5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Сжечь, не вскрывая.", response = "Мир незнания. Бумаги достались аду.", statDeltas = fixed_array(0, -10, 5, 0, 0, -5, 5, 0, 12)),
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
            prompt = "Ваше Величество, Арвел говорит, что бедные молятся о «имени после того, кто взял трон». Дать им имя или дать им хлеб?",
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
        characterIdx = CHAR_ASHFORD,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, Рудольф хочет, чтобы закон о преемственности благоприятствовал генералам. Знать хочет крови. Церковь хочет обрядов. Вы хотите спать.",
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
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, Борвин предлагает обложить налогом пустые наследственные титулы — лорды платят за то, чтобы держать гипотетических наследников на бумаге.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять налог.", response = "Казна смеётся. Знать замышляет.", statDeltas = fixed_array(0, 0, 0, 20, 0, 0, -10, 0, 8)),
            DialogueChoice(choiceText = "Отклонить", response = "Уважение куплено. Золото потеряно.", statDeltas = fixed_array(0, 0, 0, -5, 0, 5, 8, 0, 5)),
            DialogueChoice(choiceText = "Облагать налогом только иностранных претендентов.", response = "Узкая политика. Ингвар раздражён.", statDeltas = fixed_array(0, 0, 5, 10, 0, 0, 3, 0, 10)),
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
            prompt = "Ваше Величество, Мира лечит лихорадящего лорда, который бормочет имя племянника Эдвина. Спасти его и услышать пророчество — или позволить лихорадке закончить фразу?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Спасти его", response = "Жизнь куплена. Слух о преемственности окреп.", statDeltas = fixed_array(0, 0, 0, -5, 10, 5, 0, 0, 12)),
            DialogueChoice(choiceText = "Позволить природе закончить", response = "Жёсткий выбор. Шёпот зовёт это убийством.", statDeltas = fixed_array(-8, 0, 0, 0, 0, -5, 0, 0, 8)),
            DialogueChoice(choiceText = "Спасти, но изолировать от двора.", response = "Средний путь. Тайны в спальне больного.", statDeltas = fixed_array(0, 0, 0, -8, 8, 8, 0, 0, 5)),
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
            prompt = "Ваше Величество, Варн нашёл памфлеты о преемственности в казармах. Повесить печатников, сжечь памфлеты или переписать их с вашим наследником?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить печатников.", response = "Страх останавливает прессы. Возможны мученики.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 8, 0, 0, 10)),
            DialogueChoice(choiceText = "Сжечь только памфлеты.", response = "Мягкая цензура. Идеи тлеют.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Опубликовать королевский памфлет в ответ.", response = "Война слов. Преемственность обсуждается открыто.", statDeltas = fixed_array(5, 0, 0, -10, 0, 8, 5, 0, 12)),
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
            prompt = "Ваше Величество, Эшфорд предлагает узаконить вашу линию через кровь своего дома — если преемственность назовёт её племянника регентом.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять регентский торг.", response = "Преемственность привязана к Эшфорду. Мир дорого стоит.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 18, 0, -5)),
            DialogueChoice(choiceText = "Отказать", response = "Независимость сохранена. Восточная угроза возвращается.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, -10, 0, 15)),
            DialogueChoice(choiceText = "Предложить только брак, без регентства.", response = "Полусоюз. Полуоскорбление.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 10, 0, 8)),
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
            prompt = "Ваше Величество, церковь требует обряда преемственности — назовите наследника, иначе они объявят ваше правление временным в литургии.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Назвать верного генерала наследником.", response = "Сталь наследует. Родословные кричат ересь.", statDeltas = fixed_array(-8, 10, 15, 0, 0, 5, -10, 0, 12)),
            DialogueChoice(choiceText = "Отказать", response = "Вызов. Шёпот о преемственности обрастает зубами.", statDeltas = fixed_array(0, -8, 5, 0, 0, 0, 5, 0, 15)),
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
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, северные принцы спрашивают, кто унаследует, если вы погибнете в весеннем походе. Им нужен ответ — прежде чем они решат, кто им друг, а кто враг.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Обещать, что трон перейдёт по голосованию совета.", response = "Институциональный ответ. Слабые короли его любят.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 8, 0, 10)),
            DialogueChoice(choiceText = "Объявить отсутствие наследника", response = "Прямая угроза. Война становится вероятнее.", statDeltas = fixed_array(-5, 0, 12, 0, 0, -5, -8, 0, 18)),
            DialogueChoice(choiceText = "Предложить родственный союз с их родословной.", response = "Дипломатический наследник. Дорогостоящее завтра.", statDeltas = fixed_array(0, 0, 0, -15, 0, 0, 10, 0, 6)),
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
            prompt = "Ваше Величество, Эдрик говорит, что в законниках описаны три пути преемственности — кровь, выборы и завоевание. Вы воспользовались лишь третьим.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Добиться выборов великими домами.", response = "Право править куплено голосами. Эшфорд улыбается.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 15, 0, 10)),
            DialogueChoice(choiceText = "Добиваться крови", response = "Отчаянная геральдика. Преемственность, возможно, стабилизируется.", statDeltas = fixed_array(0, 0, 0, -8, 0, 0, 8, 0, 12)),
            DialogueChoice(choiceText = "Держаться завоевания", response = "Честная жестокость. Будущее неопределённо.", statDeltas = fixed_array(0, 0, 8, 0, 0, -5, -5, 0, 15)),
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
            prompt = "Ваше Величество, пророк говорит без приглашения: «Когда тот, кто взял трон, не называет наследника, королевство называет троих».",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Выслушать его наедине.", response = "Предзнаменование принято. Двор нервничает.", statDeltas = fixed_array(0, -5, 0, 0, 0, 5, 0, 0, 8)),
            DialogueChoice(choiceText = "Арестовать его за угрозу преемственности.", response = "Молчание куплено. Слухи дешевле.", statDeltas = fixed_array(-5, 8, 5, 0, 0, -5, 0, 0, 12)),
            DialogueChoice(choiceText = "Публично назвать наследника, чтобы опровергнуть его.", response = "Театральный ответ. Стабильность — или цель обозначена.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 5, 0, -5)),
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
            prompt = "Ваше Величество, астролог находит пустоту в доме преемственности — он предлагает заполнить её ребёнком, рождённым под счастливой звездой, из провинций.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Усыновить ребёнка звезды.", response = "Миф становится политикой. Крестьяне ликуют.", statDeltas = fixed_array(10, 5, 0, -12, 0, 5, 5, 0, 10)),
            DialogueChoice(choiceText = "Изгнать астрологию из государственных дел.", response = "Рациональная корона. Суеверные волнения.", statDeltas = fixed_array(0, -5, 0, 0, 0, 0, 0, 0, 8)),
            DialogueChoice(choiceText = "Заплатить только за частный гороскоп.", response = "Тайны на небесах. Утечки на земле.", statDeltas = fixed_array(0, 0, 0, -8, 0, 3, 0, 0, 5)),
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
            prompt = "Ваше Величество, таинственный незнакомец возвращается — не за советом, а чтобы спросить, что вы оставите, когда туман рассеется над вашим правлением.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Обещать реформы", response = "Надежда продана. Враги устанавливают цену.", statDeltas = fixed_array(8, 0, 0, 0, 0, 8, 5, 0, 12)),
            DialogueChoice(choiceText = "Обещать кровь", response = "Жёсткий ответ. Стабильность через страх.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -5, 0, 0, 15)),
            DialogueChoice(choiceText = "Не обещать ничего", response = "Тайна поддерживается. Тревога распространяется.", statDeltas = fixed_array(0, 0, 0, 0, 0, -8, 0, 0, 10)),
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

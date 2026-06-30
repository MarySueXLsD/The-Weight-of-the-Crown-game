require engine.core
require constants
require dialogue_types

module encounters_loyalty_ru public

let public allEncountersRuLoyalty : Encounter[POOL_LOYALTY_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, начальник стражи сообщает о шёпоте в казармах — солдаты гадают, кто им платит, если казна снова опустеет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Удвоить клятву верности на смотре.", response = "Слова связывают некоторых. Другие считают монеты.", statDeltas = fixed_array(0, 0, 12, -8, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Выплатить премию из тайной казны.", response = "Золото покупает молчание в стали. Ненадолго.", statDeltas = fixed_array(0, 0, 15, -15, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Повесить одного смутьяна для примера.", response = "Страх работает. Остальные отдают честь громче.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, кухарская служанка слышала, как двое придворных называли цену за вашу смерть. Она хочет защиты — или золота.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Защитить её и тихо расследовать.", response = "Терпение ловит крыс. Двор учтиво потеет.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Заплатить ей и забыть имена.", response = "Дешёвая страховка. Опасно, если она заговорит снова.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить", response = "Слепое пятно выбрано сознательно. Им воспользуются.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
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
            prompt = "Ваше Величество, иностранный шпион предлагает список нелояльных писарей — за монеты и безопасный выход.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить список и очистить ряды писарей.", response = "Эффективное предательство. Двор узнаёт, что вы покупаете правду.", statDeltas = fixed_array(0, 0, 0, -12, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Арестовать шпиона и игнорировать список.", response = "Принцип против разведки. Скрытые лжецы остаются на месте.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить список, но пощадить писарей", response = "Мягкая ловушка. Они поймут. Возможно, будут вести себя прилично.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 0)),
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
            prompt = "Ваше Величество, тюрьмы переполнены людьми, клявшимися именем Эдвина. Мне нужно указание — клинок или помилование.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Казнить только зачинщиков.", response = "Хирургический страх. Выжившие видят милость.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Массовое помилование за клятвы, но не за измену.", response = "Великодушная черта. Пуристы назовут это хаосом.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Опустошить камеры в ополчение", response = "Жестокая вербовка. Армия растёт, верность — под вопросом.", statDeltas = fixed_array(-10, 0, 15, 0, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, телохранительница просит отпуск, чтобы навестить деревню — единственный меч между вами и залом спит в стороне.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать отпуск", response = "Человечность стоит риска. Двор отмечает вашу выдержку.", statDeltas = fixed_array(0, 0, -3, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Надёжно и жестоко. Она запомнит.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить с жалованьем и сменой.", response = "Золото и смена — профессиональный компромисс. Она уйдёт, зал не останется без меча.", statDeltas = fixed_array(0, 0, 3, -8, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, монах кормит семьи лоялистов у своих ворот. Стража хочет арестовать их; народ хочет благословить вас за дозволение.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить монаху кормить кого пожелает.", response = "Милосердие покупает шёпот о снисхождении. Малрик хмурится.", statDeltas = fixed_array(10, -5, 0, 0, 5, 8, 0, -5, 0)),
            DialogueChoice(choiceText = "Арестовать сочувствующих Эдвину.", response = "Жёсткая корона. Надёжный трон. Голодные улицы.", statDeltas = fixed_array(-12, 5, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Обложить налогом суп-кухню", response = "Цинично. Удивительно эффективная бухгалтерия.", statDeltas = fixed_array(0, 0, 0, 8, 0, 3, 0, -3, 0)),
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
            prompt = "Ваше Величество, писари казначея продавали слоты аудиенций. Он клянётся в неведении; стражники клянутся обратным.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить писарей, пощадить казначея.", response = "Козлы отпущения умирают. Двор узнаёт цену воровства.", statDeltas = fixed_array(0, 0, 0, 5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить казначея и реформировать службу.", response = "Навести порядок. Дорогостоящая честность.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Взять долю и регулировать взятки.", response = "Коррупция с бухгалтерией. Верность теперь облагается пошлиной.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -5, 0, 0, 0)),
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
            prompt = "Ваше Величество, я не говорил годами — сегодня написал, что ваш камергер плетёт заговор с писарями Ингвара.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Немедленно арестовать камергера.", response = "Стремительный удар. Если ошибётесь, создадите мученика.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо наблюдать в ожидании доказательств.", response = "Терпение. Заговор может созреть до видимости.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто предъявить обвинение Ингвару.", response = "Драма. Дипломатия страдает; правда может всплыть.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, писец обнаружил два варианта вашего последнего указа — один подписанный, один поддельный. Кто-то в скриптории играет на обе стороны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Опечатать все двери скриптория и провести расследование.", response = "Паранойя с основаниями. Работа замедляется; изменники потеют.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Казнить младшего писца для острастки.", response = "Быстрое правосудие. Виновный может остаться.", statDeltas = fixed_array(-5, 0, 3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Издать новый указ, подтверждающий истинный текст.", response = "Чернила бьются с чернилами. Королевство читает замешательство.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, повар поймал пажа, тайно несущего хлеб скрытому узнику в западном крыле. Он хочет знать — ещё есть место милосердию в меню.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Освободить узника", response = "Милосердие на виду. Заговорщики могут проверить вашу мягкость.", statDeltas = fixed_array(5, 0, 0, 0, 0, 10, 0, 3, 0)),
            DialogueChoice(choiceText = "Допросить узника втайне.", response = "Сначала информация. Правосудие — потом, может быть.", statDeltas = fixed_array(0, 0, 0, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Наказать повара за вмешательство.", response = "Послание отправлено: смотри в сторону. Верность куплена страхом.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -8, 0, -5, 0)),
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
            prompt = "Ваше Величество, я предлагаю профинансировать тайную личную стражу — верную только вам, а не офицерам Рудольфа.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять", response = "Личная власть растёт. Армия замечает.", statDeltas = fixed_array(0, 0, -8, -10, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Единство сохранено. Личный риск остаётся.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто сообщить Рудольфу о предложении.", response = "Прозрачность как оружие. Он может уважать или возмущаться.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, я лечу стражника, взявшего взятку, чтобы отвести взгляд во время кражи. Я спрашиваю — кто заслуживает постель в лазарете: голодный вор или верный страж?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лечить его", response = "Милость замечена. Стража обсуждает вашу мягкость.", statDeltas = fixed_array(5, 0, 5, 0, 8, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Передать его Варну для дисциплины.", response = "Порядок восстановлен. Страх освежён.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить без лечения и жалованья.", response = "Жёсткий урок. Казармы запомнят.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, Малрик говорит, что исповедальни переполнены грехами придворных против вашей короны. Он предлагает сводки — за защиту церкви.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять церковные донесения о нелояльности.", response = "Вера становится шпионом. Верность становится измеримой — и унизительной.", statDeltas = fixed_array(0, 12, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Независимость объявлена. Слепые пятна остаются.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Потребовать публичных клятв вместо тайн.", response = "Театр верности. Некоторые будут искренни.", statDeltas = fixed_array(0, 5, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, офицеры пьют за здоровье Эдвина в нижних кабаках. Арестовать, игнорировать или присоединиться с тостом за живого короля?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Арестовать офицеров.", response = "Дисциплина восстановлена. Обиды в бутылке.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Игнорировать", response = "Риск принят. Дешёвый мир этой ночью.", statDeltas = fixed_array(0, 0, -3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить следующий кубок от имени короны.", response = "Смелое обаяние. До полуночи они пьют за вас.", statDeltas = fixed_array(0, 0, 8, -8, 0, 12, 0, 0, 0)),
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
        characterIdx = CHAR_LISSA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, я отказываюсь менять простыни в гостевом крыле — я говорю, что лорд там плёл заговор против вас на пиру.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Вознаградить её отказ", response = "Слуги как глаза. Знать — как враги.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 5, 0, 0)),
            DialogueChoice(choiceText = "Приказать ей подчиниться или уйти со службы.", response = "Иерархия соблюдена. Полезное предупреждение заглушено.", statDeltas = fixed_array(0, 0, 3, 0, 0, -5, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо перевести лорда в менее значимые покои.", response = "Тонкое наказание. Он поймёт.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 3, 0, 0)),
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
            prompt = "Ваше Величество, начальник стражи сообщает о шёпоте в казармах — солдаты гадают, кто им платит, если казна снова опустеет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Удвоить клятву верности на смотре.", response = "Слова связывают некоторых. Другие считают монеты.", statDeltas = fixed_array(0, 0, 12, -8, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Выплатить премию из тайной казны.", response = "Золото покупает молчание в стали. Ненадолго.", statDeltas = fixed_array(0, 0, 15, -15, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Повесить одного смутьяна для примера.", response = "Страх работает. Остальные отдают честь громче.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, кухарская служанка слышала, как двое придворных называли цену за вашу смерть. Она хочет защиты — или золота.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Защитить её и тихо расследовать.", response = "Терпение ловит крыс. Двор учтиво потеет.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Заплатить ей и забыть имена.", response = "Дешёвая страховка. Опасно, если она заговорит снова.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить", response = "Слепое пятно выбрано сознательно. Им воспользуются.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
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
            prompt = "Ваше Величество, иностранный шпион предлагает список нелояльных писарей — за монеты и безопасный выход.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить список и очистить ряды писарей.", response = "Эффективное предательство. Двор узнаёт, что вы покупаете правду.", statDeltas = fixed_array(0, 0, 0, -12, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Арестовать шпиона и игнорировать список.", response = "Принцип против разведки. Скрытые лжецы остаются на месте.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить список, но пощадить писарей", response = "Мягкая ловушка. Они поймут. Возможно, будут вести себя прилично.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 0)),
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
            prompt = "Ваше Величество, тюрьмы переполнены людьми, клявшимися именем Эдвина. Мне нужно указание — клинок или помилование.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Казнить только зачинщиков.", response = "Хирургический страх. Выжившие видят милость.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Массовое помилование за клятвы, но не за измену.", response = "Великодушная черта. Пуристы назовут это хаосом.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Опустошить камеры в ополчение", response = "Жестокая вербовка. Армия растёт, верность — под вопросом.", statDeltas = fixed_array(-10, 0, 15, 0, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, телохранительница просит отпуск, чтобы навестить деревню — единственный меч между вами и залом спит в стороне.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать отпуск", response = "Человечность стоит риска. Двор отмечает вашу выдержку.", statDeltas = fixed_array(0, 0, -3, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Надёжно и жестоко. Она запомнит.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить с жалованьем и сменой.", response = "Золото и смена — профессиональный компромисс. Она уйдёт, зал не останется без меча.", statDeltas = fixed_array(0, 0, 3, -8, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, монах кормит семьи лоялистов у своих ворот. Стража хочет арестовать их; народ хочет благословить вас за дозволение.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить монаху кормить кого пожелает.", response = "Милосердие покупает шёпот о снисхождении. Малрик хмурится.", statDeltas = fixed_array(10, -5, 0, 0, 5, 8, 0, -5, 0)),
            DialogueChoice(choiceText = "Арестовать сочувствующих Эдвину.", response = "Жёсткая корона. Надёжный трон. Голодные улицы.", statDeltas = fixed_array(-12, 5, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Обложить налогом суп-кухню", response = "Цинично. Удивительно эффективная бухгалтерия.", statDeltas = fixed_array(0, 0, 0, 8, 0, 3, 0, -3, 0)),
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
            prompt = "Ваше Величество, писари казначея продавали слоты аудиенций. Он клянётся в неведении; стражники клянутся обратным.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить писарей, пощадить казначея.", response = "Козлы отпущения умирают. Двор узнаёт цену воровства.", statDeltas = fixed_array(0, 0, 0, 5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить казначея и реформировать службу.", response = "Навести порядок. Дорогостоящая честность.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Взять долю и регулировать взятки.", response = "Коррупция с бухгалтерией. Верность теперь облагается пошлиной.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -5, 0, 0, 0)),
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
            prompt = "Ваше Величество, я не говорил годами — сегодня написал, что ваш камергер плетёт заговор с писарями Ингвара.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Немедленно арестовать камергера.", response = "Стремительный удар. Если ошибётесь, создадите мученика.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо наблюдать в ожидании доказательств.", response = "Терпение. Заговор может созреть до видимости.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто предъявить обвинение Ингвару.", response = "Драма. Дипломатия страдает; правда может всплыть.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, писец обнаружил два варианта вашего последнего указа — один подписанный, один поддельный. Кто-то в скриптории играет на обе стороны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Опечатать все двери скриптория и провести расследование.", response = "Паранойя с основаниями. Работа замедляется; изменники потеют.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Казнить младшего писца для острастки.", response = "Быстрое правосудие. Виновный может остаться.", statDeltas = fixed_array(-5, 0, 3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Издать новый указ, подтверждающий истинный текст.", response = "Чернила бьются с чернилами. Королевство читает замешательство.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, повар поймал пажа, тайно несущего хлеб скрытому узнику в западном крыле. Он хочет знать — ещё есть место милосердию в меню.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Освободить узника", response = "Милосердие на виду. Заговорщики могут проверить вашу мягкость.", statDeltas = fixed_array(5, 0, 0, 0, 0, 10, 0, 3, 0)),
            DialogueChoice(choiceText = "Допросить узника втайне.", response = "Сначала информация. Правосудие — потом, может быть.", statDeltas = fixed_array(0, 0, 0, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Наказать повара за вмешательство.", response = "Послание отправлено: смотри в сторону. Верность куплена страхом.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -8, 0, -5, 0)),
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
            prompt = "Ваше Величество, я предлагаю профинансировать тайную личную стражу — верную только вам, а не офицерам Рудольфа.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять", response = "Личная власть растёт. Армия замечает.", statDeltas = fixed_array(0, 0, -8, -10, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Единство сохранено. Личный риск остаётся.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто сообщить Рудольфу о предложении.", response = "Прозрачность как оружие. Он может уважать или возмущаться.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, я лечу стражника, взявшего взятку, чтобы отвести взгляд во время кражи. Я спрашиваю — кто заслуживает постель в лазарете: голодный вор или верный страж?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лечить его", response = "Милость замечена. Стража обсуждает вашу мягкость.", statDeltas = fixed_array(5, 0, 5, 0, 8, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Передать его Варну для дисциплины.", response = "Порядок восстановлен. Страх освежён.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить без лечения и жалованья.", response = "Жёсткий урок. Казармы запомнят.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, Малрик говорит, что исповедальни переполнены грехами придворных против вашей короны. Он предлагает сводки — за защиту церкви.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять церковные донесения о нелояльности.", response = "Вера становится шпионом. Верность становится измеримой — и унизительной.", statDeltas = fixed_array(0, 12, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Независимость объявлена. Слепые пятна остаются.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Потребовать публичных клятв вместо тайн.", response = "Театр верности. Некоторые будут искренни.", statDeltas = fixed_array(0, 5, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, офицеры пьют за здоровье Эдвина в нижних кабаках. Арестовать, игнорировать или присоединиться с тостом за живого короля?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Арестовать офицеров.", response = "Дисциплина восстановлена. Обиды в бутылке.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Игнорировать", response = "Риск принят. Дешёвый мир этой ночью.", statDeltas = fixed_array(0, 0, -3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить следующий кубок от имени короны.", response = "Смелое обаяние. До полуночи они пьют за вас.", statDeltas = fixed_array(0, 0, 8, -8, 0, 12, 0, 0, 0)),
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
            prompt = "Ваше Величество, я отказываюсь менять простыни в гостевом крыле — я говорю, что лорд там плёл заговор против вас на пиру.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Вознаградить её отказ", response = "Слуги как глаза. Знать — как враги.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 5, 0, 0)),
            DialogueChoice(choiceText = "Приказать ей подчиниться или уйти со службы.", response = "Иерархия соблюдена. Полезное предупреждение заглушено.", statDeltas = fixed_array(0, 0, 3, 0, 0, -5, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо перевести лорда в менее значимые покои.", response = "Тонкое наказание. Он поймёт.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 3, 0, 0)),
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
            prompt = "Ваше Величество, начальник стражи сообщает о шёпоте в казармах — солдаты гадают, кто им платит, если казна снова опустеет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Удвоить клятву верности на смотре.", response = "Слова связывают некоторых. Другие считают монеты.", statDeltas = fixed_array(0, 0, 12, -8, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Выплатить премию из тайной казны.", response = "Золото покупает молчание в стали. Ненадолго.", statDeltas = fixed_array(0, 0, 15, -15, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Повесить одного смутьяна для примера.", response = "Страх работает. Остальные отдают честь громче.", statDeltas = fixed_array(-8, 0, 8, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, кухарская служанка слышала, как двое придворных называли цену за вашу смерть. Она хочет защиты — или золота.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Защитить её и тихо расследовать.", response = "Терпение ловит крыс. Двор учтиво потеет.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Заплатить ей и забыть имена.", response = "Дешёвая страховка. Опасно, если она заговорит снова.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить", response = "Слепое пятно выбрано сознательно. Им воспользуются.", statDeltas = fixed_array(0, 0, 0, 5, 0, -10, 0, 0, 0)),
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
            prompt = "Ваше Величество, иностранный шпион предлагает список нелояльных писарей — за монеты и безопасный выход.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить список и очистить ряды писарей.", response = "Эффективное предательство. Двор узнаёт, что вы покупаете правду.", statDeltas = fixed_array(0, 0, 0, -12, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Арестовать шпиона и игнорировать список.", response = "Принцип против разведки. Скрытые лжецы остаются на месте.", statDeltas = fixed_array(0, 0, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить список, но пощадить писарей", response = "Мягкая ловушка. Они поймут. Возможно, будут вести себя прилично.", statDeltas = fixed_array(0, 0, 0, -8, 0, 10, 0, 0, 0)),
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
            prompt = "Ваше Величество, тюрьмы переполнены людьми, клявшимися именем Эдвина. Мне нужно указание — клинок или помилование.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Казнить только зачинщиков.", response = "Хирургический страх. Выжившие видят милость.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Массовое помилование за клятвы, но не за измену.", response = "Великодушная черта. Пуристы назовут это хаосом.", statDeltas = fixed_array(8, 0, -5, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Опустошить камеры в ополчение", response = "Жестокая вербовка. Армия растёт, верность — под вопросом.", statDeltas = fixed_array(-10, 0, 15, 0, 0, -5, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, телохранительница просит отпуск, чтобы навестить деревню — единственный меч между вами и залом спит в стороне.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать отпуск", response = "Человечность стоит риска. Двор отмечает вашу выдержку.", statDeltas = fixed_array(0, 0, -3, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Надёжно и жестоко. Она запомнит.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить с жалованьем и сменой.", response = "Золото и смена — профессиональный компромисс. Она уйдёт, зал не останется без меча.", statDeltas = fixed_array(0, 0, 3, -8, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, монах кормит семьи лоялистов у своих ворот. Стража хочет арестовать их; народ хочет благословить вас за дозволение.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить монаху кормить кого пожелает.", response = "Милосердие покупает шёпот о снисхождении. Малрик хмурится.", statDeltas = fixed_array(10, -5, 0, 0, 5, 8, 0, -5, 0)),
            DialogueChoice(choiceText = "Арестовать сочувствующих Эдвину.", response = "Жёсткая корона. Надёжный трон. Голодные улицы.", statDeltas = fixed_array(-12, 5, 5, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Обложить налогом суп-кухню", response = "Цинично. Удивительно эффективная бухгалтерия.", statDeltas = fixed_array(0, 0, 0, 8, 0, 3, 0, -3, 0)),
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
            prompt = "Ваше Величество, писари казначея продавали слоты аудиенций. Он клянётся в неведении; стражники клянутся обратным.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить писарей, пощадить казначея.", response = "Козлы отпущения умирают. Двор узнаёт цену воровства.", statDeltas = fixed_array(0, 0, 0, 5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить казначея и реформировать службу.", response = "Навести порядок. Дорогостоящая честность.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Взять долю и регулировать взятки.", response = "Коррупция с бухгалтерией. Верность теперь облагается пошлиной.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -5, 0, 0, 0)),
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
            prompt = "Ваше Величество, я не говорил годами — сегодня написал, что ваш камергер плетёт заговор с писарями Ингвара.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Немедленно арестовать камергера.", response = "Стремительный удар. Если ошибётесь, создадите мученика.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо наблюдать в ожидании доказательств.", response = "Терпение. Заговор может созреть до видимости.", statDeltas = fixed_array(0, 0, 0, -5, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто предъявить обвинение Ингвару.", response = "Драма. Дипломатия страдает; правда может всплыть.", statDeltas = fixed_array(0, 0, 3, 0, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, писец обнаружил два варианта вашего последнего указа — один подписанный, один поддельный. Кто-то в скриптории играет на обе стороны.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Опечатать все двери скриптория и провести расследование.", response = "Паранойя с основаниями. Работа замедляется; изменники потеют.", statDeltas = fixed_array(0, 0, 0, -5, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Казнить младшего писца для острастки.", response = "Быстрое правосудие. Виновный может остаться.", statDeltas = fixed_array(-5, 0, 3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Издать новый указ, подтверждающий истинный текст.", response = "Чернила бьются с чернилами. Королевство читает замешательство.", statDeltas = fixed_array(0, 0, 0, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, повар поймал пажа, тайно несущего хлеб скрытому узнику в западном крыле. Он хочет знать — ещё есть место милосердию в меню.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Освободить узника", response = "Милосердие на виду. Заговорщики могут проверить вашу мягкость.", statDeltas = fixed_array(5, 0, 0, 0, 0, 10, 0, 3, 0)),
            DialogueChoice(choiceText = "Допросить узника втайне.", response = "Сначала информация. Правосудие — потом, может быть.", statDeltas = fixed_array(0, 0, 0, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Наказать повара за вмешательство.", response = "Послание отправлено: смотри в сторону. Верность куплена страхом.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -8, 0, -5, 0)),
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
            prompt = "Ваше Величество, я предлагаю профинансировать тайную личную стражу — верную только вам, а не офицерам Рудольфа.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять", response = "Личная власть растёт. Армия замечает.", statDeltas = fixed_array(0, 0, -8, -10, 0, 15, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Единство сохранено. Личный риск остаётся.", statDeltas = fixed_array(0, 0, 8, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто сообщить Рудольфу о предложении.", response = "Прозрачность как оружие. Он может уважать или возмущаться.", statDeltas = fixed_array(0, 0, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, я лечу стражника, взявшего взятку, чтобы отвести взгляд во время кражи. Я спрашиваю — кто заслуживает постель в лазарете: голодный вор или верный страж?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Лечить его", response = "Милость замечена. Стража обсуждает вашу мягкость.", statDeltas = fixed_array(5, 0, 5, 0, 8, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Передать его Варну для дисциплины.", response = "Порядок восстановлен. Страх освежён.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить без лечения и жалованья.", response = "Жёсткий урок. Казармы запомнят.", statDeltas = fixed_array(-5, 0, -5, 5, 0, 5, 0, 0, 0)),
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
            prompt = "Ваше Величество, Малрик говорит, что исповедальни переполнены грехами придворных против вашей короны. Он предлагает сводки — за защиту церкви.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять церковные донесения о нелояльности.", response = "Вера становится шпионом. Верность становится измеримой — и унизительной.", statDeltas = fixed_array(0, 12, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать", response = "Независимость объявлена. Слепые пятна остаются.", statDeltas = fixed_array(0, -8, 0, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Потребовать публичных клятв вместо тайн.", response = "Театр верности. Некоторые будут искренни.", statDeltas = fixed_array(0, 5, 5, 0, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, офицеры пьют за здоровье Эдвина в нижних кабаках. Арестовать, игнорировать или присоединиться с тостом за живого короля?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Арестовать офицеров.", response = "Дисциплина восстановлена. Обиды в бутылке.", statDeltas = fixed_array(-5, 0, 10, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Игнорировать", response = "Риск принят. Дешёвый мир этой ночью.", statDeltas = fixed_array(0, 0, -3, 0, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить следующий кубок от имени короны.", response = "Смелое обаяние. До полуночи они пьют за вас.", statDeltas = fixed_array(0, 0, 8, -8, 0, 12, 0, 0, 0)),
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

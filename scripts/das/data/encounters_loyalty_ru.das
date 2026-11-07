require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
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
            DialogueChoice(choiceText = "Повесить одного смутьяна для примера.", response = "Страх работает. Остальные отдают честь громче.", statDeltas = fixed_array(-8, 0, 4, 0, 0, -4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Заплатить ей и забыть имена.", response = "Дешёвая страховка. Опасно, если она заговорит снова.", statDeltas = fixed_array(0, 0, 0, -10, 0, 0, 0, 0, 0)),
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
        characterIdx = CHAR_KNOX,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, ко мне пришёл иноземный шпион со списком ваших неверных писцов. Он хочет денег и безопасной дороги домой. Я проверил три имени. Они настоящие.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Купить список и очистить ряды писарей.", response = "Эффективное предательство. Двор узнаёт, что вы покупаете правду.", statDeltas = fixed_array(0, 0, 0, -12, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Арестовать шпиона и игнорировать список.", response = "Принцип против разведки. Скрытые лжецы остаются на месте.", statDeltas = fixed_array(0, 0, 5, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Купить список, но пощадить писарей", response = "Мягкая ловушка. Они поймут. Возможно, будут вести себя прилично.", statDeltas = fixed_array(0, 0, 0, -8, 0, 6, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Казнить только зачинщиков.", response = "Хирургический страх. Выжившие видят милость.", statDeltas = fixed_array(-5, 0, 5, 0, 0, 2, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Отказать в отпуске", response = "Надёжно и жестоко. Она запомнит.", statDeltas = fixed_array(0, 0, 5, 0, 0, -8, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Арестовать сочувствующих Эдвину.", response = "Жёсткая корона. Надёжный трон. Голодные улицы.", statDeltas = fixed_array(-12, 5, 5, 0, 0, -6, 0, 0, 0)),
            DialogueChoice(choiceText = "Обложить похлёбочную налогом", response = "Цинично. Удивительно эффективная бухгалтерия.", statDeltas = fixed_array(-3, 0, 0, 8, 0, -2, 0, -3, 0)),
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
            DialogueChoice(choiceText = "Повесить писарей, пощадить казначея.", response = "Козлы отпущения умирают. Двор узнаёт цену воровства.", statDeltas = fixed_array(0, 0, 0, 5, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить казначея и реформировать службу.", response = "Навести порядок. Дорогостоящая честность.", statDeltas = fixed_array(0, 0, 0, -10, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Взять долю и регулировать взятки.", response = "Коррупция с бухгалтерией. Верность теперь облагается пошлиной.", statDeltas = fixed_array(-5, 0, 0, 15, 0, -8, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Немедленно арестовать камергера.", response = "Стремительный удар. Если ошибётесь, создадите мученика.", statDeltas = fixed_array(0, 0, 5, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо наблюдать в ожидании доказательств.", response = "Терпение. Заговор может созреть до видимости.", statDeltas = fixed_array(0, 0, 0, -5, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто предъявить обвинение Ингвару.", response = "Драма. Дипломатия страдает; правда может всплыть.", statDeltas = fixed_array(0, 0, 3, 0, 0, 0, 0, 0, 0)),
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
            prompt = "Ваше Величество, я нашёл две версии вашего последнего указа — одну подписали вы, другую подделали. Кто-то в моей писарской играет на обе стороны, и пишет почти так же хорошо, как я.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Опечатать все двери скриптория и провести расследование.", response = "Паранойя с основаниями. Работа замедляется; изменники потеют.", statDeltas = fixed_array(0, 0, 0, -5, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Казнить младшего писца для острастки.", response = "Быстрое правосудие. Виновный может остаться.", statDeltas = fixed_array(-5, 0, 3, 0, 0, -6, 0, 0, 0)),
            DialogueChoice(choiceText = "Издать новый указ, подтверждающий истинный текст.", response = "Чернила бьются с чернилами. Королевство читает замешательство.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Освободить узника", response = "Милосердие на виду. Заговорщики могут проверить вашу мягкость.", statDeltas = fixed_array(5, 0, 0, 0, 0, 6, 0, 3, 0)),
            DialogueChoice(choiceText = "Допросить узника втайне.", response = "Сначала информация. Правосудие — потом, может быть.", statDeltas = fixed_array(0, 0, 0, -3, 0, 4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Принять тайную стражу", response = "Личная власть растёт. Армия замечает.", statDeltas = fixed_array(0, 0, -8, -10, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказаться", response = "Единство сохранено. Личный риск остаётся.", statDeltas = fixed_array(0, 0, 8, 0, 0, -2, 0, 0, 0)),
            DialogueChoice(choiceText = "Открыто сообщить Рудольфу о предложении.", response = "Прозрачность как оружие. Он может уважать или возмущаться.", statDeltas = fixed_array(0, 0, 5, 0, 0, 4, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Передать его Варну для дисциплины.", response = "Порядок восстановлен. Страх освежён.", statDeltas = fixed_array(-3, 0, 8, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить без лечения и жалованья.", response = "Жёсткий урок. Казармы запомнят.", statDeltas = fixed_array(-5, 0, -5, 5, 0, -8, 0, 0, 0)),
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
            prompt = "Ваше Величество, исповедальни полны грехов придворных против вашей короны. Я могу присылать вам их пересказ — разумеется, в обмен на покровительство Церкви.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять церковные донесения о нелояльности.", response = "Вера становится шпионом. Верность становится измеримой — и унизительной.", statDeltas = fixed_array(0, 12, 0, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать — исповедь священна", response = "Независимость объявлена. Слепые пятна остаются.", statDeltas = fixed_array(0, -8, 0, 0, 0, -2, 0, 0, 0)),
            DialogueChoice(choiceText = "Потребовать публичных клятв вместо тайн.", response = "Театр верности. Некоторые будут искренни.", statDeltas = fixed_array(0, 5, 5, 0, 0, 6, 0, 0, 0)),
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
            DialogueChoice(choiceText = "Арестовать офицеров.", response = "Дисциплина восстановлена. Обиды в бутылке.", statDeltas = fixed_array(-5, 0, 10, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Не обращать внимания на тосты", response = "Риск принят. Дешёвый мир этой ночью.", statDeltas = fixed_array(0, 0, -3, 0, 0, -2, 0, 0, 0)),
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
        characterIdx = CHAR_RAENA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, сегодня утром я нашла нож под вашей подушкой. Не пущенный в ход — оставленный. Тот, кто это сделал, хотел, чтобы вы знали: до вашей постели он дотянется. Ключи от вашей спальни есть только у шестерых.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Допросить всех шестерых с Морвен", response = "Пятеро невиновных слуг вам этого не простят. Один — будет найден.", statDeltas = fixed_array(0, 0, 3, 0, 0, -6, 0, 0, 0)),
            DialogueChoice(choiceText = "Сменить замки и промолчать", response = "Тот, кто оставил нож, ждёт вашего страха. Вы его не показываете.", statDeltas = fixed_array(0, 0, 0, -3, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Объявить двору и назначить награду", response = "Теперь все следят за всеми. Полезно. Изматывающе.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, -2, 0, 0)),
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
            prompt = "Ваше Величество, стража у ворот пропустила купеческую телегу без досмотра. Внутри были бочки масла и факелы. Телегу задержали. Стражники признались, что им заплатили, чтобы не смотрели, — по два серебряка.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Повесить стражников у ворот", response = "Два серебряка — цена верёвки. Каждый стражник выучит урок.", statDeltas = fixed_array(-3, 0, 4, 0, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Поднять жалованье, чтобы взятки не стоили риска", response = "Дорого, но стражник с полным кошелём внимательнее смотрит на телеги.", statDeltas = fixed_array(0, 0, 5, -12, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Использовать стражников, чтобы поймать заплатившего", response = "Они возьмут следующую взятку — и приведут нас к покупателю.", statDeltas = fixed_array(0, 0, 2, 0, 0, 4, 0, 0, 0)),
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
            prompt = "Ваше Величество, слугам не платили два месяца. Они всё ещё работают. Но уже говорят «новый король» вместо «наш король». С этого всё и начинается.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Заплатить сейчас и с прибавкой", response = "Лестница теплеет. Монета — самый быстрый способ сказать спасибо.", statDeltas = fixed_array(0, 0, 0, -12, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Заплатить им едой из королевских запасов", response = "Сытые животы, пустые кошели. Они согласятся — и будут об этом говорить.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 0, -8, 0)),
            DialogueChoice(choiceText = "Подождут ещё месяц", response = "Подождут. И будут слушать любого, кто заплатит.", statDeltas = fixed_array(0, 0, 0, 4, 0, -10, 0, 0, 0)),
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
            prompt = "Ваше Величество, ваш виночерпий каждый вторник встречается с северным купцом. Может, покупает сыр. А может, продаёт ваши привычки. Я могу проследить за ним, припугнуть или заменить его этой же ночью.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Проследить и разузнать", response = "Терпение. Если он шпион, мы узнаем и его друзей.", statDeltas = fixed_array(0, 0, 0, -4, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Тихо заменить", response = "Безопасно. Если он невиновен — просто не повезло.", statDeltas = fixed_array(0, 0, 0, 0, 0, -3, 0, 0, 0)),
            DialogueChoice(choiceText = "Припугнуть визитом Морвен", response = "Он признается, что покупал сыр, — и кое в чём ещё.", statDeltas = fixed_array(0, 0, 2, 0, 0, 3, 0, 0, 0)),
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
            prompt = "Ваше Величество, ветераны войн Эдвина по праздникам всё ещё носят его награды. Иные солдаты называют это изменой. Ветераны говорят, что заслужили награды они, а не король.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пусть носят награды с гордостью", response = "Старые солдаты распрямились. Некоторые даже начали отдавать вам честь.", statDeltas = fixed_array(2, 0, 3, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Запретить награды Эдвина", response = "Награды лягут в ящики. Горечь — в таверны.", statDeltas = fixed_array(0, 0, -3, 0, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Вручить им новые награды от моего имени", response = "Две награды на одной груди. Ветераны примут обе и выпьют за вас.", statDeltas = fixed_array(0, 0, 5, -8, 0, 8, 0, 0, 0)),
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
            prompt = "Ваше Величество, трое членов вашего совета получили одинаковое анонимное письмо: «Корона падёт к зиме. Выбирайте сторону». Двое показали его мне. Третий — нет.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Призвать к ответу третьего советника", response = "Он клянётся, что сжёг письмо. Возможно. Теперь совет знает, что вы следите.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -3, 0, 0)),
            DialogueChoice(choiceText = "Наградить тех двоих, что пришли сами", response = "При вашем дворе честность вознаграждается. Другие это запомнят.", statDeltas = fixed_array(0, 0, 0, -6, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Ничего не делать и следить за третьим", response = "Молчание — ловушка. Посмотрим, кто в неё попадёт.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
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
            prompt = "Ваше Величество, сержант Брэй спас целую роту на речной переправе. Он из простых, горластый, и солдаты его любят. Они хотят, чтобы его сделали капитаном. Офицеры — против.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Сделать Брэя капитаном", response = "Солдаты ликуют. В офицерской столовой неделю стоит тишина.", statDeltas = fixed_array(3, 0, 6, 0, 0, 10, -5, 0, 0)),
            DialogueChoice(choiceText = "Наградить золотом вместо чина", response = "Брэй возьмёт золото и останется сержантом. Солдаты сочтут это несправедливым.", statDeltas = fixed_array(0, 0, 2, -6, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Уважить мнение офицеров", response = "Порядок сохранён. При вас солдаты больше не поют песню о Брэе.", statDeltas = fixed_array(0, 0, -2, 0, 0, -8, 5, 0, 0)),
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
            prompt = "Ваше Величество, кто-то подсыпает в ваш суп соль — слишком много соли. Не яд. Знак? Шутка? Проверка? Поварята клянутся, что ничего не знают.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Нанять дегустатора", response = "Разумная предосторожность. Дегустатор очень доволен новой работой.", statDeltas = fixed_array(0, 0, 0, -5, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Неделю обедать вместе со слугами", response = "Король за столом слуг. Тот, кто солил ваш суп, теперь сидит рядом.", statDeltas = fixed_array(2, 0, 0, 0, 0, 10, -3, 0, 0)),
            DialogueChoice(choiceText = "Заменить всю кухонную прислугу", response = "Новые повара, еда хуже и двадцать злых бывших слуг в городе.", statDeltas = fixed_array(-2, 0, 0, -4, 0, -8, 0, 0, 0)),
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
            prompt = "Ваше Величество, я могу подделать любую подпись во дворце — этим я и занимался при Эдвине. И не только я. Предлагаю новую королевскую печать с тайной меткой, о которой будем знать только вы и я.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Сделать новую печать", response = "Подделыватели останутся без хлеба. Но теперь я знаю вашу тайну. Доверьтесь мне — придётся.", statDeltas = fixed_array(0, 0, 0, -6, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Сделать, но никому не говорить — даже Осрику", response = "Мудро. Обидно. Из гордости я подделаю её за месяц.", statDeltas = fixed_array(0, 0, 0, -8, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Старая печать сойдёт", response = "Тогда ложные приказы продолжат выходить из этого дворца.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 0)),
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
            prompt = "Ваше Величество, молодой священник отказался произносить ваше имя в воскресной молитве. Говорит, что присягал Эдвину. Половина прихода с ним согласна. Другая половина хочет его убрать.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Убрать его из прихода", response = "Одного священника нет, приход расколот. Малрик доволен.", statDeltas = fixed_array(-3, 5, 0, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Приехать в приход и поговорить с ним", response = "Он не произнёс вашего имени — но помолился за вас. Это начало.", statDeltas = fixed_array(4, 2, 0, 0, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Не обращать внимания", response = "К весне один молчащий священник превратится в десять.", statDeltas = fixed_array(0, -3, 0, 0, 0, -6, 0, 0, 0)),
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
            prompt = "Ваше Величество, богатый купец преподносит вам подарок: прекрасного коня с юга. Ничего взамен не просит. Пока ничего.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять подарок", response = "Прекрасный конь. И купец, который всем рассказывает, что король ему должен.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 2, 0, 0)),
            DialogueChoice(choiceText = "Принять и заплатить полную цену", response = "Ни долгов, ни сплетен. Двор узнал: подарки здесь оплачивают.", statDeltas = fixed_array(0, 0, 0, -8, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Вежливо отказаться", response = "Купец обижен, но ваша честь не продаётся.", statDeltas = fixed_array(0, 0, 0, 0, 0, 4, -2, 0, 0)),
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
            prompt = "Ваше Величество, стражник был ранен, защищая вас от пьяного с ножом. Придворный лекарь не лечит простых солдат. Я вылечу, но нужен ваш приказ.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Приказать придворному лекарю лечить его", response = "Лекарь подчинится, покраснев. К ночи об этом узнает каждый стражник.", statDeltas = fixed_array(0, 0, 5, 0, 3, 10, -3, 0, 0)),
            DialogueChoice(choiceText = "Пусть его лечит Мира", response = "Он выживет. Стража заметит, кто о нём позаботился.", statDeltas = fixed_array(0, 0, 3, 0, 3, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Заплатить и отправить домой", response = "Кошель вместо лекаря. Он уходит домой хромая и злой.", statDeltas = fixed_array(0, 0, -3, -4, 0, -6, 0, 0, 0)),
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
        characterIdx = CHAR_KARA,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, моя рота год охраняет ваши дороги. Мои люди просят договор ещё на пять лет. Долгий договор — это верность. Короткий — значит, мы продолжаем искать предложения получше.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Подписать на пять лет", response = "Тогда мои болты ваши, пока ваш наследник не вырастет.", statDeltas = fixed_array(0, 0, 8, -15, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Подписать ещё на год", response = "Честно. Коротко. Посмотрим, кто предложит больше следующей весной.", statDeltas = fixed_array(0, 0, 4, -6, 0, 0, 0, 0, 0)),
            DialogueChoice(choiceText = "Расторгнуть договор", response = "Тогда сторожите дороги сами. Удачи.", statDeltas = fixed_array(0, 0, -8, 6, 0, -4, 0, 0, 0)),
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
            prompt = "Ваше Величество, у стражи есть походная песня, которая над вами подшучивает — по-доброму. «Король, что вошёл через окно». Поют её с улыбкой. Написать им песню получше?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Попросить её написать гордую песню", response = "Новая песня за счёт короны. Стража поёт обе.", statDeltas = fixed_array(0, 0, 2, -5, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Присоединиться к страже и подпеть", response = "Король поёт насмешливую песню о себе. Теперь стража за вас умрёт.", statDeltas = fixed_array(3, 0, 5, 0, 0, 12, -3, 0, 0)),
            DialogueChoice(choiceText = "Запретить песню", response = "Тогда её запоют громче — и без улыбки.", statDeltas = fixed_array(0, 0, -3, 0, 0, -8, 0, 0, 0)),
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
            prompt = "Ваше Величество, мой помощник вёл вторую книгу — настоящую — и предложил её леди Эшфорд. Он говорит, что хотел защитить казну от меня. Может, он и прав.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Проверить и Борвина, и помощника", response = "Болезненно, честно и медленно. Оба потеют. Правда выходит наружу.", statDeltas = fixed_array(0, 0, 0, -5, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Поверить Борвину, уволить помощника", response = "Вы верны казначею. Помощник отправляется прямиком к Эшфорд.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, -3, 0, 0)),
            DialogueChoice(choiceText = "Сделать помощника новым казначеем", response = "Смелая перемена. Борвин уязвлён. Помощник теперь обязан вам всем.", statDeltas = fixed_array(0, 0, 0, 3, 0, 2, 0, 0, 0)),
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
            prompt = "Ваше Величество, семья сторонников Эдвина попросила приюта в моей обители. Отец был капитаном и сражался против вашего переворота. Его дети голодны. Позволит ли это корона?",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Позволить — дети не враги", response = "Милость замечена. Некоторые сторонники Эдвина начинают сомневаться, так ли вы плохи.", statDeltas = fixed_array(5, 3, 0, 0, 0, 8, 0, -2, 0)),
            DialogueChoice(choiceText = "Позволить, но капитан должен сдаться", response = "Ради детей он сдастся. Печальный, но честный обмен.", statDeltas = fixed_array(0, 0, 3, 0, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать — сторонникам Эдвина помощи нет", response = "Жёстко. Ясно. Сторонники Эдвина больше не сомневаются.", statDeltas = fixed_array(-4, -3, 2, 0, 0, -8, 0, 0, 0)),
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
            prompt = "Ваше Величество, ночной дозор поймал двух ваших стражников за игрой в костяные кости — и они проиграли ключи от дворца. Ключи вернули. Так они говорят.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Сменить все замки во дворце", response = "Дорого и долго, зато сегодня вы будете спать.", statDeltas = fixed_array(0, 0, 0, -10, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Уволить обоих стражников", response = "На двух дураков меньше. И на двух людей в городе, знающих ваш дворец, больше.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Выяснить, кому они проиграли", response = "Умная мысль. Выигравший вовсе не был стражником.", statDeltas = fixed_array(0, 0, 2, 0, 0, 6, 0, 0, 0)),
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
            prompt = "Ваше Величество, буду честна: кое-кто из моих вассалов говорит о том, чтобы вас заменить. Я к ним не присоединилась. Пока. Мне бы хотелось причины не делать этого — скажем, места для моего брата в вашем совете.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Дать её брату место в совете", response = "Верность куплена открыто. Другие дома запомнят цену.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 8, 0, 0)),
            DialogueChoice(choiceText = "Потребовать имена вассалов", response = "Она назовёт два имени — самых незначительных. Испытание нервов.", statDeltas = fixed_array(0, 0, 2, 0, 0, 4, -6, 0, 0)),
            DialogueChoice(choiceText = "Поблагодарить и ничего не дать", response = "Она улыбнётся. И не забудет.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, -4, 0, 0)),
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
        characterIdx = CHAR_FINN,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, когда-то я был дезертиром. Теперь я командую вашими разведчиками. Часть старых дезертиров всё ещё прячется в холмах. Они вернутся — если корона пообещает их не вешать.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пообещать полное помилование", response = "Сорок человек выйдут из холмов. Армия растёт. Честные солдаты ворчат.", statDeltas = fixed_array(0, 0, 8, 0, 0, 6, 0, -3, 0)),
            DialogueChoice(choiceText = "Помиловать только тех, кто служил хорошо", response = "Справедливо, но это их расколет. Половина вернётся, половина останется разбойниками.", statDeltas = fixed_array(0, 0, 4, 0, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Дезертирам пощады нет", response = "Тогда холмы останутся опасными. А я задумаюсь о собственной шее.", statDeltas = fixed_array(-2, 0, 2, 0, 0, -8, 0, 0, 0)),
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
            prompt = "Ваше Величество, говорят, ваша стража верна, — но верность, которую не оплатили вовремя, превращается в слухи. Предлагаю платить дворцовой страже прямо из моего банка, каждый месяц, без задержек.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Принять предложение Солта", response = "Стража больше никогда не получит жалованье с опозданием. И будет знать, кто ей платит.", statDeltas = fixed_array(0, 0, 4, 5, 0, -8, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать — корона сама платит своей страже", response = "Гордость — и тяжёлый сундук, который надо наполнять каждый месяц.", statDeltas = fixed_array(0, 0, 2, -6, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Пусть платит только страже внешних ворот", response = "Компромисс. Ваша дверь остаётся вашей.", statDeltas = fixed_array(0, 0, 2, 2, 0, 0, 0, 0, 0)),
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
            prompt = "Ваше Величество, мой бывший командир из стражи Эдвина хочет встретиться с вами. Говорит, что присягнёт — если вы посмотрите ему в глаза и скажете, почему Эдвин должен был умереть.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Встретиться и сказать правду", response = "Он выслушает. Не простит. Но встанет на колено.", statDeltas = fixed_array(0, 0, 3, 0, 0, 12, 0, 0, 0)),
            DialogueChoice(choiceText = "Встретиться, но сказать лишь, что дело сделано", response = "Ответ короля. Он примет его — с трудом.", statDeltas = fixed_array(0, 0, 2, 0, 0, 4, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать — короли не объясняются", response = "Тогда он останется чужим. И его люди тоже.", statDeltas = fixed_array(0, 0, -2, 0, 0, -6, 2, 0, 0)),
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
            prompt = "Ваше Величество, я мог бы подбросить ко двору ложный заговор — ненастоящий — и посмотреть, кто к нему примкнёт. Примкнувшие — изменники. Донёсшие — верные. Жестоко, но очень познавательно.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Устроить ложный заговор", response = "Трое придворных примкнут. Четверо донесут. Остальные узнают и перестанут доверять кому-либо.", statDeltas = fixed_array(0, 0, 0, -5, 0, 6, -4, 0, 0)),
            DialogueChoice(choiceText = "Слишком жестоко — отказать", response = "Тогда ждём настоящего заговора. Они всегда случаются.", statDeltas = fixed_array(0, 0, 0, 0, 0, 2, 0, 0, 0)),
            DialogueChoice(choiceText = "Устроить, но помиловать примкнувших", response = "Урок, а не бойня. Они никогда не забудут ни вашей милости, ни вашей ловушки.", statDeltas = fixed_array(0, 0, 0, -5, 0, 8, -2, 0, 0)),
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
            prompt = "Ваше Величество, я стар, и у меня одна просьба: отпустите меня в мою деревню вместе с мечом. Молодые рыцари говорят, что рыцарь, ушедший со службы, — предатель. А я говорю, что устал.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Отпустить с почестями и пенсией", response = "Каждый старый солдат видит: служба вам может закончиться миром.", statDeltas = fixed_array(0, 0, 2, -6, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Попросить сначала обучить молодых рыцарей", response = "Ещё один год. Он поворчит — и выучит их очень хорошо.", statDeltas = fixed_array(0, 0, 6, 0, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать — он присягал пожизненно", response = "Он останется. Его сердце — нет.", statDeltas = fixed_array(0, 0, 0, 0, 0, -6, 0, 0, 0)),
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
            prompt = "Ваше Величество, у меня есть список всех, кто радовался, когда вы взяли корону, — и всех, кто плакал. Опубликовать его в летописи? Людям нравится знать, на чьей они стороне.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Сжечь список", response = "Новое начало для всех. Плакавшие благодарны.", statDeltas = fixed_array(2, 0, 0, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Хранить в тайне, только для меня", response = "Полезно. Опасно, если украдут. Нокс уже заинтересовался.", statDeltas = fixed_array(0, 0, 0, 0, 0, 3, 0, 0, 0)),
            DialogueChoice(choiceText = "Опубликовать", response = "Теперь все знают. Плакавшие никогда не станут вашими друзьями.", statDeltas = fixed_array(0, 0, 0, 0, 0, -10, -3, 0, 0)),
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
            prompt = "Ваше Величество, при дворе нет иной клятвы, кроме старых слов Эдвина. Предлагаю новую присягу — короткую, простую и от вашего имени. Каждый при дворе должен произнести её на следующем пиру.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Присягнуть должны все", response = "Большинство присягнёт. Несколько человек в тот вечер внезапно заболеют. Теперь вы знаете, кто.", statDeltas = fixed_array(0, 0, 2, 0, 0, 8, -3, 0, 0)),
            DialogueChoice(choiceText = "Только те, кто желает", response = "Клятв меньше, зато каждая искренняя.", statDeltas = fixed_array(0, 0, 0, 0, 0, 6, 2, 0, 0)),
            DialogueChoice(choiceText = "Оставить старую клятву Эдвина", response = "Старые слова, старая верность. Не вся она — вам.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 3, 0, 0)),
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
            prompt = "Ваше Величество, одна женщина призналась в заговоре против вашей жизни, — но она явно безумна, а в её плане участвовал летающий кот. Закон велит вешать сознавшихся изменников.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Передать её на попечение Миры", response = "Милость к безумной. Закон гнётся, а люди видят разумного короля.", statDeltas = fixed_array(5, 0, 0, 0, 2, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Закон есть закон", response = "Её повесят. Люди шепчутся, что новый король боится котов.", statDeltas = fixed_array(-6, 0, 2, 0, 0, -4, 0, 0, 0)),
            DialogueChoice(choiceText = "Отпустить с предупреждением", response = "Она благодарит и обещает передать коту.", statDeltas = fixed_array(3, 0, 0, 0, 0, 2, 0, 0, 0)),
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
        characterIdx = CHAR_YAREK,
        nodes = fixed_array(
        DialogueNode(
            prompt = "Ваше Величество, шахтёры принесут присягу короне — все до одного, на городской площади, — если вы пообещаете им одно: больше никаких детей в шахтах.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Пообещать и исполнить", response = "Тысяча шахтёров присягнёт. Добыча руды немного упадёт. Сердца — заметно поднимутся.", statDeltas = fixed_array(10, 0, -2, -6, 3, 12, -2, 0, 0)),
            DialogueChoice(choiceText = "Пообещать для детей младше двенадцати", response = "Половина обещания. Присягнёт половина шахтёров.", statDeltas = fixed_array(4, 0, 0, -3, 0, 5, 0, 0, 0)),
            DialogueChoice(choiceText = "Отказать — шахтам нужны все руки", response = "Горны продолжат гореть. Шахтёры оставят свою клятву при себе.", statDeltas = fixed_array(-6, 0, 3, 4, 0, -8, 0, 0, 0)),
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
            prompt = "Ваше Величество, кто-то скупает в городе всё чёрное сукно. Чёрное — для траура. Или для знамён. Моя догадка? Кто-то готовит похороны. Возможно, ваши.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Скупить остаток чёрного сукна самому", response = "Нет сукна — нет знамён. Заговорщикам придётся начинать сначала — и злиться.", statDeltas = fixed_array(0, 0, 0, -8, 0, 6, 0, 0, 0)),
            DialogueChoice(choiceText = "Выяснить, кто покупает", response = "Портной разговорится. Появится имя. Маленькое, но полезное.", statDeltas = fixed_array(0, 0, 2, -3, 0, 8, 0, 0, 0)),
            DialogueChoice(choiceText = "Это просто сукно", response = "Наверное. Наверное.", statDeltas = fixed_array(0, 0, 0, 0, 0, -4, 0, 0, 0)),
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
            prompt = "Ваше Величество, армия пройдёт весенним парадом. Солдаты хотят пройти мимо дворца и выкрикивать ваше имя. Офицеры — мимо собора и выкрикивать имя Божье.",
            choiceCount = 3,
            choices = fixed_array(
            DialogueChoice(choiceText = "Мимо дворца, с моим именем", response = "Пять тысяч голосов выкрикивают ваше имя. Малрик тоже это слышит.", statDeltas = fixed_array(2, -6, 6, 0, 0, 10, 0, 0, 0)),
            DialogueChoice(choiceText = "Мимо собора, с именем Божьим", response = "Благочестиво и безопасно. Солдаты кричат без особого чувства.", statDeltas = fixed_array(0, 8, 2, 0, 0, 0, 0, 0, 0)),
            DialogueChoice(choiceText = "Мимо обоих — и я пойду вместе с ними", response = "Король, марширующий со своей армией. Солдаты расскажут об этом внукам.", statDeltas = fixed_array(4, 3, 8, -5, 0, 8, 0, 0, 0)),
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

require engine.core
require constants
require dialogue_types

module opening_week_encounters_ru public

let public openingWeekEncountersRu : Encounter[OPENING_WEEK_ENC_COUNT] <- fixed_array(
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Ваше Величество, солдаты проливали кровь, чтобы посадить вас на трон. Теперь они ждут монет. Если казна промолчит, мечи тоже могут заговорить.",
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
                        response = "Честь не звенит в кошеле. Надеюсь, ваши стены крепче вашей щедрости.",
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
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_MALRIK,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Ваше Величество, народ шепчет слово «узурпатор». Если церковь проведёт обряд очищения короны, шёпот станет молитвой.",
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
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_BORVIN,
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
                        choiceText = "Найдите другой источник дохода.",
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
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_MIRA,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Ваше Величество, в нижнем городе жар и кашель. Это может быть простуда, а может быть начало чумы. Нужно действовать сейчас.",
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
                prompt = "Пока умерли трое. Если это то, чего я боюсь, через неделю мы будем считать не отдельные смерти, а целые улицы.",
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
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_VARN,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Ваше Величество, после переворота дворец полон чужих лиц. Я прошу удвоить ночную стражу. Это дорого, но вы будете спать дольше.",
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
                        choiceText = "Кого вы подозреваете?",
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
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 1,
        characterIdx = CHAR_EDRIC,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Ваше Величество, первый указ нового короля запомнят все. Он должен быть простым. Милость, налог или меч?",
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
        )
    ),
    Encounter(
        startNodeIdx = 0,
        nodeCount = 2,
        characterIdx = CHAR_RUDOLF,
        nodes = fixed_array(
            DialogueNode(
                prompt = "Ваше Величество, пойманы шесть дезертиров. Они говорят, что бежали не от страха, а от голода. Армия смотрит, как вы поступите.",
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
        )
    )
)

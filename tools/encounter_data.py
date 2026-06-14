# Encounter data: (char_key, [(prompt_ru, prompt_en, choices), ...])
# Choice: (text_ru, text_en, resp_ru, resp_en, stats_dict|None, next_node|None)
# stats None + next_node=1 => follow-up trigger; stats {} or omitted with no next => NO_STAT_CHANGE terminal

INTRO_RU = {
    'rudolf': 'Я генерал Рудольф — солдаты, посадившие вас на трон, ждут вашего слова.',
    'malrik': 'Я верховный жрец Малрик — церковь решает, осудит ли народ ваш восход.',
    'borvin': 'Я казначей Борвин — в сундуках пусто, а кризисам не конца.',
    'mira': 'Я лекарь Мира — больной город не знает, что его король уже сменился.',
    'gromm': 'Я повар Громм — двор и армия едят быстрее, чем поля успевают родить.',
    'varn': 'Я капитан Варн — ночью во дворце слишком много чужих шагов.',
    'edric': 'Я старый советник Эдрик — три короля видел, четвёртого хочу не потерять.',
    'selena': 'Я купчиха Селена — на голодный город хлеб везут только те, кто считает монеты.',
    'morwen': 'Я палач Морвен — меч и верёвка в моих руках; спросите, кому они нужны сегодня.',
    'arvel': 'Я монах Арвел — бедные у нашего монастыря не знают, чей указ им поможет.',
    'ingvar': 'Я посол Ингвар — мой князь наблюдает, сгорит ли ваш трон или взойдёт солнце.',
    'sivil': 'Я аптекарь Сивил — лекарства мои горьки, но смерть горше.',
}

INTRO_EN = {
    'rudolf': 'I am General Rudolf — the soldiers who put you on the throne await your word.',
    'malrik': 'I am High Priest Malrik — the church will decide whether the people condemn your rise.',
    'borvin': 'I am Treasurer Borvin — the coffers are empty and the crises never end.',
    'mira': 'I am Healer Mira — the sick city does not yet know its king has changed.',
    'gromm': 'I am Cook Gromm — court and army eat faster than the fields can yield.',
    'varn': 'I am Captain Varn — too many unfamiliar footsteps echo in the palace at night.',
    'edric': 'I am Old Advisor Edric — I have served three kings and would not lose a fourth.',
    'selena': 'I am Merchant Selena — only those who count coins bring bread to a hungry capital.',
    'morwen': 'I am Executioner Morwen — sword and rope are in my hands; ask whom they serve today.',
    'arvel': 'I am Monk Arvel — the poor at our monastery gate do not know whose decree will feed them.',
    'ingvar': 'I am Ambassador Ingvar — my prince watches whether your throne burns or the sun rises.',
    'sivil': 'I am Apothecary Sivil — my remedies are bitter, but death is bitterer.',
}

# fmt: off
from encounter_data_pool3 import POOL3_ENCOUNTERS

ENCOUNTERS = [
    # 0 — Жалование после переворота
    ('rudolf', [
        ('Солдаты проливали кровь, чтобы посадить вас на трон. Теперь они ждут монет. Если казна промолчит, мечи тоже могут заговорить.',
         'The soldiers shed blood to put you on the throne. Now they are waiting for coins. If the treasury remains silent, the swords may also speak.',
         [
             ('Заплатить армии полностью.', 'Pay the army in full.', 'Солдаты запомнят щедрого короля. По крайней мере, до следующего жалования.', 'The soldiers will remember the generous king. At least until the next salary.', {'a': 20, 'g': -25}),
             ('Заплатить половину и пообещать остальное позже.', 'Pay half and promise the rest later.', 'Половина монеты покупает половину спокойствия. Но сегодня этого хватит.', "Half a coin buys half peace of mind. But today that's enough.", {'a': 8, 'g': -10}),
             ('Служба королю — уже честь.', 'Serving the king is already an honor.', 'Честь не звенит в кошеле. Я надеюсь, ваши стены крепче вашей щедрости.', 'Honor does not ring in your wallet. I hope your walls are stronger than your generosity.', {'a': -20, 'g': 5}),
             ('Сколько солдат действительно участвовало в перевороте?', 'How many soldiers actually took part in the coup?', '', '', None, 1),
         ]),
        ('Меньше, чем указано в списках. Командиры приписали мёртвых, хромых и тех, кто в ту ночь спал пьяным.',
         'Less than listed. The commanders attributed the dead, the lame and those who slept drunk that night.',
         [
             ('Заплатить только честным.', 'Pay only honest people.', 'Справедливо. Но обманутые командиры начнут ворчать.', 'Fair. But the deceived commanders will begin to grumble.', {'a': 10, 'g': -10}),
             ('Заплатить всем, чтобы не злить армию.', 'Pay everyone so as not to anger the army.', 'Щедрый приказ. Даже лжецы будут славить вас громко.', 'Generous order. Even liars will praise you loudly.', {'a': 18, 'g': -20}),
             ('Заморозить выплаты до проверки.', 'Freeze payments until verification.', 'Проверки кормят бумагу, не солдат. Я предупреждал.', 'Checks feed paper, not soldiers. I warned you.', {'a': -12, 'g': 10}),
         ]),
    ]),
    # 1 — Благословение узурпатора
    ('malrik', [
        ('Народ шепчет слово ‘узурпатор’. Но если церковь проведёт обряд очищения короны, шёпот станет молитвой.',
         "The people whisper the word 'usurper'. But if the church performs a rite of purification of the crown, the whisper will become a prayer.",
         [
             ('Провести дорогой обряд.', 'Carry out an expensive ritual.', 'Боги любят смирение. А народ любит видеть, что король склоняет голову.', 'The gods love humility. And the people love to see the king bow his head.', {'g': -15, 'p': 5}),
             ('Провести скромный обряд.', 'Perform a modest ceremony.', 'Скромность тоже добродетель. Хотя золото сияет убедительнее.', 'Modesty is also a virtue. Although gold shines more convincingly.', {'g': -5, 'p': 2}),
             ('Короне не нужны молитвы.', "The crown doesn't need prayers.", 'Трон без благословения стоит высоко, но качается сильнее.', 'The throne without blessing stands high, but sways more.', {'g': 5, 'p': -5}),
             ('Чего церковь хочет взамен?', 'What does the church want in return?', '', '', None, 1),
         ]),
        ('Немногое. Верните храму зерновые склады. Мы накормим души и тела, а вы получите тишину на улицах.',
         'Little. Return the grain warehouses to the temple. We will feed souls and bodies, and you will get silence on the streets.',
         [
             ('Вернуть склады храму.', 'Return the warehouses to the temple.', 'Мудро. Хлеб, отданный храму, возвращается молитвой.', 'Wise. Bread given to the temple is returned through prayer.', {'f': -15, 'p': 10}),
             ('Отдать только часть зерна.', 'Give away only part of the grain.', 'Половина милости всё же лучше полной гордыни.', 'Half mercy is still better than complete pride.', {'f': -7, 'p': 5}),
             ('Отказать.', 'Refuse.', 'Тогда пусть корона сама отвечает на голодные молитвы.', 'Then let the crown itself answer hunger prayers.', {'f': 5, 'p': -8}),
         ]),
    ]),
    # 2 — Пустая казна
    ('borvin', [
        ('Ваше Величество, в казне больше паутины, чем золота. Можно ввести временный налог на городские ворота.',
         'Your Majesty, there is more cobwebs in the treasury than gold. A temporary tax on city gates can be introduced.',
         [
             ('Ввести налог немедленно.', 'Implement the tax immediately.', 'Прекрасно. Ворота наконец начнут приносить больше, чем сквозняк.', 'Wonderful. The gate will finally begin to bring in more than a draft.', {'g': 20, 'p': -5}),
             ('Ввести налог только для купцов.', 'Introduce a tax only for merchants.', 'Купцы будут жаловаться. Но они жалуются даже на солнце, если оно светит бесплатно.', 'Merchants will complain. But they even complain about the sun if it shines freely.', {'g': 10, 'f': -5}),
             ('Не трогать ворота.', "Don't touch the gate.", 'Свободная торговля — благородная мысль. Жаль, что монет она даёт не сразу.', 'Free trade is a noble idea. It’s a pity that she doesn’t give out coins right away.', {'g': -5, 'f': 10}),
             ('Найди другой источник дохода.', 'Find another source of income.', '', '', None, 1),
         ]),
        ('Можно продать часть королевских украшений. Драгоценности красивы, но мёртвы. Казна хотя бы дышит.',
         'You can sell some of the royal jewelry. Jewels are beautiful, but dead. At least the treasury is breathing.',
         [
             ('Продать тайно.', 'Sell \u200b\u200bsecretly.', 'Никто не заметит. Кроме тех, кто считал камни на короне.', 'No one will notice. Except for those who counted the stones on the crown.', {'g': 15}),
             ('Продать публично, как жертву ради народа.', 'Sell \u200b\u200bpublicly, as a sacrifice for the sake of the people.', 'Хороший ход. Бедность выглядит лучше, когда её называют добродетелью.', 'Good move. Poverty looks better when it is called a virtue.', {'g': 12, 'p': 3}),
             ('Не продавать.', "Don't sell.", 'Величие останется целым. Казна — нет.', 'Greatness will remain intact. Treasury - no.', None),
         ]),
    ]),
    # 3 — Болезнь в нижнем городе
    ('mira', [
        ('В нижнем городе жар и кашель. Это может быть простуда, а может быть начало мора. Нужно действовать сейчас.',
         'In the lower city there is fever and cough. It could be a cold, or it could be the beginning of a pestilence. We need to act now.',
         [
             ('Закрыть квартал на карантин.', 'Close the block for quarantine.', 'Жестоко, но разумно. Иногда дверь спасает больше жизней, чем меч.', 'Cruel, but reasonable. Sometimes a door saves more lives than a sword.', {'p': 20, 'g': -10, 'f': -5}),
             ('Отправить лекарей и оставить ворота открытыми.', 'Send healers and leave the gates open.', 'Мы сделаем, что сможем. Но болезнь любит открытые дороги.', "We'll do what we can. But disease loves the open road.", {'p': 8, 'g': -8}),
             ('Не сеять панику.', "Don't cause panic.", 'Паника убивает быстро. Болезнь — терпеливее.', 'Panic kills quickly. Illness is more patient.', {'g': 5, 'p': -20}),
             ('Насколько всё серьёзно?', 'How serious is it?', '', '', None, 1),
         ]),
        ('Пока умерли трое. Если это то, чего я боюсь, через неделю мы будем считать не людей, а улицы.',
         'So far three have died. If this is what I fear, in a week we will not be counting people, but streets.',
         [
             ('Карантин только заражённых улиц.', 'Quarantine only infected streets.', 'Это даст нам время. А время — лучшее лекарство после чистой воды.', 'This will give us time. And time is the best medicine after clean water.', {'p': 12, 'g': -5}),
             ('Сжечь заражённые дома.', 'Burn down infected houses.', 'Огонь остановит болезнь. Но люди запомнят дым.', 'Fire will stop the disease. But people will remember the smoke.', {'p': 20, 'g': -5, 'f': -5}),
             ('Скрыть новость.', 'Hide news.', 'Тайна не лечит жар. Она только ждёт, пока станет поздно.', "Secrets don't cure fever. She's just waiting until it's too late.", {'g': 5, 'p': -15}),
         ]),
    ]),
    # 4 — Пир или амбары
    ('gromm', [
        ('Знать ждёт первого королевского пира. Но если я накрою стол как положено, городские амбары похудеют.',
         'The nobles are waiting for the first royal feast. But if I set the table properly, the city barns will lose weight.',
         [
             ('Устроить роскошный пир.', 'Have a luxurious feast.', 'Пир будет таким, что гости забудут голод. Правда, город — нет.', 'The feast will be such that the guests will forget hunger. True, the city is not.', {'f': -20, 'g': -10, 'a': 5}),
             ('Устроить скромный пир.', 'Have a modest feast.', 'Скромный пир — это когда дворяне всё равно едят, но жалуются тише.', 'A modest feast is when the nobles still eat, but complain more quietly.', {'f': -8, 'g': -4}),
             ('Отменить пир и раздать еду бедным.', 'Call off the feast and give the food to the poor.', 'Хлеб внизу оценят больше, чем павлина наверху.', 'The bread below will be more appreciated than the peacock above.', {'f': -10, 'p': 15}),
             ('Можно обмануть гостей?', 'Is it possible to deceive guests?', '', '', None, 1),
         ]),
        ('Можно. Дешёвое мясо, дорогой соус, много свечей — и половина гостей решит, что ела редкость.',
         'Can. Cheap meat, expensive sauce, a lot of candles - and half of the guests will decide that they ate something rare.',
         [
             ('Сделать дешёвый пир под видом роскошного.', 'Make a cheap feast disguised as a luxurious one.', 'Люблю, когда королевская мудрость пахнет чесноком и обманом.', 'I love it when royal wisdom smells of garlic and deceit.', {'f': -5, 'g': -3}),
             ('Нет, пир должен быть настоящим.', 'No, the feast must be real.', 'Будет настоящий. И голод после него тоже.', 'It will be real. And hunger after it too.', {'f': -20, 'g': -10}),
             ('Вообще отменить пир.', 'Cancel the feast altogether.', 'Тогда я приберегу мясо. В наше время это почти государственная измена.', "Then I'll save the meat. In our time, this is almost high treason.", {'p': 5, 'f': 5}),
         ]),
    ]),
    # 5 — Ночная охрана
    ('varn', [
        ('После переворота дворец полон чужих лиц. Я прошу удвоить ночную стражу. Это дорого, но вы будете спать дольше.',
         "After the coup, the palace is full of strangers. I ask that the night watch be doubled. It's expensive, but you'll sleep longer.",
         [
             ('Удвоить стражу.', 'Double the guards.', 'Хорошо. Ночь станет дороже, но безопаснее.', 'Fine. The night will become more expensive, but safer.', {'a': 10, 'g': -10}),
             ('Поставить только проверенных солдат.', 'Supply only proven soldiers.', 'Меньше людей, больше доверия. Я смогу с этим работать.', 'Fewer people, more trust. I can work with this.', {'a': 5, 'g': -5}),
             ('Не тратить деньги на страхи.', "Don't waste money on fears.", 'Тогда будем надеяться, что страхи тоже не тратят ножи.', "Then let's hope that fears don't waste their knives either.", {'g': 5, 'a': -5, 'p': -2}),
             ('Кого ты подозреваешь?', 'Who do you suspect?', '', '', None, 1),
         ]),
        ('Слуг прежнего короля. Не всех. Но достаточно одного с ключом, чтобы дверь стала могилой.',
         'Servants of the former king. Not everyone. But one with a key is enough for the door to become a grave.',
         [
             ('Заменить слуг солдатами.', 'Replace servants with soldiers.', 'Дворец станет грубее, зато двери будут слушаться.', 'The palace will become rougher, but the doors will obey.', {'a': 10, 'g': -10, 'f': -5}),
             ('Проверить слуг тайно.', 'Check on the servants secretly.', 'Тихая проверка ловит больше правды, чем громкий приказ.', 'A quiet check catches more truth than a loud order.', {'g': -5, 'a': 3}),
             ('Оставить их.', 'Leave them.', 'Тогда я буду смотреть им в руки. Особенно когда они несут вам вино.', 'Then I will look into their hands. Especially when they bring you wine.', {'g': 3, 'a': -5}),
         ]),
    ]),
    # 6 — Первый указ
    ('edric', [
        ('Первый указ нового короля запомнят все. Он должен быть простым. Милость, налог или меч?',
         'Everyone will remember the first decree of the new king. It should be simple. Grace, tax or sword?',
         [
             ('Снизить цену на хлеб.', 'Reduce the price of bread.', 'Хлеб — самый тихий способ сказать народу, что он ещё нужен королю.', 'Bread is the quietest way to tell the people that the king still needs it.', {'f': -10, 'p': 15, 'g': -5}),
             ('Увеличить сбор налогов.', 'Increase tax collection.', 'Казна оживёт. Народ, возможно, наоборот.', 'The treasury will come to life. People may be the opposite.', {'g': 20, 'p': -10}),
             ('Объявить набор в армию.', 'Announce recruitment into the army.', 'Мечей станет больше. Рук в полях — меньше.', 'There will be more swords. There are fewer hands in the fields.', {'a': 15, 'f': -5, 'g': -5}),
             ('Пока не издавать указ.', "Don't issue a decree yet.", 'Иногда молчание мудро. Но в первые дни трона его часто принимают за слабость.', 'Sometimes silence is wise. But in the early days of the throne, it is often mistaken for weakness.', None),
         ]),
    ]),
    # 7 — Дезертиры
    ('rudolf', [
        ('Пойманы шесть дезертиров. Они говорят, что бежали не от страха, а от голода. Армия смотрит, как вы поступите.',
         'Six deserters were captured. They say that they fled not from fear, but from hunger. The army is watching what you do.',
         [
             ('Казнить их публично.', 'Execute them publicly.', 'Жестоко. Зато завтра никто не побежит первым.', 'Cruel. But tomorrow no one will run first.', {'a': 15, 'p': -5}),
             ('Вернуть их в строй после наказания.', 'Return them to duty after punishment.', 'Они будут хромать, но служить. Это лучше, чем висеть.', "They will limp, but serve. It's better than hanging.", {'a': 5, 'p': -2}),
             ('Помиловать и накормить.', 'Have mercy and feed.', 'Милость хороша у очага. В казарме она пахнет слабостью.', 'Mercy is good at the hearth. In the barracks she smells of weakness.', {'f': -5, 'a': -10, 'p': 5}),
             ('Почему солдаты голодают?', 'Why are soldiers starving?', '', '', None, 1),
         ]),
        ('Потому что интенданты воруют. Война всегда кормит крыс — в амбарах и в мундирах.',
         'Because quartermasters steal. War always feeds rats - in barns and in uniforms.',
         [
             ('Повесить интендантов.', 'Hang the quartermasters.', 'После этого зерно начнут считать честнее.', 'After this, grain will begin to be counted more honestly.', {'a': 10, 'f': 5}),
             ('Заставить вернуть украденное.', 'Force them to return what they stole.', 'Хорошо. Пусть их жадность хотя бы накормит солдат.', 'Fine. Let their greed at least feed the soldiers.', {'f': 10, 'g': 5}),
             ('Скрыть скандал.', 'Hide the scandal.', 'Скрытая гниль всё равно пахнет. Просто позже.', 'Hidden rot still smells. Just later.', {'a': -5, 'g': 5}),
         ]),
    ]),
    # 8 — Ночные службы
    ('malrik', [
        ('Люди болеют не только телом, но и страхом. Позвольте храмам провести ночные службы. Толпы придут молиться.',
         'People are sick not only with their bodies, but also with fear. Allow churches to hold night services. Crowds will come to pray.',
         [
             ('Разрешить службы.', 'Allow services.', 'Люди уйдут с молитвой на губах. Иногда этого достаточно, чтобы пережить ночь.', "People will leave with a prayer on their lips. Sometimes that's enough to get you through the night.", {'p': 5, 'f': -3}),
             ('Запретить большие собрания.', 'Ban large gatherings.', 'Вы спасаете тела. Надеюсь, души подождут.', 'You save bodies. I hope the souls will wait.', {'p': 10, 'g': -3}),
             ('Службы только на открытых площадях.', 'Services are only in open areas.', 'Небо тоже свод храма. Боги услышат.', 'The sky is also the vault of the temple. The gods will hear.', {'p': 8, 'g': -5}),
             ('Пусть церковь сама платит за охрану.', 'Let the church pay for security itself.', 'Церковь заплатит. И запомнит, что король считает свечи.', 'The church will pay. And he will remember that the king is counting candles.', {'g': 5, 'p': 2}),
         ]),
    ]),
    # 9 — Новая монета
    ('borvin', [
        ('Можно выпустить новую монету с вашим лицом. Если добавить меньше серебра, казна выиграет. Народ заметит не сразу.',
         "You can issue a new coin with your face on it. If you add less silver, the treasury will benefit. People won't notice right away.",
         [
             ('Чеканить честную монету.', 'Mint an honest coin.', 'Дорого, но красиво. Честность всегда обходится дороже меди.', 'Expensive, but beautiful. Honesty always costs more than copper.', {'g': -10, 'p': 5}),
             ('Разбавить серебро медью.', 'Dilute silver with copper.', 'Монета станет легче. Как и совесть тех, кто её тратит.', 'The coin will become lighter. As does the conscience of those who spend it.', {'g': 20, 'p': -8}),
             ('Отложить чеканку.', 'Set aside minting.', 'Старые монеты продолжат ходить. Вместе со старой памятью.', 'The old coins will continue to circulate. Along with the old memory.', None),
             ('Кто узнает о подделке?', 'Who will know about the fake?', '', '', None, 1),
         ]),
        ('Мастера монетного двора. Но молчание стоит дешевле серебра.',
         'Masters of the Mint. But silence is worth less than silver.',
         [
             ('Заплатить мастерам и разбавить монету.', 'Pay the masters and dilute the coin.', 'Хорошая сделка. Плохая монета. Прекрасная политика.', 'Good deal. Bad coin. Great policy.', {'g': 15, 'p': -8}),
             ('Не рисковать.', "Don't take risks.", 'Осторожность редко наполняет сундуки, но иногда сохраняет головы.', 'Caution rarely fills chests, but sometimes saves heads.', {'g': -5}),
             ('Арестовать мастеров.', 'Arrest the masters.', 'Тишина станет надёжной. И очень испуганной.', 'Silence will become reliable. And very scared.', {'g': 10, 'a': 5, 'p': -5}),
         ]),
    ]),
    # 10 — Королевская усталость
    ('mira', [
        ('Вы не спали три ночи. Если вы рухнете, дворец начнёт делить власть без вас. Вам нужен отдых.',
         "You haven't slept for three nights. If you collapse, the palace will begin to share power without you. You need rest.",
         [
             ('Отменить приёмы на день.', 'Cancel appointments for the day.', 'Живой король лучше занятого мертвеца.', 'A living king is better than a busy dead one.', {'p': 3, 'a': -3}),
             ('Продолжить работать.', 'Continue working.', 'Тогда хотя бы падайте рядом с креслом, чтобы вас легче было поднять.', 'Then at least fall next to the chair to make it easier to lift you up.', {'g': 5, 'p': -5}),
             ('Принять укрепляющее зелье.', 'Take a strengthening potion.', 'Оно поможет. Но не путайте бодрость с исцелением.', "It will help. But don't confuse cheerfulness with healing.", {'g': -5, 'p': 5}),
             ('Что в зелье?', "What's in the potion?", '', '', None, 1),
         ]),
        ('Травы, мёд и немного того, что заставит сердце биться быстрее. После него придёт слабость.',
         'Herbs, honey and a little something to get your heart pumping. After it comes weakness.',
         [
             ('Выпить всё равно.', 'Drink anyway.', 'Вы купили день силы ценой завтрашней дрожи.', "You bought a day of strength at the price of tomorrow's trembling.", {'g': 5, 'p': -8}),
             ('Отказаться и лечь спать.', 'Give up and go to bed.', 'Наконец-то приказ, который не вредит телу.', "Finally an order that doesn't harm the body.", {'p': 5, 'g': -3}),
             ('Дать зелье чиновникам и гонцам.', 'Give the potion to officials and messengers.', 'Они побегут быстрее. А потом упадут дружнее.', 'They will run faster. And then they will fall together.', {'g': 8, 'p': -5}),
         ]),
    ]),
    # 11 — Плесень в зерне
    ('gromm', [
        ('Часть зерна в западном амбаре покрылась серой плесенью. Если выбросим — еды станет меньше. Если сварим крепче — может, никто не умрёт.',
         'Some of the grain in the western barn was covered with gray mold. If we throw it away, there will be less food. If we cook it stronger, maybe no one will die.',
         [
             ('Выбросить испорченное зерно.', 'Throw away spoiled grain.', 'Жаль зерно. Но мёртвые едят ещё меньше.', 'Sorry for the grain. But the dead eat even less.', {'f': -15, 'p': 10}),
             ('Использовать для солдатской каши.', "Use for soldier's porridge.", 'Солдаты заметят. Особенно те, кто добежит до ведра.', 'The soldiers will notice. Especially those who run to the bucket.', {'f': 5, 'a': -5, 'p': -10}),
             ('Смешать с хорошим и раздать бедным.', 'Mix with good things and give to the poor.', 'Бедняки привыкли к худшему. Но это не значит, что их желудки железные.', 'The poor are accustomed to the worst. But this does not mean that their stomachs are iron.', {'f': 8, 'p': -15}),
             ('Можно спасти часть?', 'Can some be saved?', '', '', None, 1),
         ]),
        ('Треть можно просушить. Остальное уже годится только для крыс, и то злых.',
         'A third can be dried. The rest is only suitable for rats, and even evil ones.',
         [
             ('Спасти треть, остальное выбросить.', 'Save a third, throw the rest away.', 'Разумно. Не щедро, не глупо. Редкий рецепт.', 'Reasonable. Not generous, not stupid. Rare recipe.', {'f': -8, 'p': 7}),
             ('Спасти всё и рискнуть.', 'Save everything and take risks.', 'Тогда я велю готовить рядом с лазаретом.', "Then I'll have it prepared next to the infirmary.", {'f': 5, 'p': -10}),
             ('Выбросить всё.', 'Throw everything away.', 'Чистый амбар лучше полной могилы.', 'A clean barn is better than a full grave.', {'f': -15, 'p': 10}),
         ]),
    ]),
    # 12 — Толпа у ворот
    ('varn', [
        ('У дворцовых ворот собралась толпа. Они не вооружены, но требуют хлеба и ответа: кто теперь правит ими?',
         'A crowd gathered at the palace gates. They are not armed, but they demand bread and an answer: who rules them now?',
         [
             ('Выйти к ним лично.', 'Go out to them in person.', 'Смелый ход. Я поставлю людей близко, но не слишком заметно.', "A bold move. I'll put people close, but not too noticeable.", {'p': 10, 'a': -5}),
             ('Раздать хлеб через стражу.', 'Distribute bread through the guards.', 'Хлеб говорит проще короля. Иногда даже убедительнее.', 'Bread speaks more simply than a king. Sometimes even more convincing.', {'f': -10, 'p': 8}),
             ('Разогнать толпу.', 'Disperse the crowd.', 'Будет сделано. Но синяки тоже умеют помнить.', 'It will be done. But bruises can also remember.', {'a': 10, 'p': -15}),
             ('Сказать, что король занят.', 'Say that the king is busy.', 'Тогда они решат, что вы заняты не ими.', 'Then they will decide that you are not busy with them.', {'g': 2, 'p': -8}),
         ]),
    ]),
    # 13 — Слуги прежнего короля
    ('edric', [
        ('Во дворце ещё служат люди прежнего короля. Если прогнать всех, дворец ослепнет. Если оставить всех, вы будете спать среди чужой памяти.',
         "The people of the former king still serve in the palace. If you drive everyone away, the palace will go blind. If you leave everyone, you will sleep among someone else's memory.",
         [
             ('Прогнать всех старых слуг.', 'Drive away all the old servants.', 'Дворец станет чище. И куда глупее.', 'The palace will become cleaner. And much more stupid.', {'a': 5, 'g': -10, 'f': -5}),
             ('Оставить тех, кто принесёт новую клятву.', 'Leave those who take a new oath.', 'Клятва не всегда верность. Но это начало.', 'An oath is not always loyalty. But this is a start.', {'g': -3, 'a': 3}),
             ('Оставить всех.', 'Leave everyone.', 'Машина дворца продолжит работать. Вопрос — на кого.', 'The palace machine will continue to work. The question is - to whom.', {'g': 5, 'a': -5}),
             ('Кто из них опасен?', 'Which one is dangerous?', '', '', None, 1),
         ]),
        ('Опаснее всех те, кто молчит слишком правильно. Преданный слуга всегда немного человек. Шпион — всегда мебель.',
         'The most dangerous of all are those who are too silent. A devoted servant is always a little human. A spy is always furniture.',
         [
             ('Составить список подозрительных.', 'Make a list of suspects.', 'Список не спасёт вас сам, но подскажет, кому не доверять вино.', "The list won't save you, but it will tell you who not to trust with wine.", {'g': -5, 'a': 5}),
             ('Заменить только ближайших к трону.', 'Replace only those closest to the throne.', 'Мягкая чистка. Иногда мягкий нож режет точнее.', 'Soft cleaning. Sometimes a soft knife cuts more accurately.', {'a': 5, 'g': -5}),
             ('Никого не трогать.', "Don't touch anyone.", 'Тогда дворец будет улыбаться вам прежними зубами.', 'Then the palace will smile at you with its old teeth.', {'a': -5, 'g': 3}),
         ]),
    ]),
    # 14 — Граница без приказа
    ('rudolf', [
        ('Северные разведчики перешли границу. Это может быть проверка. Разрешите ударить первыми?',
         'Northern scouts crossed the border. This could be a test. May I strike first?',
         [
             ('Ударить первыми.', 'Strike first.', 'Так говорят короли, которых не пробуют дважды.', 'So say kings who are never tried twice.', {'a': 20, 'g': -15, 'f': -5}),
             ('Усилить границу, но не атаковать.', 'Strengthen the border, but do not attack.', 'Осторожная сила. Не худший язык для границы.', 'Cautious force. Not the worst language for the border.', {'a': 10, 'g': -8}),
             ('Отправить посла.', 'Send an ambassador.', 'Слова дешевле крови. Пока другая сторона не решит иначе.', 'Words are cheaper than blood. Until the other side decides otherwise.', {'g': -5, 'a': -5, 'f': 3}),
             ('Игнорировать разведчиков.', 'Ignore the scouts.', 'Граница услышит ваше молчание. И враг тоже.', 'The border will hear your silence. And the enemy too.', {'g': 5, 'a': -15}),
         ]),
    ]),
    # 15 — Храмовые амбары
    ('malrik', [
        ('Церковь может открыть свои амбары для бедных. Но в указе должно быть сказано, что это сделано по нашему милосердию.',
         'The church can open its barns to the poor. But the decree should say that this was done out of our mercy.',
         [
             ('Согласиться и похвалить церковь.', 'Agree and praise the church.', 'Милосердие любит свидетелей. Сегодня ими станет весь город.', 'Mercy loves witnesses. Today the whole city will become them.', {'f': 10, 'p': 10}),
             ('Помощь должна идти от имени короля.', 'Help must come in the name of the king.', 'Корона хочет славы даже за чужой хлеб. Что ж, это тоже голод.', "The crown wants glory even for someone else's bread. Well, this is also hunger.", {'f': 5, 'p': 5, 'g': -5}),
             ('Отказаться от церковной помощи.', 'Refuse church help.', 'Гордость редко бывает сытной.', 'Pride is rarely satisfying.', {'g': 3, 'f': -5, 'p': -10}),
             ('Разделить славу.', 'Share the glory.', 'Пусть народ благодарит и трон, и алтарь. Так безопаснее для всех.', "Let the people give thanks to both the throne and the altar. It's safer for everyone.", {'f': 7, 'p': 7}),
         ]),
    ]),
    # 16 — Имущество мятежников
    ('borvin', [
        ('В домах казнённых сторонников прошлого короля осталось серебро, картины, лошади. По закону всё можно забрать.',
         'In the houses of executed supporters of the past king, silver, paintings, and horses remained. By law, everything can be taken away.',
         [
             ('Забрать всё в казну.', 'Take everything to the treasury.', 'Мёртвым роскошь не нужна. Живой казне — очень.', "The dead don't need luxury. Very lively treasury.", {'g': 25, 'p': -5}),
             ('Забрать только оружие и монеты.', 'Take only weapons and coins.', 'Умеренно. Я почти расстроен вашей порядочностью.', "Moderately. I'm almost upset at your decency.", {'g': 15, 'a': 5}),
             ('Оставить семьям часть имущества.', 'Leave some property to families.', 'Милосердие дорого. Но иногда дешевле мести.', 'Mercy is dear. But sometimes revenge is cheaper.', {'g': 5, 'p': 8}),
             ('Не трогать дома мёртвых.', 'Do not touch the houses of the dead.', 'Красивый жест. Казна его не оценит, но вдовы — возможно.', 'Nice gesture. The treasury will not appreciate him, but widows may.', {'p': 10, 'g': -5}),
         ]),
    ]),
    # 17 — Грязная вода
    ('mira', [
        ('В городе пьют из канала, куда сбрасывают отходы. Если не очистить воду, болезнь вернётся сильнее.',
         'In the city they drink from a canal where waste is dumped. If the water is not purified, the disease will return stronger.',
         [
             ('Выделить деньги на очистку колодцев.', 'Allocate money to clean wells.', 'Чистая вода спасёт больше людей, чем десяток проповедей и сотня казней.', 'Clean water will save more people than a dozen sermons and a hundred executions.', {'g': -15, 'p': 25}),
             ('Заставить жителей чистить бесплатно.', 'Make residents clean for free.', 'Они будут злиться. Но хотя бы злиться живыми.', 'They will be angry. But at least be angry with the living.', {'g': -3, 'p': 10, 'a': 3}),
             ('Пока не тратить деньги.', "Don't spend any money yet.", 'Тогда болезнь уже получила ваш первый подарок.', 'Then the disease has already received your first gift.', {'g': 8, 'p': -20}),
             ('Пусть армия поможет.', 'Let the army help.', 'Солдаты с лопатами полезнее солдат с дубинками. Хотя они это возненавидят.', "Soldiers with shovels are more useful than soldiers with clubs. They'll hate it though.", {'p': 15, 'a': -5, 'g': -5}),
         ]),
    ]),
    # 18 — Солдатская похлёбка
    ('gromm', [
        ('Армия ест лучше, чем городские дети. Я могу разбавить солдатскую похлёбку и направить крупу в приюты.',
         "The army eats better than city children. I can dilute the soldiers' stew and send the grain to shelters.",
         [
             ('Разбавить похлёбку.', 'Thin the stew.', 'Дети поедят. Солдаты выругаются. Обычный день кухни.', 'The children will eat. The soldiers curse. A typical day in the kitchen.', {'f': 8, 'p': 10, 'a': -10}),
             ('Не трогать солдатские пайки.', "Don't touch the soldiers' rations.", 'Солдаты будут сыты. Приюты будут пахнуть пустыми мисками.', 'The soldiers will be well fed. Shelters will smell like empty bowls.', {'a': 8, 'p': -5}),
             ('Разбавить только офицерскую кухню.', "Only dilute the officer's kitchen.", 'Офицеры заметят первыми. Они всегда замечают, когда страдают почти как люди.', 'The officers will notice first. They always notice when they suffer, almost like humans.', {'f': 5, 'a': -3, 'p': 5}),
             ('Солдаты заметят?', 'Will the soldiers notice?', '', '', None, 1),
         ]),
        ('Рядовые — не сразу. Офицеры — после первой ложки. У них язык избалованнее совести.',
         'Privates - not right away. Officers - after the first spoon. Their tongue is more spoiled than their conscience.',
         [
             ('Забрать часть офицерских припасов.', "Take some of the officers' supplies.", 'Наконец-то блюдо, которое я готовлю с удовольствием.', 'Finally a dish that I enjoy cooking.', {'f': 8, 'a': -5, 'p': 5}),
             ('Забрать у всех поровну.', 'Take from everyone equally.', 'Справедливо. Значит, недовольны будут все.', 'Fair. This means that everyone will be unhappy.', {'f': 10, 'a': -10, 'p': 8}),
             ('Оставить всё как есть.', 'Leave everything as is.', 'Сытый меч лучше голодного. Но дети мечи не едят.', "A well-fed sword is better than a hungry one. But children don't eat swords.", {'a': 5, 'p': -5}),
         ]),
    ]),
    # 19 — Оружие в городе
    ('varn', [
        ('После переворота у жителей осталось много оружия. Если собрать его, станет спокойнее. Если нет — каждый подвал может стать крепостью.',
         'After the coup, residents were left with a lot of weapons. If you collect it, it will become calmer. If not, every basement can become a fortress.',
         [
             ('Собрать всё оружие.', 'Collect all weapons.', 'Город станет тише. Не обязательно спокойнее.', 'The city will become quieter. Not necessarily calmer.', {'a': 15, 'p': -10}),
             ('Разрешить оружие только гильдиям и стражникам.', 'Allow weapons only to guilds and guards.', 'Компромисс. Достаточно твёрдый, чтобы не развалиться сразу.', 'Compromise. Firm enough not to fall apart right away.', {'a': 8, 'g': 3}),
             ('Не трогать людей.', "Don't touch people.", 'Они оценят доверие. Или воспользуются им.', 'They will appreciate the trust. Or they will use it.', {'p': 8, 'a': -10}),
             ('Выкупить оружие.', 'Buy back weapons.', 'Монеты вместо обысков. Дорого, но с меньшим количеством криков.', 'Coins instead of searches. Expensive, but with less shouting.', {'a': 10, 'g': -15, 'p': 5}),
         ]),
    ]),
    # 20 — Совет прежнего короля
    ('edric', [
        ('Некоторые старые министры готовы служить вам. Они опытны, но их руки пахнут прошлым троном.',
         'Some old ministers are ready to serve you. They are experienced, but their hands smell of the past throne.',
         [
             ('Вернуть их в совет.', 'Bring them back to the council.', 'Опыт вернётся. Вместе со старыми привычками.', 'The experience will return. Along with old habits.', {'g': 10, 'a': -5}),
             ('Оставить только самых полезных.', 'Leave only the most useful ones.', 'Хорошо. Старые ножи можно использовать, если держать их за рукоять.', 'Fine. Old knives can be used if you hold them by the handle.', {'g': 5}),
             ('Изгнать всех.', 'Expel everyone.', 'Чистый стол. Пустой стол. Разница станет заметна завтра.', 'Clean table. Empty table. The difference will be noticeable tomorrow.', {'a': 5, 'g': -10}),
             ('Пусть принесут публичную клятву.', 'Let them take a public oath.', 'Клятвы не меняют сердца. Но связывают языки.', "Vows don't change hearts. But tongues are tied.", {'a': 3, 'g': -3, 'p': 3}),
         ]),
    ]),
    # 21 — Рекруты из деревень
    ('rudolf', [
        ('Нам нужны новые люди. Деревни полны крепких парней. Поля подождут, если трон рухнет.',
         'We need new people. The villages are full of tough guys. The fields will wait if the throne falls.',
         [
             ('Забрать рекрутов силой.', 'Take recruits by force.', 'Армия вырастет быстро. Поля будут скучать по рукам.', 'The army will grow quickly. Fields will miss the hands.', {'a': 25, 'f': -20, 'p': -10}),
             ('Взять добровольцев за плату.', 'Take volunteers for a fee.', 'Медленнее, но чище. Доброволец меньше смотрит назад.', 'Slower, but cleaner. The volunteer looks back less.', {'a': 10, 'g': -10}),
             ('Не трогать деревни до урожая.', 'Do not touch the villages until the harvest.', 'Хлеб победил меч. Надеюсь, враг тоже любит ждать.', 'Bread defeated the sword. I hope the enemy likes to wait too.', {'f': 15, 'a': -10}),
             ('Взять преступников вместо крестьян.', 'Take criminals instead of peasants.', 'Из плохих людей иногда выходят хорошие щиты.', 'Bad people sometimes make good shields.', {'a': 8, 'g': -3, 'p': -5}),
         ]),
    ]),
    # 22 — Публичное покаяние
    ('malrik', [
        ('Люди простят многое, если король склонит голову перед богами. Не перед людьми. Перед богами.',
         'People will forgive a lot if the king bows his head to the gods. Not in front of people. Before the gods.',
         [
             ('Покаяться за кровь переворота.', 'Repent for the blood of the coup.', 'Смирение укрепляет душу. Хотя солдаты любят его меньше.', 'Humility strengthens the soul. Although the soldiers love him less.', {'p': 10, 'a': -10}),
             ('Сказать, что кровь была необходима.', 'Say that blood was needed.', 'Мечу понравятся ваши слова. Алтарь промолчит.', 'The sword will like your words. The altar will remain silent.', {'a': 10, 'p': -8}),
             ('Пусть храм произнесёт речь от моего имени.', 'Let the temple make a speech on my behalf.', 'Церковь умеет говорить там, где королю опасно.', 'The Church knows how to speak where it is dangerous for the king.', {'p': 5, 'g': -5}),
             ('Отказаться от покаяния.', 'Refuse to repent.', 'Гордая шея хорошо смотрится под короной. И под топором тоже.', 'A proud neck looks good under a crown. And under the ax too.', {'a': 5, 'p': -10}),
         ]),
    ]),
    # 23 — Плата лекарям
    ('borvin', [
        ('Лекари требуют оплату за работу в нижнем городе. Если мы не заплатим, они уйдут лечить богатых.',
         "Doctors demand payment for work in the lower city. If we don't pay, they will leave to treat the rich.",
         [
             ('Заплатить лекарям полностью.', 'Pay doctors in full.', 'Дорогое милосердие. Но живые налогоплательщики полезнее мёртвых.', 'Dear mercy. But living taxpayers are more useful than dead ones.', {'g': -15, 'p': 20}),
             ('Заплатить половину.', 'Pay half.', 'Половина платы — половина усердия. Иногда этого хватает.', 'Half the pay is half the effort. Sometimes this is enough.', {'g': -7, 'p': 8}),
             ('Приказать лечить бесплатно.', 'Order treatment for free.', 'Прекрасно для казны. Опасно для больных.', 'Great for the treasury. Dangerous for patients.', {'g': 5, 'p': -5, 'a': 5}),
             ('Позволить брать плату с больных.', 'Allow patients to be charged.', 'Казна вздохнёт. Бедняки, возможно, перестанут.', 'The treasury will sigh. Poor people might stop.', {'g': 3, 'p': -15}),
         ]),
    ]),
    # 24 — Трупы после переворота
    ('mira', [
        ('На улицах ещё находят тела после ночи переворота. Если их не похоронить быстро, город заболеет.',
         'Bodies are still being found on the streets after the night of the coup. If they are not buried quickly, the city will become sick.',
         [
             ('Организовать общие похороны.', 'Organize a general funeral.', 'Мёртвым уже всё равно. Живым — нет.', "The dead don't care anymore. Alive - no.", {'g': -10, 'p': 20}),
             ('Сжечь тела за городом.', 'Burn the bodies outside the city.', 'Быстро и безопасно. Но запах запомнят.', 'Fast and safe. But they will remember the smell.', {'g': -5, 'p': 15, 'a': 3}),
             ('Пусть семьи сами забирают тела.', 'Let the families pick up the bodies themselves.', 'Семьи получат горе. Город — заразу.', 'Families will suffer. The city is an infection.', {'g': 5, 'p': -10}),
             ('Скрыть тела в старых ямах.', 'Hide bodies in old pits.', 'Ямы не хранят тайны. Они выращивают болезни.', 'The pits keep no secrets. They breed diseases.', {'g': 10, 'p': -25}),
         ]),
    ]),
    # 25 — Королевский хлеб
    ('gromm', [
        ('Если каждый день раздавать у ворот немного хлеба от имени короля, люди начнут говорить мягче. Но хлеб не появляется из воздуха.',
         "If you distribute a little bread at the gate every day in the name of the king, people will begin to speak more softly. But bread doesn't appear out of thin air.",
         [
             ('Раздавать хлеб ежедневно.', 'Distribute bread daily.', 'Люди будут ждать вас не с камнями, а с мисками. Это лучше.', 'People will wait for you not with stones, but with bowls. This is better.', {'f': -20, 'p': 20}),
             ('Раздавать только детям и больным.', 'Distribute only to children and the sick.', 'Меньше хлеба, больше смысла. Хороший приказ.', 'Less bread, more meaning. Good order.', {'f': -10, 'p': 15}),
             ('Раздать один раз, для вида.', 'Distribute once, for show.', 'Для вида хватит. Для голода — нет.', 'Enough for appearance. For hunger - no.', {'f': -5, 'p': 5}),
             ('Не кормить сторонников старого короля.', "Don't feed the old king's supporters.", 'Голод не спрашивает, за кого человек вчера кричал.', 'Hunger does not ask for whom the person shouted yesterday.', {'f': 5, 'p': -15}),
         ]),
    ]),
    # 26 — Пойманный гонец
    ('varn', [
        ('Мы поймали гонца с письмом на север. Письмо зашифровано. Он говорит, что несёт семейные новости.',
         'We caught a messenger with a letter to the north. The letter is encrypted. He says he is bringing family news.',
         [
             ('Пытать гонца.', 'Torture the messenger.', 'Он заговорит. Вопрос только в том, будет ли это правда.', 'He will speak. The only question is whether it will be true.', {'a': 8, 'p': -5}),
             ('Заплатить писарям за расшифровку.', 'Pay the clerks to do the decoding.', 'Чернила иногда честнее крови.', 'Ink is sometimes more honest than blood.', {'g': -5}),
             ('Отпустить, но проследить.', 'Let go, but follow up.', 'Хорошо. Иногда лучше идти за нитью, чем рвать её.', 'Fine. Sometimes it is better to follow the thread than to break it.', {'g': -3, 'a': 3}),
             ('Что ты думаешь о письме?', 'What do you think of the letter?', '', '', None, 1),
         ]),
        ('Семейные новости не шифруют военным кодом. Если это письмо о тёте, тётя командует крепостью.',
         'Family news is not encrypted with military code. If this letter is about an aunt, the aunt commands the fortress.',
         [
             ('Расшифровать письмо.', 'Decipher the letter.', 'Разумно. Мёртвый гонец не приведёт нас к отправителю.', 'Reasonable. A dead messenger will not lead us to the sender.', {'g': -5, 'a': 5}),
             ('Казнить гонца и сжечь письмо.', 'Execute the messenger and burn the letter.', 'След исчезнет. Возможно, вместе с ответом.', 'The trail will disappear. Perhaps along with the answer.', {'a': 10, 'p': -8}),
             ('Подменить письмо.', 'Change the letter.', 'Опасная игра. Но враг может сам открыть дверь.', 'Dangerous game. But the enemy can open the door himself.', {'g': -5, 'a': 8}),
         ]),
    ]),
    # 27 — Слух о слабости
    ('edric', [
        ('Город говорит, что вы правите только потому, что генерал держит меч у вашей спины. Надо показать, кто здесь король.',
         'The city says you only rule because the general holds a sword at your back. We need to show who is the king here.',
         [
             ('Провести смотр армии.', 'Review the army.', 'Мечи блестят убедительно. Но они бросают длинные тени.', 'The swords shine convincingly. But they cast long shadows.', {'a': 10, 'g': -5}),
             ('Судить коррумпированного чиновника.', 'Try a corrupt official.', 'Хорошо. Справедливость громче парада, если выбрать правильную площадь.', 'Fine. Justice is louder than a parade if you choose the right square.', {'g': 5, 'p': 8}),
             ('Выйти на рынок без доспехов.', 'Enter the market without armor.', 'Смелость или безрассудство. Иногда народ не различает.', "Courage or recklessness. Sometimes people don't differentiate.", {'p': 12, 'a': -5}),
             ('Не отвечать на слухи.', "Don't respond to rumors.", 'Слухи любят пустое место. Вы оставили им зал.', 'Rumors love empty space. You left the hall for them.', {'a': -5, 'g': 3}),
         ]),
    ]),
    # 28 — Старые знамёна
    ('rudolf', [
        ('В казармах ещё висят знамёна прежнего короля. Солдаты говорят, что это память. Я говорю — это сомнение.',
         "The banners of the former king still hang in the barracks. The soldiers say it's a memory. I say it's doubt.",
         [
             ('Сжечь старые знамёна.', 'Burn the old banners.', 'Пламя быстро учит, какой цвет теперь главный.', 'The flame quickly teaches which color is now the main one.', {'a': 15, 'p': -5}),
             ('Сложить их в архив.', 'Put them in the archive.', 'Мягко. Но хотя бы они больше не будут смотреть на солдат.', "Soft. But at least they won't look at the soldiers anymore.", {'g': -3, 'p': 5}),
             ('Оставить, но добавить мой герб.', 'Leave it, but add my coat of arms.', 'Компромисс. Солдаты любят ясность больше.', 'Compromise. Soldiers like clarity more.', {'a': 5, 'g': -5}),
             ('Запретить обсуждать прежнего короля.', 'Prohibit discussion of the former king.', 'Запрет не убивает память. Но заставляет её говорить шёпотом.', 'Prohibition does not kill memory. But he makes her speak in a whisper.', {'a': 8, 'p': -8}),
         ]),
    ]),
    # 29 — Первый выбор власти
    ('edric', [
        ('Ваше Величество, королевство нельзя спасти всем сразу. В первый месяц нужно выбрать, что важнее: хлеб, меч, казна или жизнь людей.',
         "Your Majesty, the kingdom cannot be saved by everyone at once. In the first month you need to choose what is more important: bread, sword, treasury or people's lives.",
         [
             ('Сначала накормить город.', 'First feed the city.', 'Хлеб — тихий союзник. Пока он есть, люди ещё слушают.', 'Bread is a silent ally. As long as it exists, people are still listening.', {'f': 20, 'g': -15, 'p': 10}),
             ('Сначала укрепить армию.', 'First strengthen the army.', 'Меч защитит трон. Но не накормит город.', "The sword will protect the throne. But it won't feed the city.", {'a': 25, 'g': -15, 'f': -5}),
             ('Сначала наполнить казну.', 'First fill the treasury.', 'Золото даст время. Вопрос — кто переживёт это время.', 'Gold will give time. The question is who will survive this time.', {'g': 25, 'p': -10, 'f': -5}),
             ('Сначала остановить болезни.', 'Stop the disease first.', 'Живые подданные ещё могут простить. Мёртвые — только преследовать имя.', 'Living subjects can still forgive. The dead only pursue the name.', {'p': 25, 'g': -15}),
             ('Можно удержать всё сразу?', 'Can you hold everything at once?', '', '', None, 1),
         ]),
        ('Можно попытаться. Но равновесие — это не мягкий путь. Это канат над пропастью.',
         'You can try. But balance is not a gentle path. This is a rope over an abyss.',
         [
             ('Распределить силы поровну.', 'Distribute forces equally.', 'Осторожный выбор. Не великий, не позорный. Иногда именно такие переживают зиму.', 'Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.', {'f': 7, 'a': 7, 'g': 7, 'p': 7}),
             ('Нет, сначала армия.', 'No, first the army.', 'Тогда пусть солдаты помнят, что защищают королевство, а не только вашу дверь.', 'Then let the soldiers remember that they are protecting the kingdom, not just your door.', {'a': 20, 'g': -10, 'f': -5}),
             ('Нет, сначала здоровье.', 'No, health first.', 'Вы выбрали жизнь. Теперь нужно сделать так, чтобы живым было чем жить.', 'You chose life. Now we need to make sure that the living have something to live on.', {'p': 20, 'g': -12}),
         ]),
    ]),
    # 30 — Зерновой договор
    ('selena', [
        ('Мои караваны могут привезти зерно уже через три дня. Но я хочу исключительное право продавать хлеб в столице.',
         'My caravans can bring grain in just three days. But I want the exclusive right to sell bread in the capital.',
         [
             ('Дать тебе монополию.', 'Give you a monopoly.', 'Мудро. Народ получит хлеб, а я — благодарность в монетах.', 'Wise. The people will receive bread, and I will receive gratitude in coins.', {'f': 25, 'g': 10, 'p': -8}),
             ('Купить зерно без монополии.', 'Buy grain without a monopoly.', 'Вы покупаете еду, но не дружбу. Это дороже в будущем.', "You buy food, but not friendship. It's more expensive in the future.", {'f': 15, 'g': -15}),
             ('Корона не будет зависеть от купцов.', 'The crown will not depend on merchants.', 'Гордая корона. Посмотрим, насколько гордым бывает голод.', "Proud crown. Let's see how proud hunger can be.", {'g': 5, 'f': -15}),
             ('Почему у тебя уже есть столько зерна?', 'Why do you already have so much grain?', '', '', None, 1),
         ]),
        ('Потому что я покупаю, когда другие молятся. Деревни продавали дёшево, Ваше Величество. Я просто была быстрее ваших чиновников.',
         'Because I buy when others are praying. Villages were sold cheaply, Your Majesty. I was simply faster than your officials.',
         [
             ('Выкупить зерно по твоей цене.', 'Buy back the grain at your price.', 'Приятно иметь дело с короной, которая понимает рынок.', "It's nice to deal with a crown that understands the market.", {'f': 20, 'g': -20}),
             ('Продашь дешевле.', 'Sell \u200b\u200bit cheaper.', 'Ах, королевская торговля: сначала приказ, потом цена.', 'Ah, royal trade: first the order, then the price.', {'f': 18, 'g': -8, 'a': 3}),
             ('Конфисковать половину.', 'Confiscate half.', 'Вы получите зерно. И купцов, которые начнут прятать всё остальное.', 'You will receive grain. And merchants who will begin to hide everything else.', {'f': 25, 'g': -5, 'p': -8}),
         ]),
    ]),
    # 31 — Слишком много приговоров
    ('morwen', [
        ('Тюрьмы полны сторонников прежнего короля. Если казнить всех, площадь не успеют отмыть.',
         'The prisons are full of supporters of the former king. If everyone is executed, the square will not have time to be cleaned.',
         [
             ('Казнить главных.', 'Execute the main ones.', 'Разумный ужас. Его легче вынести, чем бойню.', "Intelligent horror. It's easier to bear than slaughter.", {'a': 10, 'p': -5}),
             ('Казнить всех.', 'Execute everyone.', 'Тогда пришлите больше палачей. Или меньше совести.', 'Then send more executioners. Or less conscience.', {'a': 20, 'p': -20}),
             ('Отправить их на работы.', 'Send them to work.', 'Живые предатели полезнее мёртвых, если держать их под цепью.', 'Living traitors are more useful than dead ones if you keep them under chain.', {'g': 10, 'a': -5, 'p': -5}),
             ('Сколько среди них настоящих заговорщиков?', 'How many of them are real conspirators?', '', '', None, 1),
         ]),
        ('Меньше половины. Но страх не спрашивает доказательств. Он работает и без них.',
         'Less than half. But fear does not ask for proof. It works without them.',
         [
             ('Казнить только доказанных.', 'Execute only those proven.', 'Редкий случай: правосудие и порядок не подрались насмерть.', 'A rare case: justice and order did not fight to the death.', {'a': 5, 'p': 3}),
             ('Страх полезнее правды.', 'Fear is more useful than truth.', 'Страх будет служить вам. Пока не найдёт нового хозяина.', 'Fear will serve you. Until he finds a new owner.', {'a': 15, 'p': -15}),
             ('Виновных — на казнь, остальных — на работы.', 'The guilty are to be executed, the rest are to be sent to work.', 'Хороший раздел. Топор и кирка получат каждый своё.', 'Nice section. Everyone will get their own ax and pickaxe.', {'a': 5, 'g': 8, 'p': -5}),
         ]),
    ]),
    # 32 — Бедные у монастыря
    ('arvel', [
        ('У ворот монастыря спят дети. Они просят не золота, а похлёбки. Разрешите открыть королевские запасы?',
         'Children are sleeping at the monastery gates. They ask not for gold, but for stew. May I open the royal reserves?',
         [
             ('Раздать похлёбку детям.', 'Distribute the stew to the children.', 'Сегодня они уснут не от слабости, а от тепла. Благодарю вас.', 'Today they will fall asleep not from weakness, but from warmth. Thank you.', {'f': -10, 'p': 15}),
             ('Раздать всем бедным.', 'Give to all the poor.', 'Это милость, которую город запомнит желудком.', 'This is a favor that the city will remember with its stomach.', {'f': -25, 'p': 25}),
             ('Пусть монастырь кормит их сам.', 'Let the monastery feed them itself.', 'Мы попробуем. Но пустая миска не становится полной от молитвы.', "We'll try. But an empty bowl does not become full from prayer.", {'f': 5, 'p': -8}),
             ('Почему они пришли к монастырю, а не к дворцу?', 'Why did they come to the monastery and not to the palace?', '', '', None, 1),
         ]),
        ('Потому что дворцовые ворота охраняют копья, а монастырские — только старые петли. Голодные идут туда, где их не бьют.',
         'Because the palace gates are guarded by spears, and the monastery gates are guarded only by old hinges. Hungry people go where they are not beaten.',
         [
             ('Открыть королевскую кухню у дворца.', 'Open the royal kitchen near the palace.', 'Тогда люди увидят не стены дворца, а руку короля.', 'Then people will see not the walls of the palace, but the hand of the king.', {'f': -20, 'p': 20, 'g': -5}),
             ('Передать зерно монастырю.', 'Donate the grain to the monastery.', 'Мы накормим их без вопросов. Это иногда лучшее правосудие.', 'We will feed them without question. This is sometimes the best justice.', {'f': -15, 'p': 18}),
             ('Поставить стражу у монастыря.', 'Place a guard at the monastery.', 'Стража разгонит толпу. Но не голод.', 'The guards will disperse the crowd. But not hunger.', {'a': 5, 'p': -8}),
         ]),
    ]),
    # 33 — Северная вежливость
    ('ingvar', [
        ('Мой князь поздравляет вас с короной. Он просит лишь малого: снизить пошлину на северные меха.',
         'My prince congratulates you on your crown. He asks only for a small thing: to reduce the duty on northern furs.',
         [
             ('Снизить пошлину.', 'Reduce the duty.', 'Север оценит вашу мудрость. И вашу нужду в друзьях.', 'The North will appreciate your wisdom. And your need for friends.', {'g': -10, 'f': 5}),
             ('Отказать.', 'Refuse.', 'Твёрдый ответ. Надеюсь, ваши границы так же тверды.', 'Solid answer. I hope your boundaries are just as strong.', {'g': 10, 'a': -5}),
             ('Повысить пошлину.', 'Increase the duty.', 'Смело. Мой князь любит смелых почти так же, как любит проверять их.', 'Boldly. My prince loves the brave almost as much as he loves testing them.', {'g': 20, 'a': -10}),
             ('Почему твой князь просит именно сейчас?', 'Why is your prince asking now?', '', '', None, 1),
         ]),
        ('Потому что новый король либо ищет друзей, либо показывает зубы. Мой князь хочет понять, кого он видит.',
         'Because the new king is either looking for friends or showing his teeth. My prince wants to understand who he sees.',
         [
             ('Передай: я ищу друзей.', "Tell me: I'm looking for friends.", 'Тогда север протянет руку. Холодную, но открытую.', 'Then the north will extend its hand. Cold, but open.', {'g': -8, 'f': 10, 'a': -3}),
             ('Передай: я показываю зубы.', "Tell me: I'm showing my teeth.", 'Я передам. И прослежу, чтобы он не рассмеялся слишком громко.', "I'll pass. And I'll make sure he doesn't laugh too loudly.", {'a': 10, 'g': 5, 'f': -5}),
             ('Передай: я торгую, но не кланяюсь.', 'Tell me: I trade, but I don’t bow.', 'Хорошая фраза. Её можно продать дороже меха.', 'Nice phrase. It can be sold for more than fur.', {'g': 5, 'f': 5}),
         ]),
    ]),
    # 34 — Дешёвое лекарство
    ('sivil', [
        ('Я могу приготовить лекарство для нижнего города. Оно горькое, пахнет болотом, но многие выживут.',
         'I can prepare medicine for the lower city. It is bitter and smells like a swamp, but many will survive.',
         [
             ('Купить лекарство для всех больных.', 'Buy medicine for all patients.', 'Щедрый приказ. Болото будет довольно, а больные — тем более.', 'Generous order. The swamp will be enough, and the sick - even more so.', {'g': -20, 'p': 25}),
             ('Купить только для детей.', 'Buy for children only.', 'Дети выживут. Их родители, возможно, будут достаточно благодарны, чтобы не проклинать вас вслух.', 'The children will survive. Their parents might be grateful enough not to curse you out loud.', {'g': -8, 'p': 12}),
             ('Пусть больные платят сами.', 'Let the patients pay themselves.', 'Как пожелаете. Болезнь редко спрашивает, есть ли у человека монеты.', 'As you wish. The disease rarely asks if a person has coins.', {'g': 5, 'p': -15}),
             ('Почему оно такое дорогое?', 'Why is it so expensive?', '', '', None, 1),
         ]),
        ('Потому что болотная лилия цветёт три ночи в году. А ещё потому что я не собираюсь умирать бедной, спасая ваших бедняков.',
         'Because the swamp lily blooms three nights a year. And also because I’m not going to die poor saving your poor.',
         [
             ('Заплатить твою цену.', 'Pay your price.', 'Мудро. Иногда жизнь дешевле купить, чем потом оплакивать.', 'Wise. Sometimes life is cheaper to buy than to mourn later.', {'g': -20, 'p': 25}),
             ('Снизь цену, или я заберу рецепт силой.', "Reduce the price or I'll take the recipe by force.", 'Ах, королевская медицина. Сначала угроза, потом лечение.', 'Ah, royal medicine. First the threat, then the treatment.', {'g': -8, 'p': 20, 'a': 3}),
             ('Продай рецепт короне.', 'Sell \u200b\u200bthe recipe to the crown.', 'Рецепт ваш. Если ваши люди перепутают лилию с крапивой, не зовите меня на похороны.', "The recipe is yours. If your people confuse a lily with a nettle, don't invite me to the funeral.", {'g': -12, 'p': 18}),
         ]),
    ]),
    # 35 — Военный сбор
    ('rudolf', [
        ('Армия держит трон, но трон кормит армию плохо. Введите военный сбор.',
         'The army holds the throne, but the throne feeds the army poorly. Enter the military levy.',
         [
             ('Ввести сбор со всех.', 'Introduce a fee for everyone.', 'Солдаты будут сыты. Остальные — осторожны.', 'The soldiers will be well fed. The rest are careful.', {'g': 25, 'a': 15, 'p': -15}),
             ('Ввести сбор только с богатых.', 'Introduce a tax only from the rich.', 'Меньше золота, меньше злости. Приемлемо.', 'Less gold, less anger. Acceptable.', {'g': 15, 'a': 8}),
             ('Отказать армии.', 'Refuse the army.', 'Армия умеет ждать. Но плохо умеет прощать.', 'The army knows how to wait. But he is bad at forgiving.', {'a': -15, 'g': 5}),
             ('Сколько армия продержится без сбора?', 'How long will the army last without gathering?', '', '', None, 1),
         ]),
        ('Три недели — с дисциплиной. Пять — с кражами. Семь — с мятежом. Я предпочёл бы не проверять восьмую.',
         "Three weeks - with discipline. Five - with thefts. Seven - with rebellion. I'd rather not check the eighth.",
         [
             ('Ввести временный сбор на месяц.', 'Introduce a temporary fee for a month.', 'Временный приказ часто живёт дольше королей. Но сейчас он нужен.', 'Temporary orders often outlast kings. But now he is needed.', {'g': 15, 'a': 10, 'p': -8}),
             ('Выдать армии зерно вместо золота.', 'Give the army grain instead of gold.', 'Солдат можно успокоить хлебом. Но ненадолго.', 'Soldiers can be calmed down with bread. But not for long.', {'a': 10, 'f': -15}),
             ('Пусть армия терпит.', 'Let the army endure.', 'Терпение — плохой паёк.', 'Patience is a bad ration.', {'g': 5, 'a': -20}),
         ]),
    ]),
    # 36 — Святые мощи
    ('malrik', [
        ('Если привезти святые мощи в столицу, люди забудут страх. Но дорога и охрана обойдутся дорого.',
         'If you bring the holy relics to the capital, people will forget their fear. But the road and security will be expensive.',
         [
             ('Организовать процессию.', 'Organize a procession.', 'Город увидит, что небеса ещё смотрят в его сторону.', 'The city will see that the heavens are still looking in its direction.', {'g': -15, 'p': 15}),
             ('Привезти мощи без праздника.', 'Bring the relics without a holiday.', 'Тихая святыня утешает меньше, но тоже утешает.', 'The quiet shrine is less comforting, but also comforting.', {'g': -5, 'p': 5}),
             ('Не тратить деньги на кости.', "Don't waste money on dice.", 'Не все кости мертвы для народа, Ваше Величество.', 'Not all bones are dead to the people, Your Majesty.', {'g': 8, 'p': -5}),
             ('Люди действительно верят в эти мощи?', 'Do people really believe in these powers?', '', '', None, 1),
         ]),
        ('Люди верят не в кости. Они верят, что кто-то над ними ещё не отвернулся.',
         "People don't believe in dice. They believe that someone above them has not yet turned their back.",
         [
             ('Пусть мощи прибудут с почестями.', 'May the relics arrive with honor.', 'Надежда войдёт в город раньше реликвии.', 'Hope will enter the city before the relic.', {'g': -15, 'p': 15}),
             ('Церковь оплатит половину.', 'The church will pay half.', 'Алтарь разделит цену. И запомнит, что трон умеет торговаться.', 'Altar will split the price. And he will remember that the throne knows how to bargain.', {'g': -7, 'p': 10}),
             ('Заменить процессию раздачей хлеба.', 'Replace the procession with the distribution of bread.', 'Хлеб — тоже молитва, если дать его вовремя.', 'Bread is also a prayer if given on time.', {'f': -10, 'p': 12}),
         ]),
    ]),
    # 37 — Продажа должностей
    ('borvin', [
        ('Есть купцы, готовые купить чиновничьи места. Они будут воровать, конечно. Но сначала заплатят нам.',
         'There are merchants ready to buy official positions. They will steal, of course. But first they will pay us.',
         [
             ('Продать должности.', 'Sell \u200b\u200bpositions.', 'Казна оживёт. Совесть пусть подышит позже.', 'The treasury will come to life. Let your conscience breathe later.', {'g': 30, 'p': -15}),
             ('Продать только мелкие должности.', 'Sell \u200b\u200bonly small positions.', 'Мелкое воровство — почти традиция.', 'Petty theft is almost a tradition.', {'g': 12, 'p': -5}),
             ('Запретить продажу должностей.', 'Prohibit the sale of positions.', 'Похвально. Убыточно, но похвально.', 'Commendable. Unprofitable, but commendable.', {'p': 5, 'g': -5}),
             ('Насколько сильно они будут воровать?', 'How much will they steal?', '', '', None, 1),
         ]),
        ('Настолько, насколько им позволят. То есть много, если мы будем смотреть в другую сторону. И умеренно, если будем брать долю.',
         'As much as they are allowed to. That is, a lot if we look the other way. And moderately, if we take a share.',
         [
             ('Продать и брать долю.', 'Sell \u200b\u200band take a share.', 'Грязный доход всё ещё доход.', 'Dirty income is still income.', {'g': 35, 'p': -20}),
             ('Продать, но назначить проверяющих.', 'Sell, but appoint inspectors.', 'Воры под присмотром воруют медленнее. Обычно.', 'Thieves steal more slowly under supervision. Usually.', {'g': 15, 'p': -5}),
             ('Потребовать оплату зерном.', 'Demand payment in grain.', 'Хорошо. Пусть хотя бы их честолюбие будет съедобным.', 'Fine. Let at least their ambition be edible.', {'f': 15, 'g': 5, 'p': -8}),
         ]),
    ]),
    # 38 — Раненые после казней
    ('mira', [
        ('После публичных наказаний на площади давка. Раненых больше, чем преступников. Это не правосудие, это бойня.',
         'After the public punishment there was a stampede in the square. There are more wounded than criminals. This is not justice, this is carnage.',
         [
             ('Запретить публичные казни.', 'Ban public executions.', 'Сегодня площадь станет менее кровавой. Это уже победа.', 'Today the square will become less bloody. This is already a victory.', {'p': 15, 'a': -8}),
             ('Оставить только закрытые казни.', 'Leave only closed executions.', 'Смерть за стеной всё ещё смерть. Но хотя бы без давки.', 'Death behind a wall is still death. But at least without the crush.', {'p': 8, 'a': -3}),
             ('Площадь должна видеть силу.', 'The area must see the strength.', 'Тогда площадь увидит ещё и сломанные рёбра.', 'Then the area will also see broken ribs.', {'a': 10, 'p': -15}),
             ('Толпа сама виновата?', "Is it the crowd's fault?", '', '', None, 1),
         ]),
        ('Толпа виновата только в том, что боится. А страх толкается, падает, ломает рёбра и давит детей.',
         "The crowd's only fault is that it is afraid. And fear pushes, falls, breaks ribs and crushes children.",
         [
             ('Ставить лекарей на площади.', 'Place healers in the square.', 'Если уж вы показываете смерть, пусть рядом будет хоть кто-то за жизнь.', 'If you are showing death, let there be at least someone nearby for life.', {'g': -5, 'p': 8, 'a': 3}),
             ('Перенести казни за город.', 'Move executions outside the city.', 'Палач уйдёт дальше. Люди вздохнут ближе.', 'The executioner will move on. People will breathe closer.', {'p': 10, 'a': -5}),
             ('Оставить всё как есть.', 'Leave everything as is.', 'Тогда зовите меня не к больным, а к вашим последствиям.', 'Then call me not to the sick, but to your consequences.', {'a': 8, 'p': -12}),
         ]),
    ]),
    # 39 — Крысы в амбаре
    ('gromm', [
        ('Крысы жрут лучше некоторых солдат. Если не очистить амбар, через неделю они станут жирнее казначея.',
         "Rats eat better than some soldiers. If you don't clean out the barn, in a week they will be fatter than the treasurer.",
         [
             ('Нанять крысоловов.', 'Hire rat catchers.', 'Наконец-то война, где я болею за убийц.', 'Finally a war where I root for the killers.', {'g': -8, 'f': 15, 'p': 5}),
             ('Пустить кошек в амбар.', 'Let the cats into the barn.', 'Кошки будут довольны. Крысы — удивлены.', 'The cats will be happy. Rats are surprised.', {'f': 8}),
             ('Использовать отраву.', 'Use poison.', 'Еда спасётся. Если люди потом не спасутся от еды.', 'The food will be saved. If people then do not escape from food.', {'f': 15, 'p': -8}),
             ('Насколько всё плохо?', 'How bad is it?', '', '', None, 1),
         ]),
        ('Одна крыса вчера утащила кусок сыра и посмотрела на меня так, будто я ей должен налоги.',
         'One rat stole a piece of cheese yesterday and looked at me as if I owed her taxes.',
         [
             ('Нанять лучших крысоловов.', 'Hire the best rat catchers.', 'Хорошо. Пусть хоть кто-то в этом дворце честно ловит воров.', 'Fine. Let at least someone in this palace honestly catch thieves.', {'g': -12, 'f': 20, 'p': 8}),
             ('Дать отраву, но закрыть амбар.', 'Give poison, but close the barn.', 'Риск есть. Но крысы не уйдут сами из вежливости.', 'There is a risk. But the rats will not leave on their own out of politeness.', {'f': 15, 'g': -3, 'p': -3}),
             ('Пусть солдаты чистят амбар.', 'Let the soldiers clean out the barn.', 'Солдаты будут ругаться. Крысы тоже.', 'The soldiers will swear. Rats too.', {'a': -5, 'f': 12}),
         ]),
    ]),
    # 40 — Шёпот в казармах
    ('varn', [
        ('Солдаты говорят, что вы слушаете купцов чаще, чем генералов. Это опасный шёпот.',
         'The soldiers say that you listen to merchants more often than to generals. This is a dangerous whisper.',
         [
             ('Устроить смотр армии.', 'Arrange an army review.', 'Парад заглушит шёпот. На время.', 'The parade will drown out the whispers. For a while.', {'a': 15, 'g': -8}),
             ('Раздать солдатам хлеб и пиво.', 'Distribute bread and beer to the soldiers.', 'Сытый солдат спорит мягче.', 'A well-fed soldier argues more softly.', {'a': 10, 'f': -10, 'g': -5}),
             ('Арестовать зачинщиков.', 'Arrest the instigators.', 'Некоторые шёпоты заканчиваются в подвале.', 'Some whispers end in the basement.', {'a': 5, 'p': -5}),
             ('Кто начал этот шёпот?', 'Who started this whispering?', '', '', None, 1),
         ]),
        ('Не один человек. Несколько костров, несколько кружек, одна фраза: ‘купцы едят, солдаты ждут’.',
         'Not just one person. Several fires, several mugs, one phrase: ‘merchants eat, soldiers wait’.',
         [
             ('Накормить казармы сегодня.', 'Feed the barracks today.', 'Хлеб закроет им рты лучше приказа.', 'Bread will shut their mouths better than an order.', {'a': 12, 'f': -12}),
             ('Найти говорунов и наказать.', 'Find the talkers and punish them.', 'Они замолчат. Остальные будут думать тише.', 'They will shut up. The rest will think more quietly.', {'a': 8, 'p': -5}),
             ('Выступить перед солдатами лично.', 'Address the soldiers in person.', 'Рискованно. Но солдаты любят видеть, кому служат.', 'Risky. But soldiers like to see who they serve.', {'a': 10, 'g': -3}),
         ]),
    ]),
    # 41 — Долги прежнего короля
    ('edric', [
        ('Кредиторы требуют выплаты долгов прежнего короля. Формально это не ваши долги. Но трон тот же.',
         "Creditors demand payment of the former king's debts. Formally, these are not your debts. But the throne is the same.",
         [
             ('Заплатить часть долгов.', 'Pay off some of your debts.', 'Вы покупаете доверие дорого. Но доверие редко продают дёшево.', 'You buy trust at a high price. But trust is rarely sold cheap.', {'g': -20, 'p': 5}),
             ('Отказаться платить.', 'Refuse to pay.', 'Казна улыбнётся. Торговцы — нет.', 'The treasury will smile. Merchants - no.', {'g': 10, 'f': -5}),
             ('Заплатить зерном.', 'Pay in grain.', 'Долг уйдёт. Запасы тоже.', 'The debt will go away. Stocks too.', {'f': -15, 'g': -5}),
             ('Эти бумаги настоящие?', 'Are these papers real?', '', '', None, 1),
         ]),
        ('Часть — настоящие. Часть — написаны слишком свежими чернилами для старого долга. Покойники, как правило, не занимают деньги вчера.',
         'Some are real. Some are written in ink too fresh for an old debt. Dead people, as a rule, do not borrow money yesterday.',
         [
             ('Оплатить только доказанные долги.', 'Pay only proven debts.', 'Справедливый путь. Не самый быстрый, но крепкий.', 'The fair way. Not the fastest, but strong.', {'g': -10, 'p': 5}),
             ('Объявить подделки изменой.', 'Declare counterfeits treason.', 'Кредиторы станут осторожнее. И злее.', 'Lenders will become more careful. And angrier.', {'g': 8, 'a': 5}),
             ('Не платить никому.', "Don't pay anyone.", 'Иногда отказ звучит как сила. Иногда как банкротство.', "Sometimes refusal sounds like strength. Sometimes it's like bankruptcy.", {'g': 10, 'f': -8}),
         ]),
    ]),
    # 42 — Караван с солью
    ('selena', [
        ('Соль сохраняет мясо и рыбу. Дайте мне охрану, и я привезу её в город.',
         'Salt preserves meat and fish. Give me security and I will bring her to the city.',
         [
             ('Дать военную охрану.', 'Provide military protection.', 'Соль придёт быстро. Солдаты тоже наконец сделают что-то полезное для торговли.', 'The salt will come quickly. The soldiers will also finally do something useful for trade.', {'f': 15, 'a': -5, 'g': -5}),
             ('Заплатить наёмникам.', 'Pay the mercenaries.', 'Дорого, но удобно. Наёмники задают меньше вопросов.', 'Expensive, but convenient. Mercenaries ask fewer questions.', {'f': 15, 'g': -15}),
             ('Пусть караван идёт сам.', 'Let the caravan go on its own.', 'Тогда молитесь, чтобы разбойники не любили соль.', 'Then pray that thieves do not like salt.', {'g': 5, 'f': -10}),
             ('Почему тебе нужна именно королевская охрана?', 'Why do you need royal security?', '', '', None, 1),
         ]),
        ('Потому что разбойники боятся знамени больше, чем моих людей. А ещё королевская охрана делает товар королевски дорогим.',
         'Because the robbers fear the banner more than my people. And the royal guard also makes the goods royally expensive.',
         [
             ('Дать охрану, но забрать часть соли.', 'Give protection, but take away some of the salt.', 'Справедливо. Неприятно, но справедливо.', 'Fair. Unpleasant, but fair.', {'f': 18, 'a': -5}),
             ('Дать охрану за плату.', 'Provide security for a fee.', 'Вы учитесь торговать. Это пугает.', "You are learning to trade. It's scary.", {'f': 15, 'a': -5, 'g': 5}),
             ('Нанимай охрану сама.', 'Hire your own security.', 'Конечно. А потом я назову цену, которая вам не понравится.', "Certainly. And then I'll name a price you won't like.", {'g': 5, 'f': -5}),
         ]),
    ]),
    # 43 — Сын мятежника
    ('morwen', [
        ('Отец мальчика поднял меч против вас. Сам мальчик слишком мал для меча, но достаточно взрослый, чтобы помнить.',
         "The boy's father raised his sword against you. The boy himself is too small for the sword, but old enough to remember.",
         [
             ('Отправить мальчика в монастырь.', 'Send the boy to a monastery.', 'Монастырские стены лучше тюремных. Для детей — точно.', 'Monastery walls are better than prison walls. For children - definitely.', {'g': -5, 'p': 5}),
             ('Отправить его в армию слугой.', 'Send him to the army as a servant.', 'Он вырастет рядом с мечами. Это либо лекарство, либо яд.', "He will grow up next to the swords. It's either medicine or poison.", {'a': 3, 'p': -3}),
             ('Казнить как предупреждение.', 'Execute as a warning.', 'Площадь поймёт. Простит ли — другой вопрос.', 'The area will understand. Whether he will forgive is another question.', {'a': 10, 'p': -20}),
             ('Он опасен?', 'Is he dangerous?', '', '', None, 1),
         ]),
        ('Сегодня — нет. Завтра — кто знает. У детей хорошая память, особенно если король оставил её сиротой.',
         'Today - no. Tomorrow - who knows. Children have a good memory, especially if the king left her an orphan.',
         [
             ('Пусть живёт под надзором.', 'Let him live under supervision.', 'Мягкий ошейник. Иногда он держит лучше железного.', 'Soft collar. Sometimes it holds better than iron.', {'g': -5, 'p': 5}),
             ('Отдать его монастырю.', 'Give it to the monastery.', 'Молитва может притупить месть. Иногда.', 'Prayer can dull vengeance. Sometimes.', {'g': -5, 'p': 8}),
             ('Не оставлять будущих врагов.', "Don't abandon future enemies.", 'Тогда у вас станет меньше врагов. И больше призраков.', 'Then you will have fewer enemies. And more ghosts.', {'a': 10, 'p': -20}),
         ]),
    ]),
    # 44 — Похоронные колокола
    ('arvel', [
        ('Колокола звонят каждый час. Люди считают мёртвых и теряют волю. Может, стоит запретить звон?',
         'The bells ring every hour. People count the dead and lose their will. Maybe we should ban ringing?',
         [
             ('Запретить похоронный звон.', 'Ban the death knell.', 'Город станет тише. Надеюсь, не бесчувственнее.', "The city will become quieter. I hope it's not more insensitive.", {'p': 5, 'a': 3}),
             ('Разрешить звон только утром.', 'Allow ringing only in the morning.', 'Один звон для памяти. Остальной день — для живых.', 'One ringing for memory. The rest of the day is for the living.', {'p': 8}),
             ('Пусть звонят.', 'Let them call.', 'Мёртвые заслужили память. Живые заслужили передышку.', 'The dead deserve to be remembered. The living deserve a break.', {'p': -3}),
             ('Разве молчание утешит живых?', 'Will silence comfort the living?', '', '', None, 1),
         ]),
        ('Нет. Но постоянный звон превращает город в могилу, где живые уже считают себя следующими.',
         'No. But the constant ringing turns the city into a grave, where the living already consider themselves next.',
         [
             ('Звонить только на рассвете.', 'Call only at dawn.', 'Пусть день начинается с памяти, а не заканчивается страхом.', 'Let the day begin with memory and not end with fear.', {'p': 8}),
             ('Заменить звон общей молитвой.', 'Replace the ringing with common prayer.', 'Молитва собирает людей мягче, чем колокол.', 'Prayer brings people together more gently than a bell.', {'p': 5, 'g': -3}),
             ('После каждого звона раздавать хлеб.', 'After each ringing, distribute bread.', 'Хлеб после скорби — милость, которую можно держать в руках.', 'Bread after tribulation is mercy that you can hold in your hands.', {'f': -8, 'p': 12}),
         ]),
    ]),
    # 45 — Северные лекари
    ('ingvar', [
        ('У нас есть лекари, знающие холодные болезни. Они могут помочь вашему городу. За разумную цену.',
         'We have doctors who know cold diseases. They can help your city. For a reasonable price.',
         [
             ('Нанять лекарей.', 'Hire doctors.', 'Северные руки холодные, но полезные.', 'Northern hands are cold but helpful.', {'g': -15, 'p': 20}),
             ('Обменять услуги на снижение пошлин.', 'Exchange services for reduced duties.', 'Взаимная выгода. Самая честная форма дружбы.', 'Mutual benefit. The most honest form of friendship.', {'g': -5, 'p': 15, 'f': 3}),
             ('Отказать чужеземцам.', 'Refuse strangers.', 'Ваш город болеет, но ваша гордость здорова.', 'Your city is sick, but your pride is healthy.', {'g': 5, 'p': -8}),
             ('Почему ты предлагаешь помощь так охотно?', 'Why do you offer help so readily?', '', '', None, 1),
         ]),
        ('Потому что больной сосед — плохой торговец и хороший источник заразы. Север умеет считать выгоду.',
         'Because a sick neighbor is a bad trader and a good source of infection. The North knows how to calculate benefits.',
         [
             ('Нанять всех лекарей.', 'Hire all healers.', 'Они прибудут до заката. Болезни лучше не давать фору.', 'They will arrive before sunset. It’s better not to give the disease a head start.', {'g': -15, 'p': 20}),
             ('Нанять двоих для проверки.', 'Hire two people to check.', 'Осторожно. Север уважает осторожных почти так же, как сильных.', 'Carefully. The North respects the cautious almost as much as the strong.', {'g': -6, 'p': 10}),
             ('Принять лекарей, но не пускать во дворец.', 'Receive doctors, but not let them into the palace.', 'Ваше доверие хромает, но всё же идёт.', 'Your trust is faltering, but still going strong.', {'g': -8, 'p': 12}),
         ]),
    ]),
    # 46 — Сонный порошок
    ('sivil', [
        ('У меня есть порошок для спокойного сна. Его можно дать больным. Или солдатам, которые слишком громко спорят.',
         'I have powder for restful sleep. It can be given to patients. Or soldiers who argue too loudly.',
         [
             ('Дать больным.', 'Give to the sick.', 'Сон — дешёвый лекарь. Мой порошок просто берёт за вход.', 'Sleep is a cheap healer. My powder just charges for entry.', {'g': -8, 'p': 10}),
             ('Дать беспокойным солдатам.', 'Give to restless soldiers.', 'Тихая казарма — редкое чудо. Не спрашивайте, насколько естественное.', "A quiet barracks is a rare miracle. Don't ask how natural.", {'a': -5, 'p': 3}),
             ('Купить запас для дворца.', 'Buy stock for the palace.', 'Дворцы спят хуже трущоб. Там больше подушек и больше страхов.', 'Palaces sleep worse than slums. There are more pillows and more fears.', {'g': -10}),
             ('Насколько он безопасен?', 'How safe is it?', '', '', None, 1),
         ]),
        ('В малой дозе человек спит. В большой — тоже спит, просто дольше, чем его родственникам хотелось бы.',
         'In a small dose, a person sleeps. In the big one, he also sleeps, just longer than his relatives would like.',
         [
             ('Купить малую партию для больных.', 'Buy a small batch for the sick.', 'Осторожно. Почти скучно. Но больным понравится.', 'Carefully. Almost boring. But the patients will like it.', {'g': -5, 'p': 8}),
             ('Купить много. Дозировку доверить тебе.', 'Buy a lot. Entrust the dosage to you.', 'Наконец-то король, который уважает опасные таланты.', 'Finally a king who respects dangerous talent.', {'g': -12, 'p': 12}),
             ('Запретить этот порошок.', 'Ban this powder.', 'Запреты тоже усыпляют. В основном разум.', 'Prohibitions also put you to sleep. Mainly the mind.', {'p': 3, 'g': 3}),
         ]),
    ]),
    # 47 — Солдаты на рынках
    ('rudolf', [
        ('На рынках дерутся за хлеб. Дайте мне солдат, и через час там будет порядок.',
         'In the markets they fight for bread. Give me soldiers, and in an hour there will be order there.',
         [
             ('Отправить вооружённых солдат.', 'Send armed soldiers.', 'Порядок придёт быстро. С криками, но быстро.', 'Order will come quickly. With shouts, but quickly.', {'a': 5, 'p': -10, 'f': 5}),
             ('Отправить солдат без оружия.', 'Send soldiers without weapons.', 'Солдаты без оружия — это почти просьба. Но попробуем.', "Soldiers without weapons is almost a request. But let's try.", {'a': -3, 'p': 5}),
             ('Поручить рынки старостам.', 'Entrust markets to elders.', 'Старосты хороши для споров о цене. Не для драки.', 'Headmen are good for arguing about price. Not for a fight.', {'p': 5, 'f': -5}),
             ('Ты называешь это порядком или страхом?', 'Do you call it order or fear?', '', '', None, 1),
         ]),
        ('На рынке голодный человек не различает эти слова. Он видит копьё и вспоминает, что у него есть ноги.',
         'At the market, a hungry person does not distinguish between these words. He sees a spear and remembers that it has legs.',
         [
             ('Пусть солдаты наведут порядок.', 'Let the soldiers restore order.', 'Будет порядок. Пусть даже с синяками.', 'There will be order. Even with bruises.', {'a': 8, 'p': -10, 'f': 5}),
             ('Солдаты охраняют хлеб, но не трогают людей.', 'The soldiers guard the bread, but do not touch the people.', 'Тонкая грань. Я прослежу, чтобы её не перешагнули слишком часто.', "A fine line. I'll make sure it's not stepped over too often.", {'a': 3, 'p': 5}),
             ('Поставить раздатчиков еды.', 'Set up food distributors.', 'Хлеб вместо дубинки. Мягко. Иногда работает.', 'Bread instead of a club. Soft. Sometimes it works.', {'f': -10, 'p': 10}),
         ]),
    ]),
    # 48 — Грязная вода и грех
    ('malrik', [
        ('Один лекарь говорит, что болезни рождаются в грязной воде, а не в грехах. Народ слушает его слишком внимательно.',
         'One healer says that diseases are born in dirty water, not in sins. People listen to him too closely.',
         [
             ('Защитить лекаря.', 'Protect the doctor.', 'Вы выбираете воду против проповеди. Храм это заметит.', 'You are choosing water over preaching. The temple will notice this.', {'p': 15, 'g': -3}),
             ('Заставить лекаря извиниться.', 'Make the doctor apologize.', 'Смирение полезно даже тем, кто моет руки чаще души.', 'Humility is beneficial even to those who wash their hands more often than their souls.', {'p': -3, 'g': 3}),
             ('Отдать лекаря церковному суду.', 'Give the doctor to the church court.', 'Алтарь разберётся. Быстро или назидательно.', 'The altar will sort itself out. Quick or edifying.', {'p': -15, 'a': 5}),
             ('Чистая вода противоречит вере?', 'Does clean water contradict faith?', '', '', None, 1),
         ]),
        ('Нет. Но когда люди верят только воде, они перестают бояться греха. А без страха храм пустеет.',
         'No. But when people believe only in water, they cease to be afraid of sin. And without fear the temple is empty.',
         [
             ('Лекарь говорит о воде, храм — о душе.', 'The doctor speaks about water, the temple speaks about the soul.', 'Разделение мудрое. Если обе стороны помнят своё место.', 'The division is wise. If both sides remember their place.', {'p': 10, 'g': -3}),
             ('Лекарь должен говорить осторожнее.', 'The doctor must speak more carefully.', 'Осторожные слова редко жгут мосты.', 'Careful words rarely burn bridges.', {'p': 3}),
             ('Очистить колодцы и провести службу.', 'Clean the wells and conduct a service.', 'Вода для тела, молитва для страха. Хороший порядок.', 'Water for the body, prayer for fear. Good order.', {'g': -10, 'p': 18}),
         ]),
    ]),
    # 49 — Серебро храмов
    ('borvin', [
        ('В храмах много серебра. Если взять часть ‘в долг’, казна оживёт.',
         'There is a lot of silver in the temples. If you borrow part of it, the treasury will come to life.',
         [
             ('Взять храмовое серебро.', 'Take the temple silver.', 'Казна оживёт. Храмы начнут кричать, но не сразу.', 'The treasury will come to life. The temples will start screaming, but not right away.', {'g': 25, 'p': -10}),
             ('Попросить пожертвование.', 'Ask for a donation.', 'Просьба приносит меньше, зато реже приводит к камням.', 'Asking brings less, but less often leads to stones.', {'g': 10}),
             ('Не трогать храмы.', "Don't touch the temples.", 'Святость сохранена. Пустота тоже.', 'Sanctity preserved. Emptiness too.', {'g': -5, 'p': 5}),
             ('Это вызовет бунт?', 'Will this cause a riot?', '', '', None, 1),
         ]),
        ('Не сразу. Сначала будут проповеди. Потом плачущие старухи. Потом камни в сборщиков налогов. Но серебро будет уже у нас.',
         'Not right away. First there will be sermons. Then the crying old women. Then stones hit the tax collectors. But we will already have the silver.',
         [
             ('Взять быстро и тайно.', 'Take it quickly and secretly.', 'Тайна дешевле войны. До тех пор, пока остаётся тайной.', 'Secret is cheaper than war. As long as it remains a mystery.', {'g': 20, 'p': -8}),
             ('Взять только у богатых монастырей.', 'Take only from rich monasteries.', 'Умеренное святотатство. Почти финансовая реформа.', 'Moderate sacrilege. Almost financial reform.', {'g': 15, 'p': -5}),
             ('Не трогать храмы.', "Don't touch the temples.", 'Иногда король покупает покой тем, что ничего не берёт.', 'Sometimes a king buys peace by not taking anything.', {'g': -5, 'p': 5}),
         ]),
    ]),
    # 50 — Родильный дом
    ('mira', [
        ('Женщины рожают в грязи и холоде. Дайте мне старый склад, я сделаю из него дом для рожениц.',
         'Women give birth in dirt and cold. Give me an old warehouse, I will turn it into a home for women in labor.',
         [
             ('Дать склад и деньги.', 'Give me a warehouse and money.', 'Вы спасаете тех, кто ещё даже не успел испугаться вашего правления.', 'You save those who have not yet even had time to be afraid of your rule.', {'g': -15, 'p': 25, 'f': -5}),
             ('Дать склад без денег.', 'Give a warehouse without money.', 'Стены лучше улицы. Но стены без лекарей спасают не всех.', 'Walls are better than streets. But walls without healers do not save everyone.', {'p': 10, 'f': -3}),
             ('Склад нужен для зерна.', 'A warehouse is needed for grain.', 'Хлеб важен. Но мёртвые младенцы его не едят.', "Bread is important. But dead babies don't eat it.", {'f': 10, 'p': -10}),
             ('Сколько жизней это спасёт?', 'How many lives will this save?', '', '', None, 1),
         ]),
        ('Я не богиня, чтобы считать заранее. Но грязный пол забирает младенцев чаще, чем мечи забирают солдат.',
         "I'm not a goddess to count in advance. But a dirty floor takes away babies more often than swords take away soldiers.",
         [
             ('Дать склад и деньги.', 'Give me a warehouse and money.', 'Тогда сегодня корона сделала что-то по-настоящему живое.', 'Then today the crown did something truly lively.', {'g': -15, 'p': 25, 'f': -5}),
             ('Дать маленькое помещение при лазарете.', 'Provide a small room at the infirmary.', 'Мало. Но лучше, чем ничего, а с этого иногда начинается спасение.', 'Few. But it’s better than nothing, and sometimes salvation begins with this.', {'g': -5, 'p': 12}),
             ('Сейчас важнее зерно.', 'Now the grain is more important.', 'Тогда я вернусь, когда цена этого выбора начнёт плакать.', 'Then I will return when the price of this choice begins to cry.', {'f': 10, 'p': -10}),
         ]),
    ]),
    # 51 — Мясо с юга
    ('gromm', [
        ('Пришло мясо с юга. Дёшево. Слишком дёшево. Оно пахнет победой над здравым смыслом.',
         'The meat came from the south. Cheap. Too cheap. It smells like a victory over common sense.',
         [
             ('Купить и накормить бедных.', 'Buy and feed the poor.', 'Бедные поедят. Потом, возможно, пожалеют.', 'The poor will eat. Then, perhaps, they will regret it.', {'f': 15, 'g': -5, 'p': -15}),
             ('Купить только для собак и армии.', 'Buy only for dogs and army.', 'Собаки простят. Солдаты — не факт.', 'Dogs will forgive. Soldiers are not a fact.', {'f': 8, 'a': -3, 'p': -5}),
             ('Отказаться от мяса.', 'Avoid meat.', 'Хорошо. Иногда лучшая еда — та, которую не съели.', "Fine. Sometimes the best food is the one you don't eat.", {'g': 3, 'p': 5}),
             ('Ты думаешь, оно испорчено?', "Do you think it's ruined?", '', '', None, 1),
         ]),
        ('Если мясо пахнет так, будто уже познакомилось со смертью, я предпочитаю не знакомить его с желудками.',
         'If the meat smells like it has already met death, I prefer not to introduce it to the stomachs.',
         [
             ('Сжечь мясо.', 'Burn the meat.', 'Дым лучше похоронной песни.', 'Smoke is better than a funeral song.', {'g': -5, 'p': 10}),
             ('Засолить и рискнуть.', 'Pickle and take your chances.', 'Соль многое скрывает. Но не всё прощает.', 'Salt hides a lot. But not everything forgives.', {'f': 8, 'p': -8}),
             ('Вернуть продавцам.', 'Return to sellers.', 'Пусть они сами ужинают своей выгодой.', 'Let them dine on their own profit.', {'g': 3}),
         ]),
    ]),
    # 52 — Чёрный рынок
    ('varn', [
        ('Часть королевского зерна исчезает и появляется ночью на чёрном рынке. Кто-то внутри дворца кормит воров.',
         "Some of the king's grain disappears and appears on the black market at night. Someone inside the palace is feeding the thieves.",
         [
             ('Устроить облаву.', 'Organize a raid.', 'Поймаем кого-то точно. Вопрос — вора или удобную жертву.', "We'll catch someone for sure. The question is - a thief or a convenient victim.", {'f': 10, 'a': 5, 'p': -5}),
             ('Поставить тайную слежку.', 'Set up secret surveillance.', 'Тихая охота. Мне нравится.', 'Silent hunt. I like.', {'f': 8, 'g': -5}),
             ('Повысить наказания за кражу зерна.', 'Increase penalties for grain theft.', 'Страх уменьшит кражи. Или сделает воров осторожнее.', 'Fear will reduce theft. Or it will make thieves more careful.', {'f': 5, 'a': 5, 'p': -8}),
             ('Ты знаешь, кто помогает ворам?', 'Do you know who helps the thieves?', '', '', None, 1),
         ]),
        ('Знаю, откуда пахнет. От складских ключей и людей, которые слишком быстро разбогатели после переворота.',
         'I know where the smell comes from. From warehouse keys and people who got rich too quickly after the coup.',
         [
             ('Арестовать складских смотрителей.', 'Arrest the warehouse supervisors.', 'Жёстко. Но ключи любят строгие руки.', 'Hard. But keys love strict hands.', {'f': 10, 'a': 5, 'p': -3}),
             ('Подменить мешки и проследить путь.', 'Replace bags and trace the path.', 'Хорошо. Пусть воры сами приведут нас домой.', 'Fine. Let the thieves lead us home themselves.', {'f': 12, 'g': -5}),
             ('Закрыть дело, чтобы не позорить дворец.', 'Close the case so as not to disgrace the palace.', 'Позор останется. Просто сытый.', 'The shame will remain. Just full.', {'g': 5, 'f': -10}),
         ]),
    ]),
    # 53 — Памятник прежнему королю
    ('edric', [
        ('На главной площади стоит статуя прежнего короля. Одни кладут к ней цветы, другие плюют. Что делать?',
         'There is a statue of the former king in the main square. Some put flowers on it, others spit on it. What to do?',
         [
             ('Снести статую.', 'Demolish the statue.', 'Вы уберёте камень. Память придётся убирать дольше.', 'You will remove the stone. It will take longer to clear the memory.', {'a': 8, 'p': -8}),
             ('Оставить статую.', 'Leave the statue.', 'Мягкий жест. Сторонники силы назовут его слабостью.', 'A gentle gesture. Proponents of strength will call it weakness.', {'p': 5, 'a': -5}),
             ('Переплавить её на монеты.', 'Melt it down into coins.', 'История станет мелкой монетой. Символично, но опасно.', 'History will become small coin. Symbolic, but dangerous.', {'g': 15, 'p': -5}),
             ('Что бы сделал мудрый король?', 'What would a wise king do?', '', '', None, 1),
         ]),
        ('Мудрый король не спорит с камнем. Он переносит его туда, где память перестаёт быть знаменем.',
         'A wise king does not argue with a stone. He takes it to a place where memory ceases to be a banner.',
         [
             ('Перенести статую в старый сад.', 'Move the statue to the old garden.', 'Память останется, но перестанет командовать площадью.', 'The memory will remain, but will no longer command the area.', {'g': -5, 'p': 5}),
             ('Поставить рядом новый герб.', 'Place a new coat of arms next to it.', 'Вы не стираете прошлое. Вы ставите над ним свою печать.', "You don't erase the past. You put your stamp on it.", {'g': -5, 'a': 3}),
             ('Снести ночью.', 'Demolish at night.', 'Ночь скроет рабочих. Но утром все увидят пустоту.', 'The night will hide the workers. But in the morning everyone will see emptiness.', {'a': 5, 'p': -5}),
         ]),
    ]),
    # 54 — Хлебные цены
    ('selena', [
        ('Если вы ограничите цену на хлеб, пекари спрячут муку. Если не ограничите, бедные начнут есть кору.',
         "If you cap the price of bread, bakers will hide the flour. If you don't limit it, the poor will start eating bark.",
         [
             ('Ограничить цену.', 'Limit the price.', 'Бедные будут благодарны. Пекари начнут считать тайники.', 'The poor will be grateful. The bakers will start counting the caches.', {'p': 15, 'f': -10}),
             ('Не вмешиваться в рынок.', 'Do not interfere with the market.', 'Рынок выживет. Не все люди — но рынок точно.', 'The market will survive. Not all people - but the market certainly is.', {'g': 10, 'p': -15}),
             ('Компенсировать пекарям разницу.', 'Compensate bakers for the difference.', 'Вот это язык торговли. Наконец-то.', 'This is the language of trade. Finally.', {'g': -15, 'p': 15}),
             ('Как удержать цену и не потерять муку?', 'How to keep the price and not lose flour?', '', '', None, 1),
         ]),
        ('Очень просто: вы платите пекарям, пекари улыбаются народу, народ благодарит вас, а казначей плачет в подушку.',
         'It’s very simple: you pay the bakers, the bakers smile at the people, the people thank you, and the treasurer cries into his pillow.',
         [
             ('Компенсировать пекарям.', 'Compensate bakers.', 'Дорого, красиво, почти разумно.', 'Expensive, beautiful, almost reasonable.', {'g': -15, 'p': 15}),
             ('Дать пекарям зерно вместо золота.', 'Give bakers grain instead of gold.', 'Хлеб за хлеб. Простая сделка, редкость для дворца.', 'Bread for bread. A simple transaction, rare for the palace.', {'f': -10, 'p': 12}),
             ('Пусть рынок решает сам.', 'Let the market decide for itself.', 'Рынок решит. Потом толпа тоже.', 'The market will decide. Then the crowd too.', {'g': 10, 'p': -15}),
         ]),
    ]),
    # 55 — Просьба о быстрой смерти
    ('morwen', [
        ('Один приговорённый просит не вешать его на площади, а убить быстро и тихо. Он говорит, что у него дети.',
         'One condemned man asks not to hang him in the square, but to kill him quickly and quietly. He says he has children.',
         [
             ('Разрешить тихую казнь.', 'Allow silent execution.', 'Меньше зрелища. Больше человеческого.', 'Less spectacle. More human.', {'p': 3, 'a': -3}),
             ('Публичная казнь нужна порядку.', 'Public execution is necessary for order.', 'Площадь получит урок. Дети — память.', 'The area will receive a lesson. Children are memories.', {'a': 8, 'p': -8}),
             ('Заменить казнь каторгой.', 'Replace execution with hard labor.', 'Живой преступник ещё может приносить пользу.', 'A living criminal can still be useful.', {'g': 8, 'a': -5}),
             ('Он действительно виновен?', 'Is he really guilty?', '', '', None, 1),
         ]),
        ('Виновен достаточно, чтобы умереть по приказу. Но недостаточно, чтобы я запомнил его имя.',
         'Guilty enough to die as ordered. But not enough for me to remember his name.',
         [
             ('Пересмотреть дело.', 'Reconsider the case.', 'Редко топор ждёт бумаги. Но сегодня подождёт.', 'Rarely does an ax wait for paper. But today it will wait.', {'g': -5, 'p': 8}),
             ('Казнить тихо.', 'Execute quietly.', 'Тихая смерть всё равно смерть. Но без толпы.', 'A silent death is still death. But no crowd.', {'p': 3, 'a': -3}),
             ('Казнить публично.', 'Execute publicly.', 'Понял. Площадь снова будет учиться страху.', 'Understood. The square will learn fear again.', {'a': 8, 'p': -8}),
         ]),
    ]),
    # 56 — Суп против проповеди
    ('arvel', [
        ('Голодный человек не слышит молитвы. Дайте нам зерно, и мы будем кормить людей перед службами.',
         'A hungry man does not hear prayer. Give us grain and we will feed people before services.',
         [
             ('Дать зерно монастырю.', 'Give grain to the monastery.', 'Спасибо. Сегодня проповедь начнётся с ложки супа.', 'Thank you. Today the sermon will begin with a spoonful of soup.', {'f': -15, 'p': 20}),
             ('Дать немного зерна.', 'Give some grain.', 'Немного тепла лучше полного холода.', 'A little warmth is better than complete cold.', {'f': -7, 'p': 8}),
             ('Пусть сначала молятся, потом едят.', 'Let them pray first, then eat.', 'Пустой желудок плохо держит молитву.', 'An empty stomach does not hold prayer well.', {'f': 5, 'p': -10}),
             ('Ты хочешь кормить или обращать?', 'Do you want to feed or convert?', '', '', None, 1),
         ]),
        ('Я хочу, чтобы они дожили до завтра. Если завтра они будут молиться — хорошо. Если просто будут дышать — уже чудо.',
         'I want them to live until tomorrow. If they pray tomorrow, good. If they just breathe, it’s already a miracle.',
         [
             ('Дать зерно без условий.', 'Give grain without conditions.', 'Это милосердие. Без крючка. Редкая вещь при дворе.', 'This is mercy. No hook. A rare thing at court.', {'f': -15, 'p': 20}),
             ('Дать зерно только детям и больным.', 'Give grain only to children and the sick.', 'Я приму. Хотя голодные взрослые тоже люди.', "I'll accept. Although hungry adults are people too.", {'f': -8, 'p': 12}),
             ('Не тратить запасы.', "Don't waste supplies.", 'Тогда я буду молиться, чтобы запасы простили вас.', 'Then I will pray that the supplies will forgive you.', {'f': 5, 'p': -10}),
         ]),
    ]),
    # 57 — Слухи о слабом короле
    ('ingvar', [
        ('На севере говорят, что вы заняты больными и хлебом, а не мечом. Я, конечно, этому не верю.',
         "In the north they say that you are busy with the sick and with bread, not with the sword. I, of course, don't believe this.",
         [
             ('Показать военный парад.', 'Show a military parade.', 'Красивые ряды. Север любит считать копья.', 'Beautiful rows. The North loves to count spears.', {'a': 15, 'g': -10}),
             ('Показать полные амбары.', 'Show full barns.', 'Хлеб тоже оружие. Особенно зимой.', 'Bread is also a weapon. Especially in winter.', {'f': -5, 'g': -3}),
             ('Подарить золото и отправить домой.', 'Give gold and send it home.', 'Щедрый жест. Или дорогая просьба молчать.', 'A generous gesture. Or dear request to remain silent.', {'g': -15}),
             ('Что ещё говорят на севере?', 'What else do they say in the north?', '', '', None, 1),
         ]),
        ('Говорят, что новый король тушит пожары внутри дворца и потому не видит дыма на границе.',
         'They say that the new king puts out fires inside the palace and therefore does not see the smoke on the border.',
         [
             ('Укрепить северные крепости.', 'Strengthen the northern fortresses.', 'Север увидит камень. Камень всегда понятнее слов.', 'The north will see the stone. Stone is always clearer than words.', {'a': 20, 'g': -20}),
             ('Отправить разведчиков.', 'Send scouts.', 'Хорошо. Глаза дешевле войны.', 'Fine. Eyes are cheaper than war.', {'a': 8, 'g': -5}),
             ('Не поддаваться на провокацию.', "Don't give in to provocation.", 'Спокойствие достойно короля. Если за ним есть сила.', 'Peace fit for a king. If there is power behind him.', {'g': 5, 'a': -5}),
         ]),
    ]),
    # 58 — Яд для крыс или людей
    ('sivil', [
        ('У меня есть сильная отрава. Для крыс, разумеется. Хотя крысы бывают разными.',
         'I have a strong poison. For rats, of course. Although rats are different.',
         [
             ('Купить для амбаров.', 'Buy for barns.', 'Крысы умрут. Надеюсь, повара умеют читать предупреждения.', 'The rats will die. I hope the chefs know how to read the warnings.', {'g': -5, 'f': 10, 'p': -3}),
             ('Купить тайно для дворца.', 'Buy secretly for the palace.', 'Дворцовые крысы ходят на двух ногах. Понимаю.', 'Palace rats walk on two legs. Understand.', {'g': -10}),
             ('Запретить продажу отравы.', 'Ban the sale of poison.', 'Запретите. Крысы, правда, указов не читают.', 'Forbid it. Rats, however, do not read decrees.', {'p': 5, 'f': -5}),
             ('Ты предлагаешь мне яд?', 'Are you offering me poison?', '', '', None, 1),
         ]),
        ('Я предлагаю средство. Яд — это когда средство попадает не в ту чашу.',
         'I offer a remedy. Poison is when the remedy ends up in the wrong cup.',
         [
             ('Купить только для амбаров.', 'Buy for barns only.', 'Как скучно. Как благоразумно.', 'How boring. How prudent.', {'g': -5, 'f': 10, 'p': -3}),
             ('Купить и держать во дворце.', 'Buy and keep in the palace.', 'Пусть ваши враги надеются, что вы не умеете выбирать чаши.', 'Let your enemies hope that you do not know how to choose cups.', {'g': -10, 'a': 3}),
             ('Передать отраву стражникам.', 'Give the poison to the guards.', 'О, теперь яд будет под присмотром людей с мечами. Что может пойти не так?', 'Oh, now the poison will be under the supervision of men with swords. What could go wrong?', {'a': 5, 'g': -5}),
         ]),
    ]),
    # 59 — Солдаты и больные
    ('rudolf', [
        ('Лазареты забиты гражданскими. Раненым солдатам некуда лечь. Кто важнее для трона?',
         'The infirmaries are filled with civilians. Wounded soldiers have nowhere to go. Who is more important for the throne?',
         [
             ('Освободить места для солдат.', 'Make room for soldiers.', 'Солдаты будут помнить. Гражданские тоже.', 'The soldiers will remember. Civilians too.', {'a': 15, 'p': -15}),
             ('Оставить гражданских.', 'Leave the civilians.', 'Милосердие к городу. Горечь в казармах.', 'Mercy for the city. Bitterness in the barracks.', {'p': 15, 'a': -10}),
             ('Расширить лазарет.', 'Expand the infirmary.', 'Дорого. Но хотя бы никто не сможет сказать, что вы выбрали мёртвых.', 'Expensive. But at least no one can say that you chose the dead.', {'g': -15, 'p': 10, 'a': 5}),
             ('Ты хочешь, чтобы я выбрал между мечом и народом?', 'Do you want me to choose between the sword and the people?', '', '', None, 1),
         ]),
        ('Нет. Я хочу, чтобы вы поняли: меч, который истекает кровью на полу, завтра не защитит народ.',
         'No. I want you to understand: a sword that bleeds on the floor will not protect the people tomorrow.',
         [
             ('Расширить лазарет.', 'Expand the infirmary.', 'Хороший приказ. Даже я не стану спорить.', "Good order. Even I won't argue.", {'g': -15, 'p': 10, 'a': 5}),
             ('Половину мест солдатам.', 'Half the places are for soldiers.', 'Половина справедливости лучше полной ссоры.', 'Half justice is better than a complete quarrel.', {'a': 8, 'p': -5}),
             ('Солдаты первыми.', 'Soldiers first.', 'Армия отплатит верностью. Остальные — как смогут.', 'The army will repay with loyalty. The rest - as best they can.', {'a': 15, 'p': -15}),
         ]),
    ]),
    # 60 — Молитва перед казнью
    ('malrik', [
        ('Даже предатель имеет душу. Пусть священник говорит с каждым перед смертью.',
         'Even a traitor has a soul. Let the priest speak to everyone before they die.',
         [
             ('Разрешить.', 'Allow.', 'Милость перед смертью — всё ещё милость.', 'Mercy before death is still mercy.', {'p': 5, 'g': -3}),
             ('Только важным заключённым.', 'Only important prisoners.', 'Души, выходит, тоже делятся по рангу.', 'Souls, it turns out, are also divided by rank.', {'p': 2}),
             ('Нет. Быстрая казнь дешевле.', 'No. A quick execution is cheaper.', 'Дешёвая смерть часто дорого обходится живым.', 'A cheap death often comes at a high cost to the living.', {'g': 5, 'a': 3, 'p': -5}),
             ('Зачем утешать предателей?', 'Why console traitors?', '', '', None, 1),
         ]),
        ('Мы утешаем не предателей. Мы утешаем тех, кто смотрит и думает: ‘если меня обвинят, умру ли я как зверь?’',
         'We do not console traitors. We console those who look and think, ‘If I am accused, will I die like an animal?’',
         [
             ('Разрешить молитву всем.', 'Allow everyone to pray.', 'Сегодня страх станет чуть менее звериным.', 'Today fear will become a little less animalistic.', {'p': 6, 'g': -3}),
             ('Только тем, кто признаёт вину.', 'Only to those who admit guilt.', 'Исповедь в обмен на милость. Строго, но понятно.', 'Confession in exchange for mercy. Strict, but understandable.', {'p': 3, 'a': 2}),
             ('Отказать.', 'Refuse.', 'Тогда топор будет говорить последним. И громче всех.', 'Then the ax will speak last. And loudest of all.', {'g': 5, 'p': -5}),
         ]),
    ]),
    # 61 — Скрытый запас
    ('borvin', [
        ('Я нашёл старый тайник прежнего короля. Там золото, но оно отмечено печатями старой династии.',
         'I found the old hiding place of the former king. There is gold there, but it is marked with the seals of the old dynasty.',
         [
             ('Переплавить золото.', 'Melt down the gold.', 'Старый король станет новой монетой. Иронично и полезно.', 'The old king will become the new coin. Ironic and useful.', {'g': 25}),
             ('Использовать его тайно.', 'Use it secretly.', 'Тайные деньги — лучшие деньги. Пока их не найдут.', 'Secret money is the best money. Until they are found.', {'g': 15}),
             ('Показать народу и назвать трофеем.', 'Show it to the people and call it a trophy.', 'Смело. Но некоторые всё ещё любят старые печати.', 'Boldly. But some people still love old seals.', {'g': 20, 'a': 5, 'p': -5}),
             ('Почему прежний король его спрятал?', 'Why did the former king hide it?', '', '', None, 1),
         ]),
        ('Короли прячут золото по двум причинам: чтобы пережить беду или чтобы сбежать от неё. Покойный не успел ни того, ни другого.',
         'Kings hide gold for two reasons: to survive trouble or to escape from it. The deceased did not manage to do either of these things.',
         [
             ('Переплавить всё.', 'Melt everything down.', 'Прекрасно. У золота нет памяти после плавильни.', 'Wonderful. Gold has no memory after the smelter.', {'g': 25}),
             ('Оставить часть как резерв.', 'Leave some as a reserve.', 'Мудро. Тайный сундук иногда вернее совета.', 'Wise. A secret chest is sometimes better than advice.', {'g': 15}),
             ('Раздать часть народу.', 'Give some away to the people.', 'Щедрость из чужого тайника. Народ не станет уточнять.', "Generosity from someone else's stash. People won't elaborate.", {'g': 8, 'p': 10}),
         ]),
    ]),
    # 62 — Слишком много похлёбки
    ('mira', [
        ('Люди едят всё, что им дают. Вчерашняя бесплатная похлёбка была слишком жирной для голодных желудков. Теперь половина улицы болеет.',
         "People eat whatever is given to them. Yesterday's free stew was too rich for hungry stomachs. Now half the street is sick.",
         [
             ('Организовать правильные кухни.', 'Organize proper kitchens.', 'Накормить — мало. Нужно ещё не убить добротой.', 'Feeding is not enough. You still need to not kill with kindness.', {'g': -10, 'f': -5, 'p': 20}),
             ('Прекратить раздачи еды.', 'Stop food distribution.', 'Вы остановите боль в животах. И вернёте голод.', 'You will stop stomach pain. And you will bring back hunger.', {'f': 10, 'p': -10}),
             ('Поручить рецепты поварам.', 'Entrust recipes to chefs.', 'Пусть готовят для больных, а не для пира.', 'Let them cook for the sick, not for a feast.', {'f': -5, 'p': 12}),
             ('Еда может вредить голодным?', 'Can food harm the hungry?', '', '', None, 1),
         ]),
        ('После долгого голода желудок похож на раненого. Если бросить в него пир, он не благодарит — он сдаётся.',
         'After a long hunger, the stomach looks like a wounded one. If you throw a feast at him, he doesn’t thank you - he gives up.',
         [
             ('Создать лечебные кухни.', 'Create healing kitchens.', 'Это спасёт больше, чем кажется. Тихо, без фанфар.', 'This will save more than it seems. Quietly, without fanfare.', {'g': -10, 'f': -8, 'p': 22}),
             ('Раздавать только жидкую похлёбку.', 'Distribute only liquid stew.', 'Хорошо. Простая еда — лучшее лекарство для пустого живота.', 'Fine. Simple food is the best medicine for an empty belly.', {'f': -5, 'p': 12}),
             ('Не менять ничего.', "Don't change anything.", 'Тогда зовите меня не к кухне, а к мёртвым.', 'Then call me not to the kitchen, but to the dead.', {'p': -12}),
         ]),
    ]),
    # 63 — Суп из репы
    ('gromm', [
        ('Если заменить мясо репой, город протянет дольше. Но солдаты уже называют это ‘помоями мира’.',
         'If you replace meat with turnips, the city will last longer. But the soldiers are already calling it ‘the slop of the world’.',
         [
             ('Перевести всех на репу.', 'Transfer everyone to turnip.', 'Все будут недовольны одинаково. В этом есть почти справедливость.', 'Everyone will be equally unhappy. There is almost justice in this.', {'f': 20, 'a': -10, 'p': 5}),
             ('Только бедных кормить репой.', 'Only feed the poor turnips.', 'Бедные снова получат самую дешёвую часть милости.', 'The poor will again receive the cheapest share of mercy.', {'f': 10, 'p': -5}),
             ('Дворец тоже ест репу.', 'The palace also eats turnips.', 'Вот это я хочу увидеть: придворные против корнеплода.', 'This is what I want to see: courtiers versus root crops.', {'f': 8, 'p': 8}),
             ('Можно сделать репу вкусной?', 'Is it possible to make turnips tasty?', '', '', None, 1),
         ]),
        ('Можно, если добавить масло, соль и надежду. Масла мало, соль дорогая, надежду пусть поставляет трон.',
         'You can if you add oil, salt and hope. Oil is scarce, salt is expensive, let the throne provide hope.',
         [
             ('Добавить соль из запасов.', 'Add salt from stock.', 'Соль спасёт вкус. Немного честь тоже.', 'Salt will save the taste. A little honor too.', {'f': 10, 'g': -5, 'p': 5}),
             ('Сделать репу общей пищей.', 'Make turnips a common food.', 'Тогда никто не скажет, что голод имеет сословие.', 'Then no one will say that hunger has a class.', {'f': 20, 'a': -10, 'p': 5}),
             ('Оставить мясо армии.', 'Leave the meat to the army.', 'Солдаты будут довольны. Репа — нет, её снова унизили.', 'The soldiers will be happy. Turnip - no, she was humiliated again.', {'f': -15, 'a': 8}),
         ]),
    ]),
    # 64 — Подкупленная стража
    ('varn', [
        ('Один стражник пропустил ночью купеческую телегу без досмотра. Говорит, что взял только две монеты.',
         "One guard let a merchant's cart through at night without inspection. He says he only took two coins.",
         [
             ('Казнить стражника.', 'Execute the guard.', 'Стража поймёт цену двух монет.', 'The guards will understand the value of two coins.', {'a': 8, 'p': -8}),
             ('Высечь и оставить служить.', 'Carve and leave to serve.', 'Боль учит быстрее приказа.', 'Pain teaches faster than command.', {'a': 5}),
             ('Уволить и оштрафовать.', 'Fire and fine.', 'Мягко. Но не бессмысленно.', "Soft. But it's not pointless.", {'g': 5, 'a': -3}),
             ('Что было в телеге?', 'What was in the cart?', '', '', None, 1),
         ]),
        ('Он клянётся, что не знает. А я не люблю клятвы людей, которые продают глаза за две монеты.',
         "He swears he doesn't know. And I don’t like the oaths of people who sell their eyes for two coins.",
         [
             ('Найти телегу и конфисковать груз.', 'Find the cart and confiscate the cargo.', 'Поймаем след, пока колёса ещё свежие.', "Let's catch the trail while the wheels are still fresh.", {'f': 10, 'g': -3, 'a': 3}),
             ('Допросить стражника жёстко.', 'Interrogate the guard harshly.', 'Он вспомнит. Или придумает. Придётся различать.', "He will remember. Or he'll come up with an idea. We'll have to differentiate.", {'a': 8, 'p': -5}),
             ('Поставить двойной досмотр.', 'Introduce double inspection.', 'Дороже. Но ворота наконец станут воротами.', 'More expensive. But the gate will finally become a gate.', {'a': 5, 'g': -5}),
         ]),
    ]),
    # 65 — Суд или приказ
    ('edric', [
        ('Люди боятся не наказаний, а наказаний без суда. Даже узурпатору нужен закон.',
         'People are not afraid of punishment, but of punishment without trial. Even a usurper needs a law.',
         [
             ('Создать временный суд.', 'Create a temporary court.', 'Закон — медленный щит. Но щит всё же.', 'Law is a slow shield. But still a shield.', {'g': -10, 'p': 15}),
             ('Судить только важных обвиняемых.', 'Try only important defendants.', 'Не справедливость, но её тень. Иногда тень лучше темноты.', 'Not justice, but its shadow. Sometimes shade is better than darkness.', {'g': -5, 'p': 5}),
             ('Королевский приказ выше суда.', 'The royal command is superior to the court.', 'Так говорят сильные короли. И те, кто недолго ими остаётся.', 'This is what strong kings say. And those who don’t remain them for long.', {'a': 10, 'p': -15}),
             ('Закон поможет удержать трон?', 'Will the law help maintain the throne?', '', '', None, 1),
         ]),
        ('Меч удержит дверь сегодня. Закон убедит людей завтра не искать другую дверь.',
         'The sword will hold the door today. The law will convince people tomorrow not to look for another door.',
         [
             ('Создать временный суд.', 'Create a temporary court.', 'Мудро. Страх подчиняет, закон привязывает.', 'Wise. Fear subdues, law binds.', {'g': -10, 'p': 15}),
             ('Назначить быстрые военные суды.', 'Appoint speedy military courts.', 'Быстро. Опасно. Но хотя бы не совсем без формы.', 'Fast. Dangerous. But at least not completely without form.', {'a': 10, 'p': -8}),
             ('Не тратить время на закон.', "Don't waste time on the law.", 'Тогда править будет не закон, а ближайшая рука с мечом.', 'Then it will not be the law that will rule, but the nearest hand with the sword.', {'a': 8, 'p': -12}),
         ]),
    ]),
    # 66 — Зерно в обмен на охрану
    ('selena', [
        ('Мои склады полны. Но дорога к ним опасна. Дайте мне солдат — получите хлеб.',
         'My warehouses are full. But the road to them is dangerous. Give me soldiers and you will get bread.',
         [
             ('Дать солдат.', 'Give soldiers.', 'Прекрасно. Ваши мечи приведут мой хлеб к вашим голодным.', 'Wonderful. Your swords will bring my bread to your hungry.', {'f': 20, 'a': -8}),
             ('Заплатить частной охране.', 'Pay private security.', 'Дорого, но без лишнего военного сапога на торговой дороге.', 'Expensive, but without an extra military boot on the trade road.', {'f': 15, 'g': -12}),
             ('Забрать склады силой.', 'Take warehouses by force.', 'Вы получите зерно. И купцов, которые научатся прятать лучше.', 'You will receive grain. And merchants who will learn to hide better.', {'f': 25, 'a': 5, 'p': -10}),
             ('Ты угрожаешь короне голодом?', 'Are you threatening the crown with famine?', '', '', None, 1),
         ]),
        ('Я? Никогда. Голод угрожает сам. Я лишь стою рядом с ключом от амбара.',
         "I? Never. Hunger threatens itself. I'm just standing next to the barn key.",
         [
             ('Дать солдат и забрать часть зерна налогом.', 'Give soldiers and tax some of the grain.', 'Жёстко, но умно. Мне это неприятно, значит, вы учитесь.', 'Tough, but smart. This is unpleasant for me, so you are learning.', {'f': 22, 'a': -8, 'g': 3}),
             ('Купить зерно честно.', 'Buy grain honestly.', 'Честность приятна. Особенно когда оплачена полностью.', "Honesty feels good. Especially when it's paid in full.", {'f': 15, 'g': -15}),
             ('Отказаться от сделки.', 'Refuse the deal.', 'Тогда пусть ваши амбары докажут, что они полнее моей гордости.', 'Then let your barns prove that they are fuller than my pride.', {'g': 5, 'f': -10}),
         ]),
    ]),
    # 67 — Зрелище для порядка
    ('morwen', [
        ('После каждой казни толпа становится тише. Хотите сделать казни еженедельными?',
         'After each execution the crowd becomes quieter. Do you want to make executions weekly?',
         [
             ('Да, страх нужен.', 'Yes, fear is needed.', 'Тогда я подготовлю площадь. И людей, которые потом её отмоют.', 'Then I will prepare the area. And people who will then wash it.', {'a': 15, 'p': -20}),
             ('Только для доказанных предателей.', 'Only for proven traitors.', 'Умеренный ужас. Его легче проглотить.', "Moderate horror. It's easier to swallow.", {'a': 5, 'p': -5}),
             ('Нет. Страх быстро гниёт.', 'No. Fear quickly rots.', 'Редкий приказ, от которого моя работа уменьшается.', 'A rare order that reduces my work.', {'p': 10, 'a': -5}),
             ('Толпа правда становится тише?', 'Is the crowd really getting quieter?', '', '', None, 1),
         ]),
        ('Тише — да. Вернее — нет. Молчание не всегда верность. Иногда это просто стиснутые зубы.',
         "Quiet - yes. Or rather, no. Silence is not always true. Sometimes it's just clenched teeth.",
         [
             ('Казни только по большим делам.', 'Executions are only carried out in major cases.', 'Топор будет редким. Оттого, возможно, страшнее.', "The ax will be rare. That's why it's probably scarier.", {'a': 5, 'p': -5}),
             ('Заменить часть казней каторгой.', 'Replace some executions with hard labor.', 'Кирка вместо петли. У неё тоже есть воспитательный звук.', 'A pick instead of a loop. She also has an educational sound.', {'g': 10, 'a': -5}),
             ('Продолжать публичные казни.', 'Continue public executions.', 'Площадь будет молчать. Но не спать.', "The square will be silent. But don't sleep.", {'a': 15, 'p': -20}),
         ]),
    ]),
    # 68 — Больные солдаты
    ('arvel', [
        ('В монастырь принесли солдат с жаром. Если мы примем их, заболеют бедные. Если нет — умрут защитники трона.',
         'The soldiers were brought to the monastery with fervor. If we accept them, the poor will get sick. If not, the defenders of the throne will die.',
         [
             ('Принять солдат.', 'Receive soldiers.', 'Мы примем их. И будем молиться, чтобы болезнь не пошла дальше.', 'We will accept them. And we will pray that the disease does not go further.', {'a': 10, 'p': -8}),
             ('Оставить места для бедных.', 'Leave places for the poor.', 'Бедные выживут. Солдаты, возможно, не простят.', 'The poor will survive. The soldiers may not forgive.', {'p': 10, 'a': -8}),
             ('Разделить монастырь перегородками.', 'Divide the monastery with partitions.', 'Деревянная стена лучше каменного сердца.', 'A wooden wall is better than a stone heart.', {'g': -5, 'a': 3, 'p': 3}),
             ('Что говорит твоя совесть?', 'What does your conscience say?', '', '', None, 1),
         ]),
        ('Она говорит, что у солдата и нищего жар одинаковый. Но койка у нас одна.',
         'She says that a soldier and a beggar have the same fever. But we have one bed.',
         [
             ('Принимать самых тяжёлых, независимо от звания.', 'Accept the heaviest, regardless of rank.', 'Это похоже на справедливость. Она редко удобна.', "This seems like justice. It's rarely convenient.", {'p': 8, 'a': 3}),
             ('Солдаты важнее.', 'Soldiers are more important.', 'Я подчинюсь. Но болезнь не уважает мундиры.', 'I will obey. But illness does not respect uniforms.', {'a': 10, 'p': -8}),
             ('Бедные важнее.', 'The poor are more important.', 'Тогда я буду молиться и за бедных, и за вашу армию.', 'Then I will pray for both the poor and your army.', {'p': 10, 'a': -8}),
         ]),
    ]),
    # 69 — Подарок с севера
    ('ingvar', [
        ('Мой князь прислал вам бочки солёной рыбы. Бесплатно. Почти бесплатно. Он просит принять его дружбу.',
         'My prince has sent you barrels of salted fish. For free. Almost free. He asks to accept his friendship.',
         [
             ('Принять подарок.', 'Accept the gift.', 'Мудро. Рыба не любит ждать, как и дружба.', "Wise. Pisces doesn't like to wait, and neither does friendship.", {'f': 15, 'g': 3}),
             ('Принять и отправить золото в ответ.', 'Accept and send gold in return.', 'Щедрый ответ. Север любит равные жесты.', 'Generous answer. The North loves equal gestures.', {'f': 15, 'g': -10}),
             ('Отказаться.', 'Refuse.', 'Осторожность достойна уважения. Голод — нет.', 'Caution deserves respect. Hunger - no.', {'g': 3, 'f': -5}),
             ('Что значит ‘почти бесплатно’?', "What does 'almost free' mean?", '', '', None, 1),
         ]),
        ('Это значит, что сегодня вы принимаете рыбу, а завтра мой князь напомнит, что друзья не закрывают мосты и порты.',
         'This means that today you accept fish, and tomorrow my prince will remind you that friends do not close bridges and ports.',
         [
             ('Принять рыбу и дружбу.', 'Accept fish and friendship.', 'Тогда север запомнит открытые двери.', 'Then the north will remember the open doors.', {'f': 15, 'g': 3, 'a': -3}),
             ('Заплатить за рыбу как за товар.', 'Pay for fish as if it were a commodity.', 'Так подарок становится сделкой. Чисто, но холодно.', 'This is how a gift becomes a transaction. Clean but cold.', {'f': 15, 'g': -8}),
             ('Отказаться.', 'Refuse.', 'Передам князю, что ваша гордость сытее вашего города.', 'I will tell the prince that your pride is richer than your city.', {'g': 3, 'f': -5}),
         ]),
    ]),
    # 70 — Цена противоядия
    ('sivil', [
        ('В городе пошли странные отравления. Я могу сделать противоядие. Но редкие травы стоят дорого.',
         'There have been strange poisonings in the city. I can make an antidote. But rare herbs are expensive.',
         [
             ('Купить травы.', 'Buy herbs.', 'Жизнь снова победила кошелёк. Какая редкость.', 'Life has defeated the wallet again. What a rarity.', {'g': -15, 'p': 20}),
             ('Купить малый запас.', 'Buy small stock.', 'Малый запас спасает малую часть беды.', 'A small reserve saves a small part of the trouble.', {'g': -6, 'p': 8}),
             ('Обвинить тебя в создании яда.', 'Accuse you of creating poison.', 'Удобно. Когда не знаешь, кто виноват, хватай того, кто знает травы.', 'Comfortable. When you don’t know who is to blame, grab someone who knows herbs.', {'a': 5, 'p': -5}),
             ('Откуда ты знаешь, что это яд?', "How do you know it's poison?", '', '', None, 1),
         ]),
        ('Потому что люди не синеют от плохих мыслей. Хотя, признаю, ваши подданные стараются.',
         "Because people don't turn blue from bad thoughts. Although, I admit, your subjects are trying.",
         [
             ('Купить полный запас.', 'Buy full stock.', 'Хорошо. Смерть сегодня заработает меньше.', 'Fine. Death will earn less today.', {'g': -15, 'p': 20}),
             ('Купить малый запас и искать источник.', 'Buy a small supply and look for a source.', 'Разумно. Лечить воду, не найдя колодец, глупо.', 'Reasonable. Treating water without finding a well is stupid.', {'g': -8, 'p': 12}),
             ('Заставить продать дешевле.', 'Make them sell cheaper.', 'Королевская скидка всегда пахнет железом.', 'Royal discount always smells like iron.', {'g': -5, 'p': 12, 'a': 3}),
         ]),
    ]),
    # 71 — Военные кухни
    ('rudolf', [
        ('Если армия сама будет управлять кухнями, солдаты не останутся голодными.',
         'If the army itself runs the kitchens, the soldiers will not go hungry.',
         [
             ('Передать кухни военным.', 'Transfer the kitchens to the military.', 'Солдаты будут кормить солдат. Так надёжнее.', "The soldiers will feed the soldiers. It's more reliable this way.", {'a': 15, 'f': -10}),
             ('Оставить кухни поварам.', 'Leave the kitchens to the chefs.', 'Тогда пусть повара помнят: голодный солдат — плохой гость.', 'Then let the cooks remember: a hungry soldier is a bad guest.', {'f': 5, 'a': -5}),
             ('Разделить контроль.', 'Share control.', 'Компромисс. Я не люблю их, но этот хотя бы съедобен.', "Compromise. I don't like them, but at least this one is edible.", {'a': 5, 'f': 5, 'g': -3}),
             ('Ты хочешь контролировать хлеб?', 'Do you want to control the bread?', '', '', None, 1),
         ]),
        ('Я хочу контролировать то, без чего солдат перестаёт быть солдатом и становится голодным мужиком с копьём.',
         'I want to control what, without which a soldier ceases to be a soldier and becomes a hungry man with a spear.',
         [
             ('Дать армии отдельные склады.', 'Give the army separate warehouses.', 'Этого хватит. Пока склады не опустеют.', "That's enough. Until the warehouses are empty.", {'a': 10, 'f': -8}),
             ('Назначить общего смотрителя.', 'Appoint a general caretaker.', 'Если он будет честен, это сработает. Если нет — я узнаю.', "If he's honest, it will work. If not, I'll find out.", {'a': 5, 'f': 5, 'g': -3}),
             ('Сократить армейские пайки.', 'Reduce army rations.', 'Тогда готовьте не только амбары, но и виселицы.', 'Then prepare not only the barns, but also the gallows.', {'f': 15, 'a': -20}),
         ]),
    ]),
    # 72 — День поста
    ('malrik', [
        ('Объявите день поста. Люди будут есть меньше и думать о душе.',
         'Announce a day of fasting. People will eat less and think about their souls.',
         [
             ('Объявить общий пост.', 'Announce a general post.', 'Город смирится. Хотя голодные смиряются хуже сытых.', 'The city will come to terms. Although the hungry humble themselves worse than the well-fed.', {'f': 15, 'p': -5}),
             ('Пост только для дворца.', 'This post is for the palace only.', 'Хороший пример сверху. Народ любит, когда дворец тоже терпит.', 'Good example from above. People love it when the palace tolerates it too.', {'f': 5, 'p': 5}),
             ('Пост для армии тоже.', 'Post for the army too.', 'Сильное смирение. Солдаты назовут его иначе.', 'Strong humility. The soldiers will call him differently.', {'f': 20, 'a': -15}),
             ('Голодные и так постятся.', 'The hungry are already fasting.', '', '', None, 1),
         ]),
        ('Именно поэтому пост должен начать дворец. Когда сытый отказывается от мяса, голодный хотя бы видит, что его страдание заметили.',
         'That is why the palace should begin the fast. When a well-fed person refuses meat, a hungry person at least sees that his suffering has been noticed.',
         [
             ('Пост только для дворца.', 'This post is for the palace only.', 'Смирение наверху иногда лечит злость внизу.', 'Humility above sometimes cures anger below.', {'f': 5, 'p': 8}),
             ('Общий пост с раздачей похлёбки бедным.', 'A general fast with the distribution of stew to the poor.', 'Мудро. Пустота в желудке не должна быть смертным приговором.', "Wise. An empty stomach doesn't have to be a death sentence.", {'f': 5, 'p': 10}),
             ('Отказаться от поста.', 'Refuse the post.', 'Тогда пусть дворец хотя бы не пирует слишком громко.', 'Then at least let the palace not feast too loudly.', {'f': -5, 'p': 3}),
         ]),
    ]),
    # 73 — Плата за безопасность
    ('borvin', [
        ('Горожане готовы платить за патрули в своих районах. По сути, безопасность станет услугой.',
         'Citizens are willing to pay for patrols in their areas. Essentially, security will become a service.',
         [
             ('Ввести платные патрули.', 'Introduce paid patrols.', 'Безопасность наконец начнёт окупаться.', 'Security will finally start to pay off.', {'g': 20, 'a': 8, 'p': -10}),
             ('Патрули бесплатны.', 'Patrols are free.', 'Благородно. Убыточно. Очень по-королевски.', 'Noble. Unprofitable. Very royal.', {'g': -10, 'a': 5, 'p': 10}),
             ('Патрули только в опасных районах.', 'Patrols only in dangerous areas.', 'Разумный расход. Я почти доволен.', "Reasonable expense. I'm almost satisfied.", {'g': -5, 'a': 5, 'p': 5}),
             ('А бедные районы?', 'What about poor areas?', '', '', None, 1),
         ]),
        ('Бедные районы заплатят меньше. Или не заплатят вовсе. Тогда они получат меньше безопасности. Математика жестока, но честна.',
         "Poor areas will pay less. Or they won't pay at all. Then they will have less security. Mathematics is cruel, but fair.",
         [
             ('Богатые платят за себя и бедных.', 'The rich pay for themselves and the poor.', 'Прекрасно. Налог, который можно назвать милосердием.', 'Wonderful. A tax that can be called mercy.', {'g': 10, 'a': 8, 'p': 8}),
             ('Кто платит, тот получает патруль.', 'Whoever pays gets the patrol.', 'Чистая система. Грязные последствия.', 'Clean system. Dirty consequences.', {'g': 20, 'a': 8, 'p': -10}),
             ('Патрули бесплатны для всех.', 'Patrols are free for everyone.', 'Казна вздохнёт с болью. Город — с облегчением.', 'The treasury will sigh with pain. The city is relieved.', {'g': -10, 'a': 5, 'p': 10}),
         ]),
    ]),
    # 74 — Сгоревшая аптека
    ('mira', [
        ('Ночью сгорела аптека. Люди говорят, что это кара богов, но я вижу следы масла.',
         "The pharmacy burned down at night. People say it's a punishment from the gods, but I see traces of oil.",
         [
             ('Расследовать поджог.', 'Investigate arson.', 'Спасибо. Огонь редко загорается сам там, где есть выгода.', 'Thank you. Fire rarely lights itself where there is benefit.', {'g': -5, 'p': 5}),
             ('Восстановить аптеку за счёт казны.', 'Restore the pharmacy at the expense of the treasury.', 'Люди получат лекарства раньше, чем слухи станут ядом.', 'People will get medicine before rumors become poison.', {'g': -15, 'p': 20}),
             ('Передать дело страже.', 'Hand over the matter to the guards.', 'Пусть ищут. Только бы не нашли удобного бедняка.', 'Let them search. If only they wouldn’t find a convenient poor man.', {'a': 5, 'g': -3}),
             ('Кому выгоден поджог?', 'Who benefits from arson?', '', '', None, 1),
         ]),
        ('Тому, кто продаёт лекарства дороже. Или тому, кто хочет, чтобы больные шли не к лекарю, а к алтарю.',
         'To the one who sells medicines at a higher price. Or to someone who wants the sick to go not to the doctor, but to the altar.',
         [
             ('Расследовать торговцев лекарствами.', 'Investigate drug dealers.', 'Ищите деньги. Они часто стоят рядом с огнём.', 'Look for money. They often stand next to fire.', {'g': -5, 'p': 8}),
             ('Восстановить аптеку и поставить охрану.', 'Restore the pharmacy and provide security.', 'Теперь больные получат дверь, которая не сгорит без свидетелей.', 'Now patients will receive a door that will not burn without witnesses.', {'g': -18, 'p': 22, 'a': 3}),
             ('Не раздувать дело.', "Don't make a big deal.", 'Тогда следующий огонь будет смелее.', 'Then the next fire will be bolder.', {'g': 5, 'p': -10}),
         ]),
    ]),
    # 75 — Кухня для заключённых
    ('gromm', [
        ('Заключённых почти не кормят. Если они умрут в камерах, Морвену работы меньше, но вонь дойдёт до тронного зала.',
         'Prisoners are hardly fed. If they die in the cells, Morven will have less work to do, but the stench will reach the throne room.',
         [
             ('Кормить заключённых нормально.', 'Feeding prisoners is fine.', 'Не милость, так санитария. Иногда они похожи.', "It's not mercy, it's sanitation. Sometimes they are similar.", {'f': -10, 'p': 10}),
             ('Кормить только тех, кто работает.', 'Feed only those who work.', 'Пища за труд. Тюремная справедливость.', 'Food for work. Prison justice.', {'f': -5, 'g': 5}),
             ('Не тратить еду на предателей.', "Don't waste food on traitors.", 'Тогда камеры скоро начнут готовить свой собственный запах.', 'Then the cameras will soon begin to prepare their own scent.', {'f': 10, 'p': -15}),
             ('Они правда умирают от голода?', 'Are they really dying of hunger?', '', '', None, 1),
         ]),
        ('Пока нет. Пока они только грызут корки, стены и друг друга глазами. Но ещё пару дней — и начнут пахнуть как проблема.',
         'Not yet. For now they only gnaw at crusts, walls and each other with their eyes. But a couple more days and it will start to smell like a problem.',
         [
             ('Кормить всех заключённых.', 'Feed all prisoners.', 'Хорошо. Мёртвые враги опасны меньше, но пахнут хуже.', 'Fine. Dead enemies are less dangerous, but smell worse.', {'f': -10, 'p': 10}),
             ('Отправить заключённых на работы за еду.', 'Send prisoners to work for food.', 'Пусть хотя бы роют не себе могилы.', 'At least let them dig their own graves.', {'g': 10, 'f': -5, 'p': -3}),
             ('Пусть терпят.', 'Let them endure.', 'Терпение не кормит. Зато разлагается медленно.', 'Patience does not feed. But it decomposes slowly.', {'f': 10, 'p': -15}),
         ]),
    ]),
    # 76 — Городские ворота ночью
    ('varn', [
        ('Через ночные ворота идут телеги без печатей. Если закрыть ворота, город станет безопаснее, но еда задержится.',
         'Carts without seals go through the night gate. If you close the gates, the city will be safer, but the food will be delayed.',
         [
             ('Закрыть ворота ночью.', 'Close the gate at night.', 'Безопаснее. Но утро встретит нас с очередью голодных телег.', 'Safer. But the morning will greet us with a line of hungry carts.', {'a': 8, 'f': -10, 'p': 3}),
             ('Оставить ворота открытыми.', 'Leave the gate open.', 'Еда войдёт. Надеюсь, не вместе с ножами.', 'Food will come in. Hopefully not with knives.', {'f': 10, 'a': -8}),
             ('Проверять каждую телегу.', 'Check every cart.', 'Медленно, но надёжно. Ворота станут глазами.', 'Slow but sure. The gates will become eyes.', {'a': 5, 'g': -5, 'f': 3}),
             ('Что чаще везут ночью — еду или опасность?', 'What is more often carried at night - food or danger?', '', '', None, 1),
         ]),
        ('И то, и другое. Беда в том, что мешки с зерном и мешки с кинжалами выглядят одинаково, пока их не развязать.',
         'Both. The trouble is that sacks of grain and sacks of daggers look the same until they are untied.',
         [
             ('Проверять каждую телегу.', 'Check every cart.', 'Тогда мы будем медленными, но не слепыми.', 'Then we will be slow, but not blind.', {'a': 5, 'g': -5, 'f': 3}),
             ('Ввести ночную пошлину и досмотр.', 'Introduce night duty and inspection.', 'Хорошо. Даже опасность будет платить за вход.', 'Fine. Even danger will pay an entrance fee.', {'g': 8, 'a': 3, 'f': -3}),
             ('Оставить ворота открытыми.', 'Leave the gate open.', 'Я поставлю лучших людей. И буду плохо спать.', "I'll put in the best people. And I won't sleep well.", {'f': 10, 'a': -8}),
         ]),
    ]),
    # 77 — Первый праздник
    ('edric', [
        ('После крови и страха люди нуждаются в празднике. Но праздник стоит золота, еды и спокойствия.',
         'After blood and fear, people need a holiday. But the holiday is worth gold, food and peace of mind.',
         [
             ('Устроить большой праздник.', 'Have a big celebration.', 'Город улыбнётся. Пусть даже с пустеющими амбарами.', 'The city will smile. Even with empty barns.', {'g': -20, 'f': -15, 'p': 20}),
             ('Устроить скромный праздник.', 'Have a modest celebration.', 'Скромная радость иногда крепче роскошной.', 'Modest joy is sometimes stronger than luxurious joy.', {'g': -8, 'f': -5, 'p': 10}),
             ('Запретить праздники до стабильности.', 'Ban holidays until stability.', 'Порядок сохранён. Настроение — нет.', 'The order has been preserved. Mood - no.', {'g': 5, 'a': 5, 'p': -10}),
             ('Разве сейчас время для праздника?', 'Is now the time to celebrate?', '', '', None, 1),
         ]),
        ('Именно сейчас. Когда люди долго слышат только приказы и похоронные колокола, они начинают ждать не короля, а конца.',
         'Right now. When people hear only orders and funeral bells for a long time, they begin to wait not for the king, but for the end.',
         [
             ('Скромный праздник для всего города.', 'A modest holiday for the whole city.', 'Хорошо. Достаточно света, чтобы ночь не казалась вечной.', "Fine. Enough light so that the night doesn't seem forever.", {'g': -8, 'f': -5, 'p': 10}),
             ('Праздник с раздачей хлеба.', 'A holiday with the distribution of bread.', 'Дорого. Но народ запомнит вкус этого дня.', 'Expensive. But people will remember the taste of this day.', {'g': -20, 'f': -20, 'p': 25}),
             ('Отложить праздник.', 'Postpone the holiday.', 'Тогда радость подождёт. Надеюсь, она не уйдёт совсем.', "Then joy will wait. I hope she doesn't go away completely.", {'g': 5, 'p': -8}),
         ]),
    ]),
    # 78 — Южный мост
    ('selena', [
        ('Я могу дать казне золото. Взамен хочу право собирать пошлины на южном мосту. Это выгодно вам сейчас и мне всегда.',
         'I can give the treasury gold. In exchange, I want the right to collect tolls on the south bridge. This benefits you now and always benefits me.',
         [
             ('Отдать мост на месяц.', 'Give the bridge away for a month.', 'Прекрасно. Мост — это не камень. Это река монет.', 'Wonderful. A bridge is not a stone. This is a river of coins.', {'g': 25, 'f': 5, 'p': -8}),
             ('Отдать мост на неделю.', 'Give the bridge away for a week.', 'Неделя — короткий повод стать богатой. Я справлюсь.', 'A week is a short excuse to become rich. I can handle it.', {'g': 10}),
             ('Не отдавать мост купцам.', "Don't give the bridge to merchants.", 'Корона оставляет себе камни. Я найду другой путь к золоту.', "The crown keeps the stones. I'll find another way to gold.", {'g': -5, 'p': 5}),
             ('Почему тебе нужен именно мост?', 'Why do you need a bridge?', '', '', None, 1),
         ]),
        ('Потому что через мост проходит всё: зерно, соль, слухи, должники и люди, которые думают, что умеют прятать деньги.',
         'Because everything passes through the bridge: grain, salt, rumors, debtors and people who think they know how to hide money.',
         [
             ('Отдать мост на неделю и поставить смотрителя.', 'Give the bridge away for a week and install a caretaker.', 'Вы даёте мне дверь, но оставляете глаз у замка. Неплохо.', 'You give me the door, but leave your eye on the lock. Not bad.', {'g': 12, 'p': -3}),
             ('Потребовать зерно вместо золота.', 'Demand grain instead of gold.', 'Хлеб вместо монет. В голодный месяц это почти одно и то же.', 'Bread instead of coins. During the fasting month it is almost the same thing.', {'f': 20, 'g': 5}),
             ('Мост останется короне.', 'The bridge will remain with the crown.', 'Тогда пусть корона сама считает каждую телегу. Это скучная работа.', "Then let the crown itself count each cart. It's boring work.", {'g': -5, 'p': 5}),
         ]),
    ]),
    # 79 — Цена первых решений
    ('edric', [
        ('Ваши первые решения уже стоят королевству крови, золота, хлеба и доверия. Теперь нужно выбрать, какую цену мы готовы платить дальше.',
         'Your first decisions are already costing the kingdom blood, gold, bread and trust. Now we need to choose what price we are willing to pay next.',
         [
             ('Власть держится на армии.', 'Power rests on the army.', 'Меч удержит трон. Но меч не умеет сеять хлеб.', 'The sword will hold the throne. But the sword does not know how to sow grain.', {'a': 25, 'g': -10, 'p': -10}),
             ('Власть держится на хлебе.', 'Power rests on bread.', 'Голодный народ опасен. Сытый народ хотя бы слушает.', 'Hungry people are dangerous. Well-fed people at least listen.', {'f': 25, 'g': -15, 'p': 5}),
             ('Власть держится на казне.', 'Power rests on the treasury.', 'Золото даст нам время. Но время, купленное страданием, часто заканчивается криком.', 'Gold will give us time. But time bought by suffering often ends in screaming.', {'g': 25, 'f': -10, 'p': -10}),
             ('Власть держится на живых людях.', 'Power rests on living people.', 'Живые подданные ещё могут простить короля. Мёртвые — только преследовать его имя.', 'Living subjects can still forgive the king. The dead only pursue his name.', {'p': 25, 'g': -15, 'f': -5}),
             ('А если попытаться удержать всё?', 'What if you try to hold on to everything?', '', '', None, 1),
         ]),
        ('Можно. Но королевства гибнут не только от плохих решений. Иногда они гибнут от хороших решений, принятых слишком поздно.',
         'Can. But kingdoms perish not only from bad decisions. Sometimes they die from good decisions made too late.',
         [
             ('Распределить силы поровну.', 'Distribute forces equally.', 'Осторожный выбор. Не великий, не позорный. Иногда именно такие переживают зиму.', 'Careful choice. Not great, not disgraceful. Sometimes these are the ones who survive the winter.', {'f': 7, 'a': 7, 'g': 7, 'p': 7}),
             ('Нет, сначала армию.', 'No, first the army.', 'Тогда пусть солдаты помнят, что защищают королевство, а не только вашу дверь.', 'Then let the soldiers remember that they are protecting the kingdom, not just your door.', {'a': 20, 'g': -10, 'f': -5}),
             ('Нет, сначала хлеб.', 'No, first the bread.', 'Хлеб — самый тихий союзник короля. Пока он есть.', "Bread is the king's quietest ally. While it is there.", {'f': 20, 'g': -12, 'p': 5}),
             ('Нет, сначала здоровье жителей.', 'No, first the health of the residents.', 'Вы выбрали жизнь. Теперь нужно сделать так, чтобы живым было чем жить.', 'You chose life. Now we need to make sure that the living have something to live on.', {'p': 20, 'g': -12}),
         ]),
    ]),
] + POOL3_ENCOUNTERS

# Pool 3 encounters 16-99 — exact spec tuples for _gen_pool3.py
# fmt: off
EXACT_16_99 = [
    (
        'rudolf',
        'Священники хотят вышить церковные кресты на военных знамёнах. Солдаты служат королю, не храму.',
        'Priests want to stitch church crosses on military banners. Soldiers serve the king, not the temple.',
        [
            ('Добавить кресты на знамёна.', 'Add crosses to the banners.', 'Теперь солдаты будут нести не только ваш герб. Опасный символ.', 'Now soldiers carry not only your crest. A dangerous symbol.', {'a': -8, 'c': 15}),
            ('Запретить церковные знаки на знамёнах.', 'Forbid church signs on banners.', 'Хорошо. В бою солдат должен видеть приказ, а не проповедь.', 'Good. In battle a soldier must see orders, not sermons.', {'a': 10, 'c': -12}),
            ('Добавить маленький символ на отдельные полковые ленты.', 'Add a small symbol on separate regimental ribbons.', 'Терпимо. Молитва останется на краю, где ей место.', 'Tolerable. Prayer stays at the edge where it belongs.', {'a': 3, 'c': 5})
        ],
    ),
    (
        'mira',
        'Больные выстраиваются к мощам святого. Они стоят часами под дождём вместо того, чтобы идти в лазарет.',
        'The sick queue for a saint\'s relics. They stand hours in rain instead of going to the infirmary.',
        [
            ('Запретить очередь к мощам.', 'Forbid the relic queue.', 'Вы спасёте тела. Души будут возмущаться.', 'You will save bodies. Souls will rage.', {'c': -15, 'h': 15}),
            ('Поставить лекарей рядом с мощами.', 'Place healers beside the relics.', 'Хорошо. Пусть чудо работает рядом с бинтами.', 'Good. Let miracle work beside bandages.', {'c': 5, 'g': -8, 'h': 15}),
            ('Не мешать верующим.', 'Do not hinder the faithful.', 'Тогда дождь и болезнь продолжат свою службу.', 'Then rain and disease continue their service.', {'c': 10, 'h': -12})
        ],
    ),
    (
        'gromm',
        'Храмы просят лучшую муку для священного хлеба. А я этой мукой могу накормить сирот.',
        'Temples want the best flour for holy bread. I could feed orphans with that flour.',
        [
            ('Отдать лучшую муку храмам.', 'Give the best flour to temples.', 'Святой хлеб выйдет мягким. Детские каши — жидкими.', 'Holy bread will be soft. Orphans\' porridge thin.', {'c': 12, 'f': -10}),
            ('Отдать муку сиротам.', 'Give the flour to orphans.', 'Дети скажут спасибо. Священники — что-нибудь длиннее.', 'Children will thank you. Priests something longer.', {'c': -8, 'f': -8, 'h': 12}),
            ('Разделить муку.', 'Divide the flour.', 'Половина святости, половина милости. Съедобно.', 'Half holiness, half mercy. Edible.', {'c': 5, 'f': -8, 'h': 5})
        ],
    ),
    (
        'varn',
        'Священник отказался открыть ворота храма стражникам. Говорит, внутри церковная земля, а не королевская.',
        'A priest refused temple gates to guards. Inside is church land, not royal.',
        [
            ('Вломиться силой.', 'Break in by force.', 'Дверь падёт. А вместе с ней что-то большее.', 'The door falls. And something greater with it.', {'a': 12, 'c': -20, 'h': -5}),
            ('Отступить.', 'Withdraw.', 'Стража это запомнит. Священники тоже.', 'The guard will remember. Priests too.', {'a': -10, 'c': 10}),
            ('Потребовать переговоров у входа.', 'Demand talks at the gate.', 'Хорошо. Пусть пока говорят, а не ломают.', 'Good. Let them talk for now, not break.', {'a': 3, 'c': 3})
        ],
    ),
    (
        'edric',
        'Открытие церкви принесло не мир, а новый центр власти. Теперь каждый ваш приказ будут сравнивать с проповедью.',
        'The church\'s opening brought not peace but a new center of power. Every order is compared to a sermon.',
        [
            ('Сделать церковь официальной опорой трона.', 'Make the church official support of the throne.', 'Вы получили святой щит. И святую цепь.', 'You gained a holy shield. And a holy chain.', {'a': -5, 'c': 20, 'g': -10}),
            ('Удерживать церковь на расстоянии.', 'Keep the church at distance.', 'Безопаснее для трона. Опаснее для души народа.', 'Safer for the throne. Riskier for the people\'s soul.', {'a': 5, 'c': -10, 'g': 5}),
            ('Показывать единство, но не отдавать власть.', 'Show unity without yielding power.', 'Это путь канатоходца. Главное — не смотреть вниз.', 'A tightrope walk. Do not look down.', {'a': 3, 'c': 8, 'g': -3})
        ],
    ),
    (
        'malrik',
        'Некоторые священники хотят в воскресенье говорить о крови переворота. Я могу запретить им. Но запреты в храме стоят дорого.',
        'Some priests want to preach about the blood of the coup this Sunday. I can forbid them. But forbidding in the temple comes at a price.',
        [
            ('Запретить проповедь о перевороте.', 'Forbid preaching about the coup.', 'Молчание куплено. Но оно не всегда хранится долго.', 'Silence is bought. But it does not always keep long.', {'c': 8, 'g': -10, 'h': 5}),
            ('Пусть говорят правду.', 'Let them speak the truth.', 'Правда в храме звучит громче, чем на площади.', 'Truth in the temple rings louder than in the square.', {'a': -8, 'c': 5, 'h': -5}),
            ('Пусть говорят о мире, не о крови.', 'Let them speak of peace, not blood.', 'Мир — удобная правда. Церковь умеет её произносить.', 'Peace is a convenient truth. The church knows how to speak it.', {'c': 10, 'g': -5})
        ],
    ),
    (
        'arvel',
        'Я хочу открыть приют при монастыре. Сироты будут жить, учиться и работать. Но нам нужен хлеб и немного золота.',
        'I wish to open a shelter at the monastery. Orphans will live, learn, and work. But we need bread and a little gold.',
        [
            ('Поддержать приют.', 'Support the shelter.', 'Вы дали детям не только крышу, но и завтра.', 'You gave the children not only a roof, but a tomorrow.', {'c': 8, 'f': -8, 'g': -12, 'h': 20}),
            ('Дать только зерно.', 'Give grain only.', 'Они будут есть. Пока это уже чудо.', 'They will eat. For now that is already a miracle.', {'c': 3, 'f': -10, 'h': 10}),
            ('Отказать.', 'Refuse.', 'Тогда улица снова станет их учителем.', 'Then the street will be their teacher again.', {'c': -5, 'f': 5, 'g': 5, 'h': -10})
        ],
    ),
    (
        'borvin',
        'Церковь продаёт грамоты отпущения грехов. Если взять с этого налог, казна оживёт.',
        'The church sells letters of absolution. Tax them and the treasury will revive.',
        [
            ('Обложить грамоты налогом.', 'Tax the letters.', 'Грех наконец начнёт работать на казну.', 'Sin will finally work for the treasury.', {'c': -10, 'g': 20}),
            ('Запретить продажу грамот.', 'Ban the sale of letters.', 'Морально. Но мораль не звенит.', 'Moral. But morality does not jingle.', {'c': -15, 'h': 8}),
            ('Не вмешиваться.', 'Do not interfere.', 'Храм продолжит торговать небом без нашей доли.', 'The temple will keep selling heaven without our share.', {'c': 10, 'g': -5})
        ],
    ),
    (
        'rudolf',
        'Священники говорят, что северяне — безбожники. Если они продолжат, солдаты сами начнут ждать войны.',
        'Priests say the northerners are godless. If they continue, soldiers will start waiting for war.',
        [
            ('Разрешить такие проповеди.', 'Allow such sermons.', 'Солдаты любят врага, которого им благословили ненавидеть.', 'Soldiers love an enemy they were blessed to hate.', {'a': 10, 'c': 15, 'g': -5}),
            ('Запретить военные проповеди.', 'Forbid war sermons.', 'Разумно. Войны хватает и без святых криков.', 'Sensible. There is war enough without holy cries.', {'a': -5, 'c': -12, 'g': 5}),
            ('Разрешить только молитвы за защиту.', 'Allow only prayers for protection.', 'Оборона звучит тише нападения. Иногда это полезно.', 'Defense sounds quieter than attack. Sometimes that helps.', {'a': 5, 'c': 5})
        ],
    ),
    (
        'mira',
        'Монахи лечат травами, но не записывают дозы. Сегодня один ребёнок чуть не умер от слишком крепкого отвара.',
        'Monks heal with herbs but keep no records of doses. Today a child nearly died from too strong a brew.',
        [
            ('Обязать монастырских лекарей вести записи.', 'Require monastery healers to keep records.', 'Чернила спасут тех, кого молитвы лечат вслепую.', 'Ink will save those prayers heal blindly.', {'c': -5, 'g': -3, 'h': 15}),
            ('Запретить монастырское лечение.', 'Ban monastery healing.', 'Это остановит ошибки. И часть помощи тоже.', 'It will stop mistakes. And some help too.', {'c': -15, 'h': 10}),
            ('Не трогать монастырские традиции.', 'Do not touch monastery traditions.', 'Традиции хороши, пока не путают лекарство с ядом.', 'Traditions are fine until medicine is mistaken for poison.', {'c': 8, 'h': -12})
        ],
    ),
    (
        'gromm',
        'К столице идут паломники. Если их не накормить, они рухнут у ворот. Если накормить — рухнут наши запасы.',
        'Pilgrims are coming to the capital. If unfed they collapse at the gates. If fed, our stores collapse.',
        [
            ('Накормить паломников.', 'Feed the pilgrims.', 'Святые люди едят как обычные. Иногда даже больше.', 'Holy folk eat like anyone else. Sometimes even more.', {'c': 15, 'f': -20, 'h': 10}),
            ('Пустить только тех, кто несёт еду с собой.', 'Admit only those who bring their own food.', 'Город сохранит зерно. Паломники сохранят обиду.', 'The city keeps grain. Pilgrims keep resentment.', {'c': -8, 'f': 5, 'h': -3}),
            ('Организовать дешёвую похлёбку.', 'Organize cheap porridge.', 'Жидко, но честно. Для паломников сойдёт.', 'Thin but honest. Good enough for pilgrims.', {'c': 8, 'f': -10, 'g': -5, 'h': 5})
        ],
    ),
    (
        'varn',
        'В город идут паломники. Среди них легко спрятать шпионов, убийц и беглых солдат.',
        'Pilgrims enter the city. Among them one can hide spies, killers, and deserters.',
        [
            ('Обыскивать всех паломников.', 'Search all pilgrims.', 'Безопаснее. Но святость будет стоять в очереди на досмотр.', 'Safer. But holiness will wait in line for inspection.', {'a': 10, 'c': -8, 'h': -3}),
            ('Пускать всех без проверки.', 'Let all pass unchecked.', 'Открытые ворота любят не только верующие.', 'Open gates are loved by more than the faithful.', {'a': -10, 'c': 10}),
            ('Проверять только мужчин с оружием.', 'Search only armed men.', 'Компромисс. Не идеальный, но живой.', 'A compromise. Not perfect, but livable.', {'a': 5, 'c': 3})
        ],
    ),
    (
        'edric',
        'Храмы требуют вернуть земли, конфискованные прежним королём. Земли дают хлеб. Хлеб даёт власть.',
        'Temples demand return of lands seized by the former king. Land gives bread. Bread gives power.',
        [
            ('Вернуть земли церкви.', 'Return the lands to the church.', 'Алтарь станет богаче. Трон — благодарнее или слабее.', 'The altar grows richer. The throne — more grateful or weaker.', {'c': 20, 'f': -15, 'g': -10}),
            ('Оставить земли короне.', 'Keep the lands for the crown.', 'Земля останется у вас. Проклятия тоже.', 'The land stays yours. So do the curses.', {'c': -20, 'f': 10, 'g': 10}),
            ('Вернуть только часть.', 'Return only part.', 'Половина уступки часто лучше полной войны.', 'Half a concession is often better than full war.', {'c': 8, 'f': -5, 'g': -5})
        ],
    ),
    (
        'selena',
        'Паломники покупают всё: хлеб, свечи, воду, тряпки, надежду. Разрешите временный рынок у храма.',
        'Pilgrims buy everything: bread, candles, water, rags, hope. Permit a temporary market by the temple.',
        [
            ('Разрешить рынок и взять пошлину.', 'Allow the market and take a toll.', 'Вера приведёт покупателей. Корона заберёт монеты.', 'Faith brings buyers. The crown takes the coins.', {'c': -5, 'f': -5, 'g': 20}),
            ('Разрешить рынок без пошлины.', 'Allow the market without toll.', 'Редкая щедрость. Купцы будут молиться за вас.', 'Rare generosity. Merchants will pray for you.', {'c': 8, 'g': -5, 'h': 3}),
            ('Запретить рынок у храма.', 'Ban the market by the temple.', 'Святость сохранена. Прибыль ушла мимо.', 'Holiness preserved. Profit passed by.', {'c': 5, 'f': 5, 'g': -10})
        ],
    ),
    (
        'morwen',
        'Некоторые заключённые вдруг стали очень набожными. Просят заменить казнь монастырским покаянием.',
        'Some prisoners suddenly grew very pious. They ask to replace execution with monastery penance.',
        [
            ('Разрешить покаяние вместо казни.', 'Allow penance instead of execution.', 'Монастырь получит грешников. Я — свободный день.', 'The monastery gets sinners. I get a free day.', {'a': -8, 'c': 12, 'h': 8}),
            ('Казнить по приговору.', 'Execute as sentenced.', 'Вера пришла поздно. Топор — вовремя.', 'Faith came late. The axe — on time.', {'a': 10, 'c': -5, 'h': -5}),
            ('Заменить казнь каторгой при монастырях.', 'Replace execution with labor at monasteries.', 'Грех будет копать землю. Почти поэтично.', 'Sin will dig the earth. Almost poetic.', {'a': -3, 'c': 5, 'g': 8})
        ],
    ),
    (
        'sivil',
        'Храм продаёт святую мазь от язв. В ней жир, воск и ложь. Мои мази хотя бы честно воняют.',
        'The temple sells holy salve for sores. It holds fat, wax, and lies. My salves at least smell honest.',
        [
            ('Запретить святую мазь.', 'Ban holy salve.', 'Здравый смысл победил ароматную ложь.', 'Good sense beat fragrant lies.', {'c': -12, 'h': 12}),
            ('Разрешить обе мази.', 'Allow both salves.', 'Пусть люди выбирают между верой и запахом. Забавно.', 'Let people choose between faith and stink. Amusing.', {'c': 5, 'g': 5, 'h': -5}),
            ('Проверять мази перед продажей.', 'Inspect salves before sale.', 'Проверка — враг мошенника. Значит, почти лекарство.', 'Inspection is the swindler\'s foe. So almost medicine.', {'c': -3, 'g': -5, 'h': 10})
        ],
    ),
    (
        'ingvar',
        'Северяне в столице просят открыть свой храм. Ваши священники называют это ересью.',
        'Northerners in the capital ask to open their own temple. Your priests call it heresy.',
        [
            ('Разрешить северный храм.', 'Allow a northern temple.', 'Север оценит. Ваши священники — нет.', 'The north will approve. Your priests will not.', {'c': -20, 'g': 5, 'h': 5}),
            ('Запретить.', 'Forbid it.', 'Тогда северяне поймут, что ваша вера сильнее гостеприимства.', 'Then northerners will see your faith outweighs hospitality.', {'a': 3, 'c': 15, 'g': -5}),
            ('Разрешить частные молитвы без храма.', 'Allow private prayers without a temple.', 'Полусвобода. С ней север умеет жить, но не любит её.', 'Half-freedom. The north lives with it, but does not love it.', {'c': -5, 'g': 3, 'h': 3})
        ],
    ),
    (
        'malrik',
        'Солдаты, пролившие кровь в ночь переворота, должны исповедаться. Иначе грех останется на вашем войске.',
        'Soldiers who shed blood on the night of the coup must confess. Otherwise sin stays on your army.',
        [
            ('Обязать солдат к исповеди.', 'Require soldiers to confess.', 'Грех назван. Теперь его можно держать на поводке.', 'Sin is named. Now it can be leashed.', {'a': -10, 'c': 15, 'h': 5}),
            ('Исповедь только добровольно.', 'Confession voluntary only.', 'Добровольное очищение медленнее, но чище.', 'Voluntary cleansing is slower, but cleaner.', {'a': 3, 'c': 5}),
            ('Не трогать армию.', 'Leave the army alone.', 'Тогда мечи останутся острыми. Души — грязными.', 'Then swords stay sharp. Souls stay dirty.', {'a': 10, 'c': -12})
        ],
    ),
    (
        'arvel',
        'Паломники продают свои вещи за кусок хлеба. Некоторые уже падают на дороге к храму.',
        'Pilgrims sell their belongings for bread. Some already fall on the road to the temple.',
        [
            ('Открыть бесплатную кухню.', 'Open a free kitchen.', 'Дорога к храму сегодня станет менее смертельной.', 'The road to the temple will be less deadly today.', {'c': 10, 'f': -18, 'h': 18}),
            ('Продавать им дешёвый хлеб.', 'Sell them cheap bread.', 'Не милость, но помощь. Иногда это всё, что есть.', 'Not mercy, but help. Sometimes that is all there is.', {'f': -8, 'g': 5, 'h': 8}),
            ('Закрыть город для новых паломников.', 'Close the city to new pilgrims.', 'Ворота сохранят хлеб. И потеряют сердца.', 'The gates keep bread. And lose hearts.', {'c': -15, 'f': 10, 'h': -5})
        ],
    ),
    (
        'borvin',
        'Если церковь объявит пожертвование короне святым делом, люди сами принесут монеты.',
        'If the church declares giving to the crown a holy deed, people will bring coins themselves.',
        [
            ('Попросить церковь объявить сбор.', 'Ask the church to declare a collection.', 'Когда жадность благословлена, её называют служением.', 'When greed is blessed, it is called service.', {'c': 8, 'g': 20, 'h': -5}),
            ('Собирать пожертвования без церкви.', 'Collect donations without the church.', 'Люди дают меньше, когда их не пугают небесами.', 'People give less when heaven does not frighten them.', {'g': 8, 'h': -3}),
            ('Не собирать с народа.', 'Do not collect from the people.', 'Милосердие снова ограбило казну.', 'Mercy robbed the treasury again.', {'g': -10, 'h': 8})
        ],
    ),
    (
        'rudolf',
        'Священники хотят читать молитву перед каждым строевым смотром. Это превращает армию в церковную процессию.',
        'Priests want prayer before every parade. It turns the army into a church procession.',
        [
            ('Разрешить молитвы перед смотром.', 'Allow prayers before inspection.', 'Солдаты будут стоять дольше. Надеюсь, враги тоже подождут.', 'Soldiers will stand longer. I hope enemies wait too.', {'a': -5, 'c': 12}),
            ('Запретить.', 'Forbid it.', 'Хорошо. Смотр должен звучать шагами, не псалмами.', 'Good. Inspection should sound of steps, not psalms.', {'a': 10, 'c': -10}),
            ('Молитва только перед походом.', 'Prayer only before a campaign.', 'Перед смертью люди терпимее к длинным речам.', 'Before death people tolerate long speeches.', {'a': 5, 'c': 5})
        ],
    ),
    (
        'mira',
        'Церковь запрещает вскрывать умерших от болезни. Без этого мы не поймём, что убивает людей.',
        'The church forbids autopsies of those who died of disease. Without them we cannot learn what kills.',
        [
            ('Разрешить вскрытия тайно.', 'Allow secret autopsies.', 'Тайная правда всё равно лечит лучше открытой лжи.', 'Secret truth still heals better than open lies.', {'c': -8, 'h': 15}),
            ('Запретить вскрытия.', 'Forbid autopsies.', 'Тогда болезнь сохранит свои секреты.', 'Then disease keeps its secrets.', {'c': 10, 'h': -15}),
            ('Вскрывать только тела без родственников.', 'Autopsy only bodies without kin.', 'Жестоко, но полезно. Как многое в медицине.', 'Cruel but useful. Like much in medicine.', {'c': -3, 'h': 8})
        ],
    ),
    (
        'gromm',
        'Через три дня праздник святого. Храм просит пир для бедных. Бедные просят пир каждый день.',
        'In three days is the saint\'s feast. The temple asks a feast for the poor. The poor ask for feasts every day.',
        [
            ('Выделить еду на праздник.', 'Allocate food for the feast.', 'Праздник будет сытным. Следующий день — обычным.', 'The feast will be hearty. The next day ordinary.', {'c': 12, 'f': -15, 'h': 8}),
            ('Выделить половину.', 'Allocate half.', 'Половина чуда. Для кухни это уже неплохо.', 'Half a miracle. Not bad for the kitchen.', {'c': 5, 'f': -8, 'h': 3}),
            ('Отказать.', 'Refuse.', 'Хлеб останется. Благодарность уйдёт.', 'Bread stays. Gratitude leaves.', {'c': -10, 'f': 5, 'h': -5})
        ],
    ),
    (
        'varn',
        'Малрик собирает собственную храмовую стражу. Пока это палки и рясы. Потом будут мечи.',
        'Malrik is forming a temple guard. For now sticks and robes. Later, swords.',
        [
            ('Запретить храмовую стражу.', 'Forbid the temple guard.', 'Хорошо. В городе должен быть один закон и одна стража.', 'Good. One law and one guard in the city.', {'a': 12, 'c': -15}),
            ('Разрешить храмовую стражу.', 'Allow the temple guard.', 'Тогда у храма появятся зубы. Не удивляйтесь, если он начнёт кусаться.', 'Then the temple grows teeth. Do not be surprised if it bites.', {'a': -10, 'c': 15}),
            ('Включить храмовую стражу в королевскую.', 'Fold temple guard into the royal guard.', 'Лучше держать их в строю, чем напротив строя.', 'Better in the ranks than against them.', {'a': 5, 'c': 5, 'g': -5})
        ],
    ),
    (
        'edric',
        'Народ слушает вас на площади и Малрика в храме. Но в храме люди плачут. На площади они боятся.',
        'The people hear you in the square and Malrik in the temple. In the temple they weep. In the square they fear.',
        [
            ('Говорить с народом чаще.', 'Speak to the people more often.', 'Трон должен иметь голос, иначе за него будут говорить другие.', 'The throne must have a voice, or others speak for it.', {'c': -3, 'g': -5, 'h': 10}),
            ('Пусть церковь говорит за корону.', 'Let the church speak for the crown.', 'Удобно. Но однажды вы услышите свои приказы чужим голосом.', 'Convenient. But one day you will hear your orders in a stranger\'s voice.', {'a': -5, 'c': 15}),
            ('Раздавать хлеб после королевских речей.', 'Give bread after royal speeches.', 'Хорошо. Слова лучше входят вместе с хлебом.', 'Good. Words go down better with bread.', {'c': 3, 'f': -10, 'h': 12})
        ],
    ),
    (
        'malrik',
        'Церковь хочет вести книгу верных подданных. Кто записан, тот получает помощь первым.',
        'The church wants a book of faithful subjects. Those listed receive help first.',
        [
            ('Разрешить книгу верных.', 'Allow the book of the faithful.', 'Порядок милосердия лучше хаоса милосердия.', 'Ordered mercy beats chaotic mercy.', {'c': 15, 'h': -8}),
            ('Запретить делить людей по вере.', 'Forbid dividing people by faith.', 'Вы хотите равенства там, где люди ищут избранность.', 'You want equality where people seek chosenness.', {'c': -15, 'h': 10}),
            ('Пусть книга будет добровольной.', 'Make the book voluntary.', 'Добровольность — мягкая дверь. Через неё войдут многие.', 'Voluntary entry is a soft door. Many will pass.', {'c': 5, 'h': 3})
        ],
    ),
    (
        'arvel',
        'Людей, которые спорили со священниками, перестали пускать к монастырской кухне. Они голодны.',
        'Those who argued with priests were barred from the monastery kitchen. They are hungry.',
        [
            ('Кормить всех, независимо от веры.', 'Feed all regardless of faith.', 'Это милость, которую я хотел услышать.', 'This is the mercy I hoped to hear.', {'c': -8, 'f': -10, 'h': 15}),
            ('Кормить только верных.', 'Feed only the faithful.', 'Тогда суп станет испытанием, а не спасением.', 'Then soup becomes a test, not salvation.', {'c': 12, 'f': -5, 'h': -10}),
            ('Создать королевскую кухню отдельно от монастыря.', 'Create a royal kitchen apart from the monastery.', 'Тогда голодные не будут выбирать между хлебом и совестью.', 'Then the hungry need not choose between bread and conscience.', {'f': -10, 'g': -10, 'h': 15})
        ],
    ),
    (
        'borvin',
        'Некоторые монастыри должны казне за старые поставки. Малрик просит простить долги во имя веры.',
        'Some monasteries owe the treasury for old supplies. Malrik asks to forgive the debts in faith\'s name.',
        [
            ('Простить долги.', 'Forgive the debts.', 'Вера любит прощение. Казна — нет.', 'Faith loves forgiveness. The treasury does not.', {'c': 15, 'g': -15}),
            ('Потребовать оплату.', 'Demand payment.', 'Долг святее молитвы, если записан правильно.', 'Debt is holier than prayer if recorded well.', {'c': -12, 'g': 15}),
            ('Взять оплату зерном.', 'Take payment in grain.', 'Пусть их покаяние будет съедобным.', 'Let their penance be edible.', {'c': -5, 'f': 12})
        ],
    ),
    (
        'rudolf',
        'Священники просят остановить казни дезертиров. Говорят, каждый солдат может покаяться.',
        'Priests ask to stop executing deserters. Every soldier can repent, they say.',
        [
            ('Остановить казни дезертиров.', 'Stop executing deserters.', 'Милость в казармах пахнет мятежом.', 'Mercy in the barracks smells of mutiny.', {'a': -15, 'c': 10, 'h': 5}),
            ('Продолжать казни.', 'Continue executions.', 'Порядок сохранится. Души пусть догоняют позже.', 'Order holds. Souls can catch up later.', {'a': 12, 'c': -10, 'h': -5}),
            ('Заменить казнь тяжёлой службой.', 'Replace execution with hard service.', 'Живой трус с лопатой полезнее мёртвого.', 'A living coward with a shovel beats a dead one.', {'a': 5, 'c': 5, 'h': -3})
        ],
    ),
    (
        'mira',
        'Больные ночуют внутри храма, надеясь на чудо. Тёплый воздух и теснота разносят болезнь.',
        'The sick sleep inside the temple hoping for miracles. Warm air and crowding spread disease.',
        [
            ('Вывести больных в лазареты.', 'Move the sick to infirmaries.', 'Они будут злиться. Но выживут чаще.', 'They will rage. But survive more often.', {'c': -10, 'h': 18}),
            ('Открыть храмовые лазареты.', 'Open temple infirmaries.', 'Если храм хочет лечить, пусть учится мыть полы.', 'If the temple heals, let it learn to scrub floors.', {'c': 8, 'g': -10, 'h': 15}),
            ('Оставить всё как есть.', 'Leave things as they are.', 'Тогда чудо понадобится нам всем.', 'Then we will all need a miracle.', {'c': 8, 'h': -18})
        ],
    ),
    (
        'gromm',
        'Во время поста рыба стала дороже мяса. Купцы молятся на пост громче священников.',
        'During the fast fish costs more than meat. Merchants pray to the fast louder than priests.',
        [
            ('Ограничить цену на рыбу.', 'Cap fish prices.', 'Пост станет чуть менее роскошным для торговцев.', 'The fast grows less luxurious for traders.', {'c': 5, 'g': -5, 'h': 8}),
            ('Не вмешиваться.', 'Do not interfere.', 'Купцы будут сыты. Люди будут свято голодать.', 'Merchants stay fed. People fast holily.', {'g': 10, 'h': -8}),
            ('Раздать солёную рыбу из запасов.', 'Give salted fish from stores.', 'Солёная милость. Запивать придётся водой, если она чистая.', 'Salty mercy. Wash it down if the water is clean.', {'c': 5, 'f': -12, 'h': 12})
        ],
    ),
    (
        'varn',
        'На стенах появились знаки: \'Король без благословения — не король\'. Это уже не шёпот.',
        'Signs on the walls: \'A king without blessing is no king.\' This is no longer a whisper.',
        [
            ('Стереть знаки и арестовать писцов.', 'Erase signs and arrest the writers.', 'Стены станут чистыми. Люди — осторожнее.', 'Walls grow clean. People grow careful.', {'a': 10, 'c': -8, 'h': -5}),
            ('Ответить публичной речью.', 'Answer with a public speech.', 'Слова против надписей. Иногда работает.', 'Words against graffiti. Sometimes it works.', {'g': -5, 'h': 8}),
            ('Попросить церковь осудить надписи.', 'Ask the church to condemn the signs.', 'Если храм скажет — стены замолчат быстрее.', 'If the temple speaks, walls fall silent faster.', {'c': 5, 'g': -5, 'h': 5})
        ],
    ),
    (
        'edric',
        'Говорят, что прежний король проклял трон перед смертью. Церковь может развеять слух. Или подтвердить его.',
        'They say the former king cursed the throne before death. The church can dispel the rumor. Or confirm it.',
        [
            ('Попросить церковь развеять слух.', 'Ask the church to dispel the rumor.', 'Проклятия боятся свечей, особенно оплаченных.', 'Curses fear candles, especially paid ones.', {'c': 10, 'g': -8, 'h': 8}),
            ('Запретить говорить о проклятии.', 'Forbid talk of the curse.', 'Запрет — плохая крышка для кипящего котла.', 'A ban is a poor lid on a boiling pot.', {'a': 8, 'h': -8}),
            ('Высмеять слух публично.', 'Mock the rumor publicly.', 'Смех лечит страх. Но не всегда лечит веру.', 'Laughter cures fear. Not always faith.', {'c': -5, 'h': 5})
        ],
    ),
    (
        'selena',
        'Храмы требуют тысячи свечей. Дайте мне монополию на воск, и половина прибыли ваша.',
        'Temples demand thousands of candles. Give me a wax monopoly and half the profit is yours.',
        [
            ('Дать монополию.', 'Grant the monopoly.', 'Свечи будут гореть. Монеты тоже.', 'Candles will burn. So will coins.', {'c': 5, 'g': 20, 'h': -5}),
            ('Запретить монополию.', 'Forbid the monopoly.', 'Свободный рынок свечей. Как возвышенно скучно.', 'A free market in candles. How nobly dull.', {'g': -5, 'h': 5}),
            ('Поставить королевскую цену на воск.', 'Set a royal price on wax.', 'Вы портите прибыль, но красиво называете это порядком.', 'You spoil profit but call it order.', {'c': 3, 'g': 8, 'h': 3})
        ],
    ),
    (
        'morwen',
        'Мне передали список подозреваемых в ереси. Половина имён написана чужой рукой, половина — дрожащей.',
        'I received a list of suspected heretics. Half the names in another\'s hand, half in a trembling one.',
        [
            ('Начать аресты.', 'Begin arrests.', 'Список станет короче. Страх — длиннее.', 'The list grows shorter. Fear grows longer.', {'a': 8, 'c': 15, 'h': -15}),
            ('Проверить список.', 'Verify the list.', 'Редкий случай, когда бумага переживёт ночь.', 'A rare night when paper outlives the axe.', {'c': -5, 'g': -5, 'h': 8}),
            ('Сжечь список.', 'Burn the list.', 'Огонь сегодня поработает вместо меня.', 'Fire works for me today.', {'c': -15, 'h': 12})
        ],
    ),
    (
        'sivil',
        'Некоторые больные перестали покупать лекарства. Говорят, священник велел им молиться и терпеть.',
        'Some sick stopped buying remedies. A priest told them to pray and endure.',
        [
            ('Приказать храмам не мешать лечению.', 'Order temples not to hinder healing.', 'Спасибо. Болезни терпение не раздражает, а радует.', 'Thank you. Disease is glad when you treat it instead of telling patients to endure.', {'c': -10, 'h': 15}),
            ('Поддержать церковь.', 'Support the church.', 'Тогда пусть молитвы сбивают жар. Я посмотрю.', 'Then let prayers break the fever. I will watch.', {'c': 12, 'h': -15}),
            ('Разрешить и молитвы, и лекарства.', 'Allow both prayer and medicine.', 'Пусть лечатся всем сразу. Иногда отчаяние полезно.', 'Let them heal with everything at once. Sometimes desperation helps.', {'c': 5, 'g': -5, 'h': 8})
        ],
    ),
    (
        'ingvar',
        'Ваши священники хотят ехать на север проповедовать. Мой князь сочтёт это вмешательством.',
        'Your priests want to ride north to preach. My prince will call it meddling.',
        [
            ('Разрешить миссию.', 'Allow the mission.', 'Север не любит чужие молитвы. Особенно с юга.', 'The north does not love foreign prayers. Especially from the south.', {'a': -10, 'c': 15}),
            ('Запретить миссию.', 'Forbid the mission.', 'Мой князь оценит вашу осторожность.', 'My prince will value your caution.', {'a': 5, 'c': -10, 'g': 5}),
            ('Отправить только лекарей-монахов.', 'Send only healer-monks.', 'Лекарь проходит там, где проповедника встречают копьём.', 'A healer passes where a preacher meets spears.', {'c': 5, 'g': -5, 'h': 5})
        ],
    ),
    (
        'malrik',
        'Нужна новая коронация. Не во дворце, а в храме. Тогда народ увидит, что власть дана не только мечом.',
        'A new coronation is needed. Not in the palace but in the temple. Then the people will see power was given not only by the sword.',
        [
            ('Согласиться на храмовую коронацию.', 'Agree to a temple coronation.', 'Теперь ваша корона будет сиять не только золотом, но и страхом Божьим.', 'Now your crown will shine with gold and godly fear.', {'a': -5, 'c': 25, 'g': -20}),
            ('Отказаться.', 'Refuse.', 'Тогда храм будет молчать. Но молчание в храме слышно далеко.', 'Then the temple will be silent. But silence in the temple carries far.', {'a': 10, 'c': -25}),
            ('Провести малый обряд без новой коронации.', 'Hold a small rite without a new coronation.', 'Не полная победа для алтаря. Но шаг к нему.', 'Not full victory for the altar. But a step toward it.', {'c': 10, 'g': -8})
        ],
    ),
    (
        'arvel',
        'Городские бедняки злятся: паломников кормят, а местные голодают. Милость стала поводом для зависти.',
        'City poor are angry: pilgrims are fed while locals starve. Mercy became envy.',
        [
            ('Кормить сначала жителей города.', 'Feed city dwellers first.', 'Дом нужно спасать до гостей. Это понятно.', 'Save the house before the guests. That is clear.', {'c': -5, 'f': -10, 'h': 12}),
            ('Кормить всех поровну.', 'Feed all equally.', 'Трудно, дорого, правильно.', 'Hard, costly, right.', {'c': 8, 'f': -18, 'h': 15}),
            ('Кормить только паломников у храма.', 'Feed only pilgrims at the temple.', 'Тогда город решит, что вера пришла не к нему.', 'Then the city will think faith came for others.', {'c': 10, 'f': -8, 'h': -12})
        ],
    ),
    (
        'borvin',
        'Храмовые лавки не платят торговый налог. Купцы требуют справедливости. Я требую дохода.',
        'Temple shops pay no trade tax. Merchants demand fairness. I demand revenue.',
        [
            ('Обложить лавки налогом.', 'Tax the shops.', 'Справедливость наконец-то принесла монеты.', 'Fairness finally brought coins.', {'c': -12, 'g': 15}),
            ('Оставить лавки свободными от налогов.', 'Leave shops tax-free.', 'Святость снова оказалась дешевле для храма, чем для казны.', 'Holiness is cheaper for the temple than the treasury again.', {'c': 10, 'g': -10}),
            ('Ввести малый налог.', 'Introduce a small tax.', 'Малый укол. Возможно, храм не закричит.', 'A small sting. Perhaps the temple will not scream.', {'c': -3, 'g': 8})
        ],
    ),
    (
        'rudolf',
        'Молодые фанатики просятся в армию. Они храбры, но не слушают приказов, когда слышат слово \'ересь\'.',
        'Young fanatics want to join the army. They are brave but ignore orders when they hear \'heresy\'.',
        [
            ('Принять их в армию.', 'Accept them.', 'Храбрость получена. Дисциплина под вопросом.', 'Bravery gained. Discipline in question.', {'a': 15, 'c': 8, 'h': -8}),
            ('Отказать фанатикам.', 'Refuse the fanatics.', 'Лучше меньше солдат, чем толпа с мечами и песнями.', 'Better fewer soldiers than a crowd with swords and songs.', {'a': -5, 'c': -10, 'h': 5}),
            ('Создать отдельный церковный отряд под надзором армии.', 'Form a separate church unit under army oversight.', 'Я буду держать их рядом. И подальше от решений.', 'I will keep them close. And far from decisions.', {'a': 10, 'c': 5, 'g': -8})
        ],
    ),
    (
        'mira',
        'Некоторые священники говорят, что женщины не должны лечить мужчин. Сегодня трое отказались от моей помощи.',
        'Some priests say women must not treat men. Today three refused my help.',
        [
            ('Запретить такие проповеди.', 'Forbid such preaching.', 'Спасибо. Болезнь не выбирает лекаря по полу.', 'Thank you. Disease does not choose healers by sex.', {'c': -12, 'h': 15}),
            ('Не вмешиваться.', 'Do not interfere.', 'Тогда пусть гордость перевязывает им раны.', 'Let pride bandage their wounds.', {'c': 8, 'h': -12}),
            ('Назначить женщин-лекарей только к женщинам и детям.', 'Assign women healers only to women and children.', 'Уступка предрассудку редко спасает жизнь.', 'Conceding to prejudice rarely saves a life.', {'c': 5, 'h': -5})
        ],
    ),
    (
        'gromm',
        'Монастырь варит пиво и продаёт его без налога. Солдаты довольны, казначей нет.',
        'The monastery brews beer and sells it untaxed. Soldiers are pleased, the treasurer is not.',
        [
            ('Обложить монастырское пиво налогом.', 'Tax monastery beer.', 'Пиво станет дороже. Молитвы — раздражённее.', 'Beer grows costly. Prayers grow irritable.', {'a': -3, 'c': -8, 'g': 12}),
            ('Оставить без налога.', 'Leave it untaxed.', 'Солдаты будут пить за здоровье церкви.', 'Soldiers will drink to the church\'s health.', {'a': 5, 'c': 8, 'g': -8}),
            ('Забрать часть пива для армии.', 'Take part of the beer for the army.', 'Святое пиво в казармах. Я такое уже видел перед драками.', 'Holy beer in the barracks. I have seen that before brawls.', {'a': 10, 'c': -5, 'g': 3})
        ],
    ),
    (
        'varn',
        'Один молодой священник говорит, что король должен слушать только церковь. Толпа хлопает.',
        'A young priest says the king must listen only to the church. The crowd applauds.',
        [
            ('Арестовать священника.', 'Arrest the priest.', 'Толпа увидит силу. И запомнит лицо арестованного.', 'The crowd sees force. And remembers the arrested face.', {'a': 10, 'c': -15, 'h': -5}),
            ('Вызвать его на разговор.', 'Summon him to talk.', 'Мягче. Но он может принять мягкость за слабость.', 'Softer. But he may take softness for weakness.', {'a': 3, 'c': 3, 'g': -3}),
            ('Игнорировать.', 'Ignore.', 'Слова, оставленные без ответа, часто вырастают.', 'Unanswered words often grow.', {'a': -8, 'c': 5})
        ],
    ),
    (
        'edric',
        'Малрик предлагает создать церковный совет при троне. Советники в рясах будут говорить от имени народа и богов.',
        'Malrik proposes a church council at court. Robed advisers will speak for people and gods.',
        [
            ('Создать церковный совет.', 'Create the church council.', 'Вы впустили алтарь в тронный зал. Вывести будет сложнее.', 'You let the altar into the throne room. Harder to remove.', {'a': -5, 'c': 20, 'g': -8}),
            ('Отказать.', 'Refuse.', 'Священники останутся снаружи. И начнут говорить громче.', 'Priests stay outside. And speak louder.', {'a': 5, 'c': -15}),
            ('Разрешить одному представителю церкви.', 'Allow one church representative.', 'Одна ряса легче совета. Пока она не заговорит за всех.', 'One robe is lighter than a council. Until it speaks for all.', {'c': 8, 'g': -3})
        ],
    ),
    (
        'malrik',
        'Церковь предлагает налог на роскошь. Деньги пойдут бедным. И, разумеется, через храмовые руки.',
        'The church proposes a luxury tax. Money for the poor — through temple hands, of course.',
        [
            ('Ввести налог через церковь.', 'Levy through the church.', 'Богатые возненавидят нас обоих. Бедные будут есть.', 'The rich will hate us both. The poor will eat.', {'c': 15, 'g': 5, 'h': 8}),
            ('Ввести налог через корону.', 'Levy through the crown.', 'Вы забрали милосердие из рук церкви. Смело.', 'You took mercy from church hands. Bold.', {'c': -5, 'g': 15, 'h': 5}),
            ('Отказаться.', 'Refuse.', 'Роскошь останется нетронутой. Как и голод.', 'Luxury untouched. So is hunger.', {'c': -8, 'g': 3, 'h': -5})
        ],
    ),
    (
        'arvel',
        'Во время службы нищие протягивают руки прямо у алтаря. Богатые прихожане жалуются, что им мешают молиться.',
        'Beggars reach out at the altar during service. Rich parishioners complain they disturb prayer.',
        [
            ('Оставить нищих у алтаря.', 'Leave beggars at the altar.', 'Молитва рядом с бедностью честнее.', 'Prayer beside poverty is honester.', {'c': -3, 'h': 10}),
            ('Вывести нищих наружу.', 'Move beggars outside.', 'Храм станет красивее. И холоднее.', 'The temple grows prettier. And colder.', {'c': 8, 'h': -8}),
            ('Создать отдельную раздачу еды после службы.', 'Create a separate food handout after service.', 'Хорошо. Милость не должна мешать молитве, но должна быть рядом.', 'Good. Mercy should not block prayer, but stay near.', {'c': 5, 'f': -10, 'h': 12})
        ],
    ),
    (
        'borvin',
        'Храм просит серебро на новый колокол. Говорят, его звон будет защищать город. Я бы предпочёл защитные стены.',
        'The temple wants silver for a new bell. They say its ring will guard the city. I would prefer walls.',
        [
            ('Дать серебро на колокол.', 'Fund the bell.', 'Колокол будет звонить. Казна — пустеть.', 'The bell will ring. The treasury will empty.', {'c': 15, 'g': -15, 'h': 5}),
            ('Отказать.', 'Refuse.', 'Тишина дешевле серебра.', 'Silence is cheaper than silver.', {'c': -10, 'g': 5}),
            ('Дать бронзу вместо серебра.', 'Give bronze instead of silver.', 'Колокол будет беднее, но всё ещё громче моего недовольства.', 'A poorer bell, still louder than my displeasure.', {'c': 5, 'g': -5})
        ],
    ),
    (
        'rudolf',
        'Малрик хочет, чтобы армия постилась перед походом. Голодный солдат хуже молится и хуже бьёт.',
        'Malrik wants the army to fast before a campaign. A hungry soldier prays and fights worse.',
        [
            ('Приказать армии поститься.', 'Order the army to fast.', 'Если враг нападёт, будем бросать в него молитвы.', 'If the enemy strikes, we will throw prayers.', {'a': -15, 'c': 15, 'f': 10}),
            ('Освободить армию от поста.', 'Exempt the army from fasting.', 'Спасибо. Солдат с мясом в животе полезнее святого скелета.', 'Thank you. A soldier with meat in his belly beats a holy skeleton.', {'a': 12, 'c': -10, 'f': -5}),
            ('Пост только для офицеров.', 'Fast only for officers.', 'Офицеры будут страдать красиво. Рядовые — есть.', 'Officers suffer prettily. Rank and file eat.', {'a': -3, 'c': 5, 'f': 5})
        ],
    ),
    (
        'mira',
        'Паломники принесли новую болезнь. Священники называют её испытанием. Я называю её заразой.',
        'Pilgrims brought a new disease. Priests call it a trial. I call it plague.',
        [
            ('Закрыть город для паломников.', 'Close the city to pilgrims.', 'Это спасёт город. И разозлит тех, кто идёт к святыне.', 'It saves the city. And angers those bound for the shrine.', {'c': -15, 'f': 5, 'h': 20}),
            ('Проверять паломников у ворот.', 'Screen pilgrims at the gates.', 'Медленно, но лучше, чем пускать болезнь с песнями.', 'Slow, but better than letting sickness in with hymns.', {'c': -3, 'g': -8, 'h': 12}),
            ('Не мешать паломничеству.', 'Do not hinder pilgrimage.', 'Тогда испытание станет массовым.', 'Then the trial becomes mass.', {'c': 12, 'h': -20})
        ],
    ),
    (
        'gromm',
        'У храма продают рыбу для поста. Половина уже пахнет как проповедь после дождя.',
        'Fish for the fast is sold by the temple. Half already smells like a sermon after rain.',
        [
            ('Конфисковать испорченную рыбу.', 'Seize spoiled fish.', 'Люди потеряют ужин, но сохранят животы.', 'People lose supper but keep their guts.', {'c': -3, 'f': -5, 'h': 12}),
            ('Разрешить продавать после засолки.', 'Allow sale after salting.', 'Соль — не магия. Хотя купцы верят обратному.', 'Salt is not magic. Though merchants believe otherwise.', {'f': 8, 'h': -8}),
            ('Закрыть рынок у храма.', 'Close the market by the temple.', 'Вонь уйдёт. Прибыль тоже.', 'The stench leaves. So does profit.', {'c': -8, 'g': -8, 'h': 15})
        ],
    ),
    (
        'varn',
        'После проповеди толпа идёт к дворцу. Они несут свечи, не оружие. Но свечой тоже можно поджечь дверь.',
        'After the sermon a crowd marches on the palace. They carry candles, not weapons. But candles can burn doors.',
        [
            ('Встретить толпу стражей.', 'Meet them with guards.', 'Свечи погаснут быстро. Гнев — нет.', 'Candles die fast. Anger does not.', {'a': 10, 'c': -5, 'h': -5}),
            ('Выйти к ним лично.', 'Go out to them yourself.', 'Я буду рядом. Если свечи станут факелами, бегите первым.', 'I will be near. If candles turn to torches, run first.', {'a': -5, 'c': 3, 'h': 10}),
            ('Раздать хлеб и пустить представителей внутрь.', 'Give bread and admit representatives.', 'Хлеб остужает руки лучше воды.', 'Bread cools hands better than water.', {'c': 5, 'f': -10, 'h': 12})
        ],
    ),
    (
        'edric',
        'Если церковь назовёт вас благочестивым, многие забудут переворот. Но церковь не делает таких подарков бесплатно.',
        'If the church names you pious, many will forget the coup. But the church gives no such gifts for free.',
        [
            ('Купить благочестивую репутацию.', 'Buy a pious reputation.', 'Репутация куплена. Теперь важно, чтобы чек не нашли.', 'Reputation bought. Now hide the receipt.', {'c': 20, 'g': -20, 'h': 5}),
            ('Заслужить её делами.', 'Earn it by deeds.', 'Медленнее. Но крепче.', 'Slower. But stronger.', {'c': 5, 'g': -10, 'h': 10}),
            ('Не нуждаюсь в церковной репутации.', 'I need no church reputation.', 'Так говорят короли до первой проповеди против них.', 'Kings say that until the first sermon against them.', {'a': 5, 'c': -15})
        ],
    ),
    (
        'selena',
        'Пекари продают \'святой хлеб\' втрое дороже обычного. Народ покупает, потому что боится болезни.',
        'Bakers sell \'holy bread\' triple the price. People buy from fear of disease.',
        [
            ('Запретить святой хлеб.', 'Ban holy bread.', 'Вы запретили страху быть товаром. Смело.', 'You forbade fear as merchandise. Bold.', {'c': -8, 'g': -5, 'h': 10}),
            ('Обложить святой хлеб налогом.', 'Tax holy bread.', 'Если люди платят за страх, корона хотя бы получит долю.', 'If people pay for fear, the crown gets a share.', {'c': -3, 'g': 15, 'h': -5}),
            ('Разрешить, но установить цену.', 'Allow it but set a price.', 'Контролируемое суеверие. Почти государственная политика.', 'Controlled superstition. Almost state policy.', {'g': 5, 'h': 8})
        ],
    ),
    (
        'morwen',
        'Церковь требует сжечь книги, найденные у учёного. Говорят, они портят души.',
        'The church demands burning books found with a scholar. They corrupt souls, they say.',
        [
            ('Сжечь книги.', 'Burn the books.', 'Бумага горит быстро. Идеи — по-разному.', 'Paper burns fast. Ideas — differently.', {'c': 15, 'h': -5}),
            ('Спрятать книги в королевском архиве.', 'Hide books in the royal archive.', 'Тайный огонь иногда опаснее открытого.', 'Secret fire can be deadlier than open flame.', {'c': -10, 'g': -3, 'h': 3}),
            ('Разрешить читать после проверки.', 'Allow reading after review.', 'Редкий случай, когда книга дожила до суда.', 'A rare book that lived to face judgment.', {'c': -5, 'g': -5, 'h': 5})
        ],
    ),
    (
        'sivil',
        'Священники называют мои травы ведьмовством. Забавно, что их монахи покупают те же травы через заднюю дверь.',
        'Priests call my herbs witchcraft. Funny that their monks buy the same herbs at the back door.',
        [
            ('Защитить Сивил.', 'Protect Sivil.', 'Спасибо. Я почти тронута. Почти.', 'Thank you. I am almost moved. Almost.', {'c': -12, 'h': 15}),
            ('Запретить её травы.', 'Ban her herbs.', 'Тогда пусть монахи лечат кашель псалмами.', 'Let monks cure coughs with psalms.', {'c': 12, 'h': -15}),
            ('Разрешить травы через храмовую проверку.', 'Allow herbs through temple inspection.', 'Храм будет нюхать мои мешочки. Какая честь.', 'The temple will sniff my pouches. What honor.', {'c': 5, 'g': -3, 'h': 8})
        ],
    ),
    (
        'ingvar',
        'К вашим воротам пришли семьи с севера. Они бегут от войны, но молятся не вашим богам.',
        'Families from the north came to your gates. They flee war but pray to other gods.',
        [
            ('Принять беженцев.', 'Accept the refugees.', 'Север запомнит вашу милость. Ваши священники — тоже.', 'The north will remember your mercy. Your priests too.', {'c': -15, 'f': -15, 'h': 8}),
            ('Отказать им.', 'Refuse them.', 'Холодная милость. Почти северная.', 'Cold mercy. Almost northern.', {'c': 10, 'f': 5, 'h': -8}),
            ('Принять, если они будут жить отдельно.', 'Accept if they live apart.', 'Полуприют. Лучше дороги, хуже дома.', 'Half-shelter. Better than the road, worse than home.', {'c': -5, 'f': -8, 'g': -5})
        ],
    ),
    (
        'malrik',
        'В городе молятся чужим богам. Если это оставить, завтра ересь будет не в подвалах, а на рынке.',
        'Foreign gods are worshipped in the city. Leave it and heresy moves from cellars to the market.',
        [
            ('Запретить чужие обряды.', 'Forbid foreign rites.', 'Чистота веры требует твёрдой руки.', 'Purity of faith needs a firm hand.', {'a': 5, 'c': 20, 'h': -10}),
            ('Разрешить частные обряды.', 'Allow private rites.', 'Тихая ересь всё равно ересь. Но хотя бы тихая.', 'Quiet heresy is still heresy. But quiet.', {'c': -8, 'h': 8}),
            ('Не вмешиваться.', 'Do not interfere.', 'Терпимость часто входит в город как гость, а остаётся как хозяин.', 'Tolerance enters as a guest and stays as host.', {'c': -15, 'g': 5, 'h': 5})
        ],
    ),
    (
        'arvel',
        'В деревне обвинили женщину в колдовстве. Её дом сожгли без суда. Теперь дети спят на пепле.',
        'A village accused a woman of witchcraft. Her house burned without trial. Children sleep on ash.',
        [
            ('Наказать виновных.', 'Punish the guilty.', 'Справедливость запоздала, но хотя бы пришла.', 'Justice was late, but came.', {'a': 5, 'c': -10, 'h': 10}),
            ('Помочь детям и не трогать деревню.', 'Help the children and leave the village.', 'Мягко. Иногда мягкость спасает больше, чем наказание.', 'Softly. Sometimes softness saves more than punishment.', {'f': -5, 'g': -8, 'h': 12}),
            ('Не вмешиваться.', 'Do not interfere.', 'Тогда пепел станет законом.', 'Then ash becomes law.', {'c': 5, 'h': -12})
        ],
    ),
    (
        'borvin',
        'Если печатать простые молитвенники и продавать их дёшево, народ будет занят верой, а казна — доходом.',
        'Print simple prayer books cheaply and the people stay busy with faith and the treasury with income.',
        [
            ('Печатать молитвенники.', 'Print prayer books.', 'Прекрасно. Бумага, которая приносит и веру, и монеты.', 'Fine. Paper that brings faith and coins.', {'c': 10, 'g': 12, 'h': 3}),
            ('Раздавать бесплатно.', 'Give them free.', 'Бесплатная вера. Очень дорогая идея.', 'Free faith. A costly idea.', {'c': 12, 'g': -10, 'h': 5}),
            ('Не тратить бумагу на молитвы.', 'Spend no paper on prayers.', 'Бумага останется для налогов. Более надёжного жанра.', 'Paper stays for taxes. A steadier genre.', {'c': -8, 'g': 5})
        ],
    ),
    (
        'rudolf',
        'Один священник велел солдатам не трогать беглецов, если те укрылись в храме. Это подрывает командование.',
        'A priest told soldiers not to touch fugitives in sanctuary. It undermines command.',
        [
            ('Поддержать священника.', 'Support the priest.', 'Тогда солдаты начнут смотреть на алтарь перед каждым приказом.', 'Then soldiers will look to the altar before every order.', {'a': -12, 'c': 12}),
            ('Поддержать армию.', 'Support the army.', 'Хорошо. Приказ должен идти сверху, не сбоку.', 'Good. Orders from above, not from the side.', {'a': 12, 'c': -12}),
            ('Установить правило храмового убежища на три дня.', 'Sanctuary for three days only.', 'Три дня терпимо. На четвёртый я заберу беглеца сам.', 'Three days is tolerable. On the fourth I take the fugitive myself.', {'a': 5, 'c': 5, 'g': -3})
        ],
    ),
    (
        'mira',
        'Священники против новых могильных ям за городом. Говорят, земля там не освящена. А старое кладбище переполнено.',
        'Priests oppose new graves outside the walls. The ground is unconsecrated. The old cemetery is full.',
        [
            ('Освятить новую землю и хоронить там.', 'Consecrate new ground and bury there.', 'Наконец-то решение, где здравый смысл и вера не дерутся.', 'At last sense and faith do not fight.', {'c': 5, 'g': -5, 'h': 15}),
            ('Хоронить за городом без освящения.', 'Bury outside without consecration.', 'Мёртвым нужна земля. Живым — безопасность.', 'The dead need earth. The living need safety.', {'c': -12, 'h': 12}),
            ('Продолжать хоронить на старом кладбище.', 'Keep using the old cemetery.', 'Тогда старое кладбище начнёт возвращать нам болезни.', 'Then the old graveyard returns disease to us.', {'c': 8, 'h': -15})
        ],
    ),
    (
        'gromm',
        'Храмы открывают кухни, но готовят плохо. Если люди начнут травиться святой похлёбкой, винить будут вас.',
        'Temples open kitchens but cook poorly. If people poison themselves on holy stew, they will blame you.',
        [
            ('Отправить дворцовых поваров обучать храмы.', 'Send palace cooks to train temples.', 'Научу их хотя бы не убивать супом.', 'I will teach them not to kill with soup.', {'c': 5, 'g': -8, 'h': 12}),
            ('Закрыть храмовые кухни.', 'Close temple kitchens.', 'Люди будут голоднее, но меньше бегать к лекарям.', 'People hunger more but visit healers less.', {'c': -12, 'f': 5, 'h': 8}),
            ('Оставить как есть.', 'Leave as is.', 'Тогда пусть бог благословит их котлы. Им понадобится.', 'Then let god bless their pots. They will need it.', {'c': 5, 'h': -10})
        ],
    ),
    (
        'varn',
        'Храмовый колокол звонит ночью. Люди просыпаются, солдаты нервничают, больные не спят.',
        'The temple bell rings at night. People wake, soldiers fret, the sick cannot sleep.',
        [
            ('Запретить ночной звон.', 'Forbid night ringing.', 'Ночь станет тише. Священники — громче днём.', 'Night grows quiet. Priests louder by day.', {'a': 3, 'c': -10, 'h': 10}),
            ('Оставить звон.', 'Keep the ringing.', 'Тогда город будет молиться вместо сна.', 'The city will pray instead of sleep.', {'a': -3, 'c': 10, 'h': -8}),
            ('Звон только при опасности.', 'Ring only in danger.', 'Хорошо. Колокол станет сигналом, а не пыткой.', 'Good. The bell becomes signal, not torture.', {'a': 5, 'c': 3, 'h': 8})
        ],
    ),
    (
        'edric',
        'Если вы слишком часто стоите рядом с Малриком, народ перестанет видеть короля. Он увидит человека в тени жреца.',
        'If you stand too often beside Malrik, people stop seeing the king. They see a man in the priest\'s shadow.',
        [
            ('Появляться с Малриком чаще.', 'Appear with Malrik more often.', 'Святость укроет вас. И скроет тоже.', 'Holiness will cover you. And hide you too.', {'a': -5, 'c': 15, 'g': -5}),
            ('Появляться отдельно от церкви.', 'Appear apart from the church.', 'Трону нужен собственный силуэт.', 'The throne needs its own silhouette.', {'a': 5, 'c': -8, 'h': 3}),
            ('Появляться вместе только на больших праздниках.', 'Appear together only on great feasts.', 'Редкость делает союз сильнее. И безопаснее.', 'Rarity makes the alliance stronger. And safer.', {'a': 3, 'c': 5})
        ],
    ),
    (
        'malrik',
        'Я предлагаю, чтобы каждый чиновник принёс клятву верности не только короне, но и истинной вере.',
        'I propose every official swear loyalty not only to the crown but to the true faith.',
        [
            ('Ввести клятву веры.', 'Institute the oath of faith.', 'Теперь власть будет стоять на двух коленях: перед троном и алтарём.', 'Power will kneel twice: before throne and altar.', {'a': -5, 'c': 20, 'g': -5}),
            ('Клятва только короне.', 'Oath to crown alone.', 'Трон хочет верность без души. Опасная экономия.', 'The throne wants loyalty without soul. Dangerous thrift.', {'a': 8, 'c': -15}),
            ('Клятва веры добровольная.', 'Voluntary faith oath.', 'Добровольное благочестие часто становится обязательным само.', 'Voluntary piety often becomes mandatory on its own.', {'c': 5, 'h': 3})
        ],
    ),
    (
        'arvel',
        'Люди приходят исповедоваться и признаются в мелких кражах еды. Священники хотят передавать имена стражникам.',
        'People confess petty thefts of food. Priests want to give names to guards.',
        [
            ('Запретить передавать имена.', 'Forbid passing names.', 'Исповедь останется убежищем, не ловушкой.', 'Confession stays refuge, not trap.', {'a': -5, 'c': 5, 'h': 12}),
            ('Передавать имена воров.', 'Give thieves\' names.', 'Тогда люди перестанут каяться. И начнут молчать.', 'Then people stop confessing. And start staying silent.', {'a': 8, 'c': -8, 'f': 5}),
            ('Передавать только имена опасных преступников.', 'Report only dangerous criminals.', 'Это похоже на справедливость. Она редко бывает простой.', 'That resembles justice. It is rarely simple.', {'a': 5, 'c': 3, 'h': 3})
        ],
    ),
    (
        'borvin',
        'Старые храмы требуют ремонта. Если крыши рухнут, священники обвинят корону. Если платить, рухнет казна.',
        'Old temples need repair. If roofs fall, priests blame the crown. If you pay, the treasury falls.',
        [
            ('Оплатить ремонт.', 'Pay for repairs.', 'Крыши спасены. Моя душа — нет.', 'Roofs saved. My soul — not.', {'c': 15, 'g': -18, 'h': 5}),
            ('Ремонтировать только главные храмы.', 'Repair only main temples.', 'Выборочная святость. Дешевле полной.', 'Selective holiness. Cheaper than full.', {'c': 8, 'g': -8}),
            ('Пусть храмы чинятся сами.', 'Let temples repair themselves.', 'Казна суха. Храмы, возможно, нет.', 'Treasury dry. Temples perhaps not.', {'c': -12, 'g': 5})
        ],
    ),
    (
        'rudolf',
        'Малрик хочет везти реликвии вместе с армией. Если враг захватит обоз, это станет позором.',
        'Malrik wants relics with the army. If the enemy takes the train, it is disgrace.',
        [
            ('Взять реликвии с армией.', 'Take relics with the army.', 'Солдаты пойдут смелее. Обоз станет целью.', 'Soldiers march bolder. The train becomes a target.', {'a': 5, 'c': 15, 'g': -8}),
            ('Оставить реликвии в столице.', 'Leave relics in the capital.', 'Правильно. Война и так тащит достаточно лишнего.', 'Right. War hauls enough already.', {'a': 5, 'c': -10}),
            ('Взять копии реликвий.', 'Take copies of relics.', 'Подделка для храбрости. Странно, но легче защищать.', 'Fakes for courage. Strange, but easier to guard.', {'c': 5, 'g': -3})
        ],
    ),
    (
        'mira',
        'Священники говорят, что закрывать больных — значит лишать их молитвы. Они требуют открыть карантинные дома.',
        'Priests say quarantine denies prayer. They demand quarantine houses opened.',
        [
            ('Оставить карантин.', 'Keep quarantine.', 'Спасибо. Болезнь ненавидит закрытые двери.', 'Thank you. Disease hates closed doors.', {'c': -15, 'h': 20}),
            ('Пустить священников внутрь карантина.', 'Let priests into quarantine.', 'Они войдут к больным. Надеюсь, не выйдут к здоровым с заразой.', 'They enter to the sick. I hope they leave without plague.', {'c': 8, 'h': -5}),
            ('Открыть карантинные дома.', 'Open quarantine houses.', 'Тогда город получит свободу болезни.', 'Then the city gets freedom of disease.', {'c': 15, 'h': -25})
        ],
    ),
    (
        'gromm',
        'Если церковь объявит зимний пост, нам нужно больше рыбы и репы. Мяса будет меньше, но люди возненавидят холод сильнее.',
        'If the church declares a winter fast, we need more fish and turnip. Less meat, but people will hate the cold more.',
        [
            ('Готовить запасы для поста.', 'Stock for the fast.', 'Зима будет святой и пахнуть репой.', 'Winter will be holy and smell of turnip.', {'c': 8, 'f': 10, 'g': -12}),
            ('Не поддерживать зимний пост.', 'Do not support the winter fast.', 'Люди будут есть лучше. Священники — говорить хуже.', 'People eat better. Priests preach worse.', {'c': -10, 'f': -5, 'h': 5}),
            ('Пост только для богатых.', 'Fast only for the rich.', 'О, редкое чудо: богатые страдают первыми.', 'A rare miracle: the rich suffer first.', {'c': 5, 'f': 8, 'h': 8})
        ],
    ),
    (
        'varn',
        'Один стражник признался священнику, что брал взятки. Священник не хочет выдавать его имя.',
        'A guard confessed bribes to a priest. The priest will not give his name.',
        [
            ('Уважать тайну исповеди.', 'Respect confession secrecy.', 'Стража поймёт, что храм над законом. Опасный урок.', 'Guards learn the temple is above law. A dangerous lesson.', {'a': -8, 'c': 12}),
            ('Потребовать имя.', 'Demand the name.', 'Хорошо. Взятки прячутся хуже, когда исповедь не щит.', 'Good. Bribes hide poorly when confession is no shield.', {'a': 10, 'c': -12}),
            ('Объявить амнистию тем, кто признается сам.', 'Amnesty for those who confess themselves.', 'Мягкий капкан. Иногда лучшие.', 'A soft trap. Sometimes the best.', {'a': 5, 'c': 5, 'g': 3})
        ],
    ),
    (
        'edric',
        'Церковь уже кормит бедных, лечит больных, судит грешников и говорит, кто достоин трона. Что остаётся королю?',
        'The church feeds the poor, heals the sick, judges sinners, and says who deserves the throne. What remains for the king?',
        [
            ('Вернуть часть функций короне.', 'Return some duties to the crown.', 'Трон снова станет видимым. Храм — обиженным.', 'The throne visible again. The temple offended.', {'a': 8, 'c': -15, 'g': -10}),
            ('Оставить церковь сильной.', 'Leave the church strong.', 'Тогда править будет легко. Пока церковь хочет того же, что и вы.', 'Rule is easy — while church wants what you want.', {'a': -10, 'c': 20, 'g': 5}),
            ('Разделить обязанности письменно.', 'Divide duties in writing.', 'Хрупкий договор лучше крепкой ненависти.', 'A fragile pact beats solid hatred.', {'a': 5, 'c': 5, 'g': -5})
        ],
    ),
    (
        'malrik',
        'Ваше Величество, среди священников есть те, кто считает вас временным наказанием богов. Я могу заставить их молчать.',
        'Your Majesty, some priests think you a temporary punishment of the gods. I can silence them.',
        [
            ('Заставь их молчать.', 'Make them silent.', 'Молчание будет куплено страхом. Но страх тоже служит.', 'Silence bought with fear. Fear serves too.', {'c': 10, 'g': -10, 'h': 5}),
            ('Пусть говорят.', 'Let them speak.', 'Тогда храм станет рынком мнений. Опасное зрелище.', 'The temple becomes a market of opinions. Dangerous.', {'c': -5, 'h': -10}),
            ('Назови их имена.', 'Name them.', 'Вы хотите лечить веру мечом. Иногда это оставляет шрамы на троне.', 'You would heal faith with the sword. Sometimes that scars the throne.', {'a': 5, 'c': -15})
        ],
    ),
    (
        'arvel',
        'Люди просят провести службу за душу прежнего короля. Запретить — жестоко. Разрешить — опасно.',
        'People ask a service for the former king\'s soul. Forbid it — cruel. Allow it — dangerous.',
        [
            ('Разрешить службу.', 'Allow the service.', 'Мёртвые иногда успокаивают живых.', 'The dead sometimes calm the living.', {'a': -5, 'c': 8, 'h': 8}),
            ('Запретить службу.', 'Forbid the service.', 'Память не исчезнет. Она просто уйдёт в подвал.', 'Memory will not vanish. It goes to the cellar.', {'a': 8, 'c': -8, 'h': -10}),
            ('Разрешить без имени прежнего короля.', 'Allow without the former king\'s name.', 'Компромисс для тех, кто боится даже мёртвых имён.', 'A compromise for those who fear even dead names.', {'c': 3, 'h': 3})
        ],
    ),
    (
        'borvin',
        'Новая монета может нести ваш профиль или церковный символ. Первый вариант укрепит трон, второй — доверие народа.',
        'New coin may bear your profile or a church symbol. One strengthens the throne, the other people\'s trust.',
        [
            ('Профиль короля.', 'The king\'s profile.', 'Монета будет смотреть на народ вашим лицом.', 'The coin will look at the people with your face.', {'a': 5, 'c': -8, 'g': 5}),
            ('Церковный символ.', 'A church symbol.', 'Святая монета тратится так же быстро, но спорят с ней меньше.', 'Holy coin spends as fast, but argued over less.', {'a': -5, 'c': 12, 'g': 5}),
            ('Обе стороны: корона и алтарь.', 'Both sides: crown and altar.', 'Двуликая монета. Очень честно для политики.', 'A two-faced coin. Honest for politics.', {'a': 5, 'c': 5, 'g': -5})
        ],
    ),
    (
        'rudolf',
        'Малрик хочет прислать священника на военный совет. Я не обсуждаю фланги с человеком, который верит в чудеса.',
        'Malrik wants a priest on the war council. I do not discuss flanks with a man who believes in miracles.',
        [
            ('Пустить священника на совет.', 'Allow the priest on council.', 'Тогда пусть он молится, чтобы не мешал.', 'Then let him pray not to interfere.', {'a': -10, 'c': 12}),
            ('Запретить.', 'Forbid it.', 'Хорошо. Карта останется картой, не иконой.', 'Good. The map stays a map, not an icon.', {'a': 10, 'c': -10}),
            ('Пускать только без права голоса.', 'Allow without a vote.', 'Пусть слушает. Молчание я ещё терплю.', 'Let him listen. I still tolerate silence.', {'a': 3, 'c': 5})
        ],
    ),
    (
        'mira',
        'Женщины идут рожать в храм, потому что им обещают благословение. Но там нет чистых простыней.',
        'Women go to the temple to give birth for promised blessing. There are no clean linens.',
        [
            ('Запретить роды в храме.', 'Forbid births in the temple.', 'Дети будут рождаться в чистоте, а не в дыму свечей.', 'Children will be born in cleanliness, not candle smoke.', {'c': -10, 'h': 15}),
            ('Оборудовать храмовую комнату для родов.', 'Equip a temple birthing room.', 'Если уж они идут к храму, пусть храм хотя бы моет руки.', 'If they go to the temple, let it wash its hands.', {'c': 8, 'g': -10, 'h': 15}),
            ('Не вмешиваться.', 'Do not interfere.', 'Тогда благословение будет стоять рядом с заражением.', 'Blessing beside infection.', {'c': 8, 'h': -12})
        ],
    ),
    (
        'gromm',
        'Храм просит лучшее вино для службы. Солдаты просят то же самое без службы.',
        'The temple wants the best wine for service. Soldiers want the same without service.',
        [
            ('Отдать вино храму.', 'Give wine to the temple.', 'Святая чаша будет полной. Солдатские кружки — пустыми.', 'The holy cup full. Soldiers\' mugs empty.', {'a': -5, 'c': 10, 'g': -5}),
            ('Отдать вино армии.', 'Give wine to the army.', 'Солдаты выпьют за ваше здоровье. Храм — против него.', 'Soldiers drink to your health. The temple against it.', {'a': 10, 'c': -8}),
            ('Разбавить вино и разделить.', 'Dilute the wine and share.', 'Все получат меньше, чем хотели. Значит, справедливо.', 'All get less than wanted. So, fair.', {'a': 5, 'c': 5})
        ],
    ),
    (
        'varn',
        'Во время службы у храма поймали человека с ножом. Он говорит, что хотел убить не вас, а Малрика.',
        'During service by the temple a man with a knife was caught. He says he meant to kill not you but Malrik.',
        [
            ('Отдать его церкви.', 'Hand him to the church.', 'Храм будет судить нападение на храм. Удобно для них.', 'The temple tries an attack on the temple. Convenient for them.', {'a': -5, 'c': 12}),
            ('Судить королевским судом.', 'Try him in royal court.', 'Хорошо. Нож в столице — дело короны.', 'Good. A knife in the capital is the crown\'s business.', {'a': 10, 'c': -8}),
            ('Допросить тайно.', 'Interrogate in secret.', 'Если он правда шёл за Малриком, нам стоит узнать, кто его послал.', 'If he sought Malrik, we should learn who sent him.', {'a': 5, 'c': -3, 'g': -5})
        ],
    ),
    (
        'edric',
        'Народ теперь боится двух вещей: королевского меча и церковного проклятия. Вместе они держат порядок. Вместе они могут сломать страну.',
        'People now fear the royal sword and church curse. Together they hold order. Together they can break the realm.',
        [
            ('Использовать оба страха.', 'Use both fears.', 'Порядок будет крепким. Как клетка.', 'Order strong as a cage.', {'a': 10, 'c': 10, 'h': -15}),
            ('Смягчить королевские наказания.', 'Soften royal punishments.', 'Трон станет менее страшным. Это риск и надежда.', 'The throne less fearsome. Risk and hope.', {'a': -8, 'c': 3, 'h': 10}),
            ('Ограничить церковные проклятия.', 'Limit church curses.', 'Вы забрали у храма гром. Теперь ждите молний.', 'You took thunder from the temple. Now await lightning.', {'a': 5, 'c': -12, 'h': 8})
        ],
    ),
    (
        'malrik',
        'Если вы продолжите спорить с храмом, некоторые священники могут отказать вам в молитвах. Народ услышит это как приговор.',
        'If you keep quarreling with the temple, some priests may refuse you prayers. The people will hear that as verdict.',
        [
            ('Уступить храму.', 'Yield to the temple.', 'Молитвы продолжатся. Цена мира всегда ниже цены раскола.', 'Prayers continue. Peace costs less than schism.', {'a': -5, 'c': 20, 'g': -10}),
            ('Пригрозить храму.', 'Threaten the temple.', 'Вы можете напугать священника. Но не веру, которая стоит за ним.', 'You may frighten a priest. Not the faith behind him.', {'a': 12, 'c': -20}),
            ('Провести переговоры.', 'Negotiate.', 'Разговор — тонкий мост. Но мы пока ещё на нём.', 'Talk is a thin bridge. We are still on it.', {'c': 5, 'g': -5, 'h': 5})
        ],
    ),
    (
        'arvel',
        'Я открыл монастырские склады без разрешения Малрика. Люди ели. Теперь меня могут наказать.',
        'I opened monastery stores without Malrik\'s leave. People ate. Now I may be punished.',
        [
            ('Защитить Арвела.', 'Protect Arvel.', 'Спасибо. Я боялся не наказания, а того, что вы велите закрыть двери.', 'Thank you. I feared not punishment but your order to close the doors.', {'c': -12, 'f': 5, 'h': 15}),
            ('Вернуть его под суд церкви.', 'Return him to church judgment.', 'Я приму суд. Но голодные снова будут ждать.', 'I accept judgment. But the hungry will wait again.', {'c': 12, 'h': -8}),
            ('Заставить его вернуть зерно.', 'Make him return the grain.', 'Тогда я заберу хлеб из рук тех, кто уже сказал спасибо.', 'Then I take bread from hands that already thanked us.', {'c': 5, 'f': 10, 'h': -15})
        ],
    ),
    (
        'borvin',
        'Малрик намекает, что большое пожертвование ускорит официальное признание вашей власти церковью.',
        'Malrik hints a large gift will speed the church\'s official recognition of your rule.',
        [
            ('Заплатить.', 'Pay.', 'Поздравляю. Благословение оказалось товаром премиального качества.', 'Congratulations. Blessing is a premium product.', {'c': 25, 'g': -25}),
            ('Отказаться платить.', 'Refuse to pay.', 'Казна сохранена. Небеса, похоже, подождут.', 'Treasury saved. Heaven can wait.', {'c': -15, 'g': 10}),
            ('Предложить зерно вместо золота.', 'Offer grain instead of gold.', 'Святое признание за мешки зерна. Почти честно.', 'Holy recognition for sacks of grain. Almost honest.', {'c': 12, 'f': -15, 'h': 3})
        ],
    ),
]

EXACT_100 = (
    'edric',
    'Церковь больше не просто молится. Она кормит, судит, лечит, собирает золото и говорит, кто достоин трона. До девяностого дня осталось немного. Нужно решить, кем она станет.',
    'The church no longer merely prays. It feeds, judges, heals, collects gold, and says who deserves the throne. Little remains before the ninetieth day. You must decide what it becomes.',
    [
        ('Церковь станет опорой трона.', 'The church will be the throne\'s pillar.', 'Трон обретёт святую опору. И святую зависимость.', 'The throne gains a holy pillar. And holy dependence.', {'a': -10, 'c': 25, 'g': -10, 'h': 5}),
        ('Церковь будет подчинена короне.', 'The church will be subject to the crown.', 'Вы выбрали силу. Теперь храм может выбрать сопротивление.', 'You chose force. Now the temple may choose resistance.', {'a': 15, 'c': -25, 'g': 10}),
        ('Церковь и корона разделят власть.', 'Church and crown will share power.', 'Равновесие достигнуто. Осталось понять, кто первым его нарушит.', 'Balance is reached. Who breaks it first remains to be seen.', {'a': 5, 'c': 10, 'g': -5, 'h': 5}),
        ('Ослабить церковь через народную помощь от короны.', 'Weaken the church through royal aid to the people.', 'Если народ ест из вашей руки, он реже целует чужую.', 'If the people eat from your hand, they kiss another less often.', {'c': -10, 'f': -15, 'g': -10, 'h': 20})
    ],
)

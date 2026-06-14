#!/usr/bin/env python3
"""One-shot builder for mid_pool_encounters.py — run then delete."""

from __future__ import annotations

from pathlib import Path


def esc(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"')


def stats(d: dict | None) -> str:
    if d is None:
        return "None"
    parts = ", ".join(f'"{k}": {v}' for k, v in sorted(d.items()))
    return "{" + parts + "}"


def c(ru, en, rr, re, st=None, nxt=None):
    base = f'("{esc(ru)}", "{esc(en)}", "{esc(rr)}", "{esc(re)}", {stats(st)}'
    if nxt is not None:
        base += f", {nxt}"
    return base + ")"


def cf(ru, en):
    return c(ru, en, "", "", None, 1)


def node(prompt_ru, prompt_en, choices):
    lines = [
        f'        ("{esc(prompt_ru)}",',
        f'         "{esc(prompt_en)}",',
        "         [",
    ]
    for i, ch in enumerate(choices):
        comma = "," if i < len(choices) - 1 else ""
        lines.append(f"             {ch}{comma}")
    lines.append("         ]),")
    return "\n".join(lines)


def enc(char, num, title, nodes):
    out = [f"    # {num} — {title}", f'    ("{char}", [']
    out.extend(nodes)
    out[-1] = out[-1].rstrip(",")
    out.append("    ]),")
    return "\n".join(out)


DATA = [
    ("selena", 1, "Selena grain contract", [
        ("Мои караваны могут привезти зерно уже через три дня. Но я хочу исключительное право продавать хлеб в столице.",
         "My caravans can bring grain in three days. But I want exclusive right to sell bread in the capital.",
         [
             ("Дать тебе монополию.", "Grant you the monopoly.", "Хлеб есть — цена кусается.", "Bread arrives — the price bites.", {"f": 25, "g": 10, "p": -8}),
             ("Купить зерно без монополии.", "Buy grain without monopoly.", "Зерно приходит — казна страдает.", "Grain arrives — treasury suffers.", {"f": 15, "g": -15}),
             ("Отказать. Корона не будет зависеть от купцов.", "Refuse. The crown will not depend on merchants.", "Независимость дорога — амбары пустеют.", "Independence costly — granaries empty.", {"g": 5, "f": -15}),
             cf("Почему у тебя уже есть столько зерна?", "Why do you already have so much grain?"),
         ]),
        ("Потому что я покупаю, когда другие молятся. Деревни продавали дёшево, Ваше Величество. Я просто была быстрее ваших чиновников.",
         "Because I buy when others pray. Villages sold cheap, Your Grace. I was simply faster than your clerks.",
         [
             ("Тогда корона выкупит зерно по твоей цене.", "Then the crown will buy grain at your price.", "Зерно ваше — казна опустошена.", "Grain is yours — treasury drained.", {"f": 20, "g": -20}),
             ("Ты нажилась на страхе. Продашь дешевле.", "You profited from fear. Sell cheaper.", "Цена падает — купчиха злится.", "Price falls — merchant angry.", {"f": 18, "g": -8, "a": 3}),
             ("Конфисковать половину зерна.", "Confiscate half the grain.", "Зерно ваше — скандал тоже.", "Grain is yours — scandal too.", {"f": 25, "g": -5, "p": -8}),
             ("Оставь зерно себе. Корона найдёт другой путь.", "Keep your grain. The crown will find another way.", "Независимость дорога — амбары пустеют.", "Independence costly — granaries empty.", {"g": 5, "f": -15}),
         ]),
    ]),
    ("morwen", 2, "Morwen too many sentences", [
        ("Ваше Величество, тюрьмы полны сторонников прежнего короля. Если казнить всех, площадь не успеют отмыть.",
         "Your Grace, prisons hold the former king's followers. Execute all and the square cannot be washed in time.",
         [
             ("Казнить главных заговорщиков.", "Execute the chief conspirators.", "Главные мертвы. Остальные дрожат.", "Leaders dead. Others tremble.", {"a": 10, "p": -5}),
             ("Казнить всех.", "Execute all.", "Кровь на мостовой. Страх — в воздухе.", "Blood on cobbles. Fear — in the air.", {"a": 20, "p": -20}),
             ("Отправить их на работы.", "Send them to labour.", "Каторга кормит казну — не совесть.", "Labour feeds treasury — not conscience.", {"g": 10, "a": -5, "p": -5}),
             cf("Сколько среди них настоящих заговорщиков?", "How many are real conspirators?"),
         ]),
        ("Настоящих? Меньше половины. Но страх не спрашивает доказательств. Он работает и без них.",
         "Real ones? Less than half. But fear needs no proof. It works without it.",
         [
             ("Тогда казнить только доказанных.", "Then execute only the proven.", "Правосудие медленное — но точное.", "Justice slow — but precise.", {"a": 5, "p": 3}),
             ("Страх сейчас полезнее правды.", "Fear is more useful than truth now.", "Страх виден. Кровь — тоже.", "Fear visible. Blood too.", {"a": 15, "p": -15}),
             ("Разделить заключённых: виновных — на казнь, остальных — на работы.", "Split prisoners: guilty to death, rest to labour.", "Компромисс устраивает не всех.", "Compromise pleases not all.", {"a": 5, "g": 8, "p": -5}),
             ("Остановить казни до пересмотра дел.", "Halt executions until cases are reviewed.", "Правосудие медленное — но живое.", "Justice slow — but alive.", {"g": -5, "p": 12, "a": -5}),
         ]),
    ]),
    ("arvel", 3, "Arvel poor at monastery", [
        ("У ворот монастыря спят дети. Они просят не золота, а похлёбки. Разрешите открыть королевские запасы?",
         "Children sleep at the monastery gate. They ask not for gold but porridge. May we open the royal stores?",
         [
             ("Раздать похлёбку детям.", "Give porridge to the children.", "Дети едят. Сердца теплеют.", "Children eat. Hearts warm.", {"f": -10, "p": 15}),
             ("Раздать похлёбку всем бедным.", "Give porridge to all the poor.", "Очередь длинна — голод короче.", "Queue long — hunger shorter.", {"f": -25, "p": 25}),
             ("Пусть монастырь кормит их сам.", "Let the monastery feed them.", "Монахи стягивают пояса.", "Monks tighten belts.", {"f": 5, "p": -8}),
             cf("Почему они пришли к монастырю, а не к дворцу?", "Why did they come to the monastery, not the palace?"),
         ]),
        ("Потому что дворцовые ворота охраняют копья, а монастырские — только старые петли. Голодные идут туда, где их не бьют.",
         "Because palace gates are guarded by spears and monastery gates by old hinges. The hungry go where they are not beaten.",
         [
             ("Открыть королевскую кухню у дворца.", "Open a royal kitchen at the palace.", "Хлеб у дворца — надежда у народа.", "Bread at palace — hope for people.", {"f": -20, "p": 20, "g": -5}),
             ("Передать зерно монастырю.", "Give grain to the monastery.", "Монахи кормят — казна страдает.", "Monks feed — treasury suffers.", {"f": -15, "p": 18}),
             ("Поставить стражу у монастыря, чтобы не было толпы.", "Post guards at the monastery to prevent crowds.", "Порядок есть — голод остаётся.", "Order restored — hunger remains.", {"a": 5, "p": -8}),
             ("Дворец не богадельня.", "The palace is not a poorhouse.", "Независимость дорога — амбары пустеют.", "Independence costly — granaries empty.", {"f": 5, "p": -15}),
         ]),
    ]),
    ("ingvar", 4, "Ingvar northern courtesy", [
        ("Мой князь поздравляет вас с короной. Он просит лишь малого: снизить пошлину на северные меха.",
         "My prince congratulates you on the crown. He asks only this: lower the duty on northern furs.",
         [
             ("Снизить пошлину.", "Lower the duty.", "Меха текут. Казна теряет — торговля растёт.", "Furs flow. Treasury loses — trade grows.", {"g": -10, "f": 5}),
             ("Отказать.", "Refuse.", "Граница холоднеет.", "The border grows cold.", {"g": 10, "a": -5}),
             ("Повысить пошлину.", "Raise the duty.", "Казна радуется. Север злится.", "Treasury rejoices. North angers.", {"g": 20, "a": -10}),
             cf("Почему твой князь просит именно сейчас?", "Why does your prince ask precisely now?"),
         ]),
        ("Потому что новый король либо ищет друзей, либо показывает зубы. Мой князь хочет понять, кого он видит перед собой.",
         "Because a new king either seeks friends or shows teeth. My prince wants to know which he faces.",
         [
             ("Передай князю: я ищу друзей.", "Tell the prince: I seek friends.", "Север улыбается — казна платит.", "North smiles — treasury pays.", {"g": -8, "f": 10, "a": -3}),
             ("Передай князю: я показываю зубы.", "Tell the prince: I show teeth.", "Север молчит — армия довольна.", "North quiet — army pleased.", {"a": 10, "g": 5, "f": -5}),
             ("Передай князю: я торгую, но не кланяюсь.", "Tell the prince: I trade but do not bow.", "Сделка скрепляет мир.", "Deal cements peace.", {"g": 5, "f": 5}),
             ("Передай князю молчание.", "Tell the prince silence.", "Граница холоднеет.", "The border grows cold.", {"g": 3, "a": -5}),
         ]),
    ]),
    ("sivil", 5, "Sivil cheap medicine", [
        ("Я могу приготовить лекарство для нижнего города. Оно горькое, пахнет болотом, но многие выживут.",
         "I can brew medicine for the lower city. It is bitter, smells of swamp — but many will live.",
         [
             ("Купить лекарство для всех больных.", "Buy medicine for all the sick.", "Горькое зелье — сладкая жизнь.", "Bitter draught — sweet life.", {"g": -20, "p": 25}),
             ("Купить только для детей.", "Buy only for children.", "Малые живут — взрослые ждут.", "Little ones live — adults wait.", {"g": -8, "p": 12}),
             ("Пусть больные платят сами.", "Let the sick pay themselves.", "Богатые лечатся. Бедные умирают.", "Rich heal. Poor die.", {"g": 5, "p": -15}),
             cf("Почему оно такое дорогое?", "Why is it so expensive?"),
         ]),
        ("Потому что болотная лилия цветёт три ночи в году. А ещё потому что я не собираюсь умирать бедной, спасая ваших бедняков.",
         "Because swamp lily blooms three nights a year. And because I will not die poor saving your paupers.",
         [
             ("Заплатить твою цену.", "Pay your price.", "Жизни спасены — кошелёк опустошён.", "Lives saved — purse emptied.", {"g": -20, "p": 25}),
             ("Снизь цену, или я заберу рецепт силой.", "Lower the price or I take the recipe by force.", "Цена падает. Страх растёт.", "Price falls. Fear grows.", {"g": -8, "p": 20, "a": 3}),
             ("Продай рецепт короне.", "Sell the recipe to the crown.", "Рецепт ваш — цена разумная.", "Recipe yours — price fair.", {"g": -12, "p": 18}),
             ("Тогда бедные обойдутся без твоей лилии.", "Then the poor will do without your lily.", "Лекарство уходит. Больные остаются.", "Medicine leaves. Sick remain.", {"p": -10}),
         ]),
    ]),
    ("rudolf", 6, "Rudolf war tax", [
        ("Армия держит трон, но трон кормит армию плохо. Введите военный сбор.",
         "The army holds the throne — but the throne feeds the army poorly. Levy a war tax.",
         [
             ("Ввести сбор со всех.", "Levy all alike.", "Казна полна. Народ стонет.", "Treasury full. People groan.", {"g": 25, "a": 15, "p": -15}),
             ("Ввести сбор только с богатых.", "Tax only the rich.", "Богатые платят — бедные молчат.", "Rich pay — poor stay quiet.", {"g": 15, "a": 8}),
             ("Отказать армии.", "Refuse the army.", "Генералы хмурятся. Казна дышит.", "Generals frown. Treasury breathes.", {"a": -15, "g": 5}),
             cf("Сколько времени армия продержится без сбора?", "How long can the army hold without the levy?"),
         ]),
        ("Три недели — с дисциплиной. Пять — с кражами. Семь — с мятежом. Я предпочёл бы не проверять восьмую.",
         "Three weeks with discipline. Five with theft. Seven with mutiny. I would rather not test the eighth.",
         [
             ("Ввести временный сбор на месяц.", "Levy a temporary tax for one month.", "Казна полна. Народ стонет.", "Treasury full. People groan.", {"g": 15, "a": 10, "p": -8}),
             ("Выдать армии зерно вместо золота.", "Give grain instead of gold.", "Солдаты едят. Город голоднее.", "Soldiers eat. City hungrier.", {"a": 10, "f": -15}),
             ("Сократить жалование офицерам, но не солдатам.", "Cut officer pay, not soldiers'.", "Офицеры недовольны — солдаты довольны.", "Officers displeased — soldiers pleased.", {"a": 5, "g": 8}),
             ("Пусть армия терпит.", "Let the army endure.", "Генералы хмурятся. Казна дышит.", "Generals frown. Treasury breathes.", {"g": 5, "a": -20}),
         ]),
    ]),
    ("malrik", 7, "Malrik relics", [
        ("Если привезти святые мощи в столицу, люди забудут страх. Но дорога и охрана обойдутся дорого.",
         "Bring holy relics to the capital and people may forget fear. But road and escort will cost dearly.",
         [
             ("Организовать торжественную процессию.", "Organize a grand procession.", "Толпы молятся. Казна пустеет.", "Crowds pray. Treasury empties.", {"g": -15, "p": 15}),
             ("Привезти мощи тайно и без праздника.", "Bring relics secretly without feast.", "Тихая вера — дешевле.", "Quiet faith — cheaper.", {"g": -5, "p": 5}),
             ("Не тратить деньги на кости.", "Spend no coin on bones.", "Казна смеётся. Народ скучает.", "Treasury laughs. People sullen.", {"g": 8, "p": -5}),
             cf("Люди действительно верят в эти мощи?", "Do people truly believe in these relics?"),
         ]),
        ("Люди верят не в кости, Ваше Величество. Они верят, что кто-то над ними ещё не отвернулся.",
         "People believe not in bones, Your Grace. They believe someone above them has not turned away.",
         [
             ("Тогда пусть мощи прибудут с почестями.", "Then let relics arrive with honours.", "Толпы молятся. Казна пустеет.", "Crowds pray. Treasury empties.", {"g": -15, "p": 15}),
             ("Пусть церковь оплатит половину.", "Let the church pay half.", "Компромисс устраивает не всех.", "Compromise pleases not all.", {"g": -7, "p": 10}),
             ("Заменить процессию раздачей хлеба.", "Replace procession with bread distribution.", "Хлеб сильнее реликвий.", "Bread stronger than relics.", {"f": -10, "p": 12}),
             ("Нет. Король должен быть надеждой, не реликвии.", "No. The king must be hope, not relics.", "Казна смеётся. Народ скучает.", "Treasury laughs. People sullen.", {"g": 5, "p": -5}),
         ]),
    ]),
    ("borvin", 8, "Borvin sell offices", [
        ("Есть купцы, готовые купить чиновничьи места. Они будут воровать, конечно. Но сначала заплатят нам.",
         "Merchants will buy offices. They will steal, of course. But first they pay us.",
         [
             ("Продать должности.", "Sell the offices.", "Казна ломится. Народ страдает.", "Treasury bulges. People suffer.", {"g": 30, "p": -15}),
             ("Продать только мелкие должности.", "Sell only minor posts.", "Мелкая коррупция — крупная прибыль.", "Petty corruption — major profit.", {"g": 12, "p": -5}),
             ("Запретить продажу должностей.", "Forbid selling offices.", "Честность возвращается — медленно.", "Honesty returns — slowly.", {"p": 5, "g": -5}),
             cf("Насколько сильно они будут воровать?", "How much will they steal?"),
         ]),
        ("Настолько, насколько им позволят. То есть много, если мы будем смотреть в другую сторону. И умеренно, если будем брать долю.",
         "As much as we allow. Much if we look away. Moderately if we take a cut.",
         [
             ("Продать должности и брать долю.", "Sell offices and take a cut.", "Казна ломится. Народ страдает.", "Treasury bulges. People suffer.", {"g": 35, "p": -20}),
             ("Продать, но назначить проверяющих.", "Sell but appoint auditors.", "Мелкая коррупция — крупная прибыль.", "Petty corruption — major profit.", {"g": 15, "p": -5}),
             ("Потребовать оплату зерном, а не золотом.", "Demand payment in grain, not gold.", "Амбары полнятся — доверие падает.", "Granaries fill — trust falls.", {"f": 15, "g": 5, "p": -8}),
             ("Нет. Вор у власти дороже бедной казны.", "No. A thief in power costs more than an empty treasury.", "Честность возвращается — медленно.", "Honesty returns — slowly.", {"p": 8, "g": -5}),
         ]),
    ]),
    ("mira", 9, "Mira wounded after executions", [
        ("После публичных наказаний на площади давка. Раненых больше, чем преступников. Это не правосудие, это бойня.",
         "After public punishments a crush on the square. More wounded than criminals. This is not justice — slaughter.",
         [
             ("Запретить публичные казни.", "Ban public executions.", "Площадь тише. Армия недовольна.", "Square quieter. Army displeased.", {"p": 15, "a": -8}),
             ("Оставить только закрытые казни.", "Keep only private executions.", "Смерть за стенами.", "Death behind walls.", {"p": 8, "a": -3}),
             ("Площадь должна видеть силу короля.", "The square must see the king's strength.", "Страх виден. Кровь — тоже.", "Fear visible. Blood too.", {"a": 10, "p": -15}),
             cf("Толпа сама виновата?", "Is the crowd itself to blame?"),
         ]),
        ("Толпа виновата только в том, что боится. А страх толкается, падает, ломает рёбра и давит детей.",
         "The crowd is guilty only of fear. Fear pushes, falls, breaks ribs and crushes children.",
         [
             ("Поставить лекарей на площади во время наказаний.", "Post healers on the square during punishments.", "Раны лечат — страх остаётся.", "Wounds heal — fear remains.", {"g": -5, "p": 8, "a": 3}),
             ("Перенести казни за город.", "Move executions outside the city.", "Смерть за стенами.", "Death behind walls.", {"p": 10, "a": -5}),
             ("Запретить толпе подходить близко.", "Forbid crowds from approaching closely.", "Порядок есть — голод остаётся.", "Order restored — hunger remains.", {"a": 5, "p": 3}),
             ("Оставить всё как есть.", "Leave everything as is.", "Страх виден. Кровь — тоже.", "Fear visible. Blood too.", {"a": 8, "p": -12}),
         ]),
    ]),
    ("gromm", 10, "Gromm rats", [
        ("Крысы жрут лучше некоторых солдат. Если не очистить амбар, через неделю они станут жирнее казначея.",
         "Rats eat better than some soldiers. Clean the granary or in a week they will outfat the treasurer.",
         [
             ("Нанять крысоловов.", "Hire rat-catchers.", "Крысы уходят. Зерно остаётся.", "Rats leave. Grain stays.", {"g": -8, "f": 15, "p": 5}),
             ("Пустить дворцовых кошек в амбар.", "Loose palace cats in the granary.", "Кошки охотятся. Потери меньше.", "Cats hunt. Losses shrink.", {"f": 8}),
             ("Использовать отраву.", "Use poison.", "Крысы мертвы. Риск для людей.", "Rats dead. Risk for people.", {"f": 15, "p": -8}),
             cf("Насколько всё плохо?", "How bad is it?"),
         ]),
        ("Плохо? Одна крыса вчера утащила кусок сыра и посмотрела на меня так, будто я ей должен налоги.",
         "Bad? One rat yesterday stole cheese and looked at me as if I owed it taxes.",
         [
             ("Нанять лучших крысоловов.", "Hire the best rat-catchers.", "Крысы уходят. Зерно остаётся.", "Rats leave. Grain stays.", {"g": -12, "f": 20, "p": 8}),
             ("Дать отраву, но закрыть амбар на сутки.", "Use poison but close the granary for a day.", "Крысы мертвы. Риск для людей.", "Rats dead. Risk for people.", {"f": 15, "g": -3, "p": -3}),
             ("Пусть солдаты чистят амбар.", "Let soldiers clean the granary.", "Солдаты работают — армия недовольна.", "Soldiers labour — army displeased.", {"a": -5, "f": 12}),
             ("Пока не трогать.", "Leave it for now.", "Экономия сегодня — голод завтра.", "Savings today — hunger tomorrow.", {"g": 5, "f": -15}),
         ]),
    ]),
    ("varn", 11, "Varn barracks whisper", [
        ("Солдаты говорят, что вы слушаете купцов чаще, чем генералов. Это опасный шёпот.",
         "Soldiers say you heed merchants more than generals. Dangerous whispering.",
         [
             ("Устроить смотр армии.", "Hold an army review.", "Строй блестит. Шёпот стихает.", "Ranks gleam. Whispers fade.", {"a": 15, "g": -8}),
             ("Раздать солдатам хлеб и пиво.", "Give soldiers bread and ale.", "Полнота живота — короткая лояльность.", "Full bellies — brief loyalty.", {"a": 10, "f": -10, "g": -5}),
             ("Арестовать зачинщиков.", "Arrest the ringleaders.", "Страх возвращается в казармы.", "Fear returns to barracks.", {"a": 5, "p": -5}),
             cf("Кто начал этот шёпот?", "Who started this whispering?"),
         ]),
        ("Не один человек. Несколько костров, несколько кружек, одна и та же фраза: 'купцы едят, солдаты ждут'.",
         "Not one person. Several fires, several mugs, the same phrase: 'merchants eat, soldiers wait.'",
         [
             ("Накормить казармы сегодня же.", "Feed the barracks today.", "Полнота живота — короткая лояльность.", "Full bellies — brief loyalty.", {"a": 12, "f": -12}),
             ("Найти говорунов и наказать.", "Find the talkers and punish them.", "Страх возвращается в казармы.", "Fear returns to barracks.", {"a": 8, "p": -5}),
             ("Выступить перед солдатами лично.", "Address the soldiers personally.", "Строй блестит. Шёпот стихает.", "Ranks gleam. Whispers fade.", {"a": 10, "g": -3}),
             ("Пусть шепчут. Пока это только слова.", "Let them whisper. For now they are only words.", "Шёпот громче.", "Whispers grow louder.", {"a": -10}),
         ]),
    ]),
    ("edric", 12, "Edric old debts", [
        ("Кредиторы требуют выплаты долгов прежнего короля. Формально это не ваши долги. Но трон тот же.",
         "Creditors demand payment of the former king's debts. Formally not yours. But the throne is the same.",
         [
             ("Заплатить часть долгов.", "Pay part of the debts.", "Честь короны — цена казны.", "Crown honour — treasury's price.", {"g": -20, "p": 5}),
             ("Отказаться платить.", "Refuse to pay.", "Кредиторы злятся. Зерно дорожает.", "Creditors rage. Grain grows costly.", {"g": 10, "f": -5}),
             ("Заплатить зерном.", "Pay in grain.", "Хлебом — не золотом.", "With bread — not gold.", {"f": -15, "g": -5}),
             cf("Эти бумаги настоящие?", "Are these papers genuine?"),
         ]),
        ("Часть — настоящие. Часть — написаны слишком свежими чернилами для старого долга. Покойники, как правило, не занимают деньги вчера.",
         "Some are genuine. Some written in ink too fresh for old debt. The dead rarely borrow yesterday.",
         [
             ("Оплатить только доказанные долги.", "Pay only proven debts.", "Честь короны — цена казны.", "Crown honour — treasury's price.", {"g": -10, "p": 5}),
             ("Объявить подделки изменой.", "Declare forgeries treason.", "Правда видна. Казна дышит.", "Truth visible. Treasury breathes.", {"g": 8, "a": 5}),
             ("Использовать подделки для шантажа кредиторов.", "Use forgeries to blackmail creditors.", "Выигрыш грязный — но большой.", "Dirty win — but large.", {"g": 20, "p": -5}),
             ("Не платить никому.", "Pay no one.", "Кредиторы злятся. Зерно дорожает.", "Creditors rage. Grain grows costly.", {"g": 10, "f": -8}),
         ]),
    ]),
]

# Continue with encounters 13-48 in part 2 due to file size - will append via second write
print(f"Part 1: {len(DATA)} encounters")

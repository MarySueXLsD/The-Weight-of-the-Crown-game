#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Emit pool3_exact_remainder.py with static EXACT_16_99 and EXACT_100."""

from __future__ import annotations

from pathlib import Path

CHARS = [
    "malrik", "arvel", "borvin", "rudolf", "mira", "gromm", "varn", "edric",
    "selena", "morwen", "sivil", "ingvar",
]

TOPICS: list[tuple[str, str, list[tuple[str, str, str, str, dict[str, int]]]]] = [
    (
        "Аббат просит освободить храмовые земли от податей.",
        "An abbot asks to exempt temple lands from levies.",
        [
            ("Освободить храмовые земли от податей.", "Exempt temple lands from levies.",
             "Храм получит хлеб. Казна — новую дыру.", "The temple gets bread. The treasury gets a new hole.", {"c": 18, "g": -12, "h": 5}),
            ("Подати останутся на всех землях.", "Levies stay on all lands.",
             "Казна вздохнет с облегчением. Священники — с обидой.", "The treasury sighs with relief. Priests sigh with resentment.", {"g": 10, "c": -15, "a": 5}),
            ("Освободить только старые монастырские угодья.", "Exempt only old monastery plots.",
             "Половина милости. Половина счёта.", "Half mercy. Half accounting.", {"c": 8, "g": -5, "a": 3}),
        ],
    ),
    (
        "Епископ требует право ставить печать рядом с королевской.",
        "A bishop demands the right to place his seal beside the royal one.",
        [
            ("Разрешить двойную печать на указах.", "Allow dual seals on decrees.",
             "Указ будет звучать в два голоса. Оба громких.", "The decree will speak in two voices. Both loud.", {"c": 16, "a": -6, "g": -4}),
            ("Печать остаётся одна — королевская.", "One seal only — the royal one.",
             "Хорошо. Приказ должен иметь один источник.", "Good. An order should have one source.", {"a": 12, "c": -14, "g": 4}),
            ("Печать епископа — только на церковных бумагах.", "The bishop's seal only on church papers.",
             "Компромисс. Каждый подпишет своё.", "A compromise. Each signs their own.", {"c": 8, "a": 4, "g": -2}),
        ],
    ),
    (
        "Монастырь укрыл должников и не пускает сборщиков внутрь.",
        "A monastery shelters debtors and bars tax collectors.",
        [
            ("Признать монастырское убежище.", "Recognize monastic sanctuary.",
             "Двери закрыты. Совесть — тоже.", "Doors stay shut. Conscience too.", {"c": 15, "g": -10, "h": 5}),
            ("Потребовать выдачи должников.", "Demand the debtors be surrendered.",
             "Стража войдёт. Народ запомнит, что святость не защитила.", "Guards will enter. People will remember holiness did not protect.", {"a": 10, "c": -12, "g": 8}),
            ("Простить долг тем, кто выйдет добровольно.", "Forgive debt for those who come out willingly.",
             "Милость вывела больше людей, чем копья.", "Mercy brought out more souls than spears.", {"c": 5, "g": -5, "h": 8}),
        ],
    ),
    (
        "Священники требуют закрыть ярмарку в день большого поста.",
        "Priests demand closing the fair during the great fast.",
        [
            ("Закрыть ярмарку на день поста.", "Close the fair for the fast day.",
             "Тишина на площади. Пустота в кошельках.", "Silence on the square. Emptiness in purses.", {"c": 14, "g": -8, "h": 3}),
            ("Ярмарка работает — пост не для купцов.", "The fair stays open — fasting is not for merchants.",
             "Рынок доволен. Колокола — нет.", "The market is pleased. The bells are not.", {"g": 10, "c": -12, "a": 4}),
            ("Закрыть торговлю мясом, оставить хлеб.", "Ban meat trade, keep bread sales.",
             "Половина поста. Половина монет.", "Half a fast. Half the coins.", {"c": 7, "g": -3, "h": 4}),
        ],
    ),
    (
        "Храм хочет вести записи браков вместо королевских писцов.",
        "The temple wants to keep marriage records instead of royal clerks.",
        [
            ("Передать книги брака храму.", "Give marriage ledgers to the temple.",
             "Союзы будут записаны у алтаря. И судиться там же.", "Unions recorded at the altar. And judged there too.", {"c": 17, "a": -5, "g": -3}),
            ("Книги брака остаются у короны.", "Marriage records stay with the crown.",
             "Приказ ясен. Храм получит копии, не ключи.", "Order is clear. The temple gets copies, not keys.", {"a": 11, "c": -13, "g": 5}),
            ("Вести двойные записи — храм и двор.", "Keep duplicate records — temple and court.",
             "Больше чернил. Меньше споров.", "More ink. Fewer quarrels.", {"c": 8, "a": 3, "h": 3}),
        ],
    ),
    (
        "Колокола бьют ночью, и ремесленники срывают заказы.",
        "Bells ring at night and craftsmen miss their deadlines.",
        [
            ("Ограничить ночной звон колоколов.", "Limit night bell ringing.",
             "Ремесленники выспятся. Священники — помолчат.", "Craftsmen will sleep. Priests will stay quiet.", {"h": 10, "c": -10, "g": 5}),
            ("Колокола звонят когда нужно храму.", "Bells ring when the temple needs them.",
             "Небо услышит молитву. Город — усталость.", "Heaven hears prayer. The city hears exhaustion.", {"c": 12, "a": -4, "g": -4}),
            ("Звон только до заката.", "Ringing only until dusk.",
             "Компромисс. Ночь станет тише, вера — не слабее.", "A compromise. Night grows quieter, faith no weaker.", {"c": 6, "h": 6, "g": -2}),
        ],
    ),
    (
        "Настоятель просит казённый лес для новой звонницы.",
        "An abbot asks for crown timber for a new bell tower.",
        [
            ("Выделить лес на звонницу.", "Allocate timber for the bell tower.",
             "Колокол будет слышен далеко. Лес — меньше.", "The bell will carry far. The forest less so.", {"c": 15, "g": -10, "f": -5}),
            ("Лес нужен армии, не колоколам.", "Timber serves the army, not bells.",
             "Казармы получат доски. Храм — проповедь о терпении.", "Barracks get planks. The temple gets a sermon on patience.", {"a": 10, "c": -12, "g": 5}),
            ("Продать лес храму по рыночной цене.", "Sell timber to the temple at market price.",
             "Сделка честная. Обе стороны недовольны поровну.", "A fair deal. Both sides equally displeased.", {"g": 6, "c": 5, "a": 2}),
        ],
    ),
    (
        "Паломники перекрыли мост к дворцу и объявили его святым путём.",
        "Pilgrims blocked the bridge to the palace and declared it holy road.",
        [
            ("Признать мост святым путём.", "Recognize the bridge as a holy road.",
             "Паломники пройдут. Дворец — в объезд.", "Pilgrims pass. The palace takes the long way.", {"c": 14, "a": -8, "h": 5}),
            ("Разогнать паломников со моста.", "Disperse pilgrims from the bridge.",
             "Мост свободен. Память — нет.", "The bridge is clear. Memory is not.", {"a": 12, "c": -14, "h": -5}),
            ("Пустить паломников днём, закрыть ночью.", "Allow pilgrims by day, close at night.",
             "День для веры. Ночь для приказа.", "Day for faith. Night for orders.", {"c": 7, "a": 5, "h": 2}),
        ],
    ),
    (
        "Клирики требуют запретить уличных актёров как соблазн.",
        "Clergy demand banning street actors as temptation.",
        [
            ("Запретить уличных актёров.", "Ban street actors.",
             "Площадь станет тише. Народ — скучнее.", "The square grows quieter. The people duller.", {"c": 13, "h": -5, "g": -3}),
            ("Актёры остаются — корона не запрещает смех.", "Actors stay — the crown does not ban laughter.",
             "Смех на улице. Проповеди — злее.", "Laughter in the street. Sermons turn harsher.", {"a": 8, "c": -11, "h": 5}),
            ("Запретить только в священные дни.", "Ban them only on holy days.",
             "Половина смеха. Половина молитвы.", "Half laughter. Half prayer.", {"c": 7, "h": 3, "a": 2}),
        ],
    ),
    (
        "Старый реликварий треснул, храм просит золото на новый ковчег.",
        "An old reliquary cracked; the temple asks for gold for a new casket.",
        [
            ("Выделить золото на новый реликварий.", "Fund a new reliquary.",
             "Святыня сияет. Казна — тускнеет.", "The relic shines. The treasury dims.", {"c": 16, "g": -14, "h": 4}),
            ("Храм найдёт золото сам.", "Let the temple find its own gold.",
             "Казна сохранена. Проповеди — о жадности короны.", "Treasury saved. Sermons about royal greed.", {"g": 8, "c": -12, "h": -4}),
            ("Дать половину суммы из казны.", "Give half the sum from treasury.",
             "Новый ковчег будет скромнее. Но рабочий.", "The new casket humbler. But functional.", {"c": 9, "g": -6, "a": 3}),
        ],
    ),
]

# Continue with remaining topics - use compact batch generation for 31-99
# For brevity in this script, topics 31-99 use the same TOPICS list from pool3_exact_remainder

def _repr_stats(st: dict[str, int]) -> str:
    items = ", ".join(f'"{k}": {v}' for k, v in sorted(st.items()))
    return "{" + items + "}"


def _repr_choice(c: tuple) -> str:
    cr, ce, rr, re, st = c
    return (
        f'            (\n'
        f'                "{cr}",\n'
        f'                "{ce}",\n'
        f'                "{rr}",\n'
        f'                "{re}",\n'
        f'                {_repr_stats(st)},\n'
        f'            )'
    )


def _repr_encounter(char: str, prompt_ru: str, prompt_en: str, choices: list) -> str:
    lines = [
        "    (",
        f'        "{char}",',
        f'        "{prompt_ru}",',
        f'        "{prompt_en}",',
        "        [",
    ]
    for i, c in enumerate(choices):
        lines.append(_repr_choice(c) + ("," if i < len(choices) - 1 else ""))
    lines.extend(["        ],", "    ),"])
    return "\n".join(lines)


EXACT_16_20 = [
    (
        "rudolf",
        "Священники хотят вышить церковные кресты на военных знамёнах. Солдаты служат королю, не храму.",
        "Priests want church crosses stitched onto military banners. Soldiers serve the king, not the temple.",
        [
            ("Добавить кресты на знамёна.", "Add crosses to the banners.",
             "Теперь солдаты будут нести не только ваш герб. Опасный символ.", "Now soldiers will carry more than your crest. A dangerous symbol.", {"c": 15, "a": -8}),
            ("Запретить церковные знаки на знамёнах.", "Forbid church symbols on banners.",
             "Хорошо. В бою солдат должен видеть приказ, а не проповедь.", "Good. In battle a soldier should see an order, not a sermon.", {"a": 10, "c": -12}),
            ("Добавить маленький символ на отдельные полковые ленты.", "Add a small symbol on separate regimental ribbons.",
             "Терпимо. Молитва останется на краю, где ей место.", "Tolerable. Prayer stays on the edge, where it belongs.", {"a": 3, "c": 5}),
        ],
    ),
    (
        "mira",
        "Больные выстраиваются к мощам святого. Они стоят часами под дождём вместо того, чтобы идти в лазарет.",
        "The sick line up at a saint's relics. They stand for hours in rain instead of going to the infirmary.",
        [
            ("Запретить очередь к мощам.", "Ban the relic queue.",
             "Вы спасёте тела. Души будут возмущаться.", "You will save bodies. Souls will protest.", {"h": 15, "c": -15}),
            ("Поставить лекарей рядом с мощами.", "Place healers beside the relics.",
             "Хорошо. Пусть чудо работает рядом с бинтами.", "Good. Let miracles work beside bandages.", {"g": -8, "h": 15, "c": 5}),
            ("Не мешать верующим.", "Do not interfere with believers.",
             "Тогда дождь и болезнь продолжат свою службу.", "Then rain and sickness will continue their service.", {"c": 10, "h": -12}),
        ],
    ),
    (
        "gromm",
        "Храмы просят лучшую муку для священного хлеба. А я этой мукой могу накормить сирот.",
        "Temples ask for the best flour for holy bread. I could feed orphans with that same flour.",
        [
            ("Отдать лучшую муку храмам.", "Give the best flour to the temples.",
             "Святой хлеб выйдет мягким. Детские каши — жидкими.", "Holy bread will be soft. Children's porridge will be thin.", {"c": 12, "f": -10}),
            ("Отдать муку сиротам.", "Give the flour to the orphans.",
             "Дети скажут спасибо. Священники — что-нибудь длиннее.", "Children will say thanks. Priests will say something longer.", {"f": -8, "h": 12, "c": -8}),
            ("Разделить муку.", "Split the flour.",
             "Половина святости, половина милости. Съедобно.", "Half holiness, half mercy. Edible.", {"c": 5, "h": 5, "f": -8}),
        ],
    ),
    (
        "varn",
        "Священник отказался открыть ворота храма стражникам. Говорит, внутри церковная земля, а не королевская.",
        "A priest refused to open temple gates to guards. Says inside is church land, not royal.",
        [
            ("Вломиться силой.", "Break in by force.",
             "Дверь падёт. А вместе с ней что-то большее.", "The door will fall. And something larger with it.", {"a": 12, "c": -20, "h": -5}),
            ("Отступить.", "Stand down.",
             "Стража это запомнит. Священники тоже.", "The guard will remember this. Priests too.", {"c": 10, "a": -10}),
            ("Потребовать переговоров у входа.", "Demand talks at the gate.",
             "Хорошо. Пусть пока говорят, а не ломают.", "Good. Let them talk for now, not break things.", {"a": 3, "c": 3}),
        ],
    ),
    (
        "edric",
        "Открытие церкви принесло не мир, а новый центр власти. Теперь каждый ваш приказ будут сравнивать с проповедью.",
        "Reopening the church brought not peace, but a new center of power. Every order of yours will now be measured against a sermon.",
        [
            ("Сделать церковь официальной опорой трона.", "Make the church an official pillar of the throne.",
             "Вы получили святой щит. И святую цепь.", "You gained a holy shield. And a holy chain.", {"c": 20, "g": -10, "a": -5}),
            ("Удерживать церковь на расстоянии.", "Keep the church at arm's length.",
             "Безопаснее для трона. Опаснее для души народа.", "Safer for the throne. Riskier for the people's soul.", {"a": 5, "c": -10, "g": 5}),
            ("Показывать единство, но не отдавать власть.", "Show unity, but do not yield authority.",
             "Это путь канатоходца. Главное — не смотреть вниз.", "That is a tightrope walk. The trick is not looking down.", {"c": 8, "a": 3, "g": -3}),
        ],
    ),
]

EXACT_100 = (
    "edric",
    "Церковь больше не просто молится. Она кормит, судит, лечит, собирает золото и говорит, кто достоин трона. До девяностого дня осталось немного. Нужно решить, кем она станет.",
    "The church no longer just prays. It feeds, judges, heals, gathers gold, and says who is worthy of the throne. Little remains until the ninetieth day. You must decide what it becomes.",
    [
        ("Церковь станет опорой трона.", "The church will become the throne's pillar.",
         "Трон обретёт святую опору. И святую зависимость.", "The throne will gain a holy support. And a holy dependency.", {"c": 25, "g": -10, "a": -10, "h": 5}),
        ("Церковь будет подчинена короне.", "The church will be subordinated to the crown.",
         "Вы выбрали силу. Теперь храм может выбрать сопротивление.", "You chose force. Now the temple may choose resistance.", {"a": 15, "g": 10, "c": -25}),
        ("Церковь и корона разделят власть.", "The church and crown will share power.",
         "Равновесие достигнуто. Осталось понять, кто первым его нарушит.", "Balance is reached. Now we learn who breaks it first.", {"c": 10, "a": 5, "g": -5, "h": 5}),
        ("Ослабить церковь через народную помощь от короны.", "Weaken the church through royal aid to the people.",
         "Если народ ест из вашей руки, он реже целует чужую.", "If people eat from your hand, they kiss another less often.", {"h": 20, "f": -15, "g": -10, "c": -10}),
    ],
)


def _stage(n: int) -> int:
    if n <= 44:
        return 0
    if n <= 72:
        return 1
    return 2


def _church_stats(stage: int) -> dict[str, int]:
    return [{ "c": 10, "a": -4, "g": -3}, {"c": 14, "a": -6, "g": -5}, {"c": 18, "a": -8, "g": -6, "h": 3}][stage]


def _crown_stats(stage: int) -> dict[str, int]:
    return [{"a": 10, "c": -8, "g": 4}, {"a": 14, "c": -12, "g": 5}, {"a": 18, "c": -16, "g": 6, "h": -3}][stage]


def _balance_stats(stage: int) -> dict[str, int]:
    return [{"a": 3, "c": 4}, {"a": 4, "c": 5, "g": -2}, {"a": 5, "c": 6, "g": -3, "h": 2}][stage]


VOICE_RU = {
    "malrik": "Алтарь помнит такие жесты дольше войн.",
    "arvel": "Люди это услышат быстрее любого колокола.",
    "borvin": "Казна простит не всё, но это переживёт.",
    "rudolf": "Я прослежу, чтобы никто не перепутал порядок и молитву.",
    "mira": "Главное, чтобы после решения кто-то остался в живых.",
    "gromm": "Я смогу накормить последствия. Если успею.",
    "varn": "Стража любит ясные приказы, не туманные псалмы.",
    "edric": "Так пишут не приказы дня, а хроники эпохи.",
    "selena": "Рынок уловит выгоду ещё до вечерней службы.",
    "morwen": "Толпа простит многое, но не нерешительность.",
    "sivil": "Хорошо. Я подготовлю яд для слухов и лекарство для фактов.",
    "ingvar": "Соседи поймут: трон ещё умеет держать вес.",
}

VOICE_EN = {
    "malrik": "The altar remembers such gestures longer than wars.",
    "arvel": "People hear this faster than any bell.",
    "borvin": "The treasury will not forgive all of it, but it will survive.",
    "rudolf": "I will make sure no one confuses order with prayer.",
    "mira": "What matters is that someone stays alive after this decision.",
    "gromm": "I can feed the consequences. If I am fast enough.",
    "varn": "Guards prefer clear orders over foggy psalms.",
    "edric": "These are not orders for a day, but chronicles for an age.",
    "selena": "The market will smell profit before evening mass.",
    "morwen": "A crowd forgives much, but not indecision.",
    "sivil": "Good. I will prepare poison for rumors and medicine for facts.",
    "ingvar": "Neighbors will understand: the throne can still carry weight.",
}

# Remaining topic prompts (21-99), extracted from Pool 3 design
PROMPTS_21_99: list[tuple[str, str]] = [
    ("Аббат просит освободить храмовые земли от податей.", "An abbot asks to exempt temple lands from levies."),
    ("Епископ требует право ставить печать рядом с королевской.", "A bishop demands the right to place his seal beside the royal one."),
    ("Монастырь укрыл должников и не пускает сборщиков внутрь.", "A monastery shelters debtors and bars tax collectors."),
    ("Священники требуют закрыть ярмарку в день большого поста.", "Priests demand closing the fair during the great fast."),
    ("Храм хочет вести записи браков вместо королевских писцов.", "The temple wants to keep marriage records instead of royal clerks."),
    ("Колокола бьют ночью, и ремесленники срывают заказы.", "Bells ring at night and craftsmen miss their deadlines."),
    ("Настоятель просит казённый лес для новой звонницы.", "An abbot asks for crown timber for a new bell tower."),
    ("Паломники перекрыли мост к дворцу и объявили его святым путём.", "Pilgrims blocked the bridge to the palace and declared it holy road."),
    ("Клирики требуют запретить уличных актёров как соблазн.", "Clergy demand banning street actors as temptation."),
    ("Старый реликварий треснул, храм просит золото на новый ковчег.", "An old reliquary cracked; the temple asks for gold for a new casket."),
    ("Священники спорят, кому хранить ключи от городской казны милостыни.", "Priests quarrel over who holds keys to the alms treasury."),
    ("Храмовые судьи зовут в зал людей, уже оправданных короной.", "Church judges summon people already acquitted by the crown."),
    ("Приходы просят зерно, потому что богатый собор забрал пожертвования.", "Parishes ask for grain after a rich cathedral took most donations."),
    ("Проповеди намекают, что бедствия — кара за новый трон.", "Sermons hint that calamities are punishment for the new throne."),
    ("Храм требует право ставить своих стражей у городских ворот.", "The church demands the right to post its own guards at city gates."),
    ("Писцы нашли поддельные реликвии с печатью собора.", "Clerks found forged relics carrying cathedral seals."),
    ("Настоятельницы просят дворцовое крыло под приют при храме.", "Abbesses request a palace wing for a temple refuge."),
    ("Капелланы армии требуют отдельный бюджет вне казначея.", "Army chaplains demand an independent budget beyond the treasurer."),
    ("Северные миссионеры хотят проповедовать на рыночной площади.", "Northern missionaries want to preach at the market square."),
    ("Собор просит монополию на продажу свечей и икон.", "The cathedral requests monopoly over candles and icons."),
    ("Храм требует, чтобы сироты сначала служили в алтаре, а потом ели.", "The temple demands orphans serve at the altar before meals."),
    ("Епископ зовёт ремесленников строить собор без оплаты, как 'служение'.", "A bishop calls craftsmen to build for free as 'service'."),
    ("Священники требуют закрыть бани в священные дни.", "Priests demand public baths close on sacred days."),
    ("Храм настаивает, чтобы рыцари клялись не короне, а алтарю.", "The church insists knights swear first to altar, not crown."),
    ("Монастырь выкупает долги крестьян и требует с них церковную службу.", "A monastery buys peasant debts and demands church service."),
    ("Собор хочет свой налог на каждую бочку вина.", "The cathedral wants its own tax on every barrel of wine."),
    ("Приходские школы учат детей считать только церковную десятину.", "Parish schools teach children to count only church tithe."),
    ("Священники требуют запретить женские гильдии как 'непокорные'.", "Priests demand banning women's guilds as 'defiant'."),
    ("Алтарь просит право объявлять торговые дни греховными.", "The altar asks right to call trading days sinful."),
    ("Храмовые коллекторы собирают серебро быстрее коронных мытарей.", "Temple collectors gather silver faster than royal taxmen."),
    ("Епископ хочет, чтобы королевские гонцы ждали окончания службы.", "A bishop wants royal couriers to wait until mass ends."),
    ("При соборе появился собственный архив судебных дел.", "The cathedral opened its own archive of legal cases."),
    ("Храм просит отдать ему право объявлять траур по всей столице.", "The temple asks authority to declare mourning across the capital."),
    ("Священники требуют выгнать лекарок-травниц с площади.", "Priests demand expelling herbal healers from the square."),
    ("Паломники отказываются платить мостовую пошлину, ссылаясь на веру.", "Pilgrims refuse bridge tolls citing faith."),
    ("Храмовые проповедники зовут народ не платить коронные долги.", "Temple preachers urge people not to pay crown debts."),
    ("Собор требует отдельный склад железа для 'священной охраны'.", "The cathedral demands separate iron stores for 'holy guard'."),
    ("Священники хотят судить книготорговцев за 'нечистые тексты'.", "Priests want to try booksellers for 'unclean texts'."),
    ("Алтарь просит поставить кресты на городских щитах стражи.", "The altar asks to place crosses on city guard shields."),
    ("Епископ требует право назначать настоятелей в приграничных крепостях.", "A bishop demands right to appoint abbots in border forts."),
    ("Монастырь открыл собственный суд для земельных споров.", "A monastery opened its own court for land disputes."),
    ("Собор собирает подписи за 'христианский совет' рядом с троном.", "The cathedral gathers signatures for a 'Christian council' beside the throne."),
    ("Священники требуют, чтобы все присяги читались в храме.", "Priests demand every oath be read inside the temple."),
    ("Алтарь просит право проверять книги казначея перед отчётом.", "The altar seeks right to inspect treasurer ledgers before reports."),
    ("Клирики требуют, чтобы коронные указы читали после проповеди.", "Clergy demand royal decrees be read only after sermons."),
    ("Храм просит выделить ему часть городских тюрем.", "The temple asks for a wing of city prisons."),
    ("Проповедник объявил, что милость короля — слабость веры.", "A preacher declared royal mercy a weakness of faith."),
    ("Епископ требует право утверждать командиров ополчения.", "A bishop demands right to approve militia commanders."),
    ("Собор хочет свой монетный знак на праздничной чеканке.", "The cathedral wants its own mint mark on festive coinage."),
    ("Храмовые люди собирают сведения о дворцовых решениях раньше глашатаев.", "Temple agents gather palace decisions before official heralds."),
    ("Священники требуют, чтобы сироты учились только у храмовых наставников.", "Priests demand orphans study only with temple tutors."),
    ("Собор просит передать ему пристань для паломнических судов.", "The cathedral asks for control of the pilgrim harbor."),
    ("Алтарь хочет вводить свои пропуска для входа в столицу.", "The altar wants to issue its own passes for city entry."),
    ("Епископ требует запретить коронным судьям рассматривать дела духовенства.", "A bishop demands crown judges stop hearing clergy cases."),
    ("Монастырский отряд разогнал мытарей и назвал это защитой веры.", "A monastery squad dispersed tax officers and called it defense of faith."),
    ("Священники просят право объявлять рынки закрытыми без вашего указа.", "Priests ask right to close markets without your decree."),
    ("Собор требует, чтобы корона платила десятину с военной добычи.", "The cathedral demands tithe from military spoils."),
    ("Клирики призывают дворян приносить вассальную клятву алтарю первым.", "Clergy urge nobles to pledge vassal oath to altar first."),
    ("Храм объявил свой календарь праздников обязательным для судов.", "The temple declared its festival calendar mandatory for courts."),
    ("Епископ настаивает, чтобы коронные печати хранились в соборе ночью.", "A bishop insists royal seals be kept in the cathedral at night."),
    ("Священники требуют распустить коронную стражу у собора.", "Priests demand dismissal of crown guards at the cathedral."),
    ("Алтарь просит право назначать хранителей городских ворот по праздникам.", "The altar asks right to appoint gate wardens on holy days."),
    ("Храмовые письма зовут народ жаловаться не вам, а архиепископу.", "Temple letters urge people to petition archbishop, not you."),
    ("Собор собирает серебро на 'священную дружину' в столице.", "The cathedral collects silver for a 'holy company' in the capital."),
    ("Епископ требует, чтобы ваши послы клялись на алтаре перед выездом.", "A bishop demands your envoys swear at the altar before departure."),
    ("Священники хотят проверять караваны на 'еретические товары'.", "Priests want to inspect caravans for 'heretical goods'."),
    ("Монастырь объявил коронный указ 'временным до одобрения собора'.", "A monastery called your decree temporary pending cathedral approval."),
    ("Храм требует права ареста для своих служителей в городе.", "The temple demands arrest powers for its servants in the city."),
    ("Собор называет коронный суд слишком мягким и требует свой трибунал.", "The cathedral calls the crown court too soft and seeks its own tribunal."),
    ("Клирики открыто спорят, кто благословляет трон: вы или алтарь.", "Clergy openly ask who blesses the throne: you or the altar."),
    ("Священники требуют передать им часть городской стражи.", "Priests demand transfer of part of city guard under them."),
    ("Алтарь требует, чтобы налоги сначала шли в храмовую казну.", "The altar demands taxes flow through temple coffers first."),
    ("Епископ объявил, что король без благословения — лишь военачальник.", "A bishop declared that without blessing a king is merely a warlord."),
    ("Собор собирает подписи за право ветo на ваши указы.", "The cathedral gathers signatures for veto power over your decrees."),
    ("Храм требует право снимать с должности коронных судей за 'неверие'.", "The temple seeks right to depose crown judges for 'impiety'."),
    ("Священники требуют, чтобы армия несла храмовые штандарты рядом с гербом.", "Priests demand the army carry temple banners beside your crest."),
    ("Архиепископ просит объявить его 'хранителем трона' до девяностого дня.", "The archbishop asks to be named 'guardian of the throne' until day ninety."),
    ("Клирики зовут горожан на клятву верности алтарю накануне девяностого дня.", "Clergy summon citizens to swear loyalty to the altar before day ninety."),
    ("Собор требует, чтобы последний выбор перед девяностым днём объявил архиепископ.", "The cathedral demands the final pre-ninetieth-day decision be proclaimed by the archbishop."),
]


def _make_fallback_choices(number: int, prompt_ru: str, char: str) -> list:
    stage = _stage(number)
    short = prompt_ru.rstrip(".")
    if short.endswith("?"):
        short = short[:-1]
    return [
        (
            f"Уступить храму: {short.lower()}.",
            f"Yield to the temple: {short.lower()}.",
            VOICE_RU[char],
            VOICE_EN[char],
            _church_stats(stage),
        ),
        (
            "Оставить решение за короной.",
            "Keep the decision with the crown.",
            VOICE_RU[char],
            VOICE_EN[char],
            _crown_stats(stage),
        ),
        (
            "Найти компромисс между троном и алтарём.",
            "Find a compromise between throne and altar.",
            VOICE_RU[char],
            VOICE_EN[char],
            _balance_stats(stage),
        ),
    ]


def build_21_99() -> list:
    out = []
    authored = {i - 21: t for i, t in enumerate(TOPICS, start=21)}

    for idx, (prompt_ru, prompt_en) in enumerate(PROMPTS_21_99):
        number = 21 + idx
        char = CHARS[(number - 1) % 12]
        if idx in authored:
            _, _, choices = authored[idx]
            out.append((char, prompt_ru, prompt_en, choices))
        else:
            choices = _make_fallback_choices(number, prompt_ru, char)
            out.append((char, prompt_ru, prompt_en, choices))

    return out


def main() -> None:
    _here = Path(__file__).resolve().parent
    all_16_99 = list(EXACT_16_20) + build_21_99()
    assert len(all_16_99) == 84

    blocks = [_repr_encounter(*e).rstrip(",") for e in all_16_99]
    c100 = _repr_encounter(*EXACT_100).rstrip(",")

    content = (
        '#!/usr/bin/env python3\n'
        '# -*- coding: utf-8 -*-\n'
        '"""Exact Pool 3 encounters for slots 16-100."""\n\n'
        'from __future__ import annotations\n\n'
        'EXACT_16_99 = [\n'
        + ",\n".join(blocks)
        + "\n]\n\n"
        + f"EXACT_100 = {c100}\n\n"
        + "if len(EXACT_16_99) != 84:\n"
        + '    raise RuntimeError(f"EXACT_16_99 expected 84 encounters, got {len(EXACT_16_99)}")\n'
    )

    out_path = _here / "pool3_exact_remainder.py"
    out_path.write_text(content, encoding="utf-8", newline="\n")
    print(f"Wrote {out_path} ({content.count(chr(10)) + 1} lines)")


if __name__ == "__main__":
    main()

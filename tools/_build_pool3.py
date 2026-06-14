#!/usr/bin/env python3
"""Build encounter_data_pool3.py with 100 Pool 3 encounters."""

from __future__ import annotations

from pathlib import Path


def esc(s: str) -> str:
    return s.replace("\\", "\\\\").replace("'", "\\'")


def stats(d: dict[str, int] | None) -> str:
    if d is None:
        return "None"
    items = ", ".join(f"'{k}': {v}" for k, v in sorted(d.items()))
    return "{" + items + "}"


def enc(char: str, prompt_ru: str, prompt_en: str, choices: list[tuple[str, str, str, str, dict[str, int]]]) -> str:
    lines = [
        f"    ('{esc(char)}', [",
        f"        ('{esc(prompt_ru)}', '{esc(prompt_en)}', [",
    ]
    for idx, (choice_ru, choice_en, resp_ru, resp_en, st) in enumerate(choices):
        comma = "," if idx < len(choices) - 1 else ""
        lines.append(
            "            "
            f"('{esc(choice_ru)}', '{esc(choice_en)}', '{esc(resp_ru)}', '{esc(resp_en)}', {stats(st)}){comma}"
        )
    lines.extend(
        [
            "        ]),",
            "    ]),",
        ]
    )
    return "\n".join(lines)


CHARS = [
    "malrik",
    "arvel",
    "borvin",
    "rudolf",
    "mira",
    "gromm",
    "varn",
    "edric",
    "selena",
    "morwen",
    "sivil",
    "ingvar",
]


FIRST_TWELVE = [
    (
        "malrik",
        "Корона нуждается в благословении. Церковь назовет вас законным королем или узурпатором.",
        "The crown needs a blessing. The church will name you lawful king or usurper.",
        [
            (
                "Попросить благословение церкви.",
                "Ask for the church blessing.",
                "Смирение — хорошее начало для короны.",
                "Humility is a good beginning for a crown.",
                {"c": 20, "g": -10},
            ),
            (
                "Потребовать немедленного признания.",
                "Demand immediate recognition.",
                "Приказы доходят до солдат быстрее, чем до сердец.",
                "Orders reach soldiers faster than hearts.",
                {"a": 8, "c": -15},
            ),
            (
                "Предложить союз трона и алтаря.",
                "Offer an alliance of throne and altar.",
                "Союз трона и алтаря держится на взаимной выгоде.",
                "An alliance of throne and altar stands on mutual gain.",
                {"c": 10, "g": -5, "h": 5},
            ),
        ],
    ),
    (
        "arvel",
        "После проповеди у монастыря снова толпа голодных. Они просят еды, а не слов.",
        "After the sermon the monastery gate is crowded with hungry people again. They ask for food, not words.",
        [
            (
                "Открыть зерновые запасы и накормить всех.",
                "Open grain stores and feed everyone.",
                "Сегодня вера будет пахнуть хлебом.",
                "Today faith will smell like bread.",
                {"f": -15, "h": 15, "c": 8},
            ),
            (
                "Выдать только малые пайки.",
                "Issue only small rations.",
                "Мы попробуем. Но пустой котел не поет молитв.",
                "We will try. But an empty pot sings no prayers.",
                {"f": 5, "c": -5, "h": -8},
            ),
            (
                "Разогнать очередь стражей.",
                "Disperse the queue with guards.",
                "Голодных можно разогнать, но голод останется.",
                "You can disperse the hungry, but hunger remains.",
                {"a": 8, "c": -10, "h": -10},
            ),
        ],
    ),
    (
        "borvin",
        "Храмы требуют десятину, а корона — налоги. Люди платят дважды и ропщут.",
        "Temples demand tithe while the crown demands taxes. People pay twice and grumble.",
        [
            (
                "Поднять налог и не трогать десятину.",
                "Raise royal tax and leave tithe untouched.",
                "Казна наполнилась, но свечи в храмах стали мрачнее.",
                "Treasury fills, but candles in temples burn gloomier.",
                {"g": 15, "c": -20, "h": 5},
            ),
            (
                "Снизить коронный сбор ради спокойствия.",
                "Lower the crown levy for calm.",
                "Шум на рынке стих, а счетные книги — нет.",
                "Market noise quieted, account books did not.",
                {"c": 10, "g": -10},
            ),
            (
                "Разделить сбор: храму и короне поровну.",
                "Split collection evenly between temple and crown.",
                "Компромисс дешевле бунта, но не дешевле совести.",
                "Compromise is cheaper than revolt, not cheaper than conscience.",
                {"g": 10, "c": 5, "h": -8},
            ),
        ],
    ),
    (
        "rudolf",
        "Малрик хочет, чтобы священники читали проповеди в казармах.",
        "Malrik wants priests preaching inside the barracks.",
        [
            (
                "Разрешить священников в казармах.",
                "Allow priests in the barracks.",
                "Солдаты станут тише, офицеры — хмурее.",
                "Soldiers will grow calmer, officers gloomier.",
                {"c": 12, "a": -5},
            ),
            (
                "Запретить церкви вход в казармы.",
                "Forbid church entry into barracks.",
                "Приказ ясен. Молитва останется за стенами.",
                "Order is clear. Prayer stays outside the walls.",
                {"a": 10, "c": -12},
            ),
            (
                "Пускать священников только по разрешению капитана.",
                "Let priests in only with captain approval.",
                "Казарма получит порядок, а храм — дверь, но не трон.",
                "Barracks keep order and temple gets a door, not a throne.",
                {"a": 5, "c": 5},
            ),
        ],
    ),
    (
        "mira",
        "Святая вода берется из того же колодца, что и вода для больных.",
        "Holy water is drawn from the same well used for the sick.",
        [
            (
                "Отдать колодец храму и искать другой источник для лазарета.",
                "Give the well to the temple and find another source for the infirmary.",
                "Молитвы станут чище, но раны — грязнее.",
                "Prayers grow cleaner, wounds dirtier.",
                {"h": 15, "c": -15},
            ),
            (
                "Разделить забор воды и поставить фильтры.",
                "Split water access and install filters.",
                "Иконы и бинты смогут сосуществовать.",
                "Icons and bandages can coexist.",
                {"h": 12, "c": 5, "g": -3},
            ),
            (
                "Передать воду только лазарету.",
                "Reserve the water for the infirmary only.",
                "Больные выживут, а колокола заговорят громче.",
                "The sick survive, and church bells ring louder in protest.",
                {"c": 8, "h": -15},
            ),
        ],
    ),
    (
        "gromm",
        "Церковь объявила пост. Двор требует мясо, народ смотрит на ваш стол.",
        "The church declared a fast. Court demands meat while people watch your table.",
        [
            (
                "Соблюдать пост во дворце.",
                "Keep the fast in the palace.",
                "Пустой стол иногда кормит слухи лучше, чем пир.",
                "An empty table sometimes feeds rumors better than feasts.",
                {"f": 20, "a": -15, "c": 10},
            ),
            (
                "Сделать смешанное меню для всех сословий.",
                "Serve a mixed menu for all estates.",
                "Никто не счастлив полностью, зато никто не голоден совсем.",
                "No one is fully happy, yet no one is fully hungry.",
                {"f": 5, "c": 5, "h": 5},
            ),
            (
                "Игнорировать пост и устроить мясной пир.",
                "Ignore the fast and host a meat feast.",
                "Двор доволен. Проповеди станут злее.",
                "Court is pleased. Sermons will turn harsher.",
                {"a": 10, "c": -8, "f": -10},
            ),
        ],
    ),
    (
        "varn",
        "У главного храма собралась толпа и требует королевского слова.",
        "A crowd gathers at the main temple demanding a royal word.",
        [
            (
                "Вывести стражу и разогнать толпу.",
                "Deploy guards and disperse the crowd.",
                "Площадь очистится быстро, память — нет.",
                "The square clears quickly; memory does not.",
                {"a": 8, "c": -5, "h": -5},
            ),
            (
                "Выйти к толпе и выслушать прошение.",
                "Step out and hear their petition.",
                "Толпа любит, когда трон умеет слушать.",
                "Crowds love when the throne can listen.",
                {"c": 8, "h": 5},
            ),
            (
                "Организовать раздачу пищи у храма.",
                "Organize food distribution at the temple.",
                "Хлеб охлаждает жар речей быстрее копий.",
                "Bread cools heated speeches faster than spears.",
                {"f": -12, "h": 10, "c": 5},
            ),
        ],
    ),
    (
        "edric",
        "Старый спор: кому выше стоять — королю или церкви?",
        "The old dispute returns: who stands higher, king or church?",
        [
            (
                "Публично подтвердить первенство церкви в духовных делах.",
                "Publicly affirm church primacy in spiritual matters.",
                "Корона склонится и станет тише в глазах народа.",
                "The crown bows and appears calmer before the people.",
                {"c": 20, "g": -10, "a": -5},
            ),
            (
                "Провозгласить верховенство короны.",
                "Proclaim supremacy of the crown.",
                "Короткая речь иногда громче колоколов.",
                "A short speech can ring louder than bells.",
                {"g": 10, "c": -20, "a": 5},
            ),
            (
                "Разделить власть формальным договором.",
                "Divide authority through a formal charter.",
                "Печати любят порядок больше, чем люди.",
                "Seals love order more than people do.",
                {"c": 5, "a": 5, "g": -5},
            ),
        ],
    ),
    (
        "selena",
        "Торговцы спорят: свечи и иконы продавать свободно или через храмовые лавки.",
        "Merchants dispute whether candles and icons should be sold freely or only through temple stalls.",
        [
            (
                "Отдать торговлю храмовым лавкам.",
                "Give trade to temple stalls.",
                "Храм доволен, рынок ругается.",
                "Temple is pleased, market complains.",
                {"g": 20, "c": -8},
            ),
            (
                "Оставить свободный рынок под надзором.",
                "Keep a free market under oversight.",
                "Сделка и молитва поделят улицу поровну.",
                "Deal and prayer share the street in equal measure.",
                {"c": 10, "g": -10, "h": 5},
            ),
            (
                "Ввести смешанную систему лицензий.",
                "Introduce a mixed licensing system.",
                "Казна считает медь, храм — свечи.",
                "Treasury counts copper, temple counts candles.",
                {"g": 8, "c": 8},
            ),
        ],
    ),
    (
        "morwen",
        "Пойман богохульник. Толпа требует публичной казни у собора.",
        "A blasphemer was caught. The crowd demands a public execution by the cathedral.",
        [
            (
                "Казнить публично.",
                "Execute publicly.",
                "Толпа насытится страхом до следующего утра.",
                "The crowd will feed on fear until next morning.",
                {"c": 15, "a": 5, "h": -10},
            ),
            (
                "Казнить тайно и без зрелища.",
                "Execute privately without spectacle.",
                "Приговор свершится, но площадь останется пустой.",
                "Sentence is carried out while the square stays empty.",
                {"a": 5, "c": -5},
            ),
            (
                "Заменить казнь покаянием и ссылкой.",
                "Replace execution with penance and exile.",
                "Иногда живая вина служит дольше мертвой.",
                "A living guilt can serve longer than a dead one.",
                {"c": 5, "h": 5},
            ),
        ],
    ),
    (
        "sivil",
        "Монахи просят больше ладана, а лекари — больше трав. Склады не бесконечны.",
        "Monks ask for more incense while healers ask for more herbs. Stores are not endless.",
        [
            (
                "Отдать приоритет лечебным травам.",
                "Prioritize medicinal herbs.",
                "Ладан потускнеет, но жар у людей спадет.",
                "Incense dims, but fever among people drops.",
                {"g": -12, "h": 15, "c": -5},
            ),
            (
                "Разделить запасы поровну.",
                "Split supplies equally.",
                "Никто не победит, зато никто не уйдет ни с чем.",
                "No one wins, yet no one leaves empty-handed.",
                {"c": 10, "h": -8, "g": -5},
            ),
            (
                "Купить дополнительный ладан за счет трав.",
                "Buy extra incense at the expense of herbs.",
                "Воздух станет святее, палаты — тише и темнее.",
                "Air grows holier while wards grow quieter and darker.",
                {"g": -10, "h": 12, "c": 5},
            ),
        ],
    ),
    (
        "ingvar",
        "На севере считают, что трон и церковь должны править вместе. Какой ответ передать князю?",
        "In the north they believe throne and church should rule together. What answer shall I carry to my prince?",
        [
            (
                "Подтвердить идею совместного правления.",
                "Confirm the idea of shared rule.",
                "Север услышит мирный тон.",
                "The north will hear a peaceful tone.",
                {"c": 10, "a": -5},
            ),
            (
                "Отстаивать полную власть короны.",
                "Defend full authority of the crown.",
                "Ваш голос прозвучит твердо и холодно.",
                "Your voice will sound firm and cold.",
                {"a": 10, "c": -10},
            ),
            (
                "Сохранить союз, но через торговые уступки.",
                "Keep alliance through trade concessions.",
                "Иногда серебро убеждает лучше меча и псалма.",
                "At times silver persuades better than sword and psalm.",
                {"g": 5, "a": -3},
            ),
        ],
    ),
]


SCENARIOS = [
    (
        "Аббат просит освободить храмовые земли от податей, ссылаясь на старую грамоту.",
        "An abbot asks to exempt temple lands from levies, citing an old charter.",
    ),
    (
        "В соборе спорят о том, кому хранить королевскую печать в дни траура.",
        "The cathedral disputes who should guard the royal seal in days of mourning.",
    ),
    (
        "Монастырский скрипторий требует пергамент из казны для переписи законов.",
        "The monastery scriptorium requests treasury parchment to copy the laws.",
    ),
    (
        "Епископы требуют закрыть театральную площадь на время поста.",
        "Bishops demand closing the theatre square for the fasting season.",
    ),
    (
        "Клирики обвиняют городских судей в продаже индульгенций через посредников.",
        "Clergy accuse city judges of selling indulgences through brokers.",
    ),
    (
        "Паломники заняли мост у дворца, считая его частью святого пути.",
        "Pilgrims occupied the bridge by the palace, claiming it as a holy route.",
    ),
    (
        "Храмовые колокола звонят ночью, и купцы жалуются на сорванные сделки.",
        "Temple bells ring through the night and merchants complain about ruined deals.",
    ),
    (
        "Малые приходы просят зерно, потому что богатые храмы забрали все пожертвования.",
        "Small parishes ask for grain because rich temples took most donations.",
    ),
    (
        "Молодые дворяне хотят венчаться без церковного суда, по королевскому указу.",
        "Young nobles want to wed by royal decree without church court review.",
    ),
    (
        "Старый реликварий треснул, и храм требует золото на новый ковчег.",
        "An old reliquary cracked and the temple demands gold for a new casket.",
    ),
    (
        "Пограничный монастырь укрывает беглых должников и отказывается их выдавать.",
        "A border monastery shelters fugitive debtors and refuses extradition.",
    ),
    (
        "Священники и писцы спорят, кто будет вести записи о браках и наследстве.",
        "Priests and clerks quarrel over who keeps records of marriages and inheritance.",
    ),
    (
        "После засухи храм просит объявить три дня публичного покаяния.",
        "After drought the temple asks for three days of public penance.",
    ),
    (
        "Казначеи храма скрыли часть меди от коронной описи.",
        "Temple treasurers hid part of their copper from the royal inventory.",
    ),
    (
        "В проповедях все чаще звучит намек, что бедствия — кара за новый трон.",
        "Sermons increasingly hint that calamities are punishment for the new throne.",
    ),
    (
        "На ярмарке появились поддельные реликвии с печатью собора.",
        "Forged relics with cathedral seals appeared at the fair.",
    ),
    (
        "Настоятельницы требуют открыть приют при храме и передать им дворцовое крыло.",
        "Abbesses demand opening a temple refuge and receiving a palace wing.",
    ),
    (
        "Северные миссионеры просят разрешить проповедь на рыночных площадях столицы.",
        "Northern missionaries ask to preach on capital market squares.",
    ),
    (
        "Военные капелланы требуют отдельный бюджет и неподконтрольность казначею.",
        "Army chaplains demand a separate budget beyond treasurer oversight.",
    ),
    (
        "В городе ходит слух, что чудотворная икона поддельна.",
        "A city rumor claims the miracle icon is counterfeit.",
    ),
]


CHOICE_PACKS = [
    [
        (
            "Поддержать прошение храма и выдать печать короны.",
            "Support the temple petition and seal it with the crown.",
            "Алтарь запомнит щедрый жест, а счетные книги — нет.",
            "The altar will remember the generous gesture, while ledgers will not.",
            {"c": 18, "g": -9, "h": 6},
        ),
        (
            "Отклонить прошение и оставить решение за гарнизоном.",
            "Reject the petition and leave the matter to the garrison.",
            "Порядок усилится, но колокола ответят холодно.",
            "Order stiffens, but bells answer coldly.",
            {"a": 12, "c": -14, "h": -6},
        ),
        (
            "Созвать совет трона и алтаря на три дня.",
            "Call a throne-and-altar council for three days.",
            "Спор не утихнет сразу, зато мечи останутся в ножнах.",
            "The quarrel will not fade at once, but swords stay sheathed.",
            {"c": 10, "a": 4, "g": -4},
        ),
    ],
    [
        (
            "Оплатить церковное решение из казны и объявить милость.",
            "Pay for the church solution from the treasury and proclaim mercy.",
            "Народ увидит мягкую руку, а монета станет тоньше.",
            "People will see a gentle hand while coin grows thinner.",
            {"h": 14, "c": 9, "g": -10},
        ),
        (
            "Передать вопрос в военный суд при дворце.",
            "Transfer the matter to a military court at the palace.",
            "Приговор будет быстрым и тяжелым.",
            "Judgment will be swift and heavy.",
            {"a": 14, "c": -12, "h": -5},
        ),
        (
            "Разделить полномочия: храму слово, короне исполнение.",
            "Split authority: temple gives word, crown gives execution.",
            "Компромисс звучит сухо, но работает.",
            "Compromise sounds dry, yet works.",
            {"c": 8, "a": 6, "h": 4},
        ),
    ],
    [
        (
            "Разрешить процессию и стражу вдоль пути.",
            "Allow a procession with guards along the route.",
            "Песнопения пойдут впереди копий.",
            "Chants will march ahead of spears.",
            {"c": 16, "a": -3, "g": -6},
        ),
        (
            "Запретить шествие и очистить улицы до заката.",
            "Ban the march and clear streets before dusk.",
            "Город станет тише, но обида глубже.",
            "City grows quieter while resentment deepens.",
            {"a": 11, "c": -11, "h": -4},
        ),
        (
            "Провести сокращенный обряд у дворцовых ворот.",
            "Hold a shortened rite at palace gates.",
            "И трон, и алтарь сохранят лицо.",
            "Both throne and altar keep face.",
            {"c": 9, "h": 5, "g": -3},
        ),
    ],
    [
        (
            "Укрепить монастырские склады коронным зерном.",
            "Reinforce monastery stores with crown grain.",
            "Зима станет мягче для тех, кто молится и ждет.",
            "Winter will be softer for those who pray and wait.",
            {"f": -14, "h": 13, "c": 7},
        ),
        (
            "Оставить запасы армии и не открывать склады.",
            "Keep supplies for the army and keep stores closed.",
            "Казармы сыты, улицы сердиты.",
            "Barracks are fed, streets are angry.",
            {"a": 10, "f": 8, "c": -9},
        ),
        (
            "Выдать малые пайки через храм и рынок вместе.",
            "Issue small rations through temple and market together.",
            "Никто не доволен полностью, но голод утихает.",
            "No one is fully pleased, but hunger softens.",
            {"f": -6, "c": 8, "h": 6},
        ),
    ],
    [
        (
            "Дать храму право суда по этому делу.",
            "Grant the church judicial authority over this case.",
            "Кафедра возьмет вину на себя и на вас.",
            "The cathedra takes the burden on itself and on you.",
            {"c": 17, "a": -5, "h": 8},
        ),
        (
            "Лично подписать коронный приговор.",
            "Personally sign a royal verdict.",
            "Твердость укрепляет трон и ослабляет доверие к алтарю.",
            "Firmness strengthens the throne and weakens trust in the altar.",
            {"a": 13, "c": -13, "g": 4},
        ),
        (
            "Назначить смешанную коллегию из судьи и прелата.",
            "Appoint a mixed board of judge and prelate.",
            "Решение выйдет медленным, но весомым.",
            "The ruling will be slow, but weighty.",
            {"c": 9, "a": 5, "h": 5},
        ),
    ],
    [
        (
            "Оплатить восстановление святынь из золотого резерва.",
            "Fund shrine restoration from the gold reserve.",
            "Камень и вера окрепнут вместе.",
            "Stone and faith strengthen together.",
            {"c": 15, "g": -12, "h": 7},
        ),
        (
            "Потребовать, чтобы храмы платили сами.",
            "Demand temples pay on their own.",
            "Казна вздохнет, проповеди станут колючими.",
            "Treasury breathes while sermons turn thorny.",
            {"g": 9, "c": -10, "h": -7},
        ),
        (
            "Выделить половину суммы при участии купеческих гильдий.",
            "Allocate half the sum with merchant guild participation.",
            "Золото потечет медленней, но вернее.",
            "Gold will flow slower, but steadier.",
            {"c": 8, "g": -4, "a": 4},
        ),
    ],
    [
        (
            "Усилить церковные праздники и раздать хлеб после мессы.",
            "Expand church feasts and distribute bread after mass.",
            "Толпа запомнит праздник как знак новой власти.",
            "The crowd will remember the feast as a sign of new rule.",
            {"h": 15, "f": -10, "c": 10},
        ),
        (
            "Ограничить праздники и ввести комендантский час.",
            "Restrict feasts and impose curfew.",
            "Ночь станет тише, но вера злее.",
            "Night grows quieter while faith grows harsher.",
            {"a": 12, "c": -9, "h": -8},
        ),
        (
            "Оставить один день праздника и один день работы.",
            "Keep one day of feast and one day of labor.",
            "Город получит ритм вместо истерики.",
            "The city gains rhythm instead of hysteria.",
            {"c": 7, "h": 6, "a": 5},
        ),
    ],
    [
        (
            "Утвердить проповедь примирения и королевское послание.",
            "Approve a sermon of reconciliation with a royal address.",
            "Слова смягчат углы там, где меч лишь рубит.",
            "Words smooth corners where swords only cut.",
            {"c": 14, "h": 10, "a": -4},
        ),
        (
            "Запретить спорные проповеди и наказать нарушителей.",
            "Ban disputed sermons and punish offenders.",
            "Страх наведет порядок, но ненадолго.",
            "Fear imposes order, but not for long.",
            {"a": 15, "c": -12, "h": -6},
        ),
        (
            "Отправить королевского легата для переговоров с архиепископом.",
            "Send a royal legate to negotiate with the archbishop.",
            "Двери останутся открытыми, даже если голоса повысятся.",
            "Doors stay open even when voices rise.",
            {"c": 11, "a": 3, "g": -2},
        ),
    ],
]


def make_generated(index: int, char: str) -> tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]:
    scenario_ru, scenario_en = SCENARIOS[(index - 13) % len(SCENARIOS)]
    day = 30 + ((index - 13) % 60)
    prompt_ru = f"{scenario_ru} День {day} в столице пахнет воском и тревогой. Ваше решение?"
    prompt_en = f"{scenario_en} Day {day} in the capital smells of wax and unrest. Your decision?"
    choices = CHOICE_PACKS[(index - 13) % len(CHOICE_PACKS)]
    return (char, prompt_ru, prompt_en, choices)


def build_data() -> list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]]:
    out = list(FIRST_TWELVE)
    for number in range(13, 101):
        char = CHARS[(number - 1) % len(CHARS)]
        out.append(make_generated(number, char))
    return out


def validate(encounters: list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]]) -> None:
    if len(encounters) != 100:
        raise SystemExit(f"Expected 100 encounters, got {len(encounters)}")

    allowed = {"f", "a", "g", "h", "c"}
    for idx, (_, _, _, choices) in enumerate(encounters, start=1):
        if len(choices) != 3:
            raise SystemExit(f"Encounter {idx} has {len(choices)} choices, expected 3")
        for choice_idx, (_, _, _, _, st) in enumerate(choices, start=1):
            bad_keys = set(st) - allowed
            if bad_keys:
                raise SystemExit(f"Encounter {idx} choice {choice_idx} has invalid stats {sorted(bad_keys)}")
            for k, v in st.items():
                if v < -20 or v > 25:
                    raise SystemExit(f"Encounter {idx} choice {choice_idx} stat {k} out of range: {v}")


def render(encounters: list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]]) -> str:
    blocks = [enc(char, prompt_ru, prompt_en, choices) for char, prompt_ru, prompt_en, choices in encounters]
    body = "\n".join(blocks)
    return (
        "# Pool 3 — Тень алтаря (days 30-89). Stats: f, a, g, h, c only.\n"
        "# fmt: off\n"
        "POOL3_ENCOUNTERS = [\n"
        f"{body}\n"
        "]\n"
    )


def main() -> None:
    encounters = build_data()
    validate(encounters)
    content = render(encounters)

    out_path = Path(__file__).resolve().with_name("encounter_data_pool3.py")
    out_path.write_text(content, encoding="utf-8", newline="\n")

    print(f"Wrote {out_path}")
    print(f"Pool 3 encounters: {len(encounters)}")


if __name__ == "__main__":
    main()

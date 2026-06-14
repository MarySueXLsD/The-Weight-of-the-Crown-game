#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate encounter_data_pool3.py with UTF-8 Cyrillic."""

from __future__ import annotations

import importlib.util
from pathlib import Path

from pool3_exact_remainder import EXACT_16_99, EXACT_100

_HERE = Path(__file__).resolve().parent
_spec = importlib.util.spec_from_file_location("build_pool3", _HERE / "_build_pool3.py")
_build = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_build)

CHARS = _build.CHARS
render = _build.render

EXACT_FIFTEEN: list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]] = [
    (
        "malrik",
        "Ваше Величество, народ знает вашу корону, но не знает, благословлена ли она. Сегодня церковь должна решить, как называть вас: королём или узурпатором.",
        "Your Majesty, the people know your crown, but do not know whether it is blessed. Today the church must decide whether to name you king or usurper.",
        [
            (
                "Попросить церковь о благословении.",
                "Ask the church for a blessing.",
                "Смирение — хорошее начало для того, кто пришёл к трону через кровь.",
                "Humility is a fitting beginning for one who reached the throne through blood.",
                {"c": 20, "g": -10},
            ),
            (
                "Потребовать признания моей власти.",
                "Demand recognition of my authority.",
                "Приказы доходят до солдат. До небес они поднимаются хуже.",
                "Orders reach soldiers. They rise to heaven far less well.",
                {"a": 8, "c": -15},
            ),
            (
                "Предложить церкви союз.",
                "Offer the church an alliance.",
                "Союз трона и алтаря может спасти страну. Или задушить её.",
                "An alliance of throne and altar may save the realm. Or smother it.",
                {"c": 10, "g": -5, "h": 5},
            ),
        ],
    ),
    (
        "arvel",
        "После проповеди к монастырю пришло больше голодных, чем обычно. Они верят, что храм накормит их, если король не может.",
        "After the sermon, more hungry folk came to the monastery than usual. They believe the temple will feed them if the king cannot.",
        [
            (
                "Передать монастырю зерно.",
                "Send grain to the monastery.",
                "Сегодня вера будет пахнуть хлебом.",
                "Today faith will smell of bread.",
                {"f": -15, "h": 15, "c": 8},
            ),
            (
                "Пусть монастырь сам кормит людей.",
                "Let the monastery feed them on its own.",
                "Мы попробуем. Но пустой котёл не становится святым от молитвы.",
                "We will try. But an empty pot does not become holy through prayer.",
                {"f": 5, "c": -5, "h": -8},
            ),
            (
                "Отправить стражу разогнать очередь.",
                "Send guards to disperse the line.",
                "Голодных можно разогнать. Голод — нет.",
                "You can scatter the hungry. Hunger itself will stay.",
                {"a": 8, "c": -10, "h": -10},
            ),
        ],
    ),
    (
        "borvin",
        "Храмы собирают десятину. Казна собирает налоги. Народ скоро поймёт, что платит дважды.",
        "Temples collect tithe. The treasury collects taxes. Soon the people will see they pay twice.",
        [
            (
                "Ограничить церковную десятину.",
                "Limit the church tithe.",
                "Казна благодарна. Алтарь будет шипеть.",
                "The treasury is grateful. The altar will hiss.",
                {"g": 15, "c": -20, "h": 5},
            ),
            (
                "Оставить десятину церкви.",
                "Leave the tithe to the church.",
                "Священники любят, когда их золото называют верой.",
                "Priests love it when their gold is called faith.",
                {"c": 10, "g": -10},
            ),
            (
                "Собирать налоги вместе с церковью.",
                "Collect taxes together with the church.",
                "Двойная рука в одном кармане. Удобно, но опасно.",
                "Two hands in one pocket. Convenient, yet dangerous.",
                {"g": 10, "c": 5, "h": -8},
            ),
        ],
    ),
    (
        "rudolf",
        "Малрик хочет отправить священников в казармы. Говорит, солдатам нужна душа. Солдатам нужен хлеб и сталь.",
        "Malrik wants priests in the barracks. He says soldiers need souls. Soldiers need bread and steel.",
        [
            (
                "Разрешить священников в казармах.",
                "Allow priests in the barracks.",
                "Если они начнут учить солдат милосердию, я выставлю их сам.",
                "If they start teaching mercy to soldiers, I will throw them out myself.",
                {"c": 12, "a": -5},
            ),
            (
                "Запретить им вход.",
                "Forbid them entry.",
                "Казармы останутся казармами, а не молитвенным залом.",
                "The barracks will remain barracks, not a hall of prayer.",
                {"a": 10, "c": -12},
            ),
            (
                "Пускать только перед битвами.",
                "Let them in only before battles.",
                "Перед смертью люди охотнее слушают богов. С этим спорить трудно.",
                "Before death, men listen to gods more willingly. Hard to argue with that.",
                {"a": 5, "c": 5},
            ),
        ],
    ),
    (
        "mira",
        "Люди отказываются пить кипячённую воду. Они покупают святую. Она из того же грязного колодца.",
        "People refuse to drink boiled water. They buy holy water instead. It comes from the same filthy well.",
        [
            (
                "Запретить продажу святой воды.",
                "Ban the sale of holy water.",
                "Спасибо. Болезнь не исчезнет от молитвы над грязью.",
                "Thank you. Disease does not vanish when filth is blessed.",
                {"h": 15, "c": -15},
            ),
            (
                "Приказать храмам кипятить воду перед освящением.",
                "Order temples to boil water before consecration.",
                "Хорошо. Пусть вера хотя бы не переносит заразу.",
                "Good. Let faith at least stop carrying infection.",
                {"h": 12, "c": 5, "g": -3},
            ),
            (
                "Не вмешиваться в обряды.",
                "Do not interfere with rites.",
                "Тогда я буду лечить последствия вашей осторожности.",
                "Then I will treat the consequences of your caution.",
                {"c": 8, "h": -15},
            ),
        ],
    ),
    (
        "gromm",
        "Церковь объявила пост. Мяса есть будут меньше, это хорошо. Но солдаты уже спрашивают, почему богам нужна их похлёбка.",
        "The church has declared a fast. There will be less meat, which is fine. Yet soldiers already ask why the gods need their stew.",
        [
            (
                "Пост для всех, включая армию.",
                "Fast for all, army included.",
                "Репа станет святой. Солдаты — злые.",
                "Turnips will be holy. Soldiers will be furious.",
                {"f": 20, "a": -15, "c": 10},
            ),
            (
                "Пост только для дворца.",
                "Fast only for the palace.",
                "Вот это зрелище: придворные страдают почти как люди.",
                "Now that is a sight: courtiers suffering almost like common folk.",
                {"f": 5, "c": 5, "h": 5},
            ),
            (
                "Отменить пост для армии.",
                "Exempt the army from fasting.",
                "Солдаты будут сыты. Священники — голодны до возмущения.",
                "Soldiers will be fed. Priests will be hungry for outrage.",
                {"a": 10, "c": -8, "f": -10},
            ),
        ],
    ),
    (
        "varn",
        "У главного храма собралась толпа. Они требуют, чтобы церковь сказала, законный ли вы король.",
        "A crowd gathers by the main temple. They demand that the church declare whether you are a lawful king.",
        [
            (
                "Поставить стражу у храма.",
                "Post guards at the temple.",
                "Копья удержат двери. Не вопросы.",
                "Spears may hold doors. Not questions.",
                {"a": 8, "c": -5, "h": -5},
            ),
            (
                "Позволить толпе слушать проповедь.",
                "Let the crowd hear the sermon.",
                "Хорошо. Но если слова станут искрами, я предупреждал.",
                "Very well. But if words turn to sparks, I warned you.",
                {"c": 8, "h": 5},
            ),
            (
                "Раздать хлеб перед храмом.",
                "Distribute bread before the temple.",
                "Сытый человек кричит реже. Иногда это лучшая охрана.",
                "A fed man shouts less. Sometimes that is the best guard.",
                {"f": -12, "h": 10, "c": 5},
            ),
        ],
    ),
    (
        "edric",
        "Король, который спорит с церковью, получает врага в каждом храме. Король, который ей подчиняется, теряет трон без боя.",
        "A king who quarrels with the church gains an enemy in every temple. A king who submits to it loses his throne without battle.",
        [
            (
                "Дать церкви больше прав.",
                "Grant the church broader rights.",
                "Алтарь улыбнётся. Трон станет чуть ниже.",
                "The altar will smile. The throne will stand a little lower.",
                {"c": 20, "g": -10, "a": -5},
            ),
            (
                "Ограничить церковь законом.",
                "Bind the church by law.",
                "Смелый шаг. Такие шаги часто слышны у эшафота.",
                "A bold move. Such footsteps are often heard near a scaffold.",
                {"g": 10, "c": -20, "a": 5},
            ),
            (
                "Сохранять равновесие.",
                "Keep the balance.",
                "Равновесие редко красиво. Зато иногда живёт дольше.",
                "Balance is seldom elegant, but sometimes it survives longer.",
                {"c": 5, "a": 5, "g": -5},
            ),
        ],
    ),
    (
        "selena",
        "После открытия церкви люди покупают свечи, иконы, амулеты. Я могу наладить торговлю. И отдать вам долю.",
        "Since the church reopened, people buy candles, icons, and amulets. I can organize the trade and pay you a share.",
        [
            (
                "Разрешить торговлю святынями.",
                "Permit trade in holy wares.",
                "Вера продаётся лучше хлеба. И хранится дольше.",
                "Faith sells better than bread, and keeps longer.",
                {"g": 20, "c": -8},
            ),
            (
                "Запретить наживаться на вере.",
                "Forbid profit from faith.",
                "Благородно. Очень невыгодно.",
                "Noble. Very unprofitable.",
                {"c": 10, "g": -10, "h": 5},
            ),
            (
                "Разрешить только храмовые товары.",
                "Allow only temple-controlled goods.",
                "Монополия святости. Церковь быстро учится торговле.",
                "A monopoly of holiness. The church learns commerce quickly.",
                {"g": 8, "c": 8},
            ),
        ],
    ),
    (
        "morwen",
        "Священники привели человека, который плевал на храмовые двери. Они требуют публичной казни.",
        "Priests brought a man who spat upon temple doors. They demand a public execution.",
        [
            (
                "Казнить его.",
                "Execute him.",
                "Площадь снова получит урок. Надеюсь, он будет стоить этой крови.",
                "The square will receive its lesson again. I hope it is worth the blood.",
                {"c": 15, "a": 5, "h": -10},
            ),
            (
                "Посадить в темницу.",
                "Throw him in the dungeon.",
                "Тюрьма тише виселицы. Но священники любят громкие ответы.",
                "A dungeon is quieter than a gallows, but priests prefer loud answers.",
                {"a": 5, "c": -5},
            ),
            (
                "Заставить его публично извиниться.",
                "Force a public apology.",
                "Редкий день, когда язык заменил петлю.",
                "A rare day when a tongue replaces a noose.",
                {"c": 5, "h": 5},
            ),
        ],
    ),
    (
        "sivil",
        "Храмы жгут ладан против заразы. Красиво пахнет. Бесполезно лечит. У меня есть травы получше.",
        "Temples burn incense against pestilence. It smells lovely. It heals nothing. I have better herbs.",
        [
            (
                "Купить травы у Сивил.",
                "Buy herbs from Sivil.",
                "Травы грубее молитв, зато чаще работают.",
                "Herbs are rougher than prayers, yet they work more often.",
                {"g": -12, "h": 15, "c": -5},
            ),
            (
                "Поддержать храмовый ладан.",
                "Support the temple incense.",
                "Тогда пусть болезнь задохнётся от аромата. Если сможет.",
                "Then let disease choke on fragrance, if it can.",
                {"c": 10, "h": -8, "g": -5},
            ),
            (
                "Смешать травы с церковным ладаном.",
                "Mix herbs with church incense.",
                "Вот это уже почти умно. Даже обидно.",
                "Now that is almost clever. It is almost insulting.",
                {"g": -10, "h": 12, "c": 5},
            ),
        ],
    ),
    (
        "ingvar",
        "Мой князь спрашивает, правда ли ваша церковь теперь правит вместе с вами. На севере таких королей называют мягкими.",
        "My prince asks whether your church now rules beside you. In the north, such kings are called soft.",
        [
            (
                "Сказать, что церковь — мой союзник.",
                "Say the church is my ally.",
                "Север услышит. И решит, что вы делите меч с молитвой.",
                "The north will hear and decide you share your sword with prayer.",
                {"c": 10, "a": -5},
            ),
            (
                "Сказать, что церковь подчиняется трону.",
                "Say the church bends to the throne.",
                "Хорошо. Север уважает тех, кто держит алтарь за горло.",
                "Good. The north respects those who keep the altar by the throat.",
                {"a": 10, "c": -10},
            ),
            (
                "Не отвечать на провокацию.",
                "Refuse to answer the provocation.",
                "Молчание бывает мудрым. Но соседи часто слышат в нём страх.",
                "Silence can be wise, but neighbors often hear fear in it.",
                {"g": 5, "a": -3},
            ),
        ],
    ),
    (
        "malrik",
        "Церковь просит право судить преступления против веры. Без этого храм остаётся без зубов.",
        "The church asks for the right to judge crimes against the faith. Without it, the temple remains toothless.",
        [
            (
                "Дать церкви право суда.",
                "Grant the church judicial power.",
                "Вера без суда — просьба. Вера с судом — закон.",
                "Faith without judgment is a plea. Faith with judgment is law.",
                {"c": 20, "a": -5, "h": -8},
            ),
            (
                "Оставить суд короне.",
                "Keep judgment under the crown.",
                "Тогда не удивляйтесь, если грешники начнут любить королевский закон.",
                "Then do not be surprised when sinners begin to love royal law.",
                {"c": -15, "a": 8},
            ),
            (
                "Разрешить церковный суд только за ересь.",
                "Allow church courts for heresy alone.",
                "Не всё, чего мы просили. Но достаточно, чтобы начать.",
                "Not all we asked, but enough to begin.",
                {"c": 8, "a": 3, "h": -3},
            ),
        ],
    ),
    (
        "arvel",
        "В храме укрылись люди, бежавшие от сборщиков налогов. Они голодны и напуганы. Вы потребуете их выдачи?",
        "People fleeing tax collectors took refuge in a temple. They are hungry and terrified. Will you demand their surrender?",
        [
            (
                "Потребовать выдачи.",
                "Demand their surrender.",
                "Храмовые двери откроются. Но люди запомнят, что святость не защитила их.",
                "Temple doors will open, but people will remember holiness did not protect them.",
                {"g": 10, "c": -10, "a": 5},
            ),
            (
                "Оставить их в храме.",
                "Leave them in sanctuary.",
                "Спасибо. Иногда убежище важнее закона.",
                "Thank you. At times, sanctuary matters more than statute.",
                {"c": 10, "g": -10, "h": 5},
            ),
            (
                "Простить долг тем, кто выйдет сам.",
                "Forgive debt for those who come out willingly.",
                "Милость вывела больше людей, чем стража.",
                "Mercy brought out more souls than guards.",
                {"g": -5, "c": 5, "h": 8},
            ),
        ],
    ),
    (
        "borvin",
        "Малрик хочет строить новый собор. В казне дыра, но собор может успокоить народ.",
        "Malrik wishes to build a new cathedral. The treasury has a hole, yet the cathedral may calm the people.",
        [
            (
                "Выделить деньги на собор.",
                "Allocate funds for the cathedral.",
                "Камни для храма. Пустота для казны.",
                "Stone for the temple. Emptiness for the treasury.",
                {"g": -25, "c": 20, "h": 5},
            ),
            (
                "Отказать.",
                "Refuse.",
                "Казна благодарит. Храм проклянёт с хорошей акустикой.",
                "The treasury thanks you. The temple will curse you with excellent acoustics.",
                {"g": 10, "c": -15},
            ),
            (
                "Построить маленькую часовню вместо собора.",
                "Build a small chapel instead of a cathedral.",
                "Дешёвое благочестие. Иногда и такое покупают.",
                "Inexpensive piety. At times, even that sells.",
                {"g": -8, "c": 8},
            ),
        ],
    ),
]

def build_data() -> list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]]:
    return list(EXACT_FIFTEEN) + list(EXACT_16_99) + [EXACT_100]


def validate(encounters: list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]]) -> None:
    if len(encounters) != 100:
        raise SystemExit(f"Expected 100 encounters, got {len(encounters)}")

    allowed = {"f", "a", "g", "h", "c"}
    for idx, (_, _, _, choices) in enumerate(encounters, start=1):
        expected = 4 if idx == 100 else 3
        if len(choices) != expected:
            raise SystemExit(f"Encounter {idx} has {len(choices)} choices, expected {expected}")
        for choice_idx, (_, _, _, _, st) in enumerate(choices, start=1):
            bad_keys = set(st) - allowed
            if bad_keys:
                raise SystemExit(f"Encounter {idx} choice {choice_idx} has invalid stats {sorted(bad_keys)}")
            for k, v in st.items():
                if v < -25 or v > 25:
                    raise SystemExit(f"Encounter {idx} choice {choice_idx} stat {k} out of range: {v}")


def main() -> None:
    encounters = build_data()
    validate(encounters)
    content = render(encounters)

    out_path = _HERE / "encounter_data_pool3.py"
    out_path.write_text(content, encoding="utf-8", newline="\n")

    text = out_path.read_text(encoding="utf-8")
    print(f"Wrote {out_path}")
    print(f"Pool 3 encounters: {len(encounters)}")
    print(f"Line count: {text.count(chr(10)) + 1}")
    print(f"Cyrillic OK: {'Ваше' in text}")
    print(f"Placeholder wax: {'пахнет воском' in text}")


if __name__ == "__main__":
    main()

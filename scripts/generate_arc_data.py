#!/usr/bin/env python3
"""Generate arc schedule and beat encounter data from QUESTIONS_REFERENCE*.md."""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REF_EN = ROOT / "QUESTIONS_REFERENCE.md"
REF_RU = ROOT / "QUESTIONS_REFERENCE_RU.md"

ARC_SECTIONS = [
    ("ARC_HOUSEHOLD", 0, "The Old King's Household"),
    ("ARC_TAPESTRY", 1, "Below the Tapestry"),
    ("ARC_EMPTY_PURSE", 2, "The Empty Purse"),
    ("ARC_HUNGRY_SEASON", 3, "The Hungry Season"),
    ("ARC_GUILD_COMPACT", 4, "The Guild Compact"),
    ("ARC_CHURCH_CROWN", 5, "The Crown Forfeit & Tithe War"),
    ("ARC_NORTHERN_PRICE", 6, "The Northern Price"),
    ("ARC_GREAT_HOUSES", 7, "The Great Houses"),
    ("ARC_SCAFFOLD_LEDGER", 8, "The Scaffold's Ledger"),
    ("ARC_STAR_CHAMBER", 9, "The Star Chamber"),
    ("ARC_PROPHET_WINTER", 10, "The Prophet's Winter"),
    ("ARC_COURT_KNIVES", 11, "The Court of Knives"),
    ("ARC_NEPHEW_FOG", 12, "The Nephew in the Fog"),
    ("ARC_PLAGUE_CURE", 13, "Grey Lung Cure Arc"),
]

ARC_SECTIONS_RU = [
    ("ARC_HOUSEHOLD", 0, "Двор Старого Короля (длящаяся история)"),
    ("ARC_TAPESTRY", 1, "За Гобеленом (длящаяся история)"),
    ("ARC_EMPTY_PURSE", 2, "Пустая Казна (длящаяся история)"),
    ("ARC_HUNGRY_SEASON", 3, "Голодный Сезон (длящаяся история)"),
    ("ARC_GUILD_COMPACT", 4, "Гильдейский компакт (длящаяся история)"),
    ("ARC_CHURCH_CROWN", 5, "Отречение короны и война десятин (длящаяся история)"),
    ("ARC_NORTHERN_PRICE", 6, "Северная цена (длящаяся история)"),
    ("ARC_GREAT_HOUSES", 7, "Великие дома (длящаяся история)"),
    ("ARC_SCAFFOLD_LEDGER", 8, "Книга плахи (длящаяся история)"),
    ("ARC_STAR_CHAMBER", 9, "Звёздная палата (wildcard / перекрёстная арка)"),
    ("ARC_PROPHET_WINTER", 10, "Зимний пророк (wildcard / перекрёстная арка)"),
    ("ARC_COURT_KNIVES", 11, "Двор ножей (длящаяся история)"),
    ("ARC_NEPHEW_FOG", 12, "Племянник в тумане (длящаяся история)"),
    ("ARC_PLAGUE_CURE", 13, "Арка «Серый кашель» (длящаяся история)"),
]

CHAR_MAP = {
    "General Rudolf": "CHAR_RUDOLF",
    "High Priest Malrik": "CHAR_MALRIK",
    "Treasurer Borvin": "CHAR_BORVIN",
    "Healer Mira": "CHAR_MIRA",
    "Cook Gromm": "CHAR_GROMM",
    "Captain Varn": "CHAR_VARN",
    "Old Advisor Edric": "CHAR_EDRIC",
    "Merchant Selena": "CHAR_SELENA",
    "Executioner Morwen": "CHAR_MORWEN",
    "Monk Arvel": "CHAR_ARVEL",
    "Ambassador Ingvar": "CHAR_INGVAR",
    "Apothecary Sivil": "CHAR_SIVIL",
    "Lady Ashford": "CHAR_ASHFORD",
    "Lord Kaspar Vayne": "CHAR_KASPAR",
    "Baroness Yvette Crow": "CHAR_YVETTE",
    "Countess Marianna Dell": "CHAR_MARIANNA",
    "Chronicler Ilana": "CHAR_ILANA",
    "Banker Dominic Salt": "CHAR_DOMINIC",
    "Spy Knox": "CHAR_KNOX",
    "Bodyguard Raena": "CHAR_RAENA",
    "Sir Otto the Silent": "CHAR_OTTO",
    "Maid Lissa": "CHAR_LISSA",
    "Royal Scribe Osric": "CHAR_OSRIC",
    "Village Elder Bran": "CHAR_BRAN",
    "Veteran Orm": "CHAR_ORM",
    "Head of Guild Fara": "CHAR_FARA",
    "Miller's Wife Ruta": "CHAR_RUTA",
    "Miner Yarek": "CHAR_YAREK",
    "Folk Singer Elina": "CHAR_ELINA",
    "Deserter Finn": "CHAR_FINN",
    "Mercenary Kara": "CHAR_KARA",
    "Master of the Mint Nerius": "CHAR_NERIUS",
    "Plague Doctor Odo": "CHAR_ODO",
    "Nameless Prophet": "CHAR_PROPHET",
    "The Wizard": "CHAR_WIZARD",
    "Duke the Goose": "CHAR_GOOSE",
    "Lord Raymond the Landless": "CHAR_RAYMOND",
    "Inquisitor Cyrus": "CHAR_CYRUS",
    "Talen": "CHAR_TALEN",
    "Royal Jester Til": "CHAR_GOOSE",
}

CHAR_MAP_RU = {
    **CHAR_MAP,
    "Генерал Рудольф": "CHAR_RUDOLF",
    "Верховный жрец Малрик": "CHAR_MALRIK",
    "Казначей Борвин": "CHAR_BORVIN",
    "Лекарь Мира": "CHAR_MIRA",
    "Повар Гром": "CHAR_GROMM",
    "Повар Громм": "CHAR_GROMM",
    "Капитан Варн": "CHAR_VARN",
    "Старый советник Эдрик": "CHAR_EDRIC",
    "Купчиха Селена": "CHAR_SELENA",
    "Палач Морвен": "CHAR_MORWEN",
    "Монах Арвел": "CHAR_ARVEL",
    "Посол Ингвар": "CHAR_INGVAR",
    "Аптекарь Сивил": "CHAR_SIVIL",
    "Леди Эшфорд": "CHAR_ASHFORD",
    "Лорд Каспар Вейн": "CHAR_KASPAR",
    "Баронесса Иветта Кроу": "CHAR_YVETTE",
    "Графиня Марианна Делл": "CHAR_MARIANNA",
    "Летописец Илана": "CHAR_ILANA",
    "Банкир Доминик Солт": "CHAR_DOMINIC",
    "Шпион Нокс": "CHAR_KNOX",
    "Телохранитель Раэна": "CHAR_RAENA",
    "Телохранитель Раена": "CHAR_RAENA",
    "Сэр Отто Молчаливый": "CHAR_OTTO",
    "Служанка Лисса": "CHAR_LISSA",
    "Горничная Лисса": "CHAR_LISSA",
    "Королевский писец Осрик": "CHAR_OSRIC",
    "Королевский писарь Осрик": "CHAR_OSRIC",
    "Деревенский старейшина Бран": "CHAR_BRAN",
    "Старейшина Бран": "CHAR_BRAN",
    "Ветеран Орм": "CHAR_ORM",
    "Глава гильдии Фара": "CHAR_FARA",
    "Жена мельника Рута": "CHAR_RUTA",
    "Шахтёр Ярек": "CHAR_YAREK",
    "Певица Элина": "CHAR_ELINA",
    "Дезертир Финн": "CHAR_FINN",
    "Наёмник Кара": "CHAR_KARA",
    "Наёмница Кара": "CHAR_KARA",
    "Мастер монетного двора Нерий": "CHAR_NERIUS",
    "Чумной доктор Одо": "CHAR_ODO",
    "Безымянный пророк": "CHAR_PROPHET",
    "Колдун": "CHAR_WIZARD",
    "Придворный колдун": "CHAR_WIZARD",
    "Герцог Гусь": "CHAR_GOOSE",
    "Придворный шут Тиль": "CHAR_GOOSE",
    "Святой Лис": "CHAR_GOOSE",
    "Royal Jester Til": "CHAR_GOOSE",
    "Saint Fox": "CHAR_GOOSE",
    "Лорд Раймонд Безземельный": "CHAR_RAYMOND",
    "Лорд Раймонд": "CHAR_RAYMOND",
    "Инквизитор Сайрус": "CHAR_CYRUS",
    "Инквизитор Кир": "CHAR_CYRUS",
    "Тalen": "CHAR_TALEN",
    "Тален": "CHAR_TALEN",
    "Целительница Мира": "CHAR_MIRA",
    "Healer Mira": "CHAR_MIRA",
    "Замаскированный": "CHAR_TALEN",
    "Masked One": "CHAR_TALEN",
    "Masked": "CHAR_TALEN",
}

STAT_ORDER = ["People", "Church", "Army", "Treasury", "Health", "Loyalty", "Nobility", "Food", "Succession"]
MAX_NODES_PER_ENCOUNTER = 4

ARC_PRIORITY = {
    0: 80,
    1: 75,
    2: 70,
    3: 65,
    4: 55,
    5: 60,
    6: 50,
    7: 45,
    8: 68,
    9: 35,
    10: 30,
    11: 40,
    12: 38,
    13: 72,
}


STAT_NAME_RU = {
    "People": "Народ",
    "Church": "Церковь",
    "Army": "Армия",
    "Treasury": "Казна",
    "Health": "Здоровье",
    "Loyalty": "Верность",
    "Nobility": "Знать",
    "Food": "Продовольствие",
    "Succession": "Преемственность",
    "regicide": "цареубийца",
    "Regicide": "Цареубийца",
    "usurper": "узурпатор",
    "household": "свита",
    "ledgers": "счета",
    "ledger": "счёт",
}


def localize_ru_text(s: str) -> str:
    for en, ru in STAT_NAME_RU.items():
        s = re.sub(rf"\b{re.escape(en)}\b", ru, s)
    return s


def escape_das(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("{", "\\{").replace("}", "\\}")


def sanitize_static_prompt(prompt: str, b: dict, lang: str) -> str:
    """Replace runtime template placeholders with short static fallbacks.

    Curly-brace templates like {alive/dead} cannot live in generated encounter
    strings — even \\{...\\} breaks the daScript parser when / is present.
    Full text is built at runtime in arc_prompts.das (build_houses_prompt).
    """
    if b["arc_id"] == 7 and b["char"] == "CHAR_ILANA" and (
        "alive/dead" in prompt or "жива/мертва" in prompt or "жив/мёртв" in prompt
    ):
        if lang == "ru":
            return "Ваше Величество, я пишу первый черновик вашего правления, пока кровь сохнет."
        return "Your Majesty, I write the first draft of your reign while blood dries."
    if b["arc_id"] == 7 and b["char"] == "CHAR_EDRIC" and b.get("is_finale"):
        if lang == "ru":
            return "Ваше Величество, великие дома вынесли свой вердикт."
        return "Your Majesty, the great houses have reached their verdict."
    if "{" in prompt and re.search(r"\{[a-zA-Z_][^}]*\}", prompt):
        prompt = re.sub(r"\{housesDeadCount\}", "0", prompt)
        prompt = re.sub(r"\{alive/dead\}", "?", prompt)
        prompt = re.sub(r"\{жива/мертва\}", "?", prompt)
        prompt = re.sub(r"\{жив/мёртв\}", "?", prompt)
    return prompt


def parse_effects(line: str) -> list[int]:
    deltas = [0] * 9
    if "No stat change" in line or "Без изменений" in line:
        return deltas
    for part in re.split(r",\s*", line):
        part = part.strip().rstrip(")")
        m = re.match(r"(\w+)\s*([+-]\d+)", part)
        if m and m.group(1) in STAT_ORDER:
            deltas[STAT_ORDER.index(m.group(1))] = int(m.group(2))
    return deltas


def extract_section(text: str, title: str, all_titles: list[str], pool_markers: tuple[str, ...]) -> str:
    pat = f"## {title}"
    start = text.find(pat)
    if start < 0:
        return ""
    end = len(text)
    for other in all_titles:
        if other == title:
            continue
        p = text.find(f"## {other}", start + len(pat))
        if p >= 0:
            end = min(end, p)
    for marker in pool_markers:
        p = text.find(marker, start)
        if p >= 0:
            end = min(end, p)
    return text[start:end]


def normalize_char_name(name: str) -> str:
    name = name.strip()
    name = name.split("→")[0].strip()
    name = re.sub(r"\s*\(узел \d+\).*$", "", name)
    name = re.sub(r"\s*\(.*$", "", name).strip()
    return name


def extract_prompt(block: str, lang: str) -> str:
    node_marker = "#### Node 0" if lang == "en" else "#### Узел 0"
    choice_marker = "**Choice 1:**" if lang == "en" else "**Выбор 1:**"
    start = block.find(node_marker)
    chunk = block[start if start >= 0 else 0 :]
    choice_pos = chunk.find(choice_marker)
    if choice_pos < 0:
        choice_pos = len(chunk)
    prompt_section = chunk[:choice_pos]
    parts = re.findall(
        r"\*\*(?:Prompt|Вопрос)(?: \([^)]+\))?:\*\* (.+?)(?=\n\n|\Z)",
        prompt_section,
        re.S,
    )
    if not parts:
        return ""
    if len(parts) > 1 and re.search(
        r"\*\*(?:Prompt|Вопрос) \((?:outcome|итог)",
        prompt_section,
        re.I,
    ):
        return parts[0].strip().replace("\n", " ")
    return "  ".join(p.strip().replace("\n", " ") for p in parts)


def should_skip_block(block: str, lang: str) -> bool:
    hdr = block.split("\n", 1)[0]
    if "Merged into" in hdr or "Влит в" in hdr:
        return True
    if "Ashford Debut" in hdr or "Nobility Unlock" in hdr:
        return True
    if "Разблокировка Nobility" in hdr or "дебют Эшфорд" in hdr.lower():
        return True
    if "Дебют леди Эшфорд" in block[:300]:
        return True
    return False


def parse_arc_beats(section: str, arc_id: int, lang: str = "en") -> list[dict]:
    char_map = CHAR_MAP_RU if lang == "ru" else CHAR_MAP
    if lang == "ru":
        beat_blocks = re.split(r"(?=### Эпизод \d+ — День )", section)
        hdr_re = r"### Эпизод (\d+) — День (\d+)"
        choice_re = (
            r"\*\*Выбор (\d+):\*\* (.+?)\n"
            r"(?:- \*\*Ответ(?: \([^)]+\))?:\*\* (.+?)\n)?"
            r"- \*\*Эффекты(?: \([^)]+\))?:\*\* (.+?)"
            r"(?=\n- \*\*След|\n- \*\*Ответ|\n\n\*\*Выбор|\n---|\Z)"
        )
        next_re = r"\*\*Следующий узел:\*\* (\d+)"
        char_re = r"\*\*Персонаж:\*\* (.+)"
    else:
        beat_blocks = re.split(r"(?=### Beat \d+ — Day )", section)
        hdr_re = r"### Beat (\d+) — Day (\d+)"
        choice_re = (
            r"\*\*Choice (\d+):\*\* (.+?)\n"
            r"(?:- \*\*Response(?: \([^)]+\))?:\*\* (.+?)\n)?"
            r"- \*\*Effects(?: \([^)]+\))?:\*\* (.+?)"
            r"(?=\n- \*\*Next|\n- \*\*Response|\n\n\*\*Choice|\n---|\Z)"
        )
        next_re = r"\*\*Next node:\*\* (\d+)"
        char_re = r"\*\*Character:\*\* (.+)"

    beats = []
    beat_idx = 0
    for block in beat_blocks:
        hdr = re.search(hdr_re, block)
        if not hdr:
            continue
        if should_skip_block(block, lang):
            continue

        char_m = re.search(char_re, block)
        char_name = normalize_char_name(char_m.group(1)) if char_m else "Old Advisor Edric"
        char_idx = char_map.get(char_name, "CHAR_EDRIC")

        prompt = extract_prompt(block, lang)
        if not prompt:
            continue

        choices = []
        for cm in re.finditer(choice_re, block, re.S):
            choice_text = cm.group(2).strip()
            response = (cm.group(3) or "").strip()
            effects_line = cm.group(4).strip()
            effects_line = re.sub(r"\n- \*\*(?:Sets|Clears|Progress|Enables|Устанавливает|Снимает)[^*]+:\*\*.*", "", effects_line)
            next_m = re.search(next_re, block[cm.end() : cm.end() + 120])
            next_node = int(next_m.group(1)) if next_m else -1
            choices.append({
                "text": choice_text,
                "response": response,
                "deltas": parse_effects(effects_line),
                "next": next_node,
            })

        if not choices:
            continue

        node_count = 1
        if any(c["next"] >= 0 for c in choices):
            node_count = max(1 + max(c["next"] for c in choices if c["next"] >= 0), 1)

        verdict_tokens = ("Verdict", "verdict", "Вердикт", "вердикт")
        beats.append({
            "arc_id": arc_id,
            "beat_idx": beat_idx,
            "day": int(hdr.group(2)),
            "char": char_idx,
            "prompt": prompt,
            "choices": choices,
            "node_count": node_count,
            "is_finale": any(t in block[:400] for t in verdict_tokens),
        })
        beat_idx += 1
    return beats


def emit_encounter(b: dict, indent="        ", lang: str = "en") -> str:
    lines = [f"{indent}Encounter("]
    lines.append(f"{indent}    startNodeIdx = 0,")
    lines.append(f"{indent}    nodeCount = {b['node_count']},")
    lines.append(f"{indent}    characterIdx = {b['char']},")
    lines.append(f"{indent}    nodes = fixed_array(")
    chs = b["choices"]
    prompt = b["prompt"]
    if lang == "ru":
        prompt = localize_ru_text(prompt)
    prompt = sanitize_static_prompt(prompt, b, lang)
    prompt = escape_das(prompt)
    lines.append(f"{indent}        DialogueNode(")
    lines.append(f'{indent}            prompt = "{prompt}",')
    lines.append(f"{indent}            choiceCount = {len(chs)},")
    lines.append(f"{indent}            choices = fixed_array(")
    for ci in range(5):
        if ci < len(chs):
            c = chs[ci]
            dt = ", ".join(str(d) for d in c["deltas"])
            choice_text = c["text"]
            response = c["response"]
            if lang == "ru":
                choice_text = localize_ru_text(choice_text)
                response = localize_ru_text(response)
            resp = escape_das(response)
            if c["next"] >= 0:
                lines.append(
                    f'{indent}                DialogueChoice(choiceText = "{escape_das(choice_text)}", response = "{resp}", statDeltas = fixed_array({dt}), nextNodeIdx = {c["next"]}),'
                )
            else:
                lines.append(
                    f'{indent}                DialogueChoice(choiceText = "{escape_das(choice_text)}", response = "{resp}", statDeltas = fixed_array({dt})),'
                )
        else:
            lines.append(f"{indent}                DialogueChoice(),")
    lines.append(f"{indent}            )")
    lines.append(f"{indent}        ),")
    for _ in range(MAX_NODES_PER_ENCOUNTER - 1):
        lines.append(f"{indent}        DialogueNode(),")
    lines.append(f"{indent}    )")
    lines.append(f"{indent})")
    return "\n".join(lines)


def emit_arc_module(all_beats: list[dict], module_name: str, beats_suffix: str, lang: str = "en") -> str:
    by_arc: dict[int, list] = {}
    for b in all_beats:
        by_arc.setdefault(b["arc_id"], []).append(b)

    enc_lines = []
    for const, arc_id, _title in ARC_SECTIONS:
        beats = by_arc.get(arc_id, [])
        enc_lines.append(f"let public arc{arc_id}{beats_suffix} : Encounter[{len(beats) if beats else 1}] <- fixed_array(")
        if beats:
            enc_lines.append(",\n".join(emit_encounter(b, lang=lang) for b in beats))
        else:
            enc_lines.append("    Encounter()")
        enc_lines.append(")")
        enc_lines.append("")

    return f"""require engine.core
require constants
require dialogue_types

module {module_name} public

{chr(10).join(enc_lines)}
"""


def build_day_map(all_beats: list[dict]) -> list[tuple[int, int, int, int]]:
    by_day: dict[int, list] = {}
    for b in all_beats:
        by_day.setdefault(b["day"], []).append(b)

    if 95 in by_day:
        prophet = [x for x in by_day[95] if x["arc_id"] == 10]
        grey = [x for x in by_day[95] if x["arc_id"] == 13]
        if prophet and grey:
            by_day[95] = [x for x in by_day[95] if x["arc_id"] != 10]
            by_day.setdefault(96, []).extend(prophet)
    if 185 in by_day:
        prophet = [x for x in by_day[185] if x["arc_id"] == 10]
        houses = [x for x in by_day[185] if x["arc_id"] == 7]
        if prophet and houses:
            by_day[185] = [x for x in by_day[185] if x["arc_id"] != 10]
            by_day.setdefault(187, []).extend(prophet)

    schedule = []
    for day in range(1, 366):
        cands = by_day.get(day, [])
        if not cands:
            continue
        if day in (30, 90, 175, 261, 321):
            cands = [c for c in cands if not (day == 30 and c["arc_id"] == 5 and c["beat_idx"] == 0)]
            if day == 175:
                cands = [c for c in cands if c["arc_id"] != 7 or "Ashford" not in str(c)]
            if day == 90:
                cands = [c for c in cands if c["arc_id"] != 8 or c["day"] != 92]
        if not cands:
            continue
        winner = max(cands, key=lambda c: ARC_PRIORITY.get(c["arc_id"], 0))
        schedule.append((day, winner["arc_id"], winner["beat_idx"], ARC_PRIORITY.get(winner["arc_id"], 0)))
    return schedule


def load_beats(ref_path: Path, sections: list, lang: str) -> list[dict]:
    text = ref_path.read_text(encoding="utf-8")
    all_titles = [s[2] for s in sections]
    pool_markers = (
        "\n## Pool Encounters",
        "\n## Пул Знати",
        "\n## Пул Верности",
        "\n## Пул Преемственности",
    )
    all_beats = []
    for const, arc_id, title in sections:
        section = extract_section(text, title, all_titles, pool_markers)
        if not section and lang == "en":
            if title == "The Crown Forfeit & Tithe War":
                section = extract_section(text, "The Crown Forfeit", all_titles, pool_markers)
        beats = parse_arc_beats(section, arc_id, lang)
        print(f"{lang} {const}: {len(beats)} beats")
        all_beats.extend(beats)
    return all_beats


def main():
    beats_en = load_beats(REF_EN, ARC_SECTIONS, "en")
    beats_ru = load_beats(REF_RU, ARC_SECTIONS_RU, "ru")

    schedule = build_day_map(beats_en)

    (ROOT / "arc_encounters_en.das").write_text(
        emit_arc_module(beats_en, "arc_encounters_en", "BeatsEn"),
        encoding="utf-8",
    )
    (ROOT / "arc_encounters_ru.das").write_text(
        emit_arc_module(beats_ru, "arc_encounters_ru", "BeatsRu", lang="ru"),
        encoding="utf-8",
    )

    count_lines = []
    by_arc: dict[int, list] = {}
    for b in beats_en:
        by_arc.setdefault(b["arc_id"], []).append(b)
    for const, arc_id, _title in ARC_SECTIONS:
        count_lines.append(f"    ARC_{const.split('_', 1)[1]}_BEAT_COUNT = {len(by_arc.get(arc_id, []))}")

    sched_entries = ",\n".join(
        f"    ArcDaySlot(day = {d}, arcId = {a}, beatIdx = {b}, priority = {p})" for d, a, b, p in schedule
    )
    sched_das = f"""require engine.core
require constants

module arc_schedule public

struct ArcDaySlot {{
    day : int
    arcId : int
    beatIdx : int
    priority : int
}}

let public ARC_SCHEDULE_COUNT = {len(schedule)}

let public arcDaySchedule : ArcDaySlot[ARC_SCHEDULE_COUNT] <- fixed_array(
{sched_entries}
)

let public {{
{chr(10).join(count_lines)}
}}
"""
    (ROOT / "arc_schedule.das").write_text(sched_das, encoding="utf-8")
    print(f"Schedule: {len(schedule)} arc days, EN beats: {len(beats_en)}, RU beats: {len(beats_ru)}")


if __name__ == "__main__":
    main()

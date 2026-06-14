#!/usr/bin/env python3
"""Parse encounter .das files and generate QUESTIONS_REFERENCE.md (+ RU)."""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

STAT_NAMES = [
    "People", "Church", "Army", "Treasury", "Health",
    "Loyalty", "Nobility", "Food", "Succession",
]

CHAR_MAP_EN = {
    "CHAR_RUDOLF": "General Rudolf",
    "CHAR_MALRIK": "High Priest Malrik",
    "CHAR_BORVIN": "Treasurer Borvin",
    "CHAR_MIRA": "Healer Mira",
    "CHAR_GROMM": "Cook Gromm",
    "CHAR_VARN": "Captain Varn",
    "CHAR_EDRIC": "Old Advisor Edric",
    "CHAR_SELENA": "Merchant Selena",
    "CHAR_MORWEN": "Executioner Morwen",
    "CHAR_ARVEL": "Monk Arvel",
    "CHAR_INGVAR": "Ambassador Ingvar",
    "CHAR_SIVIL": "Apothecary Sivil",
}

CHAR_MAP_RU = {
    "CHAR_RUDOLF": "Генерал Рудольф",
    "CHAR_MALRIK": "Верховный жрец Малрик",
    "CHAR_BORVIN": "Казначей Борвин",
    "CHAR_MIRA": "Лекарь Мира",
    "CHAR_GROMM": "Повар Громм",
    "CHAR_VARN": "Капитан Варн",
    "CHAR_EDRIC": "Старый советник Эдрик",
    "CHAR_SELENA": "Купчиха Селена",
    "CHAR_MORWEN": "Палач Морвен",
    "CHAR_ARVEL": "Монах Арвел",
    "CHAR_INGVAR": "Посол Ингвар",
    "CHAR_SIVIL": "Аптекарь Сивил",
}

POOLS = [
    ("Early Pool", 0, 30, "Days 1–10 (index 0 = Edric tutorial, replaced at runtime; no People stat)"),
    ("Mid Pool", 30, 50, "Days 11–29 (no People stat)"),
    ("Late Pool A", 80, 80, "Days 30–89 (index 80 = Church unlock fixed encounter; no People stat)"),
    ("Late Pool B", 160, 20, "Days 30–89 extension (no People stat)"),
    ("People Pool", 180, 72, "Days 90+ (People stat unlock at day 89)"),
]

ARRAY_MARKERS_EN = [
    ("allEncountersEnEarly", 0),
    ("allEncountersEnMid", 30),
    ("allEncountersEnLateA", 80),
    ("allEncountersEnLateB", 160),
    ("allEncountersEnPeople", 180),
]

ARRAY_MARKERS_RU = [
    ("allEncountersRuEarly", 0),
    ("allEncountersRuMid", 30),
    ("allEncountersRuLateA", 80),
    ("allEncountersRuLateB", 160),
    ("allEncountersRuPeople", 180),
]

LANG_CONFIG = {
    "en": {
        "output": "QUESTIONS_REFERENCE.md",
        "encounters_file": "encounters_en.das",
        "array_markers": ARRAY_MARKERS_EN,
        "char_map": CHAR_MAP_EN,
        "title": "Questions & Choices Reference",
        "subtitle": "Complete catalogue of court encounters: prompts, player choices, NPC responses, and stat effects.",
        "language_line": "**Language:** English (from `encounters_en.das`, `edric_opener.das`, `ashford.das`)",
        "other_link": "**Russian version:** [QUESTIONS_REFERENCE_RU.md](QUESTIONS_REFERENCE_RU.md)",
        "edric_key": "edricDayOneEncounter",
        "ashford_key": "ashfordDebutEncounter",
        "ashford_character": "Lady Ashford",
        "edric_title": "Day 1 Tutorial — Old Advisor Edric",
        "edric_note": "Replaces pool encounter #0 on day 1 (POOL_EARLY_FIXED_IDX).",
        "ashford_title": "Lady Ashford Debut (Nobility unlock)",
        "ashford_note": "Triggered by nobility stat unlock cutscene, not from question pools.",
        "special_heading": "Special Encounters (outside random pools)",
        "pool_heading": "Pool Encounters",
        "total_label": "**Total pool encounters:**",
        "extra_idx0": "Pool slot for day-1 Edric tutorial; at runtime shows Edric opener instead of this text.",
        "extra_idx80": "Fixed late-pool encounter on day 30 (Church unlock). Choices 0 and 2 set nickname 'Saint'; choice 1 sets 'Demander'.",
        "no_choices": "_No choices parsed._",
        "no_stat": "_No stat data_",
        "no_stat_change": "No stat change",
        "nodes_label": "**Nodes:**",
        "character_label": "**Character:**",
        "note_label": "**Note:**",
        "prompt_label": "**Prompt:**",
        "choice_label": "**Choice",
        "response_label": "**Response:**",
        "effects_label": "**Effects:**",
        "next_node_label": "**Next node:**",
        "start_node": "(start node:",
    },
    "ru": {
        "output": "QUESTIONS_REFERENCE_RU.md",
        "encounters_file": "encounters_ru.das",
        "array_markers": ARRAY_MARKERS_RU,
        "char_map": CHAR_MAP_RU,
        "title": "Справочник вопросов и ответов",
        "subtitle": "Полный каталог придворных встреч: тексты вопросов, варианты ответов, реплики NPC и эффекты на показатели.",
        "language_line": "**Язык:** русский (из `encounters_ru.das`, `edric_opener.das`, `ashford.das`)",
        "other_link": "**English version:** [QUESTIONS_REFERENCE.md](QUESTIONS_REFERENCE.md)",
        "edric_key": "edricDayOneEncounterRu",
        "ashford_key": "ashfordDebutEncounterRu",
        "ashford_character": "Леди Эшфорд",
        "edric_title": "День 1 — обучение, старый советник Эдрик",
        "edric_note": "Заменяет встречу #0 в раннем пуле в первый день (POOL_EARLY_FIXED_IDX).",
        "ashford_title": "Дебют леди Эшфорд (разблокировка знати)",
        "ashford_note": "Запускается кат-сценой разблокировки показателя знати, не из пулов вопросов.",
        "special_heading": "Особые встречи (вне случайных пулов)",
        "pool_heading": "Встречи из пулов",
        "total_label": "**Всего встреч в пулах:**",
        "extra_idx0": "Слот пула для обучения Эдрика в день 1; в игре показывается вступление Эдрика вместо этого текста.",
        "extra_idx80": "Фиксированная поздняя встреча в день 30 (разблокировка Церкви). Варианты 0 и 2 дают прозвище «Святой»; вариант 1 — «Требователь».",
        "no_choices": "_Варианты не распознаны._",
        "no_stat": "_Нет данных о показателях_",
        "no_stat_change": "Без изменения показателей",
        "nodes_label": "**Узлов:**",
        "character_label": "**Персонаж:**",
        "note_label": "**Примечание:**",
        "prompt_label": "**Вопрос:**",
        "choice_label": "**Вариант",
        "response_label": "**Ответ:**",
        "effects_label": "**Эффекты:**",
        "next_node_label": "**Следующий узел:**",
        "start_node": "(стартовый узел:",
    },
}


def find_balanced_block(text: str, open_paren_idx: int) -> str:
    if open_paren_idx < 0 or text[open_paren_idx] != "(":
        return ""
    depth = 0
    for i in range(open_paren_idx, len(text)):
        if text[i] == "(":
            depth += 1
        elif text[i] == ")":
            depth -= 1
            if depth == 0:
                return text[open_paren_idx : i + 1]
    return ""


def find_construct_blocks(text: str, construct: str) -> list[str]:
    blocks = []
    needle = construct + "("
    start = 0
    while True:
        idx = text.find(needle, start)
        if idx < 0:
            break
        open_idx = idx + len(construct)
        block = find_balanced_block(text, open_idx)
        if block:
            blocks.append(block[1:-1])
        start = idx + len(needle)
    return blocks


def extract_string_value(text: str, key: str) -> str | None:
    pattern = rf'{key}\s*=\s*"((?:\\.|[^"\\])*)"'
    m = re.search(pattern, text)
    return m.group(1) if m else None


def extract_int_value(text: str, key: str) -> int | None:
    m = re.search(rf"{key}\s*=\s*(\d+)", text)
    return int(m.group(1)) if m else None


def extract_char_name(text: str, char_map: dict[str, str]) -> str:
    m = re.search(r"characterIdx\s*=\s*(CHAR_\w+)", text)
    if m:
        return char_map.get(m.group(1), m.group(1))
    return "Unknown"


def parse_stat_deltas(text: str) -> list[int] | None:
    if "NO_STAT_CHANGE" in text:
        return [0] * 9
    m = re.search(r"fixed_array\(\s*([-\d,\s]+)\s*\)", text)
    if not m:
        return None
    return [int(x.strip()) for x in m.group(1).split(",") if x.strip()]


def format_effects(deltas: list[int] | None, cfg: dict) -> str:
    if deltas is None:
        return cfg["no_stat"]
    parts = []
    for name, val in zip(STAT_NAMES, deltas):
        if val != 0:
            parts.append(f"{name} {'+' if val > 0 else ''}{val}")
    return ", ".join(parts) if parts else cfg["no_stat_change"]


def split_top_level_encounters(content: str, start_marker: str) -> list[str]:
    idx = content.find(start_marker)
    if idx < 0:
        return []
    array_open = content.find("fixed_array(", idx)
    if array_open < 0:
        return []
    array_block = find_balanced_block(content, array_open + len("fixed_array(") - 1)
    if not array_block:
        return []
    inner = array_block[1:-1]
    return find_construct_blocks(inner, "Encounter")


def parse_dialogue_choices(node_text: str) -> list[dict]:
    choices = []
    for block in find_construct_blocks(node_text, "DialogueChoice"):
        if not block.strip():
            continue
        choice_text = extract_string_value(block, "choiceText")
        if choice_text is None:
            continue
        response = extract_string_value(block, "response") or ""
        deltas = parse_stat_deltas(block)
        next_node = extract_int_value(block, "nextNodeIdx")
        choices.append({
            "choiceText": choice_text,
            "response": response,
            "deltas": deltas,
            "nextNodeIdx": next_node,
        })
    return choices


def parse_dialogue_nodes(encounter_text: str) -> list[dict]:
    nodes = []
    nodes_marker = encounter_text.find("nodes = fixed_array(")
    if nodes_marker < 0:
        return nodes
    array_open = encounter_text.find("fixed_array(", nodes_marker)
    nodes_array = find_balanced_block(encounter_text, array_open + len("fixed_array(") - 1)
    if not nodes_array:
        return nodes
    inner = nodes_array[1:-1]

    for block in find_construct_blocks(inner, "DialogueNode"):
        if not block.strip():
            continue
        prompt = extract_string_value(block, "prompt")
        if prompt is None:
            continue
        choice_count = extract_int_value(block, "choiceCount") or 0
        choices = parse_dialogue_choices(block)
        if choice_count:
            choices = choices[:choice_count]
        nodes.append({
            "prompt": prompt,
            "choiceCount": choice_count,
            "choices": choices,
        })
    return nodes


def parse_encounter(block: str, char_map: dict[str, str]) -> dict:
    return {
        "character": extract_char_name(block, char_map),
        "startNodeIdx": extract_int_value(block, "startNodeIdx") or 0,
        "nodeCount": extract_int_value(block, "nodeCount") or 0,
        "nodes": parse_dialogue_nodes(block),
    }


def parse_standalone_encounters(path: Path, char_map: dict[str, str], ru_only: bool = False) -> dict[str, dict]:
    content = path.read_text(encoding="utf-8")
    results = {}
    patterns = [
        r"let\s+(\w+)\s*:\s*Encounter\s*<-\s*Encounter\(",
        r"let\s+(\w+)\s*=\s*Encounter\(",
    ]
    for pattern in patterns:
        for m in re.finditer(pattern, content):
            var_name = m.group(1)
            if ru_only and not var_name.endswith("Ru"):
                continue
            if not ru_only and var_name.endswith("Ru"):
                continue
            open_idx = m.end() - 1
            block_with_parens = find_balanced_block(content, open_idx)
            if block_with_parens:
                results[var_name] = parse_encounter(block_with_parens[1:-1], char_map)
    return results


def load_pool_encounters(encounters_path: Path, array_markers: list, char_map: dict) -> list[tuple[int, dict]]:
    content = encounters_path.read_text(encoding="utf-8")
    all_encounters: list[tuple[int, dict]] = []
    for marker, base in array_markers:
        blocks = split_top_level_encounters(content, marker)
        for i, block in enumerate(blocks):
            all_encounters.append((base + i, parse_encounter(block, char_map)))
    return all_encounters


def render_encounter_md(
    global_idx: int | None,
    title: str,
    enc: dict,
    cfg: dict,
    extra_note: str = "",
) -> str:
    lines = []
    header = f"### {title}"
    if global_idx is not None:
        header = f"### Encounter #{global_idx} — {title}"
    lines.append(header)
    lines.append("")
    lines.append(f"{cfg['character_label']} {enc['character']}")
    if extra_note:
        lines.append(f"{cfg['note_label']} {extra_note}")
    lines.append(
        f"{cfg['nodes_label']} {enc['nodeCount']} {cfg['start_node']} {enc['startNodeIdx']})"
    )
    lines.append("")

    for ni, node in enumerate(enc["nodes"]):
        lines.append(f"#### Node {ni}")
        lines.append("")
        lines.append(f"{cfg['prompt_label']} {node['prompt']}")
        lines.append("")
        for ci, choice in enumerate(node["choices"]):
            lines.append(f"{cfg['choice_label']} {ci + 1}:** {choice['choiceText']}")
            if choice["response"]:
                lines.append(f"- {cfg['response_label']} {choice['response']}")
            lines.append(f"- {cfg['effects_label']} {format_effects(choice['deltas'], cfg)}")
            if choice.get("nextNodeIdx") is not None:
                lines.append(f"- {cfg['next_node_label']} {choice['nextNodeIdx']}")
            lines.append("")
        if not node["choices"]:
            lines.append(cfg["no_choices"])
            lines.append("")

    lines.append("---")
    lines.append("")
    return "\n".join(lines)


def build_reference(lang: str) -> tuple[list[str], list[tuple[int, dict]]]:
    cfg = LANG_CONFIG[lang]
    all_encounters = load_pool_encounters(
        ROOT / cfg["encounters_file"],
        cfg["array_markers"],
        cfg["char_map"],
    )
    standalone = parse_standalone_encounters(
        ROOT / "edric_opener.das",
        cfg["char_map"],
        ru_only=(lang == "ru"),
    )
    standalone.update(parse_standalone_encounters(
        ROOT / "ashford.das",
        cfg["char_map"],
        ru_only=(lang == "ru"),
    ))

    out = []
    out.append(f"# {cfg['title']}")
    out.append("")
    out.append(cfg["subtitle"])
    out.append("")
    out.append(cfg["language_line"])
    out.append("")
    out.append(cfg["other_link"])
    out.append("")
    out.append("**Stat order:** People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession")
    out.append("")
    out.append("**Pools:**")
    for name, start, count, desc in POOLS:
        out.append(f"- **{name}** (indices {start}–{start + count - 1}): {desc}")
    out.append("")
    out.append(f"{cfg['total_label']} {len(all_encounters)}")
    out.append("")
    out.append("---")
    out.append("")

    out.append(f"## {cfg['special_heading']}")
    out.append("")
    edric_key = cfg["edric_key"]
    if edric_key in standalone:
        out.append(render_encounter_md(
            0,
            cfg["edric_title"],
            standalone[edric_key],
            cfg,
            cfg["edric_note"],
        ))
    ashford_key = cfg["ashford_key"]
    if ashford_key in standalone:
        ashford_enc = standalone[ashford_key].copy()
        ashford_enc["character"] = cfg["ashford_character"]
        out.append(render_encounter_md(
            None,
            cfg["ashford_title"],
            ashford_enc,
            cfg,
            cfg["ashford_note"],
        ))

    out.append(f"## {cfg['pool_heading']}")
    out.append("")

    current_pool = None
    for global_idx, enc in all_encounters:
        pool_name = None
        for name, start, count, _desc in POOLS:
            if start <= global_idx < start + count:
                pool_name = name
                break
        if pool_name != current_pool:
            current_pool = pool_name
            out.append(f"## {pool_name}")
            out.append("")
            for n, s, c, d in POOLS:
                if n == pool_name:
                    out.append(f"_{d}_")
                    out.append("")

        extra = ""
        if global_idx == 0:
            extra = cfg["extra_idx0"]
        elif global_idx == 80:
            extra = cfg["extra_idx80"]

        out.append(render_encounter_md(global_idx, enc["character"], enc, cfg, extra))

    return out, all_encounters


# Proofreading fixes applied after generation so they survive `python scripts/generate_questions_md.py`.
TEXT_CORRECTIONS: dict[str, dict[str, str]] = {
    "en": {
        "there is more cobwebs": "there are more cobwebs",
        "she doesn't give out coins": "it doesn't give out coins",
        "she doesn\u2019t give out coins": "it doesn\u2019t give out coins",
        "She's just waiting until it's too late.": "It's just waiting until it's too late.",
        "Can. Cheap meat": "Yes. Cheap meat",
        "And he will remember that the king is counting candles.": "And it will remember that the king is counting candles.",
        "Use for soldier's porridge.": "Use it for soldiers' porridge.",
        "The treasury will not appreciate him, but widows may.": "The treasury will not appreciate it, but widows may.",
        "If you collect it, it will become calmer.": "If you collect them, it will become calmer.",
        "Although the soldiers love him less.": "Although the soldiers love it less.",
        "Dear mercy. But living taxpayers": "Costly mercy. But living taxpayers",
        "Try a corrupt official.": "Put a corrupt official on trial.",
        "Sometimes people don't differentiate.": "Sometimes people can't tell the difference.",
        "Leave it, but add my coat of arms.": "Leave them, but add my coat of arms.",
        "But he makes her speak in a whisper.": "But it makes memory speak in a whisper.",
        "Give you a monopoly.": "Grant her a monopoly.",
        "Intelligent horror. It's easier to bear than slaughter.": "Measured horror. It's easier to bear than slaughter.",
        "Nice section. Everyone will get their own ax and pickaxe.": "Fair division. Everyone will get their own ax and pickaxe.",
        "your boundaries are just as strong.": "your borders are just as strong.",
        "Tell me: I'm looking for friends.": "Tell him: I'm looking for friends.",
        "Tell me: I'm showing my teeth.": "Tell him: I'm showing my teeth.",
        "Tell me: I trade, but I don't bow.": "Tell him: I trade, but I don't bow.",
        "Tell me: I trade, but I don\u2019t bow.": "Tell him: I trade, but I don\u2019t bow.",
        "But he is bad at forgiving.": "But it is bad at forgiving.",
        "But now he is needed.": "But now it is needed.",
        "Don't waste money on dice.": "Don't waste money on relics.",
        "People don't believe in dice.": "People don't believe in relics.",
        "Altar will split the price. And he will remember that the throne knows how to bargain.": "The altar will split the price. And it will remember that the throne knows how to bargain.",
        "Until he finds a new owner.": "Until it finds a new owner.",
        "I will bring her to the city.": "I will bring it to the city.",
        "the king left her an orphan.": "the king left him an orphan.",
        "Give it to the monastery.": "Give him to the monastery.",
        "Entrust the dosage to you.": "Entrust the dosage to me.",
        "Headmen are good for arguing about price.": "Elders are good for arguing about price.",
        "Give me a warehouse and money.": "Provide a warehouse and funding.",
        "Silent hunt. I like.": "Silent hunt. I like it.",
        "Palace rats walk on two legs. Understand.": "Palace rats walk on two legs. You understand.",
        "Until they are found.": "Until it is found.",
        "People won't elaborate.": "People won't ask questions.",
        "Turnip - no, she was humiliated again.": "The turnip — no, it was humiliated again.",
        "Carve and leave to serve.": "Brand and leave to serve.",
        "We'll have to differentiate.": "We'll have to decide.",
        "don't remain them for long.": "don't remain kings for long.",
        "don\u2019t remain them for long.": "don\u2019t remain kings for long.",
        "She also has an educational sound.": "It also has an educational sound.",
        "Pisces doesn't like to wait": "Fish doesn't like to wait",
        "Accuse you of creating poison.": "Accuse Sivil of creating poison.",
        "Announce a general post.": "Announce a general fast.",
        "This post is for the palace only.": "This fast is for the palace only.",
        "Refuse the post.": "Refuse the fast.",
        "The soldiers will call him differently.": "The soldiers will call it differently.",
        "Morven will have less work to do": "Morwen will have less work to do",
        "the cameras will soon begin to prepare their own scent.": "the cells will soon begin to prepare their own scent.",
        "I hope she doesn't go away completely.": "I hope it doesn't go away completely.",
        "Can. But kingdoms perish not only from bad decisions.": "You can. But kingdoms perish not only from bad decisions.",
        "Priests something longer.": "Priests will complain longer.",
        "Fold temple guard into the royal guard.": "Merge the temple guard into the royal guard.",
        "Ideas — differently.": "Ideas burn differently.",
        "Leave it and heresy moves from cellars to the market.": "Allow it and heresy moves from cellars to the market.",
        "If the enemy takes the train, it is disgrace.": "If the enemy takes the caravan, it is disgrace.",
        "while church wants what you want.": "while the church wants what you want.",
        "Confession voluntary only.": "Make confession voluntary only.",
    },
    "ru": {
        "начало мора.": "начало чумы.",
        "Найди другой источник дохода.": "Найти другой источник дохода.",
        "Не тратить деньги на кости.": "Не тратить деньги на реликвии.",
        "Не все кости мертвы для народа": "Не все реликвии мертвы для народа",
        "Не все кости мёртвы для народа": "Не все реликвии мёртвы для народа",
        "Люди верят не в кости.": "Люди верят не в реликвии.",
        "Дать тебе монополию.": "Дать ей монополию.",
        "Обвинить тебя в создании яда.": "Обвинить Сивила в создании яда.",
        "Дать склад и деньги.": "Выделить склад и средства.",
        "Дозировку доверить тебе.": "Дозировку доверить мне.",
        "Тихая охота. Мне нравится.": "Тихая охота. Мне это нравится.",
        "Народ не станет уточнять.": "Народ не станет спрашивать.",
        "народ не станет уточнять.": "народ не станет спрашивать.",
        "Придётся различать.": "Придётся решать.",
        "Идеи — по-разному.": "Идеи горят иначе.",
        "король оставил её сиротой.": "король оставил его сиротой.",
        "Мяса есть будут меньше": "Мяса будет меньше",
        "Репа — нет, её снова унизили.": "Репе снова досталось.",
        "кто недолго ими остаётся.": "кто недолго остаётся королями.",
        "Тогда камеры скоро начнут готовить свой собственный запах.": "Тогда из камер скоро пойдёт свой собственный запах.",
        "Священники — что-нибудь длиннее.": "Священники будут жаловаться дольше.",
        "Исповедь только добровольно.": "Сделать исповедь только добровольной.",
        "Можно. Но королевства гибнут не только от плохих решений.": "Можно попробовать. Но королевства гибнут не только от плохих решений.",
        "Кого ты подозреваешь?": "Кого вы подозреваете?",
        "Что ты думаешь о письме?": "Что вы думаете о письме?",
        "Почему твой князь просит именно сейчас?": "Почему ваш князь просит именно сейчас?",
        "Почему тебе нужна именно королевская охрана?": "Почему вам нужна именно королевская охрана?",
        "Почему ты предлагаешь помощь так охотно?": "Почему вы предлагаете помощь так охотно?",
        "Ты называешь это порядком или страхом?": "Вы называете это порядком или страхом?",
        "Ты думаешь, оно испорчено?": "Вы думаете, оно испорчено?",
        "Ты знаешь, кто помогает ворам?": "Вы знаете, кто помогает ворам?",
        "Ты хочешь кормить или обращать?": "Вы хотите кормить или обращать?",
        "Ты предлагаешь мне яд?": "Вы предлагаете мне яд?",
        "Ты хочешь, чтобы я выбрал между мечом и народом?": "Вы хотите, чтобы я выбрал между мечом и народом?",
        "Ты угрожаешь короне голодом?": "Вы угрожаете короне голодом?",
        "Откуда ты знаешь, что это яд?": "Откуда вы знаете, что это яд?",
        "Ты хочешь контролировать хлеб?": "Вы хотите контролировать хлеб?",
        "Почему тебе нужен именно мост?": "Почему вам нужен именно мост?",
        "Почему у тебя уже есть столько зерна?": "Почему у вас уже есть столько зерна?",
        "Выкупить зерно по твоей цене.": "Выкупить зерно по вашей цене.",
        "Заплатить твою цену.": "Заплатить вашу цену.",
        "Что говорит твоя совесть?": "Что говорит ваша совесть?",
        "Дать склад без денег.": "Выделить склад без финансирования.",
        "Можно. Дешёвое мясо": "Да, можно. Дешёвое мясо",
        "решит, что ела редкость.": "решит, что ели редкость.",
        "Разумный ужас.": "Смеренный ужас.",
        "Иногда народ не различает.": "Иногда народ не отличит одно от другого.",
        "Высечь и оставить служить.": "Клеймить и оставить на службе.",
        "Включить храмовую стражу в королевскую.": "Объединить храмовую стражу с королевской.",
        "Если это оставить, завтра ересь будет не в подвалах, а на рынке.": "Если это разрешить, завтра ересь будет не в подвалах, а на рынке.",
        "так же тверды.": "так же твёрды.",
        "Не все реликвии мертвы для народа": "Не все реликвии мёртвы для народа",
        "и каждый лорд, спрашивавший, сможете ли вы удержаться.": "и каждый лорд, который спрашивал, сможете ли вы удержаться, услышит ответ.",
    },
}


def apply_text_corrections(text: str, lang: str) -> str:
    text = re.sub(r"[\u200b\ufeff\u00ad\u2060\ufe0f]", "", text)
    for old, new in TEXT_CORRECTIONS.get(lang, {}).items():
        text = text.replace(old, new)
    return text


def main():
    for lang in ("en", "ru"):
        out, encounters = build_reference(lang)
        content = apply_text_corrections("\n".join(out), lang)
        output_path = ROOT / LANG_CONFIG[lang]["output"]
        output_path.write_text(content, encoding="utf-8")
        sample = encounters[0][1] if encounters else None
        print(f"Wrote {output_path} ({len(encounters)} pool encounters)")
        if sample and sample["nodes"]:
            print(f"  [{lang}] encounter #0: {len(sample['nodes'])} nodes, "
                  f"choice0 deltas={sample['nodes'][0]['choices'][0]['deltas']}")


if __name__ == "__main__":
    main()

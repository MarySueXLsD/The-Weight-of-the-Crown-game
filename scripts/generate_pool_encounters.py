#!/usr/bin/env python3
"""Generate encounters_nobility/loyalty/succession _en/_ru.das from markdown pools."""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

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
}

STAT_ORDER = ["People", "Church", "Army", "Treasury", "Health", "Loyalty", "Nobility", "Food", "Succession"]
MAX_NODES_PER_ENCOUNTER = 4


def escape_das(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("{", "\\{").replace("}", "\\}")


def parse_effects(line: str) -> list[int]:
    deltas = [0] * 9
    if "No stat change" in line or "Без изменения" in line:
        return deltas
    for part in re.split(r",\s*", line.replace("**Effects:**", "").strip()):
        part = part.strip()
        if not part:
            continue
        m = re.match(r"(\w+)\s*([+-]\d+)", part)
        if m:
            stat, val = m.group(1), int(m.group(2))
            if stat in STAT_ORDER:
                deltas[STAT_ORDER.index(stat)] = val
    return deltas


def parse_encounters(text: str, start_idx: int, end_idx: int, ru: bool = False) -> list[dict]:
    encounters = []
    blocks = re.split(r"\n---\n", text)
    enc_pat = r"### (?:Encounter|Встреча) #(\d+) — (.+)" if ru else r"### Encounter #(\d+) — (.+)"
    prompt_pat = (
        r"#### (?:Node|Узел) (\d+)\s*\n\n\*\*(?:Prompt|Вопрос):\*\* (.+?)(?=\n\n\*\*(?:Choice|Вариант)|\Z)"
        if ru
        else r"#### Node (\d+)\s*\n\n\*\*Prompt:\*\* (.+?)(?=\n\n\*\*Choice|\Z)"
    )
    choice_pat = (
        r"\*\*(?:Choice|Вариант) (\d+):\*\* (.+?)\n(?:- \*\*(?:Response|Ответ):\*\* (.+?)\n)?- \*\*(?:Effects|Эффекты):\*\* (.+?)(?=\n- \*\*(?:Next|Следующий)|\n\n\*\*(?:Choice|Вариант)|\n---|\Z)"
        if ru
        else r"\*\*Choice (\d+):\*\* (.+?)\n(?:- \*\*Response:\*\* (.+?)\n)?- \*\*Effects:\*\* (.+?)(?=\n- \*\*Next|\n\n\*\*Choice|\n---|\Z)"
    )
    next_pat = r"\*\*(?:Next node|Следующий узел):\*\* (\d+)" if ru else r"\*\*Next node:\*\* (\d+)"

    char_map_ru = {
        "Казначей Борвин": "CHAR_BORVIN",
        "Купчиха Селена": "CHAR_SELENA",
        "Старый советник Эдрик": "CHAR_EDRIC",
        "Капитан Варн": "CHAR_VARN",
        "Генерал Рудольф": "CHAR_RUDOLF",
        "Леди Эшфорд": "CHAR_ASHFORD",
        "Лорд Каспар Вейн": "CHAR_KASPAR",
        "Баронесса Иветта Кроу": "CHAR_YVETTE",
        "Графиня Марианна Делл": "CHAR_MARIANNA",
        "Летописец Илана": "CHAR_ILANA",
        "Банкир Доминик Солт": "CHAR_DOMINIC",
        "Банкир Доминик Salt": "CHAR_DOMINIC",
        "Верховный жрец Малрик": "CHAR_MALRIK",
        "Лекарь Мира": "CHAR_MIRA",
        "Монах Арвел": "CHAR_ARVEL",
        "Посол Ингвар": "CHAR_INGVAR",
        "Палач Морвен": "CHAR_MORWEN",
        "Повар Громм": "CHAR_GROMM",
        "Шпион Нокс": "CHAR_KNOX",
        "Телохранитель Раена": "CHAR_RAENA",
        "Сэр Отто Молчаливый": "CHAR_OTTO",
        "Горничная Лисса": "CHAR_LISSA",
        "Королевский писец Осрик": "CHAR_OSRIC",
    }
    cmap = char_map_ru if ru else CHAR_MAP

    for block in blocks:
        header = re.search(enc_pat, block)
        if not header:
            continue
        num = int(header.group(1))
        if num < start_idx or num > end_idx:
            continue
        char_name = header.group(2).strip()
        char_idx = cmap.get(char_name, CHAR_MAP.get(char_name, "CHAR_EDRIC"))

        node_match = re.search(prompt_pat, block, re.S)
        if not node_match:
            continue
        prompt = node_match.group(2).strip().replace("\n", " ")

        choices = []
        for cm in re.finditer(choice_pat, block, re.S):
            choice_text = cm.group(2).strip()
            response = (cm.group(3) or "").strip()
            effects_line = cm.group(4).strip()
            next_m = re.search(next_pat, block[cm.end() : cm.end() + 100])
            next_node = int(next_m.group(1)) if next_m else -1
            deltas = parse_effects(effects_line)
            choices.append(
                {
                    "text": choice_text,
                    "response": response,
                    "deltas": deltas,
                    "next": next_node,
                }
            )

        node_count = 1
        if any(c["next"] >= 0 for c in choices):
            node_count = max(1 + max(c["next"] for c in choices if c["next"] >= 0), 1)

        encounters.append(
            {
                "num": num,
                "char": char_idx,
                "prompt": prompt,
                "choices": choices,
                "node_count": node_count,
            }
        )
    encounters.sort(key=lambda e: e["num"])
    return encounters


def emit_encounter(enc: dict, indent: str = "    ") -> str:
    lines = [f"{indent}Encounter("]
    lines.append(f"{indent}    startNodeIdx = 0,")
    lines.append(f"{indent}    nodeCount = {enc['node_count']},")
    lines.append(f"{indent}    characterIdx = {enc['char']},")
    lines.append(f"{indent}    nodes = fixed_array(")

    nodes: dict[int, dict] = {0: {"prompt": enc["prompt"], "choices": []}}
    for c in enc["choices"]:
        nodes[0]["choices"].append(c)

    for ni in range(enc["node_count"]):
        if ni not in nodes:
            nodes[ni] = {"prompt": "", "choices": []}
        nd = nodes[ni]
        prompt = escape_das(nd["prompt"])
        chs = nd["choices"]
        choice_count = len(chs) if chs else 1
        lines.append(f"{indent}    DialogueNode(")
        lines.append(f'{indent}        prompt = "{prompt}",')
        lines.append(f"{indent}        choiceCount = {choice_count},")
        lines.append(f"{indent}        choices = fixed_array(")
        for ci in range(MAX_CHOICES := 5):
            if ci < len(chs):
                c = chs[ci]
                dt = ", ".join(str(d) for d in c["deltas"])
                resp = escape_das(c["response"])
                if c["next"] >= 0:
                    lines.append(
                        f'{indent}        DialogueChoice(choiceText = "{escape_das(c["text"])}", response = "{resp}", statDeltas = fixed_array({dt}), nextNodeIdx = {c["next"]}),'
                    )
                else:
                    lines.append(
                        f'{indent}        DialogueChoice(choiceText = "{escape_das(c["text"])}", response = "{resp}", statDeltas = fixed_array({dt})),'
                    )
            elif ci == 0 and not chs:
                lines.append(f"{indent}        DialogueChoice(),")
            else:
                lines.append(f"{indent}        DialogueChoice(),")
        lines.append(f"{indent}        )")
        needs_node_comma = ni < enc["node_count"] - 1 or (
            ni == enc["node_count"] - 1 and MAX_NODES_PER_ENCOUNTER > enc["node_count"]
        )
        if needs_node_comma:
            lines.append(f"{indent}    ),")
        else:
            lines.append(f"{indent}    )")
    for _ in range(MAX_NODES_PER_ENCOUNTER - enc["node_count"]):
        lines.append(f"{indent}        DialogueNode(),")
    lines.append(f"{indent}    )")
    lines.append(f"{indent})")
    return "\n".join(lines)


def emit_module(pool_name: str, array_name: str, count_const: str, encounters: list[dict], lang: str) -> str:
    body = ",\n".join(emit_encounter(e) for e in encounters)
    return f"""require engine.core
require constants
require dialogue_types

module encounters_{pool_name}_{lang} public

let public {array_name} : Encounter[{count_const}] <- fixed_array(
{body}
)
"""


def extract_pool_section(md_path: Path, section_title: str) -> str:
    text = md_path.read_text(encoding="utf-8")
    start = text.find(f"## {section_title}")
    if start < 0:
        raise SystemExit(f"Section not found: {section_title} in {md_path}")
    end = len(text)
    for marker in ("\n## ", "\n---\n\n## Pool coverage"):
        p = text.find(marker, start + 10)
        if p >= 0:
            end = min(end, p)
    return text[start:end]


def main() -> None:
    en_src = ROOT / "pool_expansion_tail.md"
    ru_src = ROOT / "QUESTIONS_REFERENCE_RU.md"

    pools = [
        ("nobility", "allEncountersEnNobility", "POOL_NOBILITY_COUNT", 252, 306, "Nobility Pool", "Пул Знати"),
        ("loyalty", "allEncountersEnLoyalty", "POOL_LOYALTY_COUNT", 307, 350, "Loyalty Pool", "Пул Верности"),
        ("succession", "allEncountersEnSuccession", "POOL_SUCCESSION_COUNT", 351, 390, "Succession Pool", "Пул Преемственности"),
    ]

    for pool, arr_en, count, lo, hi, en_title, ru_title in pools:
        en_enc = parse_encounters(extract_pool_section(en_src, en_title), lo, hi, ru=False)
        print(f"{pool} EN: {len(en_enc)} encounters (expected {hi - lo + 1})")
        (ROOT / f"encounters_{pool}_en.das").write_text(
            emit_module(pool, arr_en, count, en_enc, "en"), encoding="utf-8"
        )

        ru_enc = parse_encounters(extract_pool_section(ru_src, ru_title), lo, hi, ru=True)
        print(f"{pool} RU: {len(ru_enc)} encounters")
        ru_arr = arr_en.replace("allEncountersEn", "allEncountersRu")
        (ROOT / f"encounters_{pool}_ru.das").write_text(
            emit_module(pool, ru_arr, count, ru_enc, "ru"), encoding="utf-8"
        )


if __name__ == "__main__":
    main()

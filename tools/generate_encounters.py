#!/usr/bin/env python3
"""Generate encounters_en.das and encounters_ru.das from structured encounter data."""

from __future__ import annotations

import copy
import sys
from pathlib import Path

# Allow running as script from project root or tools/
_TOOLS_DIR = Path(__file__).resolve().parent
if str(_TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(_TOOLS_DIR))

from encounter_data import ENCOUNTERS, INTRO_EN, INTRO_RU  # noqa: E402

PROJECT_ROOT = _TOOLS_DIR.parent
MAX_CHOICES = 5
MAX_NODES = 4
NO = "NO_STAT_CHANGE"

CHAR = {
    "rudolf": "CHAR_RUDOLF",
    "malrik": "CHAR_MALRIK",
    "borvin": "CHAR_BORVIN",
    "mira": "CHAR_MIRA",
    "gromm": "CHAR_GROMM",
    "varn": "CHAR_VARN",
    "edric": "CHAR_EDRIC",
    "selena": "CHAR_SELENA",
    "morwen": "CHAR_MORWEN",
    "arvel": "CHAR_ARVEL",
    "ingvar": "CHAR_INGVAR",
    "sivil": "CHAR_SIVIL",
}


def d(p=0, c=0, a=0, g=0, h=0, l=0, n=0, f=0, s=0):
    return f"fixed_array({p}, {c}, {a}, {g}, {h}, {l}, {n}, {f}, {s})"


def escape_das(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")


def stats_str(stats: dict | None) -> str:
    if stats is None:
        return NO
    return d(
        p=stats.get("p", 0),
        c=stats.get("c", 0),
        a=stats.get("a", 0),
        g=stats.get("g", 0),
        h=stats.get("h", 0),
        l=stats.get("l", 0),
        n=stats.get("n", 0),
        f=stats.get("f", 0),
        s=stats.get("s", 0),
    )


def format_choice(choice: tuple, lang: str, indent: str) -> str:
    text_ru, text_en, resp_ru, resp_en = choice[0], choice[1], choice[2], choice[3]
    stats = choice[4] if len(choice) > 4 else None
    next_node = choice[5] if len(choice) > 5 else None

    text = text_ru if lang == "ru" else text_en
    response = resp_ru if lang == "ru" else resp_en

    lines = [
        f"{indent}DialogueChoice(",
        f'{indent}    choiceText = "{escape_das(text)}",',
        f'{indent}    response = "{escape_das(response)}",',
        f"{indent}    statDeltas = {stats_str(stats)}",
    ]
    if next_node is not None:
        lines[-1] += ","
        lines.append(f"{indent}    nextNodeIdx = {next_node}")
    lines.append(f"{indent})")
    return "\n".join(lines)


def pad_choices(choices_lines: list[str], indent: str) -> list[str]:
    while len(choices_lines) < MAX_CHOICES:
        choices_lines.append(f"{indent}DialogueChoice()")
    return choices_lines


def format_node(node: tuple, lang: str, indent: str) -> str:
    prompt_ru, prompt_en, choices = node
    prompt = prompt_ru if lang == "ru" else prompt_en
    choice_indent = indent + "    "
    choice_lines = [format_choice(c, lang, choice_indent) for c in choices]
    choice_lines = pad_choices(choice_lines, choice_indent)
    choices_block = ",\n".join(choice_lines)
    return (
        f"{indent}DialogueNode(\n"
        f'{indent}    prompt = "{escape_das(prompt)}",\n'
        f"{indent}    choiceCount = {len(choices)},\n"
        f"{indent}    choices = fixed_array(\n"
        f"{choices_block}\n"
        f"{indent}    )\n"
        f"{indent})"
    )


def pad_nodes(node_lines: list[str], indent: str) -> list[str]:
    while len(node_lines) < MAX_NODES:
        node_lines.append(f"{indent}DialogueNode()")
    return node_lines


def apply_intro(char: str, nodes: list[tuple], seen: set[str]) -> list[tuple]:
    if char in seen:
        return nodes
    seen.add(char)
    intro_ru = INTRO_RU[char]
    intro_en = INTRO_EN[char]
    first = nodes[0]
    prompt_ru = f"{intro_ru}\n\n{first[0]}"
    prompt_en = f"{intro_en}\n\n{first[1]}"
    nodes[0] = (prompt_ru, prompt_en, first[2])
    return nodes


def format_encounter(char: str, nodes: list[tuple], lang: str, indent: str = "    ") -> str:
    node_lines = [format_node(n, lang, indent + "    ") for n in nodes]
    node_lines = pad_nodes(node_lines, indent + "    ")
    nodes_block = ",\n".join(node_lines)
    return (
        f"{indent}Encounter(\n"
        f"{indent}    startNodeIdx = 0,\n"
        f"{indent}    nodeCount = {len(nodes)},\n"
        f"{indent}    nodes = fixed_array(\n"
        f"{nodes_block}\n"
        f"{indent}    ),\n"
        f"{indent}    characterIdx = {CHAR[char]}\n"
        f"{indent})"
    )


def format_encounter_blocks(encounters: list[tuple], lang: str) -> list[str]:
    blocks: list[str] = []
    for char, nodes in encounters:
        nodes_copy = [n for n in nodes]
        blocks.append(format_encounter(char, nodes_copy, lang))
    return blocks


def encounter_has_people_stat(encounter: tuple) -> bool:
    _char, nodes = encounter
    for node in nodes:
        for choice in node[2]:
            stats = choice[4] if len(choice) > 4 else None
            if stats and stats.get("p", 0) != 0:
                return True
    return False


def split_encounters() -> tuple[list, list, list, list, list]:
    """Split source encounters into day pools.

    Early (days 1-10) and mid (days 11-29) must not modify People stat.
    Encounters with People deltas move to the day-90+ people pool and are
    replaced in early/mid with late-pool content (church-era, no People stat).
    """
    early_src = ENCOUNTERS[0:30]
    mid_src = ENCOUNTERS[30:80]
    late_a = ENCOUNTERS[80:160]
    late_b = ENCOUNTERS[160:180]
    late_fillers = late_a + late_b

    people: list = []
    early: list = []
    mid: list = []
    filler_idx = 0

    for enc in early_src:
        if encounter_has_people_stat(enc):
            people.append(copy.deepcopy(enc))
            early.append(copy.deepcopy(late_fillers[filler_idx % len(late_fillers)]))
            filler_idx += 1
        else:
            early.append(copy.deepcopy(enc))

    for enc in mid_src:
        if encounter_has_people_stat(enc):
            people.append(copy.deepcopy(enc))
            mid.append(copy.deepcopy(late_fillers[filler_idx % len(late_fillers)]))
            filler_idx += 1
        else:
            mid.append(copy.deepcopy(enc))

    if len(early) != 30 or len(mid) != 50 or len(late_a) != 80 or len(late_b) != 20:
        raise SystemExit(
            f"Bad pool split: early={len(early)} mid={len(mid)} "
            f"late_a={len(late_a)} late_b={len(late_b)}"
        )
    if len(people) == 0:
        raise SystemExit("People pool is empty — expected moved encounters from early/mid")
    return early, mid, late_a, late_b, people


def generate_file(lang: str) -> str:
    module = "encounters_en" if lang == "en" else "encounters_ru"
    prefix = "En" if lang == "en" else "Ru"
    early, mid, late_a, late_b, people = split_encounters()

    sections = [
        (f"allEncounters{prefix}Early", "POOL_EARLY_COUNT", format_encounter_blocks(early, lang)),
        (f"allEncounters{prefix}Mid", "POOL_MID_COUNT", format_encounter_blocks(mid, lang)),
        (f"allEncounters{prefix}LateA", "POOL_LATE_A_COUNT", format_encounter_blocks(late_a, lang)),
        (f"allEncounters{prefix}LateB", "POOL_LATE_B_COUNT", format_encounter_blocks(late_b, lang)),
        (f"allEncounters{prefix}People", "POOL_PEOPLE_COUNT", format_encounter_blocks(people, lang)),
    ]

    array_blocks: list[str] = []
    for array_name, count_const, blocks in sections:
        body = ",\n".join(blocks)
        array_blocks.append(
            f"let public {array_name} : Encounter[{count_const}] <- fixed_array(\n{body}\n)"
        )

    return (
        "require engine.core\n"
        "require constants\n"
        "require dialogue_types\n"
        "\n"
        f"module {module} public\n"
        "\n"
        "\n"
        + "\n\n\n".join(array_blocks)
        + "\n"
    )


def main() -> None:
    if len(ENCOUNTERS) != 180:
        raise SystemExit(f"Expected 180 source encounters, got {len(ENCOUNTERS)}")

    _, _, _, _, people = split_encounters()
    print(f"People pool: {len(people)} encounters (days {90}+)")

    en_path = PROJECT_ROOT / "encounters_en.das"
    ru_path = PROJECT_ROOT / "encounters_ru.das"

    en_content = generate_file("en")
    ru_content = generate_file("ru")

    en_path.write_text(en_content, encoding="utf-8", newline="\n")
    ru_path.write_text(ru_content, encoding="utf-8", newline="\n")

    en_lines = len(en_content.splitlines())
    ru_lines = len(ru_content.splitlines())
    print(f"Wrote {en_path} ({en_lines} lines)")
    print(f"Wrote {ru_path} ({ru_lines} lines)")
    print(f"Total encounter slots: {180 + len(people)}")


if __name__ == "__main__":
    main()

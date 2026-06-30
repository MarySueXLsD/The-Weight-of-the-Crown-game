#!/usr/bin/env python3
"""Fix characterIdx mismatches, shorten arc finale recaps, loyalty prompt fixes, audit."""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# (regex on prompt, character constant) — first match wins
PROMPT_CHAR_RULES = [
    (r"телохранительниц|bodyguard requests leave", "CHAR_RAENA"),
    (r"монах кормит|monk feeds", "CHAR_ARVEL"),
    (r"повар поймал|cook caught", "CHAR_GROMM"),
    (r"купец предлагает|merchant offers", "CHAR_SELENA"),
    (r"лекарь лечит|healer tends", "CHAR_MIRA"),
    (r"генерал докладывает|general reports that officers", "CHAR_RUDOLF"),
    (r"горничная отказывается|maid refuses", "CHAR_LISSA"),
    (r"безземельные лорды|landless lords", "CHAR_RAYMOND"),
    (r"хроник.*восстановлен|chronicler asks.*restoration|chronicler asks whether", "CHAR_ILANA"),
    (r"банкир.*заём|eastern bankers.*loan|bankers.*loan", "CHAR_DOMINIC"),
    (r"незаконный сын|bastard cousin", "CHAR_MARIANNA"),
    (r"монетный мастер|counterfeit noble seals|Master of Mint", "CHAR_NERIUS"),
    (r"охоту.*Эшфорд|Ashford.*hunt|eastern hunt", "CHAR_ASHFORD"),
    (r"церковь требует обряда|church demands.*succession|church demands a succession", "CHAR_MALRIK"),
    (r"северные принц|northern princes ask who inherits", "CHAR_INGVAR"),
    (r"Эдрик говорит.*законник|Edric says.*law books|Edric says that the law", "CHAR_EDRIC"),
    (r"пророк говорит|prophet speaks without invitation|prophet says uninvited", "CHAR_PROPHET"),
    (r"молчаливый рыцарь|silent knight", "CHAR_OTTO"),
]

POOL_FILES = [
    "encounters_loyalty_ru.das",
    "encounters_loyalty_en.das",
    "encounters_nobility_ru.das",
    "encounters_nobility_en.das",
    "encounters_succession_ru.das",
    "encounters_succession_en.das",
]

ARC_FILES = ["arc_encounters_ru.das", "arc_encounters_en.das"]

OTTO_PROMPT_RU_OLD = (
    'prompt = "Ваше Величество, молчаливый рыцарь не говорил годами — '
    "сегодня он написал, что ваш камергер плетёт заговор с писарями Ингвара.\","
)
OTTO_PROMPT_RU_NEW = (
    'prompt = "Ваше Величество, я не говорил годами — сегодня написал, '
    "что ваш камергер плетёт заговор с писарями Ингвара.\","
)
OTTO_PROMPT_EN_OLD = (
    'prompt = "Your Majesty, the silent knight had not spoken in years — '
    "today he wrote that your chamberlain plots with Ingvar's clerks.\","
)
OTTO_PROMPT_EN_NEW = (
    'prompt = "Your Majesty, I had not spoken in years — today I wrote that '
    "your chamberlain plots with Ingvar's clerks.\","
)

HOUSEHOLD_RU_OLD = re.compile(
    r'prompt = "Во дворце ещё служат люди прежнего короля\.[^"]*"',
    re.DOTALL,
)
HOUSEHOLD_RU_NEW = (
    'prompt = "Ваше Величество, после вашего решения о свите Эдвина двор просит конкретики. '
    'Шестеро слуг до сих пор ходят по залам — кого поставить под надзор в первую неделю?",'
)

HOUSEHOLD_EN_OLD = re.compile(
    r'prompt = "The people of the former king still serve in the palace\.[^"]*"',
    re.DOTALL,
)
HOUSEHOLD_EN_NEW = (
    'prompt = "Your Majesty, after your decision on Edwin\'s household, the court wants specifics. '
    'Six servants still walk these halls — whom do you watch first this week?",'
)

HOUSEHOLD_CHOICES_RU = """            choices = fixed_array(
            DialogueChoice(
                choiceText = "Повар Громм и кухни.",
                response = "Разумно. Голод — оружие, если повар недоволен.",
                statDeltas = fixed_array(0, 0, 0, 0, 0, 3, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Писец Осрик и архив.",
                response = "Чернила опаснее ножей. Хороший выбор для параноика.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Привратница и слуги у лестницы.",
                response = "Дверь — первая линия. Кто проходит — тот правит шёпотом.",
                statDeltas = fixed_array(0, 0, 3, 0, 0, 2, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Никого — доверять делу.",
                response = "Смело. Или лениво. Двор решит сам.",
                statDeltas = fixed_array(0, 0, -3, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )"""

HOUSEHOLD_CHOICES_EN = """            choices = fixed_array(
            DialogueChoice(
                choiceText = "Cook Gromm and the kitchens.",
                response = "Sensible. Hunger is a weapon if the cook turns.",
                statDeltas = fixed_array(0, 0, 0, 0, 0, 3, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "Scribe Osric and the archive.",
                response = "Ink is deadlier than knives. A good choice for the paranoid.",
                statDeltas = fixed_array(0, 0, 5, -3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "The door warden and stair servants.",
                response = "The door is the first line. Who passes controls the whispers.",
                statDeltas = fixed_array(0, 0, 3, 0, 0, 2, 0, 0, 0)
            ),
            DialogueChoice(
                choiceText = "No one — trust the work.",
                response = "Bold. Or lazy. The court will decide which.",
                statDeltas = fixed_array(0, 0, -3, 3, 0, 0, 0, 0, 0)
            ),
            DialogueChoice()
            )"""


def pick_char(prompt: str, current: str) -> str | None:
    for pattern, char in PROMPT_CHAR_RULES:
        if re.search(pattern, prompt, re.IGNORECASE):
            return char
    return None


def fix_pool_file(path: Path) -> tuple[int, int]:
    text = path.read_text(encoding="utf-8")
    char_fixes = 0

    def repl_encounter(m: re.Match) -> str:
        nonlocal char_fixes
        block = m.group(0)
        prompt_m = re.search(r'prompt = "([^"]*)"', block)
        char_m = re.search(r"characterIdx = (CHAR_\w+)", block)
        if not prompt_m or not char_m:
            return block
        prompt = prompt_m.group(1)
        current = char_m.group(1)
        new_char = pick_char(prompt, current)
        if new_char and new_char != current:
            char_fixes += 1
            block = block.replace(f"characterIdx = {current}", f"characterIdx = {new_char}", 1)
        return block

    text = re.sub(
        r"Encounter\(\s*startNodeIdx[\s\S]*?\),\s*\n\s*Encounter\(",
        repl_encounter,
        text,
    )
    # last encounter
    def repl_last(m: re.Match) -> str:
        nonlocal char_fixes
        block = m.group(0)
        prompt_m = re.search(r'prompt = "([^"]*)"', block)
        char_m = re.search(r"characterIdx = (CHAR_\w+)", block)
        if prompt_m and char_m:
            new_char = pick_char(prompt_m.group(1), char_m.group(1))
            if new_char and new_char != char_m.group(1):
                char_fixes += 1
                block = block.replace(f"characterIdx = {char_m.group(1)}", f"characterIdx = {new_char}", 1)
        return block

    text = re.sub(
        r"Encounter\(\s*startNodeIdx[\s\S]*?\)\s*\)\s*$",
        repl_last,
        text,
    )

    otto = 0
    if "loyalty" in path.name:
        if OTTO_PROMPT_RU_OLD in text:
            text = text.replace(OTTO_PROMPT_RU_OLD, OTTO_PROMPT_RU_NEW)
            otto += text.count(OTTO_PROMPT_RU_NEW) - text.count(OTTO_PROMPT_RU_OLD)
        if OTTO_PROMPT_EN_OLD in text:
            text = text.replace(OTTO_PROMPT_EN_OLD, OTTO_PROMPT_EN_NEW)
            otto += 1
        text = text.replace(OTTO_PROMPT_RU_OLD, OTTO_PROMPT_RU_NEW)
        text = text.replace(OTTO_PROMPT_EN_OLD, OTTO_PROMPT_EN_NEW)

    path.write_text(text, encoding="utf-8", newline="\n")
    return char_fixes, otto


def shorten_arc_recaps(path: Path) -> int:
    text = path.read_text(encoding="utf-8")
    count = 0
    lang = "ru" if "_ru" in path.name else "en"
    marker = "Ваше Величество" if lang == "ru" else "Your Majesty"

    def shorten_prompt(prompt: str) -> str:
        parts = re.split(rf"\s{{2}}(?={re.escape(marker)})", prompt)
        if len(parts) > 1:
            return parts[0].strip()
        # also split on repeated marker without double space (some finales)
        if prompt.count(marker) >= 3:
            idx = prompt.find(marker, len(marker) + 1)
            if idx > 0:
                # find next paragraph start
                nxt = prompt.find(f"  {marker}", idx)
                if nxt > 0:
                    return prompt[:nxt].strip()
        return prompt

    def repl_node(m: re.Match) -> str:
        nonlocal count
        block = m.group(0)
        if not re.search(
            r'choiceText = "(Хватит|Я услышал|I have heard enough)',
            block,
        ):
            return block
        pm = re.search(r'prompt = "((?:[^"\\]|\\.)*)"', block)
        if not pm:
            return block
        old = pm.group(1)
        new = shorten_prompt(old)
        if new != old:
            count += 1
            block = block.replace(f'prompt = "{old}"', f'prompt = "{new}"', 1)
        return block

    text = re.sub(
        r"DialogueNode\(\s*prompt = \"[\s\S]*?choices = fixed_array\([\s\S]*?\)\s*\)",
        repl_node,
        text,
    )
    path.write_text(text, encoding="utf-8", newline="\n")
    return count


def fix_household_pool_encounter(path: Path) -> bool:
    text = path.read_text(encoding="utf-8")
    if "encounters_ru" in path.name:
        if not HOUSEHOLD_RU_OLD.search(text):
            return False
        text = HOUSEHOLD_RU_OLD.sub(HOUSEHOLD_RU_NEW, text, count=1)
        # replace choices block for this 2-node encounter - match first node choices only
        old_choices = re.search(
            r'(nodeCount = 2,\s*nodes = fixed_array\(\s*DialogueNode\(\s*prompt = "[^"]*",\s*choiceCount = 4,\s*)choices = fixed_array\([\s\S]*?\)\s*\)\s*,\s*DialogueNode\(\s*prompt = "Опаснее всех)',
            text,
        )
        if old_choices:
            text = text[: old_choices.start(2)] + HOUSEHOLD_CHOICES_RU + text[old_choices.end(2) :]
        # simplify to 1 node
        text = text.replace("nodeCount = 2,", "nodeCount = 1,", 1)
        # remove second dialogue node in this encounter
        text = re.sub(
            r',\s*DialogueNode\(\s*prompt = "Опаснее всех[\s\S]*?DialogueNode\(\),\s*DialogueNode\(\)\s*\),\s*characterIdx = CHAR_EDRIC',
            ",\n        DialogueNode(),\n        DialogueNode()\n        ),\n        characterIdx = CHAR_EDRIC",
            text,
            count=1,
        )
    else:
        if not HOUSEHOLD_EN_OLD.search(text):
            return False
        text = HOUSEHOLD_EN_OLD.sub(HOUSEHOLD_EN_NEW, text, count=1)
        old_choices = re.search(
            r'(nodeCount = 2,\s*nodes = fixed_array\(\s*DialogueNode\(\s*prompt = "[^"]*",\s*choiceCount = 4,\s*)choices = fixed_array\([\s\S]*?\)\s*\)\s*,\s*DialogueNode\(\s*prompt = "The most dangerous)',
            text,
        )
        if old_choices:
            text = text[: old_choices.start(2)] + HOUSEHOLD_CHOICES_EN + text[old_choices.end(2) :]
        text = text.replace("nodeCount = 2,", "nodeCount = 1,", 1)
        text = re.sub(
            r',\s*DialogueNode\(\s*prompt = "The most dangerous[\s\S]*?DialogueNode\(\),\s*DialogueNode\(\)\s*\),\s*characterIdx = CHAR_EDRIC',
            ",\n        DialogueNode(),\n        DialogueNode()\n        ),\n        characterIdx = CHAR_EDRIC",
            text,
            count=1,
        )
    path.write_text(text, encoding="utf-8", newline="\n")
    return True


def main() -> None:
    for name in POOL_FILES:
        p = ROOT / name
        c, o = fix_pool_file(p)
        print(f"{name}: characterIdx={c}")

    for name in ARC_FILES:
        p = ROOT / name
        n = shorten_arc_recaps(p)
        print(f"{name}: shortened recaps={n}")

    for name in ("encounters_ru.das", "encounters_en.das"):
        p = ROOT / name
        if fix_household_pool_encounter(p):
            print(f"{name}: household pool deduped")

    audit_script = ROOT / "tools" / "audit_dialogue.py"
    if audit_script.exists():
        print("\n--- dialogue audit ---")
        subprocess.run([sys.executable, str(audit_script)], check=False)


if __name__ == "__main__":
    main()

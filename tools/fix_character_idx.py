#!/usr/bin/env python3
"""Second pass: fix characterIdx by pairing each Encounter block's prompt with rules."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

RULES = [
    (r"телохранительниц|bodyguard requests leave", "CHAR_RAENA"),
    (r"монах кормит|monk feeds", "CHAR_ARVEL"),
    (r"повар поймал|cook caught", "CHAR_GROMM"),
    (r"купец предлагает|merchant offers", "CHAR_SELENA"),
    (r"лекарь лечит|healer tends", "CHAR_MIRA"),
    (r"генерал докладывает|general reports that officers", "CHAR_RUDOLF"),
    (r"горничная отказывается|maid refuses", "CHAR_LISSA"),
    (r"безземельные лорды|landless lords", "CHAR_RAYMOND"),
    (r"хроник|chronicler asks", "CHAR_ILANA"),
    (r"восточн.*банкир|eastern bankers", "CHAR_DOMINIC"),
    (r"незаконный сын|bastard cousin", "CHAR_MARIANNA"),
    (r"монетный мастер|counterfeit noble seals", "CHAR_NERIUS"),
    (r"охоту.*Эшфорд|Ashford.*hunt|eastern hunt", "CHAR_ASHFORD"),
    (r"церковь требует обряда|church demands.*succession", "CHAR_MALRIK"),
    (r"северные принц|northern princes ask who inherits", "CHAR_INGVAR"),
    (r"Эдрик говорит.*законник|Edric says.*law books", "CHAR_EDRIC"),
    (r"пророк говорит|prophet speaks without|prophet says uninvited", "CHAR_PROPHET"),
]

FILES = [
    "encounters_loyalty_ru.das",
    "encounters_loyalty_en.das",
    "encounters_nobility_ru.das",
    "encounters_nobility_en.das",
    "encounters_succession_ru.das",
    "encounters_succession_en.das",
]


def pick_char(prompt: str) -> str | None:
    for pat, char in RULES:
        if re.search(pat, prompt, re.I):
            return char
    return None


def fix_file(path: Path) -> int:
    text = path.read_text(encoding="utf-8")
    fixes = 0

    def repl(m: re.Match) -> str:
        nonlocal fixes
        block = m.group(0)
        pm = re.search(r'prompt = "([^"]*)"', block)
        cm = re.search(r"characterIdx = (CHAR_\w+)", block)
        if not pm or not cm:
            return block
        new = pick_char(pm.group(1))
        if new and new != cm.group(1):
            fixes += 1
            return block.replace(f"characterIdx = {cm.group(1)}", f"characterIdx = {new}", 1)
        return block

    text = re.sub(
        r"Encounter\(\s*startNodeIdx[\s\S]*?characterIdx = CHAR_\w+,\s*\n\s*nodes",
        repl,
        text,
    )
    path.write_text(text, encoding="utf-8", newline="\n")
    return fixes


def main() -> None:
    for name in FILES:
        n = fix_file(ROOT / name)
        print(f"{name}: {n}")


if __name__ == "__main__":
    main()

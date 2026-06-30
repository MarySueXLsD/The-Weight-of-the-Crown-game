#!/usr/bin/env python3
"""Apply A2-B1 vocabulary glossary to dialogue source files."""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GLOSSARY = Path(__file__).resolve().parent / "vocabulary_glossary.yaml"

DIALOGUE_DAS = [
    "encounters_en.das",
    "encounters_ru.das",
    "encounters_loyalty_en.das",
    "encounters_loyalty_ru.das",
    "encounters_nobility_en.das",
    "encounters_nobility_ru.das",
    "encounters_succession_en.das",
    "encounters_succession_ru.das",
    "arc_encounters_en.das",
    "arc_encounters_ru.das",
    "arc_prompts.das",
    "edric_opener.das",
    "ashford.das",
    "defeat.das",
    "stat_unlock_intro.das",
    "pool_prompts.das",
    "arc_effects.das",
]

PYTHON_SOURCES = [
    "tools/encounter_data.py",
    "tools/encounter_data_pool3.py",
    "tools/generate_arc_prompts.py",
]

REFERENCE_DOCS = [
    "QUESTIONS_REFERENCE.md",
    "QUESTIONS_REFERENCE_RU.md",
]

FIELD_RE = re.compile(r'(prompt|choiceText|response)\s*=\s*"((?:[^"\\]|\\.)*)"')


def load_glossary() -> tuple[list[tuple[str, str]], list[tuple[str, str]]]:
    text = GLOSSARY.read_text(encoding="utf-8")
    all_rules: list[tuple[str, str]] = []
    prompt_rules: list[tuple[str, str]] = []
    current_find = ""
    current_replace = ""
    current_fields = "all"
    for line in text.splitlines():
        line = line.strip()
        if line.startswith("- find:"):
            if current_find:
                bucket = all_rules if current_fields == "all" else prompt_rules
                bucket.append((current_find, current_replace))
            current_find = line.split(":", 1)[1].strip()
            current_replace = ""
            current_fields = "all"
        elif line.startswith("replace:"):
            current_replace = line.split(":", 1)[1].strip()
        elif line.startswith("fields:"):
            current_fields = line.split(":", 1)[1].strip()
    if current_find:
        bucket = all_rules if current_fields == "all" else prompt_rules
        bucket.append((current_find, current_replace))
    all_rules.sort(key=lambda x: len(x[0]), reverse=True)
    prompt_rules.sort(key=lambda x: len(x[0]), reverse=True)
    return all_rules, prompt_rules


def apply_rules(text: str, rules: list[tuple[str, str]]) -> str:
    for find, replace in rules:
        if find.isascii():
            pattern = re.compile(re.escape(find), re.IGNORECASE)
            text = pattern.sub(replace, text)
        else:
            text = text.replace(find, replace)
    return text


# Grammar fixes after glossary substitution (longest matches first).
PROOFREAD_FIXES: list[tuple[str, str]] = [
    ("The conclave will call you the blessed by the church king who took the throne",
     "The conclave will call you the king blessed by the church"),
    ("the conclave will call you the blessed by the church king who took the throne",
     "the conclave will call you the king blessed by the church"),
    ("blessed by the church king who took the throne",
     "king blessed by the church"),
    ("king who took the throne make lawfuld", "The king who took the throne, made lawful"),
    ("make lawfuld", "made lawful"),
    ("*lawful right to rule bought*", "*Lawful rule bought with votes*"),
    ("lawful right to rule bought", "Lawful rule bought with votes"),
    (". lawful right to rule is", ". Your right to rule is"),
    ("Land for lawful right to rule abroad", "Land for a legal claim abroad"),
    ("Ashford offers lawful right to rule at a price", "Ashford offers your lawful rule at a price"),
    ("Accept Church custody of lawful right to rule",
     "Accept Church custody of your rule"),
    ("no lawful right to rule, no guards", "no lawful rule, no guards"),
    ("debate lawful right to rule — they tear", "debate who may rule — they tear"),
    ("With no heir and no lawful right to rule, your reign",
     "With no heir and no lawful rule, your reign"),
    ("land for lawful right to rule, and lawful right to rule for your throne-stealer's name",
     "land for your lawful rule, and your lawful name for the king who took the throne"),
    ("the princes trade ban grain on the northern road", "the princes ban grain trade on the northern road"),
    ("церковную церковный налог", "церковный налог"),
    ("церковная церковный налог", "церковный налог"),
    ("Limit the church church tax", "Limit the church tax"),
    ("temple church tax", "church tax"),
    ("нашу церковный налог", "наш церковный налог"),
    ("мою церковный налог", "мой церковный налог"),
    ("церковный налог съела", "церковный налог съел"),
    ("называет церковный налог святым. Я называю её", "называет церковный налог святым. Я называю его"),
    ("называет церковный налог святой", "называет церковный налог святым"),
    ("истинного книги счёта Борвина", "истинного счёта Борвина"),
    ("Выкупить книга счёта", "Выкупить счёт"),
    ("завтрашним книги счётам", "завтрашним счетам"),
    ("Господнем книге счёта", "Господней книге счёта"),
    ("Божьему книга счётау", "Божьей книге счёта"),
    ("и книга счёта дома", "и счёт дома"),
    ("Дипломатия книги счёта", "Дипломатия счёта"),
    ("поставили на первое место книга счёта", "поставили счёт на первое место"),
    ("имена в книги счётах", "имена в книгах счёта"),
    ("Общий книга счёта", "Общий счёт"),
    ("общий книга счёта", "общий счёт"),
    ("делите книга счёта", "делите счёт"),
    ("с книги счётами", "со счетами"),
    ("Годовой книга счёта", "Годовой счёт"),
    ("Бескровный книга счёта", "Бескровный счёт"),
    ("Интердикт и книга счёта", "Интердикт и счёт"),
    ("торговались с книгой счёта", "торговались со счётом"),
    ("Законное право править куплена голосами", "Право править куплено голосами"),
    ("*законное право править куплена*", "*право править куплено*"),
    ("king's close advisors seat", "seat on the king's council"),
    ("an trade ban", "a trade ban"),
    ("fake coin noble seals", "fake noble seals"),
    ("lawful right to rule bought in votes", "Lawful rule bought with votes"),
    (". trade ban hardens", ". The trade ban hardens"),
    (". fake coin is a tax", ". Fake coins are a tax"),
    ("Pay one final one combined sum", "Pay one final big sum"),
    ("declare open no money left", "say you have no money left"),
    ("Open no money left", "Admit we have no money"),
    ("one combined payment", "Pay one big sum"),
    ("*able to pay King*", "*King Who Can Pay*"),
    ("open no money left,", "you have no money left,"),
    ("Какая фальшивая монета ваша", "Чья подделка"),
    ("кормит ли тот, кто взял трон мой народ", "кормит ли тот, кто взял трон, мой народ"),
    ("кормит ли тот, кто взял трон чужаков", "кормит ли тот, кто взял трон, чужаков"),
    ("Когда тот, кто взял трон не называет", "Когда тот, кто взял трон, не называет"),
    ("blessed by church", "blessed by the church"),
    ("still call you king who took the throne", "still call you the king who took the throne"),
    ("names the king who took the throne —", "names you — the king who took the throne —"),
]


def proofread(text: str) -> str:
    for find, replace in PROOFREAD_FIXES:
        text = text.replace(find, replace)
    return text


def unescape_das(s: str) -> str:
    return s.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\")


def escape_das(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")


def process_das(content: str, all_rules: list[tuple[str, str]], prompt_rules: list[tuple[str, str]]) -> str:
    def replacer(match: re.Match[str]) -> str:
        field = match.group(1)
        raw = match.group(2)
        text = unescape_das(raw)
        text = apply_rules(text, all_rules)
        if field in ("prompt", "choiceText"):
            text = apply_rules(text, prompt_rules)
        text = proofread(text)
        return f'{field} = "{escape_das(text)}"'

    return FIELD_RE.sub(replacer, content)


def process_return_strings(content: str, all_rules: list[tuple[str, str]], prompt_rules: list[tuple[str, str]]) -> str:
    """arc_prompts.das uses return \"...\" for dynamic prompts (prompt-only)."""
    ret_re = re.compile(r'return "((?:[^"\\]|\\.)*)"')

    def replacer(match: re.Match[str]) -> str:
        raw = match.group(1)
        text = unescape_das(raw)
        text = apply_rules(text, all_rules)
        text = apply_rules(text, prompt_rules)
        text = proofread(text)
        return f'return "{escape_das(text)}"'

    return ret_re.sub(replacer, content)


def process_encounter_data_line(line: str, all_rules: list[tuple[str, str]], prompt_rules: list[tuple[str, str]]) -> str:
    """Apply rules to encounter_data tuple strings on a single line."""
    if "('" not in line and "('" not in line and "('" not in line:
        if "'" not in line and '"' not in line:
            return line
    quote = r"(?:'|'|\"|')"
    choice_re = re.compile(
        rf"\(\s*{quote}((?:\\'|[^'])*?)'{quote}\s*,\s*{quote}((?:\\'|[^'])*?)'{quote}\s*,\s*{quote}((?:\\'|[^'])*?)'{quote}\s*,\s*{quote}((?:\\'|[^'])*?)'{quote}"
    )

    def repl_choice(m: re.Match[str]) -> str:
        parts = [m.group(i) for i in range(1, 5)]
        for i in range(4):
            parts[i] = apply_rules(parts[i], all_rules)
            if i < 2:
                parts[i] = apply_rules(parts[i], prompt_rules)
        return f"('{parts[0]}', '{parts[1]}', '{parts[2]}', '{parts[3]}'"

    line = choice_re.sub(repl_choice, line)
    node_re = re.compile(rf"\(\s*{quote}((?:\\'|[^'])*?)'{quote}\s*,\s*{quote}((?:\\'|[^'])*?)'{quote}\s*,\s*\[")

    def repl_node(m: re.Match[str]) -> str:
        ru = apply_rules(m.group(1), all_rules)
        ru = apply_rules(ru, prompt_rules)
        en = apply_rules(m.group(2), all_rules)
        en = apply_rules(en, prompt_rules)
        return f"('{ru}', '{en}', ["

    return node_re.sub(repl_node, line)


def process_python_source(path: Path, all_rules: list[tuple[str, str]], prompt_rules: list[tuple[str, str]]) -> str:
    content = path.read_text(encoding="utf-8")
    if path.name.startswith("encounter_data") or path.name == "generate_arc_prompts.py":
        content = apply_rules(content, all_rules)
        content = apply_rules(content, prompt_rules)
        content = proofread(content)
        return content
    lines = content.splitlines()
    out: list[str] = []
    for line in lines:
        if 'return "' in line or '= "' in line:
            def repl(m: re.Match[str]) -> str:
                q = m.group(1)
                text = apply_rules(q, all_rules)
                text = apply_rules(text, prompt_rules)
                return f'"{text}"'

            line = re.sub(r'"((?:[^"\\]|\\.)*)"', repl, line)
        out.append(line)
    return "\n".join(out) + ("\n" if lines else "")


def process_plain_text(content: str, all_rules: list[tuple[str, str]], prompt_rules: list[tuple[str, str]]) -> str:
    text = apply_rules(content, all_rules)
    text = apply_rules(text, prompt_rules)
    return proofread(text)


def main() -> None:
    all_rules, prompt_rules = load_glossary()
    changed = 0

    for name in DIALOGUE_DAS:
        path = ROOT / name
        if not path.exists():
            continue
        original = path.read_text(encoding="utf-8")
        updated = process_das(original, all_rules, prompt_rules)
        updated = process_return_strings(updated, all_rules, prompt_rules)
        if updated != original:
            path.write_text(updated, encoding="utf-8")
            changed += 1
            print(f"updated {name}")

    for rel in PYTHON_SOURCES:
        path = ROOT / rel
        if not path.exists():
            continue
        original = path.read_text(encoding="utf-8")
        updated = process_python_source(path, all_rules, prompt_rules)
        if updated != original:
            path.write_text(updated, encoding="utf-8")
            changed += 1
            print(f"updated {rel}")

    for name in REFERENCE_DOCS:
        path = ROOT / name
        if not path.exists():
            continue
        original = path.read_text(encoding="utf-8")
        updated = process_plain_text(original, all_rules, prompt_rules)
        if updated != original:
            path.write_text(updated, encoding="utf-8")
            changed += 1
            print(f"updated {name}")

    print(f"Done. {changed} file(s) changed.")


if __name__ == "__main__":
    main()

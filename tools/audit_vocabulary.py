#!/usr/bin/env python3
"""Audit dialogue strings for B2+ glossary terms."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GLOSSARY = Path(__file__).resolve().parent / "vocabulary_glossary.yaml"
REPORT = Path(__file__).resolve().parent / "vocabulary_audit_report.txt"

DIALOGUE_FILES = [
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

FIELD_RE = re.compile(r'(prompt|choiceText|response)\s*=\s*"((?:[^"\\]|\\.)*)"')
RETURN_RE = re.compile(r'return "((?:[^"\\]|\\.)*)"')

BLOCKLIST_EN = [
    "usurper", "legitimacy", "legitimise", "legitimize", "privy council", "regicide",
    "schism", "embargo", "excommunicate", "confiscate", "solvency", "solvent",
    "insolvency", "insolvent", "liquidity", "ultimatum", "forgery", "counterfeit",
    "root out", "anointed", "reconciled", "consolidated", "inquest", "blasphemy",
    "sacrilege", "promissory",
]

BLOCKLIST_RU = [
    "узурпатор", "выкорчев", "десятин", "гроссбух", "платёжеспособ", "конфискац",
    "эмбарго", "легитим", "отлуч", "святотат", "вексел", "ликвидност",
    "несостоятель", "дознан", "ультиматум", "дефолт", "монопол",
]

PROMPT_CHOICE_ONLY = {"usurper", "узурпатор"}


def load_glossary_terms() -> tuple[list[tuple[str, str, str]], list[str], list[str]]:
    text = GLOSSARY.read_text(encoding="utf-8")
    entries: list[tuple[str, str, str]] = []
    block_en = list(BLOCKLIST_EN)
    block_ru = list(BLOCKLIST_RU)
    current_find = ""
    current_replace = ""
    current_fields = "all"
    for line in text.splitlines():
        line = line.strip()
        if line.startswith("- find:"):
            if current_find:
                entries.append((current_find, current_replace, current_fields))
            current_find = line.split(":", 1)[1].strip()
            current_replace = ""
            current_fields = "all"
        elif line.startswith("replace:"):
            current_replace = line.split(":", 1)[1].strip()
        elif line.startswith("fields:"):
            current_fields = line.split(":", 1)[1].strip()
    if current_find:
        entries.append((current_find, current_replace, current_fields))
    return entries, block_en, block_ru


def unescape_das(s: str) -> str:
    return s.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\")


def audit_text(
    text: str,
    field: str,
    entries: list[tuple[str, str, str]],
    block_en: list[str],
    block_ru: list[str],
) -> list[tuple[str, str, str]]:
    hits: list[tuple[str, str, str]] = []
    lower = text.lower()
    for find, replace, fields in entries:
        if find.lower() not in lower:
            continue
        if fields == "prompt_choice" and field == "response":
            if find.lower() in PROMPT_CHOICE_ONLY or "узурп" in find.lower() or "usurp" in find.lower():
                continue
        hits.append((find, replace, "glossary"))
    for term in block_en:
        if term in lower and not any(h[0].lower() == term for h in hits):
            if term in PROMPT_CHOICE_ONLY and field == "response":
                continue
            hits.append((term, "?", "blocklist_en"))
    for term in block_ru:
        if term in lower and not any(h[0].lower() == term for h in hits):
            if "узурп" in term and field == "response":
                continue
            hits.append((term, "?", "blocklist_ru"))
    return hits


def extract_fields(content: str) -> list[tuple[int, str, str]]:
    results: list[tuple[int, str, str]] = []
    for m in FIELD_RE.finditer(content):
        line = content[: m.start()].count("\n") + 1
        field = m.group(1)
        text = unescape_das(m.group(2))
        results.append((line, field, text))
    for m in RETURN_RE.finditer(content):
        line = content[: m.start()].count("\n") + 1
        text = unescape_das(m.group(1))
        results.append((line, "prompt", text))
    return results


def main() -> None:
    entries, block_en, block_ru = load_glossary_terms()
    lines_out: list[str] = ["Vocabulary audit report", "=" * 40, ""]
    total = 0
    by_file: dict[str, int] = {}

    for name in DIALOGUE_FILES:
        path = ROOT / name
        if not path.exists():
            continue
        content = path.read_text(encoding="utf-8")
        file_hits = 0
        file_lines: list[str] = []
        for line_no, field, text in extract_fields(content):
            hits = audit_text(text, field, entries, block_en, block_ru)
            for term, suggestion, kind in hits:
                if kind == "glossary" and fields_allowed(term, field, entries):
                    continue
                snippet = text[:100] + ("..." if len(text) > 100 else "")
                file_lines.append(f"  L{line_no} [{field}] {kind}: '{term}' -> '{suggestion}'")
                file_lines.append(f"    {snippet}")
                file_hits += 1
                total += 1
        if file_hits:
            lines_out.append(f"## {name} ({file_hits} hit(s))")
            lines_out.extend(file_lines)
            lines_out.append("")
            by_file[name] = file_hits

    lines_out.append(f"Total hits: {total}")
    REPORT.write_text("\n".join(lines_out) + "\n", encoding="utf-8")
    print(f"Wrote {REPORT} ({total} hits)")


def fields_allowed(term: str, field: str, entries: list[tuple[str, str, str]]) -> bool:
    for find, _replace, fields in entries:
        if find.lower() == term.lower():
            if fields == "prompt_choice" and field == "response":
                if "узурп" in find.lower() or "usurp" in find.lower():
                    return True
            return False
    return False


if __name__ == "__main__":
    main()

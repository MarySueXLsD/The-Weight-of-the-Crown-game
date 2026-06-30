#!/usr/bin/env python3
"""Audit dialogue for common quality issues; optionally report or fix."""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

ENCOUNTER_FILES = [
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
    "edric_opener.das",
]

ISSUE_PATTERNS = [
    ("i_heard", re.compile(r"I heard|Я слышал|слышал, что", re.I)),
    ("or_branch", re.compile(r" — or | — или | pleased or furious|courtesy — or|with courtesy — or", re.I)),
    ("early_gromm", re.compile(r"Cook Gromm|Повар Громм", re.I)),
    ("third_person_self", re.compile(r"the silent knight had not|молчаливый рыцарь не говорил", re.I)),
    ("stacked_finale", re.compile(r"Your Majesty.*  Your Majesty", re.I)),
]


def extract_prompts(text: str) -> list[tuple[int, str]]:
    results: list[tuple[int, str]] = []
    for m in re.finditer(r'prompt = "((?:[^"\\]|\\.)*)"', text):
        line = text[: m.start()].count("\n") + 1
        results.append((line, m.group(1)))
    return results


def audit_file(path: Path) -> dict[str, list[tuple[int, str]]]:
    text = path.read_text(encoding="utf-8")
    issues: dict[str, list[tuple[int, str]]] = {k: [] for k, _ in ISSUE_PATTERNS}
    for line, prompt in extract_prompts(text):
        for key, pat in ISSUE_PATTERNS:
            if pat.search(prompt):
                snippet = prompt[:120] + ("..." if len(prompt) > 120 else "")
                issues[key].append((line, snippet))
    return issues


def main() -> None:
    report_path = ROOT / "tools" / "dialogue_audit_report.txt"
    lines: list[str] = ["Dialogue audit report", "=" * 40, ""]
    totals: dict[str, int] = {}

    for name in ENCOUNTER_FILES:
        path = ROOT / name
        if not path.exists():
            continue
        issues = audit_file(path)
        file_has = False
        for key, items in issues.items():
            if not items:
                continue
            if not file_has:
                lines.append(f"## {name}")
                file_has = True
            lines.append(f"  [{key}] {len(items)} hit(s)")
            for line, snippet in items[:5]:
                lines.append(f"    L{line}: {snippet}")
            if len(items) > 5:
                lines.append(f"    ... +{len(items) - 5} more")
            totals[key] = totals.get(key, 0) + len(items)
        if file_has:
            lines.append("")

    lines.append("Totals:")
    for key, count in sorted(totals.items()):
        lines.append(f"  {key}: {count}")

    report_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    summary = f"Wrote {report_path} ({sum(totals.values())} issues across {len(totals)} categories)"
    try:
        print(summary)
    except UnicodeEncodeError:
        print(summary.encode("ascii", errors="replace").decode("ascii"))


if __name__ == "__main__":
    main()

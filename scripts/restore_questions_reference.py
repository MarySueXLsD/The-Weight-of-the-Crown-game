#!/usr/bin/env python3
"""Restore QUESTIONS_REFERENCE.md by replaying agent transcript StrReplace ops."""

import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ARC_TRANSCRIPT = Path(
    r"C:\Users\syanavi\.cursor\projects"
    r"\c-Users-syanavi-Documents-My-Games-eden-launcher-projects-019eab54-61cf-7c88-a293-0fa895edb23b"
    r"\agent-transcripts\16a8a806-1300-4f70-aaa4-68c2e7cbea5d"
    r"\16a8a806-1300-4f70-aaa4-68c2e7cbea5d.jsonl"
)
PROOF_TRANSCRIPT = Path(
    r"C:\Users\syanavi\.cursor\projects"
    r"\c-Users-syanavi-Documents-My-Games-eden-launcher-projects-019eab54-61cf-7c88-a293-0fa895edb23b"
    r"\agent-transcripts\33cd35b6-6c0c-4650-b708-fc3c38938486"
    r"\33cd35b6-6c0c-4650-b708-fc3c38938486.jsonl"
)
OUTPUT = ROOT / "QUESTIONS_REFERENCE.md"

MOJIBAKE = {
    "â€”": "—",
    "â€“": "–",
    "â€˜": "'",
    "â€™": "'",
    "â€œ": '"',
    "â€\x9d": '"',
    "Ã—": "×",
    "â€¦": "…",
}


def extract_ops(path: Path) -> list[dict]:
    ops: list[dict] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        try:
            obj = json.loads(line)
        except json.JSONDecodeError:
            continue
        if obj.get("role") != "assistant":
            continue
        for part in obj.get("message", {}).get("content", []):
            if part.get("type") == "tool_use" and part.get("name") == "StrReplace":
                inp = part.get("input", {})
                if "QUESTIONS_REFERENCE.md" in inp.get("path", ""):
                    ops.append(inp)
    return ops


def fix_mojibake(text: str) -> str:
    for bad, good in MOJIBAKE.items():
        text = text.replace(bad, good)
    return text


def section_replace(text: str, old: str, new: str) -> str | None:
    """Replace a section starting at ### anchor when exact old_string no longer matches."""
    m = re.match(r"(### [^\n]+)", old)
    if not m:
        return None
    anchor = m.group(1)
    idx = text.find(anchor)
    if idx < 0:
        return None
    end = len(text)
    for pat in ("\n### ", "\n## "):
        p = text.find(pat, idx + len(anchor))
        if p >= 0:
            end = min(end, p)
    return text[:idx] + new + text[end:]


def main() -> None:
    ops = extract_ops(ARC_TRANSCRIPT) + extract_ops(PROOF_TRANSCRIPT)
    text = subprocess.check_output(
        ["git", "show", "afdac5e:QUESTIONS_REFERENCE.md"],
        cwd=ROOT,
        text=True,
        encoding="utf-8",
    )
    text = fix_mojibake(text)

    failed: list[tuple[int, dict]] = []
    for i, op in enumerate(ops):
        old = fix_mojibake(op["old_string"])
        new = fix_mojibake(op["new_string"])
        if old in text:
            text = text.replace(old, new, 1)
            continue
        patched = section_replace(text, old, new)
        if patched is not None:
            text = patched
            continue
        failed.append((i, op))

    # Strip garbage before title if a partial replace left a prefix
    title = "# Questions & Choices Reference"
    tidx = text.find(title)
    if tidx > 0:
        text = text[tidx:]

    text = fix_mojibake(text)
    OUTPUT.write_text(text, encoding="utf-8")

    print(f"Wrote {OUTPUT}")
    print(f"Lines: {text.count(chr(10)) + 1}")
    print(f"Failed ops: {len(failed)}")
    if failed:
        for i, op in failed[:15]:
            preview = op["old_string"][:80].replace("\n", " ")
            print(f"  [{i}] {preview}...")
    checks = [
        "## Characters",
        "**Nodes:** 2 (start node: 0)",
        "turned household",
        "Trusted court",
        "northernRefugeesTurnedBack",
        "## The Old King's Household",
        "Ink will save what blind prayer cannot",
    ]
    for c in checks:
        print(f"  check {c!r}: {c in text}")


if __name__ == "__main__":
    main()

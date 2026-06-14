#!/usr/bin/env python3
"""Build pool3_exact_remainder.py from pipe-delimited spec lines."""

from __future__ import annotations

import re
from pathlib import Path

HERE = Path(__file__).resolve().parent


def esc(s: str) -> str:
    return s.replace("\\", "\\\\").replace("'", "\\'")


def parse_stats(s: str) -> dict[str, int]:
    out: dict[str, int] = {}
    for part in s.split(","):
        part = part.strip()
        if not part:
            continue
        m = re.fullmatch(r"([fcagh])([+-]\d+)", part)
        if not m:
            raise ValueError(f"Bad stat token: {part!r}")
        out[m.group(1)] = int(m.group(2))
    return out


def parse_line(line: str) -> tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]:
    parts = line.strip().split("|")
    if len(parts) != 19:
        raise ValueError(f"Expected 19 fields, got {len(parts)}: {line[:80]}...")
    char, pr, pe = parts[1], parts[2], parts[3]
    choices = []
    i = 4
    while i < len(parts):
        cr, ce, rr, re_ = parts[i], parts[i + 1], parts[i + 2], parts[i + 3]
        st = parse_stats(parts[i + 4])
        choices.append((cr, ce, rr, re_, st))
        i += 5
    return char, pr, pe, choices


def load_spec() -> list[tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]]]:
    files = [
        "pool3_spec_lines_16_20.txt",
        "pool3_spec_lines.txt",
        "pool3_spec_lines_31_50.txt",
        "pool3_spec_lines_51_99.txt",
    ]
    out = []
    for name in files:
        path = HERE / name
        for line in path.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            out.append(parse_line(line))
    if len(out) != 84:
        raise SystemExit(f"Expected 84 spec lines (16-99), got {len(out)}")
    return out


EXACT_100: tuple[str, str, str, list[tuple[str, str, str, str, dict[str, int]]]] = (
    "edric",
    "Церковь больше не просто молится. Она кормит, судит, лечит, собирает золото и говорит, кто достоин трона. До девяностого дня осталось немного. Нужно решить, кем она станет.",
    "The church no longer merely prays. It feeds, judges, heals, collects gold, and says who deserves the throne. Little remains before the ninetieth day. You must decide what it becomes.",
    [
        (
            "Церковь станет опорой трона.",
            "The church will be the throne's pillar.",
            "Трон обретёт святую опору. И святую зависимость.",
            "The throne gains a holy pillar. And holy dependence.",
            {"c": 25, "g": -10, "a": -10, "h": 5},
        ),
        (
            "Церковь будет подчинена короне.",
            "The church will be subject to the crown.",
            "Вы выбрали силу. Теперь храм может выбрать сопротивление.",
            "You chose force. Now the temple may choose resistance.",
            {"a": 15, "g": 10, "c": -25},
        ),
        (
            "Церковь и корона разделят власть.",
            "Church and crown will share power.",
            "Равновесие достигнуто. Осталось понять, кто первым его нарушит.",
            "Balance is reached. Who breaks it first remains to be seen.",
            {"c": 10, "a": 5, "g": -5, "h": 5},
        ),
        (
            "Ослабить церковь через народную помощь от короны.",
            "Weaken the church through royal aid to the people.",
            "Если народ ест из вашей руки, он реже целует чужую.",
            "If the people eat from your hand, they kiss another less often.",
            {"h": 20, "f": -15, "g": -10, "c": -10},
        ),
    ],
)


def render_exact_100() -> str:
    char, pr, pe, choices = EXACT_100
    lines = [
        "EXACT_100 = (",
        f"    '{esc(char)}',",
        f"    '{esc(pr)}',",
        f"    '{esc(pe)}',",
        "    [",
    ]
    for idx, (cr, ce, rr, re_, st) in enumerate(choices):
        items = ", ".join(f"'{k}': {v}" for k, v in sorted(st.items()))
        comma = "," if idx < len(choices) - 1 else ""
        lines.append(f"        ('{esc(cr)}', '{esc(ce)}', '{esc(rr)}', '{esc(re_)}', {{{items}}}){comma}")
    lines.extend(["    ],", ")"])
    return "\n".join(lines)


def render_tuple(char, pr, pe, choices) -> str:
    lines = [
        "    (",
        f"        '{esc(char)}',",
        f"        '{esc(pr)}',",
        f"        '{esc(pe)}',",
        "        [",
    ]
    for idx, (cr, ce, rr, re_, st) in enumerate(choices):
        items = ", ".join(f"'{k}': {v}" for k, v in sorted(st.items()))
        comma = "," if idx < len(choices) - 1 else ""
        lines.append(
            f"            ('{esc(cr)}', '{esc(ce)}', '{esc(rr)}', '{esc(re_)}', {{{items}}}){comma}"
        )
    lines.extend(["        ],", "    ),"])
    return "\n".join(lines)


def main() -> None:
    spec = load_spec()
    blocks = [render_tuple(*e) for e in spec]
    out = (
        "# Pool 3 encounters 16-99 — exact spec tuples for _gen_pool3.py\n"
        "# fmt: off\n"
        "EXACT_16_99 = [\n"
        + "\n".join(blocks)
        + "\n]\n\n"
        + render_exact_100()
        + "\n"
    )
    path = HERE / "pool3_exact_remainder.py"
    path.write_text(out, encoding="utf-8", newline="\n")
    print(f"Wrote {path} ({len(spec)} encounters + EXACT_100)")


if __name__ == "__main__":
    main()

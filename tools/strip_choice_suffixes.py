"""Strip explanatory text after em dash in DialogueChoice choiceText fields."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# Match choiceText = "..." and capture text before first " — "
PATTERN = re.compile(
    r'(choiceText\s*=\s*")([^"]*?)(\s+—\s+[^"]*)(")',
)

FILES = [
    "edric_opener.das",
    "arc_encounters_en.das",
    "arc_encounters_ru.das",
    "encounters_en.das",
    "encounters_ru.das",
    "encounters_loyalty_en.das",
    "encounters_loyalty_ru.das",
    "encounters_nobility_en.das",
    "encounters_nobility_ru.das",
    "encounters_succession_en.das",
    "encounters_succession_ru.das",
    "stat_unlock_intro.das",
    "defeat.das",
    "ashford.das",
]


def process_file(path: Path) -> int:
    text = path.read_text(encoding="utf-8")
    new_text, count = PATTERN.subn(r'\1\2\4', text)
    if count > 0:
        path.write_text(new_text, encoding="utf-8", newline="\n")
    return count


def main() -> None:
    total = 0
    for name in FILES:
        path = ROOT / name
        if not path.exists():
            print(f"skip (missing): {name}")
            continue
        n = process_file(path)
        if n:
            print(f"{name}: {n}")
        total += n
    print(f"total: {total}")


if __name__ == "__main__":
    main()

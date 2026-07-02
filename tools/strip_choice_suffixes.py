"""Strip explanatory text after em dash in DialogueChoice choiceText fields."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DAS_DATA = ROOT / "scripts" / "das" / "data"
DAS_ARCS = ROOT / "scripts" / "das" / "arcs"
DAS_GAMEPLAY = ROOT / "scripts" / "das" / "gameplay"

# Match choiceText = "..." and capture text before first " — "
PATTERN = re.compile(
    r'(choiceText\s*=\s*")([^"]*?)(\s+—\s+[^"]*)(")',
)

FILES = [
    resolve_das_path("edric_opener.das"),
    resolve_das_path("arc_encounters_en.das"),
    resolve_das_path("arc_encounters_ru.das"),
    resolve_das_path("encounters_en.das"),
    resolve_das_path("encounters_ru.das"),
    resolve_das_path("encounters_loyalty_en.das"),
    resolve_das_path("encounters_loyalty_ru.das"),
    resolve_das_path("encounters_nobility_en.das"),
    resolve_das_path("encounters_nobility_ru.das"),
    resolve_das_path("encounters_succession_en.das"),
    resolve_das_path("encounters_succession_ru.das"),
    resolve_das_path("stat_unlock_intro.das"),
    resolve_das_path("defeat.das"),
    resolve_das_path("ashford.das"),
]


def resolve_das_path(name: str) -> Path:
    if name.startswith("encounters_"):
        return DAS_DATA / name
    if name.startswith("arc_"):
        return DAS_ARCS / name
    return DAS_GAMEPLAY / name



def process_file(path: Path) -> int:
    text = path.read_text(encoding="utf-8")
    new_text, count = PATTERN.subn(r'\1\2\4', text)
    if count > 0:
        path.write_text(new_text, encoding="utf-8", newline="\n")
    return count


def main() -> None:
    total = 0
    for name in FILES:
        path = name
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

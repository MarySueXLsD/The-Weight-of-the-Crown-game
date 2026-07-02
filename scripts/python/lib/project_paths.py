"""Project root and Daslang module paths for scripts under scripts/python/."""
from __future__ import annotations

from pathlib import Path

_PYTHON_ROOT = Path(__file__).resolve().parent.parent
PROJECT_ROOT = _PYTHON_ROOT.parent.parent

DAS_CORE = PROJECT_ROOT / "scripts" / "das" / "core"
DAS_DATA = PROJECT_ROOT / "scripts" / "das" / "data"
DAS_ARCS = PROJECT_ROOT / "scripts" / "das" / "arcs"
DAS_GAMEPLAY = PROJECT_ROOT / "scripts" / "das" / "gameplay"
DAS_LOCALIZATION = PROJECT_ROOT / "scripts" / "das" / "localization"
DAS_UI = PROJECT_ROOT / "scripts" / "das" / "ui"

TOOLS_DIR = PROJECT_ROOT / "tools"

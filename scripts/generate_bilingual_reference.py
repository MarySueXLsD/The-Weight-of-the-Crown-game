#!/usr/bin/env python3
"""Generate QUESTIONS_REFERENCE_BILINGUAL.md from EN + RU reference files."""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REF_EN = ROOT / "QUESTIONS_REFERENCE.md"
REF_RU = ROOT / "QUESTIONS_REFERENCE_RU.md"
OUTPUT = ROOT / "QUESTIONS_REFERENCE_BILINGUAL.md"

STAT_ORDER = ["People", "Church", "Army", "Treasury", "Health", "Loyalty", "Nobility", "Food", "Succession"]

ARC_SECTIONS = [
    ("The Old King's Household (persistent story)", "Двор Старого Короля (длящаяся история)"),
    ("Below the Tapestry (persistent story)", "За Гобеленом (длящаяся история)"),
    ("The Empty Purse (persistent story)", "Пустая Казна (длящаяся история)"),
    ("The Hungry Season (persistent story)", "Голодный Сезон (длящаяся история)"),
    ("The Guild Compact (persistent story)", "Гильдейский компакт (длящаяся история)"),
    ("The Crown Forfeit & church tax War (persistent story)", "Отречение короны и война десятин (длящаяся история)"),
    ("The Northern Price (persistent story)", "Северная цена (длящаяся история)"),
    ("The Great Houses (persistent story)", "Великие дома (длящаяся история)"),
    ("The Scaffold's Ledger (persistent story)", "Книга плахи (длящаяся история)"),
    ("The Star Chamber (wildcard / cross-arc)", "Звёздная палата (wildcard / перекрёстная арка)"),
    ("The Court of Knives (persistent story)", "Двор ножей (длящаяся история)"),
    ("The Nephew in the Fog (persistent story)", "Племянник в тумане (длящаяся история)"),
    ("The Prophet's Winter (wildcard / cross-arc)", "Зимний пророк (wildcard / перекрёстная арка)"),
    ("Grey Lung Cure Arc (persistent story)", "Арка «Серый кашель» (длящаяся история)"),
]

POOL_SECTIONS = [
    ("Early Pool", "Early Pool"),
    ("Mid Pool", "Mid Pool"),
    ("Late Pool A", "Late Pool A"),
    ("Late Pool B", "Late Pool B"),
    ("People Pool", "People Pool"),
    ("Nobility Pool", "Пул Знати"),
    ("Loyalty Pool", "Пул Верности"),
    ("Succession Pool", "Пул Преемственности"),
]

SPECIAL_SECTIONS = [
    ("Special Encounters (outside random pools)", "Особые встречи (вне случайных пулов)"),
    ("Stat unlock conflict encounters", "Конфликтные встречи разблокировки характеристик"),
]


def extract_section(text: str, title: str, stop_titles: list[str]) -> str:
    pat = f"## {title}"
    start = text.find(pat)
    if start < 0:
        return ""
    end = len(text)
    for other in stop_titles:
        if other == title:
            continue
        p = text.find(f"## {other}", start + len(pat))
        if p >= 0:
            end = min(end, p)
    return text[start:end]


def all_section_titles() -> list[str]:
    titles = [s[0] for s in SPECIAL_SECTIONS + ARC_SECTIONS]
    titles += [s[0] for s in POOL_SECTIONS]
    titles += ["Pool Encounters", "Pool coverage audit"]
    return titles


def normalize_label(label: str) -> str:
    label = label.strip()
    if label.startswith("итог "):
        return "outcome " + label[5:]
    if label.startswith("variant "):
        return label
    return label


def parse_prompts(node_block: str, lang: str) -> list[tuple[str, str]]:
    """Return list of (label, text) for main prompt and variants."""
    choice_break = r"\n{1,2}\*\*(?:Choice|Вариант|Выбор) \d"
    if lang == "en":
        patterns = [
            (rf"\*\*Prompt(?: \(([^)]+)\))?:\*\* (.+?)(?=\n\n\*\*Prompt|\*\*Prompt variant|{choice_break}|\Z)", "Prompt"),
            (r"\*\*Prompt variant \(([^)]+)\):\*\* ([^\n]+)", "variant"),
        ]
    else:
        patterns = [
            (rf"\*\*Вопрос(?: \(([^)]+)\))?:\*\* (.+?)(?=\n\n\*\*Вопрос|\*\*Вариант|{choice_break}|\Z)", "Prompt"),
            (r"\*\*Вариант(?: \(([^)]+)\))?:\*\* ([^\n]+)", "variant"),
        ]
    results: list[tuple[str, str]] = []
    for pat, kind in patterns:
        for m in re.finditer(pat, node_block, re.S):
            label = m.group(1) or ""
            text_val = m.group(2).strip().replace("\n", " ")
            if kind == "variant" and label:
                results.append((f"variant ({label})", text_val))
            elif label:
                results.append((f"({label})", text_val))
            else:
                results.append(("main", text_val))
    if not results:
        # fallback single prompt line
        if lang == "en":
            m = re.search(r"\*\*Prompt:\*\* (.+?)(?=\n\n|\Z)", node_block, re.S)
        else:
            m = re.search(r"\*\*Вопрос:\*\* (.+?)(?=\n\n|\Z)", node_block, re.S)
        if m:
            results.append(("main", m.group(1).strip().replace("\n", " ")))
    return results


def parse_choices(block: str, lang: str) -> list[dict]:
    stop = (
        r"\n- \*\*Next|\n- \*\*Sets|\n- \*\*Clears|\n- \*\*Trust|\n- \*\*Progress|\n- \*\*Enables|\n- \*\*Response|"
        r"\n- \*\*Следующий|\n- \*\*Устанавливает|\n- \*\*Снимает|\n- \*\*Доверие|\n- \*\*Ответ|"
        r"\n{1,2}\*\*(?:Choice|Вариант|Выбор) \d|\n---|\Z"
    )
    if lang == "en":
        choice_re = (
            r"\*\*Choice (\d+)(?: \(([^)]+)\))?:\*\* ([^\n]+)\n"
            r"(?:- \*\*Response(?: \(([^)]+)\))?:\*\* ([^\n]+)\n)?"
            r"(?:- \*\*Effects(?: \(([^)]+)\))?:\*\* ([^\n]+))?"
            f"(?={stop})"
        )
        next_re = r"\*\*Next node:\*\* (\d+)"
        meta_re = r"- \*\*(Trust|Sets tone|Sets flag|Clears flag|Progress|Enables):\*\* (.+?)(?=\n|$)"
    else:
        choice_re = (
            r"\*\*(?:Выбор|Вариант) (\d+)(?: \(([^)]+)\))?:\*\* ([^\n]+)\n"
            r"(?:- \*\*Ответ(?: \(([^)]+)\))?:\*\* ([^\n]+)\n)?"
            r"(?:- \*\*Эффекты(?: \(([^)]+)\))?:\*\* ([^\n]+))?"
            f"(?={stop})"
        )
        next_re = r"\*\*Следующий узел:\*\* (\d+)"
        meta_re = r"- \*\*(Доверие|Устанавливает тон|Устанавливает флаг|Снимает флаг|Прогресс|Разрешает):\*\* (.+?)(?=\n|$)"

    choices = []
    for cm in re.finditer(choice_re, block):
        idx = int(cm.group(1))
        choice_text = cm.group(3).strip()
        response = (cm.group(5) or "").strip()
        effects = (cm.group(7) or "").strip()
        tail = block[cm.end() : cm.end() + 300]
        next_choice = re.search(r"\n{1,2}\*\*(?:Choice|Выбор|Вариант) \d+", tail)
        if next_choice:
            tail = tail[: next_choice.start()]
        next_m = re.search(next_re, tail)
        next_node = int(next_m.group(1)) if next_m else None
        extras = [f"{m.group(1)}: {m.group(2).strip()}" for m in re.finditer(meta_re, tail)]
        choices.append({
            "idx": idx,
            "text": choice_text,
            "response": response,
            "effects": effects,
            "next_node": next_node,
            "extras": extras,
        })
    return choices


def parse_nodes(block: str, lang: str) -> list[dict]:
    if lang == "en":
        node_split = re.split(r"(?=^#### Node \d+)", block, flags=re.M)
        node_hdr = r"^#### Node (\d+)"
    else:
        node_split = re.split(r"(?=^#### (?:Node|Узел) \d+)", block, flags=re.M)
        node_hdr = r"^#### (?:Node|Узел) (\d+)"

    nodes = []
    for chunk in node_split:
        m = re.search(node_hdr, chunk, re.M)
        if not m:
            continue
        node_idx = int(m.group(1))
        prompts = parse_prompts(chunk, lang)
        choices = parse_choices(chunk, lang)
        nodes.append({"idx": node_idx, "prompts": prompts, "choices": choices})
    return nodes


def parse_beats(section: str, lang: str) -> list[dict]:
    if lang == "en":
        parts = re.split(r"(?=### Beat \d+ — Day )", section)
        hdr = r"### Beat (\d+) — Day (\d+) — (.+)"
        char_re = r"\*\*Character:\*\* (.+)"
        note_re = r"\*\*Note:\*\* (.+?)(?=\n\*\*|\n####|\n---|\Z)"
    else:
        parts = re.split(r"(?=### Эпизод \d+ — День )", section)
        hdr = r"### Эпизод (\d+) — День (\d+) — (.+)"
        char_re = r"\*\*Персонаж:\*\* (.+)"
        note_re = r"\*\*Примечание:\*\* (.+?)(?=\n\*\*|\n####|\n---|\Z)"

    beats = []
    for block in parts:
        m = re.search(hdr, block)
        if not m:
            continue
        beat_num, day, title = int(m.group(1)), int(m.group(2)), m.group(3).strip()
        char_m = re.search(char_re, block)
        note_m = re.search(note_re, block, re.S)
        beats.append({
            "beat": beat_num,
            "day": day,
            "title": title,
            "character": char_m.group(1).strip() if char_m else "",
            "note": note_m.group(1).strip().replace("\n", " ") if note_m else "",
            "nodes": parse_nodes(block, lang),
        })
    return beats


def parse_encounters(section: str, lang: str) -> list[dict]:
    parts = re.split(r"\n---\n", section)
    enc_pat = r"### (?:Encounter|Встреча) #(\d+) — (.+)"
    if lang == "en":
        char_re = r"\*\*Character:\*\* (.+)"
        note_re = r"\*\*Note:\*\* (.+?)(?=\n\*\*|\n####|\n---|\Z)"
    else:
        char_re = r"\*\*Персонаж:\*\* (.+)"
        note_re = r"\*\*Примечание:\*\* (.+?)(?=\n\*\*|\n####|\n---|\Z)"

    encounters = []
    for block in parts:
        m = re.search(enc_pat, block)
        if not m:
            continue
        num = int(m.group(1))
        header_char = m.group(2).strip()
        char_m = re.search(char_re, block)
        note_m = re.search(note_re, block, re.S)
        encounters.append({
            "num": num,
            "header_char": header_char,
            "character": char_m.group(1).strip() if char_m else header_char,
            "note": note_m.group(1).strip().replace("\n", " ") if note_m else "",
            "nodes": parse_nodes(block, lang),
        })
    encounters.sort(key=lambda e: e["num"])
    return encounters


def list_subsections(section: str, lang: str) -> list[dict]:
    blocks = re.split(r"(?=^### )", section, flags=re.M)
    subs = []
    for block in blocks:
        m = re.match(r"### (.+?)\n", block)
        if not m:
            continue
        subs.append({
            "title": m.group(1).strip(),
            "nodes": parse_nodes(block, lang),
        })
    return subs


def parse_special_subsections(section_en: str, section_ru: str) -> list[dict]:
    """Pair special subsections by order (EN/RU titles differ)."""
    en_subs = list_subsections(section_en, "en")
    ru_subs = list_subsections(section_ru, "ru")
    count = max(len(en_subs), len(ru_subs))
    merged = []
    for i in range(count):
        merged.append({
            "title_en": en_subs[i]["title"] if i < len(en_subs) else "",
            "title_ru": ru_subs[i]["title"] if i < len(ru_subs) else "",
            "en_nodes": en_subs[i]["nodes"] if i < len(en_subs) else [],
            "ru_nodes": ru_subs[i]["nodes"] if i < len(ru_subs) else [],
        })
    return merged


def merge_prompts(en_prompts: list, ru_prompts: list) -> list[tuple[str, str, str]]:
    """Align prompts by normalized label; fall back to position."""
    en_by_label = {normalize_label(p[0]): p[1] for p in en_prompts}
    ru_by_label = {normalize_label(p[0]): p[1] for p in ru_prompts}
    labels = []
    for p in en_prompts:
        nl = normalize_label(p[0])
        if nl not in labels:
            labels.append(nl)
    for p in ru_prompts:
        nl = normalize_label(p[0])
        if nl not in labels:
            labels.append(nl)
    merged = [(lbl, en_by_label.get(lbl, ""), ru_by_label.get(lbl, "")) for lbl in labels]
    if len(en_prompts) == len(ru_prompts) and any(not en and not ru for _, en, ru in merged):
        merged = []
        for i in range(len(en_prompts)):
            lbl = normalize_label(en_prompts[i][0]) if i < len(en_prompts) else normalize_label(ru_prompts[i][0])
            en_t = en_prompts[i][1] if i < len(en_prompts) else ""
            ru_t = ru_prompts[i][1] if i < len(ru_prompts) else ""
            merged.append((lbl, en_t, ru_t))
    return merged


def merge_choices(en_choices: list, ru_choices: list) -> list[dict]:
  merged = []
  ru_by_idx = {c["idx"]: c for c in ru_choices}
  en_by_idx = {c["idx"]: c for c in en_choices}
  indices = sorted(set(en_by_idx) | set(ru_by_idx))
  for idx in indices:
      e = en_by_idx.get(idx, {})
      r = ru_by_idx.get(idx, {})
      merged.append({
          "idx": idx,
          "en_text": e.get("text", ""),
          "ru_text": r.get("text", ""),
          "en_response": e.get("response", ""),
          "ru_response": r.get("response", ""),
          "effects": e.get("effects") or r.get("effects", ""),
          "next_node": e.get("next_node") if e.get("next_node") is not None else r.get("next_node"),
          "extras_en": e.get("extras", []),
          "extras_ru": r.get("extras", []),
      })
  return merged


def emit_prompts(prompts: list[tuple[str, str, str]]) -> list[str]:
    lines = []
    for label, en, ru in prompts:
        if label == "main":
            lines.append(f"**Prompt (EN):** {en}")
            lines.append(f"**Prompt (RU):** {ru}")
        else:
            lines.append(f"**Prompt {label} (EN):** {en}")
            lines.append(f"**Prompt {label} (RU):** {ru}")
        lines.append("")
    return lines


def emit_choices(choices: list[dict]) -> list[str]:
    lines = []
    for c in choices:
        lines.append(f"**Choice {c['idx']}**")
        lines.append(f"- **Choice (EN):** {c['en_text']}")
        lines.append(f"- **Choice (RU):** {c['ru_text']}")
        if c["en_response"] or c["ru_response"]:
            lines.append(f"- **Response (EN):** {c['en_response']}")
            lines.append(f"- **Response (RU):** {c['ru_response']}")
        if c["effects"]:
            lines.append(f"- **Effects:** {c['effects']}")
        for extra in c.get("extras_en", []):
            lines.append(f"- **{extra}**")
        for extra in c.get("extras_ru", []):
            if extra not in c.get("extras_en", []):
                lines.append(f"- **{extra}**")
        if c["next_node"] is not None:
            lines.append(f"- **Next node:** {c['next_node']}")
        lines.append("")
    return lines


def emit_nodes(en_nodes: list, ru_nodes: list) -> list[str]:
    en_by = {n["idx"]: n for n in en_nodes}
    ru_by = {n["idx"]: n for n in ru_nodes}
    indices = sorted(set(en_by) | set(ru_by))
    lines = []
    for idx in indices:
        en_n = en_by.get(idx, {"prompts": [], "choices": []})
        ru_n = ru_by.get(idx, {"prompts": [], "choices": []})
        lines.append(f"#### Node {idx}")
        lines.append("")
        lines.extend(emit_prompts(merge_prompts(en_n["prompts"], ru_n["prompts"])))
        lines.extend(emit_choices(merge_choices(en_n["choices"], ru_n["choices"])))
    return lines


def emit_beat(en_beat: dict | None, ru_beat: dict | None) -> list[str]:
    b = en_beat or ru_beat
    if not b:
        return []
    day = (en_beat or ru_beat)["day"]
    beat = (en_beat or ru_beat)["beat"]
    title_en = en_beat["title"] if en_beat else ""
    title_ru = ru_beat["title"] if ru_beat else ""
    char_en = en_beat.get("character", "") if en_beat else ""
    char_ru = ru_beat.get("character", "") if ru_beat else ""
    note_en = en_beat.get("note", "") if en_beat else ""
    note_ru = ru_beat.get("note", "") if ru_beat else ""

    lines = [
        f"### Beat {beat} — Day {day}",
        "",
        f"**Title (EN):** {title_en}",
        f"**Title (RU):** {title_ru}",
        f"**Character (EN):** {char_en}",
        f"**Character (RU):** {char_ru}",
    ]
    if note_en or note_ru:
        lines.append(f"**Note (EN):** {note_en}")
        lines.append(f"**Note (RU):** {note_ru}")
    lines.append("")
    lines.extend(emit_nodes(
        en_beat["nodes"] if en_beat else [],
        ru_beat["nodes"] if ru_beat else [],
    ))
    lines.append("---")
    lines.append("")
    return lines


def emit_encounter(en_enc: dict | None, ru_enc: dict | None) -> list[str]:
    e = en_enc or ru_enc
    if not e:
        return []
    num = e["num"]
    char_en = en_enc.get("character", en_enc.get("header_char", "")) if en_enc else ""
    char_ru = ru_enc.get("character", ru_enc.get("header_char", "")) if ru_enc else ""
    note_en = en_enc.get("note", "") if en_enc else ""
    note_ru = ru_enc.get("note", "") if ru_enc else ""

    lines = [
        f"### Encounter #{num}",
        "",
        f"**Character (EN):** {char_en}",
        f"**Character (RU):** {char_ru}",
    ]
    if note_en or note_ru:
        lines.append(f"**Note (EN):** {note_en}")
        lines.append(f"**Note (RU):** {note_ru}")
    lines.append("")
    lines.extend(emit_nodes(
        en_enc["nodes"] if en_enc else [],
        ru_enc["nodes"] if ru_enc else [],
    ))
    lines.append("---")
    lines.append("")
    return lines


def build_document() -> str:
    en_text = REF_EN.read_text(encoding="utf-8")
    ru_text = REF_RU.read_text(encoding="utf-8")
    all_titles = all_section_titles()

    out: list[str] = [
        "# Questions & Choices Reference — Bilingual (EN / RU)",
        "",
        "Complete catalogue of court encounters with **English and Russian** prompts, player choices, and NPC responses.",
        "",
        "Organized by **story arcs** and **question pools**. Stat effects use English stat names.",
        "",
        f"**Source:** [`QUESTIONS_REFERENCE.md`](QUESTIONS_REFERENCE.md) + [`QUESTIONS_REFERENCE_RU.md`](QUESTIONS_REFERENCE_RU.md)",
        "",
        "**Stat order:** People, Church, Army, Treasury, Health, Loyalty, Nobility, Food, Succession",
        "",
        "---",
        "",
    ]

    # Special encounters
    out.append("## Special Encounters")
    out.append("")
    for en_title, ru_title in SPECIAL_SECTIONS:
        sec_en = extract_section(en_text, en_title, all_titles)
        sec_ru = extract_section(ru_text, ru_title, [t[1] for t in SPECIAL_SECTIONS] + [s[1] for s in ARC_SECTIONS] + [s[1] for s in POOL_SECTIONS] + ["Встречи из пулов", "Аудит охвата пулов"])
        subs = parse_special_subsections(sec_en, sec_ru)
        for sub in subs:
            out.append(f"### {sub['title_en'] or sub['title_ru']}")
            if sub["title_ru"] and sub["title_ru"] != sub["title_en"]:
                out.append(f"**Title (RU):** {sub['title_ru']}")
            out.append("")
            out.extend(emit_nodes(sub["en_nodes"], sub["ru_nodes"]))
            out.append("---")
            out.append("")

    # Arcs
    out.append("## Story Arcs")
    out.append("")
    ru_arc_titles = [s[1] for s in ARC_SECTIONS]
    for en_title, ru_title in ARC_SECTIONS:
        sec_en = extract_section(en_text, en_title, all_titles)
        sec_ru = extract_section(ru_text, ru_title, ru_arc_titles + ["Встречи из пулов"])
        beats_en = {(b["beat"], b["day"]): b for b in parse_beats(sec_en, "en")}
        beats_ru = {(b["beat"], b["day"]): b for b in parse_beats(sec_ru, "ru")}
        keys = sorted(set(beats_en) | set(beats_ru))
        out.append(f"## {en_title}")
        out.append(f"## {ru_title}")
        out.append("")
        for key in keys:
            out.extend(emit_beat(beats_en.get(key), beats_ru.get(key)))

    # Pools
    out.append("## Pool Encounters")
    out.append("")
    pool_stop = [s[0] for s in POOL_SECTIONS] + ["Pool coverage audit"]
    pool_stop_ru = [s[1] for s in POOL_SECTIONS] + ["Аудит охвата пулов"]
    for en_pool, ru_pool in POOL_SECTIONS:
        sec_en = extract_section(en_text, en_pool, pool_stop + all_titles)
        sec_ru = extract_section(ru_text, ru_pool, pool_stop_ru + ru_arc_titles)
        enc_en = {e["num"]: e for e in parse_encounters(sec_en, "en")}
        enc_ru = {e["num"]: e for e in parse_encounters(sec_ru, "ru")}
        nums = sorted(set(enc_en) | set(enc_ru))
        out.append(f"## {en_pool}")
        if en_pool != ru_pool:
            out.append(f"## {ru_pool}")
        out.append("")
        for num in nums:
            out.extend(emit_encounter(enc_en.get(num), enc_ru.get(num)))

    return "\n".join(out)


def main() -> None:
    doc = build_document()
    OUTPUT.write_text(doc, encoding="utf-8")
    print(f"Wrote {OUTPUT}")
    print(f"Lines: {doc.count(chr(10)) + 1}")
    print(f"Encounters (### Encounter #): {doc.count('### Encounter #')}")
    print(f"Beats (### Beat ): {doc.count('### Beat ')}")


if __name__ == "__main__":
    main()

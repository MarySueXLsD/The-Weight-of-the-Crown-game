import re

def extract_choices(path):
    with open(path, encoding='utf-8') as f:
        content = f.read()
    return re.findall(
        r'DialogueChoice\(choiceText = "([^"]*)", response = "([^"]*)"',
        content
    )

en = extract_choices('C:/Users/syanavi/Documents/My Games/eden/launcher/projects/019eab54-61cf-7c88-a293-0fa895edb23b/scripts/das/arcs/arc_encounters_en.das')
ru = extract_choices('C:/Users/syanavi/Documents/My Games/eden/launcher/projects/019eab54-61cf-7c88-a293-0fa895edb23b/scripts/das/arcs/arc_encounters_ru.das')
print('choices with text:', len(en), len(ru))

# show EN choices not in RU by choiceText
ru_texts = {c for c, r in ru}
missing = [(c, r) for c, r in en if c not in ru_texts]
print('missing by choiceText:', len(missing))
for c, r in missing:
    print('---')
    print('CHOICE:', c)
    print('RESP:', r[:120])

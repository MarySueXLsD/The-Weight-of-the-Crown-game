import re

def count_choices_in_encounters(path):
    with open(path, encoding='utf-8') as f:
        content = f.read()
    # split by Encounter(
    parts = content.split('Encounter(')[1:]
    counts = []
    for p in parts:
        c = len(re.findall(r'DialogueChoice\(choiceText = "', p.split('),')[0] if False else p))
        c = p.count('DialogueChoice(choiceText = "')
        counts.append(c)
    return counts

en_c = count_choices_in_encounters('arc_encounters_en.das')
ru_c = count_choices_in_encounters('arc_encounters_ru.das')
print('encounters', len(en_c), len(ru_c))
if len(en_c) != len(ru_c):
    print('ENCOUNTER COUNT MISMATCH')
for i, (a, b) in enumerate(zip(en_c, ru_c)):
    if a != b:
        print(f'encounter {i}: EN={a} RU={b}')
if len(en_c) > len(ru_c):
    print('extra EN:', en_c[len(ru_c):])
elif len(ru_c) > len(en_c):
    print('extra RU:', ru_c[len(en_c):])

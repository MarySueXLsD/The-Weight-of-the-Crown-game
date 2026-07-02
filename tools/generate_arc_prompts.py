#!/usr/bin/env python3
"""Generate arc_prompts.das prompt builder bodies from embedded variant tables."""
from __future__ import annotations

from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DAS_ARCS = ROOT / "scripts" / "das" / "arcs"
OUT = DAS_ARCS / "arc_prompts.das"

HEADER = '''require engine.core
require scripts/das/core/constants
require scripts/das/core/dialogue_types
require scripts/das/arcs/arc_state
require scripts/das/localization/localization public


module arc_prompts public


// ---- Trust / tier helpers ----

let NORTHERN_TIER_HOSTILE = 0
let NORTHERN_TIER_WARY = 1
let NORTHERN_TIER_NEUTRAL = 2
let NORTHERN_TIER_CORDIAL = 3
let NORTHERN_TIER_ALLIED = 4


def public northern_trust_tier() : int {
    if (northernTrust <= -35) {
        return NORTHERN_TIER_HOSTILE
    }
    if (northernTrust <= -5) {
        return NORTHERN_TIER_WARY
    }
    if (northernTrust <= 4) {
        return NORTHERN_TIER_NEUTRAL
    }
    if (northernTrust <= 34) {
        return NORTHERN_TIER_CORDIAL
    }
    return NORTHERN_TIER_ALLIED
}


def public clamp_northern_trust(delta : int) {
    northernTrust = clamp(northernTrust + delta, -100, 100)
}


def public patch_dialogue_prompt(base : DialogueNode; prompt : string) : DialogueNode {
    return DialogueNode(
        prompt = prompt,
        choiceCount = base.choiceCount,
        choices = base.choices,
        questionId = base.questionId
    )
}


def public try_patch_arc_prompt(base : DialogueNode; prompt : string) : DialogueNode {
    if (length(prompt) == 0) {
        return base
    }
    return patch_dialogue_prompt(base, prompt)
}

'''

# (beatIdx, en_builder_body, ru_builder_body) — beatIdx -1 = shared helpers only
NORTHERN_BUILDERS = '''
def build_northern_receipt_prompt_en() : string {
    if (northernEnvoyChoice == 0) {
        return "Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? You treated me as an equal envoy on day five. Unusual for a king who took the throne. They want the same answer in writing before they recognize your seal."
    }
    if (northernEnvoyChoice == 1) {
        return "Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? You called the north vultures before your crown was warm. They do not send recognition — they send a list of exiles they already shelter. Pay attention to the names."
    }
    if (northernEnvoyChoice == 2) {
        return "Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? You fed me wine on day five and bought time. They will price that habit in coin, not alliances — but they still want your answer in writing."
    }
    return "Your Majesty, the princes ask for a receipt: what did the coup cost, and who still owes whom? They want the same answer in writing before they recognize your seal."
}


def build_northern_receipt_prompt_ru() : string {
    if (northernEnvoyChoice == 0) {
        return "Ваше Величество, князья требуют две грамоты: сколько стоил переворот, кто кому должен — и признание их княжеств. На пятый день вы встретили меня как равного посла. Устной учтивости мало: подпишите акт признания, и они обсудят вашу королевскую печать."
    }
    if (northernEnvoyChoice == 1) {
        return "Ваше Величество, князья требуют грамоту: сколько стоил переворот, кто кому должен, и ваша подпись. На пятый день вы назвали север стервятниками — вам едва неделя на троне. Они не шлют признание. Они шлют список изгнанников, которых уже укрывают. Изучите эти имена."
    }
    if (northernEnvoyChoice == 2) {
        return "Ваше Величество, князья требуют грамоту: сколько стоил переворот, кто кому должен, и ваша подпись. На пятый день вы напоили меня и купили время золотом. За вино короля не признают — грамота всё равно нужна."
    }
    return "Ваше Величество, князья требуют грамоту: сколько стоил переворот, кто кому должен, и ваша подпись. Без неё королевскую печать не признают."
}


def build_northern_receipt_prompt() : string {
    if (is_russian()) {
        return build_northern_receipt_prompt_ru()
    }
    return build_northern_receipt_prompt_en()
}


def build_northern_border_prompt_en() : string {
    if (northernEnvoyChoice == 1 || northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. You spat at the northern envoy on day five. The smoke is your answer. Give me two companies or give me a better sermon."
    }
    if (northernEnvoyChoice == 0) {
        return "Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. You received Ingvar with courtesy on day five — the north tests whether that courtesy was policy or theater. Do I reinforce the pass, raid in answer, or send him to negotiate what steel should not?"
    }
    if (northernEnvoyChoice == 2) {
        return "Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. You bought Ingvar wine on day five — the north tests whether delay becomes weakness. Do I reinforce the pass, raid in answer, or send him to negotiate what steel should not?"
    }
    return "Your Majesty, riders report smoke on the Grey Pass — not army campfires, but villages burning. The north tests borders when words fail. Do I reinforce the pass, raid in answer, or send Ingvar to negotiate what steel should not?"
}


def build_northern_border_prompt_ru() : string {
    if (northernEnvoyChoice == 1 || northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Ваше Величество, гонцы докладывают дым на Сером перевале — не костры армии, а горящие деревни. Вы плюнули в северного посла на пятый день. Дым — ваш ответ. Дайте мне две роты или дайте лучшую проповедь."
    }
    if (northernEnvoyChoice == 0) {
        return "Ваше Величество, гонцы докладывают дым на Сером перевале — не костры армии, а горящие деревни. Вы приняли Ингвара с учтивостью на пятый день — север проверяет, была ли учтивость политикой или театром. Укрепить перевал, ответить рейдом или послать его договариваться там, где не должна говорить сталь?"
    }
    if (northernEnvoyChoice == 2) {
        return "Ваше Величество, гонцы докладывают дым на Сером перевале — не костры армии, а горящие деревни. Вы напоили Ингвара вином на пятый день — север проверяет, станет ли промедление слабостью. Укрепить перевал, ответить рейдом или послать его договариваться?"
    }
    return "Ваше Величество, гонцы докладывают дым на Сером перевале — не костры армии, а горящие деревни. Север проверяет границы, когда слова кончились. Укрепить перевал, ответить рейдом или послать Ингвара договариваться?"
}


def build_northern_border_prompt() : string {
    if (is_russian()) {
        return build_northern_border_prompt_ru()
    }
    return build_northern_border_prompt_en()
}


def build_northern_faith_prompt_en() : string {
    if (northernBorderChoice == 0) {
        return "Your Majesty, in three days your priests will ask whether heaven blesses killing a king. You reinforced the Grey Pass when the north burned villages. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal. God can wait. Politics cannot."
    }
    if (northernBorderChoice == 1) {
        return "Your Majesty, in three days your priests will ask whether heaven blesses killing a king. You raided northern scouts after the smoke on the pass. The princes offer a secular bargain before Malrik offers a holy one — or they raise banners. God can wait. Politics cannot."
    }
    if (northernBorderChoice == 2) {
        return "Your Majesty, in three days your priests will ask whether heaven blesses killing a king. You sent Ingvar to the pass to buy words. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal."
    }
    if (northern_trust_tier() == NORTHERN_TIER_WARY || northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Your Majesty, in three days your priests will ask whether heaven blesses killing a king. You hold the border with stone, not gifts. The princes raise tribute instead of banners — for now. Pay, or let Malrik become your only friend."
    }
    return "Your Majesty, in three days your priests will ask whether heaven blesses killing a king. The princes offer a secular bargain before Malrik offers a holy one: recognize their trade rights, and they recognize your seal. God can wait. Politics cannot."
}


def build_northern_faith_prompt_ru() : string {
    if (northernBorderChoice == 0) {
        return "Ваше Величество, через три дня священники спросят, благословляет ли небо узурпацию. Вы укрепили Серый перевал, когда север жёг деревни. Князья предлагают светскую сделку, прежде чем Малрик предложит святую: признайте их торговые права — они признают вашу печать. Бог подождёт. Политика — нет."
    }
    if (northernBorderChoice == 1) {
        return "Ваше Величество, через три дня священники спросят, благословляет ли небо узурпацию. Вы ударили по северным разведчикам после дыма на перевале. Князья предлагают светскую сделку — или поднимают знамёна. Бог подождёт. Политика — нет."
    }
    if (northernBorderChoice == 2) {
        return "Ваше Величество, через три дня священники спросят, благословляет ли небо узурпацию. Вы послали Ингвара на перевал покупать слова. Князья предлагают светскую сделку: признайте их торговые права — они признают вашу печать."
    }
    if (northern_trust_tier() == NORTHERN_TIER_WARY || northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Ваше Величество, через три дня священники спросят, благословляет ли небо узурпацию. Вы держите границу камнем, не подарками. Князья требуют дань вместо знамён — пока. Платите — или пусть Малрик станет вашим единственным другом."
    }
    return "Ваше Величество, через три дня священники спросят, благословляет ли небо узурпацию. Князья предлагают светскую сделку, прежде чем Малрик предложит святую: признайте их торговые права — они признают вашу печать. Бог подождёт. Политика — нет."
}


def build_northern_faith_prompt() : string {
    if (is_russian()) {
        return build_northern_faith_prompt_ru()
    }
    return build_northern_faith_prompt_en()
}


def build_northern_warchest_prompt_en() : string {
    if (northern_trust_tier() >= NORTHERN_TIER_CORDIAL) {
        return "Your Majesty, Ingvar's treaty still smells of your day-twenty-seven choice. The north calls you pragmatic. They offer gold at shameful interest — better than Rudolf's mutiny. Take the loan, build the wall, owe a friend."
    }
    if (northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Your Majesty, the princes ban grain trade on the northern road. Arm the pass and we starve. Disarm and we kneel. Choose your favorite humiliation."
    }
    if (northernFaithChoice == 0) {
        return "Your Majesty, you paid northern tribute on day twenty-seven. The princes offer a loan for forts on the Grey Pass — or a trade ban if we arm further. Malrik eats our church tax. The north eats our trade. Which wolf do we feed?"
    }
    if (northernFaithChoice == 1) {
        return "Your Majesty, you refused Ingvar's bargain on day twenty-seven. The princes offer a loan — or a trade ban if we arm further. Malrik eats our church tax. The north eats our trade. Which wolf do we feed?"
    }
    return "Your Majesty, Ingvar's treaty still smells of your day-twenty-seven choice. The princes offer a loan for forts on the Grey Pass, or a trade ban if we arm further. Malrik eats our church tax. The north eats our trade. Which wolf do we feed?"
}


def build_northern_warchest_prompt_ru() : string {
    if (northern_trust_tier() >= NORTHERN_TIER_CORDIAL) {
        return "Ваше Величество, договор Ингвара всё ещё пахнет вашим выбором двадцать седьмого дня. Север называет вас прагматиком. Они предлагают золото под постыдные проценты — лучше, чем мятеж Рудольфа. Возьмите заём, постройте стену, должны другу."
    }
    if (northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Ваше Величество, князья объявили запрет на торговлю на зерно с северной дороги. Вооружите перевал — голодим. Разоружите — преклоняемся. Выберите любимое унижение."
    }
    if (northernFaithChoice == 0) {
        return "Ваше Величество, вы заплатили северную дань двадцать седьмого дня. Князья предлагают заём на форты Серого перевала — или запрет на торговлю, если мы дальше вооружаемся. Малрик ест наш церковный налог. Север ест нашу торговлю. Какого волка кормим?"
    }
    if (northernFaithChoice == 1) {
        return "Ваше Величество, вы отказали Ингвару двадцать седьмого дня. Князья предлагают заём — или запрет на торговлю, если мы дальше вооружаемся. Малрик ест наш церковный налог. Север ест нашу торговлю. Какого волка кормим?"
    }
    return "Ваше Величество, договор Ингвара всё ещё пахнет вашим выбором двадцать седьмого дня. Князья предлагают заём на форты — или запрет на торговлю, если мы вооружаемся. Малрик ест наш церковный налог. Север ест нашую торговлю. Какого волка кормим?"
}


def build_northern_warchest_prompt() : string {
    if (is_russian()) {
        return build_northern_warchest_prompt_ru()
    }
    return build_northern_warchest_prompt_en()
}


def build_northern_knox_prompt_en() : string {
    if (householdShelteredConfessor) {
        return "Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. You sheltered Aldo while northern scribes map disloyalty. These agents and your ghosts rhyme. Return them and Ingvar learns your soft spots. Keep them and learn his."
    }
    if (householdCutClerks) {
        return "Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. You cut Edwin's ghost clerks from Osric's desk. These men carry lists of who still mourns the old king. Torture, trade, or return them with a message?"
    }
    if (householdShelteredConfessor == false && householdCutClerks == false) {
        return "Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. You kept Edwin's clerks working under your roof. These men carry lists of who still mourns the old king. Torture, trade, or return them with a message?"
    }
    return "Your Majesty, my nets caught northern agents in the lower city — not soldiers, scribes. Ingvar calls them merchants. I call them a map of your enemies. Torture, trade, or return them with a message?"
}


def build_northern_knox_prompt_ru() : string {
    if (householdShelteredConfessor) {
        return "Ваше Величество, мои сети поймали северных агентов в нижнем городе — не солдат, писцов. Вы укрыли Альдо, пока северные писцы составляют карту нелояльности. Эти агенты и ваши призраки рифмуются. Верните их — и Ингвар узнает ваши слабые места. Оставьте — и узнаете его."
    }
    if (householdCutClerks) {
        return "Ваше Величество, мои сети поймали северных агентов в нижнем городе — не солдат, писцов. Вы отрезали призрачных писцов Эдвина от стола Осрика. Эти люди несут списки тех, кто ещё скорбит о старом короле. Пытка, торг или возврат с посланием?"
    }
    return "Ваше Величество, мои сети поймали северных агентов в нижнем городе — не солдат, писцов. Ингвар называет их купцами. Я — картой ваших врагов. Пытка, торг или возврат с посланием?"
}


def build_northern_knox_prompt() : string {
    if (is_russian()) {
        return build_northern_knox_prompt_ru()
    }
    return build_northern_knox_prompt_en()
}


def build_northern_charter_prompt_en() : string {
    if (northern_trust_tier() <= NORTHERN_TIER_WARY) {
        if (northernKnoxChoice == 2) {
            return "Your Majesty, you hung my scribes. The princes do not offer alliance — they offer terms. Dismantle forts on the Grey Pass, pay twelve years of tribute, and they will not call you killing a king in every hall from here to the sea."
        }
        if (northernKnoxChoice == 1) {
            return "Your Majesty, you questioned my agents until they sang. The princes do not offer alliance — they offer terms. Dismantle forts on the Grey Pass, pay twelve years of tribute, and they will not call you killing a king in every hall from here to the sea."
        }
        return "Your Majesty, you returned my agents politely. The princes still do not offer alliance — they offer terms. Dismantle forts on the Grey Pass, pay twelve years of tribute, and they will not call you killing a king in every hall from here to the sea."
    }
    if (northernKnoxChoice == 0) {
        return "Your Majesty, you returned my agents politely. The princes read your habit as clearly as I do. They offer a charter: mutual defence, shared tolls, your seal beside theirs on the Grey Pass. Sign, and the north calls you king in every market from here to winter."
    }
    if (northernKnoxChoice == 1) {
        return "Your Majesty, you questioned my agents. The princes read your habit as clearly as I do. They offer a charter: mutual defence, shared tolls, your seal beside theirs on the Grey Pass."
    }
    if (northernKnoxChoice == 2) {
        return "Your Majesty, you hung my scribes. The princes read your habit as clearly as I do — yet still offer a charter, if you sign before winter. Mutual defence, shared tolls, your seal beside theirs on the Grey Pass."
    }
    return "Your Majesty, the princes offer a charter: mutual defence, shared tolls, your seal beside theirs on the Grey Pass. Sign, and the north calls you king in every market from here to winter."
}


def build_northern_charter_prompt_ru() : string {
    if (northern_trust_tier() <= NORTHERN_TIER_WARY) {
        return "Ваше Величество, князья не предлагают союз — они предлагают условия. Разберите форты на Сером перевале, платите двенадцать лет дани — и они не будут называть вас тем, кто взял трон в каждом зале отсюда до моря."
    }
    if (northernKnoxChoice == 0) {
        return "Ваше Величество, вы вежливо вернули моих агентов. Князья читают вашу привычку так же ясно, как я. Они предлагают хартию: взаимная оборона, общие пошлины, ваша печать рядом с их на Сером перевале."
    }
    return "Ваше Величество, князья предлагают хартию: взаимная оборона, общие пошлины, ваша печать рядом с их на Сером перевале. Подпишите — и север назовёт вас королём на каждом рынке отсюда до зимы."
}


def build_northern_charter_prompt() : string {
    if (is_russian()) {
        return build_northern_charter_prompt_ru()
    }
    return build_northern_charter_prompt_en()
}


def build_northern_skirmish_prompt_en() : string {
    if (northernAllianceSigned) {
        return "Your Majesty, blood at the Grey Pass — our men or theirs, depending who lies. You signed Ingvar's charter. The north tests whether the throne-stealer's army is real. Do I hold, pursue, or sue for parley while the snow still owns the heights?"
    }
    if (northernAllianceChoice >= 0 && northernAllianceChoice <= 2 && northern_trust_tier() <= NORTHERN_TIER_WARY) {
        return "Your Majesty, blood at the Grey Pass. You spat on Ingvar's terms at day sixty-six. The north tests whether the throne-stealer's army is real. Do I hold, pursue, or sue for parley?"
    }
    return "Your Majesty, blood at the Grey Pass — our men or theirs, depending who lies. The north tests whether the throne-stealer's army is real. Do I hold, pursue, or sue for parley while the snow still owns the heights?"
}


def build_northern_skirmish_prompt_ru() : string {
    if (northernAllianceSigned) {
        return "Ваше Величество, кровь на Сером перевале — наши или их, смотря кто лжёт. Вы подписали хартию Ингвара. Север проверяет, настоящая ли армия у того, кто взял трон. Держать, преследовать или просить перемирия, пока снег владеет высотами?"
    }
    return "Ваше Величество, кровь на Сером перевале. Север проверяет, настоящая ли армия у того, кто взял трон. Держать, преследовать или просить перемирия?"
}


def build_northern_skirmish_prompt() : string {
    if (is_russian()) {
        return build_northern_skirmish_prompt_ru()
    }
    return build_northern_skirmish_prompt_en()
}


def build_northern_refugees_prompt_en() : string {
    if (northernAllianceSigned || northern_trust_tier() >= NORTHERN_TIER_CORDIAL) {
        return "Your Majesty, two thousand northern refugees crowd the ford — famine in the princes' hills, or a leash to embarrass you. You allied with us. The commons watch whether the king who took the throne feeds my people while Edwin's widows beg. Malrik offers baptisms. I offer politics."
    }
    if (northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Your Majesty, two thousand northern refugees crowd the ford. You declared us enemies at the pass. The commons watch whether the king who took the throne turns hungry mouths away. Malrik offers baptisms. I offer politics."
    }
    return "Your Majesty, two thousand northern refugees crowd the ford — famine in the princes' hills, or a leash to embarrass you. The commons watch whether the king who took the throne feeds strangers while Edwin's widows beg. Malrik offers baptisms. I offer politics."
}


def build_northern_refugees_prompt_ru() : string {
    if (northernAllianceSigned || northern_trust_tier() >= NORTHERN_TIER_CORDIAL) {
        return "Ваше Величество, две тысячи северных беженцев теснят брод. Вы — наш союзник. Простой люди смотрят, кормит ли тот, кто взял трон, мой народ, пока вдовы Эдвина просят. Малрик предлагает крещения. Я — политику."
    }
    return "Ваше Величество, две тысячи северных беженцев теснят брод. Простой люди смотрят, кормит ли тот, кто взял трон, чужаков, пока вдовы Эдвина просят. Малрик предлагает крещения. Я — политику."
}


def build_northern_refugees_prompt() : string {
    if (is_russian()) {
        return build_northern_refugees_prompt_ru()
    }
    return build_northern_refugees_prompt_en()
}


def build_northern_final_demand_prompt_en() : string {
    if (northernRefugeesAccepted) {
        return "Your Majesty, half the year gone. You sheltered our refugees at the ford. The princes ask whether Estedor is ally, market, or future province. Renew the charter, share Grey Lung physic if your wards still cough, or stand alone before winter returns."
    }
    if (northernRefugeesTurnedBack) {
        return "Your Majesty, half the year gone. You closed the ford to our hungry. The princes ask whether Estedor is ally, market, or future province. Renew the charter, share Grey Lung physic if your wards still cough, or stand alone before winter returns."
    }
    if (northern_trust_tier() >= NORTHERN_TIER_CORDIAL) {
        return "Your Majesty, half the year gone. The princes offer to renew the charter and share physic from the Grey Lung cure — if your wards still cough. Stand with us, or stand alone before winter returns."
    }
    if (northern_trust_tier() == NORTHERN_TIER_HOSTILE) {
        return "Your Majesty, half the year gone. The princes withdraw recognition unless you submit tribute by midwinter — or share physic as ransom. Stand alone, or kneel before winter returns."
    }
    return "Your Majesty, half the year gone. The princes ask whether Estedor is ally, market, or future province. Renew the charter, share Grey Lung physic if your wards still cough, or stand alone before winter returns."
}


def build_northern_final_demand_prompt_ru() : string {
    if (northernRefugeesAccepted) {
        return "Ваше Величество, полгода прошло. Вы укрыли наших беженцев у брода. Князья спрашивают: союзник ли Эстедор, рынок или будущая провинция. Обновите хартию, поделитесь лекарством от Серого кашля — или стойте одни до зимы."
    }
    if (northernRefugeesTurnedBack) {
        return "Ваше Величество, полгода прошло. Вы закрыли брод нашим голодным. Князья спрашивают: союзник, рынок или провинция. Обновите хартию — или стойте одни до зимы."
    }
    return "Ваше Величество, полгода прошло. Князья спрашивают: союзник ли Эстедор, рынок или будущая провинция. Обновите хартию — или стойте одни до зимы."
}


def build_northern_final_demand_prompt() : string {
    if (is_russian()) {
        return build_northern_final_demand_prompt_ru()
    }
    return build_northern_final_demand_prompt_en()
}


def build_northern_prompt(beatIdx : int) : string {
    if (beatIdx == 1) {
        return build_northern_receipt_prompt()
    }
    if (beatIdx == 2) {
        return build_northern_border_prompt()
    }
    if (beatIdx == 3) {
        return build_northern_faith_prompt()
    }
    if (beatIdx == 4) {
        return build_northern_warchest_prompt()
    }
    if (beatIdx == 5) {
        return build_northern_knox_prompt()
    }
    if (beatIdx == 6) {
        return build_northern_charter_prompt()
    }
    if (beatIdx == 7) {
        return build_northern_skirmish_prompt()
    }
    if (beatIdx == 8) {
        return build_northern_refugees_prompt()
    }
    if (beatIdx == 9) {
        return build_northern_final_demand_prompt()
    }
    return ""
}

'''

HOUSEHOLD_BUILDERS = '''
def build_household_gromm_prompt_en() : string {
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. Edric told the court you mean to scour Edwin's household. The kitchen heard that too. Tell me before the purge reaches the pots: am I still your cook, or one of the names on the list?"
    }
    if (householdStance == HOUSEHOLD_STANCE_INTEGRATE) {
        return "Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. You said you would keep those who kneel. I can kneel as well as any guard — but I need to know you mean it for the kitchen. Do I stay, or go with the rest?"
    }
    if (householdStance == HOUSEHOLD_STANCE_IGNORE) {
        return "Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. You chose to let the dead king keep his ghosts. The kitchen is full of old names and old loyalties. Do I remain among them, or cook for you alone?"
    }
    if (householdStance == HOUSEHOLD_STANCE_SELECTIVE) {
        return "Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. You promised justice for the guilty and mercy for the innocent. I served Edwin's table honestly — is that guilt, innocence, or something you will judge yourself? Tell the kitchen before someone else does."
    }
    return "Your Majesty, I cooked for King Edwin the night before the coup — and I cook for you now. The kitchen staff whisper whose bread they earn. I ask before someone else decides for me: do I stay at your stove, or leave with Edwin's household?"
}


def build_household_gromm_prompt_ru() : string {
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "Ваше Величество, я готовил королю Эдвину в ночь перед переворотом — и готовлю для вас. Эдрик сказал двору, что вы намерены вычистить дом Эдвина. Кухня это тоже слышала. Скажите, пока чистка не дошла до котлов: я по-прежнему ваш повар или уже в списке на выгон?"
    }
    if (householdStance == HOUSEHOLD_STANCE_INTEGRATE) {
        return "Ваше Величество, я готовил королю Эдвину в ночь перед переворотом — и готовлю для вас. Вы сказали — оставить тех, кто преклонит колено. Я преклонюсь не хуже стражника — но мне нужно знать, что это касается и кухни. Остаюсь или ухожу вместе с остальными?"
    }
    if (householdStance == HOUSEHOLD_STANCE_IGNORE) {
        return "Ваше Величество, я готовил королю Эдвину в ночь перед переворотом — и готовлю для вас. Вы решили оставить призраков мёртвого короля. На кухне полно старых имён и старых верностей. Я остаюсь среди них — или готовлю уже только для вас?"
    }
    if (householdStance == HOUSEHOLD_STANCE_SELECTIVE) {
        return "Ваше Величество, я готовил королю Эдвину в ночь перед переворотом — и готовлю для вас. Вы обещали казнь виновным и милость невинным. Я честно служил столу Эдвина — это вина, невинность или то, что вы решите сами? Скажите кухне, пока не сказали за вас."
    }
    return "Ваше Величество, я готовил королю Эдвину в ночь перед переворотом — и готовлю для вас. На кухне шепчутся, чей хлеб они пекут. Спрашиваю, пока за меня не решили другие: остаюсь у вашей плиты или ухожу вместе с двором Эдвина?"
}


def build_household_gromm_prompt() : string {
    if (is_russian()) {
        return build_household_gromm_prompt_ru()
    }
    return build_household_gromm_prompt_en()
}


def build_household_varn_prompt_en() : string {
    if (householdKeptGromm && householdWatchedGromm) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. You kept Gromm under watch in the kitchens — my men want to know if old swords get the same mercy, or only old spoons watched by witnesses. Give me an order before they give themselves one."
    }
    if (householdKeptGromm) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. You kept Gromm in the kitchens — my men want to know if old swords get the same mercy, or only old spoons. Give me an order before they give themselves one."
    }
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. You told Edric you would scour the household — my men want to know if that includes them. Give me an order before they give themselves one."
    }
    return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. My men want to know if old swords get the same mercy you showed the kitchens. Give me an order before they give themselves one."
}


def build_household_varn_prompt_ru() : string {
    if (householdKeptGromm) {
        return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Вы оставили Громма на кухне — мои люди хотят знать, достанется ли старым мечам та же милость, что ложкам. Приказ — прежде чем они прикажут сами."
    }
    return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Мои люди хотят знать, достанется ли старым мечам та же милость, что поварам. Приказ — прежде чем они прикажут сами."
}


def build_household_varn_prompt() : string {
    if (is_russian()) {
        return build_household_varn_prompt_ru()
    }
    return build_household_varn_prompt_en()
}


def build_household_osric_prompt() : string {
    if (is_russian()) {
        if (householdKeptGromm && householdPurgedGuards) {
            return "Ваше Величество, я одиннадцать лет копировал руку короля Эдвина — и его печать до сих пор заказывает зерно с моего стола. Вы оставили Громма. Варн сменил стражу. Но указы мёртвого короля всё ещё уходят из этой комнаты. Какой подлог ваш: печати, почерка или молчания?"
        }
        if (householdKeptGromm) {
            return "Ваше Величество, я одиннадцать лет копировал руку короля Эдвина — и его печать до сих пор заказывает зерно с моего стола. Вы оставили Громма на кухне. Указы мёртвого короля всё ещё уходят из этой комнаты. Какой подлог ваш: печати, почерка или молчания?"
        }
        return "Ваше Величество, я одиннадцать лет копировал руку короля Эдвина — и его печать до сих пор заказывает зерно с моего стола. Указы мёртвого короля всё ещё уходят из этой комнаты. Какой подлог ваш: печати, почерка или молчания?"
    }
    if (householdKeptGromm && householdPurgedGuards) {
        return "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. You kept Gromm in the kitchens. Varn replaced the old guard. Yet warrants signed in a dead king's name still leave this room. Which fake seal is yours: the seal, the clerk, or the silence?"
    }
    if (householdKeptGromm) {
        return "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. You kept Gromm in the kitchens. Yet warrants signed in a dead king's name still leave this room. Which fake seal is yours: the seal, the clerk, or the silence?"
    }
    if (householdCutClerks) {
        return "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. You burned Edwin's seal from my desk last week. Yet copyists still whisper his name when they think I am not listening. Which fake seal is yours: the seal, the clerk, or the silence?"
    }
    if (householdPurgedGuards) {
        return "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. Varn reforged the guard while Edwin's warrants still leave this room. Which fake seal is yours: the seal, the clerk, or the silence?"
    }
    return "Your Majesty, I copied King Edwin's hand for eleven years — and his seal still orders grain, pardons, and wages from my desk. Yet warrants signed in a dead king's name still leave this room. Which fake seal is yours: the seal, the clerk, or the silence?"
}


def build_household_arvel_prompt_en() : string {
    if (householdCutClerks) {
        return "Your Majesty, Brother Aldo confessed King Edwin every seventh day — he still does, to an empty throne. You cut Edwin's ghost clerks from Osric's desk last week. Three of them fled to my gate with Osric's ink on their fingers. Aldo asks whether the new king shelters priests, or only hungers for names."
    }
    if (householdShelteredConfessor) {
        return "Your Majesty, Brother Aldo confessed King Edwin every seventh day — he still does, to an empty throne. You already shelter priests at the palace gate. Aldo asks whether that mercy extends to him, or only to names you have not yet catalogued."
    }
    return "Your Majesty, Brother Aldo confessed King Edwin every seventh day — he still does, to an empty throne. You kept Edwin's seal burning on Osric's desk. Three fled to my gate with his ink on their fingers. Aldo asks whether the new king shelters priests, or only hungers for names."
}


def build_household_arvel_prompt_ru() : string {
    if (householdCutClerks) {
        return "Ваше Величество, брат Альдо исповедовал короля Эдвина каждый седьмой день — и до сих пор исповедует пустой трон. Вы отрезали призрачных писцов Эдвина от стола Осрика. Трое бежали ко мне с его чернилами на пальцах. Альдо спрашивает: укрывает ли новый король священников или только жаждет имён?"
    }
    return "Ваше Величество, брат Альдо исповедовал короля Эдвина каждый седьмой день — и до сих пор исповедует пустой трон. Трое бежали ко мне с чернилами Осрика на пальцах. Альдо спрашивает: укрывает ли новый король священников или только жаждет имён?"
}


def build_household_arvel_prompt() : string {
    if (is_russian()) {
        return build_household_arvel_prompt_ru()
    }
    return build_household_arvel_prompt_en()
}


def build_household_selena_prompt_en() : string {
    if (householdPurgedGuards) {
        return "Your Majesty, loyalist households still buy grain through my caravans — they pay in Edwin's sealed notes and curse your name between mouthfuls. Captain Varn tightened the gates after you purged his old guard. That squeezes my routes and their purses. Do you want loyalists starved, spied on, or sold to you?"
    }
    if (householdSelenaBribe) {
        return "Your Majesty, loyalist households still buy grain through my caravans. You already bought names from me once. That squeezes my routes and their purses — unless you buy more. Do you want loyalists starved, spied on, or sold to you again?"
    }
    return "Your Majesty, loyalist households still buy grain through my caravans — they pay in Edwin's sealed notes and curse your name between mouthfuls. Do you want loyalists starved, spied on, or sold to you?"
}


def build_household_selena_prompt() : string {
    if (is_russian()) {
        if (householdPurgedGuards) {
            return "Ваше Величество, лоялистские дома до сих пор покупают зерно через мои караваны. Капитан Варн ужесточил ворота после того, как вы очистили старую стражу. Это сжимает мои пути и их кошельки. Голод, шпионаж или сделка?"
        }
        return "Ваше Величество, лоялистские дома до сих пор покупают зерно через мои караваны — платят запиской Эдвина и ругают вас между глотками. Голод, шпионаж или сделка?"
    }
    return build_household_selena_prompt_en()
}


def build_household_orm_prompt_en() : string {
    var parts = ""
    if (householdKeptGromm) {
        parts = "{parts}You kept Edwin's cook. "
    }
    if (householdPurgedGuards) {
        parts = "{parts}You purged the veteran companies. "
    } elif (householdSelectiveGuards) {
        parts = "{parts}You arrested guard ringleaders. "
    }
    if (householdCutClerks) {
        parts = "{parts}You cut Edwin's scribes. "
    }
    if (householdSelenaBribe) {
        parts = "{parts}You bought names from Selena. "
    }
    if (length(parts) == 0) {
        return "Your Majesty, I wore Edwin's tabard at Grey Pass and I wear yours now — but three companies still toast the dead king in the barracks. Soldiers follow clarity. Tell me whether we purge brothers, pay them, or parade them before the men who replaced them."
    }
    return "Your Majesty, I wore Edwin's tabard at Grey Pass and I wear yours now — but three companies still toast the dead king in the barracks. {parts}Soldiers follow clarity. Tell me whether we purge brothers, pay them, or parade them before the men who replaced them."
}


def build_household_orm_prompt() : string {
    if (is_russian()) {
        return "Ваше Величество, я носил нагрудник Эдвина на Сером перевале и ношу ваш — но три роты до сих пор чокаются за мёртвого короля в казармах. Солдаты ждут ясного приказа. Вычищать братьев, платить им или вывести на парад?"
    }
    var msg = "Your Majesty, I wore Edwin's tabard at Grey Pass and I wear yours now — but three companies still toast the dead king in the barracks. "
    if (householdKeptGromm) {
        msg = "{msg}You kept Edwin's cook. "
    }
    if (householdPurgedGuards) {
        msg = "{msg}You purged the veteran companies. "
    }
    if (householdCutClerks) {
        msg = "{msg}You cut Edwin's scribes. "
    }
    if (householdSelenaBribe) {
        msg = "{msg}You bought names from Selena. "
    }
    return "{msg}Soldiers follow clarity. Tell me whether we purge brothers, pay them, or parade them before the men who replaced them."
}


def build_household_raena_prompt_en() : string {
    var summary = ""
    if (householdKeptGromm) {
        summary = "{summary}Mercy in the kitchens. "
    }
    if (householdPurgedGuards || householdSelectiveGuards) {
        summary = "{summary}Steel in the barracks. "
    }
    if (householdSelenaBribe) {
        summary = "{summary}Gold in the market. "
    }
    if (householdShelteredConfessor || householdChurchDeal) {
        summary = "{summary}Prayer in the cloister. "
    }
    if (length(summary) == 0) {
        return "Your Majesty, my post is your door — not the yard below. Varn sent prisoners here, Osric's audit named clerks, and Arvel's gate still shelters whispers unless you forbade it. The stair asks a simpler question: who do I turn away when the palace is full of Edwin's names?"
    }
    return "Your Majesty, my post is your door — not the yard below. Yet Varn sent prisoners here, Osric's audit named clerks, and Arvel's gate still shelters whispers unless you forbade it. I saw {summary}The stair asks a simpler question: who do I turn away when the palace is full of Edwin's names?"
}


def build_household_raena_prompt() : string {
    if (is_russian()) {
        return "Ваше Величество, мой пост — ваша дверь, не двор внизу. Варн прислал пленных, аудит Осрика назвал писцов, у ворот Арвела до сих пор шепчут — если вы не запретили. Лестница спрашивает проще: кого не пускать, когда дворец полон имён Эдвина?"
    }
    var msg = "Your Majesty, my post is your door — not the yard below. Yet Varn sent prisoners here, Osric's audit named clerks, and Arvel's gate still shelters whispers unless you forbade it. "
    if (householdKeptGromm) {
        msg = "{msg}You showed mercy in the kitchens. "
    }
    if (householdPurgedGuards) {
        msg = "{msg}You showed steel in the barracks. "
    }
    if (householdShelteredConfessor) {
        msg = "{msg}You sheltered prayer in the cloister. "
    }
    return "{msg}The stair asks a simpler question: who do I turn away when the palace is full of Edwin's names?"
}


def build_household_prompt(beatIdx : int) : string {
    if (beatIdx == 0) {
        return build_household_gromm_prompt()
    }
    if (beatIdx == 1) {
        return build_household_varn_prompt()
    }
    if (beatIdx == 2) {
        return build_household_osric_prompt()
    }
    if (beatIdx == 3) {
        return build_household_arvel_prompt()
    }
    if (beatIdx == 4) {
        return build_household_selena_prompt()
    }
    if (beatIdx == 5) {
        return build_household_orm_prompt()
    }
    if (beatIdx == 6) {
        return build_household_raena_prompt()
    }
    return ""
}

'''

RESOLVER = '''
def public resolve_arc_dynamic_prompt(arcId : int; beatIdx : int; nodeIdx : int) : string {
    if (nodeIdx != 0) {
        return ""
    }
    if (arcId == ARC_NORTHERN_PRICE) {
        return build_northern_prompt(beatIdx)
    }
    if (arcId == ARC_HOUSEHOLD) {
        return build_household_prompt(beatIdx)
    }
    if (arcId == ARC_TAPESTRY) {
        return build_tapestry_prompt(beatIdx)
    }
    if (arcId == ARC_EMPTY_PURSE) {
        return build_purse_prompt(beatIdx)
    }
    if (arcId == ARC_HUNGRY_SEASON) {
        return build_hungry_prompt(beatIdx)
    }
    if (arcId == ARC_GUILD_COMPACT) {
        return build_guild_prompt(beatIdx)
    }
    if (arcId == ARC_CHURCH_CROWN) {
        return build_church_prompt(beatIdx)
    }
    if (arcId == ARC_GREAT_HOUSES) {
        return build_houses_prompt(beatIdx)
    }
    if (arcId == ARC_SCAFFOLD_LEDGER) {
        return build_scaffold_prompt(beatIdx)
    }
    if (arcId == ARC_STAR_CHAMBER) {
        return build_star_prompt(beatIdx)
    }
    if (arcId == ARC_PROPHET_WINTER) {
        return build_prophet_prompt(beatIdx)
    }
    if (arcId == ARC_COURT_KNIVES) {
        return build_knives_prompt(beatIdx)
    }
    if (arcId == ARC_NEPHEW_FOG) {
        return build_nephew_prompt(beatIdx)
    }
    if (arcId == ARC_PLAGUE_CURE) {
        return build_plague_prompt(beatIdx)
    }
    return ""
}

'''

# Fix broken household builders that used invalid Python f-string syntax in DAS output
HOUSEHOLD_BUILDERS = HOUSEHOLD_BUILDERS.replace('var grommPart', '// parts built inline - see build_household_osric_prompt')

def main() -> None:
    # Read supplemental builders from separate file if present
    supplemental = ROOT / "tools" / "_arc_prompts_supplement.das.inc"
    sup_text = supplemental.read_text(encoding="utf-8") if supplemental.exists() else ""

    content = HEADER + NORTHERN_BUILDERS + HOUSEHOLD_BUILDERS + sup_text + RESOLVER
    OUT.write_text(content, encoding="utf-8", newline="\n")
    print(f"Wrote {OUT} ({len(content)} bytes)")


if __name__ == "__main__":
    main()

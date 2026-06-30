require engine.core
require constants
require dialogue_types
require arc_state
require localization public


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
        choiceCount = clamp_choice_count(base.choiceCount),
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


def build_household_gromm_prompt_en() : string {
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "Your Majesty, the nobles await your first royal feast — and the kitchens still hold Edwin's names. You told Edric you would scour his household. If I lay a lord's table while you purge his servants, the court will read your stomach before your sword. How do you mean to feast?"
    }
    if (householdStance == HOUSEHOLD_STANCE_INTEGRATE) {
        return "Your Majesty, the nobles await your first royal feast. You said you would keep those who kneel — my ovens still know Edwin's recipes. If I set the table as tradition demands, the city granaries will grow thin. How do you mean to feast?"
    }
    if (householdStance == HOUSEHOLD_STANCE_IGNORE) {
        return "Your Majesty, the nobles await your first royal feast. You chose to let the dead king keep his ghosts — but ghosts still expect bread at a coronation table. If I cook as Edwin did, the granaries will suffer. How do you mean to feast?"
    }
    if (householdStance == HOUSEHOLD_STANCE_SELECTIVE) {
        return "Your Majesty, the nobles await your first royal feast. You promised justice for the guilty and mercy for the innocent — the kitchen wonders which category feeds lords tonight. If I set the table as tradition demands, the city granaries will grow thin. How do you mean to feast?"
    }
    return "Your Majesty, the nobles await your first royal feast. If I set the table as tradition demands, the city granaries will grow thin."
}


def build_household_gromm_prompt_ru() : string {
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "Ваше Величество, знать ждёт первого королевского пира — а на кухне до сих пор имена Эдвина. Вы сказали Эдрику, что вычистите его дом. Если я накрою стол для лордов, пока вы гоните слуг, двор прочтёт ваш желудок раньше меча. Как вы намерены пировать?"
    }
    if (householdStance == HOUSEHOLD_STANCE_INTEGRATE) {
        return "Ваше Величество, знать ждёт первого королевского пира. Вы сказали — оставить тех, кто преклонит колено; мои печи всё ещё знают рецепты Эдвина. Если накрою стол как положено, городские амбары похудеют. Как вы намерены пировать?"
    }
    if (householdStance == HOUSEHOLD_STANCE_IGNORE) {
        return "Ваше Величество, знать ждёт первого королевского пира. Вы решили оставить призраков мёртвого короля — но призраки тоже ждут хлеба за столом коронации. Если готовить как при Эдвине, амбары пострадают. Как вы намерены пировать?"
    }
    if (householdStance == HOUSEHOLD_STANCE_SELECTIVE) {
        return "Ваше Величество, знать ждёт первого королевского пира. Вы обещали казнь виновным и милость невинным — кухня гадает, к какой категории отнесут лордов сегодня. Если накрою стол как положено, амбары похудеют. Как вы намерены пировать?"
    }
    return "Ваше Величество, знать ждёт первого королевского пира. Но если я накрою стол как положено, городские амбары похудеют."
}


def build_household_gromm_prompt() : string {
    if (is_russian()) {
        return build_household_gromm_prompt_ru()
    }
    return build_household_gromm_prompt_en()
}


def build_household_varn_prompt_en() : string {
    if (householdFeastChoice == 0 || householdFeastChoice == 4) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. I heard you fed the nobles while the granaries groaned — my men want to know if old swords get the same feast, or only old spoons at a lord's table. Give me an order before they give themselves one."
    }
    if (householdFeastChoice == 2 || householdFeastChoice == 5) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. I heard you canceled the feast and sent bread below — my men want to know if old swords get the same mercy, or only hungry mouths in the square. Give me an order before they give themselves one."
    }
    if (householdFeastChoice == 3) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. I heard you tricked the nobles with sauce and cheap meat — my men want to know if old swords get the same cunning, or only the kitchens. Give me an order before they give themselves one."
    }
    if (householdKeptGromm && householdWatchedGromm) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. You kept Gromm under watch in the kitchens — my men want to know if old swords get the same mercy, or only old spoons watched by witnesses. Give me an order before they give themselves one."
    }
    if (householdKeptGromm) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. You kept Gromm in the kitchens — my men want to know if old swords get the same mercy, or only old spoons. Give me an order before they give themselves one."
    }
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. You told Edric you would scour the household — my men want to know if that includes them. Give me an order before they give themselves one."
    }
    return "Your Majesty, twelve of my palace guard still wear Edwin's token under their breastplate. My men want to know if old swords get the same mercy you showed at the first feast. Give me an order before they give themselves one."
}


def build_household_varn_prompt_ru() : string {
    if (householdFeastChoice == 0 || householdFeastChoice == 4) {
        return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Я слышал — вы накормили знать, пока амбары стонали. Мои люди хотят знать: достанется ли старым мечам тот же пир, что ложкам за лордским столом. Приказ — прежде чем они прикажут сами."
    }
    if (householdFeastChoice == 2 || householdFeastChoice == 5) {
        return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Я слышал — вы отменили пир и послали хлеб вниз. Мои люди хотят знать: достанется ли старым мечам та же милость, что голодным на площади. Приказ — прежде чем они прикажут сами."
    }
    if (householdFeastChoice == 3) {
        return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Я слышал — вы обманули знать соусом и дешёвым мясом. Мои люди хотят знать: достанется ли старым мечам та же хитрость, что кухне. Приказ — прежде чем они прикажут сами."
    }
    if (householdKeptGromm) {
        return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Вы оставили Громма на кухне — мои люди хотят знать, достанется ли старым мечам та же милость, что ложкам. Приказ — прежде чем они прикажут сами."
    }
    return "Ваше Величество, двенадцать моих дворцовых стражей до сих пор носят жетон Эдвина под нагрудником. Мои люди хотят знать, достанется ли старым мечам та же милость, что на первом пиру. Приказ — прежде чем они прикажут сами."
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

// Tapestry, purse, hungry, guild, church, houses, scaffold, star, prophet, knives, nephew, plague builders
// Included by generate_arc_prompts.py into arc_prompts.das (not compiled by EdenSpark)

let PURSE_OUTCOME_PAID_CROWN = 1
let PURSE_OUTCOME_MERCENARY_THRONE = 2
let PURSE_OUTCOME_MUTINY_AVOIDED = 3
let PURSE_OUTCOME_SOLD_SWORD = 4
let PURSE_OUTCOME_GHOST_ARMY = 5

let CHURCH_STANCE_DEFY = 1


def build_tapestry_prompt(beatIdx : int) : string {
    return ""
}


def purse_gromm_heard_ru() : string {
    if (householdKeptGromm) {
        return "оставили Громма на кухне"
    }
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "вычистили Громма"
    }
    return ""
}


def purse_gromm_heard_en() : string {
    if (householdKeptGromm) {
        return "kept Gromm in the kitchens"
    }
    if (householdStance == HOUSEHOLD_STANCE_PURGE) {
        return "purged Gromm"
    }
    return ""
}


def purse_army_pay_heard_ru() : string {
    if (emptyPurseDay11Choice == 0) {
        return "выплатили половину жалования"
    }
    if (emptyPurseDay11Choice == 1) {
        return "заплатили Рудольфу"
    }
    if (emptyPurseDay11Choice == 2) {
        return "читали проповедь о чести"
    }
    return ""
}


def purse_army_pay_heard_en() : string {
    if (emptyPurseDay11Choice == 0) {
        return "paid half the muster"
    }
    if (emptyPurseDay11Choice == 1) {
        return "paid Rudolf in full"
    }
    if (emptyPurseDay11Choice == 2) {
        return "preached honor over coin"
    }
    return ""
}


def purse_join_heard_ru(a : string; b : string) : string {
    if (length(a) > 0 && length(b) > 0) {
        return "Я слышал, что вы {a} и {b}."
    }
    if (length(a) > 0) {
        return "Я слышал, что вы {a}."
    }
    if (length(b) > 0) {
        return "Я слышал, что вы {b}."
    }
    return ""
}


def purse_join_heard_en(a : string; b : string) : string {
    if (length(a) > 0 && length(b) > 0) {
        return "I heard you {a} and {b}."
    }
    if (length(a) > 0) {
        return "I heard you {a}."
    }
    if (length(b) > 0) {
        return "I heard you {b}."
    }
    return ""
}


def build_purse_salt_prompt_ru() : string {
    if (emptyPurseCrisis) {
        return "Ваше Величество, я слышал, что вы говорили армии о чести. Мои книги кормят капитанов. Выбирайте: трон платит золотом или грамотами, пока моё терпение не продастся тому, кто заплатит."
    }
    let payPart = purse_army_pay_heard_ru()
    if (length(payPart) > 0) {
        return "Ваше Величество, клинки, короновавшие вас, были взяты напрокат прежде, чем обагрились кровью. Мой дом финансировал капитанов, открывших ворота. Я слышал, что вы {payPart}. Проповеди я не финансирую. Погасите долг землями короны, налогами или терпением короны. Допустите неуплату — и ваши солдаты узнают, кто на самом деле владеет их капитаном."
    }
    return "Ваше Величество, мой дом оплатил переворот — капитанов у ворот и клинки, что вас короновали. Долг пора вернуть. Не заплатите — и армия узнает, кому на самом деле служит её капитан."
}


def build_purse_salt_prompt_en() : string {
    if (emptyPurseCrisis) {
        return "Your Majesty, I heard you told the army honor feeds them. My ledgers feed captains. Choose whether the throne pays in gold or in deeds before my patience sells to someone who will."
    }
    let payPart = purse_army_pay_heard_en()
    if (length(payPart) > 0) {
        return "Your Majesty, the blades that crowned you were rented before they blooded. My house financed the captains who opened the gates. I heard you {payPart}. I do not finance sermons. Repay in crown lands, taxes, or crown patience. Default — and your soldiers learn who truly owns their captain."
    }
    return "Your Majesty, my house paid for the coup — the captains at the gates and the blades that crowned you. The debt is due. Fail to pay — and the army learns who truly commands its captains."
}


def build_purse_finn_prompt_ru() : string {
    let opening = "Ваше Величество, я дезертировал из третьей роты Эдвина за неделю до вашего переворота — и на ваш не вернулся. Сорок человек прячутся в южных холмах, потому что казначей забыл о них дважды."
    if (householdPurgedGuards) {
        return "{opening} Я слышал, что вы вычистили дворцовую стражу. Люди с холмов думают, что вы вычистите и нас следующими. Предложите монету или могилы — для голодных дезертиров средний путь не работает."
    }
    let heard = purse_join_heard_ru(purse_gromm_heard_ru(), purse_army_pay_heard_ru())
    if (length(heard) > 0) {
        return "{opening} {heard} Мы задаём более простые вопросы: амнистия, монета или верёвка?"
    }
    return "{opening} Мы задаём более простые вопросы: амнистия, монета или верёвка?"
}


def build_purse_finn_prompt_en() : string {
    let opening = "Your Majesty, I deserted Edwin's third company the week before your coup — and I did not return for yours. Forty men hide in the southern hills because the paymaster forgot them twice."
    if (householdPurgedGuards) {
        return "{opening} I heard you purged the palace guard. Hillside men think you will purge us next. Offer coin or offer graves — middle paths fail with hungry deserters."
    }
    let heard = purse_join_heard_en(purse_gromm_heard_en(), purse_army_pay_heard_en())
    if (length(heard) > 0) {
        return "{opening} {heard} We ask simpler questions: forgiveness, coin, or rope?"
    }
    return "{opening} We ask simpler questions: forgiveness, coin, or rope?"
}


def purse_borvin_pay_heard_ru() : string {
    if (emptyPurseDay11Choice == 0) {
        return "выплатили солдатам"
    }
    if (emptyPurseDay11Choice == 1) {
        return "заплатили солдатам"
    }
    if (emptyPurseDay11Choice == 2) {
        return "кормили их честью"
    }
    return ""
}


def purse_borvin_pay_heard_en() : string {
    if (emptyPurseDay11Choice == 0) {
        return "paid soldiers"
    }
    if (emptyPurseDay11Choice == 1) {
        return "paid soldiers in full"
    }
    if (emptyPurseDay11Choice == 2) {
        return "fed them honor"
    }
    return ""
}


def build_purse_borvin_prompt_ru() : string {
    if (emptyPurseSaltLoan) {
        return "Ваше Величество, проценты Солта съели поступления этой недели прежде, чем пришёл налог на зерно. Я слышал, вы заняли, чтобы утихомирить казармы. Двор ест объедки. Армия по-прежнему ждёт."
    }
    let payPart = purse_borvin_pay_heard_ru()
    if (length(payPart) > 0) {
        return "Ваше Величество, на казну давят сразу три долга: Солту за переворот, Рудольфу за смотр и расходы ведомств Эдвина — Осрик до сих пор расписывается за покойного. Я слышал, что вы {payPart}. Церковный налог Малрика ещё не собран — а зима близко. Откуда платить в первую очередь: из армейского жалования, с двора или из королевских резервов?"
    }
    return "Ваше Величество, на казну давят сразу три долга: Солту за переворот, Рудольфу за смотр и расходы ведомств Эдвина — Осрик до сих пор расписывается за покойного. Церковный налог Малрика ещё не собран — а зима близко. Откуда платить в первую очередь: из армейского жалования, с двора или из королевских резервов?"
}


def build_purse_borvin_prompt_en() : string {
    if (emptyPurseSaltLoan) {
        return "Your Majesty, Salt's interest ate this week's receipts before the grain tax arrived. I heard you borrowed to quiet the barracks. The court eats scraps. The army still waits."
    }
    let payPart = purse_borvin_pay_heard_en()
    if (length(payPart) > 0) {
        return "Your Majesty, three ledgers scream at once: Salt's coup debt, Rudolf's muster, and Edwin's ghost offices Osric still signs. I heard you {payPart}. Malrik's church tax has not yet arrived — but winter will. Which purse empties first: army, court, or crown reserves?"
    }
    return "Your Majesty, three ledgers scream at once: Salt's coup debt, Rudolf's muster, and Edwin's ghost offices Osric still signs. Malrik's church tax has not yet arrived — but winter will. Which purse empties first: army, court, or crown reserves?"
}


def purse_borvin_choice_heard_ru() : string {
    if (emptyPurseBorvinChoice == 0) {
        return "сначала кормили армию"
    }
    if (emptyPurseBorvinChoice == 1) {
        return "делили боль между тремя книгами"
    }
    if (emptyPurseBorvinChoice == 2) {
        return "держали резервы"
    }
    return ""
}


def purse_borvin_choice_heard_en() : string {
    if (emptyPurseBorvinChoice == 0) {
        return "fed the army first"
    }
    if (emptyPurseBorvinChoice == 1) {
        return "split the pain three ways"
    }
    if (emptyPurseBorvinChoice == 2) {
        return "held the reserves"
    }
    return ""
}


def purse_finn_choice_heard_ru() : string {
    if (emptyPurseFinnAmnesty) {
        return "укрыли дезертиров с холмов"
    }
    if (emptyPurseFinnChoice == 1) {
        return "откупились от дезертиров"
    }
    if (emptyPurseFinnChoice == 2) {
        return "охотились на дезертиров"
    }
    return ""
}


def purse_finn_choice_heard_en() : string {
    if (emptyPurseFinnAmnesty) {
        return "sheltered the hillside deserters"
    }
    if (emptyPurseFinnChoice == 1) {
        return "paid the deserters off"
    }
    if (emptyPurseFinnChoice == 2) {
        return "hunted the deserters"
    }
    return ""
}


def purse_church_heard_ru() : string {
    if (churchArcPhase >= 1 && churchArcStance == CHURCH_STANCE_DEFY) {
        return "бросили вызов Малрику"
    }
    if (churchArcPhase >= 1 && churchArcStance == 0) {
        return "преклонили колено перед Малриком"
    }
    return ""
}


def purse_church_heard_en() : string {
    if (churchArcPhase >= 1 && churchArcStance == CHURCH_STANCE_DEFY) {
        return "defied Malrik"
    }
    if (churchArcPhase >= 1 && churchArcStance == 0) {
        return "knelt to Malrik"
    }
    return ""
}


def build_purse_rudolf_march_prompt_ru() : string {
    if (churchArcPhase >= 1 && churchArcStance == CHURCH_STANCE_DEFY) {
        return "Ваше Величество, я слышал, что вы плюнули в Малрика, пока Борвин морил казармы голодом. Мои люди думают, что небо и казначейство сговорились против них. Разбирайтесь с одним врагом за раз — начиная с монеты."
    }
    if (emptyPurseFinnAmnesty) {
        return "Ваше Величество, я слышал, что вы амнистировали людей Финна с холмов. Хорошая сталь — плохой пример. Ветераны спрашивают, почему дезертиры едят прежде лоялистов."
    }
    let borvinPart = purse_borvin_choice_heard_ru()
    let finnPart = purse_finn_choice_heard_ru()
    let churchPart = purse_church_heard_ru()
    var heard = ""
    if (length(borvinPart) > 0) {
        heard = borvinPart
    }
    if (length(finnPart) > 0) {
        if (length(heard) > 0) {
            heard = "{heard}, {finnPart}"
        } else {
            heard = finnPart
        }
    }
    if (length(churchPart) > 0) {
        if (length(heard) > 0) {
            heard = "{heard} и {churchPart}"
        } else {
            heard = churchPart
        }
    }
    if (length(heard) > 0) {
        return "Ваше Величество, две роты складывают телеги у нижних ворот — не уходить, клянутся они, но напомнить, что могли бы. Я слышал, что вы {heard} — и всё это за одну неделю. Солдаты слушают священников, когда жалованье — молчание. Платите, наказывайте или устраивайте смотр."
    }
    return "Ваше Величество, две роты складывают телеги у нижних ворот — не уходить, клянутся они, но напомнить, что могли бы. Солдаты слушают священников, когда жалованье — молчание. Платите, наказывайте или устраивайте смотр."
}


def build_purse_rudolf_march_prompt_en() : string {
    if (churchArcPhase >= 1 && churchArcStance == CHURCH_STANCE_DEFY) {
        return "Your Majesty, I heard you spat at Malrik while Borvin starved the barracks. My men think heaven and the treasury conspired against them. Fix one enemy at a time — starting with coin."
    }
    if (emptyPurseFinnAmnesty) {
        return "Your Majesty, I heard you amnestied Finn's hills. Good steel — bad example. Veterans ask why deserters eat before loyalists."
    }
    let borvinPart = purse_borvin_choice_heard_en()
    let finnPart = purse_finn_choice_heard_en()
    let churchPart = purse_church_heard_en()
    var heard = ""
    if (length(borvinPart) > 0) {
        heard = borvinPart
    }
    if (length(finnPart) > 0) {
        if (length(heard) > 0) {
            heard = "{heard}, {finnPart}"
        } else {
            heard = finnPart
        }
    }
    if (length(churchPart) > 0) {
        if (length(heard) > 0) {
            heard = "{heard}, and {churchPart}"
        } else {
            heard = churchPart
        }
    }
    if (length(heard) > 0) {
        return "Your Majesty, two companies stack wagons at the lower gate — not to leave, they swear, but to remind you they could. I heard you {heard} — all in one fortnight. Soldiers listen to priests when pay is silence. Pay, punish, or parade."
    }
    return "Your Majesty, two companies stack wagons at the lower gate — not to leave, they swear, but to remind you they could. Soldiers listen to priests when pay is silence. Pay, punish, or parade."
}


def build_purse_kara_prompt_ru() : string {
    if (emptyPurseSaltLoan) {
        return "Ваше Величество, Солт шепнул мне о вашем долге, прежде чем я добралась до ворот. Наёмники оценивают коронные активы по платёжеспособности. Я слышала: вы должны и банкирам, и солдатам. Кому выставить счёт, когда трон не заплатит?"
    }
    return "Ваше Величество, моя рота сопровождает зерно — когда зерно платит. Рудольф хочет контракт с короной. Солт хочет залог. Я слышала, что ваш кошелёк каждую неделю пустеет чуть больше. Наймите нас на счёт трона, позвольте нам продаться тому, кто платит сегодня, или захватите наши телеги и молитесь, чтобы неоплаченные люди воевали задаром."
}


def build_purse_kara_prompt_en() : string {
    if (emptyPurseSaltLoan) {
        return "Your Majesty, Salt whispered your debt before I reached the gate. Mercenaries price crowns by ability to pay. I heard you owe bankers and soldiers both. Who do I bill when the throne defaults?"
    }
    return "Your Majesty, my company escorts grain — when grain pays. Rudolf wants a crown contract. Salt wants collateral. I heard your purse rattles emptier each week. Hire us on the throne's tab, let us sell to whoever pays today, or seize our wagons and pray unpaid men fight for free."
}


def build_purse_otto_prompt_ru() : string {
    if (armyPayTrust <= -20) {
        return "Ваше Величество, казармы пьют ваше здоровье с уксусом. Я слышал: неоплаченная сталь. Моя клятва не требует нищеты. Платите или отпустите меня, пока молчание не стало союзом с тем, кто заплатит."
    }
    return "Ваше Величество, я клялся Эдвину как рыцарь его двора — а вы сидите в кресле Эдвина. Я не произносил речей при дворе с ночи переворота, потому что речи стоят монеты, которой мне не платили. Я слышал, что ваша армия ворчит, ваш банкир считает, ваш наёмник торгуется. Моё молчание — не верность. Это арифметика. Обещайте мне жалованье или дайте отставку."
}


def build_purse_otto_prompt_en() : string {
    if (armyPayTrust <= -20) {
        return "Your Majesty, the barracks drink your health with vinegar. I heard unpaid steel. My oath does not require poverty. Pay me or release me before silence becomes an alliance with whoever pays."
    }
    return "Your Majesty, I swore to Edwin as a knight of his court — and you sit in Edwin's chair. I have not spoken at court since the night of the coup, because speeches cost coin I was never paid. I heard your army grumbles, your banker counts, your mercenary bargains. My silence is not loyalty. It is arithmetic. Promise me wages or grant me release."
}


def build_purse_finale_prompt_ru() : string {
    if (purseOutcome == PURSE_OUTCOME_MERCENARY_THRONE) {
        return "Ваше Величество, я слышал монету Кары у вашей двери и честь короны в счётной палате. Верные роты наблюдают, как наёмники едят первыми. Мои люди повинуются — пока — потому что вы купили сталь, которую не вырастили. Королевство называет это прагматизмом. Двор называет это предупреждением."
    }
    if (purseOutcome == PURSE_OUTCOME_MUTINY_AVOIDED) {
        return "Ваше Величество, я слышал голод, прощение, обещания и один марш, которого не было. Вы не купили преданность — вы купили время. Казармы ворчат, но телеги не складывают. Называйте это выживанием. Солдаты так и делают."
    }
    if (purseOutcome == PURSE_OUTCOME_SOLD_SWORD) {
        return "Ваше Величество, я слышал молчание Отто и речи о славе с трона. Честь без жалованья — проповедь, не армия. Рыцари служат, потому что обязаны, не потому что верят. Следующий кредитор может перебить вас шёпотом."
    }
    if (purseOutcome == PURSE_OUTCOME_GHOST_ARMY) {
        return "Ваше Величество, я слышал: неоплаченная сталь, захваченные телеги, повешенные капитаны, пустые сундуки. Роты высчитывают быстрее, чем вы считаете. Дезертирство стало политикой — не преступлением. Трон у вас ещё есть. Войска к весне — возможно, нет."
    }
    return "Ваше Величество, пятьдесят четыре дня прошло со смотра без монеты — и люди по-прежнему откликаются на ваш зов. Я слышал: Солт выплачен, Отто присягнул, телеги профинансированы, дезертиры осуждены. Казармы называют вас королём, который платит, когда это больно. Это редкость — редкость большая, чем храбрость. Берегите её."
}


def build_purse_finale_prompt_en() : string {
    if (purseOutcome == PURSE_OUTCOME_MERCENARY_THRONE) {
        return "Your Majesty, I heard Kara's coin at your door and crown honor in the counting house. Loyal companies watch mercenaries eat first. My men obey — for now — because you bought steel you did not grow. The realm calls it pragmatism. The court calls it a warning."
    }
    if (purseOutcome == PURSE_OUTCOME_MUTINY_AVOIDED) {
        return "Your Majesty, I heard hunger, forgiveness, promises, and one march that never came. You did not buy loyalty — you bought time. The barracks grumble, but wagons stay stacked. Call it survival. Soldiers do."
    }
    if (purseOutcome == PURSE_OUTCOME_SOLD_SWORD) {
        return "Your Majesty, I heard Otto's silence and throne speeches about glory. Honor without wages is a sermon, not an army. Knights serve because they must, not because they believe. The next creditor may outbid you with a whisper."
    }
    if (purseOutcome == PURSE_OUTCOME_GHOST_ARMY) {
        return "Your Majesty, I heard unpaid steel, seized wagons, hanged captains, empty chests. Companies calculate faster than you do. Desertion became policy — not crime. You still hold the throne. The army by spring — perhaps not."
    }
    return "Your Majesty, fifty-four days since the muster without coin — and men still answer your call. I heard Salt paid, Otto sworn, wagons funded, deserters condemned. The barracks call you a king who pays when it hurts. That is rarer than courage. Guard it."
}


def build_purse_prompt(beatIdx : int) : string {
    if (beatIdx == 1) {
        if (is_russian()) {
            return build_purse_salt_prompt_ru()
        }
        return build_purse_salt_prompt_en()
    }
    if (beatIdx == 2) {
        if (is_russian()) {
            return build_purse_finn_prompt_ru()
        }
        return build_purse_finn_prompt_en()
    }
    if (beatIdx == 3) {
        if (is_russian()) {
            return build_purse_borvin_prompt_ru()
        }
        return build_purse_borvin_prompt_en()
    }
    if (beatIdx == 4) {
        if (is_russian()) {
            return build_purse_rudolf_march_prompt_ru()
        }
        return build_purse_rudolf_march_prompt_en()
    }
    if (beatIdx == 5) {
        if (is_russian()) {
            return build_purse_kara_prompt_ru()
        }
        return build_purse_kara_prompt_en()
    }
    if (beatIdx == 6) {
        if (is_russian()) {
            return build_purse_otto_prompt_ru()
        }
        return build_purse_otto_prompt_en()
    }
    if (beatIdx == 7) {
        if (is_russian()) {
            return build_purse_finale_prompt_ru()
        }
        return build_purse_finale_prompt_en()
    }
    return ""
}


def build_hungry_prompt(beatIdx : int) : string {
    return ""
}


def build_guild_prompt(beatIdx : int) : string {
    return ""
}


def build_church_prompt(beatIdx : int) : string {
    return ""
}


def build_church_beat0_node1_prompt_en() : string {
    if (churchArcStance == 0) {
        return "Your Majesty, you asked for blessing. Then hear the price: church tax flows to God's house before yours, and my scribes copy your decrees only after my seal. I heard humility from your lips. The realm will hear ownership from mine."
    }
    if (churchArcStance == CHURCH_STANCE_DEFY) {
        return "Your Majesty, you demanded recognition as if heaven were a barracks. I heard steel in your voice. Steel does not consecrate. My scribes already draft a second sermon — for the day your guards cross themselves and step aside."
    }
    return ""
}


def build_church_beat0_node1_prompt_ru() : string {
    if (churchArcStance == 0) {
        return "Ваше Величество, вы просили благословения. Тогда выслушайте цену: церковный налог течёт в Дом Господень прежде вашего, а мои писцы переписывают ваши указы лишь после моей печати. Я слышал смирение с ваших уст. Держава услышит владение с моих."
    }
    if (churchArcStance == CHURCH_STANCE_DEFY) {
        return "Ваше Величество, вы требовали признания, точно небо — казарма. Я слышал сталь в вашем голосе. Сталь не освящает. Мои писцы уже составляют вторую проповедь — на тот день, когда ваши стражники перекрестятся и отступят."
    }
    return ""
}


def build_church_beat0_node1_prompt() : string {
    if (is_russian()) {
        return build_church_beat0_node1_prompt_ru()
    }
    return build_church_beat0_node1_prompt_en()
}


def build_houses_prompt(beatIdx : int) : string {
    return ""
}


def build_scaffold_prompt(beatIdx : int) : string {
    return ""
}


def build_star_prompt(beatIdx : int) : string {
    return ""
}


def build_prophet_prompt(beatIdx : int) : string {
    return ""
}


def build_knives_prompt(beatIdx : int) : string {
    return ""
}


def build_nephew_prompt(beatIdx : int) : string {
    return ""
}


def build_plague_prompt(beatIdx : int) : string {
    return ""
}

def public resolve_arc_dynamic_prompt(arcId : int; beatIdx : int; nodeIdx : int) : string {
    if (arcId == ARC_CHURCH_CROWN && beatIdx == 0 && nodeIdx == 1) {
        return build_church_beat0_node1_prompt()
    }
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


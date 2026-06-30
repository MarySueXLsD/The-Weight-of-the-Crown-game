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
        return "выплатили половину мустера"
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
    return "Ваше Величество, пятьдесят четыре дня прошло с мустера без монеты — и люди по-прежнему откликаются на ваш зов. Я слышал: Солт выплачен, Отто присягнул, телеги профинансированы, дезертиры осуждены. Казармы называют вас королём, который платит, когда это больно. Это редкость — редкость большая, чем храбрость. Берегите её."
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

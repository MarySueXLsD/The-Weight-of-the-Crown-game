require engine.core
require constants
require game_state


module localization public


def public is_russian() : bool {
    return settingsLanguageIdx == 1
}


def public loc(en : string; ru : string) : string {
    if (is_russian()) {
        return ru
    }
    return en
}


def public day_word(count : int) : string {
    if (!is_russian()) {
        return (count == 1) ? "day" : "days"
    }
    let n = abs(count) % 100
    let n1 = n % 10
    if (n > 10 && n < 20) {
        return "дней"
    }
    if (n1 == 1) {
        return "день"
    }
    if (n1 >= 2 && n1 <= 4) {
        return "дня"
    }
    return "дней"
}


def public default_nickname() : string {
    return loc("The Usurper", "Узурпатор")
}


def public nickname_saint() : string {
    return loc("The Saint", "Святоша")
}


def public nickname_demander() : string {
    return loc("The Demander", "Требователь")
}


def public is_default_nickname(nick : string) : bool {
    return nick == "The Feeble" || nick == "Слабак" || nick == "The Usurper" || nick == "Узурпатор"
}


def public is_auto_localized_nickname(nick : string) : bool {
    return is_default_nickname(nick) || nick == "The Saint" || nick == "Святоша" || nick == "The Demander" || nick == "Требователь"
}


def public same_visitor_bridge_text() : string {
    return loc("And one more thing...", "И ещё кое-что...")
}


// UI - main menu

def public menu_continue() : string {
    return loc("Continue", "Продолжить")
}


def public menu_new_game() : string {
    return loc("New Game", "Новая игра")
}


def public menu_options() : string {
    return loc("Options", "Настройки")
}


def public menu_about() : string {
    return loc("About", "Об игре")
}


def public menu_exit() : string {
    return loc("Exit", "Выход")
}


def public menu_pause() : string {
    return loc("Pause", "Пауза")
}


def public advisor_bar_button() : string {
    return loc("Advisor >", "Советник >")
}


def public menu_back() : string {
    return loc("Back", "Назад")
}


def public menu_okay() : string {
    return loc("Okay", "Хорошо")
}


def public try_again() : string {
    return loc("Try again", "Попробовать снова")
}


//// UI — options

def public options_title() : string {
    return loc("Options", "Настройки")
}


def public options_master() : string {
    return loc("Master", "Громкость")
}


def public options_music() : string {
    return loc("Music", "Музыка")
}


def public options_language() : string {
    return loc("Language", "Язык")
}


def public options_fullscreen() : string {
    return loc("Fullscreen", "Полный экран")
}


def public options_lang_english() : string {
    return "English"
}


def public options_lang_russian() : string {
    return "Русский"
}


def public options_version() : string {
    return loc("Version {GAME_VERSION}", "Версия {GAME_VERSION}")
}


//// UI — gameplay HUD

def public day_label(day : int) : string {
    return loc("Day {day}", "День {day}")
}


def public likes_label(likes : string) : string {
    return loc("Likes: {likes}", "Нравится: {likes}")
}


def public dislikes_label(dislikes : string) : string {
    return loc("Dislikes: {dislikes}", "Не нравится: {dislikes}")
}


//// UI — death screen

def public death_summary_generic(days : int) : string {
    let dw = day_word(days)
    return loc(
        "You held the throne of Loria for {days} {dw}. The usurper's reign is over.",
        "Вы удерживали трон Лории {days} {dw}. Правление узурпатора окончено."
    )
}


def public death_record_text(recordDays : int) : string {
    let dw = day_word(recordDays)
    return loc(
        "The record for the kings is {recordDays} {dw}.",
        "Рекорд королей — {recordDays} {dw}."
    )
}


//// Intro cutscene

def public cutscene_skip_hint() : string {
    return loc("Hold Right Mouse Button to skip", "Удерживайте ПКМ, чтобы пропустить")
}


let INTRO_DIALOGUE_NAMES_RU : string[INTRO_DIALOGUE_BEAT_COUNT] <- fixed_array(
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Рассказчик",
    "Солдат",
    "Солдат"
)

let INTRO_DIALOGUE_REPLICS_RU : string[INTRO_DIALOGUE_BEAT_COUNT] <- fixed_array(
    "Эстедор не пал за одну ночь.",
    "Он гнил долго, упрямо и с достоинством — как старый дворянин, который умер за столом, но всё еще требует вина.",
    "Король Эдвин называл себя Благочестивым.",
    "Народ называл его Тихим.",
    "Армия — Слепым.",
    "Знать — Удобным.",
    "А те, кто говорил громче, обычно не доживали до утра.",
    "Когда амбары опустели, король приказал считать мешки.",
    "Когда мешков не осталось, приказал считать грехи.",
    "Потом пришла чума.",
    "Она не различала холопа, рыцаря, монаха и сборщика налогов. Чем, справедливости ради, заслужила некоторую народную любовь.",
    "Церковь раскололась.",
    "Одна половина говорила, что бедствия — кара богов. Другая — что кара давно сидит на троне.",
    "Армия три месяца не получала жалованья.",
    "Четвертый месяц она называла себя верной. На пятый начала задавать вопросы.",
    "— За короля я уже голодал.",
    "— Может, за кого-нибудь другого хоть поем?"
)


def public intro_dialogue_name(beat : int) : string {
    if (is_russian()) {
        return INTRO_DIALOGUE_NAMES_RU[beat]
    }
    return INTRO_DIALOGUE_NAMES[beat]
}


def public intro_dialogue_replic(beat : int) : string {
    if (is_russian()) {
        return INTRO_DIALOGUE_REPLICS_RU[beat]
    }
    return INTRO_DIALOGUE_REPLICS[beat]
}


//// Tooltips — months

let MONTH_NAMES_EN : string[12] <- fixed_array(
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
)

let DAYS_IN_MONTH : int[12] <- fixed_array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

let MONTH_NAMES_RU : string[12] <- fixed_array(
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря"
)


let STAT_DISPLAY_NAMES_RU : string[STAT_COUNT] <- fixed_array(
    "Народ",
    "Церковь",
    "Армия",
    "Казна",
    "Здоровье",
    "Верность",
    "Дворянство",
    "Продовольствие",
    "Преемственность"
)


let STAT_DESCRIPTIONS_RU : string[STAT_COUNT] <- fixed_array(
    "Счастье и поддержка простого народа. Если упадёт слишком низко — бунты захлестнут столицу.",
    "Духовенство и вера королевства. Они формируют убеждения народа — и того, кого винят.",
    "Военная мощь и готовность. Слабая армия зовёт захватчиков; разросшаяся — истощает казну.",
    "Золотые запасы короны. Каждый указ имеет цену, а пустая казна завершает правление.",
    "Общественное здоровье по всему королевству. Чума и болезни процветают, когда забывают о лекарях.",
    "Преданность двора и ближайших советников. Предательство ждёт, когда доверие иссякает.",
    "Благосклонность богатой элиты. Их монеты и влияние могут спасти вас — или купить врагов.",
    "Закрома и продовольственные запасы. Голод превращает верных подданных в толпу у ворот дворца.",
    "Стабильность вашей династии. Без ясного наследника каждый лорд начинает готовиться к вашим похоронам."
)


let DAY_PERIOD_DESCRIPTIONS_RU : string[13] <- fixed_array(
    "Разгар лета. Столица гудит от торговцев, просителей и гула нового правления.",
    "Приближается жатва. Крестьяне трудятся в полях, пока двор спорит о налогах и десятинах.",
    "Золотая осень. Дворяне возвращаются из загородных поместий, принося сплетни и интриги в тронный зал.",
    "Первые заморозки. Готовятся к зиме, а бедняки всё настойчивее стучатся во дворцовые ворота.",
    "Середина зимы. Дороги опасны, а отдалённые провинции беспокойны под снегом.",
    "Лютая зима. В большом зале горят костры, а за стенами деревни голодают и молчат.",
    "Позднее зимнее оттепель. Реки полноводны, купцы оживают, а старые обиды всплывают с талой водой.",
    "Ранняя весна. В полях пробуждается рост, а во дворцовых тенях — новые заговоры.",
    "Весеннее цветение. Свадьбы, праздники и заговоры множатся по всему королевству.",
    "Разгар весны. Союзы куются и рвутся, когда торговый сезон вновь открывается.",
    "Раннее лето возвращается. Ещё один виток года — и трон никогда не казался таким наблюдаемым.",
    "Снова середина лета. Ветераны вашего правления шепчут: с каждым сезоном корона давит тяжелее.",
    "Приближается конец года. Триста шестьдесят пять дней, чтобы доказать себя — или погибнуть."
)


let KING_DESCRIPTION_EN = "You seized the throne of Loria in a coup. The old king is dead, his kin plot in exile, and every faction that helped you rise now wants its reward. Rule well — or follow your predecessor to the grave."

let KING_DESCRIPTION_RU = "Вы захватили трон Лории переворотом. Старый король мёртв, его родня интригует в изгнании, и каждая фракция, помогшая вам подняться, хочет свою награду. Правьте мудро — или последуйте за предшественником в могилу."


def public format_calendar_date(day : int) : string {
    var monthIdx : int = CALENDAR_START_MONTH - 1
    var dom : int = CALENDAR_START_DAY + (day - 1)
    while (dom > DAYS_IN_MONTH[monthIdx]) {
        dom -= DAYS_IN_MONTH[monthIdx]
        monthIdx += 1
        if (monthIdx >= 12) {
            monthIdx = 0
        }
    }
    if (is_russian()) {
        return "{dom} {MONTH_NAMES_RU[monthIdx]}"
    }
    return "{dom} {MONTH_NAMES_EN[monthIdx]}"
}


let STAT_DISPLAY_NAMES_EN : string[STAT_COUNT] <- fixed_array(
    "People",
    "Church",
    "Army",
    "Treasury",
    "Health",
    "Loyalty",
    "Nobility",
    "Food",
    "Succession"
)

let STAT_DESCRIPTIONS_EN : string[STAT_COUNT] <- fixed_array(
    "The common folk's happiness and support. Let it fall too low and riots will sweep the capital.",
    "The clergy and faith of the realm. They shape what the people believe — and whom they blame.",
    "Military strength and readiness. A weak army invites invasion; an overgrown one drains the treasury.",
    "The crown's gold reserves. Every decree has a cost, and an empty treasury ends your reign.",
    "Public health across the kingdom. Plague and sickness thrive when hospitals and healers are neglected.",
    "Devotion of your court and closest advisors. Betrayal waits when trust runs dry.",
    "Favour of the wealthy elite. Their coin and influence can save you — or buy your enemies.",
    "Granaries and food supply. Famine turns loyal subjects into a raging mob at the palace gates.",
    "Stability of your royal line. Without a clear heir, every lord begins planning for your funeral."
)

let DAY_PERIOD_DESCRIPTIONS_EN : string[13] <- fixed_array(
    "High summer. The capital buzzes with traders, petitioners, and the hum of a new reign.",
    "Harvest season nears. Peasants toil in the fields while the court debates taxes and tithes.",
    "Golden autumn. Nobles return from country estates, bringing gossip and schemes to the throne room.",
    "The first frost. Winter preparations begin and the poor knock ever louder on palace gates.",
    "Midwinter cold. Roads grow dangerous and distant provinces grow restless under the snow.",
    "Deep winter. Fires burn in the great hall while villages beyond the walls go hungry and quiet.",
    "Late winter thaw. Rivers swell, merchants stir, and old grievances surface with the melt.",
    "Early spring. New growth stirs in the fields and new plots take root in the shadows of court.",
    "Spring bloom. Weddings, festivals, and conspiracies multiply across the kingdom.",
    "High spring. Alliances are forged and broken as the trading season opens once more.",
    "Early summer returns. Another turning of the year — and the throne has never felt so watched.",
    "Midsummer again. Veterans of your reign whisper that the crown sits heavier with each season.",
    "The year's end approaches. Three hundred and sixty-five days to prove yourself — or perish."
)


def public stat_display_name(statIdx : int) : string {
    if (is_russian()) {
        return STAT_DISPLAY_NAMES_RU[statIdx]
    }
    return STAT_DISPLAY_NAMES_EN[statIdx]
}


def public stat_description(statIdx : int) : string {
    if (is_russian()) {
        return STAT_DESCRIPTIONS_RU[statIdx]
    }
    return STAT_DESCRIPTIONS_EN[statIdx]
}


def public stat_tooltip_influences_header() : string {
    return loc("Influences on choices:", "Влияние на решения:")
}


def public stat_tooltip_active_header() : string {
    return loc("Active modifiers:", "Активные модификаторы:")
}


def public stat_tooltip_high_prefix() : string {
    return loc("High (80+):", "Высокий (80+):")
}


def public stat_tooltip_low_prefix() : string {
    return loc("Low (≤20):", "Низкий (≤20):")
}


def public stat_tooltip_crisis_prefix() : string {
    return loc("Crisis (≤10):", "Кризис (≤10):")
}


let STAT_INFLUENCE_BUFF_EN : string[STAT_COUNT] <- fixed_array(
    "Food policy gains bonus Food and People.",
    "Church funding and succession blessings gain bonus Church or Succession.",
    "Army musters and spy work gain bonus Army or Loyalty.",
    "Crown spending costs less Treasury.",
    "Healing decrees and granary openings gain bonus Health or Food.",
    "Court loyalty gains improve; Loyalty losses soften.",
    "Title grants gain bonus Nobility; seizing estates costs less Nobility.",
    "People and Health choices gain bonus when bread is plentiful.",
    "Heir and marriage choices gain bonus Succession or Nobility."
)

let STAT_INFLUENCE_BUFF_RU : string[STAT_COUNT] <- fixed_array(
    "Продовольственная политика даёт бонус к Продовольствию и Народу.",
    "Содержание церкви и благословения наследия дают бонус Церкви или Преемственности.",
    "Сбор армии и шпионаж дают бонус Армии или Верности.",
    "Коронные траты обходятся дешевле в Казне.",
    "Указы о лечении и открытии закромов дают бонус Здоровью или Продовольствию.",
    "Прирост Верности усиливается; потери Верности смягчаются.",
    "Пожалование титулов даёт бонус Дворянству; конфискации бьют по Дворянству слабее.",
    "Решения о Народе и Здоровье получают бонус, когда хлеба в избытке.",
    "Решения о наследнике и браке дают бонус Преемственности или Дворянству."
)

let STAT_INFLUENCE_DEBUFF_EN : string[STAT_COUNT] <- fixed_array(
    "Food policy loses Food; taxing peasants hurts People more.",
    "Refusing the church backfires; prayer for health heals less.",
    "Purges and hunting the nephew hurt People or Succession more.",
    "Paying soldiers and building hospitals cost more Treasury or Health.",
    "Choices that anger the People punish harder.",
    "Spy purges and dismissals hurt People or Nobility more.",
    "Insulting lords hurts Nobility more; court oaths gain less Loyalty.",
    "People choices suffer; Health outcomes worsen when granaries run dry.",
    "Nobility costs rise; betrayal and disloyalty hurt Loyalty more."
)

let STAT_INFLUENCE_DEBUFF_RU : string[STAT_COUNT] <- fixed_array(
    "Продовольственная политика теряет Продовольствие; подати сильнее бьют по Народу.",
    "Отказ церкви бьёт по Церкви; молитвы за здоровье слабее.",
    "Чистки и охота на племянника сильнее бьют по Народу или Преемственности.",
    "Оплата армии и больницы стоят дороже в Казне или Здоровье.",
    "Решения, злящие Народ, наказывают сильнее.",
    "Шпионаж и чистки сильнее бьют по Народу или Дворянству.",
    "Оскорбление лордов сильнее бьёт по Дворянству; присяги дают меньше Верности.",
    "Решения о Народе страдают; исходы для Здоровья хуже при пустых закромах.",
    "Цена Дворянства растёт; предательство сильнее бьёт по Верности."
)

let STAT_ACTIVE_BUFF_EN : string[STAT_COUNT] <- fixed_array(
    "Food choices: up to +2 Food, +1 People.",
    "Church gains: up to +2 Church; blessings: +1 Succession.",
    "Army choices: +1 Army; spy work: +1 Loyalty.",
    "Crown spending: up to +2 Treasury saved.",
    "Health builds: +2 Health; granaries: +1 Food.",
    "Loyalty gains: +1; Loyalty losses softened by 1.",
    "Nobility grants: +2 Nobility; seizures: +1 Nobility saved.",
    "People choices: +1 People; Health builds: +1 Health.",
    "Succession heir: +2 Succession; noble marriages: +1 Nobility."
)

let STAT_ACTIVE_BUFF_RU : string[STAT_COUNT] <- fixed_array(
    "Продовольствие: до +2 Продовольствия, +1 Народ.",
    "Церковь: до +2 Церкви; благословения: +1 Преемственность.",
    "Армия: +1 Армия; шпионаж: +1 Верность.",
    "Траты короны: до +2 сэкономленной Казны.",
    "Здоровье: +2 Здоровье; закрома: +1 Продовольствие.",
    "Верность: +1 к приросту; потери смягчены на 1.",
    "Дворянство: +2 к пожалованиям; конфискации: +1 к сохранению.",
    "Народ: +1 Народ; здоровье: +1 Здоровье.",
    "Наследник: +2 Преемственность; браки: +1 Дворянство."
)

let STAT_ACTIVE_DEBUFF_EN : string[STAT_COUNT] <- fixed_array(
    "Food choices: up to −2 Food; taxes: −1 People.",
    "Church refusal: −2 Church; prayer: −1 Health.",
    "Purges: −2 People; nephew hunt: −2 Succession.",
    "Army pay: +2 Treasury cost; hospitals: −1 Health.",
    "Angering People: −1 extra People loss.",
    "Spy purges: −2 People or Nobility.",
    "Insults: −2 Nobility; court oaths: −1 Loyalty.",
    "People losses: −1 extra; low Food hurts Health choices.",
    "Nobility costs: −1 extra; betrayal: −1 Loyalty."
)

let STAT_ACTIVE_DEBUFF_RU : string[STAT_COUNT] <- fixed_array(
    "Продовольствие: до −2; подати: −1 Народ.",
    "Отказ церкви: −2 Церковь; молитва: −1 Здоровье.",
    "Чистки: −2 Народ; охота на племянника: −2 Преемственность.",
    "Оплата армии: +2 к цене в Казне; больницы: −1 Здоровье.",
    "Гнев народа: −1 доп. потеря Народа.",
    "Шпионаж: −2 Народ или Дворянство.",
    "Оскорбления: −2 Дворянство; присяги: −1 Верность.",
    "Потери Народа: −1 доп.; низкое Продовольствие бьёт по Здоровью.",
    "Цена Дворянства: −1 доп.; предательство: −1 Верность."
)

let STAT_ACTIVE_CRISIS_EN = "Any choice that lowers this stat suffers -1 extra on it."
let STAT_ACTIVE_CRISIS_RU = "Любой выбор, снижающий этот показатель, даёт -1 дополнительно."


def public stat_influence_buff_text(statIdx : int) : string {
    if (is_russian()) {
        return STAT_INFLUENCE_BUFF_RU[statIdx]
    }
    return STAT_INFLUENCE_BUFF_EN[statIdx]
}


def public stat_influence_debuff_text(statIdx : int) : string {
    if (is_russian()) {
        return STAT_INFLUENCE_DEBUFF_RU[statIdx]
    }
    return STAT_INFLUENCE_DEBUFF_EN[statIdx]
}


def public stat_active_buff_text(statIdx : int) : string {
    if (is_russian()) {
        return STAT_ACTIVE_BUFF_RU[statIdx]
    }
    return STAT_ACTIVE_BUFF_EN[statIdx]
}


def public stat_active_debuff_text(statIdx : int) : string {
    if (is_russian()) {
        return STAT_ACTIVE_DEBUFF_RU[statIdx]
    }
    return STAT_ACTIVE_DEBUFF_EN[statIdx]
}


def public stat_active_crisis_text() : string {
    return loc(STAT_ACTIVE_CRISIS_EN, STAT_ACTIVE_CRISIS_RU)
}


def public day_period_description(periodIdx : int) : string {
    if (is_russian()) {
        return DAY_PERIOD_DESCRIPTIONS_RU[periodIdx]
    }
    return DAY_PERIOD_DESCRIPTIONS_EN[periodIdx]
}


def public king_description() : string {
    return loc(KING_DESCRIPTION_EN, KING_DESCRIPTION_RU)
}


def public info_tooltip_title(target : int; nickname : string; day : int; stats : int[STAT_COUNT]) : string {
    if (target == INFO_HOVER_DAY) {
        return loc("Day {day}/{MAX_REIGN_DAYS}", "День {day}/{MAX_REIGN_DAYS}")
    }
    if (target == INFO_HOVER_NICKNAME) {
        return nickname
    }
    if (target >= INFO_HOVER_STAT_BASE && target < INFO_HOVER_STAT_BASE + STAT_COUNT) {
        let statIdx : int = target - INFO_HOVER_STAT_BASE
        return "{stat_display_name(statIdx)}: {stats[statIdx]}/{STAT_MAX}"
    }
    return ""
}


def public info_tooltip_body(target : int; day : int) : string {
    if (target == INFO_HOVER_DAY) {
        let periodIdx : int = day_period_index(day)
        return "{format_calendar_date(day)}\n\n{day_period_description(periodIdx)}"
    }
    if (target == INFO_HOVER_NICKNAME) {
        return king_description()
    }
    if (target >= INFO_HOVER_STAT_BASE && target < INFO_HOVER_STAT_BASE + STAT_COUNT) {
        let statIdx : int = target - INFO_HOVER_STAT_BASE
        return stat_description(statIdx)
    }
    return ""
}


def public day_period_index(day : int) : int {
    let idx : int = (day - 1) / DAY_PERIOD_LENGTH
    return min(idx, 12)
}


//// Advisor panel

def public advisor_panel_title() : string {
    return loc("Advisor", "Советник")
}


def public advisor_confirm_title() : string {
    return loc("Confirm decree", "Подтвердить указ")
}


def public advisor_confirm_yes() : string {
    return loc("Issue decree", "Издать указ")
}


def public advisor_confirm_no() : string {
    return loc("Reconsider", "Передумать")
}


def public advisor_disabled_used_today() : string {
    return loc("One decree per day, my liege.", "Один указ в день, государь.")
}


def public advisor_disabled_cooldown(daysLeft : int) : string {
    return loc("Unavailable for {daysLeft} more {day_word(daysLeft)}.", "Недоступно ещё {daysLeft} {day_word(daysLeft)}.")
}


def public advisor_disabled_not_desperate() : string {
    return loc("Only when the realm is in crisis.", "Только когда держава в кризисе.")
}


def public advisor_disabled_low_stat(statName : string; minValue : int) : string {
    return loc("Requires {statName} of at least {minValue}.", "Требуется {statName} не ниже {minValue}.")
}


def public advisor_disabled_would_defeat() : string {
    return loc("This would end your reign.", "Это положит конец вашему правлению.")
}


def public advisor_disabled_not_idle() : string {
    return loc("Wait until court is clear.", "Подождите, пока двор освободится.")
}


def public advisor_action_response(actionIdx : int) : string {
    if (actionIdx == 0) {
        return loc("Regiments muster in the yards. The treasury groans, but banners rise.", "Полки собираются во дворах. Казна стонет, но знамёна поднимаются.")
    }
    if (actionIdx == 1) {
        return loc("Grain carts roll through the gates. The commons eat — for now.", "Зерновые телеги въезжают во враота. Народ ест — пока что.")
    }
    if (actionIdx == 2) {
        return loc("Physicians tend the sick wards. The capital breathes easier.", "Лекари ухаживают за больными койками. Столица дышит свободнее.")
    }
    if (actionIdx == 3) {
        return loc("The court nods along. Outside the windows, the murmurs do not stop.", "Двор кивает в такт. За окнами шёпот не стихает.")
    }
    if (actionIdx == 4) {
        return loc("New faces fill the halls. Old loyalties smolder in the shadows.", "В залах новые лица. Старые верности тлеют в тени.")
    }
    if (actionIdx == 5) {
        return loc("The ledgers look better. The sick wards do not.", "В книгах стало лучше. В лазаретах — нет.")
    }
    return ""
}


def public format_advisor_action_preview(deltas : int[STAT_COUNT]) : string {
    var result = ""
    var first = true
    for (i in range(STAT_COUNT)) {
        if (deltas[i] == 0) {
            continue
        }
        let sign = (deltas[i] > 0) ? "+" : ""
        let part = "{sign}{deltas[i]} {stat_display_name(i)}"
        if (first) {
            result = part
            first = false
        } else {
            result = "{result} {part}"
        }
    }
    if (first) {
        return loc("No stat changes.", "Без изменений показателей.")
    }
    return result
}

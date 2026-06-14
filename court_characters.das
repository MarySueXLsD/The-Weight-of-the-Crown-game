require engine.core
require constants
require game_state


module court_characters public


let public COURT_PORTRAIT_PATHS : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "static/Portraits/general_rudolf_steeel.png",
    "static/Portraits/bishop_yarmak.png",
    "static/Portraits/treasurer_borvin_copperhand.png",
    "static/Portraits/healer_mira.png",
    "static/Portraits/cook_gromm.png",
    "static/Portraits/colonel_marcus_grey.png",
    "static/Portraits/old_advisor_edric.png",
    "static/Portraits/merchant_selena_ro.png",
    "static/Portraits/executioner_morwen.png",
    "static/Portraits/monk_arvel.png",
    "static/Portraits/ambassador_ingvar.png",
    "static/Portraits/apothecary_sybil.png"
)

let public COURT_BODY_PATHS : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "static/Characters/general_rudolf_steel.png",
    "static/Characters/bishop_yarmak.png",
    "static/Characters/treasurer_borvin_copperhand.png",
    "static/Characters/healer_mira.png",
    "static/Characters/cook_gromm.png",
    "static/Characters/colonel_marcus_grey.png",
    "static/Characters/old_advisor_edric.png",
    "static/Characters/merchant_selena_ro.png",
    "static/Characters/executioner_morwen.png",
    "static/Characters/monk_arvel.png",
    "static/Characters/ambassador_ingvar.png",
    "static/Characters/apothecary_sybil.png"
)

let courtCharacterNames : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "General Rudolf",
    "High Priest Malrik",
    "Treasurer Borvin",
    "Healer Mira",
    "Cook Gromm",
    "Captain Varn",
    "Old Advisor Edric",
    "Merchant Selena",
    "Executioner Morwen",
    "Monk Arvel",
    "Ambassador Ingvar",
    "Apothecary Sivil"
)

let courtCharacterNamesRu : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "Генерал Рудольф",
    "Верховный жрец Малрик",
    "Казначей Борвин",
    "Лекарь Мира",
    "Повар Громм",
    "Капитан Варн",
    "Старый советник Эдрик",
    "Купчиха Селена",
    "Палач Морвен",
    "Монах Арвел",
    "Посол Ингвар",
    "Аптекарь Сивил"
)

let courtCharacterIntros : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "Your Majesty, I am General Rudolf.",
    "Your Majesty, I am High Priest Malrik.",
    "Your Majesty, I am Treasurer Borvin.",
    "Your Majesty, I am Healer Mira.",
    "Your Majesty, I am Gromm, the royal cook.",
    "Your Majesty, I am Captain Varn.",
    "Your Majesty, I am Old Advisor Edric.",
    "Your Majesty, I am Merchant Selena.",
    "Your Majesty, I am Executioner Morwen.",
    "Your Majesty, I am Monk Arvel.",
    "Your Majesty, I am Ambassador Ingvar.",
    "Your Majesty, I am Apothecary Sivil."
)

let courtCharacterIntrosRu : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "Государь, я генерал Рудольф.",
    "Государь, я верховный жрец Малрик.",
    "Государь, я казначей Борвин.",
    "Государь, я лекарь Мира.",
    "Государь, я Громм, королевский повар.",
    "Государь, я капитан Варн.",
    "Государь, я старый советник Эдрик.",
    "Государь, я купчиха Селена.",
    "Государь, я палач Морвен.",
    "Государь, я монах Арвел.",
    "Государь, я посол Ингвар.",
    "Государь, я аптекарь Сивил."
)

let courtCharacterDescriptions : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "The general who led the coup. His soldiers hold your crown — and expect payment.",
    "Head of the faith. He can turn whispers of usurper into prayers for the new king.",
    "Keeper of the royal purse. Empty coffers are his daily confession.",
    "Physician to court and commons. She sees plague before the council does.",
    "Master of the royal kitchens. Every feast he serves steals from the granaries.",
    "Captain of the palace guard. He trusts no face he did not vet himself.",
    "Survivor of three reigns. He speaks softly and remembers everything.",
    "A merchant queen of grain routes. Her caravans feed cities — at a price.",
    "Royal executioner. The prisons are full and the scaffold never rests.",
    "A humble monk who feeds the poor at his monastery gate.",
    "Envoy from the northern princes. Politeness hides sharp questions.",
    "An apothecary who sells bitter cures and knows the price of every herb."
)

let courtCharacterDescriptionsRu : string[COURT_CHARACTER_COUNT] <- fixed_array(
    "Генерал, возглавивший переворот. Его солдаты держат вашу корону — и ждут платы.",
    "Глава веры. Может превратить шёпот об узурпаторе в молитвы за нового короля.",
    "Хранитель королевской казны. Пустые сундуки — его ежедневная исповедь.",
    "Лекарь двора и народа. Видит чуму раньше совета.",
    "Повар королевских кухонь. Каждый пир у него отнимает зерно из амбаров.",
    "Капитан дворцовой стражи. Не доверяет лицам, которых не проверил сам.",
    "Пережил три правления. Говорит тихо и помнит всё.",
    "Купчиха зерновых путей. Её караваны кормят города — за цену.",
    "Королевский палач. Тюрьмы полны, эшафот не простаивает.",
    "Смиренный монах, кормящий бедных у ворот монастыря.",
    "Посланник северных князей. Вежливость скрывает острые вопросы.",
    "Аптекарь, продающий горькие лекарства и знающий цену каждой травы."
)


def public get_court_character_name(idx : int) : string {
    if (idx < 0 || idx >= COURT_CHARACTER_COUNT) {
        return ""
    }
    if (settingsLanguageIdx == 1) {
        return courtCharacterNamesRu[idx]
    }
    return courtCharacterNames[idx]
}


def public get_court_character_intro(idx : int) : string {
    if (idx < 0 || idx >= COURT_CHARACTER_COUNT) {
        return ""
    }
    if (settingsLanguageIdx == 1) {
        return courtCharacterIntrosRu[idx]
    }
    return courtCharacterIntros[idx]
}


def public get_court_character_description(idx : int) : string {
    if (idx < 0 || idx >= COURT_CHARACTER_COUNT) {
        return ""
    }
    if (settingsLanguageIdx == 1) {
        return courtCharacterDescriptionsRu[idx]
    }
    return courtCharacterDescriptions[idx]
}
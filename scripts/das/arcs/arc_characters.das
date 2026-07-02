require engine.core
require scripts/das/core/constants
require scripts/das/gameplay/court_characters
module arc_characters public


// Extended character body paths for arc-only NPCs (indices CHAR_BRAN..CHAR_TALEN)
let arcCharacterBodyPaths : string[16] <- fixed_array(
    "static/Characters/village_elder_bran.png",
    "static/Characters/veteran_orm.png",
    "static/Characters/head_of_guild_fara.png",
    "static/Characters/milers_wife_ruta.png",
    "static/Characters/miner_yarek.png",
    "static/Characters/folk_singer_elina.png",
    "static/Characters/deserter_finn.png",
    "static/Characters/mercenary_kara.png",
    "static/Characters/master_of_the_mint_nerius.png",
    "static/Characters/plague_doctor_odo.png",
    "static/Characters/nameless_prophet.png",
    "static/Characters/astrologer_meribald.png",
    "static/Characters/duke_the_goose.png",
    "static/Characters/lord_raymond_the_landless.png",
    "static/Characters/inquisitor_cyrus.png",
    "static/Characters/talen.png"
)


def public get_arc_character_body_path(charIdx : int) : string {
    if (charIdx >= CHAR_BRAN && charIdx <= CHAR_TALEN) {
        return arcCharacterBodyPaths[charIdx - CHAR_BRAN]
    }
    if (charIdx >= 0 && charIdx < COURT_CHARACTER_COUNT) {
        return COURT_BODY_PATHS[charIdx]
    }
    return COURT_BODY_PATHS[CHAR_EDRIC]
}

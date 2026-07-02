require engine.core
require strings
require scripts/das/core/constants
require scripts/das/core/game_state
require scripts/das/core/layout
require scripts/das/core/dialogue_types
require scripts/das/core/text_utils
require scripts/das/gameplay/questions
require scripts/das/gameplay/court_characters
require scripts/das/gameplay/question_pools
require scripts/das/gameplay/characters
require scripts/das/gameplay/defeat
require scripts/das/gameplay/ashford
require scripts/das/gameplay/edric_opener
require scripts/das/gameplay/stat_synergies
require scripts/das/gameplay/stat_unlocks
require scripts/das/gameplay/stat_unlock_intro
require scripts/das/arcs/arc_engine
require scripts/das/arcs/arc_state
require scripts/das/gameplay/advisor_actions
require scripts/das/localization/localization public
require scripts/das/localization/localization_dialogue public
require scripts/das/core/dialogue_ids
require scripts/das/gameplay/game_save
require scripts/das/ui/ui_state
require scripts/das/ui/ui_flow

module audio public

def public background_music_base_volume() : float {
    if (screenPhase == SCREEN_MAIN_MENU) {
        return BACKGROUND_MUSIC_MENU_VOLUME
    }
    return BACKGROUND_MUSIC_GAME_VOLUME
}



def public background_music_target_volume() : float {
    return background_music_base_volume() * settingsMusicVolume
}



def public load_intro_cutscene_music() {
    if (introCutsceneMusicLoaded) {
        return
    }
    introCutsceneMusicSound = request_sound(INTRO_CUTSCENE_MUSIC_PATH)
    introCutsceneMusicLoaded = true
}



def public should_play_intro_cutscene_music() : bool {
    if (!is_new_game_intro_cutscene_active()) {
        return false
    }
    return introCutscenePhase != INTRO_FADE_OUT && introCutscenePhase != INTRO_UNFADE
}



def public sync_intro_cutscene_music() {
    let wantMusic = should_play_intro_cutscene_music()
    if (wantMusic) {
        if (!introCutsceneMusicDesired) {
            introCutsceneMusicDesired = true
            fade_in_intro_cutscene_music()
        }
    } elif (introCutsceneMusicDesired) {
        introCutsceneMusicDesired = false
        fade_out_intro_cutscene_music()
    }
}



def public load_background_music() {
    if (backgroundMusicLoaded) {
        return
    }
    backgroundMusicSound = request_sound(BACKGROUND_MUSIC_PATH)
    backgroundMusicLoaded = true
}



def public should_play_startup_splash_music() : bool {
    if (startupSplashPhase == SPLASH_FADE_IN_MENU) {
        return true
    }
    if (startupSplashPhase == SPLASH_NONE) {
        return false
    }
    return splash_seconds_until_menu_fade_in() <= SPLASH_MUSIC_BEFORE_MENU
}



def public should_play_background_music() : bool {
    if (is_intro_cutscene_active()) {
        if (is_new_game_intro_cutscene_active() && (introCutscenePhase == INTRO_FADE_OUT || introCutscenePhase == INTRO_UNFADE)) {
            return true
        }
        return false
    }
    if (is_continue_fade_active()) {
        return false
    }
    if (is_startup_splash_active()) {
        return should_play_startup_splash_music()
    }
    return screenPhase == SCREEN_MAIN_MENU || screenPhase == SCREEN_PLAYING
}



def public fade_in_background_music() {
    load_background_music()
    if (!valid(backgroundMusicHandle) || !is_playing(backgroundMusicHandle)) {
        backgroundMusicHandle = play_sound_loop(backgroundMusicSound)
        set_volume(backgroundMusicHandle, 0.0, 0.0)
    }
    set_volume(backgroundMusicHandle, background_music_target_volume(), BACKGROUND_MUSIC_FADE_DURATION)
}



def public fade_out_background_music() {
    if (!valid(backgroundMusicHandle) || !is_playing(backgroundMusicHandle)) {
        return
    }
    stop(backgroundMusicHandle, BACKGROUND_MUSIC_FADE_DURATION)
}



def public sync_background_music() {
    let wantMusic = should_play_background_music()
    let context = (wantMusic ? screenPhase : -1)
    if (wantMusic) {
        if (!backgroundMusicDesired || context != backgroundMusicContext) {
            backgroundMusicDesired = true
            backgroundMusicContext = context
            fade_in_background_music()
        }
    } elif (backgroundMusicDesired) {
        backgroundMusicDesired = false
        backgroundMusicContext = -1
        fade_out_background_music()
    }
}



def public load_intro_battle_sfx() {
    if (introBattleSfxLoaded) {
        return
    }
    introWarHornSound = request_sound(INTRO_WAR_HORN_PATH)
    introSwordFightSound = request_sound(INTRO_SWORD_FIGHT_PATH)
    introBattleSfxLoaded = true
}




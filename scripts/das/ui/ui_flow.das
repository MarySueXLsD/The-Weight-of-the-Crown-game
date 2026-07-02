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

module ui_flow public

def public is_pause_menu_open() : bool {
    return menuAnimPhase != MENU_ANIM_IDLE
}



def public is_character_profile_open() : bool {
    return characterProfileAnimPhase != PROFILE_ANIM_IDLE
}



def public is_advisor_popup_open() : bool {
    return advisorPopupAnimPhase != ADVISOR_ANIM_IDLE
}



def public is_on_main_menu() : bool {
    return screenPhase == SCREEN_MAIN_MENU
}



def public is_startup_splash_active() : bool {
    return startupSplashPhase != SPLASH_NONE
}



def public is_intro_cutscene_active() : bool {
    return introCutscenePhase != INTRO_NONE
}



def public is_ashford_cutscene_active() : bool {
    return ashfordCutsceneActive
}



def public is_stat_unlock_cutscene_active() : bool {
    return statUnlockCutsceneActive
}



def public is_story_cutscene_active() : bool {
    return is_intro_cutscene_active() || is_ashford_cutscene_active() || is_stat_unlock_cutscene_active()
}



def public is_continue_fade_active() : bool {
    return continueFadePhase != CONTINUE_FADE_NONE
}



def public is_game_paused() : bool {
    return is_startup_splash_active() || is_on_main_menu() || is_pause_menu_open() || is_character_profile_open() || is_advisor_popup_open() || is_story_cutscene_active() || is_continue_fade_active()
}



def public can_skip_game_animations() : bool {
    return !is_game_paused()
}



def public is_main_menu_options_open() : bool {
    return mainMenuOptionsAnimPhase != MENU_ANIM_IDLE
}



def public is_new_game_intro_cutscene_active() : bool {
    return is_intro_cutscene_active() && !ashfordCutsceneActive && !statUnlockCutsceneActive
}



def public is_in_defeat_flow() : bool {
    return defeatPhase != DEFEAT_NONE
}



def public is_dialogue_input_blocked() : bool {
    if (is_story_cutscene_active()) {
        return true
    }
    if (is_in_defeat_flow() && defeatPhase != DEFEAT_PEASANT_DIALOGUE) {
        return true
    }
    if (characterAnimPhase != CHARACTER_ANIM_IDLE) {
        return true
    }
    if (cameraZoomPhase != CAM_ZOOM_IDLE) {
        return true
    }
    if (dialogPhase == DIALOG_TYPEWRITER || dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
        return true
    }
    return false
}




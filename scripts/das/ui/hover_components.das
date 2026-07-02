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
require scripts/das/ui/ui_common
require scripts/das/ui/menus
require scripts/das/ui/character_profile
require scripts/das/ui/hud
require scripts/das/ui/dialogue
require scripts/das/ui/cutscenes

module hover_components public

class AdvisorIconHover : Component {
    def override on_update {
        var hovered = false
        if (can_hover_advisor_icon()) {
            hovered = is_mouse_over_advisor_icon_opaque()
        }
        if (hovered == advisorHudIconHovered) {
            return
        }
        advisorHudIconHovered = hovered
        apply_advisor_icon_visual()
    }
}



class AdvisorActionCardHover : Component {
    def override on_update {
        let popupVisible = is_advisor_popup_open() && advisorPopupAnimPhase != ADVISOR_ANIM_CLOSING && advisorPopupPanelNode.isActive
        if (!popupVisible) {
            for (i in range(MAX_ADVISOR_ACTIONS)) {
                advisorActionHovered[i] = false
                advisorActionHoverT[i] = 0.0
            }
            return
        }
        let dt = get_delta_time()
        for (i in range(MAX_ADVISOR_ACTIONS)) {
            advisorActionHovered[i] = is_mouse_over_advisor_action_card(i)
            let available = is_advisor_action_available(i) && can_execute_advisor_actions()
            let target = (advisorActionHovered[i] && available) ? 1.0 : 0.0
            advisorActionHoverT[i] = move_toward(advisorActionHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            if (advisorActionSlotFillNodes[i].isAlive) {
                apply_advisor_action_card_visual(i, advisorActionHoverT[i], available)
            }
        }
    }
}



class CharacterHover : Component {
    def override on_update {
        if (!characterRoot.isAlive || !characterRoot.isActive) {
            characterHovered = false
        } elif (characterHoverT <= 0.0 && !is_mouse_over_character_frame()) {
            characterHovered = false
        } else {
            characterHovered = is_mouse_over_character_opaque()
        }
        let dt = get_delta_time()
        let target = characterHovered ? 1.0 : 0.0
        characterHoverT = move_toward(characterHoverT, target, ANSWER_HOVER_LERP_SPEED * dt)
        apply_character_image_color(current_character_reveal_t())
    }
}



class CharacterClick : Component {
    def override on_update {
        if (!can_click_character()) {
            return
        }
        for (cmd in get_input_command_buffer()) {
            if (cmd is RawMouseInputEvent) {
                let mouse = cmd as RawMouseInputEvent
                if (mouse.kind == RawMouseInputEventKind.MouseDown && mouse.buttonIdx == MouseButton.Left) {
                    if (is_mouse_over_character_opaque()) {
                        open_character_profile()
                    }
                }
            }
        }
    }
}



class StartupSplashFlow : Component {
    def override on_update {
        if (!is_startup_splash_active()) {
            return
        }
        advance_bootstrap_loading()
        if (gameBootstrapComplete) {
            tick_character_visual_prep("", "")
        }
        let dt = get_delta_time()

        if (startupSplashPhase == SPLASH_BLACK_HOLD) {
            set_startup_splash_overlay_alpha(1.0)
            set_startup_splash_logo_visible(false)
            startupSplashT += dt
            sync_background_music()
            if (startupSplashT >= SPLASH_BLACK_HOLD_DURATION) {
                startupSplashPhase = SPLASH_FADE_IN_LOGO
                startupSplashT = 0.0
                set_startup_splash_logo_visible(true)
            }
            return
        }

        if (startupSplashPhase == SPLASH_FADE_IN_LOGO) {
            startupSplashT += dt / SPLASH_FADE_IN_LOGO_DURATION
            sync_background_music()
            if (startupSplashT >= 1.0) {
                startupSplashT = 1.0
                set_startup_splash_overlay_alpha(0.0)
                startupSplashPhase = SPLASH_HOLD_LOGO
                startupSplashT = 0.0
            } else {
                set_startup_splash_overlay_alpha(1.0 - startupSplashT)
            }
            return
        }

        if (startupSplashPhase == SPLASH_HOLD_LOGO) {
            set_startup_splash_overlay_alpha(0.0)
            set_startup_splash_bg_alpha(1.0)
            startupSplashT += dt
            sync_background_music()
            if (startupSplashT >= SPLASH_HOLD_LOGO_DURATION && gameBootstrapComplete) {
                startupSplashPhase = SPLASH_FADE_IN_MENU
                startupSplashT = 0.0
                set_startup_splash_logo_visible(false)
                apply_screen_visibility()
            }
            return
        }

        if (startupSplashPhase == SPLASH_FADE_IN_MENU) {
            if (!gameBootstrapComplete) {
                return
            }
            apply_screen_visibility()
            sync_background_music()
            startupSplashT += dt / SPLASH_FADE_IN_MENU_DURATION
            if (startupSplashT >= 1.0) {
                startupSplashT = 1.0
                set_startup_splash_bg_alpha(0.0)
                set_startup_splash_overlay_alpha(0.0)
                finish_startup_splash()
            } else {
                set_startup_splash_bg_alpha(1.0 - startupSplashT)
                set_startup_splash_overlay_alpha(0.0)
            }
        }
    }
}



class ContinueFadeFlow : Component {
    def override on_update {
        if (continueFadePhase == CONTINUE_FADE_NONE) {
            return
        }
        let dt = get_delta_time()

        if (continueFadePhase == CONTINUE_FADE_OUT) {
            continueFadeT += dt / INTRO_FADE_DURATION
            if (continueFadeT >= 1.0) {
                continueFadeT = 1.0
                set_intro_fade_alpha(1.0)
                on_continue_fade_out_complete()
            } else {
                set_intro_fade_alpha(continueFadeT)
            }
            return
        }

        if (continueFadePhase == CONTINUE_FADE_IN) {
            continueFadeT += dt / INTRO_FADE_DURATION
            if (continueFadeT >= 1.0) {
                continueFadeT = 1.0
                set_intro_fade_alpha(0.0)
                on_continue_fade_in_complete()
            } else {
                set_intro_fade_alpha(lerp(1.0, 0.0, continueFadeT))
            }
        }
    }
}



class IntroCutsceneFlow : Component {
    def override on_update {
        if (introCutscenePhase == INTRO_NONE) {
            reset_intro_cutscene_skip_ui()
            return
        }
        let dt = get_delta_time()
        if (!introSkipExitPending) {
            if (tick_intro_cutscene_skip_hold(dt)) {
                return
            }
        } else {
            set_intro_cutscene_skip_visible(false)
        }

        if (introCutscenePhase == INTRO_FADE_TO_BLACK) {
            introCutsceneT += dt / INTRO_FADE_DURATION
            if (introCutsceneT >= 1.0) {
                introCutsceneT = 1.0
                set_intro_fade_alpha(1.0)
                screenPhase = SCREEN_PLAYING
                introCutscenePhase = INTRO_SCENE_WAIT
                introCutsceneT = 0.0
                apply_screen_visibility()
            } else {
                set_intro_fade_alpha(introCutsceneT)
            }
            return
        }

        if (introCutscenePhase == INTRO_SCENE_WAIT) {
            set_intro_fade_alpha(0.0)
            if (intro_any_input_pressed()) {
                introCutscenePhase = INTRO_PICTURE_WAIT
                introCutsceneT = 0.0
                introPictureSlideDone = false
                introDialogueBeat = 0
                introCutsceneSlideX = intro_image_hidden_left_x()
                set_intro_image_visible(true)
                apply_intro_slide_positions()
                return
            }
            introCutsceneT += dt
            if (introCutsceneT >= INTRO_SCENE_WAIT_DURATION) {
                introCutscenePhase = INTRO_PICTURE_WAIT
                introCutsceneT = 0.0
                introPictureSlideDone = false
                introDialogueBeat = 0
                introCutsceneSlideX = intro_image_hidden_left_x()
                set_intro_image_visible(true)
                apply_intro_slide_positions()
            }
            return
        }

        if (introCutscenePhase == INTRO_PICTURE_WAIT) {
            if (intro_any_input_pressed()) {
                if (!introPictureSlideDone) {
                    intro_snap_main_image_in_place()
                }
                if (introSlideTargetBeat > 0) {
                    intro_begin_dialogue_beat_immediately(introSlideTargetBeat)
                    introSlideTargetBeat = 0
                } else {
                    intro_begin_replica_immediately_for_current_beat()
                }
                return
            }
            if (!introPictureSlideDone) {
                introCutsceneSlideX = move_toward(introCutsceneSlideX, 0.0, intro_image_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introCutsceneSlideX) < 1.0) {
                    intro_snap_main_image_in_place()
                    if (introSlideTargetBeat > 0) {
                        intro_begin_dialogue_beat_immediately(introSlideTargetBeat)
                        introSlideTargetBeat = 0
                    } else {
                        intro_begin_replica_immediately_for_current_beat()
                    }
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_NAME_SLIDE) {
            if (intro_any_input_pressed()) {
                introCutscenePhase = INTRO_TYPEWRITER
                intro_begin_typewriter_for_current_beat()
                return
            }
            introNameSlideX = move_toward(introNameSlideX, 0.0, intro_name_slide_speed() * dt)
            apply_intro_slide_positions()
            if (abs(introNameSlideX) < 1.0) {
                introCutscenePhase = INTRO_TYPEWRITER
                intro_begin_typewriter_for_current_beat()
            }
            return
        }

        if (introCutscenePhase == INTRO_TYPEWRITER) {
            if (intro_tick_typewriter(dt)) {
                introCutscenePhase = INTRO_POST_TEXT_WAIT
                introCutsceneT = 0.0
            }
            return
        }

        if (introCutscenePhase == INTRO_POST_TEXT_WAIT) {
            if (intro_tick_post_text_wait(dt)) {
                if (ashfordCutsceneActive) {
                    introCutscenePhase = INTRO_FADE_OUT
                } elif (statUnlockCutsceneActive && statUnlockCutsceneStatIdx == STAT_CHURCH_IDX && has_next_church_cutscene_replica(introDialogueBeat)) {
                    introDialogueBeat += 1
                    introCutscenePhase = INTRO_TYPEWRITER
                    introCutsceneT = 0.0
                    intro_begin_typewriter_for_current_beat()
                } elif (statUnlockCutsceneActive) {
                    introCutscenePhase = INTRO_FADE_OUT
                } elif (introCutsceneLayoutMode == INTRO_LAYOUT_SEQ1 && introDialogueBeat == 0) {
                    begin_intro_dialogue_beat(1, true)
                    introCutscenePhase = INTRO_TYPEWRITER
                    refresh_intro_replica_text()
                } else {
                    introCutscenePhase = INTRO_SLIDE_OUT
                }
                introCutsceneT = 0.0
            }
            return
        }

        if (introCutscenePhase == INTRO_SLIDE_OUT) {
            if (intro_any_input_pressed()) {
                intro_snap_main_image_offscreen_exit()
                prepare_intro_seq2()
                introCutscenePhase = INTRO_SEQ2_SLIDE_IN
                introCutsceneT = 0.0
                set_intro_image_visible(true)
                apply_intro_slide_positions()
                return
            }
            let targetX = intro_exit_hidden_right_x()
            introCutsceneSlideX = move_toward(introCutsceneSlideX, targetX, intro_exit_slide_speed() * dt)
            apply_intro_slide_positions()
            if (abs(introCutsceneSlideX - targetX) < 1.0) {
                intro_snap_main_image_offscreen_exit()
                prepare_intro_seq2()
                introCutscenePhase = INTRO_SEQ2_SLIDE_IN
                introCutsceneT = 0.0
                set_intro_image_visible(true)
                apply_intro_slide_positions()
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ2_SLIDE_IN) {
            if (intro_any_input_pressed()) {
                if (!introPictureSlideDone) {
                    intro_snap_main_image_in_place()
                }
                intro_begin_dialogue_beat_immediately(2)
                return
            }
            if (!introPictureSlideDone) {
                introCutsceneSlideX = move_toward(introCutsceneSlideX, 0.0, intro_image_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introCutsceneSlideX) < 1.0) {
                    intro_snap_main_image_in_place()
                    intro_begin_dialogue_beat_immediately(2)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_DIALOGUE) {
            if (introDialogueSubPhase == INTRO_DIALOGUE_NAME_SLIDE) {
                if (intro_any_input_pressed()) {
                    introDialogueSubPhase = INTRO_DIALOGUE_TYPEWRITER
                    intro_begin_typewriter_for_current_beat()
                    return
                }
                introNameSlideX = move_toward(introNameSlideX, 0.0, intro_name_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introNameSlideX) < 1.0) {
                    introDialogueSubPhase = INTRO_DIALOGUE_TYPEWRITER
                    intro_begin_typewriter_for_current_beat()
                }
                return
            }
            if (introDialogueSubPhase == INTRO_DIALOGUE_TYPEWRITER) {
                if (intro_tick_typewriter(dt)) {
                    introDialogueSubPhase = INTRO_DIALOGUE_POST_WAIT
                    introCutsceneT = 0.0
                }
                return
            }
            if (intro_tick_post_text_wait(dt)) {
                intro_advance_after_dialogue_wait()
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ3_SLIDE_IN) {
            let targetBeat = intro_seq3_slide_target_beat()
            if (intro_any_input_pressed()) {
                if (!introSeq3SlideDone) {
                    intro_snap_seq3_in_place()
                }
                intro_begin_dialogue_beat_immediately(targetBeat)
                return
            }
            if (!introSeq3SlideDone) {
                introSeq3SlideX = move_toward(introSeq3SlideX, 0.0, intro_seq3_slide_speed_for_current() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq3SlideX) < 1.0) {
                    intro_snap_seq3_in_place()
                    intro_begin_dialogue_beat_immediately(targetBeat)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ4_APPEAR) {
            if (intro_any_input_pressed()) {
                if (!introSeq4SlideDone) {
                    intro_snap_seq4_in_place()
                }
                intro_begin_dialogue_beat_immediately(9)
                return
            }
            if (!introSeq4SlideDone) {
                introSeq4SlideX = move_toward(introSeq4SlideX, 0.0, intro_seq4_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq4SlideX) < 1.0) {
                    intro_snap_seq4_in_place()
                    intro_begin_dialogue_beat_immediately(9)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ5_APPEAR) {
            if (intro_any_input_pressed()) {
                if (!introSeq5SlideDone) {
                    intro_snap_seq5_in_place()
                }
                intro_begin_dialogue_beat_immediately(11)
                return
            }
            if (!introSeq5SlideDone) {
                introSeq5SlideX = move_toward(introSeq5SlideX, 0.0, intro_seq5_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq5SlideX) < 1.0) {
                    intro_snap_seq5_in_place()
                    intro_begin_dialogue_beat_immediately(11)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_SEQ6_APPEAR) {
            if (intro_any_input_pressed()) {
                if (!introSeq6SlideDone) {
                    intro_snap_seq6_in_place()
                }
                intro_begin_dialogue_beat_immediately(13)
                return
            }
            if (!introSeq6SlideDone) {
                introSeq6SlideX = move_toward(introSeq6SlideX, 0.0, intro_seq6_slide_speed() * dt)
                apply_intro_slide_positions()
                if (abs(introSeq6SlideX) < 1.0) {
                    intro_snap_seq6_in_place()
                    intro_begin_dialogue_beat_immediately(13)
                }
            }
            return
        }

        if (introCutscenePhase == INTRO_BLACK_PAUSE) {
            if (intro_any_input_pressed()) {
                intro_leave_black_pause_and_begin_edwin_shake()
                return
            }
            introCutsceneT += dt
            if (introCutsceneT >= INTRO_BLACK_PAUSE_DURATION) {
                intro_leave_black_pause_and_begin_edwin_shake()
            }
            return
        }

        if (introCutscenePhase == INTRO_IMAGE_SHAKE) {
            if (intro_any_input_pressed()) {
                introShakeT = INTRO_SHAKE_DURATION
                intro_finish_shake_transition()
                return
            }
            intro_tick_shake_offset(dt)
            apply_intro_slide_positions()
            if (introShakeT >= INTRO_SHAKE_DURATION) {
                intro_finish_shake_transition()
            }
            return
        }

        if (introCutscenePhase == INTRO_POST_SHAKE_WAIT) {
            if (intro_any_input_pressed()) {
                intro_begin_scene6()
                intro_snap_main_image_in_place()
                intro_begin_dialogue_beat_immediately(28)
                return
            }
            introCutsceneT += dt
            if (introCutsceneT >= INTRO_POST_SHAKE_WAIT_DURATION) {
                intro_begin_scene6()
            }
            return
        }

        if (introCutscenePhase == INTRO_FADE_OUT) {
            sync_intro_cutscene_music()
            sync_background_music()
            introCutsceneT += dt / intro_cutscene_exit_fade_duration()
            if (introCutsceneT >= 1.0) {
                introCutsceneT = 1.0
                set_intro_fade_alpha(1.0)
                if (introCutsceneRoot.isAlive) {
                    introCutsceneRoot.isActive = false
                }
                introCutscenePhase = INTRO_UNFADE
                introCutsceneT = 0.0
                apply_screen_visibility()
            } else {
                set_intro_fade_alpha(introCutsceneT)
            }
            return
        }

        if (introCutscenePhase == INTRO_UNFADE) {
            introCutsceneT += dt / intro_cutscene_exit_unfade_duration()
            if (introCutsceneT >= 1.0) {
                if (ashfordCutsceneActive) {
                    finish_ashford_cutscene()
                } elif (statUnlockCutsceneActive) {
                    finish_stat_unlock_cutscene()
                } else {
                    finish_intro_cutscene()
                }
            } else {
                set_intro_fade_alpha(lerp(1.0, 0.0, introCutsceneT))
            }
        }
    }
}



class CharacterSlide : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (characterAnimPhase == CHARACTER_ANIM_EXIT) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_character_exit()
                return
            }
            let dt = get_delta_time()
            characterAnimOffsetX -= ui_w(CHARACTER_ANIM_EXIT_SPEED) * dt
            characterWalkBobTimer += dt
            let bobPhase = cos(characterWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
            let bobY = character_walk_bob_offset_y(bobPhase)
            set_character_offset(characterAnimOffsetX, bobY)
            characterRevealT = character_exit_fade_t(characterAnimOffsetX)
            apply_character_image_color(characterRevealT)

            if (characterAnimOffsetX <= character_exit_end_offset()) {
                finish_character_exit()
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_ENTER) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_character_enter()
                return
            }
            let dt = get_delta_time()
            characterAnimOffsetX += ui_w(CHARACTER_ANIM_ENTER_SPEED) * dt
            characterWalkBobTimer += dt
            // One-sided bob: trough sits amplitude below the border, peak lands feet on the border.
            let bobPhase = cos(characterWalkBobTimer * CHARACTER_WALK_BOB_FREQ * PI * 2.0) * 0.5 + 0.5
            let bobY = character_walk_bob_offset_y(bobPhase)
            apply_character_image_color(0.0)

            if (characterAnimOffsetX >= characterRestOffsetX) {
                finish_character_enter_slide()
            } else {
                set_character_offset(characterAnimOffsetX, bobY)
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_REVEAL) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_character_enter()
                return
            }
            let dt = get_delta_time()
            characterRevealT += dt / CHARACTER_REVEAL_DURATION
            apply_character_breath()
            if (characterRevealT >= 1.0) {
                finish_character_reveal()
            } else {
                apply_character_image_color(characterRevealT)
            }
            return
        }

        if (characterAnimPhase == CHARACTER_ANIM_IDLE) {
            apply_character_breath()
        }
    }
}



class DialogueFlow : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (dialogPhase == DIALOG_TYPEWRITER) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_typewriter()
                return
            }
            let dt = get_delta_time()
            let totalChars = typewriter_text_length(typewriterFullText)
            typewriterAccumulator += TYPEWRITER_CHARS_PER_SEC * dt
            while (typewriterCharCount < totalChars && typewriterAccumulator >= 1.0) {
                typewriterCharCount++
                typewriterAccumulator -= 1.0
            }
            questionTextNode?.UIText.text = typewriter_text_slice(typewriterFullText, typewriterCharCount)
            if (typewriterCharCount >= totalChars) {
                finish_typewriter()
            }
            return
        }

        if (dialogPhase == DIALOG_POST_RESPONSE_HOLD) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_post_response_hold()
                return
            }
            postResponseHoldTimer -= get_delta_time()
            if (postResponseHoldTimer <= 0.0) {
                finish_post_response_hold()
            }
        }
    }
}



class DefeatFlow : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (defeatPhase == DEFEAT_FADE_OUT) {
            let dt = get_delta_time()
            defeatFadeT += dt / DEFEAT_FADE_DURATION
            if (defeatFadeT >= 1.0) {
                defeatFadeT = 1.0
                set_death_fade_alpha(1.0)
                if (deathScreenNode.isAlive) {
                    deathScreenNode.isActive = true
                    set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, 0.0))
                }
                defeatPhase = DEFEAT_SHOW_SCREEN
                deathSummaryTimer = 0.0
                deathSummaryFadeT = 0.0
            } else {
                set_death_fade_alpha(defeatFadeT)
            }
            return
        }

        if (defeatPhase == DEFEAT_SHOW_SCREEN) {
            let dt = get_delta_time()
            deathSummaryFadeT += dt / DEFEAT_FADE_DURATION
            let screenT = clamp(deathSummaryFadeT, 0.0, 1.0)
            set_death_fade_alpha(lerp(1.0, 0.0, screenT))
            if (deathScreenNode.isAlive) {
                set_image_color(deathScreenNode, float4(1.0, 1.0, 1.0, screenT))
            }
            if (screenT >= 1.0) {
                deathSummaryTimer += dt
                if (deathSummaryTimer >= DEATH_SUMMARY_DELAY) {
                    defeatPhase = DEFEAT_SHOW_SUMMARY
                    update_death_summary_text()
                    if (deathSummaryRoot.isAlive) {
                        deathSummaryRoot.isActive = true
                    }
                    deathSummaryFadeT = 0.0
                }
            }
            return
        }

        if (defeatPhase == DEFEAT_SHOW_SUMMARY) {
            let dt = get_delta_time()
            deathSummaryFadeT += dt / DEATH_SUMMARY_FADE_DURATION
            if (deathSummaryFadeT >= 1.0) {
                deathSummaryFadeT = 1.0
            }
            set_death_summary_alpha(deathSummaryFadeT)
        }
    }
}



class ParallelHandoffFlow : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (!parallelHandoffActive || incomingEnterFinished) {
            return
        }
        if (can_skip_game_animations() && intro_any_input_pressed()) {
            finish_parallel_incoming_enter()
            return
        }
        update_parallel_incoming_visitor(get_delta_time())
    }
}



class CharacterVisualPrep : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (!gameBootstrapComplete) {
            return
        }
        let onMainMenu = screenPhase == SCREEN_MAIN_MENU
        let activePath = onMainMenu ? "" : texture_path_for(characterTexture)
        let priorityPath = onMainMenu ? "" : incoming_character_body_path()
        tick_character_visual_prep(activePath, priorityPath)
    }
}



class CameraZoom : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        if (cameraZoomPhase == CAM_ZOOM_OUT) {
            let dt = get_delta_time()
            cameraZoomT -= CAMERA_ZOOM_SPEED * dt
            if (cameraZoomT <= 0.0) {
                cameraZoomT = 0.0
                apply_camera_zoom()
                zoomOutFinished = true
                cameraZoomPhase = CAM_ZOOM_IDLE
                try_advance_to_wait()
            } else {
                apply_camera_zoom()
            }
            return
        }

        if (cameraZoomPhase == CAM_ZOOM_IN) {
            if (can_skip_game_animations() && intro_any_input_pressed()) {
                finish_camera_zoom_in()
                return
            }
            let dt = get_delta_time()
            cameraZoomT += CAMERA_ZOOM_SPEED * dt
            if (cameraZoomT >= 1.0) {
                finish_camera_zoom_in()
            } else {
                apply_camera_zoom()
            }
        }
    }
}



class StatBarDisplay : Component {
    def override on_update {
        if (is_game_paused()) {
            return
        }
        update_stat_bar_anims(get_delta_time())
    }
}



class MenuInput : Component {
    def override on_update {
        for (cmd in get_input_command_buffer()) {
            match (cmd) {
                if (RawKeyboardInputEvent(kind = RawKeyboardInputEventKind.KeyDown, buttonIdx = $v(buttonIdx))) {
                    if (buttonIdx == KeyCode.Escape) {
                        if (is_on_main_menu()) {
                            if (mainMenuOptionsAnimPhase == MENU_ANIM_OPEN || mainMenuOptionsAnimPhase == MENU_ANIM_OPENING) {
                                close_main_menu_options()
                            }
                            return
                        }
                        if (is_in_defeat_flow()) {
                            return
                        }
                        if (characterProfileAnimPhase == PROFILE_ANIM_OPEN || characterProfileAnimPhase == PROFILE_ANIM_OPENING) {
                            close_character_profile()
                        } elif (menuAnimPhase == MENU_ANIM_OPEN || menuAnimPhase == MENU_ANIM_OPENING) {
                            close_pause_menu()
                        } elif (menuAnimPhase == MENU_ANIM_IDLE && characterProfileAnimPhase == PROFILE_ANIM_IDLE) {
                            open_pause_menu()
                        }
                    }
                }
            }
        }
    }
}



class DialogueLayout : Component {
    def override on_update {
        if (!dialogueRoot.isAlive || !dialogueRoot.isActive) {
            return
        }
        let zoomAnimating = cameraZoomPhase != CAM_ZOOM_IDLE
        let typewriting = dialogPhase == DIALOG_TYPEWRITER
        let choosing = dialogPhase == DIALOG_CHOOSING
        let postResponse = dialogPhase == DIALOG_POST_RESPONSE_HOLD
        if (!dialogueLayoutDirty && !zoomAnimating && !typewriting && !choosing && !postResponse) {
            return
        }
        apply_dialogue_layout()
    }
}



class AnswerChoiceHover : Component {
    def override on_update {
        if (dialogPhase != DIALOG_CHOOSING || is_game_paused()) {
            return
        }
        let dt = get_delta_time()
        let choiceCount = visible_choice_count(get_current_dialogue_node())

        for (i in range(MAX_CHOICES)) {
            let target = (hoveredChoice == i && i < choiceCount) ? 1.0 : 0.0
            choiceHoverT[i] = move_toward(choiceHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            let btn = choiceButtonNodes[i]
            if (btn.isAlive && i < choiceCount) {
                apply_menu_button_visual(btn, choiceHoverT[i], true)
            }
        }
    }
}



class MainMenuButtonHover : Component {
    def override on_update {
        if (!is_on_main_menu()) {
            return
        }
        let dt = get_delta_time()
        mainMenuDecorTime += dt
        apply_main_menu_background_zoom()
        let btnW = main_menu_button_width()
        let btnH = ui_h(MAIN_MENU_BUTTON_HEIGHT)
        let innerW = btnW - 2.0 * ui_box_border()
        for (i in range(MAIN_MENU_BUTTON_COUNT)) {
            let enabled = is_main_menu_button_enabled(i)
            let target = (enabled && mainMenuButtonHovered[i]) ? 1.0 : 0.0
            mainMenuButtonHoverT[i] = move_toward(mainMenuButtonHoverT[i], target, ANSWER_HOVER_LERP_SPEED * dt)
            let btn = mainMenuButtonNodes[i]
            if (btn.isAlive) {
                apply_main_menu_button_visual(btn, mainMenuButtonHoverT[i], enabled)
                update_main_menu_button_shine(i, innerW, btnH, mainMenuButtonHoverT[i], enabled)
            }
        }
    }
}



class MenuButtonHover : Component {
    def override on_update {
        let onMainMenu = is_on_main_menu()
        let pauseMenuOpen = is_pause_menu_open()
        if (onMainMenu && !pauseMenuOpen) {
            return
        }
        let dt = get_delta_time()

        let pauseTarget = (!is_in_defeat_flow() && !is_on_main_menu() && menuButtonHovered) ? 1.0 : 0.0
        menuButtonHoverT = move_toward(menuButtonHoverT, pauseTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuButtonNode.isAlive) {
            apply_menu_button_visual(menuButtonNode, menuButtonHoverT, true)
        }

        let advisorTarget = ((can_open_advisor_popup() || is_advisor_popup_open()) && advisorButtonHovered) ? 1.0 : 0.0
        advisorButtonHoverT = move_toward(advisorButtonHoverT, advisorTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (advisorButtonNode.isAlive) {
            apply_menu_button_visual(advisorButtonNode, advisorButtonHoverT, can_open_advisor_popup() || is_advisor_popup_open())
        }

        let continueTarget = (is_pause_menu_open() && menuContinueButtonHovered) ? 1.0 : 0.0
        menuContinueButtonHoverT = move_toward(menuContinueButtonHoverT, continueTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuContinueButtonNode.isAlive) {
            apply_menu_button_visual(menuContinueButtonNode, menuContinueButtonHoverT, true)
        }

        let exitTarget = (is_pause_menu_open() && menuExitButtonHovered) ? 1.0 : 0.0
        menuExitButtonHoverT = move_toward(menuExitButtonHoverT, exitTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (menuExitButtonNode.isAlive) {
            apply_menu_button_visual(menuExitButtonNode, menuExitButtonHoverT, true)
        }
    }
}



class CharacterProfileButtonHover : Component {
    def override on_update {
        let dt = get_delta_time()
        let okayTarget = (is_character_profile_open() && characterProfileOkayHovered) ? 1.0 : 0.0
        characterProfileOkayHoverT = move_toward(characterProfileOkayHoverT, okayTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (characterProfileOkayButtonNode.isAlive) {
            apply_profile_okay_button_visual(characterProfileOkayHoverT)
        }
    }
}



class MainMenuOptionsButtonHover : Component {
    def override on_update {
        let dt = get_delta_time()
        let backTarget = (is_main_menu_options_open() && mainMenuOptionsBackButtonHovered) ? 1.0 : 0.0
        mainMenuOptionsBackButtonHoverT = move_toward(mainMenuOptionsBackButtonHoverT, backTarget, ANSWER_HOVER_LERP_SPEED * dt)
        if (mainMenuOptionsBackButtonNode.isAlive) {
            apply_menu_button_visual(mainMenuOptionsBackButtonNode, mainMenuOptionsBackButtonHoverT, true)
        }
    }
}



class InfoTooltipDisplay : Component {
    lastLayoutTarget : int = INFO_HOVER_NONE
    lastLayoutSignature : string = ""

    def override on_update {
        if (hoveredInfoTarget == INFO_HOVER_NONE) {
            lastLayoutTarget = INFO_HOVER_NONE
            lastLayoutSignature = ""
            return
        }
        if (is_game_paused() || is_in_defeat_flow()) {
            hide_info_tooltip()
            lastLayoutTarget = INFO_HOVER_NONE
            lastLayoutSignature = ""
            return
        }
        update_info_tooltip_content()
        let signature = info_tooltip_layout_signature(hoveredInfoTarget)
        if (hoveredInfoTarget != lastLayoutTarget || signature != lastLayoutSignature) {
            resize_info_tooltip_panel()
            position_info_tooltip(hoveredInfoTarget)
            lastLayoutTarget = hoveredInfoTarget
            lastLayoutSignature = signature
        }
    }
}



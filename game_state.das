require engine.core
require constants

module game_state public

var public screenPhase = SCREEN_MAIN_MENU
var public startupSplashPhase = SPLASH_NONE
var public startupSplashT = 0.0
var public bootstrapLoadStep = 0
var public gameBootstrapComplete = false
var public introCutscenePhase = INTRO_NONE
var public introCutsceneT = 0.0
var public introCutsceneSlideX = 0.0
var public introPictureSlideDone = false
var public introNameSlideX = 0.0
var public introTypewriterCharCount = 0
var public introTypewriterAccumulator = 0.0
var public introFadeAlpha = 0.0
var public continueFadePhase = CONTINUE_FADE_NONE
var public continueFadeT = 0.0
var public introTextureAspect = 1.6
var public introTextureAspect2 = 1.0
var public introTextureAspect3 = 1.0
var public introTextureAspect4 = 1.0
var public introTextureAspect5 = 1.0
var public introTextureAspect6 = 1.0
var public mainMenuBackgroundTextureAspect = 16.0 / 9.0
var public introCutsceneLayoutMode = INTRO_LAYOUT_SEQ1
var public introActiveBottomYRatio = INTRO_IMAGE_BOTTOM_Y_RATIO
var public introDialogueBeat = 0
var public introDialogueSubPhase = INTRO_DIALOGUE_NAME_SLIDE
var public introDialogueSoundHandle : SoundHandle
var public introSuppressTypewriterSkip = false
var public introCutsceneSkipHoldT = 0.0
var public introCutsceneSkipAlpha = 0.0
var public introCutsceneSkipIdleT = 0.0
var public introCutsceneSkipInputHoldCount = 0
var public introSkipExitPending = false
var public introSeq3SlideX = 0.0
var public introSeq3SlideDone = false
var public introSeq4SlideX = 0.0
var public introSeq4SlideDone = false
var public introSeq5SlideX = 0.0
var public introSeq5SlideDone = false
var public introSeq6SlideX = 0.0
var public introSeq6SlideDone = false
var public introSeq3Visible = false
var public introSeq4Visible = false
var public introSeq5Visible = false
var public introSeq6Visible = false
var public introMultiSeq2InnerSize = float2(640.0, 360.0)
var public introCorner3InnerSize = float2(160.0, 160.0)
var public introCorner4InnerSize = float2(240.0, 160.0)
var public introCorner5InnerSize = float2(200.0, 160.0)
var public introCorner6InnerSize = float2(200.0, 160.0)
var public deferCharacterEnter = false
var public kingdomStats : int[STAT_COUNT]
var public pendingChoiceDeltas : int[STAT_COUNT]
var public hasPendingChoiceDeltas = false
var public advisorActionHovered : bool[MAX_ADVISOR_ACTIONS]
var public advisorActionHoverT : float[MAX_ADVISOR_ACTIONS]
var public advisorActionUsedToday = false
var public advisorActionCooldowns : int[MAX_ADVISOR_ACTIONS]
var public pendingAdvisorActionIdx = -1
var public currentDay = 1
var public playerNickname = DEFAULT_NICKNAME
var public recordDays = 0
var public hasSaveGame = false
var public savedQuestionIds : array<int>
var public savedReplyIds : array<int>
var public currentEncounterIdx = 0
var public currentNodeIdx = 0
var public pendingNextNodeIdx = NO_NEXT_NODE
var public ashfordIntroduced = false
var public ashfordCutsceneActive = false
var public ashfordCutsceneTextureAspect = 1.6
var public usingAshfordDebutEncounter = false
var public statUnlocked : bool[STAT_COUNT]
var public statUnlockRevealT : float[STAT_COUNT]
var public statUnlockCutsceneActive = false
var public statUnlockCutsceneStatIdx = -1
var public statUnlockCutsceneTextureAspect = 1.6
var public defeatPhase = DEFEAT_NONE
var public defeatStatIdx = -1
var public defeatFadeT = 0.0
var public deathSummaryFadeT = 0.0
var public deathSummaryTimer = 0.0

var public menuOpen = false
var public menuAnimPhase = MENU_ANIM_IDLE
var public menuPanelSlideX = 0.0
var public menuPanelSlideTargetX = 0.0
var public characterProfileAnimPhase = PROFILE_ANIM_IDLE
var public characterProfileSlideX = 0.0
var public characterProfileSlideTargetX = 0.0
var public characterProfileOkayHovered = false
var public characterProfileOkayHoverT = 0.0
var public currentCharacterProfileIdx = 0
var public characterAnimPhase = 0
var public characterAnimOffsetX = 0.0
var public characterAnimOffsetY = 0.0
var public characterRestOffsetX = 0.0
var public characterWalkBobTimer = 0.0
var public characterBreathTimer = 0.0
var public characterRevealT = 1.0

var public dialogPhase = 0
var public typewriterKind = 0
var public typewriterCharCount = 0
var public typewriterAccumulator = 0.0
var public typewriterFullText = ""
var public postResponseHoldTimer = 0.0
var public hoveredChoice = HOVER_NONE
var public choiceHoverT : float[MAX_CHOICES]
var public menuButtonHovered = false
var public advisorButtonHovered = false
var public menuContinueButtonHovered = false
var public menuExitButtonHovered = false
var public menuButtonHoverT = 0.0
var public advisorButtonHoverT = 0.0
var public menuContinueButtonHoverT = 0.0
var public menuExitButtonHoverT = 0.0
var public mainMenuButtonHovered : bool[MAIN_MENU_BUTTON_COUNT]
var public mainMenuButtonHoverT : float[MAIN_MENU_BUTTON_COUNT]
var public mainMenuButtonShineNodes : NodeId[MAIN_MENU_BUTTON_COUNT]
var public mainMenuDecorTime = 0.0
var public hoveredInfoTarget = INFO_HOVER_NONE

var public cameraZoomPhase = 0
var public cameraZoomT = 1.0
var public cameraZoomWaitTimer = 0.0
var public characterExitFinished = false
var public zoomOutFinished = false

var public cameraNode : NodeId
var public zoomRoot : NodeId
var public uiCanvas : NodeId
var public characterHovered = false
var public characterHoverT = 0.0
var public incomingVisitorRoot : NodeId
var public incomingVisitorImageNode : NodeId
var public incomingVisitorSilhouetteNode : NodeId
var public parallelHandoffActive = false
var public incomingEnterFinished = false
var public incomingAnimOffsetX = 0.0
var public incomingWalkBobTimer = 0.0
var public incomingTextureAspect = 0.75
var public incomingTextureUvRegion = float4(0.0, 0.0, 1.0, 1.0)
var public incomingVisitorTexture : TextureId

var public characterRoot : NodeId
var public characterImageNode : NodeId
var public characterOutlineNode : NodeId
var public characterSilhouetteOverlay : NodeId
var public dialogueRoot : NodeId
var public questionBorderNode : NodeId
var public questionBoxNode : NodeId
var public questionContentNode : NodeId
var public questionNameNode : NodeId
var public questionTextNode : NodeId
var public answerRoot : NodeId
var public choiceButtonNodes : NodeId[MAX_CHOICES]
var public menuOverlay : NodeId
var public characterProfileOverlay : NodeId
var public characterProfilePanelNode : NodeId
var public characterProfileInnerNode : NodeId
var public characterProfileContentNode : NodeId
var public characterProfileHeaderNode : NodeId
var public characterProfileTextColumnNode : NodeId
var public characterProfilePortraitNode : NodeId
var public characterProfileTitleNode : NodeId
var public characterProfileDescBesideNode : NodeId
var public characterProfileDescBelowNode : NodeId
var public characterProfileDescriptionFullText = ""
var public characterProfileDescBesideText = ""
var public characterProfileDescBelowText = ""
var public characterProfileLikesNode : NodeId
var public characterProfileDislikesNode : NodeId
var public characterProfileOkayButtonNode : NodeId
var public characterProfileOkayRowNode : NodeId
var public menuPanelNode : NodeId
var public menuPanelInnerNode : NodeId
var public menuPanelContentNode : NodeId
var public menuButtonNode : NodeId
var public advisorButtonNode : NodeId
var public menuContinueButtonNode : NodeId
var public menuOptionsButtonNode : NodeId
var public menuExitButtonNode : NodeId
var public mainMenuRoot : NodeId
var public mainMenuBackgroundZoomRoot : NodeId
var public mainMenuBackgroundNode : NodeId
var public mainMenuBottomBarRoot : NodeId
var public mainMenuBottomBarBorderNode : NodeId
var public mainMenuButtonsRowNode : NodeId
var public mainMenuButtonNodes : NodeId[MAIN_MENU_BUTTON_COUNT]
var public mainMenuOptionsAnimPhase = MENU_ANIM_IDLE
var public mainMenuOptionsSlideX = 0.0
var public mainMenuOptionsSlideTargetX = 0.0
var public mainMenuOptionsOverlay : NodeId
var public mainMenuOptionsPanelNode : NodeId
var public mainMenuOptionsInnerNode : NodeId
var public mainMenuOptionsContentNode : NodeId
var public mainMenuOptionsBackButtonNode : NodeId
var public mainMenuOptionsMasterSliderNode : NodeId
var public mainMenuOptionsMusicSliderNode : NodeId
var public mainMenuOptionsLanguageRowNode : NodeId
var public mainMenuOptionsLanguageEnglishBtn : NodeId
var public mainMenuOptionsLanguageRussianBtn : NodeId
var public mainMenuOptionsFullscreenToggleNode : NodeId
var public mainMenuOptionsVersionTextNode : NodeId
var public mainMenuOptionsBackButtonHovered = false
var public mainMenuOptionsBackButtonHoverT = 0.0
var public settingsMasterVolume = 1.0
var public settingsMusicVolume = 1.0
var public settingsFullscreen = false
var public settingsLanguageIdx = 0
var public lastSelectedChoiceIdx = -1
var public mainMenuOptionsTitleNode : NodeId
var public mainMenuOptionsMasterLabelNode : NodeId
var public mainMenuOptionsMusicLabelNode : NodeId
var public mainMenuOptionsLanguageLabelNode : NodeId
var public mainMenuOptionsFullscreenLabelNode : NodeId
var public mainMenuOptionsFullscreenSlotNode : NodeId
//// Gameplay HUD node ids (main.das owns advisorHudIconNode locally)
var public backgroundNode : NodeId
var public topBarRoot : NodeId
var public topBarBorderNode : NodeId
var public bottomBarRoot : NodeId
var public bottomBarBorderNode : NodeId
var public topBarLeftInfoNode : NodeId
var public dayTextNode : NodeId
var public nicknameTextNode : NodeId
var public statBarRoot : NodeId
var public statColumnHiddenRoot : NodeId
var public statBarDividerNode : NodeId
var public statColumnNodes : NodeId[STAT_COUNT]
var public statIconWrapNodes : NodeId[STAT_COUNT]
var public statIconColorFillNodes : NodeId[STAT_COUNT]
var public statIconOutlineNodes : NodeId[STAT_COUNT]
var public statBarTrackNodes : NodeId[STAT_COUNT]
var public statBarFillNodes : NodeId[STAT_COUNT]
var public statEmphasisT : float[STAT_COUNT]
var public statChoiceHoverT : float[STAT_COUNT]
var public statFillDisplayed : float[STAT_COUNT]
var public statConfirmPhase : int[STAT_COUNT]
var public statConfirmTimer : float[STAT_COUNT]
var public statFillFrom : float[STAT_COUNT]
var public statFillTo : float[STAT_COUNT]
var public statFlashT : float[STAT_COUNT]
var public statFlashPositive : bool[STAT_COUNT]
var public deathFadeOverlay : NodeId
var public deathScreenNode : NodeId
var public deathSummaryRoot : NodeId
var public deathSummaryBorderNode : NodeId
var public deathSummaryBoxNode : NodeId
var public deathSummaryContentNode : NodeId
var public deathSummaryTextNode : NodeId
var public deathRecordTextNode : NodeId
var public tryAgainRowNode : NodeId
var public tryAgainButtonNode : NodeId
var public infoTooltipRoot : NodeId
var public infoTooltipBoxNode : NodeId
var public infoTooltipContentNode : NodeId
var public infoTooltipTitleNode : NodeId
var public infoTooltipBodyNode : NodeId
var public infoTooltipInfluenceHeaderNode : NodeId
var public infoTooltipInfluenceBuffNode : NodeId
var public infoTooltipInfluenceDebuffNode : NodeId
var public infoTooltipActiveHeaderNode : NodeId
var public infoTooltipActiveBuffNode : NodeId
var public infoTooltipActiveDebuffNode : NodeId

var public backgroundTexture : TextureId
var public mainMenuBackgroundTexture : TextureId
var public logoTexture : TextureId
var public gameFont : FontId
var public dialogueFont : FontId
var public uiFont : FontId
var public russianDialogueFont : FontId
var public choiceFont : FontId
var public characterTexture : TextureId
var public nextVisitorTexture : TextureId
var public queuedNextEncounterIdx = -1
var public kingTexture : TextureId
var public peasantTexture : TextureId
var public deathScreenTextures : TextureId[STAT_COUNT]
var public ashfordCutsceneTexture : TextureId
var public visitorTextures : TextureId[VISITOR_TEXTURE_COUNT]
var public portraitTextures : TextureId[CHARACTER_COUNT]
var public courtBodyTextures : TextureId[COURT_CHARACTER_COUNT]
var public courtPortraitTextures : TextureId[COURT_CHARACTER_COUNT]
var public usedEncounterFlags : bool[TOTAL_ENCOUNTER_COUNT]
var public courtCharactersMet : bool[COURT_CHARACTER_COUNT]
var public characterQuestionCooldowns : int[COURT_CHARACTER_COUNT]
var public currentCourtCharacterIdx = 0
var public statTextures : TextureId[STAT_COUNT]
var public statBarTrackTexture : TextureId
var public statBarFillTexture : TextureId
var public characterTextureAspect = 0.75
var public characterTextureUvRegion = float4(0.0, 0.0, 1.0, 1.0)
var public characterOutlineTexture : TextureId
var public characterAlphaPixels : array<uint>
var public characterAlphaWidth = 0
var public characterAlphaHeight = 0

def public reset_kingdom_stats() {
    for (i in range(STAT_COUNT)) {
        kingdomStats[i] = STAT_START_VALUES[i]
    }
    hasPendingChoiceDeltas = false
    advisorActionUsedToday = false
    for (i in range(MAX_ADVISOR_ACTIONS)) {
        advisorActionCooldowns[i] = 0
    }
    pendingAdvisorActionIdx = -1
}


def public reset_stat_anim_state() {
    for (i in range(STAT_COUNT)) {
        statEmphasisT[i] = 0.0
        statChoiceHoverT[i] = 0.0
        statFillDisplayed[i] = float(kingdomStats[i])
        statConfirmPhase[i] = STAT_CONFIRM_IDLE
        statConfirmTimer[i] = 0.0
        statFillFrom[i] = float(kingdomStats[i])
        statFillTo[i] = float(kingdomStats[i])
        statFlashT[i] = 0.0
        statFlashPositive[i] = false
        statUnlockRevealT[i] = 1.0
    }
}


def public apply_stat_unlocks_for_day(day : int) {
    for (i in range(STAT_COUNT)) {
        statUnlocked[i] = false
        statUnlockRevealT[i] = 1.0
    }
    statUnlocked[STAT_FOOD_IDX] = true
    statUnlocked[STAT_ARMY_IDX] = true
    statUnlocked[STAT_GOLD_IDX] = true
    statUnlocked[STAT_HEALTH_IDX] = true
    for (i in range(STAT_COUNT)) {
        if (STAT_UNLOCK_DAYS[i] <= 1) {
            continue
        }
        if (STAT_UNLOCK_DAYS[i] < day) {
            statUnlocked[i] = true
        }
    }
}


def public apply_stat_unlocks_for_saved_day(day : int; savedUnlocked : int[STAT_COUNT]) {
    for (i in range(STAT_COUNT)) {
        statUnlocked[i] = false
        statUnlockRevealT[i] = 1.0
    }
    statUnlocked[STAT_FOOD_IDX] = true
    statUnlocked[STAT_ARMY_IDX] = true
    statUnlocked[STAT_GOLD_IDX] = true
    statUnlocked[STAT_HEALTH_IDX] = true
    for (i in range(STAT_COUNT)) {
        if (STAT_UNLOCK_DAYS[i] <= 1) {
            continue
        }
        if (STAT_UNLOCK_DAYS[i] < day) {
            statUnlocked[i] = true
        } elif (STAT_UNLOCK_DAYS[i] == day && savedUnlocked[i] != 0) {
            statUnlocked[i] = true
        }
    }
}


def public reset_stat_unlocks() {
    apply_stat_unlocks_for_day(1)
    statUnlockCutsceneActive = false
    statUnlockCutsceneStatIdx = -1
}

def public clamp_stat(value : int) : int {
    return clamp(value, STAT_MIN, STAT_MAX)
}

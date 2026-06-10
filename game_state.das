require engine.core
require constants

var public kingdomStats : int[STAT_COUNT]
var public currentDay = 1
var public playerNickname = DEFAULT_NICKNAME
var public recordDays = 0
var public currentEncounterIdx = 0
var public currentNodeIdx = 0
var public pendingNextNodeIdx = NO_NEXT_NODE
var public defeatPhase = DEFEAT_NONE
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
var public menuContinueButtonHovered = false
var public menuButtonHoverT = 0.0
var public menuContinueButtonHoverT = 0.0
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
var public menuContinueButtonNode : NodeId
var public menuOptionsButtonNode : NodeId
var public menuExitButtonNode : NodeId
var public backgroundNode : NodeId
var public topBarRoot : NodeId
var public topBarBorderNode : NodeId
var public topBarLeftInfoNode : NodeId
var public dayTextNode : NodeId
var public nicknameTextNode : NodeId
var public statBarRoot : NodeId
var public statBarDividerNode : NodeId
var public statColumnNodes : NodeId[STAT_COUNT]
var public statIconWrapNodes : NodeId[STAT_COUNT]
var public statBarTrackNodes : NodeId[STAT_COUNT]
var public statBarFillNodes : NodeId[STAT_COUNT]
var public statEmphasisT : float[STAT_COUNT]
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

var public backgroundTexture : TextureId
var public gameFont : FontId
var public characterTexture : TextureId
var public nextVisitorTexture : TextureId
var public kingTexture : TextureId
var public peasantTexture : TextureId
var public deathScreenTexture : TextureId
var public visitorTextures : TextureId[VISITOR_TEXTURE_COUNT]
var public portraitTextures : TextureId[CHARACTER_COUNT]
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
        kingdomStats[i] = STAT_START
    }
}


def public reset_stat_anim_state() {
    for (i in range(STAT_COUNT)) {
        statEmphasisT[i] = 0.0
        statFillDisplayed[i] = float(kingdomStats[i])
        statConfirmPhase[i] = STAT_CONFIRM_IDLE
        statConfirmTimer[i] = 0.0
        statFillFrom[i] = float(kingdomStats[i])
        statFillTo[i] = float(kingdomStats[i])
        statFlashT[i] = 0.0
        statFlashPositive[i] = false
    }
}

def public clamp_stat(value : int) : int {
    return clamp(value, STAT_MIN, STAT_MAX)
}

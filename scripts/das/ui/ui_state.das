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

module ui_state public

var public introCutsceneRoot : NodeId
var public introCutsceneBgNode : NodeId
var public introCutsceneImageFrameNode : NodeId
var public introCutsceneImageShadowNode : NodeId
var public introCutsceneImageNode : NodeId
var public introCutsceneImageBevelBottomNode : NodeId
var public introCutsceneImageBevelRightNode : NodeId
var public introCutsceneImage3FrameNode : NodeId
var public introCutsceneImage3ShadowNode : NodeId
var public introCutsceneImage3Node : NodeId
var public introCutsceneImage3BevelBottomNode : NodeId
var public introCutsceneImage3BevelRightNode : NodeId
var public introCutsceneImage4FrameNode : NodeId
var public introCutsceneImage4ShadowNode : NodeId
var public introCutsceneImage4Node : NodeId
var public introCutsceneImage4BevelBottomNode : NodeId
var public introCutsceneImage4BevelRightNode : NodeId
var public introCutsceneImage5FrameNode : NodeId
var public introCutsceneImage5ShadowNode : NodeId
var public introCutsceneImage5Node : NodeId
var public introCutsceneImage5BevelBottomNode : NodeId
var public introCutsceneImage5BevelRightNode : NodeId
var public introCutsceneImage6FrameNode : NodeId
var public introCutsceneImage6ShadowNode : NodeId
var public introCutsceneImage6Node : NodeId
var public introCutsceneImage6BevelBottomNode : NodeId
var public introCutsceneImage6BevelRightNode : NodeId
var public introCutsceneTextColumnNode : NodeId
var public introCutsceneNameNode : NodeId
var public introCutsceneReplicaNode : NodeId
var public introCutsceneSkipRoot : NodeId
var public introCutsceneSkipTextNode : NodeId
var public introCutsceneSkipBarBgNode : NodeId
var public introCutsceneSkipBarFillNode : NodeId
var public introCutsceneSkipRightMouseDown = false
var public introFadeOverlay : NodeId
var public startupSplashRoot : NodeId
var public startupSplashBgNode : NodeId
var public startupSplashLogoNode : NodeId
var public startupSplashOverlayNode : NodeId
var public introCutsceneTexture : TextureId
var public introCutsceneTexture2 : TextureId
var public introCutsceneTexture3 : TextureId
var public introCutsceneTexture4 : TextureId
var public introCutsceneTexture5 : TextureId
var public introCutsceneTexture6 : TextureId
var public introCutsceneTexture7 : TextureId
var public introCutsceneTexture8 : TextureId
var public introCutsceneTexture9 : TextureId
var public introCutsceneTexture10 : TextureId
var public introCutsceneTexture11 : TextureId
var public introCutsceneTexture12 : TextureId
var public introCutsceneTexture13 : TextureId
var public introCutsceneTexture14 : TextureId
var public introCutsceneTexture15 : TextureId
var public introCutsceneTexture16 : TextureId
var public churchCutsceneTexture : TextureId
var public churchCutsceneSounds : SoundId[CHURCH_CUTSCENE_SOUND_COUNT]
var public introDialogueSounds : SoundId[INTRO_DIALOGUE_BEAT_COUNT]
var public backgroundMusicSound : SoundId
var public backgroundMusicHandle : SoundHandle
var public backgroundMusicLoaded = false
var public backgroundMusicDesired = false
var public backgroundMusicContext = -1
var public introCutsceneMusicSound : SoundId
var public introCutsceneMusicHandle : SoundHandle
var public introCutsceneMusicLoaded = false
var public introCutsceneMusicDesired = false
var public introWarHornSound : SoundId
var public introSwordFightSound : SoundId
var public introWarHornHandle : SoundHandle
var public introSwordFightHandle : SoundHandle
var public introBattleSfxLoaded = false
var public introCutsceneAssetsLoaded = false
var public deathScreenTexturesLoaded = false
var public menuButtonShineTexture : TextureId
var public advisorHudIconNode : NodeId
var public advisorHudIconTexture : TextureId
var public advisorHudIconHoverTexture : TextureId
var public advisorHudIconHovered = false
var public advisorIconAlphaWidth = 0
var public advisorIconAlphaHeight = 0
var public advisorIconAlphaPixels : array<uint>
var public advisorPopupAnimPhase = ADVISOR_ANIM_IDLE
var public advisorPopupSlideX = 0.0
var public advisorPopupSlideTargetX = 0.0
var public advisorPopupOverlay : NodeId
var public advisorPopupPanelNode : NodeId
var public advisorPopupInnerNode : NodeId
var public advisorPopupContentNode : NodeId
var public advisorPopupTitleNode : NodeId
var public advisorPopupTitleRowNode : NodeId
var public advisorPopupStatusNode : NodeId
var public advisorPopupScrollAreaNode : NodeId
var public advisorPopupScrollContentNode : NodeId
var public advisorPopupScrollBarNode : NodeId
var public advisorPopupGridNode : NodeId
var public advisorPopupPortraitNode : NodeId
var public advisorActionSlotNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionSlotFillNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionImageNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionOverlayNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionTextures : TextureId[MAX_ADVISOR_ACTIONS]
var public advisorActionTextureAspects : float[MAX_ADVISOR_ACTIONS]
var public advisorActionTitleNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionDescNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionEffectRowNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionEffectMinusNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionEffectPlusNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionEffectEmptyNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorActionHitNodes : NodeId[MAX_ADVISOR_ACTIONS]
var public advisorConfirmOverlay : NodeId
var public advisorConfirmPanelNode : NodeId
var public advisorConfirmInnerNode : NodeId
var public advisorConfirmContentNode : NodeId
var public advisorConfirmTitleNode : NodeId
var public advisorConfirmBodyNode : NodeId
var public advisorConfirmPreviewNode : NodeId
var public advisorConfirmYesNode : NodeId
var public advisorConfirmNoNode : NodeId
var public characterProfilePortraitFrameNode : NodeId
var public characterProfilePortraitInsetNode : NodeId
var public characterProfileDividerNode : NodeId
var public advisorCharacterTexture : TextureId
var public advisorCharacterTextureAspect = 1.0
var public advisorActionClickHandledThisFrame = false
var public choiceButtonCachedText : string[MAX_CHOICES]
var public choiceButtonCachedHeights : float[MAX_CHOICES]
var public statLastAppliedFillValue : float[STAT_COUNT]
var public characterLastBreathOffsetY = 0.0




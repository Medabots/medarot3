INCLUDE "game/src/common/constants.asm"

W_TutorialScrollOffset EQU $C562
W_TutorialCursorPosition EQU $C563

SECTION "Tutorial State Machine", ROMX[$5E07], BANK[$07]
TutorialStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw TutorialDrawingState
  dw TutorialMappingState
  dw TutorialPrepareFadeInState
  dw TutorialFadeState
  dw TutorialIntroMainscriptInitState
  dw TutorialIntroMessageState
  dw TutorialInputHandlerState
  dw TutorialHideVerticalNavigationArrowsState
  dw TutorialDescriptionMainscriptInitState
  dw TutorialDescriptionMessageState
  dw TutorialReturnToIntroState
  dw TutorialPlaceholderState
  dw TutorialPrepareFadeOutState
  dw TutorialFadeState
  dw TutorialExitState
  dw TutorialPlaceholderState
  dw TutorialPlaceholderState

TutorialIntroMessageState::
  ld a, [W_ItemActionMessageIndex]
  ld b, a
  ld a, [W_ItemActionMessageIndex + 1]
  ld c, a
  ld a, 1
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

TutorialDescriptionMessageState::
  ld a, [W_ItemActionMessageIndex]
  ld b, a
  ld a, [W_ItemActionMessageIndex + 1]
  ld c, a
  ld a, $25
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

TutorialFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

TutorialDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $1D
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, 2
  call $33C6
  ld a, $18
  ld b, 0
  call $3527
  jp IncSubStateIndex

TutorialMappingState::
  xor a
  ld [W_TutorialScrollOffset], a
  ld [W_TutorialCursorPosition], a
  ld [W_MedalMenuSelectedMedaliaSlot], a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld bc, 0
  ld e, $78
  ld a, 2
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $78
  ld a, 2
  call WrapDecompressAttribmap0
  ld bc, $108
  ld e, $C2
  ld a, 0
  call WrapDecompressTilemap0
  call $5F6B
  call $5FB6
  jp IncSubStateIndex

TutorialPrepareFadeInState::
  ld hl, $93
  ld bc, $16
  ld d, $C7
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

TutorialIntroMainscriptInitState::
  ld bc, $56
  call PrepareMainScriptForTutorial
  jp IncSubStateIndex

TutorialInputHandlerState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld de, $C0C0
  call $33B7
  call $6086
  call $601E
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, $C
  ld [W_CoreSubStateIndex], a
  ret

TutorialHideVerticalNavigationArrowsState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 3
  call ScheduleSoundEffect
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ld a, $CC
  ld [$C0C2], a
  ld a, $18
  ld b, 1
  call $3527
  jp IncSubStateIndex

TutorialDescriptionMainscriptInitState::
  ld a, [W_TutorialScrollOffset]
  ld b, a
  ld a, [W_TutorialCursorPosition]
  add b
  ld c, a
  ld b, 0
  call PrepareMainScriptForTutorial
  jp IncSubStateIndex

TutorialReturnToIntroState::
  ld a, $18
  ld b, 0
  call $3527
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

TutorialPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $C7
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

TutorialExitState::
  call $343B
  jp $36A3

TutorialPlaceholderState::
  ret

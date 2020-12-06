INCLUDE "game/src/common/constants.asm"

SECTION "Pause Menu State Machine 1", ROMX[$4000], BANK[$06]
PauseMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw PauseMenuInitState
  dw $40E4
  dw $4105
  dw PauseMenuMappingState
  dw $4144
  ; Exit states.
  dw $417E
  dw $419E
  dw $41BF
  dw $41C2
  dw $41CD
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 1 states.
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw $40B9
  dw $422B
  dw $425E
  dw $426F
  dw $427C
  dw $429D
  dw $42C8
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 2 states.
  dw $42D6
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw $40B9
  dw $422B
  dw $425E
  dw $426F
  dw $427C
  dw $429D
  dw $42EC
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 3 states.
  dw $4308
  dw $4338
  dw $435D
  dw $4395
  dw $43E7
  dw $441A
  dw $4458
  dw $4487
  dw $449A
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 4 states.
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw $40B9
  dw $422B
  dw $425E
  dw $426F
  dw $427C
  dw $429D
  dw $47BA
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw $47C4
  dw $47DC
  dw PauseMenuPlaceholderState

SECTION "Pause Menu State Machine 2", ROMX[$40AE], BANK[$06]
PauseMenuFadeOutState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 3", ROMX[$40CB], BANK[$06]
PauseMenuInitState::
  ld a, 1
  ld [$C4D9], a
  ld a, 1
  ld [$C498], a
  ld a, [W_ShadowREG_SCX]
  ld [$C490], a
  ld a, [W_ShadowREG_SCY]
  ld [$C491], a
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 4", ROMX[$4118], BANK[$06]
PauseMenuMappingState::
  ld a, 1
  ld [$C4D9], a
  ld bc, $C00
  ld e, $12
  ld a, 0
  call $33D5
  ld bc, $C00
  ld e, $12
  ld a, 0
  call $33DA
  ld bc, 3
  ld a, 6
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  call $47F5
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 5", ROMX[$41FD], BANK[$06]
PauseMenuPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $BF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 6", ROMX[$47F4], BANK[$06]
PauseMenuPlaceholderState::
  ret

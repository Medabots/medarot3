INCLUDE "game/src/common/constants.asm"

SECTION "Pause Menu State Machine 1", ROMX[$4000], BANK[$06]
PauseMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $40CB
  dw $40E4
  dw $4105
  dw PauseMenuMappingState
  dw $4144
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
  dw $41FD
  dw $40AE
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
  dw $42D6
  dw $41FD
  dw $40AE
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
  dw $41FD
  dw $40AE
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

SECTION "Pause Menu State Machine 2", ROMX[$4118], BANK[$06]
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

SECTION "Pause Menu State Machine 3", ROMX[$47F4], BANK[$06]
PauseMenuPlaceholderState::

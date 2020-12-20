INCLUDE "game/src/common/constants.asm"

SECTION "Medawatch State Machine 1", ROMX[$5440], BANK[$06]
MedawatchStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw MedawatchDrawingState
  dw MedawatchMappingState
  dw MedawatchPrepareFadeInState
  dw MedawatchFadeState
  dw MedawatchPositionOverlayState
  dw PauseMenuSlideInOverlayState
  dw $555F
  dw $5584
  dw MedawatchFadeState
  dw MedawatchPositionOverlayState
  dw PauseMenuOverlayMappingState
  dw PauseMenuPositionOverlayState
  dw $56A7
  dw $427C
  dw $559B
  dw $55D8
  dw $55FB
  dw MedawatchFadeState
  dw $5612
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw $561D
  dw $5639
  dw $565D
  dw MedawatchFadeState
  dw $566F
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState
  dw MedawatchPlaceholderState

MedawatchFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

MedawatchDrawingState::
  ld bc, 6
  call WrapLoadMaliasGraphics
  call $2CEC
  ld h, 0
  ld l, a
  ld bc, 7
  add hl, bc
  ld b, h
  ld c, l
  call WrapLoadMaliasGraphics
  ld bc, $C
  call WrapLoadMaliasGraphics
  ld bc, $D
  call WrapLoadMaliasGraphics
  call $3475
  ld a, [W_CoreStateIndex]
  cp $A
  jp nz, IncSubStateIndex
  ld a, $3F
  call $27BA
  jp IncSubStateIndex

SECTION "Medawatch State Machine 2", ROMX[$54F9], BANK[$06]
MedawatchMappingState::
  ld bc, 0
  ld e, $13
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, $C0D
  ld e, $18
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, 0
  ld e, $13
  ld a, 0
  call WrapDecompressAttribmap0ScrollAdjusted
  call $5708
  jp IncSubStateIndex

MedawatchPrepareFadeInState::
  call $2CEC
  ld h, 0
  ld l, a
  ld bc, $12
  add hl, bc
  ld bc, $12
  ld d, $3F
  ld e, $F
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedawatchPositionOverlayState::
  ld a, $A0
  ld [W_ShadowREG_WX], a
  ld a, $68
  ld [W_ShadowREG_WY], a
  ld a, 1
  call $1554
  jp IncSubStateIndex

PauseMenuSlideInOverlayState::
  ld a, [W_ShadowREG_WX]
  sub 4
  ld [W_ShadowREG_WX], a
  cp $60
  ret nz
  call $56BA
  call $56C9
  call $5721
  jp IncSubStateIndex

SECTION "Medawatch State Machine 3", ROMX[$56B9], BANK[$06]
MedawatchPlaceholderState::
  ret

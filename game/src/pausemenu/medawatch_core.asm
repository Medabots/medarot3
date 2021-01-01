INCLUDE "game/src/common/constants.asm"

SECTION "Medawatch Menu Selected Option", WRAM0[$C563]
W_MedawatchMenuSelectedOption:: ds 1

SECTION "Medawatch State Machine 1", ROMX[$5440], BANK[$06]
MedawatchStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw MedawatchDrawingState ; 00
  dw MedawatchMappingState ; 01
  dw MedawatchPrepareFadeInState ; 02
  dw MedawatchFadeState ; 03
  dw MedawatchPositionOverlayState ; 04
  dw PauseMenuSlideInOverlayState ; 05
  dw MedawatchInputHandlerState ; 06
  dw MedawatchPreExitPrepareFadeOutState ; 07
  dw MedawatchFadeState ; 08
  dw MedawatchPositionOverlayState ; 09
  dw PauseMenuOverlayMappingState ; 0A
  dw PauseMenuPositionOverlayState ; 0B
  dw MedawatchRestoreOverworldScrollPositionState ; 0C
  dw $427C ; 0D
  dw MedawatchOverworldDrawingState ; 0E
  dw $55D8 ; 0F
  dw MedawatchPrepareFadeInForOverworldState ; 10
  dw MedawatchFadeState ; 11
  dw MedawatchExitState ; 12
  dw MedawatchPlaceholderState ; 13
  dw MedawatchPlaceholderState ; 14
  dw MedawatchPlaceholderState ; 15
  dw MedawatchPlaceholderState ; 16
  dw MedawatchPlaceholderState ; 17
  dw MedawatchPlaceholderState ; 18
  dw MedawatchPlaceholderState ; 19
  dw MedawatchPlaceholderState ; 1A
  dw MedawatchPlaceholderState ; 1B
  dw MedawatchPlaceholderState ; 1C
  dw MedawatchPlaceholderState ; 1D
  dw MedawatchPlaceholderState ; 1E
  dw MedawatchPlaceholderState ; 1F
  dw $561D ; 20
  dw $5639 ; 21
  dw MedawatchPrepareFadeOutForSubscreenState ; 22
  dw MedawatchFadeState ; 23
  dw MedawatchOpenSubscreenState ; 24
  dw MedawatchPlaceholderState ; 25
  dw MedawatchPlaceholderState ; 26
  dw MedawatchPlaceholderState ; 27
  dw MedawatchPlaceholderState ; 28
  dw MedawatchPlaceholderState ; 29
  dw MedawatchPlaceholderState ; 2A
  dw MedawatchPlaceholderState ; 2B
  dw MedawatchPlaceholderState ; 2C
  dw MedawatchPlaceholderState ; 2D
  dw MedawatchPlaceholderState ; 2E
  dw MedawatchPlaceholderState ; 2F
  dw MedawatchPlaceholderState ; 30

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

MedawatchInputHandlerState::
  ld de, $C0C0
  call $33B7
  call $5781
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 3
  call $27DA
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

.aNotPressed
  call $573E
  ret

MedawatchPreExitPrepareFadeOutState::
  ld a, 4
  call $27DA
  ld hl, 1
  ld bc, 1
  ld d, $BF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedawatchOverworldDrawingState::
  ld a, 0
  call $1554
  ld a, [$C622]
  ld b, a
  ld a, [$C623]
  ld c, a
  call WrapLoadMaliasGraphics
  xor a
  call $349E
  call $34C8
  xor a
  call $349E
  call $33C6
  jp IncSubStateIndex

SECTION "Medawatch State Machine 3", ROMX[$55FB], BANK[$06]
MedawatchPrepareFadeInForOverworldState::
  ld a, [$C628]
  ld h, a
  ld a, [$C629]
  ld l, a
  ld bc, $10
  ld d, $3F
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedawatchExitState::
  ld a, 9
  ld [W_CoreStateIndex], a
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Medawatch State Machine 4", ROMX[$565D], BANK[$06]
MedawatchPrepareFadeOutForSubscreenState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedawatchOpenSubscreenState::
  ld a, 0
  ld [$C4EE], a
  ld a, $14
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, $12
  ld [$C4F1], a
  ld a, 3
  call $1153
  ld a, [W_MedawatchMenuSelectedOption]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  call $57B4
  call $57C3
  call $57D3
  ret

.table
  db $F, $E, $D

MedawatchRestoreOverworldScrollPositionState::
  call $342B
  ld a, [W_PauseMenuPerserveSCX]
  ld [W_ShadowREG_SCX], a
  ld a, [W_PauseMenuPerserveSCY]
  ld [W_ShadowREG_SCY], a
  jp IncSubStateIndex

MedawatchPlaceholderState::
  ret

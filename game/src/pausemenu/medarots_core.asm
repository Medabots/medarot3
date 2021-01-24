INCLUDE "game/src/common/constants.asm"

SECTION "Medarots State Machine 1", ROMX[$4000], BANK[$07]
MedarotsStateMachine::
  ld a, [$C522]
  cp 2
  jr nz, .fireState
  call $5D92
  ld a, [$C4EE]
  or a
  jr z, .fireState
  ld a, $1B
  ld [W_CoreStateIndex], a
  ld a, $B0
  ld [W_CoreSubStateIndex], a
  ret

.fireState
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw MedarotsSelectionScreenDrawingState ; 00
  dw MedarotsSelectionScreenMappingState ; 01
  dw MedarotsSelectionScreenPrepareFadeIn ; 02
  dw MedarotsFadeState ; 03
  dw $41AD ; 04
  dw MedarotsPrepareMainScriptState ; 05
  dw $424E ; 06
  dw MedarotsPlaceholderState ; 07
  dw $427E ; 08
  dw MedarotsFadeState ; 09
  dw $4290 ; 0A
  dw MedarotsPlaceholderState ; 0B
  dw $4266 ; 0C
  dw MedarotsPlaceholderState ; 0D
  dw MedarotsPlaceholderState ; 0E
  dw MedarotsPlaceholderState ; 0F
  dw $4296 ; 10
  dw $42C0 ; 11
  dw $432A ; 12
  dw MedarotsFadeState ; 13
  dw $433C ; 14
  dw MedarotsPrepareFadeOutState ; 15
  dw MedarotsFadeState ; 16
  dw $439A ; 17
  dw MedarotsPlaceholderState ; 18
  dw MedarotsPlaceholderState ; 19
  dw $4296 ; 1A
  dw $42C0 ; 1B
  dw $4449 ; 1C
  dw $4463 ; 1D
  dw MedarotsPlaceholderState ; 1E
  dw MedarotsPlaceholderState ; 1F
  dw $427E ; 20
  dw MedarotsFadeState ; 21
  dw $4469 ; 22
  dw MedarotsPlaceholderState ; 23
  dw MedarotsPlaceholderState ; 24
  dw MedarotsPlaceholderState ; 25
  dw MedarotsPlaceholderState ; 26
  dw MedarotsPlaceholderState ; 27
  dw MedarotsPlaceholderState ; 28
  dw MedarotsPlaceholderState ; 29
  dw MedarotsPlaceholderState ; 2A
  dw MedarotsPlaceholderState ; 2B
  dw MedarotsPlaceholderState ; 2C
  dw MedarotsPlaceholderState ; 2D
  dw MedarotsPlaceholderState ; 2E
  dw MedarotsPlaceholderState ; 2F
  dw $446E ; 30
  dw $44CE ; 31
  dw MedarotsPrepareFadeOutState ; 32
  dw MedarotsFadeState ; 33
  dw $4593 ; 34
  dw $4503 ; 35
  dw $453D ; 36
  dw MedarotsFadeState ; 37
  dw $454F ; 38
  dw MedarotsPrepareFadeOutState ; 39
  dw MedarotsFadeState ; 3A
  dw $42C0 ; 3B
  dw $4471 ; 3C
  dw $4565 ; 3D
  dw MedarotsFadeState ; 3E
  dw $458D ; 3F
  dw $459F ; 40
  dw MedarotsPrepareFadeOutState ; 41
  dw MedarotsFadeState ; 42
  dw $4593 ; 43
  dw $45BE ; 44
  dw $45E5 ; 45
  dw $4615 ; 46
  dw $462E ; 47
  dw MedarotsPlaceholderState ; 48
  dw MedarotsPlaceholderState ; 49
  dw MedarotsPlaceholderState ; 4A
  dw MedarotsPlaceholderState ; 4B
  dw MedarotsPlaceholderState ; 4C
  dw MedarotsPlaceholderState ; 4D
  dw MedarotsPlaceholderState ; 4E
  dw MedarotsPlaceholderState ; 4F
  dw $4639 ; 50
  dw $469F ; 51
  dw $46D2 ; 52
  dw MedarotsPrepareFadeOutState ; 53
  dw MedarotsFadeState ; 54
  dw $46DD ; 55
  dw MedarotsPlaceholderState ; 56

MedarotsPrepareMainScriptState::
  call WrapInitiateMainScript
  jp IncSubStateIndex

MedarotsFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

MedarotsUnusedFadeState::
  ld de, $C0C0
  call $33B7
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

MedarotsPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedarotsSelectionScreenDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $15
  call WrapLoadMaliasGraphics
  ld bc, $16
  call WrapLoadMaliasGraphics
  ld bc, $17
  call WrapLoadMaliasGraphics
  ld bc, 4
  call $33C6
  ld a, [$C595]
  cp 1
  jp nz, IncSubStateIndex
  ld bc, $7C
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

MedarotsSelectionScreenMappingState::
  ld bc, 0
  ld e, $44
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $44
  ld a, 0
  call WrapDecompressAttribmap0
  call $5BA6
  call $5C59
  call $46FF
  ld bc, $A01
  call $4811
  ld bc, $B0B
  call $4899
  call $491D
  ld a, $80
  ld [$C592], a
  jp IncSubStateIndex

MedarotsSelectionScreenPrepareFadeIn::
  ld a, [$C595]
  cp 1
  jp z, .isBattleSelectionScreen
  ld hl, $29
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call $485F
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

.isBattleSelectionScreen
  ld hl, $8C
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call $485F
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

SECTION "Medarots State Machine 2", ROMX[$46FE], BANK[$07]
MedarotsPlaceholderState::
  ret

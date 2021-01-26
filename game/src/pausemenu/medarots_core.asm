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

; Selector screen states.

  dw MedarotsSelectionScreenDrawingState ; 00
  dw MedarotsSelectionScreenMappingState ; 01
  dw MedarotsSelectionScreenPrepareFadeInState ; 02
  dw MedarotsFadeState ; 03
  dw MedarotsSelectionScreenInputHandlerState ; 04
  dw MedarotsPrepareMainScriptState ; 05
  dw MedarotsNoBattleReadyMedarotsMessageState ; 06
  dw MedarotsPlaceholderState ; 07
  dw MedarotsPrepareFadeOutToWhiteState ; 08
  dw MedarotsFadeState ; 09
  dw MedarotsJumpToStatusScreenState ; 0A
  dw MedarotsPlaceholderState ; 0B
  dw MedarotsMissingStarterMedalMessageState ; 0C
  dw MedarotsPlaceholderState ; 0D
  dw MedarotsPlaceholderState ; 0E
  dw MedarotsPlaceholderState ; 0F

; Status screen states.

  dw MedarotsStatusDrawingState ; 10
  dw MedarotsStatusMappingState ; 11
  dw MedarotsStatusPrepareFadeInFromWhiteState ; 12
  dw MedarotsFadeState ; 13
  dw MedarotsStatusInputHandlerState ; 14
  dw MedarotsPrepareFadeOutState ; 15
  dw MedarotsFadeState ; 16
  dw $439A ; 17
  dw MedarotsPlaceholderState ; 18
  dw MedarotsPlaceholderState ; 19
  dw MedarotsStatusDrawingState ; 1A
  dw MedarotsStatusMappingState ; 1B
  dw $4449 ; 1C
  dw $4463 ; 1D
  dw MedarotsPlaceholderState ; 1E
  dw MedarotsPlaceholderState ; 1F

; Exit status screen states.

  dw MedarotsPrepareFadeOutToWhiteState ; 20
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

; Medachange states.

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
  dw MedarotsStatusMappingState ; 3B
  dw $4471 ; 3C
  dw $4565 ; 3D
  dw MedarotsFadeState ; 3E
  dw $458D ; 3F

; Exit selection screen states.

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

; Battle-specific states.

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

MedarotsSelectionScreenPrepareFadeInState::
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

MedarotsSelectionScreenInputHandlerState::
  ld a, [$C595]
  cp 1
  jr nz, .notBattleSystem
  ld a, $50
  ld [W_CoreSubStateIndex], a
  ret

.notBattleSystem
  ld de, $C0C0
  call $33B7
  call $492A
  call $497B
  call $4967
  call $4A79
  call $4A96
  ld a, [$C592]
  cp $80
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  call $4B5E
  or a
  ret z
  ld a, $CD
  ld [$C0C2], a
  ld a, 5
  ld [$C0C5], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call $4B77
  call $4B96
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  ld a, [$C584]
  or a
  jr z, .notInSortingMode
  ld a, [$C584]
  and $7F
  call $4970
  ld a, [de]
  or 1
  ld [de], a
  call $4A6F
  xor a
  ld [$C584], a
  ret

.notInSortingMode
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [$C583]
  call $4970
  call $4A6F
  ld a, 0
  ld [$C0C0], a
  call $4B1B
  or a
  jp nz, IncSubStateIndex
  call $4B34
  or a
  jr z, .hasStarterMedal
  call WrapInitiateMainScript
  ld a, $C
  ld [W_CoreSubStateIndex], a
  ret

.hasStarterMedal
  ld a, $40
  ld [W_CoreSubStateIndex], a
  ret

MedarotsNoBattleReadyMedarotsMessageState::
  ld bc, 3
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 1
  ld [$C0C0], a
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

MedarotsMissingStarterMedalMessageState::
  ld bc, $55
  ld a, 1
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 1
  ld [$C0C0], a
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

MedarotsPrepareFadeOutToWhiteState::
  ld hl, 0
  ld bc, 0
  ld d, $F7
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedarotsJumpToStatusScreenState::
  ld a, $10
  ld [W_CoreSubStateIndex], a
  ret

MedarotsStatusDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $15
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $17
  call WrapLoadMaliasGraphics
  ld bc, 4
  call $33C6
  jp IncSubStateIndex

MedarotsStatusMappingState::
  ld bc, 0
  ld e, $45
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $45
  ld a, 0
  call WrapDecompressAttribmap0
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call $4C0C
  call $4CA2
  ld bc, $A01
  call $5592
  ld bc, $101
  call $4D16
  ld bc, $608
  call $4D4E
  ld bc, $407
  call $4D81
  ld bc, $60A
  call $4DC6
  ld bc, $60C
  call $4DF1
  ld bc, $60E
  call $4E1C
  ld bc, $610
  call $4E47
  call $4E94
  call $4ED6
  call $4F18
  call $4F5A
  call $4F9C
  call $5097
  call $577E
  call $57B6
  jp IncSubStateIndex

MedarotsStatusPrepareFadeInFromWhiteState::
  ld hl, $2A
  ld bc, $16
  ld d, $F7
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedarotsStatusInputHandlerState::
  ld de, $C0E0
  call $33B7
  ld de, $C100
  call $33B7
  call $4CA2
  call $503B
  call $50AE
  call $50FC
  call $512D
  call $520C
  call $52E8
  call $53C4
  call $54A0
  call $55A5
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call $5AC8
  ld a, [$C4EE]
  or a
  ret nz
  call $57CF
  ld a, [$C4EE]
  or a
  jr z, .medachangeOverlayNotRequested
  call $4C0C
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

.medachangeOverlayNotRequested
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  call $5668
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ld a, 4
  call $27DA
  ret

SECTION "Medarots State Machine 2", ROMX[$46FE], BANK[$07]
MedarotsPlaceholderState::
  ret

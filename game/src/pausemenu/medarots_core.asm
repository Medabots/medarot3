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
  dw MedarotsStatusOpenExternalSubscreenState ; 17
  dw MedarotsPlaceholderState ; 18
  dw MedarotsPlaceholderState ; 19
  dw MedarotsStatusDrawingState ; 1A
  dw MedarotsStatusMappingState ; 1B
  dw MedarotsStatusPrepareFadeInFromExternalSubscreenState ; 1C
  dw MedarotsJumpToStatusState ; 1D
  dw MedarotsPlaceholderState ; 1E
  dw MedarotsPlaceholderState ; 1F

; Exit status screen states.

  dw MedarotsPrepareFadeOutToWhiteState ; 20
  dw MedarotsFadeState ; 21
  dw MedarotsJumpToSelectorState ; 22
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

  dw MedarotsMedachangeWindowMappingState ; 30
  dw MedarotsMedachangeWindowInputHandlerState ; 31
  dw MedarotsPrepareFadeOutState ; 32
  dw MedarotsFadeState ; 33
  dw MedarotsResetStuffState ; 34
  dw MedarotsMedachangeMappingState ; 35
  dw MedarotsPrepareFadeIntoMedachangeScreenState ; 36
  dw MedarotsFadeState ; 37
  dw MedarotsMedachangeInputHandler ; 38
  dw MedarotsPrepareFadeOutState ; 39
  dw MedarotsFadeState ; 3A
  dw MedarotsStatusMappingState ; 3B
  dw MedarotsMedachangeWindowMappingOnReturnState ; 3C
  dw MedarotsStatusPrepareFadeInToMedachangeWindowState ; 3D
  dw MedarotsFadeState ; 3E
  dw MedarotsJumpToMedachangeWindowState ; 3F

; Exit selection screen states.

  dw MedarotsConditionalVariableExitState ; 40
  dw MedarotsPrepareFadeOutState ; 41
  dw MedarotsFadeState ; 42
  dw MedarotsResetStuffState ; 43
  dw MedarotsMedawatchDrawingState ; 44
  dw MedarotsMedawatchRestoreOddsAndEndsState ; 45
  dw MedarotsPrepareMedawatchMenuFadeInState ; 46
  dw MedarotsExitToMedawatchMenuState ; 47
  dw MedarotsPlaceholderState ; 48
  dw MedarotsPlaceholderState ; 49
  dw MedarotsPlaceholderState ; 4A
  dw MedarotsPlaceholderState ; 4B
  dw MedarotsPlaceholderState ; 4C
  dw MedarotsPlaceholderState ; 4D
  dw MedarotsPlaceholderState ; 4E
  dw MedarotsPlaceholderState ; 4F

; Battle-specific states.

  dw MedarotsBattleSelectionScreenInputHandlerState ; 50
  dw MedarotsSelectionScreenPrepareBattleEntryState ; 51
  dw MedarotsBattleSelectionScreenWaitState ; 52
  dw MedarotsPrepareFadeOutState ; 53
  dw MedarotsFadeState ; 54
  dw MedarotsSelectionScreenBattleEntryState ; 55
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


MedarotsStatusOpenExternalSubscreenState::
  ld a, [W_MedarotStatusSelectedOption]
  cp 0
  jr nz, .medalNotSelected
  call $5DBD
  ld a, [$C529]
  ld [W_SelectedItemInventorySlotIndex], a
  ld a, 1
  ld [W_TransportOptionSubSubSubStateIndex], a
  ld a, $E
  ld [W_CoreStateIndex], a
  ld a, $12
  ld [W_CoreSubStateIndex], a
  ret

.medalNotSelected
  cp 1
  jr nz, .headPartNotSelected
  ld a, 1
  ld [$C56B], a
  xor a
  ld [$C566], a
  ld a, [$C525]
  ld [$C56C], a
  ld a, [$C566]
  call $5603
  ld a, $D
  ld [W_CoreStateIndex], a
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

.headPartNotSelected
  cp 2
  jr nz, .leftArmPartNotSelected
  ld a, 1
  ld [$C56B], a
  ld a, 1
  ld [$C566], a
  ld a, [$C526]
  ld [$C56C], a
  ld a, [$C566]
  call $5603
  ld a, $D
  ld [W_CoreStateIndex], a
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

.leftArmPartNotSelected
  cp 3
  jr nz, .rightArmPartNotSelected
  ld a, 1
  ld [$C56B], a
  ld a, 2
  ld [$C566], a
  ld a, [$C527]
  ld [$C56C], a
  ld a, [$C566]
  call $5603
  ld a, $D
  ld [W_CoreStateIndex], a
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

.rightArmPartNotSelected
  ld a, 1
  ld [$C56B], a
  ld a, 3
  ld [$C566], a
  ld a, [$C528]
  ld [$C56C], a
  ld a, [$C566]
  call $5603
  ld a, $D
  ld [W_CoreStateIndex], a
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

MedarotsStatusPrepareFadeInFromExternalSubscreenState::
  ld hl, $2A
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call $4869
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

MedarotsJumpToStatusState::
  ld a, $13
  ld [W_CoreSubStateIndex], a
  ret

MedarotsJumpToSelectorState::
  xor a
  ld [W_CoreSubStateIndex], a
  ret

MedarotsMedachangeWindowMappingState::
  call $5807
  ; Continues into MedarotsMedachangeWindowMappingOnReturnState

MedarotsMedachangeWindowMappingOnReturnState::
  ld bc, $206
  ld e, $4A
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $48
  ld a, 0
  call WrapDecompressTilemap1
  ld bc, 0
  ld e, $48
  ld a, 0
  call WrapDecompressAttribmap1
  ld bc, $A03
  ld a, [$C602]
  add $B0
  ld e, a
  ld a, 0
  call WrapDecompressTilemap1
  ld hl, $94A0
  call $3603
  xor a
  ld [$C5FB], a
  ld bc, $101
  ld a, 1
  call $360E
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $30
  ld [W_ShadowREG_WX], a
  ld a, $40
  ld [W_ShadowREG_WY], a
  ld a, 1
  call $1554
  jp IncSubStateIndex

MedarotsMedachangeWindowInputHandlerState::
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 3
  call $27DA
  jp IncSubStateIndex

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB | M_JPInputSelect
  ret z
  ld a, 4
  call $27DA
  call $5097
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  call $1554
  ld bc, $206
  ld e, $47
  ld a, 0
  call WrapDecompressTilemap0
  ld a, $14
  ld [W_CoreSubStateIndex], a
  ret

MedarotsMedachangeMappingState::
  xor a
  ld [W_MedalMenuSelectedMedaliaSlot], a
  ld bc, 0
  ld e, $4B
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $4B
  ld a, 0
  call WrapDecompressAttribmap0
  ld bc, $A00
  ld e, $4C
  ld a, 0
  call WrapDecompressAttribmap0
  ld bc, $101
  call $4D16
  call $5815
  call $5874
  call WrapInitiateMainScript
  call $5A16
  call $5A3E
  jp IncSubStateIndex

MedarotsPrepareFadeIntoMedachangeScreenState::
  ld hl, $2B
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedarotsMedachangeInputHandler::
  ld de, $C0C0
  call $33B7
  call $5A77
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call $27DA
  jp IncSubStateIndex

MedarotsStatusPrepareFadeInToMedachangeWindowState::
  ld de, $C0C0
  call $341B
  ld hl, $2A
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call $4869
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  call $57E8
  ld a, 2
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

MedarotsJumpToMedachangeWindowState::
  ld a, $31
  ld [W_CoreSubStateIndex], a
  ret

MedarotsResetStuffState::
  call $3413
  call $343B
  call $3475
  jp IncSubStateIndex

MedarotsConditionalVariableExitState::
  ld a, [$C595]
  or a
  jp z, IncSubStateIndex
  ld a, [$C597]
  ld [W_CoreStateIndex], a
  ld a, [$C598]
  ld [W_CoreSubStateIndex], a
  ld a, [$C597]
  cp 8
  ret nz
  ld a, $9A
  ld [$C0A6], a
  ret

MedarotsMedawatchDrawingState::
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
  jp IncSubStateIndex

MedarotsMedawatchRestoreOddsAndEndsState::
  ld a, [W_PauseMenuPerserveSCX]
  ld [W_ShadowREG_SCX], a
  ld a, [W_PauseMenuPerserveSCY]
  ld [W_ShadowREG_SCY], a
  ld a, 0
  ld [$C4EE], a
  ld a, $14
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, $12
  ld [$C4F1], a
  ld a, 3
  call $123B
  call $5DD9
  ld a, 1
  call $5DF2
  jp IncSubStateIndex

MedarotsPrepareMedawatchMenuFadeInState::
  call $2CEC
  ld h, 0
  ld l, a
  ld bc, $12
  add hl, bc
  ld bc, $12
  ld d, $7F
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

MedarotsExitToMedawatchMenuState::
  ld a, $A
  ld [W_CoreStateIndex], a
  ld a, 3
  ld [W_CoreSubStateIndex], a
  ret

MedarotsBattleSelectionScreenInputHandlerState::
  ld de, $C0C0
  call $33B7
  call $492A
  call $497B
  call $4967
  ld a, [$C592]
  cp $80
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  call $4B5E
  or a
  ret z
  ld a, [de]
  cp 3
  jp nz, MedarotsPlayBzztSound
  call $5C85
  or a
  jp nz, MedarotsPlayBzztSound
  ld a, 3
  call $27DA
  ld a, [$C583]
  call $4970
  call $4A6F
  call $5CA5
  call $5CC8
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call $5D00
  ret

.aNotPressed
  call $5D3F
  ld a, [$C4EE]
  or a
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputStart
  ret z
  ld a, [$C596]
  or a
  ret z
  ld a, 3
  call $27DA
  jp IncSubStateIndex

MedarotsSelectionScreenPrepareBattleEntryState::
  ld a, [$C583]
  call $4970
  call $4A6F
  ld bc, $A01
  call $4811
  ld bc, $B0B
  call $4899
  call $488B
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld [$C0C0], a
  ld bc, $103
  ld hl, $99C1
  call $25E5
  ld a, $3C
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

MedarotsBattleSelectionScreenWaitState::
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  jp IncSubStateIndex

MedarotsSelectionScreenBattleEntryState::
  ld bc, 5
  call WrapLoadMaliasGraphics
  ld a, [$C522]
  cp 2
  jr z, .isLink
  ld a, $10
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

.isLink
  ld a, $1C
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

MedarotsPlaceholderState::
  ret

INCLUDE "game/src/common/constants.asm"

DEF W_PartStatsBuffer EQU $C552

SECTION "Parts State Machine 1", ROMX[$5EBB], BANK[$06]
PartsStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table

; List states.

  dw PartsListDrawingState ; 00
  dw PartsListMappingState ; 01
  dw PartsListPrepareFadeInState ; 02
  dw PartsFadeState ; 03
  dw PartsListInputHandlerState ; 04
  dw PartsListUpdatePartImageState ; 05
  dw PartsListPrepareFadeOutState ; 06
  dw PartsFadeState ; 07

; Status states.

  dw PartsStatusDrawingState ; 08
  dw PartsStatusMappingState ; 09
  dw PartsStatusInitiateMainScriptState ; 0A
  dw PartsStatusDisplayDescriptionTextState ; 0B
  dw PartsStatusPrepareFadeInState ; 0C
  dw PartsFadeState ; 0D
  dw PartsStatusInputHandlerState ; 0E
  dw PartsStatusInitiateMainScriptState ; 0F
  dw PartsStatusPrepareFadeOutPartImageState ; 10
  dw PartsFadeState ; 11
  dw PartsStatusRefreshScreenState ; 12
  dw PartsStatusDisplayDescriptionTextState ; 13
  dw PartsStatusPrepareFadeInPartImageState ; 14
  dw PartsFadeState ; 15
  dw PartsStatusRestoreArrowsState ; 16
  dw PartsPlaceholderState ; 17
  dw PartsPlaceholderState ; 18
  dw PartsPlaceholderState ; 19

; Status exit states.

  dw PartsStatusPrepareFadeOutState ; 1A
  dw PartsFadeState ; 1B
  dw PartsStatusExitState ; 1C
  dw PartsPlaceholderState ; 1D
  dw PartsPlaceholderState ; 1E
  dw PartsPlaceholderState ; 1F

; List exit states.

  dw PartsListPrepareFadeOutState ; 20
  dw PartsFadeState ; 21
  dw PartsListPointlessConditionalExitToMedarotScreenThatDoesntWorkState ; 22
  dw MedawatchDrawingState ; 23
  dw PartsListMedawatchRestoreOddsAndEndsState ; 24
  dw PartsListPrepareMedawatchMenuFadeInState ; 25
  dw PartsListExitToMedawatchMenuState ; 26
  dw PartsPlaceholderState ; 27
  dw PartsPlaceholderState ; 28
  dw PartsPlaceholderState ; 29
  dw PartsPlaceholderState ; 2A
  dw PartsPlaceholderState ; 2B
  dw PartsPlaceholderState ; 2C
  dw PartsPlaceholderState ; 2D
  dw PartsPlaceholderState ; 2E
  dw PartsPlaceholderState ; 2F

; Link-related states.

  dw PartsListLinkOverlayMappingState ; 30
  dw PartsListLinkOverlayInputHandlerState ; 31
  dw PartsListLinkOverlayActionState ; 32
  dw PartsListPrepareFadeOutToWhiteState ; 33
  dw PartsFadeState ; 34
  dw PartsListLinkOverlayJumpToPartExchangeState ; 35
  dw PartsPlaceholderState ; 36
  dw PartsPlaceholderState ; 37
  dw PartsPlaceholderState ; 38
  dw PartsPlaceholderState ; 39
  dw PartsPlaceholderState ; 3A
  dw PartsPlaceholderState ; 3B
  dw PartsPlaceholderState ; 3C
  dw PartsPlaceholderState ; 3D
  dw PartsPlaceholderState ; 3E
  dw PartsPlaceholderState ; 3F

PartsListPrepareFadeOutState::
  ld bc, 1
  ld h, b
  ld l, c
  ld d, $FF
  ld e, $A1
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartsListPrepareFadeOutToWhiteState::
  ld bc, 0
  ld h, b
  ld l, c
  ld d, $FF
  ld e, d
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartsFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

PartsListDrawingState::
  call $342B
  call $3413
  call $343B
  call $3475
  ld bc, $E
  call WrapLoadMaliasGraphics
  ld bc, $F
  call WrapLoadMaliasGraphics
  ld bc, $10
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, 2
  call $33C6
  jp IncSubStateIndex

PartsListMappingState::
  ld bc, 0
  ld e, $19
  xor a
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $19
  xor a
  call WrapDecompressAttribmap0
  ld bc, $100
  ld e, $1E
  xor a
  call WrapDecompressTilemap0
  ld bc, $100
  ld e, $1E
  xor a
  call WrapDecompressAttribmap0
  call MapTypeNameForPartList
  call PartsListCalculatePageNumberAndCursorPosition
  call MapPageNumbersForPartsList
  call MapPartModelNumbersForPartsList
  call MapPartNamesForPartsList
  call MapPartQuantitiesForPartsList
  call GetMaxCursorPositionForPartsList
  call PlaceCursorForPartsList
  call CountPartsForPartStatus
  call CheckIfPartSlotIsNotEmptyForPartsListExtended
  call CheckIfPartSlotIsNotEmptyForPartsList
  or a
  jp z, IncSubStateIndex
  call GetSelectedPartIndexForPartsList
  call DrawPartImageForPartsList
  ld a, [W_CurrentPartTypeForListView]
  add $30
  ld e, a
  ld bc, $201
  xor a
  call WrapDecompressTilemap0
  jp IncSubStateIndex

PartsListPrepareFadeInState::
  ld hl, $1A
  ld bc, $13
  ld d, $FF
  ld e, $A1
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, h
  ld c, l
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartsListInputHandlerState::
  ld de, $C0C0
  call $33B7
  call AnimatePageNavigationArrowsForPartsList
  call PartOpenInputHandlerForPartsList
  ld a, [$C4EE]
  or a
  jp z, .aButtonNotPressedOrNoPart
  ld a, [W_PartsMenuEntrypoint]
  cp 2
  jr z, .isLink
  ld a, 6
  ld [W_CoreSubStateIndex], a
  ret

.isLink
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

.aButtonNotPressedOrNoPart
  xor a
  ld [W_MedalMenuWaitTimer], a
  call HorizontalDirectionalInputHandlerForPartsList
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call TypeChangeInputHandlerForPartsList
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call VerticalDirectionalInputHandlerForPartsList
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, [W_PartsMenuEntrypoint]
  cp 2
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

PartsListUpdatePartImageState::
  ld de, $C0C0
  call $33B7
  call AnimatePageNavigationArrowsForPartsList
  ld a, [W_MedalMenuWaitTimer]
  or a
  jr nz, .notZero
  ld a, 1
  ld [W_MedalMenuWaitTimer], a
  ld bc, $201
  ld e, $34
  xor a
  jp WrapDecompressTilemap0

.notZero
  cp 1
  jr nz, .notOne
  ld a, 2
  ld [W_MedalMenuWaitTimer], a
  jp UpdatePartImageForPartsList

.notOne
  inc a
  ld [W_MedalMenuWaitTimer], a
  cp 4
  ret nz
  xor a
  ld [W_MedalMenuWaitTimer], a
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

PartsStatusDrawingState::
  call $3413
  call $3475
  ld bc, $E
  call WrapLoadMaliasGraphics
  ld bc, 1
  call $33C6
  jp IncSubStateIndex

PartsStatusMappingState::
  ld a, [W_CurrentPartTypeForListView]
  add $2C
  ld e, a
  push de
  xor a
  ld b, a
  ld c, a
  call WrapDecompressTilemap0
  pop de
  xor a
  ld b, a
  ld c, a
  call WrapDecompressAttribmap0
  call CountPartsForPartStatus
  call TileMappingByPartTypeForPartStatus
  call PlaceIconSpritesForPartStatus
  jp IncSubStateIndex

PartsStatusInitiateMainScriptState::
  call WrapInitiateMainScript
  jp IncSubStateIndex

PartsStatusDisplayDescriptionTextState::
  call .displayDescriptionText
  jp IncSubStateIndex

.displayDescriptionText
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [W_ListItemIndexForBuffering], a
  ld a, [W_CurrentPartTypeForListView]
  call $34FF
  ld a, [W_PartStatsBuffer + 1]
  ld b, 0
  ld c, a
  ld a, 5
  jp WrapMainScriptProcessor

PartsStatusPrepareFadeInState::
  ld hl, $1E
  ld bc, 3
  ld d, $FF
  ld e, $A2
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, h
  ld c, l
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartsStatusInputHandlerState::
  call AnimateArrowsForMedarotStatus
  call DirectionalInputHandlerForPartStatus
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jr nz, .bPressed

  ld a, [W_MainScriptExitMode]
  or a
  jp z, PartsStatusDisplayDescriptionTextState.displayDescriptionText
  di
  rst $20
  xor a
  ld [$9C72], a
  ei
  ret

.bPressed
  ld a, 4
  call ScheduleSoundEffect
  call ParsePartIndexForExitToPartList
  ld a, $1A
  ld [W_CoreSubStateIndex], a
  ret

PartsStatusPrepareFadeOutPartImageState::
  ld hl, 0
  ld bc, $13
  ld d, 8
  ld e, 0
  ld a, d
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartsStatusRefreshScreenState::
  call TileMappingByPartTypeForPartStatus
  jp IncSubStateIndex

PartsStatusPrepareFadeInPartImageState::
  ld hl, $1E
  ld bc, 3
  ld d, 8
  ld e, 0
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, h
  ld c, l
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartsStatusRestoreArrowsState::
  call ShowLeftArrowForMedarotStatus
  call ShowRightArrowForMedarotStatus
  ld a, $E
  ld [W_CoreSubStateIndex], a
  ret

PartsStatusPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $A2
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartsStatusExitState::
  ld a, [W_PartsMenuEntrypoint]
  cp 1
  jr z, .exitToMedarotStatus
  xor a
  ld [W_CoreSubStateIndex], a
  ret

.exitToMedarotStatus
  ld a, [W_CurrentPartTypeForListView]
  ld hl, W_MedarotCurrentHeadPart
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [hl], a
  ld a, $F
  ld [W_CoreStateIndex], a
  ld a, $1A
  ld [W_CoreSubStateIndex], a
  ret

PartsListUnusedState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, 0
  ld a, 8
  call WrapSetupPalswapAnimation

PartsListPointlessConditionalExitToMedarotScreenThatDoesntWorkState::
  call $3413
  ld a, [W_PartsMenuEntrypoint]
  or a
  jp z, IncSubStateIndex
  call PartsListCalculatePartIndex
  ld a, $F
  ld [W_CoreStateIndex], a
  ld a, $C
  ld [W_CoreSubStateIndex], a
  ret

PartsListMedawatchRestoreOddsAndEndsState::
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
  call $5708
  ld a, 1
  call $4880
  jp IncSubStateIndex

PartsListPrepareMedawatchMenuFadeInState::
  call $2CEC
  ld h, 0
  ld l, a
  ld bc, $12
  add hl, bc
  ld bc, $12
  ld d, $7F
  ld e, $8F
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartsListExitToMedawatchMenuState::
  ld a, $A
  ld [W_CoreStateIndex], a
  ld a, 3
  ld [W_CoreSubStateIndex], a
  ret

PartsListLinkOverlayMappingState::
  ld a, $D
  ld [$C4EE], a
  ld a, 7
  ld [$C4EF], a
  ld a, 7
  ld [$C4F0], a
  ld a, 7
  ld [$C4F1], a
  ld a, 2
  call $1153
  ld bc, $D07
  ld e, $68
  ld a, 2
  call WrapDecompressTilemap0
  ld bc, $D07
  ld e, $68
  ld a, 2
  call WrapDecompressAttribmap0
  xor a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  xor a
  call MapLinkOverlayArrowForPartsList
  jp IncSubStateIndex

PartsListLinkOverlayInputHandlerState::
  call LinkOverlayDirectionalInputHandlerForPartsList
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 1
  call MapLinkOverlayArrowForPartsList
  ld a, $20
  ld [W_MedalMenuWaitTimer], a
  ld a, 3
  call ScheduleSoundEffect
  jp IncSubStateIndex

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 2
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld a, 1
  call MapLinkOverlayArrowForPartsList
  ld a, $20
  ld [W_MedalMenuWaitTimer], a
  ld a, 4
  call ScheduleSoundEffect
  jp IncSubStateIndex

PartsListLinkOverlayActionState::
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  cp 0
  jr z, .openPartStatus
  cp 1
  jr z, .tradePart
  ld a, $D
  ld [$C4EE], a
  ld a, 7
  ld [$C4EF], a
  ld a, 7
  ld [$C4F0], a
  ld a, 7
  ld [$C4F1], a
  ld a, 2
  call $123B
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

.openPartStatus
  ld a, 6
  ld [W_CoreSubStateIndex], a
  ret

.tradePart
  ld a, 4
  ld [$CF96], a
  jp IncSubStateIndex

PartsListLinkOverlayJumpToPartExchangeState::
  ld a, [W_CurrentPartTypeForListView]
  ld [$C613], a
  call PartsListCalculatePartIndex
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [$C615], a
  ld a, $1E
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

PartsPlaceholderState::
  ret

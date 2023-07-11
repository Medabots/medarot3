INCLUDE "game/src/common/constants.asm"

SECTION "Paint Shop State Machine 1", ROMX[$5DDF], BANK[$16]
PaintShopStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw PaintShopDrawingState ; 00
  dw PaintShopMappingState ; 01
  dw PaintShopDisplayMoneyAndSpritesState ; 02
  dw PaintShopPrepareFadeInState ; 03
  dw PaintShopDoFadeState ; 04
  dw PaintShopPrintOpeningMessageState ; 05
  dw PaintShopInputHandlerState ; 06
  dw PaintShopDoNothingState ; 07
  dw PaintShopPrepareFadeOutState ; 08
  dw PaintShopDoFadeState ; 09
  dw PaintShopMedarotSelectionForPaintingDrawingState ; 0A
  dw PaintShopMedarotsSelectionScreenMappingState ; 0B
  dw PaintShopMedarotsSelectionScreenPrepareFadeInState ; 0C
  dw PaintShopDoFadeState ; 0D
  dw PaintShopMedarotSelectionWelcomeMessageState ; 0E
  dw PaintShopMedarotsSelectionScreenInputHandlerState ; 0F
  dw PaintShopDoNothingState ; 10
  dw PaintShopDoNothingState ; 11
  dw PaintShopDoNothingState ; 12
  dw PaintShopDoFadeState ; 13
  dw PaintShopDoNothingState ; 14
  dw PaintShopPrepareFadeOutState ; 15
  dw PaintShopDoFadeState ; 16
  dw PaintShopPaintingScreenInitState ; 17
  dw PaintShopPaintSelectorPrepareFadeInState ; 18
  dw PaintShopDoFadeState ; 19
  dw PaintShopPaintSelectorWelcomeMessageState ; 1A
  dw PaintShopPaintSelectionInputHandlerState ; 1B
  dw PaintShopPaintingSwitchVisiblePaletteState ; 1C
  dw PaintShopDoNothingState ; 1D
  dw PaintShopPaintRemovalState ; 1E
  dw PaintShopPaintRemovalUnusedState ; 1F
  dw PaintShopPrepareFadeOutState ; 20
  dw PaintShopDoFadeState ; 21
  dw PaintShopExitState ; 22
  dw PaintShopPrepareFadeOutState ; 23
  dw PaintShopDoFadeState ; 24
  dw PaintShopRestoreMainMenuState ; 25
  dw PaintShopPrepareFadeInState ; 26
  dw PaintShopDoFadeState ; 27
  dw PaintShopShowMessageAfterExitToMainMenuState ; 28
  dw PaintShopTutorialState ; 29
  dw PaintShopPrintMessageAndExitPaintingScreenState ; 2A
  dw PaintShopPaintingYNState ; 2B
  dw PaintShopNotEnoughMoneyMessageState ; 2C
  dw PaintShopNoPaintedMedarotsMessageState ; 2D

PaintShopIncSubStateIndex::
  ld a, [W_CoreSubStateIndex]
  inc a
  ld [W_CoreSubStateIndex], a
  ret

PaintShopDoNothingState::
  jp PaintShopIncSubStateIndex

PaintShopDrawingState::
  call $342B
  call $3433
  call $3413
  call $343B
  call $3475
  ld hl, $C7C0
  ld bc, $80
  xor a
  ld [W_ShopBuyMenuSelection], a
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld [W_ShopPasswordSelectionXAxis], a
  ld bc, 2
  call WrapLoadMaliasGraphics
  ld bc, 3
  call WrapLoadMaliasGraphics
  ld bc, 4
  call WrapLoadMaliasGraphics
  ld bc, 5
  call WrapLoadMaliasGraphics
  ld bc, 2
  call $33C6
  ld bc, $3A
  call WrapLoadMaliasGraphics
  ld bc, $3B
  call WrapLoadMaliasGraphics
  ld bc, $3C
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  jp PaintShopIncSubStateIndex

PaintShopMappingState::
  ld bc, 0
  ld e, $89
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, $B06
  ld e, $9B
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $8B
  ld a, 1
  call WrapDecompressTilemap0
  jp PaintShopIncSubStateIndex

PaintShopDisplayMoneyAndSpritesState::
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $B4
  ld [$C0E2], a
  ld a, 7
  ld [$C0E5], a
  ld a, 7
  ld [$C0E3], a
  ld a, $10
  ld [$C0E4], a
  ld a, 1
  ld [$C100], a
  ld a, $22
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, 0
  ld [$C105], a
  ld a, $59
  ld [$C103], a
  ld a, $18
  ld [$C104], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $36
  ld de, $C0E0
  call $33B2
  ld a, 0
  ld b, a
  ld a, $9E
  ld de, $C100
  call $33B2
  ld bc, $D01
  ld hl, W_PlayerMoolah
  call PaintShopMapMoney
  call WrapInitiateMainScript
  jp PaintShopIncSubStateIndex

PaintShopPrintOpeningMessageState::
  ld bc, $A0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp PaintShopIncSubStateIndex

PaintShopInputHandlerState::
  ld de, $C0E0
  call $33B7
  ld de, $C100
  call $33B7
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_ShopBuyMenuSelection]
  dec a
  cp $FF
  jr nz, .dontLoopToEnd
  ld a, 3

.dontLoopToEnd
  ld [W_ShopBuyMenuSelection], a
  ld a, 2
  call ScheduleSoundEffect
  call PaintShopUpdateMainMenuCursorPosition
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, [W_ShopBuyMenuSelection]
  inc a
  cp 4
  jr nz, .dontLoopToBeginning
  xor a

.dontLoopToBeginning
  ld [W_ShopBuyMenuSelection], a
  ld a, 2
  call ScheduleSoundEffect
  call PaintShopUpdateMainMenuCursorPosition
  ret

.downNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  jr z, .selectNotPressed ; What is the point of this?
  ret

.selectNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $CC
  ld [$C0E2], a
  ld a, 3
  call ScheduleSoundEffect
  ld a, [W_ShopBuyMenuSelection]
  cp 3
  jr z, .exitSelected
  cp 2
  jp z, .tutorialSelected
  cp 1
  jr z, .restoreColourSelected
  call PaintShopIsPaintJobUnaffordable
  cp 1
  jr z, .notEnoughMoney
  ld a, 0
  ld [W_ShopPasswordSelectionXAxis], a
  call PaintShopIncSubStateIndex
  ret

.restoreColourSelected
  call PaintShopPlayerHasPaintedMedarots
  cp 0
  jr z, .nothingToRestore
  ld a, 1
  ld [W_ShopPasswordSelectionXAxis], a
  call PaintShopIncSubStateIndex
  ret

.notEnoughMoney
  ld a, $2C
  ld [W_CoreSubStateIndex], a
  ret

.nothingToRestore
  call WrapInitiateMainScript
  ld a, $2D
  ld [W_CoreSubStateIndex], a
  ret

.tutorialSelected
  call WrapInitiateMainScript
  ld a, $29
  ld [W_CoreSubStateIndex], a
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect

.exitSelected
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

PaintShopMedarotSelectionForPaintingDrawingState::
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
  call WrapInitiateMainScript
  jp IncSubStateIndex

PaintShopMedarotsSelectionScreenMappingState::
  ld a, 0
  ld [$C0E0], a
  ld bc, 0
  ld e, $44
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $44
  ld a, 0
  call WrapDecompressAttribmap0
  call PaintShopMedarotsSelectionScreenDisplayMedarotSprites
  ld bc, $A01
  call PaintShopDrawCurrentMedarot
  ld bc, $B0B
  call MapCurrentMedarotNameForPaintShopSelectionScreen
  call PaintShopDisplayMedarotSelectorArrow
  ld a, $80
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  jp IncSubStateIndex

PaintShopMedarotsSelectionScreenPrepareFadeInState::
  ld hl, $29
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  call PaintShopGetPaletteIndexForSelectedMedarot
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PaintShopPaintSelectorPrepareFadeInState::
  ld hl, $35
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  call PaintShopGetPaletteIndexForSelectedMedarot
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

SECTION "Paint Shop State Machine 2", ROMX[$60AF], BANK[$16]
PaintShopMedarotsSelectionScreenInputHandlerState::
  ld de, $C0C0
  call $33B7
  call PaintShopPlaceMedarotSelectorArrow
  call MedarotPaintShopSelectionScreenDirectionalInputHandler
  call AnimatedSelectedMedarotSpriteForPaintShopSelectionScreen
  ld a, [W_MedarotSelectionDirectionalInputWaitTimer]
  cp $80
  ret nz
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  call MedarotPaintShopSelectionScreenEmptySlotCheck
  or a
  ret z
  call PaintShopMedarotActionViabilityCheck
  cp 1
  ret z
  ld a, $CD
  ld [$C0E2], a
  ld a, 5
  ld [$C0E5], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call GetCurrentMedalAndTypeForPaintShopMedarotStatusScreen
  ld a, $15
  ld [W_CoreSubStateIndex], a
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  xor a
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, $23
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Paint Shop State Machine 3", ROMX[$62BE], BANK[$16]
PaintShopPaintingScreenInitState::
  ld bc, 2
  call $33C6
  ld bc, $3A
  call WrapLoadMaliasGraphics
  ld bc, $3B
  call WrapLoadMaliasGraphics
  ld bc, $3C
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, 0
  ld e, $8A
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, $C06
  ld e, $9B
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $8C
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, $101
  ld e, 3
  ld a, 0
  call WrapDecompressTilemap0
  ld a, 1
  ld [$C100], a
  ld a, $22
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, 0
  ld [$C105], a
  ld a, $60
  ld [$C103], a
  ld a, $18
  ld [$C104], a
  ld a, 1
  ld [$C120], a
  ld a, $22
  ld [$C121], a
  ld a, 0
  ld [$C125], a
  ld a, $A5
  ld [$C122], a
  ld a, 8
  ld [$C123], a
  ld a, $59
  ld [$C124], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld [$C0A0], a
  ld [$C0C0], a
  ld [$C1E0], a
  ld [$C200], a
  ld [$C220], a
  ld [$C240], a
  ld [$C260], a
  ld [$C280], a
  ld [$C2A0], a
  ld [$C2C0], a
  ld [$C2E0], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $9E
  ld de, $C100
  call $33B2
  ld a, 0
  ld b, a
  ld a, $9F
  ld de, $C120
  call $33B2
  ld bc, $D01
  ld hl, W_PlayerMoolah
  call PaintShopMapMoney
  call WrapInitiateMainScript
  ld a, 5
  rst 8
  call PaintShopGetPaletteIndexForSelectedMedarot
  ld hl, 7
  add hl, de
  ld a, [hl]
  dec a
  ld [W_ShopPasswordSelectionYAxis], a
  ld a, h
  ld [$C7C4], a
  ld a, l
  ld [$C7C5], a
  call PrintCurrentPaintNumber
  jp IncSubStateIndex

PaintShopPaintSelectionInputHandlerState::
  ld de, $C100
  call $33B7
  ld de, $C120
  call $33B7
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  jr z, .rightNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_ShopPasswordSelectionYAxis]
  cp $F
  jr z, .loopToStart
  inc a
  ld [W_ShopPasswordSelectionYAxis], a
  call PrintCurrentPaintNumber
  jp .updateMedarotPalette

.loopToStart
  ld a, [W_MedarotCurrentPalette]
  cp 0
  jr nz, .isPaintedDuringRightButtonPress
  ld a, $FF
  ld [W_ShopPasswordSelectionYAxis], a
  call PrintCurrentPaintNumber
  jp .updateMedarotPalette

.isPaintedDuringRightButtonPress
  ld a, 0
  ld [W_ShopPasswordSelectionYAxis], a
  call PrintCurrentPaintNumber
  jp .updateMedarotPalette

.rightNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_MedarotCurrentPalette]
  cp 0
  jr nz, .isPaintedDuringLeftButtonPress
  ld a, [W_ShopPasswordSelectionYAxis]
  cp $FF
  jr z, .loopToEnd
  dec a
  ld [W_ShopPasswordSelectionYAxis], a
  call PrintCurrentPaintNumber
  jp .updateMedarotPalette

.isPaintedDuringLeftButtonPress
  ld a, [W_ShopPasswordSelectionYAxis]
  cp 0
  jr z, .loopToEnd
  dec a
  ld [W_ShopPasswordSelectionYAxis], a
  call PrintCurrentPaintNumber
  jp .updateMedarotPalette

.loopToEnd
  ld a, $F
  ld [W_ShopPasswordSelectionYAxis], a
  call PrintCurrentPaintNumber
  jp .updateMedarotPalette

.leftNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  jr z, .selectNotPressed
  ret

.selectNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, [W_MedarotCurrentPalette]
  ld b, a
  ld a, [W_ShopPasswordSelectionYAxis]
  inc a
  cp b
  jr z, .paletteUnchanged
  ld a, 3
  call ScheduleSoundEffect
  call WrapInitiateMainScript
  ld a, $2B
  ld [W_CoreSubStateIndex], a
  ret

.paletteUnchanged
  ld a, 5
  call ScheduleSoundEffect
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, 7
  ld [W_CoreSubStateIndex], a
  ret

.updateMedarotPalette
  ld a, [W_ShopPasswordSelectionYAxis]
  cp $FF
  jr z, .showDefaultPalette
  ld bc, $370
  ld a, [W_ShopPasswordSelectionYAxis]
  ld l, a
  ld h, 0
  add hl, bc
  ld b, h
  ld c, l
  ld a, 3
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  jp IncSubStateIndex

.showDefaultPalette
  call PaintShopUpdateSelectedMedarotPalette
  jp IncSubStateIndex
  
SECTION "Paint Shop State Machine 4", ROMX[$64A7], BANK[$16]
PaintShopPaintRemovalState::
  ld de, $C100
  call $33B7
  ld a, 1
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, .yesSelected
  ld a, 7
  ld [W_CoreSubStateIndex], a
  ret

.yesSelected
  ld a, 5
  rst 8
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld bc, $10
  ld hl, $D000 + M_MedarotPalette

.mathLoop
  cp 0
  jr z, .exitMathLoop
  dec a
  add hl, bc
  jr .mathLoop

.exitMathLoop
  xor a
  ld [hl], a
  call WrapInitiateMainScript
  xor a
  ld [W_MedarotCurrentPalette], a
  call PaintShopUpdateSelectedMedarotPalette
  ld a, $2A
  ld [W_CoreSubStateIndex], a
  ret

PaintShopPaintRemovalUnusedState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, $2A
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Paint Shop State Machine 5", ROMX[$676A], BANK[$16]
PaintShopRestoreMainMenuState::
  ld bc, 2
  call $33C6
  ld bc, $3A
  call WrapLoadMaliasGraphics
  ld bc, $3B
  call WrapLoadMaliasGraphics
  ld bc, $3C
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, 0
  ld e, $89
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, $C06
  ld e, $9B
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $8B
  ld a, 1
  call WrapDecompressTilemap0
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $B4
  ld [$C0E2], a
  ld a, 7
  ld [$C0E5], a
  ld a, 7
  ld [$C0E3], a
  ld a, 1
  ld [$C100], a
  ld a, $22
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, 0
  ld [$C105], a
  ld a, $60
  ld [$C103], a
  ld a, $18
  ld [$C104], a
  ld a, 0
  ld b, a
  ld a, $36
  ld de, $C0E0
  call $33B2
  ld a, 0
  ld b, a
  ld a, $9E
  ld de, $C100
  call $33B2
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call PaintShopUpdateMainMenuCursorPosition
  ld a, 0
  ld [$C0A0], a
  ld [$C0C0], a
  ld [$C1E0], a
  ld [$C200], a
  ld [$C220], a
  ld [$C240], a
  ld [$C260], a
  ld [$C280], a
  ld [$C2A0], a
  ld [$C2C0], a
  ld [$C2E0], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $D01
  ld hl, W_PlayerMoolah
  call PaintShopMapMoney
  call WrapInitiateMainScript
  jp IncSubStateIndex

SECTION "Paint Shop State Machine 6", ROMX[$6855], BANK[$16]
PaintShopShowMessageAfterExitToMainMenuState::
  ld bc, $A1
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 6
  ld [W_CoreSubStateIndex], a
  ret

PaintShopTutorialState::
  ld de, $C100
  call $33B7
  ld bc, $AC
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  call WrapInitiateMainScript
  ld a, $28
  ld [W_CoreSubStateIndex], a
  ret

PaintShopMedarotSelectionWelcomeMessageState::
  ld a, [W_ShopPasswordSelectionXAxis]
  cp 1
  jr z, .removingPaint
  ld bc, $A4
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

.removingPaint
  ld bc, $AA
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

PaintShopPaintSelectorWelcomeMessageState::
  ld a, [W_ShopPasswordSelectionXAxis]
  cp 1
  jr z, .removingPaint
  ld bc, $A6
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

.removingPaint
  ld bc, $AB
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, $1E
  ld [W_CoreSubStateIndex], a
  ret

PaintShopPrintMessageAndExitPaintingScreenState::
  ld de, $C100
  call $33B7
  ld bc, $A9
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 0
  ld [$C120], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  xor a
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, $23
  ld [W_CoreSubStateIndex], a
  ret

PaintShopPaintingYNState::
  ld de, $C100
  call $33B7
  ld bc, $A8
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 1
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, .yesSelected
  call WrapInitiateMainScript
  ld a, $1A
  ld [W_CoreSubStateIndex], a
  ret

.yesSelected

; Apply palette.
  
  ld a, 5
  rst 8
  ld a, [$C7C4]
  ld h, a
  ld a, [$C7C5]
  ld l, a
  ld a, [W_ShopPasswordSelectionYAxis]
  inc a
  ld [hl], a

; Deduct cost.
  
  ld a, [W_PlayerMoolah]
  ld h, a
  ld a, [W_PlayerMoolah + 1]
  ld l, a
  sub $A
  ld l, a
  jp nc, .noDecH
  ld a, h
  sub 1
  ld h, a

.noDecH
  ld a, h
  ld [W_PlayerMoolah], a
  ld a, l
  ld [W_PlayerMoolah + 1], a
  ld bc, $D01
  ld hl, W_PlayerMoolah

; Refresh player money.
  
  call PaintShopMapMoney
  ld a, [W_ShopPasswordSelectionYAxis]
  inc a
  ld [W_MedarotCurrentPalette], a

; Refresh medarot palette.

  call PaintShopUpdateSelectedMedarotPalette
  call WrapInitiateMainScript
  ld a, $2A
  ld [W_CoreSubStateIndex], a
  ret

PaintShopNotEnoughMoneyMessageState::
  ld de, $C100
  call $33B7
  ld bc, $A2
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  call WrapInitiateMainScript
  ld a, $28
  ld [W_CoreSubStateIndex], a
  ret

PaintShopNoPaintedMedarotsMessageState::
  ld de, $C100
  call $33B7
  ld bc, $A3
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  call WrapInitiateMainScript
  ld a, $28
  ld [W_CoreSubStateIndex], a
  ret

PaintShopUnusedPaletteRelatedState::
  ld a, 2
  call WrapSetupPalswapAnimation
  jp PaintShopIncSubStateIndex

PaintShopDoFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp PaintShopIncSubStateIndex

PaintShopPaintingSwitchVisiblePaletteState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, $1B
  ld [W_CoreSubStateIndex], a
  ret

PaintShopPrepareFadeInState::
  ld hl, $35
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp PaintShopIncSubStateIndex

PaintShopPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp PaintShopIncSubStateIndex

PaintShopExitState::
  ld a, 0
  call $1554
  jp $36A3

PaintShopUnusedState::
  ld a, [W_CoreStateIndex]
  inc a
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

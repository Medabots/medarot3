INCLUDE "game/src/common/constants.asm"

SECTION "Paint Shop State Machine 1", ROMX[$5DDF], BANK[$16]
PaintShopStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw PaintShopDrawingState
  dw PaintShopMappingState
  dw PaintShopDisplayMoneyAndSpritesState
  dw $69C6
  dw $69AD
  dw PaintShopPrintOpeningMessageState
  dw PaintShopInputHandlerState
  dw PaintShopDoNothingState
  dw $69D8
  dw $69AD
  dw PaintShopMedarotSelectionForPaintingDrawingState
  dw $6029
  dw $605C
  dw $69AD
  dw $6884
  dw $60AF
  dw PaintShopDoNothingState
  dw PaintShopDoNothingState
  dw PaintShopDoNothingState
  dw $69AD
  dw PaintShopDoNothingState
  dw $69D8
  dw $69AD
  dw $62BE
  dw $6076
  dw $69AD
  dw $68AB
  dw $63B2
  dw $69B8
  dw PaintShopDoNothingState
  dw $64A7
  dw $64E8
  dw $69D8
  dw $69AD
  dw $69EA
  dw $69D8
  dw $69AD
  dw $676A
  dw $69C6
  dw $69AD
  dw $6855
  dw $6868
  dw $68D5
  dw $68FC
  dw $696D
  dw $6989

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
  ld bc, $C06
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
  ld a, $60
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
  call $6838
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

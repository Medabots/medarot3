INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Shop Vars 1", WRAM0[$C7A0]
W_ShopPartTypeSelectionIndex:: ds 1

SECTION "Shop Vars 2", WRAM0[$C7A5]
W_ShopIndex:: ds 1
W_ShopStockLevel:: ds 1

SECTION "Shop Vars 3", WRAM0[$C7C0]
W_ShopMainMenuSelection:: ds 1
W_ShopBuyMenuSelection:: ds 1
W_ShopPasswordSelectionXAxis:: ds 1
W_ShopPasswordSelectionYAxis:: ds 1

SECTION "Shop Vars 4", WRAM0[$C7CA]
W_ShopPageIndex:: ds 1
W_ShopPointlessSingleRunCheck:: ds 1

SECTION "Shop Vars 5", WRAM0[$C7D3]
W_ShopSelectedPartPrice:: ds 2

SECTION "Shop Vars 6", WRAM0[$C7D6]
W_ShopSelectedPartIndex:: ds 1

SECTION "Shop Vars 7", WRAM0[$C7D8]
W_ShopSellLastPageIndex:: ds 1
W_ShopPartIndexBuffer:: ds 1

SECTION "Shop Vars 8", WRAM0[$C7DD]
W_ShopSellNumParts:: ds 1

SECTION "Shop Vars 9", WRAM0[$C7DF]
W_ShopSellPartIndexBuffer:: ds 1
W_ShopSellStartOfNextPageIndex:: ds 1
W_ShopSellPartsOnPage:: ds 1
W_ShopStockLastPartInSellList:: ds 1
W_ShopStockPart0Index:: ds 1
W_ShopStockPart1Index:: ds 1
W_ShopStockPart2Index:: ds 1
W_ShopStockPart3Index:: ds 1
W_ShopPasswordEntryBuffer:: ds 6
W_ShopPasswordNumEnteredDigits:: ds 1
W_ShopPasswordLastEnteredDigit:: ds 1
W_ShopPasswordIsMatch:: ds 1
W_ShopShopkeeper:: ds 1
W_ShopStockFirstPartByPage:: ds $27

SECTION "Player Money", WRAM0[$C670]
W_PlayerMoolah:: ds 2

SECTION "Shop State Machine 1", ROMX[$4000], BANK[$04]
ShopStateMachine_AltEntry::
  ld a, $B
  ld [$C4EE], a
  ld a, 9
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, 9
  ld [$C4F1], a
  ld a, 0
  call $1153
  call $123B
  ; Continues into ShopStateMachine.

ShopStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw ShopDrawingState ; 00
  dw ShopMappingState ; 01
  dw ShopPrepareFadeInPlusDisplayMoneyAndSpritesState ; 02
  dw ShopFadeState ; 03
  dw ShopShopkeeperWelcomeMessageState ; 04
  dw ShopMainMenuInputHandlerState ; 05
  dw ShopMainMenuSelectionBranchingState ; 06
  dw ShopPartTypeSelectionInputHandler ; 07
  dw ShopPrepareFadeOutState ; 08
  dw ShopFadeState ; 09
  dw ShopBuySellDisplayPartTypeState ; 0A
  dw ShopParseStockState ; 0B
  dw ShopBuyMappingState ; 0C
  dw ShopBuyDisplayPartNamesPricesAndGenderState ; 0D
  dw ShopPrepareFadeInState ; 0E
  dw ShopFadeState ; 0F
  dw ShopBuyInputHandlerState ; 10
  dw ShopBuyYNBoxState ; 11
  dw ShopBuyPostYesInputCheckState ; 12
  dw ShopDoNothingState ; 13
  dw ShopDoNothingState ; 14
  dw ShopDoNothingState ; 15
  dw ShopSellMappingState ; 16
  dw ShopSellMapMoneyAndSelectedPartInfoState ; 17
  dw ShopPrepareFadeInState ; 18
  dw ShopFadeState ; 19
  dw ShopSellInputHandlerState ; 1A
  dw ShopSellYNBoxState ; 1B
  dw ShopSellPostYesListRefreshState ; 1C
  dw ShopSellPostYesInputCheckState ; 1D
  dw ShopDoNothingState ; 1E
  dw ShopDoNothingState ; 1F
  dw ShopDoNothingState ; 20
  dw ShopDoNothingState ; 21
  dw ShopPrepareFadeOutState ; 22
  dw ShopFadeState ; 23
  dw ShopPasswordMappingState ; 24
  dw ShopPasswordPrepareFadeInState ; 25
  dw ShopFadeState ; 26
  dw ShopPasswordInputHandlerState ; 27
  dw ShopPasswordYNInputHandler ; 28
  dw ShopPasswordSuccessMessageState ; 29
  dw ShopPasswordSuccessExitToShopWrapperState ; 2A
  dw ShopDoNothingState ; 2B
  dw ShopPasswordErrorAMessageState ; 2C
  dw ShopPasswordPostErrorMessageState ; 2D
  dw ShopPasswordAfterNoMessageState ; 2E
  dw ShopDoNothingState ; 2F
  dw ShopPasswordErrorBMessageState ; 30
  dw ShopPasswordPostErrorMessageState ; 31
  dw ShopDoNothingState ; 32
  dw ShopDoNothingState ; 33
  dw ShopPrepareFadeOutState ; 34
  dw ShopFadeState ; 35
  dw ShopBuySellRemapShopState ; 36
  dw ShopPrepareFadeInState ; 37
  dw ShopFadeState ; 38
  dw ShopBuySellReturnToShopMessageState ; 39
  dw ShopPrepareFadeOutState ; 3A
  dw ShopFadeOutState ; 3B
  dw ShopPasswordRemapShopState ; 3C
  dw ShopPrepareFadeInState ; 3D
  dw ShopFadeState ; 3E
  dw ShopRestorePasswordMenuItemDescriptionState ; 3F
  dw ShopDoNothingState ; 40
  dw ShopDoNothingState ; 41
  dw ShopPasswordMessageBState ; 42
  dw ShopUnusedRestoreMessageState ; 43
  dw ShopPasswordMessageAState ; 44
  dw ShopBuyCannotAffordMessageState ; 45
  dw ShopPreExitMessageState ; 46
  dw ShopPlaceholderState ; 47
  dw ShopPreparePreExitMessageState ; 48
  dw ShopPrepareFadeOutOnExitState ; 49
  dw ShopFadeState ; 4A
  dw ShopExitState ; 4B

ShopDoNothingState::
  ld a, [W_CoreSubStateIndex]
  inc a
  ld [W_CoreSubStateIndex], a
  ret

ShopSubstateIncrement::
  ld a, [W_CoreSubStateIndex]
  inc a
  ld [W_CoreSubStateIndex], a
  ret

ShopDrawingState::
  call $3433
  call $3413
  call $343B
  call $3475
  ld hl, $C7C0
  ld b, $31

.loop
  xor a
  ld [hli], a
  dec b
  ld a, b
  cp 0
  jr nz, .loop
  xor a
  ld [W_ShopPartTypeSelectionIndex], a
  ld [W_ShopSelectedPartIndex], a
  ld [$C7A7], a
  ld [$C7A9], a
  ld [W_ShopShopkeeper], a
  ld bc, 2
  call WrapLoadMaliasGraphics
  ld bc, 3
  call WrapLoadMaliasGraphics
  ld bc, 4
  call WrapLoadMaliasGraphics
  ld bc, 5
  call WrapLoadMaliasGraphics
  jp ShopDrawingStateContinued

IncreasePartInventoryForShop::
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, 1
  ld b, a
  ld a, [W_ShopSelectedPartIndex]
  call $3596
  ret

ShopDrawingStateContinued::
  ld bc, 2
  call $33C6
  ld bc, $50
  call $33C6
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $30
  call WrapLoadMaliasGraphics
  ld bc, $31
  call WrapLoadMaliasGraphics
  ld bc, $36
  call WrapLoadMaliasGraphics
  ld bc, $37
  call WrapLoadMaliasGraphics
  ld bc, $38
  call WrapLoadMaliasGraphics
  ld bc, $39
  call WrapLoadMaliasGraphics
  ld a, [W_ShopIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw .shopkeeper0
  dw .shopkeeper1
  dw .shopkeeper2
  dw .shopkeeper0
  dw .shopkeeper0
  dw .shopkeeper1
  dw .shopkeeper0
  dw .shopkeeper0
  dw .shopkeeper0
  dw .shopkeeper3
  dw .shopkeeper3

.shopkeeper0
  xor a
  ld [W_ShopShopkeeper], a
  ld bc, $32
  call WrapLoadMaliasGraphics
  jp ShopSubstateIncrement

.shopkeeper1
  ld a, 1
  ld [W_ShopShopkeeper], a
  ld bc, $33
  call WrapLoadMaliasGraphics
  jp ShopSubstateIncrement

.shopkeeper2
  ld a, 2
  ld [W_ShopShopkeeper], a
  ld bc, $34
  call WrapLoadMaliasGraphics
  jp ShopSubstateIncrement

.shopkeeper3
  ld a, 3
  ld [W_ShopShopkeeper], a
  ld bc, $35
  call WrapLoadMaliasGraphics
  jp ShopSubstateIncrement

ShopParseStockState::
  ld a, [W_ShopIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw .shop0
  dw .shop1
  dw .shop2
  dw .shop3
  dw .shop4
  dw .shop5
  dw .shop6
  dw .shop7
  dw .shop8
  dw .shop9
  dw .shop10

.shop0
  ld hl, Shop0Stock
  call .populateStock
  jr .exit

.shop1
  ld hl, Shop1Stock
  call .populateStock
  jr .exit

.shop2
  ld hl, Shop2Stock
  call .populateStock
  jr .exit

.shop3
  ld hl, Shop3Stock
  call .populateStock
  jr .exit

.shop4
  ld hl, Shop4Stock
  call .populateStock
  jr .exit

.shop5
  ld hl, Shop5Stock
  call .populateStock
  jr .exit

.shop6
  ld hl, Shop6Stock
  call .populateStock
  jr .exit

.shop7
  ld hl, Shop7Stock
  call .populateStock
  jr .exit

.shop8
  ld hl, Shop8Stock
  call .populateStock
  jr .exit

.shop9
  ld hl, Shop9Stock
  call .populateStock
  jr .exit

.shop10
  ld hl, Shop10Stock
  call .populateStock
  jr .exit

.exit
  jp ShopSubstateIncrement

.populateStock
  ld a, [W_ShopStockLevel]
  ld d, 0
  ld e, a
  sla e
  rl d
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld [W_ShopStockPart0Index], a
  ld a, [hli]
  ld [W_ShopStockPart1Index], a
  ld a, [hli]
  ld [W_ShopStockPart2Index], a
  ld a, [hli]
  ld [W_ShopStockPart3Index], a
  ret

ShopMappingState::
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, $B06
  ld a, [W_ShopShopkeeper]
  add $85
  ld e, a
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressTilemap0
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  jp ShopSubstateIncrement

ShopPrepareFadeInPlusDisplayMoneyAndSpritesState::
  ld a, 1
  ld [$C100], a
  ld a, $22
  ld [$C101], a
  ld a, $80
  ld [$C102], a
  ld a, 7
  ld [$C105], a
  ld a, $58
  ld [$C103], a
  ld a, $18
  ld [$C104], a
  xor a
  ld [$C0A1], a
  inc a ; ld a, 1
  ld [$C0A0], a
  ld a, $B4
  ld [$C0A2], a
  ld a, 7
  ld [$C0A5], a
  ld a, 8
  ld [$C0A3], a
  ld a, $10
  ld [$C0A4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  xor a
  ld b, a
  ld a, $36
  ld de, $C0A0
  call $33B2
  xor a
  ld b, a
  ld a, $84
  ld de, $C100
  call $33B2
  ld bc, $D01
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  call PrepareShopFadeByShopkeeper
  jp ShopSubstateIncrement

ShopShopkeeperWelcomeMessageState::
  ld a, [W_ShopShopkeeper]
  add $DE
  ld c, a
  ld b, 0
  ld a, 1
  ld [W_OAM_SpritesReady], a
  inc a ; ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp ShopSubstateIncrement

ShopMainMenuInputHandlerState::
  ld de, $C0A0
  call $33B7
  ld de, $C100
  call $33B7
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_ShopMainMenuSelection]
  dec a
  cp $FF
  jr nz, .dontWrapToEnd
  ld a, 3

.dontWrapToEnd
  ld [W_ShopMainMenuSelection], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPositionMainMenuCursor
  call $3482
  call ShopMapMessageboxAttributes
  call ShopDisplayMenuMenuSelectionMessage
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, [W_ShopMainMenuSelection]
  inc a
  cp 4
  jr nz, .dontWrapToBeginning
  xor a

.dontWrapToBeginning
  ld [W_ShopMainMenuSelection], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPositionMainMenuCursor
  call $3482
  call ShopMapMessageboxAttributes
  call ShopDisplayMenuMenuSelectionMessage
  ret

.downNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  jr z, .selectNotPressed
  ld hl, W_ShopIndex
  inc [hl]
  ld a, $0b
  xor [hl]
  jr nz, .reset_shop_state
  ld [hl], a ; a is 0 in this case
.reset_shop_state
  xor a
  ld [W_CoreSubStateIndex], a
  jp ShopDrawingStateContinued

  padend $435d

.selectNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 3
  call ScheduleSoundEffect
  ld a, [W_ShopMainMenuSelection]
  cp 2
  jr nz, .passwordNotSelected
  ld a, $26
  call WrapIsItemInInventory
  cp 1
  jr z, .passwordMessageA
  ld a, $27
  call WrapIsItemInInventory
  cp 1
  jr z, .passwordMessageB

.passwordNotSelected
  ld a, 1
  ld [W_ShopPartTypeSelectionIndex], a
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  call ShopSubstateIncrement
  ret

.passwordMessageA
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  ld a, $44
  ld [W_CoreSubStateIndex], a
  ret

.passwordMessageB
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  ld a, $42
  ld [W_CoreSubStateIndex], a
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and 2
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, $48
  ld [W_CoreSubStateIndex], a
  ret

ShopMainMenuSelectionBranchingState::
  ld a, [W_ShopMainMenuSelection]
  cp 0
  jr z, .buySelected
  cp 1
  jr z, .sellSelected
  jr .afterMessage

.buySelected
  ld a, [W_ShopShopkeeper]
  add $B1
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jr .afterMessage

.sellSelected
  ld a, [W_ShopShopkeeper]
  add $B5
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jr .afterMessage

.afterMessage
  ld a, [W_ShopMainMenuSelection]
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [W_CoreSubStateIndex], a
  cp 7
  ret nz
  ld a, 0
  ld [$C4EE], a
  ld a, $A
  ld [$C4EF], a
  ld a, 8
  ld [$C4F0], a
  ld a, 5
  ld [$C4F1], a
  ld a, 1
  call $1153
  ld bc, 8
  ld e, $81
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 8
  ld e, $81
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, $40A
  ld e, $84
  ld a, 1
  call WrapDecompressTilemap0
  ld a, $CC
  ld [$C0A2], a
  ld a, 1
  ld [$C0C0], a
  ld a, 2
  ld [$C0C1], a
  ld a, $BC
  ld [$C0C2], a
  ld a, 0
  ld [$C0C5], a
  ld a, $A
  ld [$C0C3], a
  ld a, $4B
  ld [$C0C4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $80
  ld de, $C0C0
  call $33B2
  ret

.table
  db 7,7,$22,$48

ShopPartTypeSelectionInputHandler::
  ld de, $C0C0
  call $33B7
  ld de, $C100
  call $33B7
  ldh a, [H_JPInputChanged]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, $BC
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $84
  ld a, 1
  call WrapDecompressTilemap0
  ld a, 0
  ld b, a
  ld a, $80
  ld de, $C0C0
  call $33B2
  ld a, 1
  ld [W_ShopPartTypeSelectionIndex], a
  ret

.upNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, $BE
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $87
  ld a, 1
  call WrapDecompressTilemap0
  ld a, 0
  ld b, a
  ld a, $83
  ld de, $C0C0
  call $33B2
  ld a, 4
  ld [W_ShopPartTypeSelectionIndex], a
  ret

.downNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputRight
  jr z, .rightNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, $BE
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $85
  ld a, 1
  call WrapDecompressTilemap0
  ld a, 0
  ld b, a
  ld a, $82
  ld de, $C0C0
  call $33B2
  ld a, 2
  ld [W_ShopPartTypeSelectionIndex], a
  ret

.rightNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, $BD
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $86
  ld a, 1
  call WrapDecompressTilemap0
  ld a, 0
  ld b, a
  ld a, $81
  ld de, $C0C0
  call $33B2
  ld a, 3
  ld [W_ShopPartTypeSelectionIndex], a
  ret

.leftNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  jr z, .selectNotPressed
  ret

.selectNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 3
  call ScheduleSoundEffect
  call ShopSubstateIncrement
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, 0
  ld [$C4EE], a
  ld a, $A
  ld [$C4EF], a
  ld a, 8
  ld [$C4F0], a
  ld a, 5
  ld [$C4F1], a
  ld a, 1
  call $123B
  ld a, 0
  ld [$C0C0], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  call ShopDisplayMenuMenuSelectionMessage
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

ShopBuySellDisplayPartTypeState::
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
  ld a, $28
  ld [$C0E4], a
  ld a, 1
  ld [$C140], a
  ld a, 0
  ld [$C141], a
  ld a, 0
  ld [$C145], a
  ld a, 8
  ld [$C143], a
  ld a, 8
  ld [$C144], a
  ld a, 0
  ld b, a
  ld a, $36
  ld de, $C0E0
  call $33B2
  ld a, [W_ShopPartTypeSelectionIndex]
  cp 1
  jr z, .headParts
  cp 2
  jr z, .rightArmParts
  cp 3
  jr z, .leftArmParts
  cp 4
  jr z, .legParts

.headParts
  ld a, $BC
  ld [$C142], a
  jr .continue

.rightArmParts
  ld a, $BE
  ld [$C142], a
  jr .continue

.leftArmParts
  ld a, $BD
  ld [$C142], a
  jr .continue

.legParts
  ld a, $BF
  ld [$C142], a
  jr .continue

.continue
  ld a, 0
  ld [$C0A0], a
  ld [$C100], a
  ld [$C0C0], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_ShopMainMenuSelection]
  cp 0
  jr z, .buySelected

.sellSelected
  ld a, $16
  ld [W_CoreSubStateIndex], a
  ret

.buySelected
  ld a, $B
  ld [W_CoreSubStateIndex], a
  ret

ShopBuyMappingState::
  ld bc, 0
  ld e, $82
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $82
  ld a, 1
  call WrapDecompressTilemap0
  ld hl, $982A
  ld a, $E1
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld hl, $982C
  ld a, $E1
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [W_ShopPartTypeSelectionIndex]
  cp 1
  jr z, .headParts
  cp 2
  jr z, .rightArmParts
  cp 3
  jr z, .leftArmParts
  cp 4
  jr z, .legParts

.headParts
  ld bc, $402
  ld e, $84
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.rightArmParts
  ld bc, $402
  ld e, $85
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.leftArmParts
  ld bc, $402
  ld e, $86
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.legParts
  ld bc, $402
  ld e, $87
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.continue
  ld a, 1
  ld [$C120], a
  ld a, $22
  ld [$C121], a
  ld a, $82
  ld [$C122], a
  ld a, 7
  ld [$C125], a
  ld a, $88
  ld [$C123], a
  ld a, 8
  ld [$C124], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $85
  ld de, $C120
  call $33B2
  ld bc, $0610 ; Previously 0510, VRAM address to map player funds to
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  call ShopBuyMapSelectionPrice
  call ShopMapQty
  jp ShopSubstateIncrement

ShopBuyUnusedCheckPart0OwnershipState::
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, [W_ShopStockPart0Index]
  call $358A
  cp 0
  jr z, .doOwn ; This should be jr nz if it was working correctly, but this is an unused state, so it doesn't matter.
  ld a, [$C4EE]
  ld c, a
  xor a
  ld b, a
  ld hl, $9A0E
  call ShopMapThreeDigitNumber
  jp ShopSubstateIncrement

.doOwn
  ld a, 2
  ld b, a
  ld hl, $9A10
  call ShopMapDashes
  jp ShopSubstateIncrement

ShopBuyDisplayPartNamesPricesAndGenderState::
  ld a, [W_ShopPartTypeSelectionIndex]
  ld b, a
  ld c, $A
  ld a, [W_ShopStockPart0Index]
  cp $FF
  jp z, .part0SlotEmpty

  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $98A2
  ld bc, W_NewListItemBufferArea
  ld h, $3e
  call VWFDrawStringLeftFullAddress8Tiles
  ld a, [W_ShopStockPart0Index]
  call WrapShopGetPartPriceAndStatus
  ld hl, $98AD ; Previously 98AC
  call ShopMapThreeDigitNumber
  ld hl, $98B1 ; Previously 98B0
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld hl, $98B2 ; Previously 98B1
  di
  rst $20
  ld [hl], $E0
  ei
  call PlaceYenSymbolShop
  ld a, [$C54B]
  ld hl, $98AB
  call ShopMapHeartMaybe
  ld a, [W_ShopPartTypeSelectionIndex]
  ld b, a
  ld c, $A
  ld a, [W_ShopStockPart1Index]
  cp $FF
  jp z, .part1SlotEmpty

  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $98E2
  ld bc, W_NewListItemBufferArea
  ld h, $46
  call VWFDrawStringLeftFullAddress8Tiles
  ld a, [W_ShopStockPart1Index]
  call WrapShopGetPartPriceAndStatus
  ld hl, $98ED ; Previously 98EC
  call ShopMapThreeDigitNumber
  ld hl, $98F1 ; Previously 98F0
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld hl, $98F2 ; Previously 98F1
  di
  rst $20
  ld [hl], $E0
  ei
  call PlaceYenSymbolShop
  ld a, [$C54B]
  ld hl, $98EB
  call ShopMapHeartMaybe
  ld a, [W_ShopPartTypeSelectionIndex]
  ld b, a
  ld c, $A
  ld a, [W_ShopStockPart2Index]
  cp $FF
  jp z, .part2SlotEmpty

  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $9922
  ld bc, W_NewListItemBufferArea
  ld h, $4e
  call VWFDrawStringLeftFullAddress8Tiles
  ld a, [W_ShopStockPart2Index]
  call WrapShopGetPartPriceAndStatus
  ld hl, $992D ; Previously 992C
  call ShopMapThreeDigitNumber
  ld hl, $9931 ; Previously 9930
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld hl, $9932 ; Previously 9931
  di
  rst $20
  ld [hl], $E0
  ei
  call PlaceYenSymbolShop
  ld a, [$C54B]
  ld hl, $992B
  call ShopMapHeartMaybe
  ld a, [W_ShopPartTypeSelectionIndex]
  ld b, a
  ld c, $A
  ld a, [W_ShopStockPart3Index]
  cp $FF
  jp z, .part3SlotEmpty

  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $9962
  ld bc, W_NewListItemBufferArea
  ld h, $56
  call VWFDrawStringLeftFullAddress8Tiles
  ld a, [W_ShopStockPart3Index]
  call WrapShopGetPartPriceAndStatus
  ld hl, $996D ; Previously 996C
  call ShopMapThreeDigitNumber
  ld hl, $9971 ; Previously 9970
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld hl, $9972 ; Previously 9971
  di
  rst $20
  ld [hl], $E0
  ei
  call PlaceYenSymbolShop
  ld a, [$C54B]
  ld hl, $996B
  call ShopMapHeartMaybe
  jr .showPartDesc
  nop

.part0SlotEmpty
  ld hl, $98A2
  ld a, 8
  ld b, a
  call ShopMapDashes
  ld hl, $98AE ; Previously 98AD
  ld a, 5
  ld b, a
  call ShopMapDashes

.part1SlotEmpty
  ld hl, $98E2
  ld a, 8
  ld b, a
  call ShopMapDashes
  ld hl, $98EE ; Previously 98ED
  ld a, 5
  ld b, a
  call ShopMapDashes

.part2SlotEmpty
  ld hl, $9922
  ld a, 8
  ld b, a
  call ShopMapDashes
  ld hl, $992E ; Previously 992D
  ld a, 5
  ld b, a
  call ShopMapDashes

.part3SlotEmpty
  ld hl, $9962
  ld a, 8
  ld b, a
  call ShopMapDashes
  ld hl, $996E ; Previously 996D
  ld a, 5
  ld b, a
  call ShopMapDashes

.showPartDesc
  call ShopDisplayPartDescription
  jp ShopSubstateIncrement

  padend $4883

SECTION "Shop State Machine 2", ROMX[$488D], BANK[$04]
ShopBuyInputHandlerState::
  ld de, $C0E0
  call $33B7
  ld de, $C120
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
  call ShopPositionBuySellMenuCursor
  call ShopBuyMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, [W_ShopBuyMenuSelection]
  inc a
  cp 4
  jr nz, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [W_ShopBuyMenuSelection], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPositionBuySellMenuCursor
  call ShopBuyMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  ret

.downNotPressed
  call ShopDescriptionMultiPageHelper
  jp z, .aNotSelected
  ld a, [W_ShopSelectedPartIndex]
  cp $FF
  jr z, .slotEmpty
  ld a, 3
  call ScheduleSoundEffect
  ld a, $CC
  ld [$C0E2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  call $1554
  jp ShopSubstateIncrement
  ret

.slotEmpty
  ld a, 5
  call ScheduleSoundEffect
  ret

.aNotSelected
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, $34
  ld [W_CoreSubStateIndex], a
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  ret

  nop

ShopBuyYNBoxState::
  ld a, 4
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, .yesSelected
  call WrapInitiateMainScript
  call ShopDisplayPartDescription
  ld a, $10
  ld [W_CoreSubStateIndex], a
  ret

.yesSelected
  call ShopBuyGetPrice
  call ShopPartPriceToPlayerMoney
  ld a, [W_PlayerMoolah]
  cp d
  jr c, .cannotAfford
  jr z, .checkMoneyLowByte
  jr .canAfford

.checkMoneyLowByte
  ld a, [W_PlayerMoolah + 1]
  cp e
  jr c, .cannotAfford

.canAfford
  call ShopPartPriceToPlayerMoney
  ld a, [W_PlayerMoolah]
  ld h, a
  ld a, [W_PlayerMoolah + 1]
  ld l, a
  ld a, l
  sub e
  ld l, a
  jr nc, .noIncH

  ld a, h
  sub 1
  ld h, a

.noIncH
  ld a, h
  sub d
  ld h, a
  ld a, h
  ld [W_PlayerMoolah], a
  ld a, l
  ld [W_PlayerMoolah + 1], a
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, 1
  ld b, a
  ld a, [W_ShopSelectedPartIndex]
  call $3596
  call ShopMapQty
  ld bc, $0610 ; Previously '0510', draw money 1 tile over
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  jp .nextState

.cannotAfford
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  ld a, $45
  ld [W_CoreSubStateIndex], a
  ret

.nextState
  jp ShopSubstateIncrement
  ret

ShopBuyPostYesInputCheckState::
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputB | M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  ret z
  call WrapInitiateMainScript
  call ShopDisplayPartDescription
  ld a, $10
  ld [W_CoreSubStateIndex], a
  ret

ShopSellMappingState::
  call ShopSellCalculatePages
  ld a, [W_ShopSellLastPageIndex]
  cp 0
  jr z, .skipPageArrows
  ld a, 1
  ld [$C160], a
  ld a, $22
  ld [$C161], a
  ld a, 0
  ld [$C165], a
  ld a, $86
  ld [$C162], a
  ld a, $40
  ld [$C163], a
  ld a, 9
  ld [$C164], a
  ld a, 1
  ld [W_OAM_SpritesReady], a

.skipPageArrows
  ld a, 0
  ld b, a
  ld a, $87
  ld de, $C160
  call $33B2
  ld bc, 0
  ld e, $83
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $83
  ld a, 1
  call WrapDecompressTilemap0
  call ShopMapPageNumbers
  ld a, [W_ShopPartTypeSelectionIndex]
  cp 1
  jr z, .headParts
  cp 2
  jr z, .rightArmParts
  cp 3
  jr z, .leftArmParts
  cp 4
  jr z, .legParts

.headParts
  ld bc, $402
  ld e, $84
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.rightArmParts
  ld bc, $402
  ld e, $85
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.leftArmParts
  ld bc, $402
  ld e, $86
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.legParts
  ld bc, $402
  ld e, $87
  ld a, 1
  call WrapDecompressTilemap0
  jr .continue

.continue
  ld a, 1
  ld [$C120], a
  ld a, $22
  ld [$C121], a
  ld a, $83
  ld [$C122], a
  ld a, 7
  ld [$C125], a
  ld a, $88
  ld [$C123], a
  ld a, 8
  ld [$C124], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $86
  ld de, $C120
  call $33B2
  xor a
  ld [W_ShopPageIndex], a
  ld a, 1
  ld [W_ShopPointlessSingleRunCheck], a
  call ShopSellGetPartsByPage
  call WrapShopMapPartInfoForPage
  ld a, [$C7CC]
  ld hl, W_ShopStockPart0Index
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [W_ShopSelectedPartIndex], a
  cp $FF
  jr z, .notSellable
  ld b, a
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, b
  call $358A
  or a
  jr nz, .notSellable
  ld a, [$C4F0]
  ld b, a
  ld a, [$C4EE]
  sub b
  jr z, .notSellable
  xor a
  ld [$C7DC], a
  jp ShopSubstateIncrement

.notSellable
  ld a, 1
  ld [$C7DC], a
  ld a, 1
  ld [$C7DA], a
  jp ShopSubstateIncrement

ShopSellMapMoneyAndSelectedPartInfoState::
  ld bc, $0610 ; previously 0510
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  call ShopSellMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  jp ShopSubstateIncrement

ShopSellInputHandlerState::
  ld de, $C0E0
  call $33B7
  ld de, $C120
  call $33B7
  ld de, $C160
  call $33B7
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  jr z, .rightNotPressed
  ld a, [W_ShopSellLastPageIndex]
  cp 0
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_ShopSellLastPageIndex]
  add 1
  ld b, a
  ld a, [W_ShopPageIndex]
  inc a
  cp b
  jr nz, .dontLoopToFirstPage
  xor a

.dontLoopToFirstPage
  ld [W_ShopPageIndex], a
  call ShopSellGetPartsByPage
  ld a, 1
  ld [W_ShopPointlessSingleRunCheck], a
  ld a, 1
  ld [$C7DA], a
  call WrapShopMapPartInfoForPage
  call ShopMapPageNumbers
  call ShopSellMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  ret

.rightNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, [W_ShopSellLastPageIndex]
  cp 0
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_ShopPageIndex]
  dec a
  cp $FF
  jr nz, .dontLoopToLastPage
  ld a, [W_ShopSellLastPageIndex]

.dontLoopToLastPage
  ld [W_ShopPageIndex], a
  call ShopSellGetPartsByPage
  ld a, 1
  ld [W_ShopPointlessSingleRunCheck], a
  ld a, 1
  ld [$C7DA], a
  call WrapShopMapPartInfoForPage
  call ShopMapPageNumbers
  call ShopSellMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  ret

.leftNotPressed
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
  call ShopPositionBuySellMenuCursor
  call ShopSellMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, [W_ShopBuyMenuSelection]
  inc a
  cp 4
  jr nz, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [W_ShopBuyMenuSelection], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPositionBuySellMenuCursor
  call ShopSellMapSelectionPrice
  call ShopMapQty
  call ShopDisplayPartDescription
  ret

.downNotPressed
  call ShopDescriptionMultiPageHelper
  jp z, .aNotPressed
  ld a, [W_ShopSelectedPartIndex]
  cp $FF
  jr z, .emptySlotSelected
  ld a, 3
  call ScheduleSoundEffect
  ld a, $CC
  ld [$C0E2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  call $1554
  jp ShopSubstateIncrement

.emptySlotSelected
  ld a, 5
  call ScheduleSoundEffect
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld a, $34
  ld [W_CoreSubStateIndex], a
  xor a
  ld [W_ShopPageIndex], a
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  ret

  nop

ShopSellYNBoxState::
  ld a, 1
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, .yesSelected
  call WrapInitiateMainScript
  call ShopDisplayPartDescription
  ld a, $1A
  ld [W_CoreSubStateIndex], a
  ret

.yesSelected
  call ShopSellGetPrice
  call ShopPartPriceToPlayerMoney
  ld a, [W_PlayerMoolah]
  ld h, a
  ld a, [W_PlayerMoolah + 1]
  ld l, a
  ld a, l
  add e
  ld l, a
  jr nc, .noIncH
  ld a, h
  add 1
  ld h, a

.noIncH
  ld a, h
  add d
  ld h, a
  ld a, h
  ld [W_PlayerMoolah], a
  ld a, l
  ld [W_PlayerMoolah + 1], a
  call ShopEnforceMonetaryLimit
  ld a, 1
  ld b, a
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, [W_ShopSelectedPartIndex]
  call $35A0
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, [W_ShopSelectedPartIndex]
  call $358A
  ld a, [$C4EE]
  or a
  jr nz, .partIsSellable
  ld a, [$C4F0]
  ld b, a
  ld a, [$C4EE]
  sub b
  jr z, .partIsSellable

; This code in theory should never fire.
  ld a, [W_ShopBuyMenuSelection]
  ld hl, .table
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld h, [hl]
  ld l, a
  call ShopMapPartInfoDashes

.partIsSellable
  ld a, 1
  ld [$C7DB], a
  jp .nextState
  ret

.table
  dw $98A2
  dw $98E2
  dw $9922
  dw $9962

.nextState
  jp ShopSubstateIncrement
  ret

ShopSellPostYesListRefreshState::
  ld bc, $0610 ; previously 0510
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  ld a, [W_ShopStockPart1Index]
  cp $FF
  jr nz, .refreshList
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, [W_ShopSelectedPartIndex]
  call $358A
  ld a, [$C4EE]
  or a
  jr z, .partNotInInventory
  ld a, [$C4F0]
  ld b, a
  ld a, [$C4EE]
  sub b
  jr nz, .refreshList

.partNotInInventory
  ld a, [W_ShopPageIndex]
  cp 0
  jr z, .refreshList
  dec a
  ld [W_ShopPageIndex], a

.refreshList
  call ShopSellCalculatePages
  ld a, [W_ShopSellLastPageIndex]
  cp 0
  call z, .downToOnePage
  ld a, 1
  ld [W_ShopPointlessSingleRunCheck], a
  call ShopSellGetPartsByPage
  call WrapShopMapPartInfoForPage
  call ShopSellMapSelectionPrice
  call ShopMapQty
  call ShopMapPageNumbers
  jp ShopSubstateIncrement
  ret

.downToOnePage
  ld a, 0
  ld b, a
  ld a, $88
  ld de, $C160
  call $33B2
  ret

ShopSellPostYesInputCheckState::
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputB | M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  ret z
  call WrapInitiateMainScript
  call ShopDisplayPartDescription
  ld a, $1A
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Shop State Machine 3", ROMX[$4D29], BANK[$04]
ShopPasswordMappingState::
  ld a, [W_ShopShopkeeper]
  add $BD
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 1
  ld [$C240], a
  ld a, $22
  ld [$C241], a
  ld a, $C1
  ld [$C242], a
  ld a, $60
  ld [$C243], a
  ld a, $18
  ld [$C244], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $AB
  ld de, $C240
  call $33B2
  ld a, 1
  ld [$C180], a
  ld a, $22
  ld [$C181], a
  ld a, $A0
  ld [$C182], a
  ld a, 7
  ld [$C185], a
  ld a, $10
  ld [$C183], a
  ld a, $30
  ld [$C184], a
  ld a, 1
  ld [$C1A0], a
  ld a, $22
  ld [$C1A1], a
  ld a, $98
  ld [$C1A2], a
  ld a, 2
  ld [$C1A5], a
  ld a, $38
  ld [$C1A3], a
  ld a, 8
  ld [$C1A4], a
  ld a, 1
  ld [$C1C0], a
  ld a, 2
  ld [$C1C1], a
  ld a, $C0
  ld [$C1C2], a
  ld a, 1
  ld [$C1C5], a
  ld a, $50
  ld [$C1C3], a
  ld a, $50
  ld [$C1C4], a
  ld a, 1
  ld [$C1E0], a
  ld a, 2
  ld [$C1E1], a
  ld a, $C3
  ld [$C1E2], a
  ld a, 5
  ld [$C1E5], a
  ld a, $50
  ld [$C1E3], a
  ld a, $40
  ld [$C1E4], a
  ld a, 1
  ld [$C200], a
  ld a, $11
  ld [$C201], a
  ld a, $80
  ld [$C202], a
  ld a, 5
  ld [$C205], a
  ld a, 8
  ld [$C203], a
  ld a, 8
  ld [$C204], a
  ld a, 1
  ld [$C220], a
  ld a, $22
  ld [$C221], a
  ld a, $A2
  ld [$C222], a
  ld a, 5
  ld [$C225], a
  ld a, 4
  ld [$C223], a
  ld a, $24
  ld [$C224], a
  ld a, 0
  ld [$C0A0], a
  ld [$C100], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $89
  ld de, $C1A0
  call $33B2
  ld a, 0
  ld b, a
  ld a, $8C
  ld de, $C180
  call $33B2
  ld a, 0
  ld b, a
  ld a, $80
  ld de, $C200
  call $33B2
  ld a, 0
  ld b, a
  ld a, $9D
  ld de, $C220
  call $33B2
  ld bc, 0
  ld e, $84
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $89
  ld a, 1
  call WrapDecompressTilemap0
  ld hl, $9842
  ld a, 5
  ld b, a
  call ShopMapDashes
  xor a
  ld [W_ShopPasswordSelectionXAxis], a
  ld [W_ShopPasswordSelectionYAxis], a
  ld [W_ShopPasswordEntryBuffer], a
  ld [W_ShopPasswordEntryBuffer + 1], a
  ld [W_ShopPasswordEntryBuffer + 2], a
  ld [W_ShopPasswordEntryBuffer + 3], a
  ld [W_ShopPasswordEntryBuffer + 4], a
  ld [W_ShopPasswordEntryBuffer + 5], a
  ld [W_ShopPasswordNumEnteredDigits], a
  ld [W_ShopPasswordLastEnteredDigit], a
  jp ShopSubstateIncrement

ShopPasswordInputHandlerState::
  ld de, $C180
  call $33B7
  ld de, $C1A0
  call $33B7
  ld de, $C200
  call $33B7
  ld de, $C220
  call $33B7
  ld de, $C240
  call $33B7
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_ShopPasswordSelectionYAxis]
  dec a
  cp $FF
  jr nz, .dontLoopToBottom
  ld a, 3

.dontLoopToBottom
  ld [W_ShopPasswordSelectionYAxis], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPasswordPositionEntryCursor
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, [W_ShopPasswordSelectionYAxis]
  inc a
  cp 4
  jr nz, .dontLoopToTop
  xor a

.dontLoopToTop
  ld [W_ShopPasswordSelectionYAxis], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPasswordPositionEntryCursor
  ret

.downNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  jr z, .rightNotPressed
  ld a, [W_ShopPasswordSelectionXAxis]
  inc a
  cp 4
  jr nz, .dontLoopToLeft
  xor a

.dontLoopToLeft
  ld [W_ShopPasswordSelectionXAxis], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPasswordPositionEntryCursor
  ret

.rightNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, [W_ShopPasswordSelectionXAxis]
  dec a
  cp $FF
  jr nz, .dontLoopToRight
  ld a, 3

.dontLoopToRight
  ld [W_ShopPasswordSelectionXAxis], a
  ld a, 2
  call ScheduleSoundEffect
  call ShopPasswordPositionEntryCursor
  ret

.leftNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jp z, .aNotPressed
  ld a, 3
  call ScheduleSoundEffect
  ld a, [W_ShopPasswordNumEnteredDigits]
  cp 6
  jr z, .allDigitsEntered
  ld a, 0
  ld b, a
  ld a, $8D
  ld de, $C220
  call $33B2
  call .bufferDigit
  push af
  ld a, [W_ShopPasswordNumEnteredDigits]
  inc a
  ld [W_ShopPasswordNumEnteredDigits], a
  call .highlightPressedDigitButton
  ld a, [W_ShopPasswordNumEnteredDigits]
  add $20
  ld l, a
  ld h, $98
  pop af
  push hl
  call .getDigitTileIndex
  pop hl
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 0
  ld b, a
  ld a, $8B
  ld de, $C180
  call $33B2
  ld hl, $9841
  ld a, 6
  ld b, a
  call ShopMapDashes
  ld a, [W_ShopPasswordNumEnteredDigits]
  inc a
  ld b, a
  ld c, $2
  ld e, $8A
  ld a, 1
  call WrapDecompressTilemap0
  ld a, [$C203]
  add 8
  ld [$C203], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_ShopPasswordNumEnteredDigits]
  cp 6
  jr z, .allDigitsEntered
  ret

.allDigitsEntered
  ld a, 0
  ld [$C200], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call $3482
  call ShopMapMessageboxAttributes
  jp ShopSubstateIncrement

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  call .clearDigitFromBufferOrNot
  ld a, [W_ShopPasswordNumEnteredDigits]
  cp 0
  jr z, .exitPasswordScreen
  cp 6
  call z, .restoreTextCursor
  ld a, 1
  ld [$C200], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_ShopPasswordNumEnteredDigits]
  add $20
  ld l, a
  ld h, $98
  ld a, 0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [W_ShopPasswordNumEnteredDigits]
  dec a
  ld [W_ShopPasswordNumEnteredDigits], a
  ld hl, $9841
  ld a, 6
  ld b, a
  call ShopMapDashes
  ld a, [W_ShopPasswordNumEnteredDigits]
  inc a
  ld b, a
  ld c, $2
  ld e, $8A
  ld a, 1
  call WrapDecompressTilemap0
  ld a, [$C203]
  sub 8
  ld [$C203], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.restoreTextCursor
  ld a, 0
  ld b, a
  ld a, $89
  ld de, $C1A0
  call $33B2
  ret

.exitPasswordScreen
  xor a
  ld [W_ShopPasswordSelectionXAxis], a
  ld [W_ShopPasswordSelectionYAxis], a
  ld a, 0
  ld [$C180], a
  ld [$C1A0], a
  ld [$C1C0], a
  ld [$C1E0], a
  ld [$C200], a
  ld [$C240], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $3A
  ld [W_CoreSubStateIndex], a
  ret

.getDigitTileIndex
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ret

.table
  db $E0,$E1,$E2,$E3
  db $E4,$E5,$E6,$E7
  db $E8,$E9,$A2,$A3
  db $A4,$A5,$A6,$A7

.highlightPressedDigitButton
  ld a, [W_ShopPasswordLastEnteredDigit]
  add $88
  ld [$C222], a
  ld a, [W_ShopPasswordSelectionXAxis]
  sla a
  sla a
  sla a
  sla a
  add 4
  ld [$C223], a
  ld a, [W_ShopPasswordSelectionYAxis]
  sla a
  sla a
  sla a
  sla a
  add $24
  ld [$C224], a
  ld a, 0
  ld b, a
  ld a, [W_ShopPasswordLastEnteredDigit]
  add $8D
  ld de, $C220
  call $33B2
  ret

.bufferDigit
  ld a, [W_ShopPasswordNumEnteredDigits]
  ld c, a
  xor a
  ld b, a
  ld hl, W_ShopPasswordEntryBuffer
  add hl, bc
  ld a, [W_ShopPasswordSelectionYAxis]
  sla a
  sla a
  ld b, a
  ld a, [W_ShopPasswordSelectionXAxis]
  add b
  ld [hl], a
  ld [W_ShopPasswordLastEnteredDigit], a
  ret

.clearDigitFromBufferOrNot
  ; The devs fucked up. The "ld b, a" and "ld c, a" should be swapped. Inadvertantly clobbers one of $C8E7, $C9E7, $CAE7, $CBE7, and $CCE7 when clearing any digit other than the first.
  ld a, [W_ShopPasswordNumEnteredDigits]
  ld b, a
  xor a
  ld c, a
  ld hl, W_ShopPasswordEntryBuffer
  add hl, bc
  xor a
  ld [hl], a
  ret

ShopPasswordYNInputHandler::
  ld de, $C180
  call $33B7
  ld de, $C220
  call $33B7
  ld a, [W_ShopShopkeeper]
  add $E7
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 5
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, .yesSelected
  call $3482
  call ShopMapMessageboxAttributes
  ld a, $2E
  ld [W_CoreSubStateIndex], a
  ret

.yesSelected
  call $3482
  call ShopMapMessageboxAttributes
  xor a
  ld [W_ShopPasswordIsMatch], a
  call ShopCheckPassword
  ld a, [W_ShopPasswordIsMatch]
  cp 1
  jr nz, .passwordErrorA
  ld a, [W_CurrentPartTypeForListView]
  ld d, a
  ld a, [W_CurrentPartIndexForPartStatus]
  call $358A
  or a
  jp z, .passwordErrorB
  call ShopAddPasswordObtainedPartToInventory
  ld a, $27
  ld b, 1
  call $3580
  call ShopPasswordGetObtainedPartPalette
  call ShopPasswordDrawAndMapPartObtainedWindow
  ld a, [W_CurrentPartTypeForListView]
  add $BC
  ld [$C1C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $8A
  ld de, $C1A0
  call $33B2
  ld a, 0
  ld [$C240], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp ShopSubstateIncrement

.passwordErrorA
  ld a, 1
  ld [$C240], a
  ld a, $22
  ld [$C241], a
  ld a, $BF
  ld [$C242], a
  ld a, $60
  ld [$C243], a
  ld a, $18
  ld [$C244], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $AA
  ld de, $C240
  call $33B2
  ld a, $2C
  ld [W_CoreSubStateIndex], a
  ret

.passwordErrorB
  ld a, 1
  ld [$C240], a
  ld a, $22
  ld [$C241], a
  ld a, $BF
  ld [$C242], a
  ld a, $60
  ld [$C243], a
  ld a, $18
  ld [$C244], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld b, a
  ld a, $AA
  ld de, $C240
  call $33B2
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

ShopPasswordAfterNoMessageState::
  ld a, [W_ShopShopkeeper]
  add $BD
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, $27
  ld [W_CoreSubStateIndex], a
  ret

ShopPasswordSuccessExitToShopWrapperState::
  ld a, $3A
  ld [W_CoreSubStateIndex], a
  ret

ShopPasswordSuccessMessageState::
  ld a, [W_CurrentPartTypeForListView]
  inc a
  ld b, a
  ld c, $A
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ShopShopkeeper]
  add $C2
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  xor a
  ld [W_ShopPasswordEntryBuffer], a
  ld [W_ShopPasswordEntryBuffer + 1], a
  ld [W_ShopPasswordEntryBuffer + 2], a
  ld [W_ShopPasswordEntryBuffer + 3], a
  ld [W_ShopPasswordEntryBuffer + 4], a
  ld [W_ShopPasswordEntryBuffer + 5], a
  ld [W_ShopPasswordNumEnteredDigits], a
  ld [W_ShopPasswordLastEnteredDigit], a
  jp ShopSubstateIncrement

ShopPasswordErrorAMessageState::
  ld de, $C240
  call $33B7
  ld a, [W_ShopShopkeeper]
  add $CE
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputB | M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  ret z
  ld a, 0
  ld b, a
  ld a, $AB
  ld de, $C240
  call $33B2
  call $3482
  call ShopMapMessageboxAttributes
  jp ShopSubstateIncrement

ShopPasswordPostErrorMessageState::
  ld a, [W_ShopShopkeeper]
  add $D2
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, $27
  ld [W_CoreSubStateIndex], a
  ret

ShopPasswordErrorBMessageState::
  ld de, $C240
  call $33B7
  ld a, [W_ShopShopkeeper]
  add $EB
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputB | M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  ret z
  ld a, 0
  ld b, a
  ld a, $AB
  ld de, $C240
  call $33B2
  call $3482
  call ShopMapMessageboxAttributes
  jp ShopSubstateIncrement

ShopFadeOutState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp ShopSubstateIncrement

ShopPasswordRemapShopState::
  ld a, 1
  ld [$C0A0], a
  ld [$C100], a
  ld a, 0
  ld [$C120], a
  ld [$C140], a
  ld [$C0E0], a
  ld [$C160], a
  ld [$C180], a
  ld [$C1A0], a
  ld [$C1C0], a
  ld [$C1E0], a
  ld [$C200], a
  ld [$C220], a
  ld [$C240], a
  ld [$C0C0], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, $B06
  ld a, [W_ShopShopkeeper]
  add $85
  ld e, a
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, $D01
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  call $3482
  call ShopMapMessageboxAttributes
  jp ShopSubstateIncrement

ShopBuySellRemapShopState::
  ld a, 1
  ld [$C0A0], a
  ld [$C100], a
  ld [$C0C0], a
  ld a, 0
  ld [$C120], a
  ld [$C140], a
  ld [$C0E0], a
  ld [$C160], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, $B06
  ld a, [W_ShopShopkeeper]
  add $85
  ld e, a
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, 8
  ld e, $81
  ld a, 1
  call WrapDecompressAttribmap0
  ld bc, 8
  ld e, $81
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, $D01
  ld hl, W_PlayerMoolah
  call ShopMapMoney
  xor a
  ld [W_ShopBuyMenuSelection], a
  ld a, [W_ShopPartTypeSelectionIndex]
  cp 1
  jr z, .headParts
  cp 2
  jr z, .rightArmParts
  cp 3
  jr z, .leftArmParts
  cp 4
  jr z, .legParts

.headParts
  ld a, $BC
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $84
  ld a, 1
  call WrapDecompressTilemap0
  jr .nextState

.rightArmParts
  ld a, $BE
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $85
  ld a, 1
  call WrapDecompressTilemap0
  jr .nextState

.leftArmParts
  ld a, $BD
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $86
  ld a, 1
  call WrapDecompressTilemap0
  jr .nextState

.legParts
  ld a, $BF
  ld [$C0C2], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld bc, $40A
  ld e, $87
  ld a, 1
  call WrapDecompressTilemap0
  jr .nextState

.nextState
  jp ShopSubstateIncrement

ShopBuySellReturnToShopMessageState::
  ld a, [W_ShopMainMenuSelection]
  cp 0
  jr z, .cameFromBuyScreen
  cp 1
  jr z, .cameFromSellScreen
  jr .afterMessage

.cameFromBuyScreen
  ld a, [W_ShopShopkeeper]
  add $B1
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jr .afterMessage

.cameFromSellScreen
  ld a, [W_ShopShopkeeper]
  add $B5
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jr .afterMessage

.afterMessage
  ld a, 7
  ld [W_CoreSubStateIndex], a
  ret

ShopRestorePasswordMenuItemDescriptionState::
  ld a, [W_ShopShopkeeper]
  add $B9
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

ShopFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp ShopSubstateIncrement

ShopPrepareFadeInState::
  call PrepareShopFadeByShopkeeper
  jp ShopSubstateIncrement

ShopPasswordPrepareFadeInState::
  ld hl, $34
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp ShopSubstateIncrement

ShopPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

ShopPreparePreExitMessageState::
  call WrapInitiateMainScript
  call ShopMapMessageboxAttributes
  ld a, $46
  ld [W_CoreSubStateIndex], a
  ret

ShopPrepareFadeOutOnExitState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $10
  call WrapSetupPalswapAnimation
  jp ShopSubstateIncrement

ShopExitState::
  ld a, 0
  call $1554
  call $3433
  jp $36A3

ShopUnusedExitState::
  ld a, [W_CoreStateIndex]
  inc a
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

ShopUnusedRestoreMessageState::
  ld a, [W_ShopMainMenuSelection]
  cp 0
  jr z, .otherSelected
  cp 1
  jr z, .otherSelected
  cp 2
  jr z, .passwordSelected
  cp 3
  jr z, .otherSelected

.otherSelected
  ld a, [W_ShopShopkeeper]
  add $D6
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jr .continue

.passwordSelected
  ld a, [W_ShopShopkeeper]
  add $B9
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jr .continue

.continue
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

ShopPasswordMessageAState::
  ld a, [W_ShopShopkeeper]
  add $CA
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

ShopBuyCannotAffordMessageState::
  ld a, [W_ShopShopkeeper]
  add $C6
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, $12
  ld [W_CoreSubStateIndex], a
  ret

ShopPreExitMessageState::
  ld a, [W_ShopShopkeeper]
  add $DA
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, $49
  ld [W_CoreSubStateIndex], a
  ret

ShopPlaceholderState::
  ret

ShopPasswordMessageBState::
  ld a, [W_ShopShopkeeper]
  add $E3
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret
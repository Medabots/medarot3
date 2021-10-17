INCLUDE "game/src/common/constants.asm"

SECTION "Shop Vars 1", WRAM0[$C7A0]
W_ShopPartTypeSelectionIndex:: ds 1

SECTION "Shop Vars 2", WRAM0[$C7A5]
W_ShopIndex:: ds 1
W_ShopStockLevel:: ds 1

SECTION "Shop Vars 3", WRAM0[$C7C0]
W_ShopMainMenuSelection:: ds 1

SECTION "Shop Vars 4", WRAM0[$C7D6]
W_ShopSelectedPartIndex:: ds 1

SECTION "Shop Vars 5", WRAM0[$C7E3]
W_ShopStockPart0Index:: ds 1
W_ShopStockPart1Index:: ds 1
W_ShopStockPart2Index:: ds 1
W_ShopStockPart3Index:: ds 1

SECTION "Shop Vars 6", WRAM0[$C7F0]
W_ShopShopkeeper:: ds 1

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
  dw $5433 ; 08
  dw ShopFadeState ; 09
  dw ShopBuySellDisplayPartTypeState ; 0A
  dw ShopParseStockState ; 0B
  dw $461F ; 0C
  dw $46F9 ; 0D
  dw $541B ; 0E
  dw ShopFadeState ; 0F
  dw $488D ; 10
  dw $4926 ; 11
  dw $49A3 ; 12
  dw $40BC ; 13
  dw $40BC ; 14
  dw $40BC ; 15
  dw $49B4 ; 16
  dw $4AC0 ; 17
  dw $541B ; 18
  dw ShopFadeState ; 19
  dw $4AD5 ; 1A
  dw $4BF4 ; 1B
  dw $4C86 ; 1C
  dw $4CEB ; 1D
  dw $40BC ; 1E
  dw $40BC ; 1F
  dw $40BC ; 20
  dw $40BC ; 21
  dw $5433 ; 22
  dw ShopFadeState ; 23
  dw $4D29 ; 24
  dw $5421 ; 25
  dw ShopFadeState ; 26
  dw $4E90 ; 27
  dw $50B3 ; 28
  dw $51BF ; 29
  dw $51B9 ; 2A
  dw $40BC ; 2B
  dw $5202 ; 2C
  dw $5233 ; 2D
  dw $51A1 ; 2E
  dw $40BC ; 2F
  dw $524B ; 30
  dw $5233 ; 31
  dw $40BC ; 32
  dw $40BC ; 33
  dw $5433 ; 34
  dw ShopFadeState ; 35
  dw $52EE ; 36
  dw $541B ; 37
  dw ShopFadeState ; 38
  dw $53BD ; 39
  dw $5433 ; 3A
  dw $527C ; 3B
  dw $5287 ; 3C
  dw $541B ; 3D
  dw ShopFadeState ; 3E
  dw $53F8 ; 3F
  dw $40BC ; 40
  dw $40BC ; 41
  dw $5504 ; 42
  dw $547A ; 43
  dw $54BB ; 44
  dw $54D3 ; 45
  dw $54EB ; 46
  dw $5503 ; 47
  dw $5445 ; 48
  dw $5451 ; 49
  dw ShopFadeState ; 4A
  dw $5463 ; 4B

ShopUnusedSubstateIncrement::
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
  ld a, 0
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
  call $339E
  ld bc, $B06
  ld a, [W_ShopShopkeeper]
  add $85
  ld e, a
  ld a, 1
  call $339E
  ld bc, 0
  ld e, $80
  ld a, 1
  call WrapDecompressTilemap0
  call WrapInitiateMainScript
  call $5C81
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
  ld a, 1
  ld [$C0A0], a
  ld a, 0
  ld [$C0A1], a
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
  ld a, 0
  ld b, a
  ld a, $36
  ld de, $C0A0
  call $33B2
  ld a, 0
  ld b, a
  ld a, $84
  ld de, $C100
  call $33B2
  ld bc, $D01
  ld hl, $C670
  call $557A
  call PrepareShopFadeByShopkeeper
  jp ShopSubstateIncrement

ShopShopkeeperWelcomeMessageState::
  ld a, [W_ShopShopkeeper]
  add $DE
  ld c, a
  ld b, 0
  ld a, 2
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
  call $5BF8
  call $3482
  call $5C81
  call $5C52
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
  call $5BF8
  call $3482
  call $5C81
  call $5C52
  ret

.downNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  jr z, .selectNotPressed
  ld a, 0
  ld [W_CoreSubStateIndex], a
  ld a, [W_ShopIndex]
  inc a
  ld [W_ShopIndex], a
  jp ShopDrawingStateContinued
  ret

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
  call $5C81
  call ShopSubstateIncrement
  ret

.passwordMessageA
  call WrapInitiateMainScript
  call $5C81
  ld a, $44
  ld [W_CoreSubStateIndex], a
  ret

.passwordMessageB
  call WrapInitiateMainScript
  call $5C81
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
  call $339E
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
  call $5C81
  call $5C52
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

SECTION "Shop State Machine 2", ROMX[$5410], BANK[$04]
ShopFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp ShopSubstateIncrement

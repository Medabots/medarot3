INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Shop Helper Functions 1", ROMX[$4883], BANK[$04]
WrapShopGetPartPriceAndStatus::
  ld [W_ListItemIndexForBuffering], a
  call ShopGetPartPriceAndStatus
  ld c, a
  ld b, 0
  ret

SECTION "Shop Helper Functions 2", ROMX[$4CFC], BANK[$04]
ShopEnforceMonetaryLimit::
  ld a, [W_PlayerMoolah]
  cp $27
  jr c, .pointlessLowerByteCheck
  jr z, .checkLowerByte

.setMoneyToMax
  ld a, $27
  ld [W_PlayerMoolah], a
  ld a, $F
  ld [W_PlayerMoolah + 1], a
  ret

.checkLowerByte
  ld a, [W_PlayerMoolah + 1]
  cp $F
  jr c, .lowerByteWithinBounds
  jr z, .lowerByteTooHigh
  jr .setMoneyToMax

.lowerByteWithinBounds
  ret 

.lowerByteTooHigh
  jr .setMoneyToMax

.pointlessLowerByteCheck
  ld a, [W_PlayerMoolah + 1]
  cp $F
  jr c, .pointlessJumpB
  jr z, .pointlessJumpA

.pointlessJumpA
  ret

.pointlessJumpB
  ret

SECTION "Shop Helper Functions 3", ROMX[$551C], BANK[$04]
PrepareShopFadeByShopkeeper::
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
  ld hl, $30
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

.shopkeeper1
  ld hl, $31
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

.shopkeeper2
  ld hl, $32
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

.shopkeeper3
  ld hl, $33
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

ShopMapMoney::
  push hl
  push bc
  ld a, [hli]
  ld l, [hl]
  ld h, a
  push hl
  call $14EC
  pop bc
  call $35BE
  pop bc
  pop hl
  ld a, [hli]
  ld d, a
  ld a, [hl]
  or d
  jr z, .noMoney
  ld a, 4
  add b
  ld b, a
  call $14EC
  di
  rst $20
  ld a, $E0
  ld [hl], a
  ei
  jp PlaceYenSymbolShop

.noMoney
  ld a, 3
  add b
  ld b, a
  call $14EC
  ld a, $EC
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

ShopWriteByteToVRam::
  di
  push af

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  pop af
  ld [hli], a
  ei
  ret

ShopMapHeartMaybe::
  ; In the patch, map male/female symbols instead of a heart for female
  or a
  ld a, $31 ; $31 is male, $32 is female
  jr z, .draw
  inc a
.draw
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

  padend $55d1

SECTION "Shop Helper Functions 4", ROMX[$566F], BANK[$04]
ShopBuyMapSelectionPrice::
  ld a, [W_ShopBuyMenuSelection]
  cp 0
  jr z, .selectedPart0
  cp 1
  jr z, .selectedPart1
  cp 2
  jr z, .selectedPart2
  cp 3
  jr z, .selectedPart3

.selectedPart0
  ld a, [W_ShopStockPart0Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.selectedPart1
  ld a, [W_ShopStockPart1Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.selectedPart2
  ld a, [W_ShopStockPart2Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.selectedPart3
  ld a, [W_ShopStockPart3Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.mapPrice
  cp $FF
  jr z, ShopMapSelectionPriceDashes
  call WrapShopGetPartPriceAndStatus
  ld hl, $99C9 ; Previously 99c8
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  di
  rst $20
  ld a, $E0
  ld [hli], a
  ei
  ld hl, $99C6 ; Previously 99c5
  xor a
  di
  push af
  rst $20
  pop af
  ld [hld], a
  ei
  call ShopMapThreeDigitNumber
  pop hl
  jp PlaceYenSymbolShop

ShopMapSelectionPriceDashes::
  ld hl, $99C5
  di
  rst $20
  xor a
  ld [hli], a
  ei
  ld a, 5
  ld b, a
  call ShopMapDashes
  ret

ShopSellMapSelectionPrice::
  ld a, [W_ShopBuyMenuSelection]
  cp 0
  jr z, .selectedPart0
  cp 1
  jr z, .selectedPart1
  cp 2
  jr z, .selectedPart2
  cp 3
  jr z, .selectedPart3

.selectedPart0
  ld a, [W_ShopStockPart0Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.selectedPart1
  ld a, [W_ShopStockPart1Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.selectedPart2
  ld a, [W_ShopStockPart2Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.selectedPart3
  ld a, [W_ShopStockPart3Index]
  ld [W_ShopSelectedPartIndex], a
  jr .mapPrice

.mapPrice
  cp $FF
  jr z, ShopMapSelectionPriceDashes
  ld [W_ShopPartIndexBuffer], a
  ld hl, $99C5 ; previously 99c4
  call ShopMapPartPrice
  ret

ShopMapDashes::
  push de
  push hl

.loop
  ld a, $01
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  pop hl
  pop de
  ret

ShopMapQty::
  ld a, [W_ShopBuyMenuSelection]
  cp 0
  jr z, .selectedPart0
  cp 1
  jr z, .selectedPart1
  cp 2
  jr z, .selectedPart2
  cp 3
  jr z, .selectedPart3

.selectedPart0
  ld a, [W_ShopStockPart0Index]
  jr .mapQty

.selectedPart1
  ld a, [W_ShopStockPart1Index]
  jr .mapQty

.selectedPart2
  ld a, [W_ShopStockPart2Index]
  jr .mapQty

.selectedPart3
  ld a, [W_ShopStockPart3Index]
  jr .mapQty

.mapQty
  cp $FF
  jr z, .mapDashes
  push af
  ld a, [W_ShopMainMenuSelection]
  or a
  jr nz, .sellScreen

.buyScreen
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  pop af
  call $358A
  ld a, [$C4EE]
  ld c, a
  xor a
  ld b, a
  ld hl, $9A0F ; Previously 9A0E
  call ShopMapThreeDigitNumber
  ret

.sellScreen
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  pop af
  call $358A
  ld a, [$C4F0]
  ld c, a
  ld a, [$C4EE]
  sub c
  ld c, a
  xor a
  ld b, a
  ld hl, $9A0F ; Previously 9A0E
  call ShopMapThreeDigitNumber
  ret

.mapDashes
  ld a, 2
  ld b, a
  ld hl, $9A11 ; Previously 9A10
  call ShopMapDashes
  ret

ShopBuyGetPrice::
  ld a, [W_ShopSelectedPartIndex]
  ld [W_ListItemIndexForBuffering], a
  call ShopGetPartPriceAndStatus
  ld h, 0
  ld l, a
  ld a, h
  ld [W_ShopSelectedPartPrice], a
  ld a, l
  ld [W_ShopSelectedPartPrice + 1], a
  ret

ShopSellGetPrice::
  ld a, [W_ShopSelectedPartIndex]
  ld [W_ListItemIndexForBuffering], a
  call ShopGetPartPriceAndStatus
  srl a
  ld h, 0
  ld l, a
  ld a, h
  ld [W_ShopSelectedPartPrice], a
  ld a, l
  ld [W_ShopSelectedPartPrice + 1], a
  ret

ShopPartPriceToPlayerMoney::
  ld a, [W_ShopSelectedPartPrice]
  ld d, a
  ld a, [W_ShopSelectedPartPrice + 1]
  ld e, a
  sla e
  rl d
  ld h, d
  ld l, e
  sla e
  rl d
  sla e
  rl d
  add hl, de
  ld d, h
  ld e, l
  ret

ShopSellCalculatePages::
  ld a, $97
  ld [$C817], a
  xor a
  ld [W_ShopSellNumParts], a
  ld b, $97

.loop
  push bc
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, $97
  sub b
  push af
  call $358A
  or a
  jr nz, .notSellable
  ld a, [$C4F0]
  ld b, a
  ld a, [$C4EE]
  sub b
  jr z, .notSellable
  pop af
  ld b, a
  ld [W_ShopStockLastPartInSellList], a
  ld a, [W_ShopSellNumParts]
  and 3
  or a
  jr nz, .nextPart
  ld a, [W_ShopSellNumParts]
  srl a
  srl a
  ld d, 0
  ld e, a
  ld hl, W_ShopStockFirstPartByPage
  add hl, de
  ld [hl], b

.nextPart
  ld a, [W_ShopSellNumParts]
  inc a
  ld [W_ShopSellNumParts], a
  jr .continue

.notSellable
  pop af

.continue
  pop bc
  dec b
  jr nz, .loop
  ld a, [W_ShopSellNumParts]
  or a
  jr z, .noParts
  sub 1

.noParts
  srl a
  srl a
  ld [W_ShopSellLastPageIndex], a
  ld a, [W_ShopSellLastPageIndex]
  ld hl, W_ShopStockFirstPartByPage
  ld d, 0
  ld e, a
  add hl, de
  inc hl
  ld a, [W_ShopStockLastPartInSellList]
  add 1
  ld [hl], a
  ret

ShopUnusedNumberMapper::
  cp 10
  jr nc, .twoOrMoreDigits
  push hl
  push af
  xor a
  ld de, 2
  add hl, de
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  pop af
  pop hl
  dec hl

.twoOrMoreDigits
  call ShopMapThreeDigitNumber
  ret

ShopSellGetPartsByPage::
  ld a, $FF
  ld [W_ShopStockPart0Index], a
  ld [W_ShopStockPart1Index], a
  ld [W_ShopStockPart2Index], a
  ld [W_ShopStockPart3Index], a
  ld a, [W_ShopPageIndex]
  ld hl, W_ShopStockFirstPartByPage
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hli]
  ld [W_ShopSellPartIndexBuffer], a
  ld a, [hl]
  ld [W_ShopSellStartOfNextPageIndex], a
  xor a
  ld [W_ShopSellPartsOnPage], a

.loop
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, [W_ShopSellPartIndexBuffer]
  call $358A
  or a
  jr nz, .nextPart
  ld a, [$C4F0]
  ld b, a
  ld a, [$C4EE]
  sub b
  jr z, .nextPart
  ld hl, W_ShopStockPart0Index
  ld a, [W_ShopSellPartsOnPage]
  ld d, 0
  ld e, a
  add hl, de
  ld a, [W_ShopSellPartIndexBuffer]
  ld [hl], a
  ld a, [W_ShopSellPartsOnPage]
  inc a
  ld [W_ShopSellPartsOnPage], a
  cp 4
  jr z, .exit

.nextPart
  ld a, [W_ShopSellStartOfNextPageIndex]
  ld b, a
  ld a, [W_ShopSellPartIndexBuffer]
  inc a
  ld [W_ShopSellPartIndexBuffer], a
  cp b
  jr nz, .loop

.exit
  ret

ShopMapPageNumbers::
  ld a, [W_ShopPageIndex]
  inc a
  ld hl, $9829
  ld b, 0
  call $3504
  ld a, [W_ShopSellLastPageIndex]
  inc a
  ld hl, $982C
  ld b, 1
  call $3504
  ret

WrapShopMapPartInfoForPage::
  ld a, [W_ShopPointlessSingleRunCheck]
  or a
  ret z
  xor a
  ld [W_ShopPointlessSingleRunCheck], a
  call ShopMapPartInfoForPage
  ret

ShopMapPartInfoForPage::
  ld de, $98A2
  ld hl, W_ShopStockPart0Index ; 0-3 are sequential
  ld b, $4
.loop
  push bc
  ld a, [hli]
  ld [W_ShopPartIndexBuffer], a
  cp $FF
  jr z, .dashes
  push de
  push hl
  ld h, d
  ld l, e
  ld a, b
  dec a
  rlca
  rlca
  rlca
  add $3e ; Starting address to draw to
  call ShopMapPartNameHeartAndPrice
  pop hl
  pop de
  jr .increment
.dashes
  push hl
  ld h, d
  ld l, e
  call ShopMapPartInfoDashes
  pop hl
.increment
  pop bc
  dec b
  jr z, .exit
  push hl
  ld hl, $0040
  add hl, de
  ld d, h
  ld e, l
  pop hl
  jr .loop
.exit
  ret

  padend $594e

ShopMapPartNameHeartAndPrice::
  push af ; a has drawing tile
  push hl
  ld a, [W_ShopPartIndexBuffer]
  ld b, a
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  ld a, b
  call $358A
  ld a, [$C4EE]
  or a
  jr z, .dashesPlz
  ld a, [W_ShopPartTypeSelectionIndex]
  ld b, a
  ld c, $A
  ld a, [W_ShopPartIndexBuffer]
  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop de ; hl -> de, address to draw to
  pop af
  push de
  ld h, a
  ld bc, W_NewListItemBufferArea
  call VWFDrawStringLeftFullAddress8Tiles
  pop hl
  ld de, 9
  add hl, de
  ld a, [$C54B]
  call ShopMapHeartMaybe
  inc hl ; Push HL one forward to skip the Yen symbol
  jr ShopMapPartPrice

.dashesPlz
  pop hl
  pop af
  jr ShopMapPartInfoDashes

  padend $5994

ShopMapPartPrice::
  push hl
  push hl
  inc hl
  di
  rst $20
  xor a
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc hl
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [W_ShopPartIndexBuffer]
  ld [W_ListItemIndexForBuffering], a
  call ShopGetPartPriceAndStatus
  srl a
  ld l, a
  ld h, 0
  pop bc
  push hl
  pop bc
  pop hl
  call ShopMapThreeDigitNumber
  jp PlaceYenSymbolShopAlt

ShopGetPartPriceAndStatus::
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  call $34FF
  ld a, [$C55D]
  ld c, a
  ld b, 0
  ret

ShopDisplayPartDescription::
  call $3482
  call ShopMapMessageboxAttributes
  ld a, [W_ShopSelectedPartIndex]
  cp $FF
  jr z, .exit
  ld [W_ListItemIndexForBuffering], a
  ld a, [W_ShopPartTypeSelectionIndex]
  dec a
  ld d, a
  call $34FF
  ld a, [$C553]
  ld b, 0
  ld c, a
  ld a, 5
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z

.exit
  ret

ShopMapPartInfoDashes::
  push hl
  push de
  ld d, $01
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  inc hl
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  inc hl
  inc hl
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  di
  rst $20
  ld a, d
  ld [hli], a
  ei
  pop de
  pop hl
  ret

  padend $5a5c

ShopPasswordGetObtainedPartPalette::
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, h
  ld c, l
  ld a, 3
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ret

ShopPasswordDrawAndMapPartObtainedWindow::
  call .pointlessCall
  ret

.pointlessCall
  call ShopPasswordDrawObtainedPart
  ld a, [W_CurrentPartTypeForListView]
  add $30
  ld e, a
  ld bc, $B01
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, $B01
  ld e, $30
  ld a, 0
  call WrapDecompressAttribmap0
  ld hl, .table
  ld b, 0
  ld a, [W_CurrentPartTypeForListView]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  jp hl

.table
  dw .headPart
  dw .rightArmPart
  dw .leftArmPart
  dw .legPart

.headPart
  ld b, 8
  ld c, 1
  ld hl, $98EB
  call $25E5
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  ld c, a
  ld hl, $98EB
  call ShopPasswordMapObtainedPartName
  call ShopPasswordGetPartStatValues
  call ShopPasswordMapObtainedPartNature
  call ShopPasswordMapObtainedPartSkillName
  ret

.rightArmPart
  ld b, 8
  ld c, 1
  ld hl, $98EB
  call $25E5
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  ld c, a
  ld hl, $98EB
  call ShopPasswordMapObtainedPartName
  call ShopPasswordGetPartStatValues
  call ShopPasswordMapObtainedPartNature
  call ShopPasswordMapObtainedPartSkillName
  ret

.leftArmPart
  jp .rightArmPart

.legPart
  ld b, 8
  ld c, 1
  ld hl, $98EB
  call $25E5
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  ld c, a
  ld hl, $98EB
  call ShopPasswordMapObtainedPartName
  call ShopPasswordGetPartStatValues
  call ShopPasswordMapObtainedPartNature
  call ShopPasswordMapObtainedPartMovementName
  ret

ShopPasswordMapObtainedPartName::
  inc b
  ld [W_ListItemIndexForBuffering], a
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop de ; hl -> de, VRAM address to map
  ld h, $02
  ld bc, W_NewListItemBufferArea
  ld a, $07
  call VWFDrawStringCentredFullAddress
  ret

ShopPasswordGetPartStatValues::
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [W_ListItemIndexForBuffering], a
  ld a, [W_CurrentPartTypeForListView]
  jp $34FF

ShopPasswordMapObtainedPartNature::
  ld bc, $0507
  ld a, [$C552]
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $992D
  ld bc, W_NewListItemBufferArea
  ld a, 6
  ld h, $09
  call VWFDrawStringLeftFullAddress
  ret

ShopPasswordMapObtainedPartSkillName::
  ld bc, $0606
  ld a, [$C554]
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $996D
  ld bc, W_NewListItemBufferArea
  ld h, $0F
  call VWFDrawStringLeftFullAddress5Tiles
  ret

ShopPasswordMapObtainedPartMovementName::
  ld bc, $0706
  ld a, [$C553]
  sub $50
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $996D
  ld bc, W_NewListItemBufferArea
  ld h, $0F
  call VWFDrawStringLeftFullAddress5Tiles
  ret

ShopPasswordDrawObtainedPart::
  call ShopPasswordObtainedPartIndexToPartImageIndex
  ld a, [$C4F0]
  ld [W_ListItemIndexForBuffering], a
  ld a, [W_CurrentPartTypeForListView]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  add b
  add b
  ld b, a
  ld a, [$C4EE]
  add b
  ld hl, $8800
  jp $34E1

.table
  db $13,$11,$11,$13

ShopPasswordObtainedPartIndexToPartImageIndex::
  ld a, [W_CurrentPartIndexForPartStatus]
  cp $33
  jr nc, .notFirstBank
  ld [$C4F0], a
  xor a
  ld [$C4EE], a
  ret

.notFirstBank
  cp $66
  jr nc, .notSecondBank
  sub $33
  ld [$C4F0], a
  ld a, 1
  ld [$C4EE], a
  ret

.notSecondBank
  sub $66
  ld [$C4F0], a
  ld a, 2
  ld [$C4EE], a
  ret

ShopPositionMainMenuCursor::
  ld a, [W_ShopMainMenuSelection]
  ld hl, ShopMainMenuCursorMap
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C0A4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

ShopPositionBuySellMenuCursor::
  ld a, [W_ShopBuyMenuSelection]
  ld hl, ShopBuySellMenuCursorMap
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C0E4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

ShopPasswordPositionEntryCursor::
  ld a, [W_ShopPasswordSelectionXAxis]
  ld hl, ShopPasswordCursorXMap
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C183], a
  ld a, [W_ShopPasswordSelectionYAxis]
  ld hl, ShopPasswordCursorYMap
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C184], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

ShopPasswordCursorXMap::
  db $10,$20,$30,$40

ShopPasswordCursorYMap::
  db $30,$40,$50,$60

ShopMainMenuCursorMap::
  db $10,$20,$30,$40

ShopBuySellMenuCursorMap::
  db $28,$38,$48,$58

ShopDisplayMenuMenuSelectionMessage::
  ld a, [W_ShopMainMenuSelection]
  cp 0
  jr z, .everythingElseSelected
  cp 1
  jr z, .everythingElseSelected
  cp 2
  jr z, .passwordSelected
  cp 3
  jr z, .everythingElseSelected

.everythingElseSelected
  ld a, [W_ShopShopkeeper]
  add $D6
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ret

.passwordSelected
  ld a, [W_ShopShopkeeper]
  add $B9
  ld c, a
  ld b, 0
  ld a, 2
  call WrapMainScriptProcessor
  ret

ShopMapMessageboxAttributes::
  ld bc, 0
  ld e, $9C
  ld a, 1
  call WrapDecompressAttribmap1
  ret

ShopCheckPassword::
  ld hl, ShopPasswordTable

.checkDigitLoop
  ld b, 0
  ld c, 8

.checkFirstDigit
  ld a, [hl]
  cp $FF
  jp z, .matchNotFound
  ld a, [W_ShopPasswordEntryBuffer]
  cp [hl]
  jr z, .checkSecondDigit
  add hl, bc
  jr .checkFirstDigit
  ret

.checkSecondDigit
  inc hl
  ld c, 7
  ld a, [W_ShopPasswordEntryBuffer + 1]
  cp [hl]
  jr z, .checkThirdDigit
  add hl, bc
  jr .checkDigitLoop
  ret

.checkThirdDigit
  inc hl
  ld c, 6
  ld a, [W_ShopPasswordEntryBuffer + 2]
  cp [hl]
  jr z, .checkFourthDigit
  add hl, bc
  jr .checkDigitLoop
  ret

.checkFourthDigit
  inc hl
  ld c, 5
  ld a, [W_ShopPasswordEntryBuffer + 3]
  cp [hl]
  jr z, .checkFifthDigit
  add hl, bc
  jr .checkDigitLoop
  ret

.checkFifthDigit
  inc hl
  ld c, 4
  ld a, [W_ShopPasswordEntryBuffer + 4]
  cp [hl]
  jr z, .checkSixthDigit
  add hl, bc
  jr .checkDigitLoop
  ret

.checkSixthDigit
  inc hl
  ld c, 3
  ld a, [W_ShopPasswordEntryBuffer + 5]
  cp [hl]
  jr z, .matchFound
  add hl, bc
  jr .checkDigitLoop
  ret

.matchFound
  ld a, 1
  ld [W_ShopPasswordIsMatch], a
  inc hl
  ld a, [hli]
  dec a
  ld [W_CurrentPartIndexForPartStatus], a
  ld a, [hl]
  dec a
  ld [W_CurrentPartTypeForListView], a
  ret

.matchNotFound
  xor a
  ld [W_ShopPasswordIsMatch], a
  ret

ShopAddPasswordObtainedPartToInventory::
  ld a, [W_CurrentPartTypeForListView]
  ld d, a
  ld a, 1
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  call $3596
  ret

ShopJunkCode::
  ld [W_CurrentPartTypeForListView], a
  ld [W_CurrentPartIndexForPartStatus], a

ShopPasswordTable::
  db $00,$00,$08,$08,$07,$01,$01,$01
  db $00,$01,$05,$03,$0D,$02,$01,$02
  db $00,$01,$06,$03,$02,$04,$01,$03
  db $00,$01,$0D,$0B,$05,$0E,$01,$04
  db $00,$01,$0E,$0F,$08,$04,$02,$01
  db $00,$02,$03,$08,$06,$01,$02,$02
  db $00,$02,$05,$08,$07,$09,$02,$03
  db $00,$03,$00,$01,$03,$03,$02,$04
  db $00,$03,$03,$04,$01,$00,$03,$01
  db $00,$03,$0B,$06,$0E,$07,$03,$02
  db $00,$04,$03,$0B,$08,$00,$03,$03
  db $00,$04,$04,$0F,$0A,$00,$03,$04
  db $00,$04,$08,$0C,$02,$0E,$04,$01
  db $00,$04,$0A,$04,$0F,$07,$04,$02
  db $00,$05,$0E,$0E,$00,$09,$04,$03
  db $00,$06,$00,$0B,$00,$09,$04,$04
  db $00,$06,$0D,$02,$09,$06,$05,$01
  db $00,$07,$02,$0F,$0F,$0D,$05,$02
  db $00,$07,$05,$0B,$04,$04,$05,$03
  db $00,$07,$09,$0F,$03,$0D,$05,$04
  db $00,$07,$0A,$04,$0F,$08,$06,$01
  db $00,$07,$0C,$0B,$0D,$08,$06,$02
  db $00,$07,$0D,$03,$0D,$08,$06,$03
  db $00,$08,$02,$07,$03,$0D,$06,$04
  db $00,$08,$09,$00,$0C,$0F,$07,$01
  db $00,$08,$0B,$0A,$0A,$09,$07,$02
  db $00,$08,$0F,$0F,$02,$05,$07,$03
  db $00,$0A,$00,$04,$0E,$0A,$07,$04
  db $00,$0A,$07,$04,$0D,$0A,$08,$01
  db $00,$0A,$08,$00,$08,$07,$08,$02
  db $00,$0B,$04,$03,$02,$0A,$08,$03
  db $00,$0B,$08,$0E,$0D,$00,$08,$04
  db $00,$0B,$0D,$00,$04,$0B,$09,$01
  db $00,$0C,$06,$03,$04,$03,$09,$02
  db $00,$0D,$0B,$02,$0B,$04,$09,$03
  db $00,$0E,$03,$04,$0D,$02,$09,$04
  db $00,$0F,$07,$03,$06,$0B,$0A,$01
  db $00,$0F,$07,$0C,$09,$0D,$0A,$02
  db $00,$0F,$0F,$0A,$00,$06,$0A,$03
  db $00,$0F,$0F,$0B,$0B,$09,$0A,$04
  db $01,$00,$0A,$09,$0E,$0C,$0B,$01
  db $01,$00,$0C,$0F,$0B,$01,$0B,$02
  db $01,$01,$03,$03,$0D,$05,$0B,$03
  db $01,$02,$01,$0B,$0C,$01,$0B,$04
  db $01,$02,$0E,$09,$01,$0A,$0C,$01
  db $01,$03,$0E,$00,$0E,$0D,$0C,$02
  db $01,$03,$0F,$03,$0F,$02,$0C,$03
  db $01,$04,$05,$0E,$09,$0F,$0C,$04
  db $01,$04,$06,$0A,$08,$0D,$0D,$01
  db $01,$04,$0C,$0B,$0B,$07,$0D,$02
  db $01,$04,$0D,$09,$0B,$05,$0D,$03
  db $01,$06,$09,$07,$03,$0D,$0D,$04
  db $01,$07,$01,$0F,$0D,$0A,$0E,$01
  db $01,$07,$02,$02,$04,$01,$0E,$02
  db $01,$07,$02,$0E,$00,$08,$0E,$03
  db $01,$07,$02,$0E,$09,$06,$0E,$04
  db $01,$08,$05,$04,$0C,$0A,$0F,$01
  db $01,$09,$01,$01,$00,$0D,$0F,$02
  db $01,$0A,$02,$00,$0C,$0C,$0F,$03
  db $01,$0A,$07,$02,$0D,$0B,$0F,$04
  db $01,$0A,$08,$04,$0A,$09,$10,$01
  db $01,$0A,$0E,$00,$05,$09,$10,$02
  db $01,$0C,$08,$01,$0C,$09,$10,$03
  db $01,$0C,$08,$04,$00,$01,$10,$04
  db $01,$0C,$0E,$0B,$01,$00,$11,$01
  db $01,$0C,$0F,$0F,$09,$01,$11,$02
  db $01,$0D,$0A,$02,$01,$0B,$11,$03
  db $01,$0D,$0B,$0D,$05,$0D,$11,$04
  db $01,$0E,$0A,$07,$0D,$07,$12,$01
  db $01,$0E,$0A,$0E,$01,$0B,$12,$02
  db $01,$0F,$01,$0A,$0F,$07,$12,$03
  db $01,$0F,$03,$09,$0D,$09,$12,$04
  db $01,$0F,$09,$05,$0A,$06,$13,$01
  db $01,$0F,$0C,$04,$07,$06,$13,$02
  db $02,$00,$0A,$0C,$01,$09,$13,$03
  db $02,$00,$0D,$0F,$01,$0B,$13,$04
  db $02,$01,$01,$0F,$0E,$06,$14,$01
  db $02,$01,$07,$0D,$02,$00,$14,$02
  db $02,$01,$0F,$0F,$07,$01,$14,$03
  db $02,$02,$07,$0E,$0D,$0F,$14,$04
  db $02,$02,$09,$01,$0B,$0F,$15,$01
  db $02,$02,$0D,$0D,$02,$07,$15,$02
  db $02,$02,$0D,$0E,$00,$0E,$15,$03
  db $02,$03,$02,$06,$01,$06,$15,$04
  db $02,$03,$05,$07,$0F,$0F,$16,$01
  db $02,$03,$0D,$0D,$0A,$08,$16,$02
  db $02,$04,$03,$06,$02,$03,$16,$03
  db $02,$04,$04,$03,$0A,$07,$16,$04
  db $02,$04,$05,$03,$00,$09,$17,$01
  db $02,$04,$06,$02,$0F,$09,$17,$02
  db $02,$04,$06,$08,$0E,$0B,$17,$03
  db $02,$04,$0A,$08,$0F,$06,$17,$04
  db $02,$04,$0A,$0B,$09,$0E,$18,$01
  db $02,$05,$02,$05,$04,$0E,$18,$02
  db $02,$05,$04,$07,$0E,$0E,$18,$03
  db $02,$05,$0D,$0F,$05,$09,$18,$04
  db $02,$05,$0F,$0D,$0A,$03,$19,$01
  db $02,$06,$02,$05,$02,$02,$19,$02
  db $02,$06,$05,$02,$0F,$0A,$19,$03
  db $02,$06,$0D,$08,$08,$0E,$19,$04
  db $02,$07,$09,$0D,$02,$02,$1A,$01
  db $02,$07,$0A,$01,$0A,$0C,$1A,$02
  db $02,$08,$01,$03,$03,$07,$1A,$03
  db $02,$09,$01,$07,$01,$00,$1A,$04
  db $02,$0A,$03,$00,$06,$06,$1B,$01
  db $02,$0A,$03,$0C,$0B,$02,$1B,$02
  db $02,$0A,$04,$0E,$03,$0E,$1B,$03
  db $02,$0A,$08,$0C,$04,$07,$1B,$04
  db $02,$0B,$00,$05,$08,$02,$1C,$01
  db $02,$0B,$06,$05,$0C,$01,$1C,$02
  db $02,$0B,$06,$08,$04,$03,$1C,$03
  db $02,$0C,$04,$05,$00,$08,$1C,$04
  db $02,$0C,$07,$05,$09,$07,$1D,$01
  db $02,$0C,$07,$06,$09,$01,$1D,$02
  db $02,$0C,$0D,$05,$02,$01,$1D,$03
  db $02,$0D,$07,$06,$00,$09,$1D,$04
  db $03,$01,$0B,$0C,$05,$00,$1E,$01
  db $03,$01,$0C,$0D,$00,$06,$1E,$02
  db $03,$02,$04,$04,$0B,$0A,$1E,$03
  db $03,$02,$0A,$09,$02,$03,$1E,$04
  db $03,$02,$0E,$07,$01,$0C,$1F,$01
  db $03,$03,$02,$0F,$04,$0A,$1F,$02
  db $03,$03,$07,$08,$00,$0C,$1F,$03
  db $03,$04,$02,$0E,$04,$02,$1F,$04
  db $03,$04,$05,$01,$05,$03,$20,$01
  db $03,$04,$05,$0D,$07,$0C,$20,$02
  db $03,$04,$0A,$0E,$04,$09,$20,$03
  db $03,$04,$0E,$0A,$03,$0D,$20,$04
  db $03,$05,$01,$07,$00,$0B,$21,$01
  db $03,$05,$04,$01,$06,$0B,$21,$02
  db $03,$05,$04,$0F,$04,$06,$21,$03
  db $03,$05,$07,$06,$0F,$0F,$21,$04
  db $03,$05,$0D,$0F,$0C,$0B,$22,$01
  db $03,$06,$08,$07,$0B,$0A,$22,$02
  db $03,$06,$0D,$0E,$08,$03,$22,$03
  db $03,$07,$0A,$07,$05,$02,$22,$04
  db $03,$07,$0D,$0A,$0E,$09,$23,$01
  db $03,$07,$0E,$05,$02,$08,$23,$02
  db $03,$08,$00,$08,$01,$0E,$23,$03
  db $03,$08,$04,$04,$06,$0F,$23,$04
  db $03,$08,$0B,$01,$0F,$02,$24,$01
  db $03,$08,$0B,$0B,$08,$0F,$24,$02
  db $03,$09,$07,$0A,$03,$02,$24,$03
  db $03,$0A,$03,$0A,$05,$0D,$24,$04
  db $03,$0A,$08,$0D,$0C,$0F,$25,$01
  db $03,$0A,$0C,$0F,$00,$02,$25,$02
  db $03,$0B,$00,$08,$0F,$05,$25,$03
  db $03,$0B,$07,$06,$09,$00,$25,$04
  db $03,$0C,$04,$0B,$07,$0D,$26,$01
  db $03,$0C,$07,$0A,$0C,$07,$26,$02
  db $03,$0E,$00,$0F,$05,$06,$26,$03
  db $03,$0E,$04,$0D,$0F,$0F,$26,$04
  db $03,$0E,$0A,$01,$02,$09,$27,$01
  db $03,$0E,$0E,$09,$03,$0F,$27,$02
  db $03,$0F,$05,$09,$00,$02,$27,$03
  db $03,$0F,$06,$02,$0A,$02,$27,$04
  db $04,$02,$00,$0D,$04,$02,$28,$01
  db $04,$02,$09,$04,$00,$01,$28,$02
  db $04,$02,$0C,$0B,$06,$06,$28,$03
  db $04,$03,$01,$00,$08,$0A,$28,$04
  db $04,$03,$02,$0E,$09,$05,$29,$01
  db $04,$03,$0A,$03,$0C,$0D,$29,$02
  db $04,$03,$0D,$05,$08,$0D,$29,$03
  db $04,$04,$01,$0C,$0E,$07,$29,$04
  db $04,$04,$0E,$03,$0C,$07,$2A,$01
  db $04,$05,$04,$02,$0D,$0F,$2A,$02
  db $04,$05,$09,$05,$05,$02,$2A,$03
  db $04,$05,$0E,$00,$07,$08,$2A,$04
  db $04,$05,$0E,$0D,$01,$04,$2B,$01
  db $04,$06,$00,$0D,$05,$03,$2B,$02
  db $04,$06,$04,$0A,$03,$0B,$2B,$03
  db $04,$06,$0A,$01,$0B,$07,$2B,$04
  db $04,$06,$0E,$00,$0B,$05,$2C,$01
  db $04,$07,$05,$0A,$05,$09,$2C,$02
  db $04,$07,$0D,$0D,$05,$00,$2C,$03
  db $04,$09,$07,$02,$09,$02,$2C,$04
  db $04,$09,$0F,$0A,$0C,$06,$2D,$01
  db $04,$0A,$01,$06,$09,$05,$2D,$02
  db $04,$0A,$02,$01,$02,$07,$2D,$03
  db $04,$0A,$09,$02,$0F,$0A,$2D,$04
  db $04,$0B,$0C,$05,$01,$00,$2E,$01
  db $04,$0B,$0D,$0C,$04,$09,$2E,$02
  db $04,$0C,$03,$09,$06,$0F,$2E,$03
  db $04,$0C,$04,$05,$00,$09,$2E,$04
  db $04,$0C,$08,$0A,$0F,$00,$2F,$01
  db $04,$0D,$01,$01,$0F,$0A,$2F,$02
  db $04,$0D,$04,$01,$0C,$06,$2F,$03
  db $04,$0D,$05,$0A,$0D,$0A,$2F,$04
  db $04,$0D,$0B,$0C,$07,$05,$30,$01
  db $04,$0E,$05,$0C,$0D,$05,$30,$02
  db $04,$0E,$0E,$02,$03,$04,$30,$03
  db $04,$0E,$0F,$03,$0A,$07,$30,$04
  db $04,$0F,$04,$02,$0A,$0A,$31,$01
  db $04,$0F,$04,$08,$04,$04,$31,$02
  db $04,$0F,$07,$08,$05,$01,$31,$03
  db $04,$0F,$09,$0C,$02,$04,$31,$04
  db $05,$00,$09,$0B,$01,$07,$32,$01
  db $05,$00,$0D,$01,$03,$0B,$32,$02
  db $05,$01,$00,$0D,$05,$0D,$32,$03
  db $05,$02,$02,$0E,$0C,$04,$32,$04
  db $05,$02,$04,$01,$05,$02,$33,$01
  db $05,$02,$0A,$03,$03,$05,$33,$02
  db $05,$03,$0E,$00,$05,$00,$33,$03
  db $05,$04,$0C,$03,$04,$00,$33,$04
  db $05,$04,$0E,$07,$07,$07,$34,$01
  db $05,$04,$0F,$09,$0A,$04,$34,$02
  db $05,$05,$01,$03,$0D,$02,$34,$03
  db $05,$05,$02,$08,$05,$02,$34,$04
  db $05,$05,$0B,$0B,$03,$0D,$35,$01
  db $05,$05,$0C,$0E,$0D,$0D,$35,$02
  db $05,$05,$0E,$0C,$0E,$0A,$35,$03
  db $05,$07,$01,$01,$03,$05,$35,$04
  db $05,$07,$02,$0A,$06,$0B,$36,$01
  db $05,$07,$07,$04,$0D,$0F,$36,$02
  db $05,$08,$00,$0A,$05,$04,$36,$03
  db $05,$08,$05,$08,$03,$09,$36,$04
  db $05,$08,$05,$0E,$0B,$0E,$37,$01
  db $05,$08,$09,$03,$07,$0A,$37,$02
  db $05,$08,$0E,$03,$0E,$06,$37,$03
  db $05,$09,$0C,$0C,$09,$02,$37,$04
  db $05,$09,$0D,$08,$0D,$0B,$38,$01
  db $05,$0A,$05,$01,$0D,$0A,$38,$02
  db $05,$0A,$0E,$0F,$05,$03,$38,$03
  db $05,$0B,$01,$0F,$04,$06,$38,$04
  db $05,$0B,$0F,$07,$0B,$00,$39,$01
  db $05,$0C,$07,$06,$09,$07,$39,$02
  db $05,$0D,$02,$02,$0F,$05,$39,$03
  db $05,$0D,$0C,$03,$09,$09,$39,$04
  db $05,$0D,$0C,$09,$08,$03,$3A,$01
  db $05,$0E,$00,$06,$03,$04,$3A,$02
  db $06,$00,$03,$06,$0C,$08,$3A,$03
  db $06,$00,$05,$0B,$07,$06,$3A,$04
  db $06,$00,$09,$0A,$04,$04,$3B,$01
  db $06,$00,$0A,$07,$03,$02,$3B,$02
  db $06,$00,$0C,$05,$0B,$0E,$3B,$03
  db $06,$00,$0D,$01,$00,$05,$3B,$04
  db $06,$00,$0E,$02,$06,$02,$3C,$01
  db $06,$01,$0E,$05,$02,$01,$3C,$02
  db $06,$02,$00,$06,$0C,$0B,$3C,$03
  db $06,$02,$03,$0C,$04,$00,$3C,$04
  db $06,$02,$0B,$07,$0B,$07,$3D,$01
  db $06,$02,$0F,$0F,$00,$07,$3D,$02
  db $06,$03,$03,$00,$02,$00,$3D,$03
  db $06,$03,$03,$0B,$06,$0C,$3D,$04
  db $06,$03,$07,$05,$07,$00,$3E,$01
  db $06,$03,$07,$06,$04,$0E,$3E,$02
  db $06,$03,$08,$03,$04,$0E,$3E,$03
  db $06,$03,$09,$04,$00,$0F,$3E,$04
  db $06,$03,$0C,$00,$01,$01,$3F,$01
  db $06,$03,$0E,$0E,$08,$0D,$3F,$02
  db $06,$05,$03,$09,$08,$09,$3F,$03
  db $06,$05,$07,$01,$0F,$00,$3F,$04
  db $06,$06,$0A,$0E,$0A,$00,$40,$01
  db $06,$06,$0C,$0C,$08,$01,$40,$02
  db $06,$07,$01,$04,$06,$02,$40,$03
  db $06,$07,$06,$0D,$0B,$00,$40,$04
  db $06,$07,$0B,$00,$00,$01,$41,$01
  db $06,$08,$04,$03,$0B,$09,$41,$02
  db $06,$08,$05,$06,$0E,$0B,$41,$03
  db $06,$08,$0D,$0A,$05,$00,$41,$04
  db $06,$09,$09,$0C,$06,$00,$42,$01
  db $06,$09,$0E,$01,$00,$06,$42,$02
  db $06,$0A,$07,$0C,$09,$03,$42,$03
  db $06,$0A,$09,$0F,$01,$0B,$42,$04
  db $06,$0A,$0A,$0A,$02,$08,$43,$01
  db $06,$0B,$05,$01,$0C,$0B,$43,$02
  db $06,$0B,$0F,$03,$0B,$00,$43,$03
  db $06,$0C,$06,$09,$04,$01,$43,$04
  db $06,$0D,$00,$08,$0D,$08,$44,$01
  db $06,$0D,$07,$0A,$06,$0C,$44,$02
  db $06,$0D,$09,$07,$0A,$09,$44,$03
  db $06,$0D,$0B,$07,$0E,$04,$44,$04
  db $06,$0D,$0C,$0A,$0F,$06,$45,$01
  db $06,$0D,$0F,$08,$02,$0A,$45,$02
  db $06,$0E,$07,$05,$05,$0E,$45,$03
  db $06,$0E,$09,$09,$0B,$05,$45,$04
  db $06,$0E,$09,$0B,$09,$0C,$46,$01
  db $06,$0F,$05,$0D,$08,$0C,$46,$02
  db $06,$0F,$09,$0F,$05,$0B,$46,$03
  db $06,$0F,$0D,$04,$0A,$0E,$46,$04
  db $07,$01,$0A,$08,$08,$06,$47,$01
  db $07,$01,$0D,$0B,$0D,$0D,$47,$02
  db $07,$01,$0E,$09,$03,$02,$47,$03
  db $07,$02,$00,$03,$01,$0A,$47,$04
  db $07,$02,$02,$0C,$0C,$05,$48,$01
  db $07,$02,$0B,$0B,$04,$00,$48,$02
  db $07,$02,$0C,$09,$0E,$07,$48,$03
  db $07,$03,$07,$06,$0D,$08,$48,$04
  db $07,$03,$0B,$02,$05,$0B,$49,$01
  db $07,$04,$01,$0F,$01,$00,$49,$02
  db $07,$05,$00,$05,$03,$0B,$49,$03
  db $07,$05,$05,$06,$08,$08,$49,$04
  db $07,$05,$07,$03,$0A,$06,$4A,$01
  db $07,$05,$0B,$03,$05,$0D,$4A,$02
  db $07,$07,$00,$07,$06,$0E,$4A,$03
  db $07,$07,$0C,$04,$0C,$0A,$4A,$04
  db $07,$07,$0F,$03,$09,$00,$4B,$01
  db $07,$08,$01,$0B,$02,$04,$4B,$02
  db $07,$09,$0D,$0E,$05,$04,$4B,$03
  db $07,$0A,$08,$06,$0A,$0D,$4B,$04
  db $07,$0A,$08,$07,$07,$07,$4C,$01
  db $07,$0A,$0B,$0A,$0A,$0F,$4C,$02
  db $07,$0B,$03,$0D,$0D,$04,$4C,$03
  db $07,$0B,$05,$06,$08,$06,$4C,$04
  db $07,$0C,$06,$04,$0A,$0E,$4D,$01
  db $07,$0C,$08,$05,$07,$05,$4D,$02
  db $07,$0C,$0E,$0A,$09,$0C,$4D,$03
  db $07,$0D,$0B,$00,$03,$07,$4D,$04
  db $07,$0D,$0D,$0D,$09,$0F,$4E,$01
  db $07,$0E,$03,$07,$04,$0C,$4E,$02
  db $07,$0F,$0E,$04,$0D,$0D,$4E,$03
  db $08,$00,$02,$04,$04,$08,$4E,$04
  db $08,$00,$0A,$0D,$0C,$03,$4F,$01
  db $08,$01,$08,$0A,$00,$00,$4F,$02
  db $08,$01,$0F,$0E,$0F,$00,$4F,$03
  db $08,$02,$05,$05,$07,$0A,$4F,$04
  db $08,$03,$0A,$0F,$0A,$00,$50,$01
  db $08,$03,$0E,$09,$08,$07,$50,$02
  db $08,$04,$03,$05,$03,$05,$50,$03
  db $08,$04,$04,$06,$04,$0C,$50,$04
  db $08,$04,$05,$08,$0F,$01,$51,$01
  db $08,$04,$06,$00,$0B,$01,$51,$02
  db $08,$04,$0B,$09,$06,$08,$51,$03
  db $08,$04,$0D,$07,$00,$08,$51,$04
  db $08,$06,$06,$07,$05,$0F,$52,$01
  db $08,$08,$02,$0D,$0D,$06,$52,$02
  db $08,$08,$06,$09,$02,$0B,$52,$03
  db $08,$08,$06,$0F,$0D,$07,$52,$04
  db $08,$09,$06,$01,$09,$0F,$53,$01
  db $08,$09,$07,$08,$03,$06,$53,$02
  db $08,$09,$07,$08,$05,$06,$53,$03
  db $08,$0A,$00,$06,$0A,$0E,$53,$04
  db $08,$0A,$01,$06,$05,$02,$54,$01
  db $08,$0A,$05,$0F,$02,$01,$54,$02
  db $08,$0B,$00,$0F,$0D,$01,$54,$03
  db $08,$0B,$03,$0F,$0F,$04,$54,$04
  db $08,$0B,$06,$06,$05,$07,$55,$01
  db $08,$0C,$06,$0C,$01,$00,$55,$02
  db $08,$0D,$02,$08,$0D,$0C,$55,$03
  db $08,$0D,$06,$05,$0F,$06,$55,$04
  db $08,$0D,$06,$09,$0D,$09,$56,$01
  db $08,$0D,$08,$0A,$0F,$09,$56,$02
  db $08,$0D,$0A,$0D,$01,$0C,$56,$03
  db $08,$0D,$0F,$0C,$01,$02,$56,$04
  db $08,$0E,$02,$02,$07,$03,$57,$01
  db $08,$0E,$09,$01,$05,$04,$57,$02
  db $08,$0E,$0A,$03,$09,$0C,$57,$03
  db $08,$0F,$0E,$01,$00,$0B,$57,$04
  db $09,$00,$00,$07,$01,$05,$58,$01
  db $09,$00,$09,$08,$0A,$00,$58,$02
  db $09,$01,$07,$0E,$0F,$03,$58,$03
  db $09,$02,$06,$02,$03,$01,$58,$04
  db $09,$02,$0E,$0D,$00,$0B,$59,$01
  db $09,$03,$04,$0C,$0D,$08,$59,$02
  db $09,$03,$05,$0E,$08,$0D,$59,$03
  db $09,$03,$0C,$08,$0A,$05,$59,$04
  db $09,$04,$01,$08,$08,$02,$5A,$01
  db $09,$04,$01,$0C,$0A,$0F,$5A,$02
  db $09,$04,$0B,$05,$0D,$0B,$5A,$03
  db $09,$04,$0B,$0C,$0C,$00,$5A,$04
  db $09,$04,$0D,$03,$0F,$08,$5B,$01
  db $09,$04,$0E,$0F,$06,$0E,$5B,$02
  db $09,$05,$08,$03,$0C,$0B,$5B,$03
  db $09,$05,$0D,$03,$06,$0B,$5B,$04
  db $09,$07,$0F,$07,$06,$06,$5C,$01
  db $09,$08,$01,$06,$00,$00,$5C,$02
  db $09,$08,$01,$0C,$0E,$04,$5C,$03
  db $09,$08,$06,$02,$04,$05,$5C,$04
  db $09,$08,$0D,$02,$04,$07,$5D,$01
  db $09,$09,$02,$06,$0F,$0C,$5D,$02
  db $09,$09,$08,$0E,$0E,$05,$5D,$03
  db $09,$09,$0D,$07,$0E,$02,$5D,$04
  db $09,$0B,$05,$06,$0F,$07,$5E,$01
  db $09,$0B,$05,$0B,$07,$0A,$5E,$02
  db $09,$0B,$07,$07,$02,$08,$5E,$03
  db $09,$0B,$09,$0F,$0B,$05,$5E,$04
  db $09,$0B,$0B,$01,$09,$03,$5F,$01
  db $09,$0B,$0D,$0F,$08,$06,$5F,$02
  db $09,$0B,$0F,$02,$09,$07,$5F,$03
  db $09,$0C,$00,$0D,$0E,$01,$5F,$04
  db $09,$0C,$01,$04,$0A,$02,$60,$01
  db $09,$0C,$04,$08,$01,$0F,$60,$02
  db $09,$0D,$02,$0F,$09,$05,$60,$03
  db $09,$0D,$09,$00,$00,$0D,$60,$04
  db $09,$0E,$01,$0A,$04,$0F,$61,$01
  db $09,$0E,$05,$01,$07,$0A,$61,$02
  db $09,$0F,$04,$0E,$05,$05,$61,$03
  db $0A,$00,$05,$0D,$03,$0E,$61,$04
  db $0A,$01,$00,$01,$07,$0B,$62,$01
  db $0A,$02,$03,$05,$06,$0F,$62,$02
  db $0A,$02,$0A,$0B,$0A,$05,$62,$03
  db $0A,$02,$0C,$0F,$07,$00,$62,$04
  db $0A,$02,$0E,$0A,$03,$0D,$63,$01
  db $0A,$03,$06,$01,$0A,$0B,$63,$02
  db $0A,$03,$0C,$0D,$00,$08,$63,$03
  db $0A,$04,$04,$03,$07,$0A,$63,$04
  db $0A,$05,$01,$04,$05,$0F,$64,$01
  db $0A,$05,$0C,$02,$0D,$00,$64,$02
  db $0A,$05,$0E,$0F,$05,$02,$64,$03
  db $0A,$05,$0F,$0C,$05,$06,$64,$04
  db $0A,$06,$06,$0A,$0C,$05,$65,$01
  db $0A,$07,$0A,$02,$02,$04,$65,$02
  db $0A,$07,$0A,$05,$0D,$06,$65,$03
  db $0A,$07,$0B,$09,$00,$08,$65,$04
  db $0A,$08,$02,$0E,$0D,$0B,$66,$01
  db $0A,$08,$08,$09,$06,$03,$66,$02
  db $0A,$08,$09,$04,$06,$01,$66,$03
  db $0A,$09,$07,$05,$02,$0B,$66,$04
  db $0A,$09,$07,$0F,$0A,$03,$67,$01
  db $0A,$09,$08,$07,$00,$00,$67,$02
  db $0A,$0A,$09,$0C,$04,$07,$67,$03
  db $0A,$0B,$02,$03,$03,$04,$67,$04
  db $0A,$0B,$02,$0F,$01,$07,$68,$01
  db $0A,$0B,$0A,$0A,$08,$0A,$68,$02
  db $0A,$0B,$0E,$00,$03,$0E,$68,$03
  db $0A,$0C,$07,$0C,$0A,$0B,$68,$04
  db $0A,$0C,$0D,$01,$08,$07,$69,$01
  db $0A,$0E,$08,$0D,$04,$09,$69,$02
  db $0A,$0E,$09,$0A,$0C,$02,$69,$03
  db $0A,$0E,$0A,$09,$0D,$09,$69,$04
  db $0A,$0E,$0C,$04,$01,$06,$6A,$01
  db $0A,$0E,$0C,$09,$0B,$03,$6A,$02
  db $0A,$0F,$01,$08,$03,$0F,$6A,$03
  db $0A,$0F,$0A,$02,$08,$07,$6A,$04
  db $0A,$0F,$0E,$0B,$0C,$0D,$6B,$01
  db $0A,$0F,$0E,$0F,$0A,$05,$6B,$02
  db $0B,$00,$04,$04,$0A,$05,$6B,$03
  db $0B,$00,$06,$06,$0C,$0A,$6B,$04
  db $0B,$00,$0E,$07,$06,$04,$6C,$01
  db $0B,$01,$08,$02,$0D,$00,$6C,$02
  db $0B,$02,$01,$0F,$06,$0B,$6C,$03
  db $0B,$02,$0A,$08,$03,$00,$6C,$04
  db $0B,$02,$0F,$0C,$0C,$00,$6D,$01
  db $0B,$03,$00,$03,$09,$00,$6D,$02
  db $0B,$03,$03,$03,$0B,$0F,$6D,$03
  db $0B,$04,$03,$0D,$0A,$01,$6D,$04
  db $0B,$04,$05,$04,$03,$00,$6E,$01
  db $0B,$05,$05,$0C,$0F,$0F,$6E,$02
  db $0B,$05,$0E,$0A,$00,$05,$6E,$03
  db $0B,$06,$04,$07,$02,$08,$6E,$04
  db $0B,$06,$0B,$0E,$0D,$05,$6F,$01
  db $0B,$06,$0C,$03,$01,$0E,$6F,$02
  db $0B,$07,$00,$0B,$05,$05,$6F,$03
  db $0B,$07,$05,$08,$07,$0D,$6F,$04
  db $0B,$07,$07,$0F,$0F,$0B,$70,$01
  db $0B,$08,$04,$07,$0B,$02,$70,$02
  db $0B,$08,$0D,$0E,$09,$0F,$70,$03
  db $0B,$08,$0E,$0B,$03,$0B,$70,$04
  db $0B,$0A,$02,$0F,$0B,$0D,$71,$01
  db $0B,$0A,$05,$09,$09,$01,$71,$02
  db $0B,$0A,$08,$05,$02,$0F,$71,$03
  db $0B,$0B,$02,$06,$05,$01,$71,$04
  db $0B,$0B,$0B,$0D,$0D,$07,$72,$01
  db $0B,$0B,$0C,$02,$04,$0A,$72,$02
  db $0B,$0C,$02,$05,$06,$03,$72,$03
  db $0B,$0C,$08,$0C,$05,$0E,$72,$04
  db $0B,$0C,$0A,$09,$05,$0C,$73,$01
  db $0B,$0C,$0A,$0F,$01,$05,$73,$02
  db $0B,$0D,$07,$02,$07,$0F,$73,$03
  db $0B,$0D,$08,$00,$09,$0E,$73,$04
  db $0B,$0D,$0F,$0C,$0A,$0D,$74,$01
  db $0B,$0E,$01,$00,$05,$05,$74,$02
  db $0B,$0E,$05,$02,$09,$0D,$74,$03
  db $0B,$0E,$0D,$0D,$05,$02,$74,$04
  db $0C,$00,$03,$08,$0A,$02,$75,$01
  db $0C,$00,$07,$0E,$0C,$0F,$75,$02
  db $0C,$01,$05,$09,$00,$0B,$75,$03
  db $0C,$02,$07,$0E,$0F,$08,$75,$04
  db $0C,$02,$0B,$0D,$05,$0D,$76,$01
  db $0C,$03,$0E,$0D,$04,$03,$76,$02
  db $0C,$05,$07,$02,$00,$0E,$76,$03
  db $0C,$05,$08,$03,$0E,$07,$76,$04
  db $0C,$05,$0D,$02,$0E,$08,$77,$01
  db $0C,$05,$0F,$01,$07,$09,$77,$02
  db $0C,$06,$01,$05,$04,$03,$77,$03
  db $0C,$06,$07,$01,$03,$00,$77,$04
  db $0C,$06,$0E,$04,$0C,$0D,$78,$01
  db $0C,$08,$06,$02,$0E,$04,$78,$02
  db $0C,$09,$01,$05,$0E,$00,$78,$03
  db $0C,$09,$05,$08,$09,$05,$78,$04
  db $0C,$0A,$01,$0F,$03,$09,$79,$01
  db $0C,$0A,$04,$0B,$0C,$0E,$79,$02
  db $0C,$0A,$0D,$0E,$02,$04,$79,$03
  db $0C,$0A,$0D,$0F,$0B,$01,$79,$04
  db $0C,$0B,$08,$0F,$0E,$01,$7A,$01
  db $0C,$0C,$01,$0B,$09,$01,$7A,$02
  db $0C,$0C,$05,$0D,$06,$05,$7A,$03
  db $0C,$0C,$08,$03,$0B,$00,$7A,$04
  db $0C,$0C,$09,$0F,$05,$05,$7B,$01
  db $0C,$0C,$0C,$08,$03,$04,$7B,$02
  db $0C,$0C,$0D,$07,$03,$0A,$7B,$03
  db $0C,$0E,$03,$0E,$0F,$04,$7B,$04
  db $0C,$0E,$0B,$04,$01,$01,$7C,$01
  db $0C,$0F,$08,$08,$0C,$08,$7C,$02
  db $0D,$01,$03,$0F,$08,$0F,$7C,$03
  db $0D,$01,$08,$03,$00,$09,$7C,$04
  db $0D,$01,$0E,$04,$0D,$04,$7D,$01
  db $0D,$02,$01,$08,$07,$0C,$7D,$02
  db $0D,$03,$00,$09,$09,$07,$7D,$03
  db $0D,$03,$05,$0C,$0F,$0F,$7D,$04
  db $0D,$04,$0C,$02,$00,$0F,$7E,$01
  db $0D,$04,$0D,$0A,$09,$0A,$7E,$02
  db $0D,$05,$00,$0B,$09,$0F,$7E,$03
  db $0D,$05,$02,$0B,$04,$0E,$7E,$04
  db $0D,$05,$03,$09,$00,$07,$7F,$01
  db $0D,$05,$06,$0D,$01,$0A,$7F,$02
  db $0D,$06,$03,$0C,$08,$0B,$7F,$03
  db $0D,$06,$08,$00,$0B,$0B,$7F,$04
  db $0D,$06,$0E,$04,$02,$06,$80,$01
  db $0D,$07,$07,$00,$01,$04,$80,$02
  db $0D,$07,$08,$0E,$0A,$09,$80,$03
  db $0D,$09,$05,$06,$01,$09,$80,$04
  db $0D,$09,$0C,$00,$03,$0F,$81,$01
  db $0D,$0A,$03,$00,$00,$0C,$81,$02
  db $0D,$0A,$05,$06,$06,$00,$81,$03
  db $0D,$0A,$07,$0D,$07,$06,$81,$04
  db $0D,$0A,$0C,$0A,$0A,$09,$82,$01
  db $0D,$0B,$08,$09,$06,$08,$82,$02
  db $0D,$0C,$06,$0F,$02,$0A,$82,$03
  db $0D,$0D,$06,$02,$09,$0D,$82,$04
  db $0D,$0E,$03,$0D,$0E,$0D,$83,$01
  db $0D,$0E,$06,$0B,$08,$0F,$83,$02
  db $0D,$0E,$0B,$0A,$0C,$0F,$83,$03
  db $0D,$0E,$0E,$09,$02,$08,$83,$04
  db $0D,$0F,$05,$0E,$05,$04,$84,$01
  db $0D,$0F,$0C,$01,$0A,$05,$84,$02
  db $0E,$00,$00,$0D,$01,$0C,$84,$03
  db $0E,$00,$01,$0B,$0B,$02,$84,$04
  db $0E,$00,$02,$01,$05,$05,$85,$01
  db $0E,$00,$0D,$01,$04,$01,$85,$02
  db $0E,$01,$01,$0A,$07,$06,$85,$03
  db $0E,$01,$0D,$08,$03,$06,$85,$04
  db $0E,$02,$03,$03,$01,$00,$86,$01
  db $0E,$02,$0A,$00,$04,$07,$86,$02
  db $0E,$02,$0E,$00,$02,$0D,$86,$03
  db $0E,$03,$01,$0C,$0B,$08,$86,$04
  db $0E,$03,$05,$0A,$07,$0C,$87,$01
  db $0E,$03,$08,$08,$00,$0E,$87,$02
  db $0E,$03,$0A,$0F,$04,$04,$87,$03
  db $0E,$06,$02,$06,$05,$0F,$87,$04
  db $0E,$06,$07,$01,$0F,$02,$88,$01
  db $0E,$06,$09,$02,$04,$08,$88,$02
  db $0E,$06,$0C,$0E,$06,$01,$88,$03
  db $0E,$06,$0D,$00,$08,$0B,$88,$04
  db $0E,$07,$0C,$04,$05,$0F,$89,$01
  db $0E,$08,$04,$0B,$0C,$0A,$89,$02
  db $0E,$08,$08,$04,$06,$09,$89,$03
  db $0E,$08,$0E,$09,$0D,$0A,$89,$04
  db $0E,$09,$05,$0D,$0C,$0C,$8A,$01
  db $0E,$09,$08,$0E,$09,$02,$8A,$02
  db $0E,$09,$09,$07,$05,$0D,$8A,$03
  db $0E,$0A,$00,$03,$03,$0C,$8A,$04
  db $0E,$0A,$05,$09,$09,$0B,$8B,$01
  db $0E,$0A,$09,$05,$03,$02,$8B,$02
  db $0E,$0B,$02,$04,$04,$0F,$8B,$03
  db $0E,$0C,$00,$08,$08,$0D,$8B,$04
  db $0E,$0C,$0C,$06,$06,$00,$8C,$01
  db $0E,$0D,$01,$08,$09,$00,$8C,$02
  db $0E,$0D,$04,$0C,$04,$0B,$8C,$03
  db $0E,$0E,$0A,$0B,$00,$07,$8C,$04
  db $0E,$0F,$09,$04,$00,$00,$8D,$01
  db $0E,$0F,$0D,$09,$04,$0A,$8D,$02
  db $0F,$00,$0A,$0C,$0E,$08,$8D,$03
  db $0F,$00,$0E,$0F,$0C,$09,$8D,$04
  db $0F,$00,$0F,$08,$07,$0B,$8E,$01
  db $0F,$01,$01,$01,$06,$00,$8E,$02
  db $0F,$01,$02,$05,$01,$08,$8E,$03
  db $0F,$01,$0C,$05,$0F,$08,$8E,$04
  db $0F,$02,$01,$0A,$0B,$05,$8F,$01
  db $0F,$02,$02,$00,$05,$0F,$8F,$02
  db $0F,$02,$0E,$04,$00,$08,$8F,$03
  db $0F,$02,$0E,$06,$02,$0C,$8F,$04
  db $0F,$03,$05,$03,$0F,$0B,$90,$01
  db $0F,$03,$0C,$0D,$08,$09,$90,$02
  db $0F,$04,$05,$0B,$0C,$0E,$90,$03
  db $0F,$04,$0F,$00,$05,$00,$90,$04
  db $0F,$04,$0F,$06,$01,$0F,$91,$01
  db $0F,$05,$08,$00,$05,$02,$91,$02
  db $0F,$05,$0B,$01,$00,$06,$91,$03
  db $0F,$06,$0A,$03,$05,$02,$91,$04
  db $0F,$06,$0C,$08,$03,$01,$92,$01
  db $0F,$06,$0E,$07,$09,$0C,$92,$02
  db $0F,$06,$0E,$0F,$0D,$04,$92,$03
  db $0F,$07,$01,$0C,$08,$08,$92,$04
  db $0F,$07,$02,$04,$05,$09,$93,$01
  db $0F,$07,$09,$0D,$03,$09,$93,$02
  db $0F,$09,$0A,$0E,$0E,$01,$93,$03
  db $0F,$0A,$00,$0A,$0C,$09,$93,$04
  db $0F,$0A,$02,$07,$01,$05,$94,$01
  db $0F,$0A,$08,$09,$0B,$02,$94,$02
  db $0F,$0A,$08,$0F,$08,$05,$94,$03
  db $0F,$0A,$0F,$00,$03,$08,$94,$04
  db $0F,$0A,$0F,$03,$01,$06,$95,$01
  db $0F,$0C,$07,$00,$03,$0E,$95,$02
  db $0F,$0C,$09,$02,$08,$06,$95,$03
  db $0F,$0C,$0B,$0E,$0D,$05,$95,$04
  db $0F,$0D,$01,$04,$08,$09,$96,$01
  db $0F,$0D,$07,$02,$07,$05,$96,$02
  db $0F,$0D,$0F,$05,$01,$0B,$96,$03
  db $0F,$0E,$06,$03,$0D,$02,$96,$04
  db $0F,$0E,$0E,$0A,$0B,$01,$97,$01
  db $0F,$0F,$04,$0F,$0B,$09,$97,$02
  db $0F,$0F,$07,$0B,$06,$08,$97,$03
  db $0F,$0F,$09,$04,$06,$08,$97,$04
  db $FF,$FF,$FF,$FF,$FF,$FF

Shop0Stock::
  db $5B,$FF,$FF,$FF
  db $5B,$5C,$FF,$FF
  db $5B,$5C,$3E,$FF
  db $5B,$5C,$3E,$3F

Shop1Stock::
  db $68,$FF,$FF,$FF
  db $68,$6C,$FF,$FF
  db $68,$6C,$70,$FF
  db $68,$6C,$70,$FF

Shop2Stock::
  db $69,$FF,$FF,$FF
  db $69,$6D,$FF,$FF
  db $69,$6D,$FF,$FF
  db $69,$6D,$FF,$FF

Shop3Stock::
  db $6A,$FF,$FF,$FF
  db $6A,$6F,$FF,$FF
  db $6A,$6F,$FF,$FF
  db $6A,$6F,$FF,$FF

Shop4Stock::
  db $22,$FF,$FF,$FF
  db $22,$23,$FF,$FF
  db $22,$23,$24,$FF
  db $22,$23,$24,$26

Shop5Stock::
  db $82,$FF,$FF,$FF
  db $82,$84,$FF,$FF
  db $82,$84,$86,$FF
  db $82,$84,$86,$88

Shop6Stock::
  db $83,$FF,$FF,$FF
  db $83,$85,$FF,$FF
  db $83,$85,$87,$FF
  db $83,$85,$87,$89

Shop7Stock::
  db $04,$FF,$FF,$FF
  db $04,$05,$FF,$FF
  db $04,$05,$06,$FF
  db $04,$05,$06,$07

Shop8Stock::
  db $7A,$FF,$FF,$FF
  db $7A,$7B,$FF,$FF
  db $7A,$7B,$7C,$FF
  db $7A,$7B,$7C,$7D

Shop9Stock::
  db $7E,$FF,$FF,$FF
  db $7E,$7F,$FF,$FF
  db $7E,$7F,$8E,$FF
  db $7E,$7F,$8E,$8D

Shop10Stock::
  db $8B,$FF,$FF,$FF
  db $8B,$8C,$FF,$FF
  db $8B,$8C,$08,$FF
  db $8B,$8C,$08,$27

  padend $70a4

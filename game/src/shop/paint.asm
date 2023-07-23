INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Paint Shop Helper Functions 1", ROMX[$6090], BANK[$16]
GetCurrentMedalAndTypeForPaintShopMedarotStatusScreen::
  xor a
  ld [W_MedarotStatusSelectedOption], a
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForPaintShopSelectionScreen
  ld hl, M_MedarotType
  add hl, de
  ld a, [hl]
  ld [W_MedarotStatusTinpetType], a
  ld hl, 2
  add hl, de
  ld a, [hl]
  call PaintShopGetMedalAddressForCurrentMedarot
  ld a, b
  ld [W_MedarotCurrentMedal], a
  ret

SECTION "Paint Shop Helper Functions 2", ROMX[$6101], BANK[$16]
PaintShopDeductMedarotEquipmentFromInventoryForStatus::
  ; This function is unused.
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForPaintShopSelectionScreen
  ld hl, M_MedarotEquipState
  add hl, de
  ld [hl], M_MedarotType
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  cp $1E
  jr z, .noMedal
  call PaintShopGetMedalAddressForCurrentMedarot
  ld hl, M_MedarotEquipState
  add hl, de
  ld a, [hl]
  and $BF
  ld [hl], a

.noMedal
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, .noHeadPart
  ld hl, $D000
  ld a, [W_MedarotCurrentHeadPart]
  call .deductPartFromInventory

.noHeadPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr nc, .noLeftArmPart
  ld hl, $D12E
  ld a, [W_MedarotCurrentLeftArmPart]
  call .deductPartFromInventory

.noLeftArmPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr nc, .noRightArmPart
  ld hl, $D25C
  ld a, [W_MedarotCurrentRightArmPart]
  call .deductPartFromInventory

.noRightArmPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  ret nc
  ld hl, $D38A
  ld a, [W_MedarotCurrentLegPart]
  jp .deductPartFromInventory

.deductPartFromInventory
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  inc hl
  dec [hl]
  ret

MedarotPaintShopSelectionScreenEmptySlotCheck::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForPaintShopSelectionScreen
  ld a, [de]
  or a
  jr z, PaintShopMedarotsPlayBzztSound
  ld a, 3
  call ScheduleSoundEffect
  ld a, 1
  ret

PaintShopMedarotsPlayBzztSound::
  ld a, 5
  call ScheduleSoundEffect
  xor a
  ret

PaintShopMedarotActionViabilityCheck::
  ld a, [W_ShopPasswordSelectionXAxis]
  cp 0
  ret z
  ld a, [W_MedarotCurrentPalette]
  cp 0
  jr z, .medarotHasDefaultPalette
  xor a
  ret

.medarotHasDefaultPalette
  ld a, 5
  call ScheduleSoundEffect
  ld a, 1
  ret

PaintShopGetPaletteIndexForSelectedMedarot::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForPaintShopSelectionScreen
  ld a, [de]
  or a
  jr z, .emptySlot
  ld a, [W_MedarotCurrentPalette]
  or a
  jr nz, .useDefinedPalette

.useHeadPartPalette
  ld a, [W_MedarotCurrentHeadPart]
  ld b, 0
  ld c, a
  ld hl, $40
  add hl, bc
  ld b, h
  ld c, l
  ret

.useDefinedPalette
  dec a
  ld b, 0
  ld c, a
  ld hl, $370
  add hl, bc
  ld b, h
  ld c, l
  ret

.emptySlot
  ld bc, $40
  ret

AnimatedSelectedMedarotSpriteForPaintShopSelectionScreen::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call PaintShopGetSelectedMedarotMetaspriteAddress
  jp $33B7

PaintShopDrawCurrentMedarot::
  push bc
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForPaintShopSelectionScreen
  ld a, [de]
  or a
  jr nz, .slotNotEmpty
  pop bc
  ld e, 7
  ld a, 0
  jp WrapDecompressTilemap0

.slotNotEmpty
  ld hl, M_MedarotHead
  add hl, de
  ld a, [hli]
  ld [W_MedarotCurrentHeadPart], a
  ld a, [hli]
  ld [W_MedarotCurrentLeftArmPart], a
  ld a, [hli]
  ld [W_MedarotCurrentRightArmPart], a
  ld a, [hli]
  ld [W_MedarotCurrentLegPart], a
  ld hl, M_MedarotPalette
  add hl, de
  ld a, [hl]
  ld [W_MedarotCurrentPalette], a
  call $34F5
  ld de, $8800
  call $34FA
  pop bc
  ld e, 3
  ld a, 0
  jp WrapDecompressTilemap0

GetMedarotSlotAddressForPaintShopSelectionScreen::
  ld c, a
  ld a, 5
  rst 8
  ld hl, $D000
  ld b, 0
  ld a, 4
  jp MultiplyBCByTwoToThePowerOfAAndAddToHL

MapCurrentMedarotNameForPaintShopSelectionScreen::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  push bc
  call GetMedarotSlotAddressForPaintShopSelectionScreen
  pop bc
  ld a, [de]
  cp 2
  jr nc, .hasName
  call OffsetToMappingAddressForPaintShopMedarotScreens
  ld b, 8
  jp PaintShopMedarotsMapDashes

.hasName
  call OffsetToMappingAddressForPaintShopMedarotScreens
  push hl
  ld b, 8
  ld c, 1
  push de
  call $25E5
  pop de
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  call PaintShopGetMedalAddressForCurrentMedarot
  ld hl, M_MedalNickname
  add hl, de
  ld b, h
  ld c, l
  ; bc = Medarot name
  pop de ; de = address to draw to
  ld h, $29 ; h = tile index 
  jp VWFDrawStringCentredFullAddress8Tiles

PaintShopGetMedalAddressForCurrentMedarot::
  ld c, a
  ld b, 0
  ld de, $D120

.loop
  ld a, [de]
  and $80
  jr z, .nextMedalSlot
  ld hl, M_MedalType
  add hl, de
  ld a, [hl]
  cp c
  ret z

.nextMedalSlot
  ld hl, M_MedalSlotLength
  add hl, de
  ld d, h
  ld e, l
  inc b
  ld a, b
  cp $1E
  jr nz, .loop
  ret

PaintShopMedarotsMapDashes::
  push de
  push hl

.loop
  ld a, $EE
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

OffsetToMappingAddressForPaintShopMedarotScreens::
  ld h, 0
  ld l, c
  sla l
  rl h
  sla l
  rl h
  sla l
  rl h
  sla l
  rl h
  sla l
  rl h
  ld c, b
  ld b, 0
  add hl, bc
  ld bc, $9800
  add hl, bc
  ret

  padend $62be

SECTION "Paint Shop Helper Functions 3", ROMX[$649A], BANK[$16]
PrintCurrentPaintNumber::
  ld a, [W_ShopPasswordSelectionYAxis]
  inc a
  ld hl, $9966
  ld b, 0
  call $3504
  ret

SECTION "Paint Shop Helper Functions 4", ROMX[$64F6], BANK[$16]
PaintShopDisplayMedarotSelectorArrow::
  call PaintShopPlaceMedarotSelectorArrow
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

PaintShopPlaceMedarotSelectorArrow::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  ld a, 7
  ld [$C0C5], a
  ld hl, .table
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$C0C3], a
  ld a, [hl]
  ld [$C0C4], a
  ret

.table
  db $0E, $1A
  db $0D, $30
  db $0C, $46
  db $24, $1A
  db $24, $30
  db $24, $46
  db $3A, $1A
  db $3B, $30
  db $3C, $46

MedarotPaintShopSelectionScreenDirectionalInputHandler::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  jr nz, .directionalButtonPressed
  call .noDirectionalInput
  ret

.directionalButtonPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call PaintShopGetSelectedMedarotMetaspriteAddress
  call PaintShopCancelMedarotSpriteAnimation
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld hl, .upPressTable
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, 2
  call ScheduleSoundEffect
  ld a, 8
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call PaintShopGetSelectedMedarotMetaspriteAddress
  call PaintShopCancelMedarotSpriteAnimation
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld hl, .downPressTable
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, 2
  call ScheduleSoundEffect
  ld a, 8
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret

.downNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call PaintShopGetSelectedMedarotMetaspriteAddress
  call PaintShopCancelMedarotSpriteAnimation
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld hl, .leftPressTable
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, 2
  call ScheduleSoundEffect
  ld a, 8
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call PaintShopGetSelectedMedarotMetaspriteAddress
  call PaintShopCancelMedarotSpriteAnimation
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld hl, .rightPressTable
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, 2
  call ScheduleSoundEffect
  ld a, 8
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret

.upPressTable
  db 2,0,1,5,3,4,8,6,7

.downPressTable
  db 1,2,0,4,5,3,7,8,6

.leftPressTable
  db 6,7,8,0,1,2,3,4,5

.rightPressTable
  db 3,4,5,6,7,8,0,1,2

.noDirectionalInput
  ld a, [W_MedarotSelectionDirectionalInputWaitTimer]
  cp $80
  ret z
  ld a, [W_MedarotSelectionDirectionalInputWaitTimer]
  dec a
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret nz
  ld bc, $A01
  call PaintShopDrawCurrentMedarot
  ld bc, $B0B
  call MapCurrentMedarotNameForPaintShopSelectionScreen
  call PaintShopUpdateSelectedMedarotPalette
  ld a, $80
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret

PaintShopUpdateSelectedMedarotPalette::
  call PaintShopGetPaletteIndexForSelectedMedarot
  ld a, 3
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ret

PaintShopCancelMedarotSpriteAnimation::
  ld hl, 9
  add hl, de
  ld a, [hl]
  ld b, 0
  jp $33B2

PaintShopGetSelectedMedarotMetaspriteAddress::
  ld hl, $C1E0
  ld b, 0
  ld c, a
  ld a, 5
  jp MultiplyBCByTwoToThePowerOfAAndAddToHL

PaintShopMedarotsSelectionScreenDisplayMedarotSprites::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 5
  rst 8
  ld de, $D000
  xor a
  ld [$C4F4], a

.loop
  ld a, [de]
  or a
  jr nz, .slotNotEmpty
  call $66A0 ; .displayEmptySlot
  jr .nextMedarotSlot

.slotNotEmpty
  cp 3
  jr z, .slotMedarotFullyEquipped
  call $66E0 ; .displayUnequippedTinpetSlot
  jr .nextMedarotSlot

.slotMedarotFullyEquipped
  call $6721 ; .displayEquippedMedarotSlot

.nextMedarotSlot
  ld hl, M_MedarotSlotLength
  add hl, de
  ld d, h
  ld e, l
  ld a, [$C4F4]
  inc a
  ld [$C4F4], a
  cp 9
  jr nz, .loop
  ret

.spritePositionTable
  db $0A, $24
  db $09, $3A
  db $08, $50
  db $20, $24
  db $20, $3A
  db $20, $50
  db $36, $24
  db $37, $3A
  db $38, $50

.displayEmptySlot
  push de
  ld de, $C1E0
  ld b, 9
  call $3423
  ld a, $11
  ld [de], a
  ld hl, 1
  add hl, de
  ld [hl], $44
  call .getMedarotSpritePosition
  ld hl, 3
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld a, 0
  ld b, 0
  call $33B2
  ld hl, 5
  add hl, de
  ld a, 4
  ld [hl], a
  pop de
  ret

.getMedarotSpritePosition
  ld a, [$C4F4]
  ld hl, .spritePositionTable
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld b, a
  ld a, [hl]
  ld c, a
  ret

.displayUnequippedTinpetSlot
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld [$C4EE], a
  push de
  ld de, $C1E0
  ld b, 9
  call $3423
  ld a, $11
  ld [de], a
  ld hl, 1
  add hl, de
  ld [hl], $44
  call .getMedarotSpritePosition
  ld hl, 3
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld hl, 5
  add hl, de
  ld a, 1
  ld [hl], a
  ld a, [$C4EE]
  or a
  jr z, .useBluePalette
  ld a, 5
  ld [hl], a

.useBluePalette
  ld a, [$C4EE]
  add 1
  ld b, 0
  call $33B2
  pop de
  ret

.displayEquippedMedarotSlot
  ld hl, 6
  add hl, de
  ld a, [hl]
  push de
  ld [W_ListItemIndexForBuffering], a
  ld a, 3
  call $34FF
  ld de, $C1E0
  ld b, 9
  call $3423
  ld a, $11
  ld [de], a
  ld hl, 1
  add hl, de
  ld [hl], $44
  call .getMedarotSpritePosition
  ld hl, 3
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld a, [$C553]
  sub $50
  sla a
  add 3
  ld b, 0
  call $33B2
  ld a, [$C553]
  sub $50
  add $2D
  call $34B7
  ld hl, 5
  add hl, de
  ld [hl], a
  pop de
  ret

SECTION "Paint Shop Helper Functions 5", ROMX[$6838], BANK[$16]
PaintShopPlayerHasPaintedMedarots::
  ld a, 5
  rst 8
  ld hl, $D000
  ld de, M_MedarotPalette
  add hl, de
  ld d, 0
  ld b, 9

.mathLoop
  push bc
  ld a, [hl]
  add d
  ld d, a
  ld bc, $10
  add hl, bc
  pop bc
  dec b
  jp nz, .mathLoop

  ld a, d
  ret

SECTION "Paint Shop Helper Functions 6", ROMX[$69FE], BANK[$16]
PaintShopMapMoney::
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

PaintShopIsPaintJobUnaffordable::
  ld a, [W_PlayerMoolah]
  cp 0
  jr c, .thisIsStupid ; This condition is impossible to meet.
  jr z, .highByteIsEmpty

.affordable
  xor a
  ret

.highByteIsEmpty
  ld a, [W_PlayerMoolah + 1]
  cp $A
  jr c, .unaffordable
  jr z, .affordableWrapper
  jr .affordable

.unaffordable
  call WrapInitiateMainScript
  ld a, 1
  ret

.affordableWrapper
  jr .affordable

.thisIsStupid
  ld a, [W_PlayerMoolah + 1]
  cp $A
  jr c, .unaffordableStupidEdition
  jr z, .affordableStupidEdition

.affordableStupidEdition
  xor a
  ret

.unaffordableStupidEdition
  call WrapInitiateMainScript
  ld a, 1
  ret

PaintShopUpdateMainMenuCursorPosition::
  ld a, [W_ShopBuyMenuSelection]
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C0E4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.unusedTable
  db $10,$20,$30,$40,$50,$60,$70,$80

.table
  db $10,$20,$30,$40

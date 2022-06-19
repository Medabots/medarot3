INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

W_MedarotMedachangeStatMathBuffer EQU $C48A

SECTION "Medarot Variables 1",  WRAM0[$C525]
W_MedarotCurrentHeadPart:: ds 1
W_MedarotCurrentLeftArmPart:: ds 1
W_MedarotCurrentRightArmPart:: ds 1
W_MedarotCurrentLegPart:: ds 1
W_MedarotCurrentMedal:: ds 1
W_MedarotCurrentPalette:: ds 1

SECTION "Medarot Variables 2",  WRAM0[$C583]
W_MedarotSelectionScreenSelectedOption:: ds 1
W_MedarotSelectionScreenSortItem:: ds 1
W_MedarotStatusSelectedOption:: ds 1
W_MedarotStatusTinpetType:: ds 1

SECTION "Medarot Variables 3",  WRAM0[$C592]
W_MedarotSelectionDirectionalInputWaitTimer:: ds 1
W_MedarotMedachange:: ds 1

SECTION "Medarot Variables 4",  WRAM0[$C596]
W_MedarotBattleSelectionCurrentSelectionOffset:: ds 1

SECTION "Medarot Helper Functions 1", ROMX[$46FF], BANK[$07]
MedarotsSelectionScreenDisplayMedarotSprites::
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
  call .displayEmptySlot
  jr .nextMedarotSlot

.slotNotEmpty
  cp 3
  jr z, .slotMedarotFullyEquipped
  call .displayUnequippedTinpetSlot
  jr .nextMedarotSlot

.slotMedarotFullyEquipped
  call .displayEquippedMedarotSlot

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

DrawCurrentMedarot::
  push bc
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
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

GetMedarotSlotAddressForSelectionScreen::
  ld c, a
  ld a, 5
  rst 8
  ld hl, $D000
  ld b, 0
  ld a, 4
  jp MultiplyBCByTwoToThePowerOfAAndAddToHL

GetPaletteIndexForSelectedMedarot::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
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

UpdateSelectedMedarotPalette::
  call GetPaletteIndexForSelectedMedarot
  ld a, 3
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ret

MapCurrentMedarotNameForSelectionScreen::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  push bc
  call GetMedarotSlotAddressForSelectionScreen
  pop bc
  ld a, [de]
  cp 2
  jr nc, .hasName
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

.hasName
  call OffsetToMappingAddressForMedarotScreens
  push hl
  ld bc, $0801
  push de
  call $25E5
  pop de
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  call GetMedalAddressForCurrentMedarot
  ld hl, M_MedalNickname
  add hl, de
  ld b, h
  ld c, l
  pop de ; hl -> de
  ld h, $78
  jp VWFDrawStringCentredFullAddress8Tiles
  padend $48de

OffsetToMappingAddressForMedarotScreens::
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

GetMedalAddressForCurrentMedarot::
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

DisplayMedarotSelectorArrow::
  call PlaceMedarotSelectorArrow
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

PlaceMedarotSelectorArrow::
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

AnimatedSelectedMedarotSpriteForSelectionScreen::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetSelectedMedarotMetaspriteAddress
  jp $33B7

GetSelectedMedarotMetaspriteAddress::
  ld hl, $C1E0
  ld b, 0
  ld c, a
  ld a, 5
  jp MultiplyBCByTwoToThePowerOfAAndAddToHL

MedarotSelectionScreenDirectionalInputHandler::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  jr nz, .directionalButtonPressed
  jp .noDirectionalInput

.directionalButtonPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetSelectedMedarotMetaspriteAddress
  call CancelMedarotSpriteAnimation
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
  call GetSelectedMedarotMetaspriteAddress
  call CancelMedarotSpriteAnimation
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
  call GetSelectedMedarotMetaspriteAddress
  call CancelMedarotSpriteAnimation
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
  call GetSelectedMedarotMetaspriteAddress
  call CancelMedarotSpriteAnimation
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
  call DrawCurrentMedarot
  ld bc, $B0B
  call MapCurrentMedarotNameForSelectionScreen
  call UpdateSelectedMedarotPalette
  ld a, $80
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  ret

CancelMedarotSpriteAnimation::
  ld hl, 9
  add hl, de
  ld a, [hl]
  ld b, 0
  jp $33B2

MedarotSelectionSortingFlicker::
  ld a, [W_MedarotSelectionScreenSortItem]
  and $80
  ret z
  ld a, [W_MedarotSelectionScreenSortItem]
  and $7F
  call GetSelectedMedarotMetaspriteAddress
  ld a, [de]
  and $FE
  ld [de], a
  ld a, [W_UniversalLoopingTimer]
  and 4
  ret z
  ld a, [de]
  or 1
  ld [de], a
  ret

MedarotSelectionScreenSortingInputHandler::
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_MedarotSelectionScreenSortItem]
  and $80
  jr nz, .doSort

.markForSorting
  ld a, [W_MedarotSelectionScreenSelectedOption]
  or a, $80
  ld [W_MedarotSelectionScreenSortItem], a
  ret

.doSort
  ld a, [W_MedarotSelectionScreenSortItem]
  and $7F
  call GetSelectedMedarotMetaspriteAddress
  ld a, [de]
  or 1
  ld [de], a
  ld hl, 5
  add hl, de
  ld d, h
  ld e, l
  push de
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetSelectedMedarotMetaspriteAddress
  ld a, [de]
  or 1
  ld [de], a
  ld hl, 5
  add hl, de
  pop de
  ld bc, 9
  call $1546
  ld a, [W_MedarotSelectionScreenSortItem]
  and $7F
  call GetSelectedMedarotMetaspriteAddress
  call CancelMedarotSpriteAnimation
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetSelectedMedarotMetaspriteAddress
  call CancelMedarotSpriteAnimation
  ld a, [W_MedarotSelectionScreenSortItem]
  and $7F
  call GetMedarotSlotAddressForSelectionScreen
  push de
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  pop de
  ld bc, $10
  call $1546
  xor a
  ld [W_MedarotSelectionScreenSortItem], a
  ld bc, $A01
  call DrawCurrentMedarot
  ld bc, $B0B
  call MapCurrentMedarotNameForSelectionScreen
  call UpdateSelectedMedarotPalette
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

CheckForBattleReadyMedarots::
  ld a, 5
  rst 8
  ld hl, $D000
  ld b, 9

.loop
  ld a, [hl]
  cp 3
  jr z, .fullyEquippedMedarotFound
  ld de, M_MedarotSlotLength
  add hl, de
  dec b
  jr nz, .loop
  ld a, 1
  ret

.fullyEquippedMedarotFound
  xor a
  ret

; CheckForStarterMedarot is version-specific.

SECTION "Medarot Helper Functions 3", ROMX[$4B5E], BANK[$07]
MedarotSelectionScreenEmptySlotCheck::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld a, [de]
  or a
  jr z, MedarotsPlayBzztSound
  ld a, 3
  call ScheduleSoundEffect
  ld a, 1
  ret

MedarotsPlayBzztSound::
  ld a, 5
  call ScheduleSoundEffect
  xor a
  ret

GetCurrentMedalAndTypeForMedarotStatusScreen::
  xor a
  ld [W_MedarotStatusSelectedOption], a
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotType
  add hl, de
  ld a, [hl]
  ld [W_MedarotStatusTinpetType], a
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  call GetMedalAddressForCurrentMedarot
  ld a, b
  ld [W_MedarotCurrentMedal], a
  ret

DeductMedarotEquipmentFromInventoryForStatus::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotEquipState
  add hl, de
  ld [hl], M_MedarotType
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  cp $1E
  jr z, .noMedal
  call GetMedalAddressForCurrentMedarot
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

MedarotStatusDisplayIcons::
  ld a, 1
  ld [$C1E0], a
  ld a, 0
  ld [$C1E1], a
  ld a, $F
  ld [$C1E3], a
  ld a, $38
  ld [$C1E4], a
  ld a, $38
  ld b, 0
  ld de, $C1E0
  call $33B2
  ld a, 1
  ld [$C200], a
  ld a, 0
  ld [$C201], a
  ld a, $F
  ld [$C203], a
  ld a, $48
  ld [$C204], a
  ld a, $39
  ld b, 0
  ld de, $C200
  call $33B2
  ld a, 1
  ld [$C220], a
  ld a, 0
  ld [$C221], a
  ld a, $F
  ld [$C223], a
  ld a, $58
  ld [$C224], a
  ld a, $3A
  ld b, 0
  ld de, $C220
  call $33B2
  ld a, 1
  ld [$C240], a
  ld a, 0
  ld [$C241], a
  ld a, $F
  ld [$C243], a
  ld a, $68
  ld [$C244], a
  ld a, $3B
  ld b, 0
  ld de, $C240
  call $33B2
  ld a, 1
  ld [$C260], a
  ld a, 0
  ld [$C261], a
  ld a, $F
  ld [$C263], a
  ld a, $78
  ld [$C264], a
  ld a, $3C
  ld b, 0
  ld de, $C260
  jp $33B2

DisplayMedarotSpriteForStatusScreen::
  ld a, 1
  ld [$C120], a
  ld a, $44
  ld [$C121], a
  ld a, $30
  ld [$C123], a
  ld a, $18
  ld [$C124], a
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr z, .notFullyEquipped
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, .notFullyEquipped
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr nc, .notFullyEquipped
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr nc, .notFullyEquipped
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  jr nc, .notFullyEquipped
  ld [W_ListItemIndexForBuffering], a
  ld a, 3
  call $34FF
  ld a, [$C553]
  sub $50
  sla a
  sla a
  add $10
  ld [$C122], a
  ld a, [$C553]
  sub $50
  add $2D
  call $34B7
  ld [$C125], a
  ret

.notFullyEquipped
  ld a, [W_MedarotStatusTinpetType]
  sla a
  ld [$C122], a
  ld a, [W_MedarotStatusTinpetType]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [$C125], a
  ret

.table
  db 1, 5

MapMedalNicknameForMedarotStatus::
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr nz, .medalEquipped
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

.medalEquipped
  call OffsetToMappingAddressForMedarotScreens
  push hl
  ld a, 5
  rst 8
  ld a, [W_MedarotCurrentMedal]
  call GetMedalAddressForMedarotStatusScreen
  ld hl, M_MedalNickname
  add hl, de
  ld b, h
  ld c, l
  ld a, 8
  pop hl
  jp MapMedalNicknameForMedarotStatusScreen

GetMedalAddressForMedarotStatusScreen::
  push af
  ld a, 5
  rst 8
  pop af
  ld hl, $D120
  ld b, 0
  ld c, a
  ld a, 6
  jp MultiplyBCByTwoToThePowerOfAAndAddToHL

MapMedalNameForMedarotStatus::
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr nz, .medalEquipped
  call OffsetToMappingAddressForMedarotScreens
  ld b, 5
  jp MedarotsMapDashes

.medalEquipped
  push bc
  call GetMedalAddressForMedarotStatusScreen
  ld hl, M_MedalType
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld bc, $0B06
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld bc, W_NewListItemBufferArea
  ld d, $53
  ld a, 5
  jp VWFDrawStringLeftFullAddressAlternate
  
  padend $4d81

MapMedalIconForMedarotStatus::
  push bc
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr nz, .medalEquipped
  ld a, $1E
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $C
  ld hl, $8C80
  call $34E1
  pop bc
  ld e, $46
  ld a, 0
  jp WrapDecompressTilemap0

.medalEquipped
  ld a, [W_MedarotCurrentMedal]
  call GetMedalAddressForMedarotStatusScreen
  ld hl, M_MedalType
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $C
  ld hl, $8C80
  call $34E1
  pop bc
  ld e, $46
  ld a, 0
  jp WrapDecompressTilemap0

MapHeadPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, PartNotEquipped
  ld h, $58
  push hl
  push bc
  ld b, 1
  jr PartDraw

MapLeftArmPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr nc, PartNotEquipped
  ld h, $60
  push hl
  push bc
  ld b, 2
  jr PartDraw

MapRightArmPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr nc, PartNotEquipped
  ld h, $68
  push hl
  push bc
  ld b, 3
  jr PartDraw

MapLegPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  jr nc, PartNotEquipped
  ld h, $70
  push hl
  push bc
  ld b, 4
  jr PartDraw

PartDraw:
  ld [W_ListItemIndexForBuffering], a
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld d, h
  ld e, l
  pop hl
  ld bc, W_NewListItemBufferArea
  jp VWFDrawStringLeftFullAddress8Tiles

PartNotEquipped:
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

  padend $4e72

CheckMedalAndFetchAttributeAndCompatibility::
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr nz, .medalEquipped
  ld a, 1
  ret

.medalEquipped
  ld a, [W_MedarotCurrentMedal]
  call GetMedalAddressForMedarotStatusScreen
  ld hl, M_MedalAttribute
  add hl, de
  ld a, [hl]
  ld [$C4EE], a
  ld hl, M_MedalCompatibility
  add hl, de
  ld a, [hl]
  ld [$C4F0], a
  xor a
  ret

MedarotStatusDisplayMedalCompatibilityIconForHeadPart::
  call CheckMedalAndFetchAttributeAndCompatibility
  or a
  jr nz, .noIcon
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, .noIcon
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  call $34FF
  ld a, [$C552]
  ld b, a
  ld a, [$C4EE]
  cp b
  jr nz, .noIcon
  ld a, [$C4F0]
  or $80
  ld [$C587], a
  ld a, $F0
  ld hl, $994E
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.noIcon
  xor a
  ld [$C587], a
  xor a
  ld hl, $994E
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

MedarotStatusDisplayMedalCompatibilityIconForLeftArmPart::
  call CheckMedalAndFetchAttributeAndCompatibility
  or a
  jr nz, .noIcon
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr nc, .noIcon
  ld [W_ListItemIndexForBuffering], a
  ld a, 1
  call $34FF
  ld a, [$C552]
  ld b, a
  ld a, [$C4EE]
  cp b
  jr nz, .noIcon
  ld a, [$C4F0]
  or $80
  ld [$C588], a
  ld a, $F0
  ld hl, $998E
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.noIcon
  xor a
  ld [$C588], a
  xor a
  ld hl, $998E
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

MedarotStatusDisplayMedalCompatibilityIconForRightArmPart::
  call CheckMedalAndFetchAttributeAndCompatibility
  or a
  jr nz, .noIcon
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr nc, .noIcon
  ld [W_ListItemIndexForBuffering], a
  ld a, 2
  call $34FF
  ld a, [$C552]
  ld b, a
  ld a, [$C4EE]
  cp b
  jr nz, .noIcon
  ld a, [$C4F0]
  or $80
  ld [$C589], a
  ld a, $F0
  ld hl, $99CE
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.noIcon
  xor a
  ld [$C589], a
  xor a
  ld hl, $99CE
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

MedarotStatusDisplayMedalCompatibilityIconForLegPart::
  call CheckMedalAndFetchAttributeAndCompatibility
  or a
  jr nz, .noIcon
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  jr nc, .noIcon
  ld [W_ListItemIndexForBuffering], a
  ld a, 3
  call $34FF
  ld a, [$C552]
  ld b, a
  ld a, [$C4EE]
  cp b
  jr nz, .noIcon
  ld a, [$C4F0]
  or $80
  ld [$C58A], a
  ld a, $F0
  ld hl, $9A0E
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.noIcon
  xor a
  ld [$C58A], a
  xor a
  ld hl, $9A0E
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

MedarotStatusDisplayMedalCompatibilityBonuses::
  ld a, [$C587]
  and $7F
  ld hl, $994F
  call MedarotDisplayMedalCompatibilityBonus
  ld a, [$C588]
  and $7F
  ld hl, $998F
  call MedarotDisplayMedalCompatibilityBonus
  ld a, [$C589]
  and $7F
  ld hl, $99CF
  call MedarotDisplayMedalCompatibilityBonus
  ld a, [$C58A]
  and $7F
  ld hl, $9A0F
  jp MedarotDisplayMedalCompatibilityBonus

MedarotDisplayMedalCompatibilityBonus::
  push hl
  ld h, 0
  ld l, a
  ld bc, 10
  call DigitCalculationLoop
  pop hl
  ld a, [$C4EE]
  or a
  jr z, .justOneDigit
  ld a, $DA
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4E1]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.justOneDigit
  push hl
  ld a, [$C4E1]
  ld h, 0
  ld l, a
  ld bc, 1
  call DigitCalculationLoop
  pop hl
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  or a
  jr z, .zeroPlz
  ld a, $DA
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.zeroPlz
  ld a, $DB
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

UpdateCurrentlyAnimatedPartIconForMedarotStatus::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp | M_JPInputDown
  jr nz, .resetAllAnimations
  ld a, [W_MedarotStatusSelectedOption]
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $C1E0
  add hl, bc
  ld d, h
  ld e, l
  jp $33B7

.resetAllAnimations
  ld a, $38
  ld b, 0
  ld de, $C1E0
  call $33B2
  ld a, $39
  ld b, 0
  ld de, $C200
  call $33B2
  ld a, $3A
  ld b, 0
  ld de, $C220
  call $33B2
  ld a, $3B
  ld b, 0
  ld de, $C240
  call $33B2
  ld a, $3C
  ld b, 0
  ld de, $C260
  jp $33B2

DisplayMedarotStatusSelectionArrows::
  call PlaceMedarotStatusSelectionArrows
  ld a, $3D
  ld b, 0
  ld de, $C0E0
  call $33B2
  ld a, $36
  ld b, 0
  ld de, $C100
  jp $33B2

PlaceMedarotStatusSelectionArrows::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, 7
  ld [$C0E5], a
  ld a, 7
  ld [$C0E3], a
  ld a, [W_MedarotStatusSelectedOption]
  sla a
  sla a
  sla a
  sla a
  add $40
  ld [$C0E4], a
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, 7
  ld [$C105], a
  ld a, $91
  ld [$C103], a
  ld a, [W_MedarotStatusSelectedOption]
  sla a
  sla a
  sla a
  sla a
  add $40
  ld [$C104], a
  ret

MedarotStatusVerticalSelectionInputHandler::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_MedarotStatusSelectedOption]
  sub 1
  jr nc, .dontLoopToBottom
  ld a, 4

.dontLoopToBottom
  ld [W_MedarotStatusSelectedOption], a
  ld a, 2
  call ScheduleSoundEffect
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  ret z
  ld a, [W_MedarotStatusSelectedOption]
  inc a
  cp 5
  jr c, .dontLoopToTop
  xor a

.dontLoopToTop
  ld [W_MedarotStatusSelectedOption], a
  ld a, 2
  call ScheduleSoundEffect
  ret

MedarotStatusMedalSelectionInputHandler::
  ld a, [W_MedarotStatusSelectedOption]
  or a
  ret nz
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 0
  call NavigateMedalListForMedarotStatus

.updateScreen
  ld bc, $101
  call MapMedalNicknameForMedarotStatus
  ld bc, $608
  call MapMedalNameForMedarotStatus
  ld bc, $407
  call MapMedalIconForMedarotStatus
  call MedarotStatusDisplayMedalCompatibilityIconForHeadPart
  call MedarotStatusDisplayMedalCompatibilityIconForLeftArmPart
  call MedarotStatusDisplayMedalCompatibilityIconForRightArmPart
  call MedarotStatusDisplayMedalCompatibilityIconForLegPart
  call MedarotStatusDisplayMedalCompatibilityBonuses
  ld a, 2
  call ScheduleSoundEffect
  ret

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 1
  call NavigateMedalListForMedarotStatus
  jr .updateScreen

NavigateMedalListForMedarotStatus::
  or a
  jr nz, .incrementMode
 
.decrementMode
  ld a, 5
  rst 8

.previousMedal
  ld a, [W_MedarotCurrentMedal]
  sub 1
  jr nc, .previousSlotNotEmpty
  ld a, $1E
  ld [W_MedarotCurrentMedal], a
  ret

.previousSlotNotEmpty
  ld [W_MedarotCurrentMedal], a
  call IsCurrentMedalSlotUsableForMedarotStatus
  or a
  jr nz, .previousMedal
  ret

.incrementMode
  ld a, 5
  rst 8

.nextMedal
  ld a, [W_MedarotCurrentMedal]
  inc a
  cp $1F
  jr c, .dontLoopToStart
  xor a

.dontLoopToStart
  cp $1E
  jr nz, .nextSlotNotEmpty
  ld a, $1E
  ld [W_MedarotCurrentMedal], a
  ret

.nextSlotNotEmpty
  ld [W_MedarotCurrentMedal], a
  call IsCurrentMedalSlotUsableForMedarotStatus
  or a
  jr nz, .nextMedal
  ret

IsCurrentMedalSlotUsableForMedarotStatus::
  ld a, [W_MedarotCurrentMedal]
  call GetMedalAddressForMedarotStatusScreen
  ld hl, M_MedalStatus
  add hl, de
  ld a, [hl]
  cp $80
  jr c, .nope
  and $40
  jr nz, .nope
  xor a
  ret

.nope
  ld a, 1
  ret

MapMedalNicknameForMedarotStatusScreen::
  ; hl is address to draw to
  ; bc is string
  push de
  push hl
  push bc
  push af

  ld d, h
  ld e, l
  ld h, $78 ; As a rule of thumb, we draw the Medarot name in the last available tiles
  call VWFDrawStringCentredFullAddress8Tiles

  pop af
  pop bc
  pop hl
  pop de
.end
REPT $520c - .end
  nop
ENDR

MedarotStatusHeadPartSelectionInputHandler::
  ld a, [W_MedarotStatusSelectedOption]
  cp 1
  ret nz
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 0
  call NavigateHeadPartListForMedarotStatus
  jr .updateScreen

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 1
  call NavigateHeadPartListForMedarotStatus

.updateScreen
  ld bc, $60A
  call MapHeadPartNameForMedarotStatus
  ld bc, $A01
  call UpdateMedarotImageAndPaletteForStatusScreen
  call MedarotStatusDisplayMedalCompatibilityIconForHeadPart
  call MedarotStatusDisplayMedalCompatibilityBonuses
  call MedarotStatusMedachangeCheck
  call DisplayMedachangeInputIndicatorForMedarotStatus
  ld a, 2
  call ScheduleSoundEffect
  ret

NavigateHeadPartListForMedarotStatus::
  or a
  jr nz, .incrementMode

.decrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentHeadPart]
  sub 1
  jr nc, .previousSlotNotEmpty
  ld b, $97
  ld a, [W_MedarotStatusTinpetType]
  add b
  ld [W_MedarotCurrentHeadPart], a
  ret

.previousSlotNotEmpty
  cp $97
  jr nz, .noTypeBEmptySlotDoubleDecrement
  dec a

.noTypeBEmptySlotDoubleDecrement
  ld [W_MedarotCurrentHeadPart], a
  call IsCurrentHeadPartSlotUsableForMedarotStatus
  or a
  jr nz, .decrementMode
  ret

.incrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotStatusTinpetType]
  or a
  jr nz, .typeBTinpet
  ld a, [W_MedarotCurrentHeadPart]
  inc a
  cp $98
  jr c, .typeADontLoopToStart
  xor a

.typeADontLoopToStart
  cp $97
  jr nz, .typeANextSlotNotEmpty
  ld a, $97
  ld [W_MedarotCurrentHeadPart], a
  ret

.typeANextSlotNotEmpty
  ld [W_MedarotCurrentHeadPart], a
  call IsCurrentHeadPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

.typeBTinpet
  ld a, [W_MedarotCurrentHeadPart]
  inc a
  cp $99
  jr c, .typeBDontLoopToStart
  xor a

.typeBDontLoopToStart
  cp $97
  jr c, .typeBNextSlotNotEmpty
  ld a, $98
  ld [W_MedarotCurrentHeadPart], a
  ret

.typeBNextSlotNotEmpty
  ld [W_MedarotCurrentHeadPart], a
  call IsCurrentHeadPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

IsCurrentHeadPartSlotUsableForMedarotStatus::
  ld a, [W_MedarotCurrentHeadPart]
  ld hl, $D000
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nope
  ld b, 1
  ld c, 1
  ld a, [W_MedarotCurrentHeadPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .nope
  xor a
  ret

.nope
  ld a, 1
  ret

MedarotStatusLeftArmPartSelectionInputHandler::
  ld a, [W_MedarotStatusSelectedOption]
  cp 2
  ret nz
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 0
  call NavigateLeftArmPartListForMedarotStatus
  jr .updateScreen

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 1
  call NavigateLeftArmPartListForMedarotStatus

.updateScreen
  ld bc, $60C
  call MapLeftArmPartNameForMedarotStatus
  ld bc, $A01
  call UpdateMedarotImageAndPaletteForStatusScreen
  call MedarotStatusDisplayMedalCompatibilityIconForLeftArmPart
  call MedarotStatusDisplayMedalCompatibilityBonuses
  call MedarotStatusMedachangeCheck
  call DisplayMedachangeInputIndicatorForMedarotStatus
  ld a, 2
  call ScheduleSoundEffect
  ret

NavigateLeftArmPartListForMedarotStatus::
  or a
  jr nz, .incrementMode

.decrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentLeftArmPart]
  sub 1
  jr nc, .previousSlotNotEmpty
  ld b, $97
  ld a, [W_MedarotStatusTinpetType]
  add b
  ld [W_MedarotCurrentLeftArmPart], a
  ret

.previousSlotNotEmpty
  cp $97
  jr nz, .noTypeBEmptySlotDoubleDecrement
  dec a

.noTypeBEmptySlotDoubleDecrement
  ld [W_MedarotCurrentLeftArmPart], a
  call IsCurrentLeftArmPartSlotUsableForMedarotStatus
  or a
  jr nz, .decrementMode
  ret

.incrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotStatusTinpetType]
  or a
  jr nz, .typeBTinpet
  ld a, [W_MedarotCurrentLeftArmPart]
  inc a
  cp $98
  jr c, .typeADontLoopToStart
  xor a

.typeADontLoopToStart
  cp $97
  jr nz, .typeANextSlotNotEmpty
  ld a, $97
  ld [W_MedarotCurrentLeftArmPart], a
  ret

.typeANextSlotNotEmpty
  ld [W_MedarotCurrentLeftArmPart], a
  call IsCurrentLeftArmPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

.typeBTinpet
  ld a, [W_MedarotCurrentLeftArmPart]
  inc a
  cp $99
  jr c, .typeBDontLoopToStart
  xor a

.typeBDontLoopToStart
  cp $97
  jr c, .typeBNextSlotNotEmpty
  ld a, $98
  ld [W_MedarotCurrentLeftArmPart], a
  ret

.typeBNextSlotNotEmpty
  ld [W_MedarotCurrentLeftArmPart], a
  call IsCurrentLeftArmPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

IsCurrentLeftArmPartSlotUsableForMedarotStatus::
  ld a, [W_MedarotCurrentLeftArmPart]
  ld hl, $D12E
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nope
  ld b, 2
  ld c, 1
  ld a, [W_MedarotCurrentLeftArmPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .nope
  xor a
  ret

.nope
  ld a, 1
  ret

MedarotStatusRightArmPartSelectionInputHandler::
  ld a, [W_MedarotStatusSelectedOption]
  cp 3
  ret nz
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 0
  call NavigateRightArmPartListForMedarotStatus
  jr .updateScreen

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 1
  call NavigateRightArmPartListForMedarotStatus

.updateScreen
  ld bc, $60E
  call MapRightArmPartNameForMedarotStatus
  ld bc, $A01
  call UpdateMedarotImageAndPaletteForStatusScreen
  call MedarotStatusDisplayMedalCompatibilityIconForRightArmPart
  call MedarotStatusDisplayMedalCompatibilityBonuses
  call MedarotStatusMedachangeCheck
  call DisplayMedachangeInputIndicatorForMedarotStatus
  ld a, 2
  call ScheduleSoundEffect
  ret

NavigateRightArmPartListForMedarotStatus::
  or a
  jr nz, .incrementMode

.decrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentRightArmPart]
  sub 1
  jr nc, .previousSlotNotEmpty
  ld b, $97
  ld a, [W_MedarotStatusTinpetType]
  add b
  ld [W_MedarotCurrentRightArmPart], a
  ret

.previousSlotNotEmpty
  cp $97
  jr nz, .noTypeBEmptySlotDoubleDecrement
  dec a

.noTypeBEmptySlotDoubleDecrement
  ld [W_MedarotCurrentRightArmPart], a
  call IsCurrentRightArmPartSlotUsableForMedarotStatus
  or a
  jr nz, .decrementMode
  ret

.incrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotStatusTinpetType]
  or a
  jr nz, .typeBTinpet
  ld a, [W_MedarotCurrentRightArmPart]
  inc a
  cp $98
  jr c, .typeADontLoopToStart
  xor a

.typeADontLoopToStart
  cp $97
  jr nz, .typeANextSlotNotEmpty
  ld a, $97
  ld [W_MedarotCurrentRightArmPart], a
  ret

.typeANextSlotNotEmpty
  ld [W_MedarotCurrentRightArmPart], a
  call IsCurrentRightArmPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

.typeBTinpet
  ld a, [W_MedarotCurrentRightArmPart]
  inc a
  cp $99
  jr c, .typeBDontLoopToStart
  xor a

.typeBDontLoopToStart
  cp $97
  jr c, .typeBNextSlotNotEmpty
  ld a, $98
  ld [W_MedarotCurrentRightArmPart], a
  ret

.typeBNextSlotNotEmpty
  ld [W_MedarotCurrentRightArmPart], a
  call IsCurrentRightArmPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

IsCurrentRightArmPartSlotUsableForMedarotStatus::
  ld a, [W_MedarotCurrentRightArmPart]
  ld hl, $D25C
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nope
  ld b, 3
  ld c, 1
  ld a, [W_MedarotCurrentRightArmPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .nope
  xor a
  ret

.nope
  ld a, 1
  ret

MedarotStatusLegPartSelectionInputHandler::
  ld a, [W_MedarotStatusSelectedOption]
  cp 4
  ret nz
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 0
  call NavigateLegPartListForMedarotStatus
  jr .updateScreen

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 1
  call NavigateLegPartListForMedarotStatus

.updateScreen
  ld bc, $610
  call MapLegPartNameForMedarotStatus
  ld bc, $A01
  call UpdateMedarotImageAndPaletteForStatusScreen
  call MedarotStatusDisplayMedalCompatibilityIconForLegPart
  call MedarotStatusDisplayMedalCompatibilityBonuses
  call MedarotStatusMedachangeCheck
  call DisplayMedachangeInputIndicatorForMedarotStatus
  ld a, 2
  call ScheduleSoundEffect
  ret

NavigateLegPartListForMedarotStatus::
  or a
  jr nz, .incrementMode

.decrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentLegPart]
  sub 1
  jr nc, .previousSlotNotEmpty
  ld b, $97
  ld a, [W_MedarotStatusTinpetType]
  add b
  ld [W_MedarotCurrentLegPart], a
  ret

.previousSlotNotEmpty
  cp $97
  jr nz, .noTypeBEmptySlotDoubleDecrement
  dec a

.noTypeBEmptySlotDoubleDecrement
  ld [W_MedarotCurrentLegPart], a
  call IsCurrentLegPartSlotUsableForMedarotStatus
  or a
  jr nz, .decrementMode
  ret

.incrementMode
  ld a, 7
  rst 8
  ld a, [W_MedarotStatusTinpetType]
  or a
  jr nz, .typeBTinpet
  ld a, [W_MedarotCurrentLegPart]
  inc a
  cp $98
  jr c, .typeADontLoopToStart
  xor a

.typeADontLoopToStart
  cp $97
  jr nz, .typeANextSlotNotEmpty
  ld a, $97
  ld [W_MedarotCurrentLegPart], a
  ret

.typeANextSlotNotEmpty
  ld [W_MedarotCurrentLegPart], a
  call IsCurrentLegPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

.typeBTinpet
  ld a, [W_MedarotCurrentLegPart]
  inc a
  cp $99
  jr c, .typeBDontLoopToStart
  xor a

.typeBDontLoopToStart
  cp $97
  jr c, .typeBNextSlotNotEmpty
  ld a, $98
  ld [W_MedarotCurrentLegPart], a
  ret

.typeBNextSlotNotEmpty
  ld [W_MedarotCurrentLegPart], a
  call IsCurrentLegPartSlotUsableForMedarotStatus
  or a
  jr nz, .incrementMode
  ret

IsCurrentLegPartSlotUsableForMedarotStatus::
  ld a, [W_MedarotCurrentLegPart]
  ld hl, $D38A
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nope
  ld b, 4
  ld c, 1
  ld a, [W_MedarotCurrentLegPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .nope
  xor a
  ret

.nope
  ld a, 1
  ret

UpdateMedarotImageAndPaletteForStatusScreen::
  push bc
  call $34F5
  ld de, $8800
  call $34FA
  pop bc
  ld e, 3
  ld a, 0
  call WrapDecompressTilemap0
  call UpdateSelectedMedarotPalette
  ret

UpdateMedarotImageForStatusScreen::
  push bc
  call $34F5
  ld de, $8800
  call $34FA
  pop bc
  ld e, 3
  ld a, 0
  call WrapDecompressTilemap0
  ret

MedarotStatusOpenExternalSubscreenInputHandler::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  ld a, [W_MedarotStatusSelectedOption]
  cp 0
  jr z, .checkMedalSlotForOpening
  cp 1
  jr z, .checkHeadPartSlotForOpening
  cp 2
  jr z, .checkLeftArmPartSlotForOpening
  cp 3
  jr z, .checkRightArmPartSlotForOpening
  jr .checkLegPartSlotForOpening

.checkMedalSlotForOpening
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr z, .cannotOpen
  jr .canOpen

.checkHeadPartSlotForOpening
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, .cannotOpen
  jr .canOpen

.checkLeftArmPartSlotForOpening
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr nc, .cannotOpen
  jr .canOpen

.checkRightArmPartSlotForOpening
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr nc, .cannotOpen
  jr .canOpen

.checkLegPartSlotForOpening
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  jr nc, .cannotOpen

.canOpen
  ld a, 3
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

.cannotOpen
  xor a
  ld [$C4EE], a
  ld a, 5
  call ScheduleSoundEffect
  ret

CountPartsForExternalPartSubscreen::
  ld [$C4F2], a
  ld hl, .table
  rst $30
  ld a, 7
  rst 8
  xor a
  ld [$C4EE], a
  ld [$C4F0], a

.loop
  push hl
  ld a, [$C4EE]
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nextPart
  ld a, [$C4F2]
  inc a
  ld b, a
  ld c, 1
  ld a, [$C4EE]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .nextPart
  ld a, [$C4F0]
  inc a
  ld [$C4F0], a

.nextPart
  pop hl
  ld a, [$C4EE]
  inc a
  ld [$C4EE], a
  cp $97
  jr nz, .loop
  ld a, [$C4F0]
  ld [W_NumPartsForPartStatus], a
  ret

.table
  dw $D000, $D12E, $D25C, $D38A

UpdateEquipmentDataForMedarotStatus::
  xor a
  ld [W_ItemPageRowIndex], a
  ld a, [W_MedarotCurrentMedal]
  cp $1E
  jr nz, .associateMedalWithMedarot
  ld [$C4EE], a
  jr .updateMedarotMedalInfo

.associateMedalWithMedarot
  ld a, [W_MedarotCurrentMedal]
  call GetMedalAddressForMedarotStatusScreen
  ld hl, M_MedalStatus
  add hl, de
  ld a, [hl]
  or $40
  ld [hl], a
  ld hl, M_MedalType
  add hl, de
  ld a, [hl]
  ld [$C4EE], a
  ld hl, W_ItemPageRowIndex
  inc [hl]

.updateMedarotMedalInfo
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [$C4EE]
  ld [hl], a
  ld hl, M_MedarotEquipState
  add hl, de
  ld a, 2
  ld [hl], a
  ld a, [$C4EE]
  cp $1E
  jr nz, .checkCurrentHeadPart
  ld hl, M_MedarotEquipState
  add hl, de
  ld a, 1
  ld [hl], a

.checkCurrentHeadPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, .updateMedarotHeadPartInfo
  ld de, $D000
  ld a, [W_MedarotCurrentHeadPart]
  call GetPartAddressForMedarotStatus
  ld hl, 1
  add hl, de
  ld a, [hl]
  inc a
  ld [hl], a
  ld hl, W_ItemPageRowIndex
  inc [hl]

.updateMedarotHeadPartInfo
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotHead
  add hl, de
  ld a, [W_MedarotCurrentHeadPart]
  ld [hl], a

.checkCurrentLeftArmPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr nc, .updateMedarotLeftArmPartInfo
  ld de, $D12E
  ld a, [W_MedarotCurrentLeftArmPart]
  call GetPartAddressForMedarotStatus
  ld hl, M_MedarotType
  add hl, de
  ld a, [hl]
  inc a
  ld [hl], a
  ld hl, W_ItemPageRowIndex
  inc [hl]

.updateMedarotLeftArmPartInfo
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotLeftArm
  add hl, de
  ld a, [W_MedarotCurrentLeftArmPart]
  ld [hl], a

.checkCurrentRightArmPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr nc, .updateMedarotRightArmPartInfo
  ld de, $D25C
  ld a, [W_MedarotCurrentRightArmPart]
  call GetPartAddressForMedarotStatus
  ld hl, M_MedarotType
  add hl, de
  ld a, [hl]
  inc a
  ld [hl], a
  ld hl, W_ItemPageRowIndex
  inc [hl]

.updateMedarotRightArmPartInfo
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotRightArm
  add hl, de
  ld a, [W_MedarotCurrentRightArmPart]
  ld [hl], a

.checkCurrentLegPart
  ld a, 7
  rst 8
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  jr nc, .updateMedarotLegPartInfo
  ld de, $D38A
  ld a, [W_MedarotCurrentLegPart]
  call GetPartAddressForMedarotStatus
  ld hl, M_MedarotType
  add hl, de
  ld a, [hl]
  inc a
  ld [hl], a
  ld hl, W_ItemPageRowIndex
  inc [hl]

.updateMedarotLegPartInfo
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotLegs
  add hl, de
  ld a, [W_MedarotCurrentLegPart]
  ld [hl], a
  ld a, [W_ItemPageRowIndex]
  cp 5
  ret nz
  ld hl, M_MedarotEquipState
  add hl, de
  ld a, 3
  ld [hl], a
  ret

GetPartAddressForMedarotStatus::
  ld h, 0
  ld l, a
  sla l
  rl h
  add hl, de
  ld d, h
  ld e, l
  ret

MedarotStatusMedachangeCheck::
  ld a, [W_MedarotCurrentHeadPart]
  cp $97
  jr nc, .cannotMedachange
  ld b, a
  ld a, [W_MedarotCurrentLeftArmPart]
  cp b
  jr nz, .cannotMedachange
  ld a, [W_MedarotCurrentRightArmPart]
  cp b
  jr nz, .cannotMedachange
  ld a, [W_MedarotCurrentLegPart]
  cp b
  jr nz, .cannotMedachange
  ld a, b
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  call $34FF
  ld a, [$C55E]
  or a
  jr nz, .canMedachange

.cannotMedachange
  xor a
  ld [W_MedarotMedachange], a
  ret

.canMedachange
  ld [W_MedarotMedachange], a
  ld a, [$C560]
  ld [$C602], a
  ret

DisplayMedachangeInputIndicatorForMedarotStatus::
  ld a, [W_MedarotMedachange]
  or a
  jr nz, .hasMedachange
  ld bc, $0801 ; previously 0701
  ld hl, $98C2
  jp $25E5

.hasMedachange
  ld bc, $206
  ld e, $47
  ld a, 0
  jp WrapDecompressTilemap0

MedarotStatusMedachangeSelectButtonInputHandler::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  ret z
  ld a, [W_MedarotMedachange]
  or a
  ret z
  ld a, 3
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

GetMedachangePaletteIndexForMedarotStatus::
  ld a, [W_MedarotCurrentPalette]
  or a
  jr nz, .useMedarotDefinedPalette
  ld a, [W_MedarotMedachange]
  dec a
  ld b, 0
  ld c, a
  ld hl, $330
  add hl, bc
  ld b, h
  ld c, l
  ret

.useMedarotDefinedPalette
  dec a
  ld b, 0
  ld c, a
  ld hl, $370
  add hl, bc
  ld b, h
  ld c, l
  ret

SetMedachangePaletteForMedarotStatus::
  call GetMedachangePaletteIndexForMedarotStatus
  ld a, 2
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ret

DisplayMedachangeSpriteForStatusScreen::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C120], a
  ld a, $44
  ld [$C121], a
  ld a, 8
  ld [$C123], a
  ld a, $18
  ld [$C124], a
  ld a, [W_MedarotCurrentLegPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  call $34FF
  ld a, [$C553]
  sub $50
  sla a
  sla a
  add $10
  ld [$C122], a
  ld a, [$C553]
  sub $50
  add $2D
  call $34B7
  ld [$C125], a
  ret

DisplayIconForMedachangeStatusScreen::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C120], a
  ld a, 0
  ld [$C121], a
  ld a, 8
  ld [$C123], a
  ld a, $18
  ld [$C124], a
  ld a, $C0
  ld [$C122], a
  ret

DisplayCurrentMedachangePage::
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  cp 0
  jp nz, .statusNotSelected
  call DisplayMedachangeSpriteForStatusScreen
  ld bc, $A00
  ld e, $4C
  ld a, 0
  call WrapDecompressTilemap0
  ld a, [W_MedarotCurrentLegPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  call $34FF
  ld hl, $9884
  call MapMedachangeNameForStatusScreen
  ld a, [$C556]
  ld hl, $9870
  call $351D
  ld a, [$C557]
  ld hl, $98B0
  call $351D
  ld a, [$C558]
  ld hl, $98F0
  call $351D
  ld a, [$C559]
  ld hl, $9930
  call $351D
  ld a, [$C55A]
  ld hl, $9970
  call $351D
  xor a
  ld [W_MedarotMedachangeStatMathBuffer], a
  ld [W_MedarotMedachangeStatMathBuffer + 1], a
  ld a, [$C555]
  ld l, a
  call MedachangeStatusMathHelper
  ld a, [W_MedarotCurrentHeadPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  call $34FF
  ld a, [$C555]
  ld l, a
  call MedachangeStatusMathHelper
  ld a, [W_MedarotCurrentLeftArmPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, 5
  call $34FF
  ld a, [$C555]
  ld l, a
  call MedachangeStatusMathHelper
  ld a, [W_MedarotCurrentRightArmPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, 6
  call $34FF
  ld a, [$C555]
  ld l, a
  call MedachangeStatusMathHelper
  ld a, [W_MedarotMedachangeStatMathBuffer]
  ld b, a
  ld a, [W_MedarotMedachangeStatMathBuffer + 1]
  ld c, a
  ld hl, $982F
  jp $35BE

.statusNotSelected
  cp 1
  jp nz, .attackANotSelected
  call DisplayIconForMedachangeStatusScreen
  ld bc, $A00
  ld e, $4D
  ld a, 0
  call WrapDecompressTilemap0
  ld a, [W_MedarotCurrentHeadPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  call $34FF
  ld hl, $9884
  call MapMedachangeAttackNameForStatusScreen
  ld a, [$C556]
  ld hl, $9830
  call $351D
  ld a, [$C557]
  ld hl, $9870
  call $351D
  ld a, [$C559]
  ld hl, $98B0
  call $351D
  jp MapStarForMedachangeStatus

.attackANotSelected
  call DisplayIconForMedachangeStatusScreen
  ld bc, $A00
  ld bc, $A00
  ld e, $4E
  ld a, 0
  call WrapDecompressTilemap0
  ld hl, W_MedarotCurrentLeftArmPart
  ld b, 0
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  sub 2
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, c
  add 5
  call $34FF
  ld hl, $9884
  call MapMedachangeAttackNameForStatusScreen
  ld a, [$C556]
  ld hl, $9830
  call $351D
  ld a, [$C557]
  ld hl, $9870
  call $351D
  ld a, [$C559]
  ld hl, $98B0
  call $351D
  ld a, [$C55A]
  ld hl, $98F0
  call $351D
  jp MapStarForMedachangeStatus

MapMedachangeNameForStatusScreen::
  ld bc, $0706
  ld a, [$C553]
  sub $50
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop de ; hl -> de, VRAM address to write to
  ld h, $73
  ld bc, W_NewListItemBufferArea
  jp VWFDrawStringLeftFullAddress5Tiles

  padend $59ca

MedachangeStatusMathHelper::
  ld h, 0
  ld a, [W_MedarotMedachangeStatMathBuffer]
  ld b, a
  ld a, [W_MedarotMedachangeStatMathBuffer +1]
  ld c, a
  add hl, bc
  ld a, h
  ld [W_MedarotMedachangeStatMathBuffer], a
  ld a, l
  ld [W_MedarotMedachangeStatMathBuffer + 1], a
  ret

MapMedachangeAttackNameForStatusScreen::
  ld bc, $0606
  ld a, [$C554]
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop de ; hl -> de, VRAM address to write to
  ld h, $73
  ld bc, W_NewListItemBufferArea
  jp VWFDrawStringLeftFullAddress5Tiles

MapStarForMedachangeStatus::
  ld a, [$C558]
  or a
  jr nz, .hasStar
  xor a
  ld hl, $986F
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.hasStar
  ld a, $3F
  ld hl, $986F
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

DisplayMedachangeDescription::
  call WrapInitiateMainScriptAlternate
  ld a, [W_MedarotCurrentLegPart]
  ld [W_ListItemIndexForBuffering], a
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  add 4
  call $34FF
  ld a, [$C553]
  ld b, 0
  ld c, a
  ld a, 5
  jp WrapMainScriptProcessor

.table
  db 3,0,1,2

DisplayMedachangeOptionSelectorArrow::
  call PlaceMedachangeOptionSelectorArrow
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

PlaceMedachangeOptionSelectorArrow::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  ld a, 7
  ld [$C0C5], a
  ld a, 7
  ld [$C0C3], a
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [$C0C4], a
  ret

.table
  db $30, $40, $48, $50

MedachangeStatusScreenInputHandler::
  xor a
  ld [$C4EE], a
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  sub 1
  jr nc, .dontWrapToEnd
  ld a, 3

.dontWrapToEnd
  ld [W_MedalMenuSelectedMedaliaSlot], a
  call DisplayCurrentMedachangePage
  call DisplayMedachangeDescription
  call PlaceMedachangeOptionSelectorArrow
  ld a, 2
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  ret z
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  inc a
  cp 4
  jr nz, .dontWrapToStart
  xor a

.dontWrapToStart
  ld [W_MedalMenuSelectedMedaliaSlot], a
  call DisplayCurrentMedachangePage
  call DisplayMedachangeDescription
  call PlaceMedachangeOptionSelectorArrow
  ld a, 2
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

CycleEquipmentSetsInputHandlerForMedarotStatus::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputStart
  ret z
  ld a, [W_MedarotStatusSelectedOption]
  or a
  jr z, .headPartInteadOfMedal
  dec a

.headPartInteadOfMedal
  ld hl, W_MedarotCurrentHeadPart
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld c, a
  call CheckIfEquipmentMatchesForSetCycle
  or a
  jr nz, .initialEquipmentDoesNotMatch
  ld a, c
  call PartIndexDecCycleForMedarotStatus
  ld c, a

.initialEquipmentDoesNotMatch
  ld a, c

.nextPotentialSet
  ld [W_MedarotCurrentHeadPart], a
  ld [W_MedarotCurrentLeftArmPart], a
  ld [W_MedarotCurrentRightArmPart], a
  ld [W_MedarotCurrentLegPart], a
  ld a, 1
  call NavigateHeadPartListForMedarotStatus
  ld a, 1
  call NavigateLeftArmPartListForMedarotStatus
  ld a, 1
  call NavigateRightArmPartListForMedarotStatus
  ld a, 1
  call NavigateLegPartListForMedarotStatus
  call CheckIfEquipmentMatchesForSetCycle
  or a
  jr z, .equipmentDoesNotMatch
  call DisplayMedarotSpriteForStatusScreen
  ld bc, $A01
  call UpdateMedarotImageAndPaletteForStatusScreen
  ld bc, $60A
  call MapHeadPartNameForMedarotStatus
  ld bc, $60C
  call MapLeftArmPartNameForMedarotStatus
  ld bc, $60E
  call MapRightArmPartNameForMedarotStatus
  ld bc, $610
  call MapLegPartNameForMedarotStatus
  call MedarotStatusDisplayMedalCompatibilityIconForHeadPart
  call MedarotStatusDisplayMedalCompatibilityIconForLeftArmPart
  call MedarotStatusDisplayMedalCompatibilityIconForRightArmPart
  call MedarotStatusDisplayMedalCompatibilityIconForLegPart
  call MedarotStatusDisplayMedalCompatibilityBonuses
  call MedarotStatusMedachangeCheck
  call DisplayMedachangeInputIndicatorForMedarotStatus
  ld a, 2
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

.equipmentDoesNotMatch
  ld a, 6
  rst 8
  ld b, 1
  ld hl, $DC20
  ld de, W_MedarotCurrentHeadPart

.loop
  ld a, b
  ld [hli], a
  ld a, [de]
  ld [hli], a
  xor a
  ld [hli], a
  ld [hli], a
  inc de
  inc b
  ld a, b
  cp 5
  jr nz, .loop
  ld a, 4
  call $35C6
  ld a, [$DC21]
  call PartIndexDecCycleForMedarotStatus
  jp .nextPotentialSet

CheckIfEquipmentMatchesForSetCycle::
  ld a, [W_MedarotCurrentHeadPart]
  ld b, a
  ld a, [W_MedarotCurrentLeftArmPart]
  cp b
  jr nz, .nope
  ld a, [W_MedarotCurrentRightArmPart]
  cp b
  jr nz, .nope
  ld a, [W_MedarotCurrentLegPart]
  cp b
  jr nz, .nope
  ld a, 1
  ret

.nope
  xor a
  ret

PartIndexDecCycleForMedarotStatus::
  sub 1
  jr nc, .noUnderflow
  ld b, $97
  ld a, [W_MedarotStatusTinpetType]
  add b
  ret

.noUnderflow
  cp $97
  ret nz
  dec a
  ret

MapMedarotSelectionScreenBattleSpecificTiles::
  ld a, [$C595]
  cp 1
  ret nz
  ld bc, $D
  ld e, $7D
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, $D
  ld e, $7D
  ld a, 0
  call WrapDecompressAttribmap0
  ld a, [$C647]
  or a
  jr z, .jpA

  ; Used in group battles (Medalympics)
  push de
  ; Draw Medafighter names
  ld de, $99C2
  ld bc, W_PlayerName
  ld h, $3C
  call VWFDrawStringLeftFullAddress8Tiles
  ld a, [$C648] ; index of medafighter
  ld de, $99E2
  ld h, $44
  call .load_medafighter
  ld a, [$C649] ; index of medafighter
  ld de, $9A02
  ld h, $4C
  call .load_medafighter
  ; Draw Medabot names
  ld a, [$C5DB] ; index of medabot
  ld de, $99EB
  ld h, $24 + 8*1 ; Where Medabot 2 would be drawn
  call .load_medabot
  ld a, [$C5EF] ; index of medabot
  ld de, $9A0B
  ld h, $24 + 8*2 ; Where Medabot 3 would be drawn
  call .load_medabot
  pop de
  ret
.load_medafighter
  ld bc, $1309
  jr .load_and_draw
.load_medabot
  ld bc, $1509
.load_and_draw
  push hl
  push de
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld bc, W_NewListItemBufferArea
  pop de
  pop hl
  jp VWFDrawStringLeftFullAddress8Tiles

.jpA
  ld a, [$C646]
  cp 3
  ret z
  cp 2
  jr nz, .onlyOneMedarot

.onlyTwoMedarots
  ld hl, $9A02
  ld b, 8
  call MedarotsMapDashes
  ld hl, $9A0B
  ld b, 8
  jp MedarotsMapDashes

.onlyOneMedarot
  ld hl, $99E2
  call .map_dashes

  ld hl, $99EB
  call .map_dashes
  
  ld hl, $9A02
  call .map_dashes

  ld hl, $9A0B
  jr .map_dashes

.map_dashes
  ld b, 8
  jp MedarotsMapDashes

  padend $5c58 ; Probably unnecessary but just to be safe

MapStarForBattleMedarotSelectionScreen::
  ld a, [$C595]
  cp 1
  ret nz
  ld bc, $103
  ld hl, $99C1
  call $25E5
  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  sla a
  sla a
  sla a
  sla a
  sla a
  ld hl, $99C1
  ld b, 0
  ld c, a
  add hl, bc
  ld a, $3F
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

CheckIfMedarotAlreadySelectedForBattle::
  ld a, 6
  rst 8
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld b, a
  ld c, 3
  ld hl, $DCA0

.loop
  ld a, [hli]
  cp $80
  jr c, .notAlreadySelected
  and $F
  cp b
  jr z, .alreadySelected
  dec c
  jr nz, .loop
  jr .notAlreadySelected

.alreadySelected
  ld a, 1
  ret

.notAlreadySelected
  xor a
  ret

SelectMedarotForBattle::
  ld a, 6
  rst 8
  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  push af
  ld hl, $DCA0 - $0b0e ; Do the math here to save bytes and set b and c earlier
  ld b, $B
  add $E
  ld c, a
  add hl, bc
  ld a, [W_MedarotSelectionScreenSelectedOption]
  or $80
  ld [hl], a
  pop af
  rlca ; preset 'a' to 8 x selection offset, for use in map function
  rlca
  rlca
  call MapSelectedMedarotNameForBattleSelection
  ld hl, W_MedarotBattleSelectionCurrentSelectionOffset
  inc [hl]
  ret

  padend $5cc8

CanMoreMedarotsBeSelected::
  ld a, 5
  rst 8
  ld b, 0
  ld c, 9
  ld hl, $D000

.loop
  ld a, [hl]
  cp 3
  jr nz, .notBattleReady
  inc b

.notBattleReady
  ld de, $10
  add hl, de
  dec c
  jr nz, .loop

  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  cp b
  jr z, .noMoreMedarotsToSelect
  ld a, [$C646]
  ld b, a
  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  cp b
  jr z, .noMoreMedarotsToSelect
  ld a, [$C647]
  or a
  jr nz, .noMoreMedarotsToSelect
  xor a
  ld [$C4EE], a
  ret

.noMoreMedarotsToSelect
  ld a, 1
  ld [$C4EE], a
  ret

AutoProgressBattleMedarotSelector::
  ld a, [W_MedarotSelectionScreenSelectedOption]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_MedarotSelectionScreenSelectedOption], a
  ld a, 8
  ld [W_MedarotSelectionDirectionalInputWaitTimer], a
  jp MapStarForBattleMedarotSelectionScreen

.table
  db 1,2,0,4,5,3,7,8,6

MapSelectedMedarotNameForBattleSelection::
  add $24 ; 'a' is 8 x offset, use it for drawing location
  push af
  ld a, [W_MedarotSelectionScreenSelectedOption]
  call OffsetToMappingAddressForMedarotScreens
  push hl
  call GetMedarotSlotAddressForSelectionScreen
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  call GetMedalAddressForCurrentMedarot
  ld hl, M_MedalNickname
  add hl, de
  ld b, h
  ld c, l ; bc string to draw
  pop de ; hl -> de, address to write to
  pop hl ; a(f) -> h(l) working area for VWF
  jp VWFDrawStringLeftFullAddress8Tiles

  padend $5d3f

BattleMedarotDeselectionInputHandler::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z
  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  or a
  ret z
  ld a, 4
  call ScheduleSoundEffect
  ld hl, W_MedarotBattleSelectionCurrentSelectionOffset
  dec [hl]
  ld a, 6
  rst 8
  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  ld hl, $DCA0
  ld b, 0
  ld c, a
  add hl, bc
  xor a
  ld [hl], a
  ld a, [W_MedarotBattleSelectionCurrentSelectionOffset]
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $99CB
  add hl, bc
  ld bc, $801
  call $25E5
  call MapStarForBattleMedarotSelectionScreen
  ld a, 1
  ld [$C4EE], a
  ret

MedarotSelectionLinkConnectionTimeoutCheck::
  ld a, [W_SerIO_IdleCounter]
  cp 8
  jp z, .timeout
  inc a
  ld [W_SerIO_IdleCounter], a
  xor a
  ld [$C4EE], a
  ret

.timeout
  xor a
  ld [W_SerIO_IdleCounter], a
  ld a, 1
  ld [$C4EE], a
  ret

MedarotsMapDashes::
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

RecountMedalsForMedarotStatusExternalSubscreen::
  ld a, 5
  rst 8
  ld hl, $D120
  ld b, $1E
  ld c, 0

.loop
  ld a, [hl]
  and $80
  jr z, .emptySlot
  inc c

.emptySlot
  ld de, $40
  add hl, de
  dec b
  jr nz, .loop
  ld a, c
  ld [W_MedalMenuNumberOfMedals], a
  ret

MedarotMenuRestoreIkkiOverlay::
  ld bc, 0
  ld e, $14
  ld a, 0
  call WrapDecompressTilemap1
  call $2CEC
  add $14
  ld e, a
  ld bc, 0
  ld a, 0
  call WrapDecompressAttribmap1
  ret

MedarotMenuRestorePausemenuArrowPlaceholder::
  push af
  ld a, [W_PauseMenuSelectedOption]
  sla a
  ld c, 2
  add c
  ld c, a
  ld b, $D
  pop af
  add 4
  ld e, a
  ld a, 0
  jp WrapDecompressTilemap0ScrollAdjusted

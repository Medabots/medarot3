INCLUDE "game/src/common/constants.asm"

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
  jp MultiplyBCByPowerOfTwoAndAddToHL

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
  ld b, 8
  ld c, 1
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
  ld a, 8
  call GetTileBasedCentringOffset
  pop hl
  ld b, 0
  ld c, a
  add hl, bc
  push hl
  ld hl, M_MedalNickname
  add hl, de
  ld b, h
  ld c, l
  pop hl
  jp PutStringVariableLength

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
  jp MultiplyBCByPowerOfTwoAndAddToHL

MedarotSelectionScreenDirectionalInputHandler::
  ld a, [$C520]
  and M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  jr nz, .directionalButtonPressed
  jp .noDirectionalInput

.directionalButtonPressed
  ld a, [$C520]
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
  ld a, [$C520]
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
  ld a, [$C520]
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
  ld a, [$C520]
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
  jp MultiplyBCByPowerOfTwoAndAddToHL

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
  ld b, $B
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld bc, W_ListItemBufferArea
  ld a, 5
  jp PutStringFixedLength

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
  jr c, .partEquipped
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

.partEquipped
  push bc
  ld [W_ListItemIndexForBuffering], a
  ld b, 1
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld bc, W_ListItemBufferArea
  ld a, 8
  jp PutStringFixedLength

MapLeftArmPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentLeftArmPart]
  cp $97
  jr c, .partEquipped
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

.partEquipped
  push bc
  ld [W_ListItemIndexForBuffering], a
  ld b, 2
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld bc, W_ListItemBufferArea
  ld a, 8
  jp PutStringFixedLength

MapRightArmPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentRightArmPart]
  cp $97
  jr c, .partEquipped
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

.partEquipped
  push bc
  ld [W_ListItemIndexForBuffering], a
  ld b, 3
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld bc, W_ListItemBufferArea
  ld a, 8
  jp PutStringFixedLength

MapLegPartNameForMedarotStatus::
  ld a, [W_MedarotCurrentLegPart]
  cp $97
  jr c, .partEquipped
  call OffsetToMappingAddressForMedarotScreens
  ld b, 8
  jp MedarotsMapDashes

.partEquipped
  push bc
  ld [W_ListItemIndexForBuffering], a
  ld b, 4
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop bc
  call OffsetToMappingAddressForMedarotScreens
  ld bc, W_ListItemBufferArea
  ld a, 8
  jp PutStringFixedLength

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

SECTION "Medarot Helper Functions 4", ROMX[$51C7], BANK[$07]
MapMedalNicknameForMedarotStatusScreen::
  push de
  push hl
  push bc
  push af
  ld d, 0

.countLoop
  ld a, [bc]
  cp $CB
  jr z, .exitCountLoop
  inc bc
  inc d
  jr .countLoop

.exitCountLoop
  pop af
  ld e, a
  sub d
  srl a
  ld d, a

.leftBlankFillLoop
  ld a, d
  or a
  jr z, .exitLeftBlankFillLoop
  xor a
  di 
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec e
  dec d
  jr .leftBlankFillLoop

.exitLeftBlankFillLoop
  pop bc

.mapTextLoop
  ld a, [bc]
  cp $CB
  jr z, .rightBlankFillLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc bc
  dec e
  jr .mapTextLoop

.rightBlankFillLoop
  ld a, e
  or a
  jr z, .exitRightBlankFillLoop
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec e
  jr .rightBlankFillLoop

.exitRightBlankFillLoop
  pop hl
  pop de
  ret

SECTION "Medarot Helper Functions 5", ROMX[$5DAD], BANK[$07]
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

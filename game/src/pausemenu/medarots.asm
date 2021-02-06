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
  ld hl, $10
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
  ld hl, 3
  add hl, de
  ld a, [hli]
  ld [W_MedarotCurrentHeadPart], a
  ld a, [hli]
  ld [W_MedarotCurrentLeftArmPart], a
  ld a, [hli]
  ld [W_MedarotCurrentRightArmPart], a
  ld a, [hli]
  ld [W_MedarotCurrentLegPart], a
  ld hl, 7
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
  jp $1446

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
  ld hl, 2
  add hl, de
  ld a, [hl]
  call GetMedalAddressForCurrentMedarot
  ld hl, $30
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
  ld hl, $30
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
  ld hl, 1
  add hl, de
  ld a, [hl]
  cp c
  ret z

.nextMedalSlot
  ld hl, $40
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
  jp $1446

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
  call $27DA
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
  call $27DA
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
  call $27DA
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
  call $27DA
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

SECTION "Medarot Helper Functions 2", ROMX[$4B70], BANK[$07]
MedarotsPlayBzztSound::
  ld a, 5
  call $27DA
  xor a
  ret

SECTION "Medarot Helper Functions 3", ROMX[$5DAD], BANK[$07]
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

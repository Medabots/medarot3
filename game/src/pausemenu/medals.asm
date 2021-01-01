INCLUDE "game/src/common/constants.asm"

SECTION "Medal Menu Helper Functions 1", ROMX[$4802], BANK[$02]
CalculateMedalMenuPageNumber::
  ld a, [W_SelectedItemInventorySlotIndex]
  ld h, 0
  ld l, a
  ld bc, 6
  call DigitCalculationLoop
  ld a, [$C4EE]
  inc a
  ld [W_CurrentItemPage], a
  ld a, [W_TilemapPointerTableIndex]
  ld [W_CurrentPageItemSelectionIndex], a
  ret

CalculateMedalMenuPageOffset::
  ld a, [W_CurrentItemPage]
  dec a
  ld b, a
  add b
  add b
  add b
  add b
  add b
  ld b, a
  ld a, [W_CurrentPageItemSelectionIndex]
  add b
  ld [W_SelectedItemInventorySlotIndex], a
  ret

MapMedalMenuPageNumber::
  ld a, [W_CurrentItemPage]
  ld hl, $9865
  ld b, 0
  jp $3504

DrawMedalIcons::
  ld a, 5
  rst 8
  ld a, [W_CurrentItemPage]
  dec a
  ld b, a
  add b
  add b
  add b
  add b
  add b
  ld hl, $D120
  ld b, 0
  ld c, a
  ld a, 6
  call $1446
  ld a, 6
  ld [$C4EE], a
  ld hl, $8B00

.loop
  push hl
  ld hl, 0
  add hl, de
  ld a, [hl]
  and $80
  jr z, .blankIcon
  ld hl, 1
  add hl, de
  ld a, [hl]
  jr .drawIcon

.blankIcon
  ld a, $1E

.drawIcon
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  pop hl
  ld a, $C
  push hl
  push de
  call $34E1
  pop de
  ld hl, $40
  add hl, de
  ld d, h
  ld e, l
  pop hl
  ld bc, $40
  add hl, bc
  ld a, [$C4EE]
  dec a
  ld [$C4EE], a
  jr nz, .loop
  ret

SECTION "Medal Menu Helper Functions 2", ROMX[$489D], BANK[$02]
MapMedalNamesForMenu::
  ld a, 5
  rst 8
  ld a, [W_CurrentItemPage]
  dec a
  ld b, a
  add b
  add b
  add b
  add b
  add b
  ld hl, $D120
  ld b, 0
  ld c, a
  ld a, 6
  call $1446
  ld a, 6
  ld [$C4F8], a
  ld hl, $98A4

.loop
  push hl
  ld hl, 0
  add hl, de
  ld a, [hl]
  and $80
  jr z, .noMedal
  ld hl, 1
  add hl, de
  ld a, [hl]
  pop hl
  call MapMedalNameForMenu
  jp .continue

.noMedal
  pop hl
  ld b, 5
  call MedalMenuMapDashes

.continue
  ld bc, $40
  add hl, bc
  push hl
  ld hl, $40
  add hl, de
  ld d, h
  ld e, l
  pop hl
  ld a, [$C4F8]
  dec a
  ld [$C4F8], a
  jr nz, .loop
  ret

MapMedalNameForMenu::
  push de
  push bc
  push hl
  ld [W_ListItemIndexForBuffering], a
  ld b, $B
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop hl
  pop bc
  pop de
  ret

MedalMenuMapDashes::
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

GetMedalAddress::
  ld a, 5
  rst 8
  ld a, [W_SelectedItemInventorySlotIndex]
  ld hl, $D120
  ld b, 0
  ld c, a
  ld a, 6
  jp $1446

CheckMedalOwnership::
  ld hl, 0
  add hl, de
  ld a, [hl]
  and $80
  ret

MapSelectedMedalName::
  push hl
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  jr z, .noMedal
  pop hl
  push hl
  push de
  ld bc, $801
  call $25E5
  pop de
  ld hl, $30
  add hl, de
  ld b, h
  ld c, l
  ld a, 8
  call GetTileBasedCentringOffset
  pop hl
  ld d, 0
  ld e, a
  add hl, de
  ld a, 8
  jp PutStringVariableLength

.noMedal
  pop hl
  ld b, 8
  jp MedalMenuMapDashes

MapSelectedMedalLevel::
  push hl
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  jr z, .noMedal
  ld hl, 9
  add hl, de
  ld a, [hl]
  pop hl
  jp $351D

.noMedal
  pop hl
  ld b, 3
  jp MedalMenuMapDashes

MapSelectedMedalExpToNextLevel::
  push hl
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  jr z, .noExp
  ld hl, 9
  add hl, de
  ld a, [hl]
  cp 100
  jr z, .noExp
  ld hl, 2
  add hl, de
  ld a, [hli]
  ld b, a
  ld a, [hl]
  ld c, a
  pop hl
  jp MapExpToNextLevel

.noExp
  pop hl
  ld b, 5
  jp MedalMenuMapDashes

SECTION "Medal Menu Helper Functions 3", ROMX[$4B6D], BANK[$02]
DrawMedalImageLetter::
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  ret z
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 2
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $D
  ld hl, $8A60
  jp $34E1

DrawMedalImage::
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  ret z
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld b, a
  ld hl, 4
  add hl, de
  ld a, [hl]
  ld c, a
  call $35AA
  ld a, c
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $E
  add b
  ld hl, $8800
  jp $34E1

MapMedalImage::
  push bc
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  jr z, .noMedal
  pop bc
  push bc
  ld e, $39
  ld a, 0
  call WrapDecompressTilemap0
  pop bc
  ld e, $39
  ld a, 0
  jp WrapDecompressAttribmap0

.noMedal
  pop bc
  push bc
  ld e, $38
  ld a, 0
  call WrapDecompressAttribmap0
  pop bc
  ld e, $38
  ld a, 0
  jp WrapDecompressTilemap0

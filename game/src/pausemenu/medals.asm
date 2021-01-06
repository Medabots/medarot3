INCLUDE "game/src/common/constants.asm"

SECTION "Medal Variables 1",  WRAM0[$C489]
W_MedalMenuOptionBoxSelectedItemForProcessing:: ds 1

SECTION "Medal Variables 2",  WRAM0[$C57F]
W_MedalMenuCurrentScreen:: ds 1

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

SECTION "Medal Menu Helper Functions 4", ROMX[$5090], BANK[$02]
MedalDisplayAbilitySubscreenIconSprites::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C1E0], a
  ld a, 0
  ld [$C1E1], a
  ld a, $C3
  ld [$C1E2], a
  ld a, $F
  ld [$C1E3], a
  ld a, $20
  ld [$C1E4], a
  ld a, 1
  ld [$C200], a
  ld a, 0
  ld [$C201], a
  ld a, $C4
  ld [$C202], a
  ld a, $F
  ld [$C203], a
  ld a, $30
  ld [$C204], a
  ld a, 1
  ld [$C220], a
  ld a, 0
  ld [$C221], a
  ld a, $C5
  ld [$C222], a
  ld a, $F
  ld [$C223], a
  ld a, $40
  ld [$C224], a
  ld a, 1
  ld [$C240], a
  ld a, 0
  ld [$C241], a
  ld a, $C6
  ld [$C242], a
  ld a, $F
  ld [$C243], a
  ld a, $50
  ld [$C244], a
  ret

DrawMedalIconForMedalSubscreen::
  call GetMedalAddress
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $C
  ld hl, $8B00
  jp $34E1

MapMedalIconForMedalSubscreen::
  ld bc, $202
  ld e, $3C
  ld a, 0
  jp WrapDecompressTilemap0

MapMedalNameForMedalSubscreen::
  call GetMedalAddress
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld hl, $9864
  jp MapMedalNameForMenu

MapMedalAttributeForMedalSubscreen::
  call GetMedalAddress
  ld hl, 8
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 5
  ld c, 7
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98A4
  ld bc, W_ListItemBufferArea
  ld a, 6
  jp PutStringFixedLength

MapMedalPersonalityForMedalSubscreen::
  call GetMedalAddress
  ld hl, $A
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 9
  ld c, 7
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98E4
  ld bc, W_ListItemBufferArea
  ld a, 6
  jp PutStringFixedLength

MapMedalCompatibilityForMedalSubscreen::
  call GetMedalAddress
  ld hl, $B
  add hl, de
  ld a, [hl]
  ld hl, $9925
  ld b, 1
  jp $3504

MapUndefinedMedalStat::
  call GetMedalAddress
  ld hl, $D
  add hl, de
  ld a, [hl]
  ld hl, $9965
  ld b, 1
  jp $3504

MapUndefinedMedalString::
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  jr z, .mapDashes
  ld hl, $C
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .mapDashes
  call $3549
  ld hl, $30
  add hl, de
  ld b, h
  ld c, l
  ld hl, $9968
  ld a, 8
  jp PutStringFixedLength

.mapDashes
  ld hl, $9968
  ld b, 8
  jp MedalMenuMapDashes

DisplayMedalDescriptionForMedalSubscreen::
  call WrapInitiateMainScriptAlternate
  call GetMedalAddress
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld b, 0
  ld c, a
  ld a, 3
  jp WrapMainScriptProcessor

MedalSubscreenAnimateArrows::
  ld a, [$C57E]
  cp 2
  ret c
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, MedalSubscreenDisplayArrows
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

MedalSubscreenDisplayArrows::
  ld a, [$C57E]
  cp 2
  ret c
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A2
  ld [$C0E2], a
  ld a, 8
  ld [$C0E3], a
  ld a, $19
  ld [$C0E4], a
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, $48
  ld [$C103], a
  ld a, $19
  ld [$C104], a
  ret

MedalsAbilitySubscreenPageNavigationInputHandler::
  xor a
  ld [$C4EE], a
  ld a, [$C57E]
  cp 2
  ret c
  ld a, [$C520]
  and M_JPInputLeft
  jr z, .leftNotPressed

.medalSearchLeftLoop
  ld a, [W_SelectedItemInventorySlotIndex]
  sub 1
  jr nc, .dontWrapToRight
  ld a, $1D

.dontWrapToRight
  ld [W_SelectedItemInventorySlotIndex], a
  call GetMedalAddress
  ld a, [de]
  and $80
  jr z, .medalSearchLeftLoop
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 1
  jr nz, .exitSearchLeftLoop
  ld a, [de]
  and $40
  jr nz, .medalSearchLeftLoop

.exitSearchLeftLoop
  call DisplayMedalDescriptionForMedalSubscreen
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  call MapMedalAttributeForMedalSubscreen
  call MapMedalPersonalityForMedalSubscreen
  call MapMedalCompatibilityForMedalSubscreen
  call MapUndefinedMedalStat
  call MapUndefinedMedalString
  ld hl, $984B
  call MapSelectedMedalName
  ld hl, $9890
  call MapSelectedMedalLevel
  ld hl, $98EE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $41
  call $4A82
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

.leftNotPressed
  ld a, [$C520]
  and M_JPInputRight
  ret z

.medalSearchRightLoop
  ld a, [W_SelectedItemInventorySlotIndex]
  inc a
  cp $1E
  jr nz, .dontWrapToLeft
  xor a

.dontWrapToLeft
  ld [W_SelectedItemInventorySlotIndex], a
  call GetMedalAddress
  ld a, [de]
  and $80
  jr z, .medalSearchRightLoop
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 1
  jr nz, .exitSearchRightLoop
  ld a, [de]
  and $40
  jr nz, .medalSearchRightLoop

.exitSearchRightLoop
  call DisplayMedalDescriptionForMedalSubscreen
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  call MapMedalAttributeForMedalSubscreen
  call MapMedalPersonalityForMedalSubscreen
  call MapMedalCompatibilityForMedalSubscreen
  call MapUndefinedMedalStat
  call MapUndefinedMedalString
  ld hl, $984B
  call MapSelectedMedalName
  ld hl, $9890
  call MapSelectedMedalLevel
  ld hl, $98EE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $41
  call $4A82
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

MapMedalMedaforceForMedalSubscreen::
  call GetMedalAddress

.checkSlotA
  ld hl, 5
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotAEmpty
  push de
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 9
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98C2
  ld bc, W_ListItemBufferArea
  ld a, 8
  call PutStringFixedLength
  pop de
  jr .checkSlotB

.slotAEmpty
  ld hl, $98C2
  ld b, 8
  call MedalMenuMapDashes

.checkSlotB
  ld hl, 6
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotBEmpty
  push de
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 9
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $9902
  ld bc, W_ListItemBufferArea
  ld a, 8
  call PutStringFixedLength
  pop de
  jr .checkSlotC

.slotBEmpty
  ld hl, $9902
  ld b, 8
  call MedalMenuMapDashes

.checkSlotC
  ld hl, 7
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotCEmpty
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 9
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $9942
  ld bc, W_ListItemBufferArea
  ld a, 8
  jp PutStringFixedLength

.slotCEmpty
  ld hl, $9942
  ld b, 8
  jp MedalMenuMapDashes

MapMedalSelectedMedaforceInfoForMedalSubscreen::
  call GetMedalAddress
  ld hl, 5
  add hl, de
  ld b, 0
  ld a, [W_ItemActionSubSubStateIndex]
  ld c, a
  add hl, bc
  ld a, [hl]
  cp $FF
  jr z, .emptySlotSelected
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [$C546]
  ld hl, $98B0
  call $351D
  ld a, [$C543]
  ld hl, $9931
  ld b, 0
  call $3504
  ld a, [$C544]
  ld hl, $9970
  call $351D
  ld a, [$C547]
  or a
  jr z, .noStar
  ld a, $4B
  ld hl, $996F
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.emptySlotSelected
  ld hl, $98B0
  ld b, 3
  call MedalMenuMapDashes
  ld hl, $9931
  ld b, 2
  call MedalMenuMapDashes
  ld hl, $9970
  ld b, 3
  call MedalMenuMapDashes

.noStar
  xor a
  ld hl, $996F
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

MapMedalSelectedMedaforceSkillForMedalSubscreen::
  call GetMedalAddress
  ld hl, 5
  add hl, de
  ld b, 0
  ld a, [W_ItemActionSubSubStateIndex]
  ld c, a
  add hl, bc
  ld a, [hl]
  cp $FF
  jr z, .noSkill
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 1
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [W_ListItemBufferArea]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld b, 0

.countLoop
  ld a, [hli]
  cp $CB
  jr z, .exitLoop
  inc b
  jr .countLoop

.exitLoop
  ld a, 5
  sub b
  ld b, a
  ld hl, $992B

.rightAlignLoop
  ld a, b
  or a
  jr z, .mapText
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr .rightAlignLoop

.mapText
  ld bc, W_ListItemBufferArea
  jp PutStringVariableLength

.noSkill
  ld hl, $992B
  ld b, 5
  jp MedalMenuMapDashes

PrintMedalSelectedMedaforceDescriptionForMedalSubscreen::
  call WrapInitiateMainScriptAlternate
  call GetMedalAddress
  ld hl, 5
  add hl, de
  ld b, 0
  ld a, [W_ItemActionSubSubStateIndex]
  ld c, a
  add hl, bc
  ld a, [hl]
  cp $FF
  ret z
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [$C545]
  ld b, 0
  ld c, a
  ld a, 6
  jp WrapMainScriptProcessor

MedalsMedaforceSubscreenPageNavigationInputHandler::
  xor a
  ld [$C4EE], a
  ld a, [$C57E]
  cp 2
  ret c
  ld a, [$C520]
  and M_JPInputLeft
  jr z, .leftNotPressed

.medalSearchLeftLoop
  ld a, [W_SelectedItemInventorySlotIndex]
  sub 1
  jr nc, .dontWrapToRight
  ld a, $1D

.dontWrapToRight
  ld [W_SelectedItemInventorySlotIndex], a
  call GetMedalAddress
  ld a, [de]
  and $80
  jr z, .medalSearchLeftLoop
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 1
  jr nz, .exitSearchLeftLoop
  ld a, [de]
  and $40
  jr nz, .medalSearchLeftLoop

.exitSearchLeftLoop
  call PrintMedalSelectedMedaforceDescriptionForMedalSubscreen
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $984B
  call MapSelectedMedalName
  call MedalSubscreenDisplayArrows
  call MapMedalMedaforceForMedalSubscreen
  call MapMedalSelectedMedaforceInfoForMedalSubscreen
  call MapMedalSelectedMedaforceSkillForMedalSubscreen
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

.leftNotPressed
  ld a, [$C520]
  and M_JPInputRight
  ret z

.medalSearchRightLoop
  ld a, [W_SelectedItemInventorySlotIndex]
  inc a
  cp $1E
  jr nz, .dontWrapToLeft
  xor a

.dontWrapToLeft
  ld [W_SelectedItemInventorySlotIndex], a
  call GetMedalAddress
  ld a, [de]
  and $80
  jr z, .medalSearchRightLoop
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 1
  jr nz, .exitSearchRightLoop
  ld a, [de]
  and $40
  jr nz, .medalSearchRightLoop

.exitSearchRightLoop
  call PrintMedalSelectedMedaforceDescriptionForMedalSubscreen
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $984B
  call MapSelectedMedalName
  call MedalSubscreenDisplayArrows
  call MapMedalMedaforceForMedalSubscreen
  call MapMedalSelectedMedaforceInfoForMedalSubscreen
  call MapMedalSelectedMedaforceSkillForMedalSubscreen
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

MedalsMedaforceSubscreenItemSelectionInputHandler::
  xor a
  ld [$C4EE], a
  ld a, [$C520]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_ItemActionSubSubStateIndex]
  sub 1
  jr nc, .dontWrapToBottom
  ld a, 2

.dontWrapToBottom
  ld [W_ItemActionSubSubStateIndex], a
  call MapMedalSelectedMedaforceInfoForMedalSubscreen
  call MapMedalSelectedMedaforceSkillForMedalSubscreen
  call PrintMedalSelectedMedaforceDescriptionForMedalSubscreen
  call PositionSelectionArrowForMedalMedaforceSubscreen
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

.upNotPressed
  ld a, [$C520]
  and M_JPInputDown
  ret z
  ld a, [W_ItemActionSubSubStateIndex]
  inc a
  cp 3
  jr nz, .dontWrapToTop
  xor a

.dontWrapToTop
  ld [W_ItemActionSubSubStateIndex], a
  call MapMedalSelectedMedaforceInfoForMedalSubscreen
  call MapMedalSelectedMedaforceSkillForMedalSubscreen
  call PrintMedalSelectedMedaforceDescriptionForMedalSubscreen
  call PositionSelectionArrowForMedalMedaforceSubscreen
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

DisplaySelectionArrowForMedalMedaforceSubscreen::
  call PositionSelectionArrowForMedalMedaforceSubscreen
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

PositionSelectionArrowForMedalMedaforceSubscreen::
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
  ld a, [W_ItemActionSubSubStateIndex]
  sla a
  sla a
  sla a
  sla a
  add $30
  ld [$C0C4], a
  ret

MapSkillsForMedalSubscreenLeftColumn::
  call GetMedalAddress
  push de
  ld hl, $19
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98A1
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  push de
  ld hl, $1A
  add hl, de
  ld a, [hl]
  ld hl, $98A7
  ld b, 0
  call $3504
  pop de
  ld hl, $1B
  add hl, de
  ld a, [hl]
  ld hl, $98C1
  call MapSkillBarForMedalSubscreen
  push de
  ld hl, $1D
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98E1
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  push de
  ld hl, $1E
  add hl, de
  ld a, [hl]
  ld hl, $98E7
  ld b, 0
  call $3504
  pop de
  ld hl, $1F
  add hl, de
  ld a, [hl]
  ld hl, $9901
  call MapSkillBarForMedalSubscreen
  push de
  ld hl, $21
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $9921
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  push de
  ld hl, $22
  add hl, de
  ld a, [hl]
  ld hl, $9927
  ld b, 0
  call $3504
  pop de
  ld hl, $23
  add hl, de
  ld a, [hl]
  ld hl, $9941
  jp MapSkillBarForMedalSubscreen

MapSkillBarForMedalSubscreen::
  push de
  push hl
  ld hl, .table
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld d, h
  ld e, l
  pop hl
  ld b, 8

.loop
  ld a, [de]
  inc de
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  pop de
  ret

.table
  db $42,$42,$42,$42,$42,$42,$42,$42
  db $45,$42,$42,$42,$42,$42,$42,$42
  db $45,$45,$42,$42,$42,$42,$42,$42
  db $45,$45,$45,$42,$42,$42,$42,$42
  db $45,$45,$45,$45,$42,$42,$42,$42
  db $45,$45,$45,$45,$45,$42,$42,$42
  db $45,$45,$45,$45,$45,$45,$42,$42
  db $45,$45,$45,$45,$45,$45,$45,$42
  db $45,$45,$45,$45,$45,$45,$45,$45

MapSkillsForMedalSubscreenRightColumn::
  call GetMedalAddress
  ld hl, $24
  add hl, de
  ld a, [hli]
  cp $FF
  jr z, .skillASlotEmpty
  push de
  ld a, [hli]
  ld b, $50
  ld c, $29
  ld de, $C1E0
  call DisplaySkillIndicatorSpriteForMedalSubscreen
  pop de
  push de
  ld hl, $25
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98AB
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  push de
  ld hl, $26
  add hl, de
  ld a, [hl]
  ld hl, $98B1
  ld b, 0
  call $3504
  pop de
  ld hl, $27
  add hl, de
  ld a, [hl]
  ld hl, $98CB
  call MapAdvancedSkillBarForMedalSubscreen
  jr .checkSkillBSlot

.skillASlotEmpty
  ld a, 0
  ld [$C1E0], a
  ld hl, $98AB
  ld b, 5
  call MedalMenuMapDashes
  ld hl, $98B1
  ld b, 2
  call MedalMenuMapDashes
  ld hl, $98CB
  call MedalMenuMapEmptySkillBar

.checkSkillBSlot
  ld hl, $28
  add hl, de
  ld a, [hli]
  cp $FF
  jr z, .skillBSlotEmpty
  push de
  ld a, [hli]
  ld b, $50
  ld c, $39
  ld de, $C200
  call DisplaySkillIndicatorSpriteForMedalSubscreen
  pop de
  push de
  ld hl, $29
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $98EB
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  push de
  ld hl, $2A
  add hl, de
  ld a, [hl]
  ld hl, $98F1
  ld b, 0
  call $3504
  pop de
  ld hl, $2B
  add hl, de
  ld a, [hl]
  ld hl, $990B
  call MapAdvancedSkillBarForMedalSubscreen
  jr .checkSkillCSlot

.skillBSlotEmpty
  ld a, 0
  ld [$C200], a
  ld hl, $98EB
  ld b, 5
  call MedalMenuMapDashes
  ld hl, $98F1
  ld b, 2
  call MedalMenuMapDashes
  ld hl, $990B
  call MedalMenuMapEmptySkillBar

.checkSkillCSlot
  ld hl, $2C
  add hl, de
  ld a, [hli]
  cp $FF
  jr z, .skillCSlotEmpty
  push de
  ld a, [hli]
  ld b, $50
  ld c, $49
  ld de, $C220
  call DisplaySkillIndicatorSpriteForMedalSubscreen
  pop de
  push de
  ld hl, $2D
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $992B
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  push de
  ld hl, $2E
  add hl, de
  ld a, [hl]
  ld hl, $9931
  ld b, 0
  call $3504
  pop de
  ld hl, $2F
  add hl, de
  ld a, [hl]
  ld hl, $994B
  jp MapAdvancedSkillBarForMedalSubscreen

.skillCSlotEmpty
  ld a, 0
  ld [$C220], a
  ld hl, $992B
  ld b, 5
  call MedalMenuMapDashes
  ld hl, $9931
  ld b, 2
  call MedalMenuMapDashes
  ld hl, $994B
  jp MedalMenuMapEmptySkillBar

DisplaySkillIndicatorSpriteForMedalSubscreen::
  push af
  ld a, 1
  ld [de], a
  ld hl, 1
  add hl, de
  ld a, 0
  ld [hl], a
  ld hl, 2
  add hl, de
  ld [hl], $C7
  pop af
  push bc
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld hl, 5
  add hl, de
  ld [hl], a
  pop bc
  ld hl, 3
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.table
  db 0,2,0,2,1,1,3,3,5,5

MapAdvancedSkillBarForMedalSubscreen::
  push de
  push hl
  ld hl, .table
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld d, h
  ld e, l
  pop hl
  ld b, 8

.loop
  ld a, [de]
  inc de
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  pop de
  ret

.table
  db $43,$43,$43,$43,$43,$43,$43,$43
  db $47,$43,$43,$43,$43,$43,$43,$43
  db $49,$43,$43,$43,$43,$43,$43,$43
  db $49,$47,$43,$43,$43,$43,$43,$43
  db $49,$49,$43,$43,$43,$43,$43,$43
  db $49,$49,$47,$43,$43,$43,$43,$43
  db $49,$49,$49,$43,$43,$43,$43,$43
  db $49,$49,$49,$47,$43,$43,$43,$43
  db $49,$49,$49,$49,$43,$43,$43,$43
  db $49,$49,$49,$49,$47,$43,$43,$43
  db $49,$49,$49,$49,$49,$43,$43,$43
  db $49,$49,$49,$49,$49,$47,$43,$43
  db $49,$49,$49,$49,$49,$49,$43,$43
  db $49,$49,$49,$49,$49,$49,$47,$43
  db $49,$49,$49,$49,$49,$49,$49,$43
  db $49,$49,$49,$49,$49,$49,$49,$47
  db $49,$49,$49,$49,$49,$49,$49,$49

MedalMenuMapEmptySkillBar::
  ld b, 8
  ld a, $67

.loop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  ret

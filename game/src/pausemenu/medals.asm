INCLUDE "game/src/common/constants.asm"

SECTION "Medal Variables 1",  WRAM0[$C489]
W_MedalMenuOptionBoxSelectedItemForProcessing:: ds 1
W_MedalMenuWaitTimer:: ds 1

SECTION "Medal Variables 2",  WRAM0[$C48C]
W_MedalMenuSkillBarAnimationStage:: ds 1

SECTION "Medal Variables 3",  WRAM0[$C564]
W_MedalMenuSelectedMedaliaSlot:: ds 1
W_MedalMenuSelectedMedaliaCursorPosition:: ds 1

SECTION "Medal Variables 4",  WRAM0[$C57E]
W_MedalMenuNumberOfMedals:: ds 1
W_MedalMenuCurrentScreen:: ds 1

SECTION "Medal Variables 5",  WRAM0[$C58E]
W_MedalMenuMedaliaListOffsetIndex:: ds 1
W_MedalMenuNumberOfMedalia:: ds 1
W_MedalMenuMedaliaListLineToBuffer:: ds 1
W_MedalMenuNumberOfNonEmptyTextMedaliaLinesOnScreen:: ds 1

SECTION "Medal Menu Helper Functions 1", ROMX[$47E6], BANK[$02]
CountMedals::
  ld a, 5
  rst 8
  ld hl, $D120
  ld b, $1E
  ld c, 0

.loop
  ld a, [hl]
  and $80
  jr z, .slotEmpty
  inc c

.slotEmpty
  ld de, $40
  add hl, de
  dec b
  jr nz, .loop
  ld a, c
  ld [W_MedalMenuNumberOfMedals], a
  ret

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

MapMedalIcons::
  ld bc, $204
  ld e, $37
  ld a, 0
  jp WrapDecompressTilemap0

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

SECTION "Medal Menu Helper Functions 2", ROMX[$4A82], BANK[$02]
DisplayTinpetSpriteAssociatedWithMedal::
  ld a, b
  ld [$C4F6], a
  ld a, c
  ld [$C4F7], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 5
  rst 8
  ld hl, $D120
  ld b, 0
  ld a, [W_SelectedItemInventorySlotIndex]
  ld c, a
  ld a, 6
  call $1446
  ld hl, 0
  add hl, de
  ld a, [hl]
  and $40
  jr z, .noTinpetAssociatedWithMedal
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld [$C4EE], a
  ld de, $D000
  xor a
  ld [$C4F4], a

.associationSearchLoop
  ld a, [de]
  cp 2
  jr c, .nextPlease
  cp 3
  jr z, .hasHeadPart

.noHeadPart
  ld hl, 2
  add hl, de
  ld a, [hl]
  ld b, a
  ld a, [$C4EE]
  cp b
  jp z, .displaySpriteWithoutHeadPart
  jr .nextPlease

.hasHeadPart
  ld hl, 2
  add hl, de
  ld a, [hl]
  ld b, a
  ld a, [$C4EE]
  cp b
  jp z, .displaySpriteWithHeadPart

.nextPlease
  ld hl, $10
  add hl, de
  ld d, h
  ld e, l
  ld a, [$C4F4]
  inc a
  ld [$C4F4], a
  cp 9
  jr nz, .associationSearchLoop

.noTinpetAssociatedWithMedal
  ld a, 0
  ld [$C140], a
  ret

.displaySpriteWithoutHeadPart
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld [$C4F0], a
  ld a, $11
  ld [$C140], a
  ld a, $44
  ld [$C141], a
  ld a, [$C4F0]
  sla a
  add 0
  ld [$C142], a
  ld a, [$C4F6]
  ld [$C143], a
  ld a, [$C4F7]
  ld [$C144], a
  ld a, 1
  ld [$C145], a
  ld a, [$C4F0]
  or a
  ret z
  ld a, 5
  ld [$C145], a
  ret

.displaySpriteWithHeadPart
  ld hl, 6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 3
  push de
  call $34FF
  pop de
  ld a, $11
  ld [$C140], a
  ld a, $44
  ld [$C141], a
  ld a, [$C553]
  sub $50
  sla a
  sla a
  add $10
  ld [$C142], a
  ld a, [$C4F6]
  ld [$C143], a
  ld a, [$C4F7]
  ld [$C144], a
  ld a, [$C553]
  sub $50
  add $2D
  call $34B7
  ld [$C145], a
  ret

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

LoadMedalImagePalettes::
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  ret z
  ld hl, 1
  add hl, de
  ld a, [hl]
  call $35B4
  ld hl, $110
  ld c, b
  ld b, 0
  add hl, bc
  ld b, h
  ld c, l
  ld a, 4
  push bc
  call CGBLoadSingleBGPPaletteIndex
  pop bc
  ld hl, 8
  add hl, bc
  ld b, h
  ld c, l
  ld a, 5
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ret

CalculateMedalImagePaletteIndex::
  call GetMedalAddress
  call CheckMedalOwnership
  or a
  ret z
  ld hl, 1
  add hl, de
  ld a, [hl]
  call $35B4
  ld hl, $110
  ld c, b
  ld b, 0
  add hl, bc
  ld b, h
  ld c, l
  ret

MedalListAnimateArrows::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, MedalListDisplayArrows
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

MedalListDisplayArrows::
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A2
  ld [$C0E2], a
  ld a, $28
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

MedalListDisplaySelectorArrow::
  call MedalListPositionSelectorArrow
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

MedalListPositionSelectorArrow::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  ld a, 7
  ld [$C0C5], a
  ld a, 8
  ld [$C0C3], a
  ld a, [W_CurrentPageItemSelectionIndex]
  sla a
  sla a
  sla a
  sla a
  add $28
  ld [$C0C4], a
  ret

MedalListItemNavigationInputHandler::
  ld a, [$C520]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_CurrentPageItemSelectionIndex]
  sub 1
  jr nc, .dontLoopToListEnd
  ld a, 5

.dontLoopToListEnd
  ld [W_CurrentPageItemSelectionIndex], a
  call CalculateMedalMenuPageOffset
  ld hl, $992B
  call MapSelectedMedalName
  ld hl, $9970
  call MapSelectedMedalLevel
  ld hl, $99CE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $79
  call DisplayTinpetSpriteAssociatedWithMedal
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $C00
  call MapMedalImage
  call MedalListPositionSelectorArrow
  call LoadMedalImagePalettes
  call $62A6
  ld a, 2
  call $27DA
  ret

.upNotPressed
  ld a, [$C520]
  and M_JPInputDown
  ret z
  ld a, [W_CurrentPageItemSelectionIndex]
  inc a
  cp 6
  jr c, .dontLoopToListStart
  xor a

.dontLoopToListStart
  ld [W_CurrentPageItemSelectionIndex], a
  call CalculateMedalMenuPageOffset
  ld hl, $992B
  call MapSelectedMedalName
  ld hl, $9970
  call MapSelectedMedalLevel
  ld hl, $99CE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $79
  call DisplayTinpetSpriteAssociatedWithMedal
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $C00
  call MapMedalImage
  call MedalListPositionSelectorArrow
  call LoadMedalImagePalettes
  call $62A6
  ld a, 2
  call $27DA
  ret

MedalListPageNavigationInputHandler::
  xor a
  ld [$C4EE], a
  ld a, [$C520]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, [W_CurrentItemPage]
  dec a
  jr nz, .dontLoopToEnd
  ld a, 5

.dontLoopToEnd
  ld [W_CurrentItemPage], a
  call CalculateMedalMenuPageOffset
  call MapMedalMenuPageNumber
  call DrawMedalIcons
  call MapMedalIcons
  call MapMedalNamesForMenu
  ld hl, $992B
  call MapSelectedMedalName
  ld hl, $9970
  call MapSelectedMedalLevel
  ld hl, $99CE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $79
  call DisplayTinpetSpriteAssociatedWithMedal
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $C00
  call MapMedalImage
  call LoadMedalImagePalettes
  call $62A6
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

.leftNotPressed
  ld a, [$C520]
  and M_JPInputRight
  ret z
  ld a, [W_CurrentItemPage]
  inc a
  cp 6
  jr nz, .dontLoopToStart
  ld a, 1

.dontLoopToStart
  ld [W_CurrentItemPage], a
  call CalculateMedalMenuPageOffset
  call MapMedalMenuPageNumber
  call DrawMedalIcons
  call MapMedalIcons
  call MapMedalNamesForMenu
  ld hl, $992B
  call MapSelectedMedalName
  ld hl, $9970
  call MapSelectedMedalLevel
  ld hl, $99CE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $79
  call DisplayTinpetSpriteAssociatedWithMedal
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $C00
  call MapMedalImage
  call LoadMedalImagePalettes
  call $62A6
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

MedalListSortItemInputHandler::
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  ret z
  ld a, [W_ItemActionSubSubSubStateIndex]
  cp $80
  jr nc, .changeOrder
  ld a, [W_SelectedItemInventorySlotIndex]
  add $80
  ld [W_ItemActionSubSubSubStateIndex], a
  ld a, 2
  call $27DA
  ret

.changeOrder
  ld a, [W_SelectedItemInventorySlotIndex]
  ld b, a
  ld a, [W_ItemActionSubSubSubStateIndex]
  and $7F
  cp b
  jr z, .targetMatchesDestination
  ld a, 5
  rst 8
  ld hl, $D120
  ld b, 0
  ld a, [W_SelectedItemInventorySlotIndex]
  ld c, a
  ld a, 6
  call $1446
  push hl
  ld hl, $D120
  ld b, 0
  ld a, [W_ItemActionSubSubSubStateIndex]
  and $7F
  ld c, a
  ld a, 6
  call $1446
  pop hl
  ld bc, $40
  call $1546
  call DrawMedalIcons
  call MapMedalIcons
  call MapMedalNamesForMenu
  ld hl, $992B
  call MapSelectedMedalName
  ld hl, $9970
  call MapSelectedMedalLevel
  ld hl, $99CE
  call MapSelectedMedalExpToNextLevel
  ld b, $88
  ld c, $79
  call DisplayTinpetSpriteAssociatedWithMedal
  call DrawMedalImageLetter
  call DrawMedalImage
  ld bc, $C00
  call MapMedalImage
  call LoadMedalImagePalettes
  call $62A6
  ld a, 2
  call $27DA

.targetMatchesDestination
  ld de, $C120
  call $341B
  xor a
  ld [W_ItemActionSubSubSubStateIndex], a
  ld a, 2
  call $27DA
  ret

MedalListDisplaySortingArrow::
  ld a, [W_ItemActionSubSubSubStateIndex]
  cp $80
  jr nc, .arrowMaybe

.noArrow
  ld a, 0
  ld [$C120], a
  ret

.arrowMaybe
  and $7F
  ld h, 0
  ld l, a
  ld bc, 6
  call DigitCalculationLoop
  ld a, [$C4EE]
  inc a
  ld b, a
  ld a, [W_CurrentItemPage]
  cp b
  jr nz, .noArrow
  ld a, 1
  ld [$C120], a
  ld a, 0
  ld [$C121], a
  ld a, $CB
  ld [$C122], a
  ld a, 6
  ld [$C125], a
  ld a, 7
  ld [$C123], a
  ld a, [W_TilemapPointerTableIndex]
  ld b, a
  sla a
  sla a
  sla a
  sla a
  add $27
  ld [$C124], a
  ret

MedalMenuRestoreIkkiOverlay::
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

MedalMenuRestorePausemenuArrowPlaceholder::
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

MedalPreOptionBoxInputCheck::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  ld a, 5
  rst 8
  ld hl, $D120
  ld b, 0
  ld a, [W_SelectedItemInventorySlotIndex]
  ld c, a
  ld a, 6
  call $1446
  ld hl, 0
  add hl, de
  ld a, [hl]
  and $80
  jr z, .emptySlotFound
  ld a, 1
  ld [$C4EE], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $CC
  ld [$C0C2], a
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ld [$C120], a
  xor a
  ld [$C48D], a
  ld a, 3
  call $27DA
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
  ld a, [W_MedalMenuCurrentScreen]
  cp 1
  jr nz, .notAbilitySubscreen
  ld a, 0
  ld [$C140], a
  ld a, 1
  ld [W_OAM_SpritesReady], a

.notAbilitySubscreen
  ld a, [W_MedalMenuCurrentScreen]
  or a
  ret nz
  ld a, [W_TransportOptionSubSubSubStateIndex]
  cp 2
  jr z, .notInLinkMode
  ld a, 0
  ld [$C1E0], a
  ld [$C200], a
  ld [$C220], a

.notInLinkMode
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.emptySlotFound
  ld a, 5
  call $27DA
  ret

MapMedalOptionsBox::
  xor a
  ld [$C4EE], a
  ld a, [$C48D]
  add $18
  ld c, a
  ld b, $B
  ld a, [W_MedalMenuCurrentScreen]
  add $3D
  ld e, a
  ld a, 0
  push bc
  call WrapDecompressTilemap0
  pop bc
  ld e, $3D
  ld a, 0
  call WrapDecompressAttribmap0
  ld a, [$C48D]
  inc a
  ld [$C48D], a
  cp 9
  ret nz
  xor a
  ld [$C48D], a
  ld a, 1
  ld [$C4EE], a
  ret

MedalOptionsBoxPlaceCursor::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C160], a
  ld a, $44
  ld [$C161], a
  ld a, 4
  ld [$C162], a
  ld a, $60
  ld [$C163], a
  ld a, [$C48D]
  sla a
  sla a
  sla a
  sla a
  add $11
  ld [$C164], a
  ret

MedalOptionsBoxInputHandler::
  xor a
  ld [W_MedalMenuOptionBoxSelectedItemForProcessing], a
  call MedalOptionsBoxPlaceCursor
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, [$C48D]
  inc a
  ld [W_MedalMenuOptionBoxSelectedItemForProcessing], a
  ld a, 5
  ld [$C162], a
  ld a, 3
  call $27DA
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jr z, .bNotPressed
  ld b, 9
  ld c, 9
  ld hl, $980B
  call $25E5
  ld a, $B
  ld [$C4EE], a
  ld a, 9
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, 9
  ld [$C4F1], a
  ld a, 0
  call $123B
  ld a, 4
  call $27DA
  ld a, 7
  ld [$C0C5], a
  ld de, $C160
  call $341B
  ld a, 4
  ld [W_MedalMenuOptionBoxSelectedItemForProcessing], a
  ld a, [W_MedalMenuCurrentScreen]
  or a
  ret nz
  call $62A6
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.bNotPressed
  ld a, [$C520]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [$C48D]
  sub 1
  jr nc, .dontLoopToEnd
  ld a, 2

.dontLoopToEnd
  ld [$C48D], a
  ld a, 2
  call $27DA
  ret

.upNotPressed
  ld a, [$C520]
  and M_JPInputDown
  ret z
  ld a, [$C48D]
  inc a
  cp 3
  jr nz, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [$C48D], a
  ld a, 2
  call $27DA
  ret

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
  ld a, [W_MedalMenuNumberOfMedals]
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
  ld a, [W_MedalMenuNumberOfMedals]
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
  ld a, [W_MedalMenuNumberOfMedals]
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
  call DisplayTinpetSpriteAssociatedWithMedal
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
  call DisplayTinpetSpriteAssociatedWithMedal
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
  ld a, [W_MedalMenuNumberOfMedals]
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
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
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
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
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
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
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

DisplayMedaliaIndicatorSpriteForMedalSubscreen::
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

MapSkillBarAttributesForMedalSubscreen::
  call GetMedalAddress
  push de
  ld hl, $19
  add hl, de
  ld d, h
  ld e, l
  ld b, 3
  ld hl, $98C1

.leftBarsLoop
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ld a, [de]
  push bc
  push hl
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  pop hl
  ld c, 8
  push hl

.leftBarAttributeMappingLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec c
  jr nz, .leftBarAttributeMappingLoop

  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop hl
  ld bc, $40
  add hl, bc
  inc de
  inc de
  inc de
  inc de
  pop bc
  dec b
  jr nz, .leftBarsLoop

  pop de
  ld hl, $24
  add hl, de
  ld d, h
  ld e, l
  ld b, 3
  ld hl, $98CB

.rightBarsLoop
  push bc
  ld a, [de]
  cp $FF
  jr z, .barIsEmpty
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  push de
  inc de
  ld a, [de]
  pop de
  push hl
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  pop hl
  ld c, 8
  push hl

.rightBarAttributeMappingLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec c
  jr nz, .rightBarAttributeMappingLoop

  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop hl

.barIsEmpty
  ld bc, $40
  add hl, bc
  inc de
  inc de
  inc de
  inc de
  pop bc
  dec b
  jr nz, .rightBarsLoop
  ret

.table
  db 1,2,1,2,3,3,4,4,5,5

MedalsSkillLevelSubscreenPageNavigationInputHandler::
  xor a
  ld [$C4EE], a
  ld a, [W_MedalMenuNumberOfMedals]
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
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $984B
  call MapSelectedMedalName
  call MapSkillsForMedalSubscreenLeftColumn
  call MapSkillsForMedalSubscreenRightColumn
  call MapSkillBarAttributesForMedalSubscreen
  call $5AED
  call $5C74
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
  call DrawMedalIconForMedalSubscreen
  call MapMedalIconForMedalSubscreen
  call MapMedalNameForMedalSubscreen
  ld hl, $984B
  call MapSelectedMedalName
  call MapSkillsForMedalSubscreenLeftColumn
  call MapSkillsForMedalSubscreenRightColumn
  call MapSkillBarAttributesForMedalSubscreen
  call $5AED
  call $5C74
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call $27DA
  ret

AnimateMedalSkillBarSegments::
  ld a, [W_MedalMenuSkillBarAnimationStage]
  ld hl, .table
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hl]
  ld b, a
  ld a, [W_MedalMenuWaitTimer]
  cp b
  jr z, .finishedWaiting
  inc a
  ld [W_MedalMenuWaitTimer], a
  ret

.finishedWaiting
  inc hl
  ld a, [hli]
  ld [$C4EE], a
  ld a, [hli]
  ld [$C4EF], a
  ld a, [hli]
  ld [$C4F0], a
  ld a, [$C4EE]
  ld [W_ListItemIndexForBuffering], a
  ld a, 1
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $10
  ld hl, $9450
  call $34E1
  ld a, [$C4EF]
  ld [W_ListItemIndexForBuffering], a
  ld a, 1
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $10
  ld hl, $9470
  call $34E1
  ld a, [$C4F0]
  ld [W_ListItemIndexForBuffering], a
  ld a, 1
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $10
  ld hl, $9490
  call $34E1
  xor a
  ld [W_MedalMenuWaitTimer], a
  ld a, [W_MedalMenuSkillBarAnimationStage]
  inc a
  ld [W_MedalMenuSkillBarAnimationStage], a
  cp 4
  ret nz
  xor a
  ld [W_MedalMenuSkillBarAnimationStage], a
  ret

.table
  db $B4,1,3,5
  db $05,0,2,4
  db $05,1,3,5
  db $05,0,2,4

SECTION "Medal Menu Helper Functions 3", ROMX[$5C58], BANK[$02]
MapAttributeToSkillName::
  push af
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop af
  ld b, 8

.loop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ret

SECTION "Medal Menu Helper Functions 4", ROMX[$5D82], BANK[$02]
DisplayMedaliaIndicatorSpritesForMedaliaSubscreen::
  call GetMedalAddress
  ld hl, $24
  add hl, de
  ld a, [hli]
  cp $FF
  jr z, .medaliaSlotAEmpty
  push de
  ld a, [hli]
  ld b, $11
  ld c, $5A
  ld de, $C1E0
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
  pop de
  jr .checkMedaliaSlotB

.medaliaSlotAEmpty
  ld a, 0
  ld [$C1E0], a

.checkMedaliaSlotB
  ld hl, $28
  add hl, de
  ld a, [hli]
  cp $FF
  jr z, .medaliaSlotBEmpty
  push de
  ld a, [hli]
  ld b, $24
  ld c, $62
  ld de, $C200
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
  pop de
  jr .checkMedaliaSlotC

.medaliaSlotBEmpty
  ld a, 0
  ld [$C200], a

.checkMedaliaSlotC
  ld hl, $2C
  add hl, de
  ld a, [hli]
  cp $FF
  jr z, .medaliaSlotCEmpty
  push de
  ld a, [hli]
  ld b, $37
  ld c, $5A
  ld de, $C220
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
  pop de
  ret

.medaliaSlotCEmpty
  ld a, 0
  ld [$C220], a
  ret

DisplayMedaliaInCurrentlySelectedSlot::
  call GetMedalAddress
  ld hl, $24
  add hl, de
  ld b, 0
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  cp $FF
  jr z, .slotIsEmpty
  ld a, [hl]
  push hl
  ld hl, $99E1
  call DisplaySkillNameForMedaliaSubscreen
  pop hl
  ld a, [hli]
  push hl
  push de
  ld b, $30
  ld c, $78
  ld de, $C240
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
  pop de
  pop hl
  ld a, [hli]
  push hl
  push de
  ld hl, $99E7
  ld b, 0
  call $3504
  pop de
  pop hl
  ld a, [hl]
  push hl
  ld hl, $9A01
  call MapAdvancedSkillBarForMedalSubscreen
  pop hl
  dec hl
  dec hl
  ld a, [hl]
  ld hl, $9A01
  jp MapSkillBarAttributesForSingleMedalia

.slotIsEmpty
  ld hl, $99E1
  ld b, 5
  call MedalMenuMapDashes
  ld a, 0
  ld [$C240], a
  ld hl, $99E7
  ld b, 2
  call MedalMenuMapDashes
  ld hl, $9A01
  call MedalMenuMapEmptySkillBar
  ld a, $A
  ld hl, $9A01
  jp MapSkillBarAttributesForSingleMedalia

DisplaySkillNameForMedaliaSubscreen::
  push de
  push hl
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  pop de
  ret

MapSkillBarAttributesForSingleMedalia::
  push hl
  push af
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop af
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld c, 8
  pop hl

.loop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei 
  dec c
  jr nz, .loop
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ret

.table
  db 0,1,0,1,2,2,3,3,7,7,0

CountMedalia::
  ld a, 5
  rst 8
  xor a
  ld [W_MedalMenuNumberOfMedalia], a
  ld hl, $D8A0

.loop
  ld a, [hl]
  and $80
  ret z
  ld bc, 4
  add hl, bc
  ld a, [W_MedalMenuNumberOfMedalia]
  inc a
  ld [W_MedalMenuNumberOfMedalia], a
  cp $1E
  jr nz, .loop
  ret

PopulateMedaliaList::
  ld a, 5
  rst 8
  xor a
  ld [W_MedalMenuMedaliaListLineToBuffer], a
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  or a
  jr nz, .notFirstLine
  call GetMedaliaListItemMappingAddress
  push hl
  push hl
  ld de, .emptyTextString
  ld c, 2

.emptyOptionTextLineLoop
  ld b, 8

.emptyOptionTextMappingLoop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .emptyOptionTextMappingLoop
  dec c
  jr z, .emptyOptionTextExitLoop
  pop hl
  push bc
  ld bc, $20
  add hl, bc
  pop bc
  jr .emptyOptionTextLineLoop

.emptyOptionTextExitLoop
  call GetMedalAddress
  ld hl, $24
  add hl, de
  ld b, 0
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  cp $FF
  jr z, .slotAlreadyEmpty
  pop hl
  ld a, 8
  call MapAttributeToSkillName
  jr .populateSubsequentLines

.slotAlreadyEmpty
  pop hl
  ld a, $E
  call MapAttributeToSkillName

.populateSubsequentLines
  ld a, 0
  ld [$C260], a
  ld a, [W_MedalMenuMedaliaListLineToBuffer]
  inc a
  ld [W_MedalMenuMedaliaListLineToBuffer], a

.notFirstLine
  xor a
  ld [W_MedalMenuNumberOfNonEmptyTextMedaliaLinesOnScreen], a

.loop
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  or a
  jr z, .noDecA
  dec a

.noDecA
  ld h, 0
  ld l, a
  ld a, [W_MedalMenuNumberOfNonEmptyTextMedaliaLinesOnScreen]
  ld b, 0
  ld c, a
  add hl, bc
  sla l
  rl h
  sla l
  rl h
  ld bc, $D8A0
  add hl, bc
  ld a, [hl]
  and $80
  jp z, .noMedaliaFound
  ld a, [hli]
  ld [$C4F8], a
  ld a, [hli]
  ld [$C4F2], a
  ld a, [hli]
  ld [$C4F4], a
  ld a, [hli]
  ld [$C4F6], a
  call GetMedaliaListItemMappingAddress
  push hl
  ld a, [$C4F8]
  and $7F
  call CheckIfMedaliaInUse
  or a
  jr nz, .alreadyAssignedToSlot
  pop hl
  push hl
  ld a, 8
  call MapAttributeToSkillName
  jr .displayMedaliaInfo

.alreadyAssignedToSlot
  pop hl
  push hl
  ld a, $E
  call MapAttributeToSkillName

.displayMedaliaInfo
  pop hl
  push hl
  ld a, [$C4F2]
  call DisplaySkillNameForMedaliaSubscreen
  ld hl, $C260
  ld b, 0
  ld a, [W_MedalMenuMedaliaListLineToBuffer]
  ld c, a
  ld a, 5
  call $1446
  call GetMedaliaIndicatorSpritePositionForMedaliaSubscreen
  ld a, [$C4F2]
  call DisplayMedaliaIndicatorSpriteForMedalSubscreen
  pop hl
  push hl
  ld bc, 6
  add hl, bc
  ld a, [$C4F4]
  ld b, 0
  call $3504
  pop hl
  ld bc, $20
  add hl, bc
  push hl
  ld a, [$C4F6]
  call MapAdvancedSkillBarForMedalSubscreen
  pop hl
  ld a, [$C4F2]
  call MapSkillBarAttributesForSingleMedalia
  jr .continue

.noMedaliaFound
  ld hl, $C260
  ld b, 0
  ld a, [W_MedalMenuMedaliaListLineToBuffer]
  ld c, a
  ld a, 5
  call $1446
  ld a, 0
  ld [de], a
  call GetMedaliaListItemMappingAddress
  push hl
  ld b, 8
  ld c, 2
  call $25E5
  pop hl
  ld b, 8
  ld c, 2
  ld a, 0
  call $25FF

.continue
  ld a, [W_MedalMenuNumberOfNonEmptyTextMedaliaLinesOnScreen]
  inc a
  ld [W_MedalMenuNumberOfNonEmptyTextMedaliaLinesOnScreen], a
  ld a, [W_MedalMenuMedaliaListLineToBuffer]
  inc a
  ld [W_MedalMenuMedaliaListLineToBuffer], a
  cp 5
  jp nz, .loop
  ret

.emptyTextString
  db $51,$8E,$44,0,0,0,0,0 ; This is text, just fyi.
  db 0,0,0,0,0,0,0,0

GetMedaliaListItemMappingAddress::
  ld a, [W_MedalMenuMedaliaListLineToBuffer]
  ld hl, $98CB
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
  sla c
  rl b
  add hl, bc
  ret

GetMedaliaIndicatorSpritePositionForMedaliaSubscreen::
  ld b, $80
  ld a, [W_MedalMenuMedaliaListLineToBuffer]
  sla a
  sla a
  sla a
  sla a
  add $30
  ld c, a
  ret

CheckIfMedaliaInUse::
  ld [W_ItemPageRowIndex], a
  ld de, $D120
  ld a, $1E
  ld [$C4FD], a

.medalLoop
  ld a, [de]
  and $80
  jr z, $6062
  ld b, 3
  ld hl, $24
  add hl, de

.slotLoop
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  and $7F
  ld c, a
  ld a, [W_ItemPageRowIndex]
  cp c
  jr z, .matchFound

.slotEmpty
  inc hl
  inc hl
  inc hl
  inc hl
  dec b
  jr nz, .slotLoop
  ld hl, $40
  add hl, de
  ld d, h
  ld e, l
  ld a, [$C4FD]
  dec a
  ld [$C4FD], a
  jr nz, .medalLoop
  xor a
  ret

.matchFound
  ld a, 1
  ret

DisplayMedaliaSlotSelector::
  call PositionMedaliaSlotSelector
  ld a, $37
  ld b, 0
  ld de, $C0C0
  jp $33B2

PositionMedaliaSlotSelector::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  ld hl, .table
  ld b, 0
  ld a, [W_MedalMenuSelectedMedaliaSlot]
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
  db $0D,$56
  db $20,$5E
  db $33,$56

MedaliaSlotNavigationInputHandler::
  ld a, [$C520]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  sub 1
  jr nc, .dontLoopToEnd
  ld a, 2

.dontLoopToEnd
  ld [W_MedalMenuSelectedMedaliaSlot], a
  call DisplayMedaliaIndicatorSpritesForMedaliaSubscreen
  call DisplayMedaliaInCurrentlySelectedSlot
  call PopulateMedaliaList
  ld a, 2
  call $27DA
  jp PositionMedaliaSlotSelector

.leftNotPressed
  ld a, [$C520]
  and M_JPInputRight
  ret z
  ld a, [W_MedalMenuSelectedMedaliaSlot]
  inc a
  ld [W_MedalMenuSelectedMedaliaSlot], a
  cp 3
  jr nz, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [W_MedalMenuSelectedMedaliaSlot], a
  call DisplayMedaliaIndicatorSpritesForMedaliaSubscreen
  call DisplayMedaliaInCurrentlySelectedSlot
  call PopulateMedaliaList
  ld a, 2
  call $27DA
  jp PositionMedaliaSlotSelector

MedaliaSlotConfirmationInputHandler::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $CA
  ld [$C0C2], a
  xor a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld [W_MedalMenuMedaliaListOffsetIndex], a
  call DisplayMedaliaSelectionArrow
  ld a, 3
  call $27DA
  ld a, 1
  ld [$C4EE], a
  ret

DisplayMedaliaSelectionArrow::
  call PositionMedaliaSelectionArrow
  ld a, $36
  ld b, 0
  ld de, $C120
  jp $33B2

PositionMedaliaSelectionArrow::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C120], a
  ld a, 0
  ld [$C121], a
  ld a, 7
  ld [$C125], a
  ld a, $4F
  ld [$C123], a
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  sla a
  sla a
  sla a
  sla a
  add $30
  ld [$C124], a
  ret

MedaliaListNavigationInputHandler::
  ld a, [$C520]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  ld b, a
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  or b
  ret z
  ld a, 2
  call $27DA
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  or a
  jr z, .moveListDown

.moveCursorUp
  dec a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  jp PositionMedaliaSelectionArrow

.moveListDown
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  dec a
  ld [W_MedalMenuMedaliaListOffsetIndex], a
  jp PopulateMedaliaList

.upNotPressed
  ld a, [$C520]
  and M_JPInputDown
  ret z
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  ld b, a
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  add b
  ld b, a
  ld a, [W_MedalMenuNumberOfMedalia]
  cp b
  ret z
  ld a, 2
  call $27DA
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  cp 4
  jr z, .moveListUp

.moveCursorDown
  inc a
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  jp PositionMedaliaSelectionArrow

.moveListUp
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  inc a
  ld [W_MedalMenuMedaliaListOffsetIndex], a
  jp PopulateMedaliaList

AnimateVerticalMedaliaListArrows::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, DisplayVerticalMedaliaListArrows
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

DisplayVerticalMedaliaListArrows::
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  or a
  jr z, .skipTopArrow
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A0
  ld [$C0E2], a
  ld a, $58
  ld [$C0E3], a
  ld a, $28
  ld [$C0E4], a

.skipTopArrow
  ld a, [W_MedalMenuNumberOfMedalia]
  ld b, a
  ld a, [W_MedalMenuMedaliaListOffsetIndex]
  add 4
  cp b
  ret nc
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A1
  ld [$C102], a
  ld a, $58
  ld [$C103], a
  ld a, $80
  ld [$C104], a
  ret

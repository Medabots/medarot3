INCLUDE "game/src/common/constants.asm"

SECTION "Part Variables 1",  WRAM0[$C566]
W_CurrentPartTypeForListView:: ds 1
W_PartListCursorPosition:: ds 1
W_PartListPageNumber:: ds 1

SECTION "Part Variables 2",  WRAM0[$C56A]
W_MaxCursorPositionForPartsList:: ds 1

SECTION "Part Variables 3",  WRAM0[$C56C]
W_CurrentPartIndexForPartStatus:: ds 1

SECTION "Part Variables 4",  WRAM0[$C56F]
W_IsCurrentPartNotEmpty:: ds 1

SECTION "Part Helper Functions 1", ROMX[$6322], BANK[$06]
MapTypeNameForPartList::
  ld a, [W_CurrentPartTypeForListView]
  add $1A
  ld e, a
  ld bc, $C01
  ld a, 0
  jp WrapDecompressTilemap0

PartsListCalculatePageNumberAndCursorPosition::
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  ld bc, 4
  call DigitCalculationLoop
  ld a, [$C4EE]
  inc a
  ld [W_PartListPageNumber], a
  ld a, [$C4E1]
  ld [W_PartListCursorPosition], a
  ret

PartsListCalculatePartIndex::
  ld a, [W_PartListPageNumber]
  dec a
  ld b, a
  sla b
  sla b
  ld a, [W_PartListCursorPosition]
  add b
  ld [W_CurrentPartIndexForPartStatus], a
  ret

MapPageNumbersForPartsList::
  ld a, [W_PartListPageNumber]
  ld hl, $98CC
  ld b, 0
  call $3504
  ld a, $26
  ld hl, $98CF
  ld b, 1
  call $3504
  ret

MapPartModelNumbersForPartsList::
  call GetPartPageAddressInInventoryForPartList
  call GetPageOffsetForPartList
  ld a, 4
  ld [$C4F4], a
  ld a, [$C4E0]
  ld d, a
  ld a, [$C4E1]
  ld e, a
  ld a, $99
  ld [$C4E6], a
  ld a, $24
  ld [$C4E7], a

.loop
  ld hl, 0
  add hl, de
  ld a, [hli]
  ld b, a
  ld a, [hl]
  or b
  jr z, .emptySlot
  ld a, [W_CurrentPartTypeForListView]
  inc a
  ld b, a
  ld c, 7
  ld a, [$C4F2]
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, W_ListItemBufferArea
  push de
  call MapPartModelNumberForPartsList
  pop de
  ld a, $E7
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  jr .proceedtoNextPart

.emptySlot
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld b, 6
  ld a, $E6

.dashMappingLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .dashMappingLoop
  ld a, $E7
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei

.proceedtoNextPart
  ld a, [$C4F2]
  inc a
  ld [$C4F2], a
  ld a, $97
  ld b, a
  ld a, [$C4F2]
  cp b
  jr z, .oobSlot
  inc de
  inc de
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, $40
  add hl, bc
  ld a, h
  ld [$C4E6], a
  ld a, l
  ld [$C4E7], a
  ld a, [$C4F4]
  dec a
  ld [$C4F4], a
  jp nz, .loop
  ret

.oobSlot
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, 7
  xor a

.clearLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .clearLoop
  ret

GetPartPageAddressInInventoryForPartList::
  ld a, 7
  rst 8
  xor a
  ld [$C4EE], a
  ld a, [W_CurrentPartTypeForListView]
  ld hl, .table
  rst $30
  ld a, [W_PartListPageNumber]
  dec a
  sla a
  sla a
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, h
  ld [$C4E0], a
  ld a, l
  ld [$C4E1], a
  ret

.table
  dw $D000, $D12E, $D25C, $D38A

GetPageOffsetForPartList::
  ld a, [W_PartListPageNumber]
  dec a
  sla a
  sla a
  ld [$C4F2], a
  ret

MapPartModelNumberForPartsList::
  ld a, [bc]
  cp $CB
  ret z
  push hl
  sub $90
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  pop hl
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc bc
  jr MapPartModelNumberForPartsList

.table
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$CC,$CD
  db $CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD
  db $DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$00,$00,$00,$E6,$00

MapPartNamesForPartsList::
  call GetPartPageAddressInInventoryForPartList
  call GetPageOffsetForPartList
  ld a, 4
  ld [$C4F4], a
  ld a, [$C4E0]
  ld d, a
  ld a, [$C4E1]
  ld e, a
  ld a, $99
  ld [$C4E6], a
  ld a, $43
  ld [$C4E7], a

.loop
  ld hl, 0
  add hl, de
  ld a, [hli]
  ld b, a
  ld a, [hl]
  or b
  jr z, .slotEmpty
  ld a, [W_CurrentPartTypeForListView]
  inc a
  ld b, a
  ld c, 9
  ld a, [$C4F2]
  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, W_ListItemBufferArea
  ld a, 8
  push de
  call PutStringFixedLength
  pop de
  jr .nextSlot

.slotEmpty
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld b, 8
  ld a, $EE

.mapDashesLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .mapDashesLoop

.nextSlot
  ld a, [$C4F2]
  inc a
  ld [$C4F2], a
  ld a, $97
  ld b, a
  ld a, [$C4F2]
  cp b
  jr z, .oobSlot
  inc de
  inc de
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, $40
  add hl, bc
  ld a, h
  ld [$C4E6], a
  ld a, l
  ld [$C4E7], a
  ld a, [$C4F4]
  dec a
  ld [$C4F4], a
  jp nz, .loop
  ret

.oobSlot
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, 8
  xor a

.clearLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .clearLoop
  ret

MapPartQuantitiesForPartsList::
  call GetPartPageAddressInInventoryForPartList
  call GetPageOffsetForPartList
  ld a, 4
  ld [$C4F4], a
  ld a, [$C4E0]
  ld d, a
  ld a, [$C4E1]
  ld e, a
  ld a, $99
  ld [$C4E6], a
  ld a, $4C
  ld [$C4E7], a

.loop
  ld hl, 0
  add hl, de
  ld a, [hli]
  or a
  jr z, .slotEmpty
  push af
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld a, $3A
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  pop af
  call MapPartQuantityForPartsList
  inc hl
  inc hl
  ld a, $F5
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  ld hl, 1
  add hl, de
  ld a, [hli]
  pop hl
  call MapPartNumEquippedForPartsList
  inc hl
  ld a, $F6
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [W_CurrentPartTypeForListView]
  inc a
  ld b, a
  ld c, 1
  ld a, [$C4F2]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  push de
  call WrapBufferTextFromList
  pop de
  pop hl
  ld a, [W_ListItemBufferArea]
  or a
  jr z, .heartless
  ld a, $F3
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  jr .nextSlot

.heartless
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  jr .nextSlot

.slotEmpty
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $EE
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $EE
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $F5
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $EE
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $F6
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei

.nextSlot
  ld a, [$C4F2]
  inc a
  ld [$C4F2], a
  ld a, $97
  ld b, a
  ld a, [$C4F2]
  cp b
  jr z, .oobSlot
  inc de
  inc de
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, $40
  add hl, bc
  ld a, h
  ld [$C4E6], a
  ld a, l
  ld [$C4E7], a
  ld a, [$C4F4]
  dec a
  ld [$C4F4], a
  jp nz, .loop
  ret

.oobSlot
  ld a, [$C4E6]
  ld h, a
  ld a, [$C4E7]
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, 7
  xor a

.clearLoop
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .clearLoop
  ret

MapPartQuantityForPartsList::
  push hl
  push de
  push bc
  push hl
  call ParseThreeDigitNumberForMapping
  pop hl
  ld a, [$C4EF]
  and $F0
  swap a
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EF]
  and $F
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  pop bc
  pop de
  pop hl
  ret

MapPartNumEquippedForPartsList::
  push hl
  push de
  push bc
  push hl
  call ParseThreeDigitNumberForMapping
  pop hl
  ld a, [$C4EF]
  and $F
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  pop bc
  pop de
  pop hl
  ret

GetMaxCursorPositionForPartsList::
  ld a, [W_PartListPageNumber]
  cp $26
  jr z, .lastPage
  ld a, 3
  ld [W_MaxCursorPositionForPartsList], a
  ret

.lastPage
  ld a, 2
  ld [W_MaxCursorPositionForPartsList], a
  ret

PlaceCursorForPartsList::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  xor a
  ld [$C0C5], a
  ld a, 8
  ld [$C0C3], a
  ld a, [W_PartListCursorPosition]
  sla a
  sla a
  sla a
  sla a
  add $50
  ld [$C0C4], a
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

VerticalDirectionalInputHandlerForPartsList::
  xor a
  ld [$C4EE], a
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_PartListCursorPosition]
  sub 1
  jr nc, .dontLoopToEnd
  ld a, [W_MaxCursorPositionForPartsList]

.dontLoopToEnd
  ld [W_PartListCursorPosition], a
  sla a
  sla a
  sla a
  sla a
  add $50
  ld [$C0C4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 2
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  ret z
  ld a, [W_MaxCursorPositionForPartsList]
  inc a
  ld b, a
  ld a, [W_PartListCursorPosition]
  inc a
  cp b
  jr c, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [W_PartListCursorPosition], a
  sla a
  sla a
  sla a
  sla a
  add $50
  ld [$C0C4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 2
  call ScheduleSoundEffect
  ld a, 1
  ld [$C4EE], a
  ret

AnimatePageNavigationArrowsForPartsList::
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, .showArrows
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

.showArrows
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A2
  ld [$C0E2], a
  ld a, $50
  ld [$C0E3], a
  ld a, $30
  ld [$C0E4], a
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, $90
  ld [$C103], a
  ld a, $30
  ld [$C104], a
  ret

CheckIfPartSlotIsNotEmptyForPartsList::
  call GetPartPageAddressInInventoryForPartList
  ld a, [$C4E0]
  ld h, a
  ld a, [$C4E1]
  ld l, a
  ld a, [W_PartListCursorPosition]
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld d, h
  ld e, l
  ld hl, 0
  add hl, de
  ld a, [hli]
  ld b, a
  ld a, [hl]
  or b
  ret

DrawPartImageForPartsList::
  call PartIndexToPartImageIndexForPartsList
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

GetSelectedPartIndexForPartsList::
  call GetPageOffsetForPartList
  ld a, [$C4F2]
  ld b, a
  ld a, [W_PartListCursorPosition]
  add b
  ld [W_CurrentPartIndexForPartStatus], a
  ret

PartIndexToPartImageIndexForPartsList::
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

LoadPartPaletteForPartsList::
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

CheckIfPartSlotIsNotEmptyForPartsListExtended::
  call CheckIfPartSlotIsNotEmptyForPartsList
  or a
  jr nz, .notEmpty
  xor a
  ld [W_IsCurrentPartNotEmpty], a
  ret

.notEmpty
  ld a, 1
  ld [W_IsCurrentPartNotEmpty], a
  ret

INCLUDE "game/src/common/constants.asm"

W_PartStatsBuffer EQU $C552

SECTION "Part Variables 1",  WRAM0[$C566]
W_CurrentPartTypeForListView:: ds 1
W_PartListCursorPosition:: ds 1
W_PartListPageNumber:: ds 1

SECTION "Part Variables 2",  WRAM0[$C56A]
W_MaxCursorPositionForPartsList:: ds 1
W_PartsMenuEntrypoint:: ds 1
W_CurrentPartIndexForPartStatus:: ds 1

SECTION "Part Variables 3",  WRAM0[$C56F]
W_IsCurrentPartNotEmpty:: ds 1

SECTION "Part Variables 4",  WRAM0[$C58B]
W_NumPartsForPartStatus:: ds 1

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
  ld bc, W_NewListItemBufferArea
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
  sub $2D ; The earliest character is '-'
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
  db $E6,$00,$00,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$00,$00,$00 ; -, and numbers
  db $00,$00,$00,$00,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7 ; letters start
  db $D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$00,$00 ; letters end
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

MapPartNamesForPartsList::
  call GetPartPageAddressInInventoryForPartList
  call GetPageOffsetForPartList
  ld a, 4
  ld [$C4F4], a
  ld hl, $C4E0
  ld a, [hli]
  ld d, a
  ld e, [hl]
  ld a, $99
  ld [$C4E6], a
  ld a, $43
  ld [$C4E7], a

.loop
  push de
  pop hl
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
  ld [W_ListItemInitialOffsetForBuffering], a ; Skip part number
  push de
  call WrapBufferTextFromList
  pop de
  ; Draw text
  push de
  
  ld hl, $C4E7
  ld a, [hld]
  ld d, [hl]
  ld e, a

  ld a, [$C4F4] ; Remaining number of rows
  dec a
  rlca ; 8 tiles per
  rlca 
  rlca ; Only 4 entries per page so no risk of overflowing
  add $26 ; Draw right after fixed text in parts menu
  ld h, a ; Tile index of drawing area

  ld bc, W_NewListItemBufferArea
  call VWFDrawStringLeftFullAddress8Tiles
  pop de
  jr .nextSlot

.slotEmpty
  ld hl, $C4E7
  ld a, [hld]
  ld h, [hl]
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
  ld hl, $C4E7
  ld a, [hld]
  ld h, [hl]
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

.end
REPT $6595 - .end
  nop
ENDR

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

TypeChangeInputHandlerForPartsList::
  xor a
  ld [$C4EE], a
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputSelect
  ret z
  ld a, [W_PartsMenuEntrypoint]
  cp 1
  ret z
  ld a, [W_CurrentPartTypeForListView]
  ld [$C573], a
  inc a
  and 3
  ld [W_CurrentPartTypeForListView], a
  call MapTypeNameForPartList
  call MapPageNumbersForPartsList
  call MapPartModelNumbersForPartsList
  call MapPartNamesForPartsList
  call MapPartQuantitiesForPartsList
  call GetMaxCursorPositionForPartsList
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call ScheduleSoundEffect
  ret

HorizontalDirectionalInputHandlerForPartsList::
  xor a
  ld [$C4EE], a
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 2
  call ScheduleSoundEffect
  ld a, [W_PartListPageNumber]
  sub 1
  jr nz, .dontLoopToEnd
  ld a, $26

.dontLoopToEnd
  ld [W_PartListPageNumber], a
  call CorrectOOBSelectorForPartsList
  call MapPageNumbersForPartsList
  call MapPartModelNumbersForPartsList
  call MapPartNamesForPartsList
  call MapPartQuantitiesForPartsList
  call GetMaxCursorPositionForPartsList
  ld a, 1
  ld [$C4EE], a
  ret

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld a, $26
  ld b, a
  inc b
  ld a, [W_PartListPageNumber]
  inc a
  cp b
  jr nz, .dontLoopToStart
  ld a, 1

.dontLoopToStart
  ld [W_PartListPageNumber], a
  call CorrectOOBSelectorForPartsList
  call MapPageNumbersForPartsList
  call MapPartModelNumbersForPartsList
  call MapPartNamesForPartsList
  call MapPartQuantitiesForPartsList
  call GetMaxCursorPositionForPartsList
  ld a, 1
  ld [$C4EE], a
  ret

CorrectOOBSelectorForPartsList::
  ld a, [W_PartListPageNumber]
  dec a
  ld b, a
  sla b
  sla b
  ld a, [W_PartListCursorPosition]
  add b
  cp $97
  ret c
  ld a, [W_PartListCursorPosition]
  dec a
  ld [W_PartListCursorPosition], a
  call PlaceCursorForPartsList
  ret

PossibleOrphanedFunctionForPartsList::
  ld a, [W_PaletteAnimRunning]
  or a
  jr z, .fadeFinished
  call $34E6
  ret

.fadeFinished
  ld a, [$C48D]
  inc a
  and 3
  ld [$C48D], a
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld h, 0
  ld l, a
  ld bc, $1B
  add hl, bc
  ld bc, 0
  ld d, 2
  ld e, 0
  ld a, $14
  call WrapSetupPalswapAnimation
  ret

.table
  db 0,1,0,2

PartOpenInputHandlerForPartsList::
  xor a
  ld [$C4EE], a
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  call CheckIfPartSlotIsNotEmptyForPartsList
  or a
  jr nz, .partSlotNotEmpty
  ld a, 5
  call ScheduleSoundEffect
  ret

.partSlotNotEmpty
  ld a, [W_PartsMenuEntrypoint]
  cp 2
  jr z, .isLink

.canOpenPart
  ld a, 1
  ld [$C4EE], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ld a, $CC
  ld [$C0C2], a
  ld a, 3
  call ScheduleSoundEffect
  ret

.isLink
  call GetPartTypeAddressInInventoryForPartList
  ld d, h
  ld e, l
  call CheckIfPartCannotBeTradedForPartsList
  or a
  jr z, .canOpenPart
  ld a, 5
  call ScheduleSoundEffect
  ret

CountPartsForPartStatus::
  call GetPartTypeAddressInInventoryForPartList
  ld d, h
  ld e, l
  ld b, $97
  xor a
  ld [$C4EE], a
  ld [$C4F0], a

.loop
  push bc
  ld hl, 0
  add hl, de
  ld a, [hli]
  ld c, a
  ld a, [hli]
  or c
  jr z, .nextSlotPlz
  ld a, [W_PartsMenuEntrypoint]
  or a
  jr z, .tallyUpPart
  cp 1
  jr nz, .notFromMedarotStatus
  ld hl, 1
  add hl, de
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nextSlotPlz
  ld a, [W_CurrentPartTypeForListView]
  inc a
  ld b, a
  ld c, 1
  ld a, [$C4F0]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .nextSlotPlz
  jr .tallyUpPart

.notFromMedarotStatus
  ld hl, 1
  add hl, de
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .nextSlotPlz

.tallyUpPart
  ld hl, $C4EE
  inc [hl]

.nextSlotPlz
  inc de
  inc de
  ld hl, $C4F0
  inc [hl]
  pop bc
  dec b
  jr nz, .loop
  ld a, [$C4EE]
  ld [W_NumPartsForPartStatus], a
  ret

GetPartTypeAddressInInventoryForPartList::
  ld a, 7
  rst 8
  ld a, [W_CurrentPartTypeForListView]
  ld hl, GetPartPageAddressInInventoryForPartList.table
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ret

PlaceIconSpritesForPartStatus::
  ld a, 1
  ld [$C1E0], a
  ld a, 0
  ld [$C1E1], a
  ld a, $C3
  ld [$C1E2], a
  ld a, 8
  ld [$C1E3], a
  ld a, $40
  ld [$C1E4], a
  ld a, 1
  ld [$C220], a
  ld a, 0
  ld [$C221], a
  ld a, 8
  ld [$C223], a
  ld a, $50
  ld [$C224], a
  ld a, [W_CurrentPartTypeForListView]
  add $BC
  ld [$C222], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  
  ; This is incredibly silly.
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

TileMappingByPartTypeForPartStatus::
  call DrawPartImageForPartsList
  ld a, [W_CurrentPartTypeForListView]
  add $30
  ld e, a
  ld bc, $201
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, $201
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
  dw .headPart, .leftArmPart, .rightArmPart, .legPart

.headPart
  ld b, 8
  ld c, 1
  ld hl, $98E2
  call $25E5
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  ld c, a
  ld hl, $98E2
  call MapPartNameForPartStatus
  call GetPartStatValuesForPartStatus
  ld hl, $9924
  call MapAttributeNameForPartStatus
  ld hl, $9964
  call MapSkillNameForPartStatus
  ld a, [W_PartStatsBuffer + 3]
  ld hl, $9831
  call $351D
  ld a, [W_PartStatsBuffer + 4]
  ld hl, $9871
  call $351D
  ld a, [W_PartStatsBuffer + 5]
  ld hl, $98B1
  call $351D
  ld a, [W_PartStatsBuffer + 7]
  ld hl, $98F1
  call $351D
  call StarMappingForPartStatus
  ret

.leftArmPart
  ld b, 8
  ld c, 1
  ld hl, $98E2
  call $25E5
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  ld c, a
  ld hl, $98E2
  call MapPartNameForPartStatus
  call GetPartStatValuesForPartStatus
  ld hl, $9924
  call MapAttributeNameForPartStatus
  ld hl, $9964
  call MapSkillNameForPartStatus
  ld a, [W_PartStatsBuffer + 3]
  ld hl, $9831
  call $351D
  ld a, [W_PartStatsBuffer + 4]
  ld hl, $9871
  call $351D
  ld a, [W_PartStatsBuffer + 5]
  ld hl, $98B1
  call $351D
  ld a, [W_PartStatsBuffer + 7]
  ld hl, $98F1
  call $351D
  ld a, [W_PartStatsBuffer + 8]
  ld hl, $9931
  call $351D
  call StarMappingForPartStatus
  ret

.rightArmPart
  jp .leftArmPart

.legPart
  ld b, 8
  ld c, 1
  ld hl, $98E2
  call $25E5
  ld a, [W_CurrentPartTypeForListView]
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  ld c, a
  ld hl, $98E2
  call MapPartNameForPartStatus
  call GetPartStatValuesForPartStatus
  ld hl, $9924
  call MapAttributeNameForPartStatus
  ld hl, $9964
  call MapMovementNameForPartStatus
  ld a, [W_PartStatsBuffer + 3]
  ld hl, $9831
  call $351D
  ld a, [W_PartStatsBuffer + 4]
  ld hl, $9871
  call $351D
  ld a, [W_PartStatsBuffer + 5]
  ld hl, $98B1
  call $351D
  ld a, [W_PartStatsBuffer + 6]
  ld hl, $98F1
  call $351D
  ld a, [W_PartStatsBuffer + 7]
  ld hl, $9931
  call $351D
  ld a, [W_PartStatsBuffer + 8]
  ld hl, $9971
  call $351D
  ret

MapPartNameForPartStatus::
  inc b
  ld [W_ListItemIndexForBuffering], a
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 8
  call GetTileBasedCentringOffset
  ld b, 0
  ld c, a
  add hl, bc
  ld bc, W_ListItemBufferArea
  call PutStringVariableLength
  ret

GetPartStatValuesForPartStatus::
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [W_ListItemIndexForBuffering], a
  ld a, [W_CurrentPartTypeForListView]
  jp $34FF

MapAttributeNameForPartStatus::
  ld b, 5
  ld c, 7
  ld a, [W_PartStatsBuffer + 0]
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 6
  call PutStringFixedLength
  ret

MapSkillNameForPartStatus::
  ld b, 6
  ld c, 6
  ld a, [W_PartStatsBuffer + 2]
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  ret

StarMappingForPartStatus::
  ld a, [W_PartStatsBuffer + 6]
  or a
  jr nz, .starPlz
  xor a
  ld hl, $98B0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.starPlz
  ld a, $47
  ld hl, $98B0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

AnimateArrowsForMedarotStatus::
  ld a, [W_NumPartsForPartStatus]
  cp 2
  ret c
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, .showArrows
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

.showArrows
  call ShowLeftArrowForMedarotStatus
  call ShowRightArrowForMedarotStatus
  ret

ShowLeftArrowForMedarotStatus::
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
  ld a, $20
  ld [$C0E4], a
  ret

ShowLeftArrowForMedarotStatusUnused::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A6
  ld [$C0E2], a
  ld a, 8
  ld [$C0E3], a
  ld a, $20
  ld [$C0E4], a
  ret

ShowRightArrowForMedarotStatus::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, $48
  ld [$C103], a
  ld a, $20
  ld [$C104], a
  ret

ShowRightArrowForMedarotStatusUnused::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A7
  ld [$C102], a
  ld a, $48
  ld [$C103], a
  ld a, $20
  ld [$C104], a
  ret

MapMovementNameForPartStatus::
  ld b, 7
  ld c, 6
  ld a, [W_PartStatsBuffer + 1]
  sub $50
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringFixedLength
  ret

DirectionalInputHandlerForPartStatus::
  xor a
  ld [$C4EE], a
  ld a, [W_NumPartsForPartStatus]
  cp 2
  ret c
  ldh a, [H_JPInputHeldDown]
  and M_JPInputLeft
  jr z, .leftNotPressed
  call GetPartTypeAddressInInventoryForPartList
  ld d, h
  ld e, l

.leftwardSearchLoop
  ld a, [W_CurrentPartIndexForPartStatus]
  sub 1
  jr nc, .dontLoopToEnd
  ld a, $97
  dec a

.dontLoopToEnd
  ld [W_CurrentPartIndexForPartStatus], a
  ld h, 0
  ld l, a
  sla l
  rl h
  add hl, de
  ld bc, 0
  add hl, bc
  ld a, [hli]
  ld b, a
  ld a, [hl]
  or b
  jr z, .leftwardSearchLoop
  ld a, [W_PartsMenuEntrypoint]
  or a
  jr z, .exitLeftwardSearchLoop
  cp 1
  jr nz, .leftwardSearchLoopNotMedarotStatusSubscreen
  call CheckIfPartCannotBeEquippedToMedarotForPartStatus
  or a
  jr nz, .leftwardSearchLoop
  jr .exitLeftwardSearchLoop

.leftwardSearchLoopNotMedarotStatusSubscreen
  call CheckIfPartCannotBeTradedForPartsList
  or a
  jr nz, .leftwardSearchLoop

.exitLeftwardSearchLoop
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call ScheduleSoundEffect
  call ClearPartStatusArrows
  ret

.leftNotPressed
  ldh a, [H_JPInputHeldDown]
  and M_JPInputRight
  ret z
  call GetPartTypeAddressInInventoryForPartList
  ld d, h
  ld e, l

.rightwardSearchLoop
  ld a, $97
  ld b, a
  ld a, [W_CurrentPartIndexForPartStatus]
  inc a
  cp b
  jr nz, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [W_CurrentPartIndexForPartStatus], a
  ld h, 0
  ld l, a
  sla l
  rl h
  add hl, de
  ld bc, 0
  add hl, bc
  ld a, [hli]
  ld b, a
  ld a, [hl]
  or b
  jr z, .rightwardSearchLoop
  ld a, [W_PartsMenuEntrypoint]
  or a
  jr z, .exitRightwardSearchLoop
  cp 1
  jr nz, .rightwardSearchLoopNotMedarotStatusSubscreen
  call CheckIfPartCannotBeEquippedToMedarotForPartStatus
  or a
  jr nz, .rightwardSearchLoop
  jr .exitRightwardSearchLoop

.rightwardSearchLoopNotMedarotStatusSubscreen
  call CheckIfPartCannotBeTradedForPartsList
  or a
  jr nz, .rightwardSearchLoop

.exitRightwardSearchLoop
  ld a, 1
  ld [$C4EE], a
  ld a, 2
  call ScheduleSoundEffect
  call ClearPartStatusArrows
  ret

ClearPartStatusArrows::
  ld a, 0
  ld [$C0E0], a
  ld a, 0
  ld [$C100], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

ParsePartIndexForExitToPartList::
  ld a, [W_CurrentPartIndexForPartStatus]
  srl a
  srl a
  inc a
  ld [W_PartListPageNumber], a
  ld a, [W_CurrentPartIndexForPartStatus]
  and 3
  ld [W_PartListCursorPosition], a
  jp GetMaxCursorPositionForPartsList

CheckIfPartCannotBeEquippedToMedarotForPartStatus::
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  sla l
  rl h
  add hl, de
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .cannotBeEquipped
  ld a, [W_CurrentPartTypeForListView]
  inc a
  ld b, a
  ld c, 1
  ld a, [W_CurrentPartIndexForPartStatus]
  ld [W_ListItemIndexForBuffering], a
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [W_ListItemBufferArea]
  ld b, a
  ld a, [W_MedarotStatusTinpetType]
  cp b
  jr nz, .cannotBeEquipped
  xor a
  ret

.cannotBeEquipped
  ld a, 1
  ret

.unusedTable
  dw $D000, $D12E, $D25C, $D38A

UpdatePartImageForPartsList::
  call CheckIfPartSlotIsNotEmptyForPartsList
  or a
  jr nz, .notEmptySlot
  ld bc, $201
  ld e, $34
  ld a, 0
  jp WrapDecompressTilemap0

.notEmptySlot
  call GetSelectedPartIndexForPartsList
  call DrawPartImageForPartsList
  call LoadPartPaletteForPartsList
  ld a, [W_CurrentPartTypeForListView]
  add $30
  ld e, a
  ld bc, $201
  ld a, 0
  jp WrapDecompressTilemap0

PartsListOrphanedLinkConnectionTimeoutCheck::
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

MapLinkOverlayArrowForPartsList::
  push af
  ld bc, $105
  ld hl, $990E
  call $25E5
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  sla a
  sla a
  sla a
  sla a
  sla a
  sla a
  ld b, 0
  ld c, a
  ld hl, $990E
  add hl, bc
  pop af
  add $FA
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

LinkOverlayDirectionalInputHandlerForPartsList::
  ldh a, [H_JPInputChanged]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  sub 1
  jr nc, .dontLoopToEnd
  ld a, 2

.dontLoopToEnd
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld a, 2
  call ScheduleSoundEffect
  xor a
  jp MapLinkOverlayArrowForPartsList

.upNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputDown
  ret z
  ld a, [W_MedalMenuSelectedMedaliaCursorPosition]
  inc a
  cp 3
  jr nz, .dontLoopToStart
  xor a

.dontLoopToStart
  ld [W_MedalMenuSelectedMedaliaCursorPosition], a
  ld a, 2
  call ScheduleSoundEffect
  xor a
  jp MapLinkOverlayArrowForPartsList

CheckIfPartCannotBeTradedForPartsList::
  ld a, [W_CurrentPartIndexForPartStatus]
  ld h, 0
  ld l, a
  sla l
  rl h
  add hl, de
  inc hl
  ld a, [hld]
  ld b, a
  ld a, [hl]
  sub b
  jr z, .cannotTrade
  xor a
  ret

.cannotTrade
  ld a, 1
  ret

INCLUDE "game/src/common/constants.asm"

SECTION "Encounter Opponent Buffering", WRAM0[$C5A0]
W_EncounterTerrainListItemIndex:: ds 1
W_EncounterOpponentListItemIndex:: ds 1
W_EncounterOpponentBufferArea:: ds $C

SECTION "Encounter Helper Functions 1", ROMX[$5972], BANK[$05]
BufferOpponentForEncounterScreen::
  ld b, $F
  ld c, $C
  ld a, [W_EncounterOpponentListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld de, W_EncounterOpponentBufferArea
  ld b, $C

.loop
  ld a, [hli]
  ld [de], a
  inc de
  dec b
  jr nz, .loop
  ret

SECTION "Encounter Helper Functions 2", ROMX[$5BD3], BANK[$05]
MapTextForEncounterScreen::
  ld b, $11
  ld c, 7
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld bc, W_ListItemBufferArea
  ld a, 6
  call GetTileBasedCentringOffset
  ld hl, $9821
  ld b, 0
  ld c, a
  add hl, bc
  ld bc, W_ListItemBufferArea
  call PutStringVariableLength
  ld bc, W_EncounterOpponentBufferArea + 3
  ld a, 8
  call GetTileBasedCentringOffset
  ld hl, $996B
  ld b, 0
  ld c, a
  add hl, bc
  ld bc, W_EncounterOpponentBufferArea + 3
  jp PutStringVariableLength

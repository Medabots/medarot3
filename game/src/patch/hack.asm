INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "User Functions (Hack)", ROMX[$4000], BANK[$FF]
HackPredef::
  push af
  ld a, h
  ld [W_HackTempHL + 1], a
  ld a, l
  ld [W_HackTempHL], a
  pop af
  ld hl, HackPredefTable
  push bc
  rst $30
  pop bc
  push hl ; Change return pointer to Hack function
  ld a, [W_HackTempHL + 1]
  ld h, a
  ld a, [W_HackTempHL]
  ld l, a
  ret

HackPredefTable:
  dw TilemapLoadTileset ; 0



TilemapTilesetTableEntry: MACRO
  ; Number of Tiles, Tileset, Load Offset
  dbww (\2 - \1)/$8, \1, \3
ENDM
; c == table index
TilemapLoadTileset:
  push de
  push hl

  rr c
  dec c
  ld hl, .table
  ld b, $0
  add hl, bc
  add hl, bc
  add hl, bc
  add hl, bc
  add hl, bc
  ld a, [hli]
  ; b == Number of tiles
  ld b, a
  ; de == Tileset pointer
  ld a, [hli]
  ld e, a
  ld a, [hli]
  ld d, a
  
  ; hl == Font load index
  ld a, [hli]
  ld h, [hl]
  ld l, a
  
  VRAMSwitchToBank1
  call Load1BPPTilesFromFE
  VRAMSwitchToBank0

  pop hl
  pop de
  ret
.table
  ; TilemapTilesetTableEntry Tileset Start Address, Tileset End Address, Load Offset
  TilemapTilesetTableEntry PatchTilesetStartContinueNewGame, PatchTilesetEndContinueNewGame, $9100
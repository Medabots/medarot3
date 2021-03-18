INCLUDE "game/src/common/constants.asm"

SECTION "Patch Tileset Loading", ROM0[$0080]
Load1BPPTilesFromFE::
  ld a, $FE
  rst $10
  call Load1BPPTiles
  ld a, $FF
  rst $10
  ret

Load1BPPTiles::
  ; hl is the vram address to write to.
  ; de is the address to copy from.
  ; b is the number of tiles to copy.
  ld c, 8

.loop
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  ld a, [de]
  ld [hli], a
  ld [hli], a
  ei
  inc de
  dec c
  jr nz, .loop
  dec b
  jr nz, Load1BPPTiles
  ret

SECTION "Patch GFX", ROMX[$4000], BANK[$FE]
PatchTilesetStartEntryFont::
  INCBIN "build/tilesets/patch/EntryFont.1bpp"
PatchTilesetEndEntryFont::
PatchTilesetStartOldFontTiles0::
  INCBIN "build/tilesets/patch/OldFontTiles0.1bpp"
PatchTilesetEndOldFontTiles0::
PatchTilesetStartOldFontTiles1::
  INCBIN "build/tilesets/patch/OldFontTiles1.1bpp"
PatchTilesetEndOldFontTiles1::
PatchTilesetStartOldFontTiles2::
  INCBIN "build/tilesets/patch/OldFontTiles2.1bpp"
PatchTilesetEndOldFontTiles2::
PatchTilesetStartContinueNewGame::
  INCBIN "build/tilesets/patch/ContinueNewGame.1bpp"
PatchTilesetEndContinueNewGame::
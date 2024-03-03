INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

; TODO: Extract the actual state machine


SECTION "Link Encounter Setup", ROMX[$5709], BANK[$11]
LinkEncounterLoadTerrainMap::
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, $2a
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $14
  ld hl, $8800
  call $34E1
  ld bc, $0104
  ld e, $53
  ld a, $00
  call WrapDecompressTilemap0
  ld a, [W_EncounterTerrainListItemIndex]
  add $b0
  ld e, a
  ld bc, $0104
  ld a, $00
  jp WrapDecompressAttribmap0

LinkEncounterLoadScreenMaps::
  ld bc, $00B0
  call WrapLoadMaliasGraphics
  ld bc, $0C02
  ld e, $16
  ld a, $01
  call WrapDecompressTilemap0
  ld bc, $0C02
  ld e, $b0
  ld a, $01
  jp WrapDecompressAttribmap0

LinkEncounterSetupTerrainPalettes::
  ld hl, $0310
  ld b, $00
  ld a, [W_EncounterTerrainListItemIndex]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld b, h
  ld c, l
  push bc
  ld a, $05
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  ld a, $06
  jp WrapRestageDestinationBGPalettesForFade

LinkEncounterSetupTerrainPalettes2::
  ld bc, $0380
  push bc
  ld a, $00
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  push bc
  ld a, $01
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  ld a, $02
  jp WrapRestageDestinationBGPalettesForFade

LinkEncounterLoadStrings::
  ld b, $11
  ld c, $07
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld bc, W_ListItemBufferArea
  ld a, $06
  call GetTileBasedCenteringOffset
  ld hl, $9821
  ld b, $00
  ld c, a
  add hl, bc
  ld bc, W_ListItemBufferArea
  call PutStringVariableLength
  ld bc, $C5A5
  ld a, $08
  call GetTileBasedCenteringOffset
  ld hl, $996B
  ld b, $00
  ld c, a
  add hl, bc
  ld bc, $C5A5
  jp PutStringVariableLength

  padend $57bf
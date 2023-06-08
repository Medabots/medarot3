INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Load Ally Medabot Information", ROMX[$4CF8], BANK[$0A]
BattleAllyInitializeParticipantData::
  ld a, [$C647]
  or a
  ret z
  xor a
  ld [$C4E0], a
  ld de, $D200
.loop
  ld hl, $0003
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $15
  ld c, $09
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $0040
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $0009
  call memcpy
  pop de
  ld hl, $0200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$C4E0]
  inc a
  ld [$C4E0], a
  cp $02
  jr nz, .loop
  ret
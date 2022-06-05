INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages", ROMX[$516e], BANK[$0C]
BattleLoadTextBuf00::
  call $5ae6
  ld hl, $da
  call $5b39
  ld [W_ListItemIndexForBuffering], a
  ld b, $12
  ld c, $0e
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_NewListItemBufferArea
  ld de, cBUF00
  ld bc, $17
  jp memcpy
BattleLoadTextBuf01::
  call $5ae6
  ld hl, $db
  call $5b39
  ld [W_ListItemIndexForBuffering], a
  ld b, $06
  ld c, $06
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_NewListItemBufferArea
  ld de, cBUF01
  ld bc, $17
  jp memcpy

  padend $51b6

SECTION "Load text into buffers for battle messages 2", ROMX[$59f4], BANK[$0C]
BattleLoadTextBuf02::
  ld hl, $40
  add hl, de
  push de
  ld de, cBUF02
  ld bc, $09
  call memcpy
  pop de
  ret

  padend $5a04
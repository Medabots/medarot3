INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 0D", ROMX[$46f9], BANK[$0D]
; Probably for status messages
BattleStatusLoadAttackIntoBuf00::
  call $4b3a
  ld hl, $da
  call $4b9f
  ld [W_ListItemIndexForBuffering], a
  ld b, $12
  ld c, $0e
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld de, cBUF00
  ld bc, $e
  jp memcpy
BattleStatusLoadSkillIntoBuf01::
  call $4b3a
  ld hl, $db
  call $4b9f
  ld [W_ListItemIndexForBuffering], a
  ld b, $06
  ld c, $06
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld de, cBUF01
  ld bc, $6
  jp memcpy

  LoadPartTypeTextIntoBUF01 0D
  PartTypeTable 0D

  padend $4783

SECTION "Load text into buffers for battle messages 2 0D", ROMX[$48b7], BANK[$0D]
  LoadParticipantNameIntoBUF02 0D

  padend $48c7
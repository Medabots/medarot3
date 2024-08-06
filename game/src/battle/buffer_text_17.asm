INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 17", ROMX[$4f80], BANK[$17]
  LoadParticipantNameIntoBUF02 17

SECTION "Load text into buffers for battle messages 17 2", ROMX[$4c10], BANK[$17]
  LoadDamageNumberIntoBUF00 17
  padend $4c79

SECTION "Load text into buffers for battle messages 17 3", ROMX[$4dc2], BANK[$17]
BattleStatusLoadSkillIntoBuf00::
  call $5203
  ld hl, $da
  call $5268
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
BattleStatusLoadAttackIntoBuf01::
  call $5203
  ld hl, $db
  call $5268
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

  LoadPartTypeTextIntoBUF01 17

SECTION "Free space Bank 17", ROMX[$6000], BANK[$17]
  PartTypeTable 17
  LoadParticipantNameIntoBUF02Cont 17

INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 17", ROMX[$4f80], BANK[$17]
  LoadParticipantNameIntoBUF02 17

SECTION "Load text into buffers for battle messages 2 17", ROMX[$4dc2], BANK[$17]
BattleStatusLoadSkillIntoBuf00::
  call $5203
  ld hl, $da
  call $5268
  ld [W_ListItemIndexForBuffering], a
  ld bc, $120e
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_NewListItemBufferArea
  ld de, cBUF00
  ld bc, $e
  jp memcpy
BattleStatusLoadAttackIntoBuf01::
  call $5203
  ld hl, $db
  call $5268
  ld [W_ListItemIndexForBuffering], a
  ld bc, $0606
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_NewListItemBufferArea
  ld de, cBUF01
  ld bc, $6
  jp memcpy

  LoadPartTypeTextIntoBUF01 17

SECTION "Free space Bank 17", ROMX[$6000], BANK[$17]
  PartTypeTable 17
  LoadParticipantNameIntoBUF02Cont 17

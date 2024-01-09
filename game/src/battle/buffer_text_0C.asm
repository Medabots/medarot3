INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 0C", ROMX[$516e], BANK[$0C]
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

SECTION "Load text for part damage 0C", ROMX[$5676], BANK[$0C]
BattleLoadPartDamageNumber:: ;
  LoadDamageNumberIntoBUF00 0C

  padend $56df

  LoadPartTypeTextIntoBUF01 0C

  padend $5721

SECTION "Load participant name into cBUF02 0C", ROMX[$59f4], BANK[$0C]
  LoadParticipantNameIntoBUF02 0C

  padend $5a04

SECTION "Free space Bank 0C", ROMX[$7e24], BANK[$0C]
BattleLoadPartsTable::
  PartTypeTable 0C

  LoadParticipantNameIntoBUF02Cont 0C
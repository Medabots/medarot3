INCLUDE "game/src/common/constants.asm"

SECTION "Part Variables 1",  WRAM0[$C566]
W_CurrentPartTypeForListView:: ds 1

SECTION "Part Helper Functions 1", ROMX[$6322], BANK[$06]
MapTypeNameForPartList::
  ld a, [W_CurrentPartTypeForListView]
  add $1A
  ld e, a
  ld bc, $C01
  ld a, 0
  jp WrapDecompressTilemap0

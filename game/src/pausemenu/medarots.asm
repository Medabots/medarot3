INCLUDE "game/src/common/constants.asm"

SECTION "Medarot Variables 1",  WRAM0[$C585]
W_MedarotStatusSelectedOption:: ds 1

SECTION "Medarot Helper Functions 1", ROMX[$46FF], BANK[$07]


SECTION "Medarot Helper Functions 2", ROMX[$4B70], BANK[$07]
MedarotsPlayBzztSound::
  ld a, 5
  call $27DA
  xor a
  ret

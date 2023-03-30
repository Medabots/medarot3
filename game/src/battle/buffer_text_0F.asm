INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 0F", ROMX[$4BD2], BANK[$0F]
LoadMedaforceNameIntoBUF02::
  call $4e8c
  ld hl, $1d0
  add hl, de
  ld de, cBUF02
  ld bc, $9
  jp memcpy

SECTION "Load text into buffers for battle messages 0F 2", ROMX[$4727], BANK[$0F]
  LoadDamageNumberIntoBUF00 0F

  padend $4790
INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

; 0E is probably Medaforce-specific

SECTION "Load text into buffers for battle messages 0E", ROMX[$4f4a], BANK[$0E]
  LoadDamageNumberIntoBUF01 0E

  padend $4fb3

SECTION "Load text into buffers for battle messages 2 0E", ROMX[$5562], BANK[$0E]
LoadMedaforceTextIntoBUF02::
  ld bc, $101
  call $593e
  ld hl, $1d0
  add hl, de
  ld de, cBUF02
  ld bc, $9
  jp memcpy

  padend $5575

  LoadPartTypeTextIntoBUF01 0E

  padend $5597

  PartTypeTable 0E

SECTION "Load text into buffers for battle messages 3 0E", ROMX[$55C0], BANK[$0E]
  LoadParticipantNameIntoBUF02 0E
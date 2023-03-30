INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 0F", ROMX[$4BD2], BANK[$0F]
LoadMedaforceNameIntoBUF02::
  call $4e8c
  call LoadMedaforceNameIntoMedarotData ; sets hl
  ld de, cBUF02
  ld bc, $1a
  jp memcpy

SECTION "Load text into buffers for battle messages 0F 2", ROMX[$4727], BANK[$0F]
  LoadDamageNumberIntoBUF00 0F

  padend $4790

SECTION "Free space Bank 0F", ROMX[$7500], BANK[$0F]
LoadMedaforceNameIntoMedarotData:
  ld hl, $1d0
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $0a
  ld c, $0f
  ld a, $06
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_NewListItemBufferArea
  ret

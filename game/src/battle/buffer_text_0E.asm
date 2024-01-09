INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

; 0E is probably Medaforce-specific

SECTION "Load text into buffers for battle messages 0E", ROMX[$4f4a], BANK[$0E]
  LoadDamageNumberIntoBUF00 0E

  padend $4fb3

SECTION "Load text into buffers for battle messages 2 0E", ROMX[$5565], BANK[$0E]
LoadMedaforceTextIntoBUF02::
  call $593e
  call LoadMedaforceNameIntoMedarotData ; sets hl
  ld de, cBUF02
  ld bc, $1a
  jp memcpy

  padend $5575

  LoadPartTypeTextIntoBUF01 0E

  padend $5597

  padend $55b7

SECTION "Load text into buffers for battle messages 3 0E", ROMX[$55C0], BANK[$0E]
  LoadParticipantNameIntoBUF02 0E


SECTION "Free space Bank 0E", ROMX[$7200], BANK[$0E]
  PartTypeTable 0E
  LoadParticipantNameIntoBUF02Cont 0E

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

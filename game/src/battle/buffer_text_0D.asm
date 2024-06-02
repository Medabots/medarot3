INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages 0D", ROMX[$4505], BANK[$0D]
  LoadDamageNumberIntoBUF00 0D

  padend $456e

SECTION "Load text into buffers for battle messages 0D 2", ROMX[$46f9], BANK[$0D]
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
  ld hl, W_NewListItemBufferArea
  ld de, cBUF00
  ld bc, $17
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
  ld hl, W_NewListItemBufferArea
  ld de, cBUF01
  ld bc, $17
  jp memcpy

  LoadPartTypeTextIntoBUF01 0D

  padend $4783

SECTION "Load text into buffers for battle messages 2 0D", ROMX[$48b7], BANK[$0D]
  LoadParticipantNameIntoBUF02 0D

  padend $48c7

SECTION "Load text for part transformations", ROMX[$5a22], BANK[$0D]
BattleStatusTransformLoadNewPart::
  ld a, $01
  ld [$dd40], a
  call $4b3a
  ld hl, $d0
  call $4b9f
  ld de, $dd43
  ld bc, $0020
  call memcpy
  call $4b3a
  ld hl, $a2
  add hl, de
  ld a, [hl]
  dec a
  ld b, $00
  ld c, a
  ld hl, $3
  add hl, de
  add hl, bc
  ld a, [hl]
  ld [$dd42], a
  ld a, [$dd41]
  ld [hl], a
  ld a, [$dd41]
  ld [W_ListItemIndexForBuffering], a
  call $4b3a
  ld hl, $a2
  add hl, de
  ld a, [hl]
  push af ; store the part type
  ld b, a
  ld c, $09
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  call $4b3a
  ld hl, $d0
  call $4b9f
  ld d, h
  ld e, l
  pop af ; pop the part type
  ; Don't bother copying the name, just store the list type idx and list idx
  ld [de], a
  inc de
  ld a, [$dd41]
  ld [de], a
  ld [W_ListItemIndexForBuffering], a
  call $4b3a
  ld hl, $a2
  add hl, de
  ld a, [hl]
  dec a
  call $34ff
  call $4b3a
  ld hl, $d9
  call $4b9f
  ld a, [$c552]
  ld [hl], a
  call $4b3a
  ld hl, $da
  call $4b9f
  ld a, [$c553]
  ld [hl], a
  call $4b3a
  ld hl, $dd
  call $4b9f
  ld a, [$c556]
  ld [hl], a
  call $4b3a
  ld hl, $de
  call $4b9f
  ld a, [$c557]
  ld [hl], a
  call $4b3a
  ld hl, $df
  call $4b9f
  ld a, [$c558]
  ld [hl], a
  call $4b3a
  ld hl, $e8
  call $4b9f
  ld a, [$c55f]
  ld [hl], a
  call $4b3a
  call $3672
  call $4b3a
  call $429f
  jp $4b35

  padend $5aee

BattleStatusLoadTransformedPartIntoBuf02:: ; 35aee (d:5aee)
  call $4b3a
  ld hl, $a2
  add hl, de
  ld a, [hl]
  dec a
  call $4741
  call $4b3a
  ld hl, $d0
  call BattleStatusLoadTransformedPartIntoBuf02Cont
  ld de, cBUF02
  ld bc, $1a
  call memcpy
  ld bc, $86
  call $48ae
  call WrapInitiateMainScript
  jp $4b35

  padend $5b18

SECTION "Free space Bank 0D", ROMX[$7930], BANK[$0D]
BattleStatusLoadPartsTable::
  PartTypeTable 0D

  LoadParticipantNameIntoBUF02Cont 0D

BattleStatusLoadTransformedPartIntoBuf02Cont:
  call $4b9f
  ldi a, [hl]
  ld b, a
  ld c, $09
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_NewListItemBufferArea
  ret
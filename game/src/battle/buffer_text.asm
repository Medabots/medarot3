INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load text into buffers for battle messages", ROMX[$516e], BANK[$0C]
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

SECTION "Load text for part damage", ROMX[$5676], BANK[$0C]
BattleLoadPartDamageNumber:: ;
  push de
  xor a
  ld [W_ItemPageRowIndex], a
  ld de, cBUF00
  ld a, [$ddb4]
  ld h, a
  ld a, [$ddb5]
  ld l, a
  ld bc, $64
  push de
  call DigitCalculationLoop
  pop de
  ld a, [$c4ee]
  or a
  jr z, .start_calc
  add $30
  ld [de], a
  inc de
  ld a, $01
  ld [W_ItemPageRowIndex], a
.start_calc
  ld a, [$c4e0]
  ld h, a
  ld a, [$c4e1]
  ld l, a
  ld bc, $a
  push de
  call DigitCalculationLoop
  pop de
  ld a, [$c4ee]
  or a
  jr z, .next_digit_1
  add $30
  ld [de], a
  inc de
  jr .next_digit_2
.next_digit_1
  ld a, [W_ItemPageRowIndex]
  or a
  jr z, .next_digit_2
  ld a, $30
  ld [de], a
  inc de
.next_digit_2
  ld a, [$c4e0]
  ld h, a
  ld a, [$c4e1]
  ld l, a
  ld bc, $1
  push de
  call DigitCalculationLoop
  pop de
  ld a, [$c4ee]
  add $30
  ld [de], a
  inc de
  ld a, $cb
  ld [de], a
  pop de
  ret
BattleLoadPartDefendedText:
  push de
  ld bc, BattleLoadPartsTable
  ld h, $00
  ld l, a
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, bc
  ld de, cBUF01
.copyLoop
  ld a, [hli]
  ld [de], a
  cp $cb
  jr z, .return
  inc de
  jr .copyLoop
.return
  pop de
  ret

  padend $5721

SECTION "Load participant name into cBUF02", ROMX[$59f4], BANK[$0C]
BattleLoadParticipantNameBuf02::
  call BattleLoadParticipantNameBuf02Cont ; set hl
  push de
  ld de, cBUF02
  ld bc, $1a ; Take over old cBUF00 and cBUF01, dd90 to dda2
  call memcpy
  pop de
  ret

  padend $5a04

; For more complex logic and extra space
SECTION "Free space Bank 0C", ROMX[$7e24], BANK[$0C]
BattleLoadPartsTable::
  db "head",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db "right arm",$CB,$00,$00,$00,$00,$00,$00
  db "left arm",$CB,$00,$00,$00,$00,$00,$00,$00
  db "legs",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
BattleLoadParticipantNameBuf02Cont::
  ld a, d
  cp $d6
  jr nc, .enemy
  ld hl, $40 ; Offset to name in participant data structure for player
  add hl, de
  ret
.enemy
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  ld h, a
  ld l, $03 ; Use the head part to get the idx for the name
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld bc, $1509
  push de
  call WrapBufferTextFromList
  pop de
  ld hl, W_NewListItemBufferArea
  ret

SECTION "Load text into buffers for battle messages, bank 0d", ROMX[$46f9], BANK[$0D]
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
BattleStatusLoadPartType::
  push de
  ld bc, BattleStatusLoadPartsTable
  ld h, $00
  ld l, a
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, bc
  ld de, cBUF01
.loop
  ld a, [hli]
  ld [de], a
  cp $cb
  jr z, .return
  inc de
  jr .loop
.return
  pop de
  ret

  padend $4783

SECTION "Load text into buffers for battle messages, bank 0d 2", ROMX[$48b7], BANK[$0D]
BattleStatusLoadParticipantName::
  call BattleStatusLoadParticipantNameBuf02Cont
  push de
  ld de, cBUF02
  ld bc, $1a ; Take over old BUF01 and BUF00
  call memcpy
  pop de
  ret

  padend $48c7

; For more complex logic and extra space
SECTION "Free space Bank 0D", ROMX[$7930], BANK[$0D]
BattleStatusLoadPartsTable::
  db "head",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db "right arm",$CB,$00,$00,$00,$00,$00,$00
  db "left arm",$CB,$00,$00,$00,$00,$00,$00,$00
  db "legs",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
BattleStatusLoadParticipantNameBuf02Cont::
  ld a, d
  cp $d6
  jr nc, .enemy
  ld hl, $40 ; Offset to name in participant data structure for player
  add hl, de
  ret
.enemy
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  ld h, a
  ld l, $03 ; Use the head part to get the idx for the name
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld bc, $1509
  push de
  call WrapBufferTextFromList
  pop de
  ld hl, W_NewListItemBufferArea
  ret

SECTION "Load part type for encounter reward", ROMX[$5c17], BANK[$15]
EncounterLoadRewardPartTypeText::
  push de
  push hl
  ld bc, EncounterLoadPartsTable
  ld h, $00
  ld l, a
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, bc
  pop de
.loop
  ld a, [hli]
  ld [de], a
  cp $cb
  jr z, .return
  inc de
  jr .loop
.return
  pop de
  ret

  padend $5c58

SECTION "Free space Bank 15", ROMX[$6220], BANK[$15]
EncounterLoadPartsTable::
  db "head",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db "right arm",$CB,$00,$00,$00,$00,$00,$00
  db "left arm",$CB,$00,$00,$00,$00,$00,$00,$00
  db "legs",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
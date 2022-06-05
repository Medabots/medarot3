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

SECTION "Parts table for more space", ROMX[$7e24], BANK[$0C]
BattleLoadPartsTable::
  db "Head",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db "Right Arm",$CB,$00,$00,$00,$00,$00,$00
  db "Left Arm",$CB,$00,$00,$00,$00,$00,$00,$00
  db "Legs",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SECTION "Load participant name into cBUF02", ROMX[$59f4], BANK[$0C]
BattleLoadParticipantNameBuf02::
  ld hl, $40 ; Offset to name in participant data structure
  add hl, de
  push de
  ld de, cBUF02
  ld bc, $09
  call memcpy
  pop de
  ret

  padend $5a04
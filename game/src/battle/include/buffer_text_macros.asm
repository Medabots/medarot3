; Common routines

LoadPartTypeTextIntoBUF01: MACRO
LoadPartTypeTextIntoBUF01_\1::
  push de
  ld hl, PartTypeTable_\1
  ld b, $00
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
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
  ENDM

LoadPartTypeTextIntoDE: MACRO
LoadPartTypeTextIntoDE_\1::
  push de
  push hl
  ld hl, PartTypeTable_\1
  ld b, $00
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
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
  ENDM

PartTypeTable: MACRO
PartTypeTable_\1:
  db $D3,$B8,$CB,$00,$00,$00,$00,$00 ; Head
  db $D3,$03,$D3,$EB,$CB,$00,$00,$00 ; Right Arm
  db $D3,$4F,$D3,$EB,$CB,$00,$00,$00 ; Left Arm
  db $D3,$26,$D3,$C8,$CB,$00,$00,$00 ; Legs
  ENDM

LoadParticipantNameIntoBUF02: MACRO
LoadParticipantNameIntoBUF02_\1::
  ld hl, $40 ; offset to name in participant structure
  add hl, de
  push de
  ld de, cBUF02
  ld bc, $9
  call memcpy
  pop de
  ret
  ENDM

LoadDamageNumberIntoBUF01: MACRO
LoadDamageNumberIntoBUF01_\1::
  push de
  xor a
  ld [$c4fc], a
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
  add $e0
  ld [de], a
  inc de
  ld a, $01
  ld [$c4fc], a
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
  add $e0
  ld [de], a
  inc de
  jr .next_digit_2
.next_digit_1
  ld a, [$c4fc]
  or a
  jr z, .next_digit_2
  ld a, $e0
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
  add $e0
  ld [de], a
  inc de
  ld a, $cb
  ld [de], a
  pop de
  ret
  ENDM
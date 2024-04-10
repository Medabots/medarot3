; Common routines

MACRO LoadPartTypeTextIntoBUF01
LoadPartTypeTextIntoBUF01_\1::
  push de
  ld bc, PartTypeTable_\1
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
  ENDM

MACRO LoadPartTypeTextIntoDE
LoadPartTypeTextIntoDE_\1::
  push de
  push hl
  ld bc, PartTypeTable_\1
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
  ENDM

MACRO PartTypeTable
PartTypeTable_\1:
  db "head",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db "right arm",$CB,$00,$00,$00,$00,$00,$00
  db "left arm",$CB,$00,$00,$00,$00,$00,$00,$00
  db "legs",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  ENDM

MACRO LoadParticipantNameIntoBUF02Cont
LoadParticipantNameIntoBUF02Cont_\1::
  ld a, d
  cp $d6
  jr nc, .npc
  sub $d0 ; d0 is always the player
  jr z, .player
  ; check if it's an ally
  srl a ; 1 or 2
  ; c648 and c649 indicate if it's an ally
  ld hl, $c647
  ld b, $00
  ld c, a
  ld a, [hl]
  and a ; if flag c647 isn't set, it's the player
  jr z, .player
  add hl, bc
  ld a, [hl]
  jr nz, .npc
.player
  ld hl, $40 ; Offset to name in participant data structure for player
  add hl, de
  ret
.npc
  ; A bit of a hack, but check if the loaded name exists and fits
  ; This must cover the multiplayer, NPC ally, and NPC enemy use-cases
  ld hl, $40
  add hl, de
  ; If the length is 0, fall back on the head part (probably ally)
  ld a, [hli]
  cp $CB
  jr z, .useHeadPart
  ; Check if the length fits
  ld b, $08
.checkLengthLoop
  ld a, [hli]
  cp $CB
  jr z, .player
  dec b
  jr nz, .checkLengthLoop
  
.useHeadPart
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  ld h, a
  ld l, $03
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld bc, $1509
  push de
  call WrapBufferTextFromList
  pop de
  ld hl, W_NewListItemBufferArea
  ret
  ENDM

MACRO LoadParticipantNameIntoBUF02
LoadParticipantNameIntoBUF02_\1::
  call LoadParticipantNameIntoBUF02Cont_\1 ; sets hl
  push de
  ld de, cBUF02
  ld bc, $1a ; Take over old cBUF00 and cBUF01, dd90 to dda2
  call memcpy
  pop de
  ret
  ENDM

MACRO LoadDamageNumberIntoBUF00
LoadDamageNumberIntoBUF00_\1::
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
  add $30
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
  add $30
  ld [de], a
  inc de
  jr .next_digit_2
.next_digit_1
  ld a, [$c4fc]
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
  ENDM
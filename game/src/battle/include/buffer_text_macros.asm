; Common routines

LoadPartTypeTextIntoBUF01: MACRO
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

LoadPartTypeTextIntoDE: MACRO
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

PartTypeTable: MACRO
PartTypeTable_\1:
  db "head",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db "right arm",$CB,$00,$00,$00,$00,$00,$00
  db "left arm",$CB,$00,$00,$00,$00,$00,$00,$00
  db "legs",$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  ENDM

LoadParticipantNameIntoBUF02Cont: MACRO
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
  ENDM

LoadParticipantNameIntoBUF02: MACRO
LoadParticipantNameIntoBUF02_\1::
  call LoadParticipantNameIntoBUF02Cont_\1 ; sets hl
  push de
  ld de, cBUF02
  ld bc, $1a ; Take over old cBUF00 and cBUF01, dd90 to dda2
  call memcpy
  pop de
  ret
  ENDM

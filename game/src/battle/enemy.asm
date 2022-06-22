INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Load Enemy data into participant structure", ROMX[$517f], BANK[$0A]
BattleLoadEnemyData:: ; 2917f (a:517f)
  call BattleLoadEnemyDataInit
  call BattleLoadEnemyDataStats
  call BattleLoadEnemyDataName
  call BattleLoadEnemyDataMisc
  ld a, [$c5ae]
  ld [$c4f0], a
  ld a, $03
  ld [$c4f2], a
  ld de, $d600
  jp BattleInitializeLoadParticipantData
BattleLoadEnemyDataInit:: ; This copies the name, which happens again later...
  xor a
  ld [$c4ee], a
  ld a, [$c5ae]
  ld [$c4f0], a
  ld de, $d600
.next_participant
  ld hl, $0000
  add hl, de
  ld a, $03
  ld [hl], a
  ld hl, $c5b0
  ld b, $00
  ld a, [$c4ee]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$c4f2], a
  ld a, [hli]
  ld [$c4f3], a
  ld a, [hli]
  ld [$c4f4], a
  ld a, [hli]
  ld [$c4f5], a
  ld a, [$c4f2]
  ld [W_ListItemIndexForBuffering], a
  ld b, $01
  ld c, $01
  ld a, $10
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [W_ListItemBufferArea]
  ld hl, $1
  add hl, de
  ld [hl], a
  ld b, $15
  ld c, $09
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $40
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $9
  call memcpy
  pop de
  ld hl, $c5bc
  ld b, $00
  ld a, [$c4ee]
  ld c, a
  add hl, bc
  ld a, [hl]
  ld hl, $2
  add hl, de
  ld [hl], a
  ld hl, $3
  add hl, de
  ld a, [$c4f2]
  ld [hli], a
  ld hl, $4
  add hl, de
  ld a, [$c4f3]
  ld [hli], a
  ld hl, $5
  add hl, de
  ld a, [$c4f4]
  ld [hli], a
  ld hl, $6
  add hl, de
  ld a, [$c4f5]
  ld [hli], a
  ld hl, $200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$c4ee]
  inc a
  ld [$c4ee], a
  ld a, [$c4f0]
  dec a
  ld [$c4f0], a
  jp nz, .next_participant
  ret
BattleLoadEnemyDataStats::
  xor a
  ld [$c4e0], a
  ld a, [$c5ae]
  ld [W_MapDigitsAddress], a
  ld de, $d600
.next_participant
  push de
  ld hl, $0010
  add hl, de
  ld d, h
  ld e, l
  call $3654
  pop de
  ld hl, $200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$c4e0]
  inc a
  ld [$c4e0], a
  ld a, [W_MapDigitsAddress]
  dec a
  ld [W_MapDigitsAddress], a
  jp nz, .next_participant
  ret
BattleLoadEnemyDataName:: ; 29285 (a:5285)
  xor a
  ld [$c4e0], a
  ld de, $d600
.next_participant
  ld a, [de]
  or a
  ret z
  ld hl, $3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $15
  ld c, $09
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $40
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $9
  call memcpy
  pop de
  ld hl, $200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$c4e0]
  inc a
  ld [$c4e0], a
  cp $03
  jr nz, .next_participant
  ret
BattleLoadEnemyDataMisc::
  xor a
  ld [$c4e0], a
  ld de, $d600
  ld a, [$c5ae]
  ld [$c4f0], a
.next_participant
  push de
  ld b, $00
  ld a, [$c4e0]
  ld c, a
  sla c
  sla c
  add c
  ld c, a
  ld hl, $c5c2
  add hl, bc
  push hl
  ld hl, $50
  add hl, de
  ld d, h
  ld e, l
  pop hl
  ld bc, $5
  call memcpy
  pop de
  ld hl, $200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$c4e0]
  inc a
  ld [$c4e0], a
  ld a, [$c4f0]
  dec a
  ld [$c4f0], a
  jr nz, .next_participant
  ret

SECTION "Enemy 'Medaforce' selection", ROMX[$5cff], BANK[$0A]
BattlePrepareEnemyMedaforce::
  xor a
  ld [$c4f1], a
  ld a, [$dc10]
  cp $28
  jp z, .asm_29d80
  ld a, b
  cp $ff
  jr z, .asm_29d1a
  ld [$c4f0], a
  ld a, $01
  ld [$c4f1], a
  jr .asm_29d2d
.asm_29d1a
  call $ab4
  ld a, [$c4a0]
  and $07
  ld hl, $5d85
  ld b, $00
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [$c4f0], a
.asm_29d2d
  xor a
  ld [$c4f2], a
.asm_29d31
  ld hl, $15
  ld b, $00
  ld a, [$c4f0]
  ld c, a
  add hl, bc
  add hl, de
  ld a, [hl]
  cp $ff
  jr z, .asm_29d63
  ld [W_ListItemIndexForBuffering], a
  ld b, $0a
  ld c, $0f
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [$c546]
  ld b, a
  ld hl, $1dc
  add hl, de
  ld a, [hl]
  cp b
  jr c, .asm_29d63
  call BattlePrepareEnemyMedaforceCopyToStructure
  jr .asm_29d82
.asm_29d63
  ld a, [$c4f1]
  or a
  jr nz, .asm_29d80
  ld a, [$c4f0]
  sub $01
  jr nc, .asm_29d72
  ld a, $02
.asm_29d72
  ld [$c4f0], a
  ld a, [$c4f2]
  inc a
  ld [$c4f2], a
  cp $03
  jr nz, .asm_29d31
.asm_29d80
  xor a
  ret
.asm_29d82
  ld a, $01
  ret

  padend $5d85

  db $00, $01, $02
  db $00, $01, $02
  db $00, $01

BattlePrepareEnemyMedaforceCopyToStructure::
  push de
  ld hl, $1d0
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea + $6 ; Medaforce name
  ld bc, $9
  call memcpy
  pop de
  ld a, [W_ListItemBufferArea + $3]
  ld hl, $1da
  add hl, de
  ld [hli], a
  ld hl, $15
  ld b, $00
  ld a, [$c4f0]
  ld c, a
  add hl, bc
  add hl, de
  ld a, [hl]
  push af
  ld hl, $1e0
  add hl, de
  pop af
  ld [hli], a
  ld hl, $1db
  add hl, de
  ld a, [W_ListItemBufferArea]
  ld [hl], a
  ld hl, $1dd
  add hl, de
  ld a, [W_ListItemBufferArea + $1]
  ld [hli], a
  ld hl, $1de
  add hl, de
  ld a, [W_ListItemBufferArea + $2]
  ld [hli], a
  ld hl, $1e1
  add hl, de
  ld a, [W_ListItemBufferArea + $4]
  ld [hli], a
  ld hl, $1df
  add hl, de
  ld a, [W_ListItemBufferArea + $5]
  ld [hli], a
  ld hl, $1e6
  add hl, de
  ld a, [$c4f0]
  inc a
  ld [hli], a
  ld hl, $a2
  add hl, de
  ld a, [$c4f0]
  add $04
  ld [hl], a
  ld hl, $1e3
  add hl, de
  ld [hl], $00
  ret

  padend $5dfb
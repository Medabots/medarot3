INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

PartTypeTable: MACRO
.table
  db $D3,$B8,$CB,$00,$00,$00,$00,$00 ; Head
  db $D3,$03,$D3,$EB,$CB,$00,$00,$00 ; Right Arm
  db $D3,$4F,$D3,$EB,$CB,$00,$00,$00 ; Left Arm
  db $D3,$26,$D3,$C8,$CB,$00,$00,$00 ; Legs
  ENDM

SECTION "Load text into buffers for battle messages 0B", ROMX[$45DD], BANK[$0B]
BattleAllyStatusLoadPartTypeTextBuf00::
  ld de, $c0a0
  call $33b7
  ld hl, $c
  add hl, de
  ld a, [hl]
  cp $ff
  ret nz
  ld de, $c0a0
  call $341b
  call $4b56
  call $507d
  ld a, [$c4ee]
  ld hl, cBUF00
  call BattleAllyStatusLoadPartType
  call $50dc
  ld bc, $d
  call $5126
  call $4b56
  ld hl, $b0
  add hl, de
  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld a, $20
  ld [$c48a], a
  jp IncSubStateIndex

SECTION "Load text into buffers for battle messages 2 0B", ROMX[$4666], BANK[$0B]
BattleAllyStatusLoadTextIntoBuf01::
  call $4b56
  ld hl, $40
  add hl, de
  ld de, cBUF01
  ld bc, $9
  call memcpy
  call $4b56
  ld hl, $69
  add hl, de
  ld a, [hl]
  and $fe
  ld [hl], a
  ld bc, $15
  call $5126
  ld a, $4a
  ld [$c481], a
  ret

BattleAllyStatusUnknownFunction::
  ld bc, $16
  call $5126
  ld a, $4a
  ld [$c481], a
  ret

BattleAllyStatusLoadTextIntoBuf02::
  call $4b56
  ld hl, $a2
  add hl, de
  ld a, [hl]
  dec a
  ld hl, cBUF00
  call BattleAllyStatusLoadPartType
  ld bc, $17
  call $5126
  ld a, $4a
  ld [$c481], a
  ret

SECTION "Load text for part damage 0B", ROMX[$509b], BANK[$0B]
BattleAllyStatusLoadPartType::
  push de
  push hl
  ld hl,.table
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
  PartTypeTable

  padend $50dc

SECTION "Load text into buffers for battle messages 0C", ROMX[$516e], BANK[$0C]
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
  ld hl, W_ListItemBufferArea
  ld de, cBUF00
  ld bc, $e
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
  ld hl, W_ListItemBufferArea
  ld de, cBUF01
  ld bc, $6
  jp memcpy

  padend $51b6

SECTION "Load text for part damage 0C", ROMX[$5676], BANK[$0C]
BattleLoadPartDamageNumber:: ;
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
BattleLoadPartDefendedText:
  push de
  ld hl, .table
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
  PartTypeTable

SECTION "Load participant name into cBUF02 0C", ROMX[$59f4], BANK[$0C]
BattleLoadParticipantNameBuf02::
  ld hl, $40 ; Offset to name in participant data structure
  add hl, de
  push de
  ld de, cBUF02
  ld bc, $9
  call memcpy
  pop de
  ret

  padend $5a04

SECTION "Load text into buffers for battle messages 0D", ROMX[$46f9], BANK[$0D]
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
  ld hl, W_ListItemBufferArea
  ld de, cBUF00
  ld bc, $e
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
  ld hl, W_ListItemBufferArea
  ld de, cBUF01
  ld bc, $6
  jp memcpy
BattleStatusLoadPartType::
  push de
  ld hl, .table
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
  PartTypeTable

  padend $4783

SECTION "Load text into buffers for battle messages 2 0D", ROMX[$48b7], BANK[$0D]
BattleStatusLoadParticipantName::
  ld hl, $40 ; offset to name in participant structure
  add hl, de
  push de
  ld de, cBUF02
  ld bc, $9
  call memcpy
  pop de
  ret

  padend $48c7

SECTION "Load part type for encounter reward", ROMX[$5c17], BANK[$15]
EncounterLoadRewardPartTypeText::
  push de
  push hl
  ld hl, .table
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
  PartTypeTable

  padend $5c58
INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

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

SECTION "Load text for Robattle Winner (on player loss)", ROMX[$4980], BANK[$0B]
BattleRobattleLoadWinnerTextIntoBuf02::
  ld hl, W_EncounterOpponentBufferArea + 3
  ld de, cBUF02
  ld bc, $0009
  call memcpy
  ld bc, $0097
  call $5126
  call WrapInitiateMainScript
  jp IncSubStateIndex

SECTION "Load text for part damage 0B", ROMX[$509b], BANK[$0B]
BattleAllyStatusLoadPartType::
  LoadPartTypeTextIntoDE 0B
  PartTypeTable 0B

  padend $50dc
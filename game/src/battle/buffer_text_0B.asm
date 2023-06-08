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
  call BattleAllyStatusLoadParticipantNameBuf01Cont
  ld de, cBUF01
  ld bc, $17
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

  padend $468d

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

  padend $4998

SECTION "Load text for part damage 0B", ROMX[$509b], BANK[$0B]
BattleAllyStatusLoadPartType::
  LoadPartTypeTextIntoDE 0B

  padend $50dc

SECTION "Free space Bank 0B", ROMX[$7cef], BANK[$0B]
  PartTypeTable 0B
BattleAllyStatusLoadParticipantNameBuf01Cont::
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
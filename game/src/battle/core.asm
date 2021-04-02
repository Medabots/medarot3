INCLUDE "game/src/common/constants.asm"

SECTION "Battle State Machine 1", ROMX[$4000], BANK[$0A]
BattleStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $40C1
  dw $40EF
  dw BattleAttackEntryScreenDrawingState
  dw BattleAttackEntryScreenMappingState
  dw BattleAttackEntryDoNothingState
  dw $4195
  dw $40B3
  dw $41B7
  dw $41DB
  dw $41F3
  dw $42D5
  dw $42FF
  dw $4319
  dw $4389
  dw $40B3
  dw $440F
  dw $4195
  dw $40B3
  dw $442A
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4439
  dw $40A0
  dw $4481
  dw $44F5
  dw $453F
  dw $4591
  dw $45AC
  dw $4623
  dw $4646
  dw $4439
  dw $40A0
  dw $46BE
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $46C4
  dw $4702
  dw $4735
  dw $474E
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4A9E
  dw $40A0
  dw $4ABE
  dw $4AD1
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $476B
  dw $47CB
  dw $4958
  dw $49D0
  dw $49DB
  dw $4AD7
  dw $4AD7
  dw $4AD7
  dw $4A0A
  dw $4A4E
  dw $4A62
  dw $4AD7

SECTION "Battle State Machine 2", ROMX[$4101], BANK[$0A]
BattleAttackEntryScreenDrawingState::
  ld bc, $70
  call WrapLoadMaliasGraphics
  ld bc, $71
  call WrapLoadMaliasGraphics
  ld bc, $72
  call WrapLoadMaliasGraphics
  ld bc, $73
  call WrapLoadMaliasGraphics
  ld bc, $74
  call WrapLoadMaliasGraphics
  ld a, [W_EncounterTerrainListItemIndex]
  ld b, 0
  ld c, a
  ld hl, $80
  add hl, bc
  ld b, h
  ld c, l
  call WrapLoadMaliasGraphics
  ld bc, $B
  call $33C6
  jp IncSubStateIndex

BattleAttackEntryScreenMappingState::
  ld bc, 0
  ld e, $54
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $54
  ld a, 0
  call WrapDecompressAttribmap0
  ld a, [W_EncounterTerrainListItemIndex]
  add $A0
  ld e, a
  ld bc, $400
  ld a, 0
  call WrapDecompressTilemap0
  ld a, [W_EncounterTerrainListItemIndex]
  add $A0
  ld e, a
  ld bc, $400
  ld a, 0
  call WrapDecompressAttribmap0
  ld bc, $C
  ld e, $55
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, $C
  ld e, $55
  ld a, 0
  call WrapDecompressAttribmap0
  call $5589
  call $56B1
  call $56BF
  call MapAttackNamesForBattle
  call $59C3
  jp IncSubStateIndex

BattleAttackEntryDoNothingState::
  jp IncSubStateIndex

INCLUDE "game/src/common/constants.asm"

SECTION "Battle State Machine 1", ROMX[$4000], BANK[$0A]
BattleStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $40C1 ; 00
  dw $40EF ; 01
  dw BattleAttackEntryScreenDrawingState ; 02
  dw BattleAttackEntryScreenMappingState ; 03
  dw BattleAttackEntryDoNothingState ; 04
  dw $4195 ; 05
  dw $40B3 ; 06
  dw $41B7 ; 07
  dw $41DB ; 08
  dw $41F3 ; 09
  dw BattleOptionOverlayMappingState ; 0A
  dw $42FF ; 0B
  dw $4319 ; 0C
  dw $4389 ; 0D
  dw $40B3 ; 0E
  dw $440F ; 0F
  dw $4195 ; 10
  dw $40B3 ; 11
  dw $442A ; 12
  dw BattlePlaceholderState ; 13
  dw BattlePlaceholderState ; 14
  dw BattlePlaceholderState ; 15
  dw BattlePlaceholderState ; 16
  dw BattlePlaceholderState ; 17
  dw BattlePlaceholderState ; 18
  dw BattlePlaceholderState ; 19
  dw BattlePlaceholderState ; 1A
  dw BattlePlaceholderState ; 1B
  dw BattlePlaceholderState ; 1C
  dw BattlePlaceholderState ; 1D
  dw BattlePlaceholderState ; 1E
  dw BattlePlaceholderState ; 1F
  dw $4439 ; 20
  dw $40A0 ; 21
  dw $4481 ; 22
  dw $44F5 ; 23
  dw $453F ; 24
  dw $4591 ; 25
  dw $45AC ; 26
  dw $4623 ; 27
  dw $4646 ; 28
  dw $4439 ; 29
  dw $40A0 ; 2A
  dw $46BE ; 2B
  dw BattlePlaceholderState ; 2C
  dw BattlePlaceholderState ; 2D
  dw BattlePlaceholderState ; 2E
  dw BattlePlaceholderState ; 2F
  dw $46C4 ; 30
  dw $4702 ; 31
  dw $4735 ; 32
  dw $474E ; 33
  dw BattlePlaceholderState ; 34
  dw BattlePlaceholderState ; 35
  dw BattlePlaceholderState ; 36
  dw BattlePlaceholderState ; 37
  dw $4A9E ; 38
  dw $40A0 ; 39
  dw $4ABE ; 3A
  dw $4AD1 ; 3B
  dw BattlePlaceholderState ; 3C
  dw BattlePlaceholderState ; 3D
  dw BattlePlaceholderState ; 3E
  dw BattlePlaceholderState ; 3F
  dw $476B ; 40
  dw $47CB ; 41
  dw $4958 ; 42
  dw $49D0 ; 43
  dw $49DB ; 44
  dw BattlePlaceholderState ; 45
  dw BattlePlaceholderState ; 46
  dw BattlePlaceholderState ; 47
  dw $4A0A ; 48
  dw $4A4E ; 49
  dw $4A62 ; 4A
  dw BattlePlaceholderState ; 4B

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

SECTION "Battle State Machine 3", ROMX[$42D5], BANK[$0A]
BattleOptionOverlayMappingState::
  xor a
  ld [$DCC9], a
  ld bc, 0
  ld e, $5E
  ld a, 0
  call WrapDecompressTilemap1
  ld bc, 0
  ld e, $5E
  ld a, 0
  call WrapDecompressAttribmap1
  ld a, $A0
  ld [W_ShadowREG_WX], a
  ld a, $88
  ld [W_ShadowREG_WY], a
  ld a, 1
  call $1554
  jp IncSubStateIndex

SECTION "Battle State Machine 4", ROMX[$4AD7], BANK[$0A]
BattlePlaceholderState::
  ret

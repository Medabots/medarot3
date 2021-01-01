INCLUDE "game/src/common/constants.asm"

SECTION "Parts State Machine 1", ROMX[$5EBB], BANK[$06]
PartsStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $5F72 ; 00
  dw $5F9F ; 01
  dw $6003 ; 02
  dw $5F67 ; 03
  dw $6026 ; 04
  dw $6084 ; 05
  dw $5F43 ; 06
  dw $5F67 ; 07
  dw $60BF ; 08
  dw $60D4 ; 09
  dw $60F8 ; 0A
  dw $60FE ; 0B
  dw $611D ; 0C
  dw $5F67 ; 0D
  dw $6140 ; 0E
  dw $60F8 ; 0F
  dw $6160 ; 10
  dw $5F67 ; 11
  dw $6172 ; 12
  dw $60FE ; 13
  dw $6178 ; 14
  dw $5F67 ; 15
  dw $619B ; 16
  dw PartsPlaceholderState ; 17
  dw PartsPlaceholderState ; 18
  dw PartsPlaceholderState ; 19
  dw $61A7 ; 1A
  dw $5F67 ; 1B
  dw $61B9 ; 1C
  dw PartsPlaceholderState ; 1D
  dw PartsPlaceholderState ; 1E
  dw PartsPlaceholderState ; 1F
  dw $5F43 ; 20
  dw $5F67 ; 21
  dw $61ED ; 22
  dw $54B5 ; 23
  dw $6205 ; 24
  dw $6235 ; 25
  dw $624E ; 26
  dw PartsPlaceholderState ; 27
  dw PartsPlaceholderState ; 28
  dw PartsPlaceholderState ; 29
  dw PartsPlaceholderState ; 2A
  dw PartsPlaceholderState ; 2B
  dw PartsPlaceholderState ; 2C
  dw PartsPlaceholderState ; 2D
  dw PartsPlaceholderState ; 2E
  dw PartsPlaceholderState ; 2F
  dw $6259 ; 30
  dw $6291 ; 31
  dw $62C8 ; 32
  dw $5F55 ; 33
  dw $5F67 ; 34
  dw $6308 ; 35
  dw PartsPlaceholderState ; 36
  dw PartsPlaceholderState ; 37
  dw PartsPlaceholderState ; 38
  dw PartsPlaceholderState ; 39
  dw PartsPlaceholderState ; 3A
  dw PartsPlaceholderState ; 3B
  dw PartsPlaceholderState ; 3C
  dw PartsPlaceholderState ; 3D
  dw PartsPlaceholderState ; 3E
  dw PartsPlaceholderState ; 3F

SECTION "Parts State Machine 2", ROMX[$6321], BANK[$06]
PartsPlaceholderState::
  ret

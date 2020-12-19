INCLUDE "game/src/common/constants.asm"

SECTION "Town Map State Machine 1", ROMX[$57DB], BANK[$06]
TownMapStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $5821
  dw $588F
  dw $58BF
  dw $58C2
  dw $58C5
  dw $58CD
  dw $58E6
  dw $58F1
  dw $5938
  dw $5947
  dw $58E6
  dw $5959
  dw $58C2
  dw $58C5
  dw $598B
  dw $5B92
  dw $5856
  dw $5B92
  dw $5B92
  dw $5B92
  dw $5A22
  dw $5A63
  dw $5A81
  dw $5AAB
  dw $5B08
  dw $5B36
  dw $5B54
  dw $5B6F
  dw $58E6
  dw $5B81
  dw $5B92

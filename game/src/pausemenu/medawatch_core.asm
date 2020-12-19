INCLUDE "game/src/common/constants.asm"

SECTION "Medawatch State Machine 1", ROMX[$5440], BANK[$06]
MedawatchStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $54B5
  dw $54F9
  dw $551D
  dw $54AA
  dw $5536
  dw $5548
  dw $555F
  dw $5584
  dw $54AA
  dw $5536
  dw PauseMenuOverlayMappingState
  dw PauseMenuPositionOverlayState
  dw $56A7
  dw $427C
  dw $559B
  dw $55D8
  dw $55FB
  dw $54AA
  dw $5612
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $561D
  dw $5639
  dw $565D
  dw $54AA
  dw $566F
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9
  dw $56B9

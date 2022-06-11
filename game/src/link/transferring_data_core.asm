INCLUDE "game/src/common/constants.asm"

; This state machine is most likely named incorrectly since the means by which one would trigger this screen normally is unclear.

SECTION "Transferring Data Screen State Machine 1", ROMX[$4BD1], BANK[$11]
TransferringDataStateMachine::
  call $2D04
  or a
  ret nz
  call $5FE9
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $4CEB
  dw $4D23
  dw $4D3B
  dw $4D55
  dw $4CAE
  dw $4CD7
  dw $4CDF
  dw $4CF8
  dw $4D67
  dw $4DBB
  dw $4DE3
  dw $4CF8
  dw $4D73
  dw $4CF8
  dw $4D84
  dw $4D09
  dw $4CAE
  dw $4DB5
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF

  dw $4DA1
  dw $4CC2
  dw $4DAA
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF

  dw $4CEB
  dw $4D23
  dw $4D3B
  dw $4D55
  dw $4CAE
  dw $4CD7
  dw $4CDF
  dw $4CF8
  dw $4D67
  dw $4E31
  dw $4E42
  dw $4CF8
  dw $4D73
  dw $4CF8
  dw $4D84
  dw $4D09
  dw $4CAE
  dw $4DB5
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF
  dw $4FFF

  dw $4E82
  dw $4EAC
  dw $4EE4
  dw $4CAE
  dw $4F10
  dw $4CC2
  dw $4F19
  dw $4F23
  dw $4F3D
  dw $4CA3
  dw $4F50
  dw $4F74
  dw $4F9B
  dw $4FAA
  dw $4CD7
  dw $4CDF
  dw $4CF8
  dw $4FB6
  dw $4FCE
  dw $4FD7
  dw $4CC2
  dw $4CB9
  dw $4CC2
  dw $4CF8
  dw $4CD7
  dw $4CDF
  dw $4CF8
  dw $4CEB
  dw $4D09
  dw $4CAE
  dw $4FEF
  dw $4FFF
  dw $4FFF

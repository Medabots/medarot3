INCLUDE "game/src/common/constants.asm"

SECTION "Medal Transfer Screen State Machine 1", ROMX[$4BD1], BANK[$11]
MedalTransferStateMachine::
  call $2D04
  or a
  ret nz
  call $5FE9
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $4CEB ;00
  dw $4D23 ;01
  dw $4D3B ;02
  dw $4D55 ;03
  dw $4CAE ;04
  dw $4CD7 ;05
  dw $4CDF ;06
  dw $4CF8 ;07
  dw $4D67 ;08
  dw $4DBB ;09
  dw $4DE3 ;0A
  dw $4CF8 ;0B
  dw $4D73 ;0C
  dw $4CF8 ;0D
  dw $4D84 ;0E
  dw $4D09 ;0F
  dw $4CAE ;10
  dw $4DB5 ;11
  dw $4FFF ;12
  dw $4FFF ;13
  dw $4FFF ;14
  dw $4FFF ;15
  dw $4FFF ;16
  dw $4FFF ;17

  dw $4DA1 ;18
  dw $4CC2 ;19
  dw $4DAA ;1A
  dw $4FFF ;1B
  dw $4FFF ;1C
  dw $4FFF ;1D
  dw $4FFF ;1E
  dw $4FFF ;1F

  dw $4CEB ;20
  dw $4D23 ;21
  dw $4D3B ;22
  dw $4D55 ;23
  dw $4CAE ;24
  dw $4CD7 ;25
  dw $4CDF ;26
  dw $4CF8 ;27
  dw $4D67 ;28
  dw $4E31 ;29
  dw $4E42 ;2A
  dw $4CF8 ;2B
  dw $4D73 ;2C
  dw $4CF8 ;2D
  dw $4D84 ;2E
  dw $4D09 ;2F
  dw $4CAE ;30
  dw $4DB5 ;31
  dw $4FFF ;32
  dw $4FFF ;33
  dw $4FFF ;34
  dw $4FFF ;35
  dw $4FFF ;36
  dw $4FFF ;37
  dw $4FFF ;38
  dw $4FFF ;39
  dw $4FFF ;3A
  dw $4FFF ;3B
  dw $4FFF ;3C
  dw $4FFF ;3D
  dw $4FFF ;3E
  dw $4FFF ;3F

  dw $4E82 ;40
  dw $4EAC ;41
  dw $4EE4 ;42
  dw $4CAE ;43
  dw $4F10 ;44
  dw $4CC2 ;45
  dw $4F19 ;46
  dw $4F23 ;47
  dw $4F3D ;48
  dw $4CA3 ;49
  dw $4F50 ;4A
  dw $4F74 ;4B
  dw $4F9B ;4C
  dw $4FAA ;4D
  dw $4CD7 ;4E
  dw $4CDF ;4F
  dw $4CF8 ;50
  dw $4FB6 ;51
  dw $4FCE ;52
  dw $4FD7 ;53
  dw $4CC2 ;54
  dw $4CB9 ;55
  dw $4CC2 ;56
  dw $4CF8 ;57
  dw $4CD7 ;58
  dw $4CDF ;59
  dw $4CF8 ;5A
  dw $4CEB ;5B
  dw $4D09 ;5C
  dw $4CAE ;5D
  dw $4FEF ;5E
  dw $4FFF ;5F
  dw $4FFF ;60

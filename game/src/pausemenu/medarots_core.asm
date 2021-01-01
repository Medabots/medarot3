INCLUDE "game/src/common/constants.asm"

SECTION "Medarots State Machine 1", ROMX[$401B], BANK[$07]
MedarotsStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $4105 ; 00
  dw $413D ; 01
  dw $4171 ; 02
  dw $40D7 ; 03
  dw $41AD ; 04
  dw $40D1 ; 05
  dw $424E ; 06
  dw MedarotsPlaceholderState ; 07
  dw $427E ; 08
  dw $40D7 ; 09
  dw $4290 ; 0A
  dw MedarotsPlaceholderState ; 0B
  dw $4266 ; 0C
  dw MedarotsPlaceholderState ; 0D
  dw MedarotsPlaceholderState ; 0E
  dw MedarotsPlaceholderState ; 0F
  dw $4296 ; 10
  dw $42C0 ; 11
  dw $432A ; 12
  dw $40D7 ; 13
  dw $433C ; 14
  dw $40F3 ; 15
  dw $40D7 ; 16
  dw $439A ; 17
  dw MedarotsPlaceholderState ; 18
  dw MedarotsPlaceholderState ; 19
  dw $4296 ; 1A
  dw $42C0 ; 1B
  dw $4449 ; 1C
  dw $4463 ; 1D
  dw MedarotsPlaceholderState ; 1E
  dw MedarotsPlaceholderState ; 1F
  dw $427E ; 20
  dw $40D7 ; 21
  dw $4469 ; 22
  dw MedarotsPlaceholderState ; 23
  dw MedarotsPlaceholderState ; 24
  dw MedarotsPlaceholderState ; 25
  dw MedarotsPlaceholderState ; 26
  dw MedarotsPlaceholderState ; 27
  dw MedarotsPlaceholderState ; 28
  dw MedarotsPlaceholderState ; 29
  dw MedarotsPlaceholderState ; 2A
  dw MedarotsPlaceholderState ; 2B
  dw MedarotsPlaceholderState ; 2C
  dw MedarotsPlaceholderState ; 2D
  dw MedarotsPlaceholderState ; 2E
  dw MedarotsPlaceholderState ; 2F
  dw $446E ; 30
  dw $44CE ; 31
  dw $40F3 ; 32
  dw $40D7 ; 33
  dw $4593 ; 34
  dw $4503 ; 35
  dw $453D ; 36
  dw $40D7 ; 37
  dw $454F ; 38
  dw $40F3 ; 39
  dw $40D7 ; 3A
  dw $42C0 ; 3B
  dw $4471 ; 3C
  dw $4565 ; 3D
  dw $40D7 ; 3E
  dw $458D ; 3F
  dw $459F ; 40
  dw $40F3 ; 41
  dw $40D7 ; 42
  dw $4593 ; 43
  dw $45BE ; 44
  dw $45E5 ; 45
  dw $4615 ; 46
  dw $462E ; 47
  dw MedarotsPlaceholderState ; 48
  dw MedarotsPlaceholderState ; 49
  dw MedarotsPlaceholderState ; 4A
  dw MedarotsPlaceholderState ; 4B
  dw MedarotsPlaceholderState ; 4C
  dw MedarotsPlaceholderState ; 4D
  dw MedarotsPlaceholderState ; 4E
  dw MedarotsPlaceholderState ; 4F
  dw $4639 ; 50
  dw $469F ; 51
  dw $46D2 ; 52
  dw $40F3 ; 53
  dw $40D7 ; 54
  dw $46DD ; 55
  dw MedarotsPlaceholderState ; 56

SECTION "Medarots State Machine 2", ROMX[$46FE], BANK[$07]
MedarotsPlaceholderState::
  ret

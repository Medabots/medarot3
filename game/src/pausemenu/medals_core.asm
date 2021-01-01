INCLUDE "game/src/common/constants.asm"

SECTION "Medals State Machine 1", ROMX[$401B], BANK[$02]
MedalsStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $4133 ; 00
  dw $415D ; 01
  dw $41CE ; 02
  dw $4128 ; 03
  dw $41F5 ; 04
  dw $4254 ; 05
  dw $425F ; 06
  dw $426A ; 07
  dw MedalsPlaceholderState ; 08
  dw MedalsPlaceholderState ; 09
  dw MedalsPlaceholderState ; 0A
  dw MedalsPlaceholderState ; 0B
  dw MedalsPlaceholderState ; 0C
  dw MedalsPlaceholderState ; 0D
  dw MedalsPlaceholderState ; 0E
  dw MedalsPlaceholderState ; 0F
  dw $4583 ; 10
  dw $4128 ; 11
  dw $42A7 ; 12
  dw $42D1 ; 13
  dw $432A ; 14
  dw $4125 ; 15
  dw $4128 ; 16
  dw $433C ; 17
  dw $4254 ; 18
  dw $425F ; 19
  dw $426A ; 1A
  dw $4583 ; 1B
  dw $4128 ; 1C
  dw $4361 ; 1D
  dw MedalsPlaceholderState ; 1E
  dw MedalsPlaceholderState ; 1F
  dw $4583 ; 20
  dw $4128 ; 21
  dw $42A7 ; 22
  dw $4392 ; 23
  dw $43D6 ; 24
  dw $4128 ; 25
  dw $43E8 ; 26
  dw $4254 ; 27
  dw $425F ; 28
  dw $426A ; 29
  dw MedalsPlaceholderState ; 2A
  dw MedalsPlaceholderState ; 2B
  dw MedalsPlaceholderState ; 2C
  dw MedalsPlaceholderState ; 2D
  dw MedalsPlaceholderState ; 2E
  dw MedalsPlaceholderState ; 2F
  dw $4583 ; 30
  dw $4128 ; 31
  dw $42A7 ; 32
  dw $441B ; 33
  dw $4458 ; 34
  dw $4128 ; 35
  dw $446A ; 36
  dw $4254 ; 37
  dw $425F ; 38
  dw $426A ; 39
  dw MedalsPlaceholderState ; 3A
  dw MedalsPlaceholderState ; 3B
  dw MedalsPlaceholderState ; 3C
  dw MedalsPlaceholderState ; 3D
  dw MedalsPlaceholderState ; 3E
  dw MedalsPlaceholderState ; 3F
  dw $4583 ; 40
  dw $4128 ; 41
  dw $42A7 ; 42
  dw $44A3 ; 43
  dw $44F3 ; 44
  dw $4128 ; 45
  dw $451A ; 46
  dw $453D ; 47
  dw MedalsPlaceholderState ; 48
  dw $457D ; 49
  dw MedalsPlaceholderState ; 4A
  dw MedalsPlaceholderState ; 4B
  dw MedalsPlaceholderState ; 4C
  dw MedalsPlaceholderState ; 4D
  dw MedalsPlaceholderState ; 4E
  dw MedalsPlaceholderState ; 4F
  dw $4583 ; 50
  dw $4128 ; 51
  dw $4595 ; 52
  dw $45AB ; 53
  dw $45D2 ; 54
  dw $4602 ; 55
  dw $461B ; 56
  dw MedalsPlaceholderState ; 57
  dw MedalsPlaceholderState ; 58
  dw MedalsPlaceholderState ; 59
  dw $63C5 ; 5A
  dw $644B ; 5B
  dw MedalsPlaceholderState ; 5C
  dw MedalsPlaceholderState ; 5D
  dw MedalsPlaceholderState ; 5E
  dw MedalsPlaceholderState ; 5F
  dw $4626 ; 60
  dw $465E ; 61
  dw $4695 ; 62
  dw $46E0 ; 63
  dw $473B ; 64
  dw MedalsPlaceholderState ; 65
  dw $4762 ; 66
  dw $4786 ; 67
  dw $4797 ; 68
  dw $47BE ; 69
  dw $4128 ; 6A
  dw $47D0 ; 6B
  dw MedalsPlaceholderState ; 6C
  dw MedalsPlaceholderState ; 6D
  dw MedalsPlaceholderState ; 6E
  dw MedalsPlaceholderState ; 6F
  dw $4583 ; 70
  dw $4128 ; 71
  dw $47DA ; 72
  dw MedalsPlaceholderState ; 73
  dw MedalsPlaceholderState ; 74
  dw MedalsPlaceholderState ; 75
  dw MedalsPlaceholderState ; 76
  dw MedalsPlaceholderState ; 77
  dw MedalsPlaceholderState ; 78
  dw MedalsPlaceholderState ; 79
  dw MedalsPlaceholderState ; 7A
  dw MedalsPlaceholderState ; 7B
  dw MedalsPlaceholderState ; 7C
  dw MedalsPlaceholderState ; 7D
  dw MedalsPlaceholderState ; 7E
  dw MedalsPlaceholderState ; 7F
  dw MedalsPlaceholderState ; 80

SECTION "Medals State Machine 2", ROMX[$47E5], BANK[$02]
MedalsPlaceholderState::
  ret

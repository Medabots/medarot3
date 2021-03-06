INCLUDE "game/src/common/constants.asm"
  
SECTION "Naming Screen Variables 1", WRAM0[$C48E]
W_NamingScreenEnteredTextLength:: ds 1
  
SECTION "Naming Screen Variables 2", WRAM0[$C502]
W_NamingScreenEnteredTextBuffer:: ds 9
  
SECTION "Naming Screen Variables 3", WRAM0[$C581]
W_NamingScreenExitIndicator:: ds 1
  
SECTION "Naming Screen Variables 4", WRAM0[$C760]
W_NamingScreenSubSubSubStateIndex:: ds 1

SECTION "Naming Screen State Machine", ROMX[$48A6], BANK[$01]
NamingScreenStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw NamingScreenPlayerNamingState
  dw NamingScreenExitAState
  dw NamingScreenTinpetNamingState
  dw NamingScreenExitAState
  dw NamingScreenExitBState

NamingScreenPlayerNamingState::
  call PlayerNamingScreenStateMachine
  ld a, [W_NamingScreenExitIndicator]
  or a
  ret z
  jp IncSubStateIndex

NamingScreenTinpetNamingState::
  call TinpetNamingScreenStateMachine
  ld a, [W_NamingScreenExitIndicator]
  or a
  ret z
  cp 2
  jr z, .jpA
  jp IncSubStateIndex

.jpA
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

NamingScreenExitAState::
  ld a, 8
  ld [W_CoreStateIndex], a
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ld a, 1
  ld [$CD91], a
  ret

NamingScreenExitBState::
  ld a, 8
  ld [W_CoreStateIndex], a
  ld a, 5
  ld [W_CoreSubStateIndex], a
  xor a
  ld [$CD91], a
  ret

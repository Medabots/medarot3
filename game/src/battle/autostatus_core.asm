INCLUDE "game/src/common/constants.asm"

SECTION "Autobattle Config State Machine 1", ROMX[$6DA9], BANK[$10]
BattleAutoConfigStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw BattleAutoConfigDrawingState
  dw BattleAutoConfigMappingState
  dw BattleAutoConfigPrepareFadeInState
  dw BattleAutoConfigFadeState
  dw $6E3E
  dw $6E6E
  dw $6E90
  dw $6ECA
  dw $6EE2
  dw $6F1B

BattleAutoConfigFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, 6
  rst 8
  jp IncSubStateIndex

BattleAutoConfigDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $75
  call WrapLoadMaliasGraphics
  ld bc, 8
  call $33C6
  jp IncSubStateIndex

BattleAutoConfigMappingState::
  xor a
  ld [$DCCA], a
  ld [$DCCB], a
  ld [$DCCC], a
  ld bc, 0
  ld e, $60
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $60
  ld a, 0
  call WrapDecompressAttribmap0
  call WrapInitiateMainScript
  call $6F40
  call $7113
  call $7136
  call $7382
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

BattleAutoConfigPrepareFadeInState::
  ld hl, $7D
  ld bc, $16
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

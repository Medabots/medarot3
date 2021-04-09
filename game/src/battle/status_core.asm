INCLUDE "game/src/common/constants.asm"

SECTION "Battle Status State Machine 1", ROMX[$64C4], BANK[$10]
BattleStatusStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw BattleStatusDrawingState
  dw BattleStatusMappingState
  dw BattleStatusPrepareFadeInState
  dw BattleStatusFadeState
  dw BattleStatusInputHandlerState
  dw BattleStatusPrepareFadeOutState
  dw BattleStatusFadeState
  dw BattleStatusPreExitRedrawState
  dw BattleStatusExitState
  dw BattleStatusPlaceholderState

BattleStatusFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  ld a, 6
  rst 8
  jp IncSubStateIndex

BattleStatusDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $15
  call WrapLoadMaliasGraphics
  ld bc, $17
  call WrapLoadMaliasGraphics
  ld bc, $76
  call WrapLoadMaliasGraphics
  ld bc, 7
  call $33C6
  jp IncSubStateIndex

BattleStatusMappingState::
  xor a
  ld [$DCCA], a
  ld bc, 0
  ld e, $5F
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $5F
  ld a, 0
  call WrapDecompressAttribmap0
  call $662B
  call $69DB
  call $6B66
  call $6C2D
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

BattleStatusPrepareFadeInState::
  ld hl, $7C
  ld bc, 3
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  call $69BD
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  ld a, 6
  rst 8
  jp IncSubStateIndex

BattleStatusInputHandlerState::
  ld de, $C0A0
  call $33B7
  call $6C69
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputB
  ret z
  ld a, 4
  call ScheduleSoundEffect
  jp IncSubStateIndex

BattleStatusPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

BattleStatusPreExitRedrawState::
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
  ld a, 1
  rst 8
  ld hl, $D000
  ld de, $C0A0
  ld bc, $3C0
  call memcpy
  ld a, 0
  ld [$C4EE], a
  ld a, $14
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, $12
  ld [$C4F1], a
  ld a, 1
  call $123B
  ld a, 6
  rst 8
  jp IncSubStateIndex

BattleStatusExitState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [$C522]
  cp 2
  jr z, .isLink
  ld a, $10
  ld [W_CoreStateIndex], a
  ld a, $10
  ld [W_CoreSubStateIndex], a
  ret

.isLink
  ld a, $1C
  ld [W_CoreStateIndex], a
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

BattleStatusPlaceholderState::
  ret

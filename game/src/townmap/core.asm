INCLUDE "game/src/common/constants.asm"

SECTION "Town Map Variables 1", WRAM0[$CD45]
W_IsTownMapWindOfWings:: ds 1

SECTION "Town Map State Machine 1", ROMX[$57DB], BANK[$06]
TownMapStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw TownMapDrawingState ; 00
  dw TownMapMappingState ; 01
  dw TownMapDoNothingAState ; 02
  dw TownMapDoNothingBState ; 03
  dw TownMapUpdateSpritesState ; 04
  dw TownMapPrepareFadeInState ; 05
  dw TownMapFadeState ; 06
  dw TownMapInputHandlerState ; 07
  dw TownMapRepositionCursorState ; 08
  dw TownMapPrepareFadeOutForExitState ; 09
  dw TownMapFadeState ; 0A
  dw TownMapConditionalExitState ; 0B
  dw TownMapDoNothingBState ; 0C
  dw TownMapUpdateSpritesState ; 0D
  dw TownMapExitState ; 0E
  dw TownMapPlaceholderState ; 0F
  dw TownMapDrawingStateForWindOfWings ; 10
  dw TownMapPlaceholderState ; 11
  dw TownMapPlaceholderState ; 12
  dw TownMapPlaceholderState ; 13
  dw $5A22 ; 14
  dw $5A63 ; 15
  dw $5A81 ; 16
  dw $5AAB ; 17
  dw $5B08 ; 18
  dw $5B36 ; 19
  dw $5B54 ; 1A
  dw TownMapPrepareFadeOutToDestinationState ; 1B
  dw TownMapFadeState ; 1C
  dw TownMapExitToDestinationState ; 1D
  dw TownMapPlaceholderState ; 1E

TownMapDrawingState::
  call $3433
  call $3413
  call $343B
  call $3475
  ld bc, $6D
  call WrapLoadMaliasGraphics
  ld bc, $6E
  call WrapLoadMaliasGraphics
  ld bc, $33
  call $33C6
  ld bc, $34
  call $33C6
  xor a
  ld [W_MedalMenuWaitTimer], a
  ld [W_MedalMenuSkillBarAnimationStage], a
  call $5CC3
  xor a
  ld [W_IsTownMapWindOfWings], a
  jp IncSubStateIndex

TownMapDrawingStateForWindOfWings::
  call $3433
  call $3413
  call $343B
  call $3475
  ld bc, $6D
  call WrapLoadMaliasGraphics
  ld bc, $6E
  call WrapLoadMaliasGraphics
  ld bc, $33
  call $33C6
  ld bc, $35
  call $33C6
  xor a
  ld [W_MedalMenuWaitTimer], a
  ld [W_MedalMenuSkillBarAnimationStage], a
  call $5CC3
  ld a, 1
  ld [W_IsTownMapWindOfWings], a
  ld a, 1
  ld [W_CoreSubStateIndex], a
  ret

TownMapMappingState::
  ld a, [$CD44]
  ld bc, 0
  ld e, $31
  add e
  ld e, a
  ld a, 1
  call WrapDecompressAttribmap0
  ld a, [$CD44]
  ld bc, 0
  ld e, $40
  add e
  ld e, a
  ld a, 1
  call WrapDecompressTilemap0
  call $5B93
  call $5BD7
  call WrapInitiateMainScript
  call $5BE2
  call $5C81
  jp IncSubStateIndex

TownMapDoNothingAState::
  jp IncSubStateIndex

TownMapDoNothingBState::
  jp IncSubStateIndex

TownMapUpdateSpritesState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

TownMapPrepareFadeInState::
  ld a, [$CD44]
  ld hl, $53
  ld d, 0
  ld e, a
  add hl, de
  ld bc, 2
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

TownMapFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

TownMapInputHandlerState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld de, $C0C0
  call $33B7
  ld de, $C100
  call $33B7
  call $5BF7
  or a
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, [W_IsTownMapWindOfWings]
  or a
  jr z, .notWindOfWings
  ld a, [$C48F]
  cp $C
  jr nz, .canTransportToDestination
  ld a, 5
  call ScheduleSoundEffect
  ret

.canTransportToDestination
  ld a, $14
  ld [W_CoreSubStateIndex], a
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  ret z

.notWindOfWings
  ld a, 4
  call ScheduleSoundEffect
  ld a, 9
  ld [W_CoreSubStateIndex], a
  ret

TownMapRepositionCursorState::
  ld de, $C0C0
  call $33B7
  call $5BE2
  ld a, 7
  ld [W_CoreSubStateIndex], a
  ret

TownMapPrepareFadeOutForExitState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

TownMapConditionalExitState::
  ld a, [W_IsTownMapWindOfWings]
  or a
  jr z, .notWindOfWings
  ld a, 9
  ld [W_CoreStateIndex], a
  ld a, $38
  ld [W_CoreSubStateIndex], a
  ret

.notWindOfWings
  call $3475
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $18
  call WrapLoadMaliasGraphics
  ld bc, 5
  call $33C6
  call WrapInitiateMainScript
  jp IncSubStateIndex

TownMapExitState::
  ld a, [W_IsTownMapWindOfWings]
  or a
  jr nz, .isWindOfWings ; This jump should realistically never fire.
  ld a, 0
  ld [$C4EE], a
  ld a, $14
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, $12
  ld [$C4F1], a
  ld a, 3
  call $123B
  ld a, $B
  ld [W_CoreStateIndex], a
  ld a, 1
  ld [W_CoreSubStateIndex], a
  ret

.isWindOfWings
  ld a, $14
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Town Map State Machine 2", ROMX[$5B6F], BANK[$06]
TownMapPrepareFadeOutToDestinationState::
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

TownMapExitToDestinationState::
  call $5DF7
  xor a
  ld [$C63A], a
  ld a, 8
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

TownMapPlaceholderState::
  ret

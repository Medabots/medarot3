INCLUDE "game/src/common/constants.asm"

SECTION "Save Menu State Machine 1", ROMX[$526C], BANK[$06]
SaveMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw SaveMenuDrawingState
  dw SaveMenuMappingState
  dw SaveMenuPrepareFadeIn
  dw SaveMenuFadeInState
  dw SaveMenuInputHandlerState
  dw $5328
  dw SaveMenuPrepareScriptEngineState
  dw SaveMenuSavingMessageState
  dw SaveMenuExitState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  dw SaveMenuPlaceholderState
  
SaveMenuFadeInState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

SaveMenuDrawingState::
  call $3475
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $18
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

SaveMenuMappingState::
  ld bc, 0
  ld e, $50
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $50
  ld a, 0
  call WrapDecompressAttribmap0
  ld bc, W_PlayerName
  ld a, 8
  call GetTileBasedCenteringOffset
  ld d, 0
  ld e, a
  ld hl, $9823
  add hl, de
  ld a, 8
  call PutStringVariableLength
  call $5360
  call $5388
  call $53BC
  call $5407
  jp IncSubStateIndex

SaveMenuPrepareFadeIn::
  ld hl, $2D
  ld bc, $16
  ld d, $BF
  ld e, $F0
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

SaveMenuInputHandlerState::
  call $5781
  ld a, 3
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, IncSubStateIndex

.noSelected
  ld hl, 1
  ld bc, 1
  ld d, $BF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, $A
  ld [W_CoreStateIndex], a
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Save Menu State Machine 2", ROMX[$532F], BANK[$06]
SaveMenuPrepareScriptEngineState::
  call WrapInitiateMainScript
  jp IncSubStateIndex

SaveMenuSavingMessageState::
  ld bc, 5
  ld a, 2
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

SaveMenuExitState::
  ld hl, 1
  ld bc, 1
  ld d, $BF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, $A
  ld [W_CoreStateIndex], a
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

SaveMenuPlaceholderState::
  ret

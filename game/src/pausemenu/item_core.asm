INCLUDE "game/src/common/constants.asm"

SECTION "Item Menu State Machine 1", ROMX[$4B3F], BANK[$06]
ItemMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw ItemMenuDrawingState
  dw ItemMenuMappingState
  dw ItemMenuPrepareFadeInState
  dw ItemMenuFadeInState
  dw ItemMenuItemSelectionInputHandlerState
  dw ItemMenuUseItemConfirmationState
  dw ItemMenuAttemptToUseItemState
  dw ItemMenuPrepareScriptEngineState
  dw ItemMenuCantUseMessageState
  dw ItemMenuPlaceholderState
  dw ItemMenuPrepareScriptEngineState
  dw ItemMenuCantUseHereMessageState
  dw ItemMenuPlaceholderState
  dw ItemMenuPlaceholderState
  dw ItemMenuPlaceholderState
  dw ItemMenuPlaceholderState
  dw ItemMenuTriggerSpecialItemActionState
  dw ItemMenuPlaceholderState
  
ItemMenuPrepareScriptEngineState::
  call WrapInitiateMainScript
  jp IncSubStateIndex

ItemMenuFadeInState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

ItemMenuDrawingState::
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

ItemMenuMappingState::
  ld bc, 0
  ld e, $4F
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $4F
  ld a, 0
  call WrapDecompressAttribmap0
  call ItemMenuCountPages
  call ItemMenuMapPageIndicator
  call ItemMenuPrintPageItemNames
  call ItemMenuDetermineSelectedItemInventorySlot
  call ItemMenuPrintSelectedItemQuantity
  call LoadSelectedItemDescription
  call ItemMenuShowPageArrows
  call $4DFA
  ld a, 1
  ld [W_OAM_SpritesReady], a
  jp IncSubStateIndex

ItemMenuPrepareFadeInState::
  ld hl, $2C
  ld bc, $16
  ld d, $FF
  ld e, $F0
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

ItemMenuItemSelectionInputHandlerState::
  call $5781
  ld de, $C0C0
  call $33B7
  call ItemMenuAnimatePageArrows
  call $4E07
  call $4EF2
  call $4E31
  call $4F96
  call $4FDA
  call $5055
  ld a, [$C4EE]
  or a
  jp nz, IncSubStateIndex
  call $5031
  ld a, [$C4EE]
  cp 1
  ret nz

.doExit
  ld a, $A
  ld [W_CoreStateIndex], a
  ld a, 7
  ld [W_CoreSubStateIndex], a
  ret

ItemMenuUseItemConfirmationState::
  call $5781
  ld a, 2
  call $35DA
  ld a, [$C771]
  or a
  ret z
  cp 1
  jp z, IncSubStateIndex
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

ItemMenuAttemptToUseItemState::
  call ItemMenuDetermineSelectedItemInventorySlot
  call $507B
  or a
  jp z, IncSubStateIndex
  ld [W_ItemActionSubSubStateIndex], a
  call $5094
  or a
  jr z, .canBeUsedFromItemMenu
  ld a, $A
  ld [W_CoreSubStateIndex], a
  ret

.canBeUsedFromItemMenu
  xor a
  ld [W_ItemActionSubSubSubStateIndex], a
  ld a, $10
  ld [W_CoreSubStateIndex], a
  ret

ItemMenuCantUseMessageState::
  ld bc, $20
  ld a, 1
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  call LoadSelectedItemDescription
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

ItemMenuCantUseHereMessageState::
  ld bc, $21
  ld a, 1
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  call LoadSelectedItemDescription
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

ItemMenuTriggerSpecialItemActionState::
  jp $50AD

ItemMenuPlaceholderState::
  ret

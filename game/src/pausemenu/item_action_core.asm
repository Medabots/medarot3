INCLUDE "game/src/common/constants.asm"

SECTION "Current Player Costume",  WRAM0[$C650]
W_CurrentPlayerCostume:: ds 1

SECTION "Item Action State Machine 1", ROMX[$50AD], BANK[$06]
ItemActionStateMachine::
  ld a, [W_ItemActionSubSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw ItemActionPlaceholderState
  dw ItemActionTownMapStateMachine
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionCostumeStateMachine
  dw ItemActionCostumeStateMachine
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionPlaceholderState
  dw ItemActionCostumeStateMachine
  dw ItemActionPlaceholderState
 
ItemActionPlaceholderState::
  ret

ItemActionTownMapStateMachine::
  ld a, [W_ItemActionSubSubSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw ItemActionTownMapUsabilityCheckState
  dw ItemActionPrepareScriptEngineState
  dw ItemActionPrintErrorMessageState
  dw ItemActionTownMapPlaceholderState
  dw ItemActionPrepareFadeOutState
  dw ItemActionFadeState
  dw ItemActionOpenTownMapState

ItemActionTownMapPlaceholderState::
  ret

ItemActionTownMapUsabilityCheckState::
  ld a, [$C65F]
  and $20
  jr z, .itemCanBeUsedHere
  ld bc, $22
  call ItemActionStoreMessageIndex
  jp IncItemActionSubSubSubStateIndex

.itemCanBeUsedHere
  ld a, 4
  ld [W_ItemActionSubSubSubStateIndex], a
  ret

ItemActionOpenTownMapState::
  ld a, 0
  ld [$C4EE], a
  ld a, $14
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, $12
  ld [$C4F1], a
  ld a, 3
  call $1153
  ld a, $2E
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Item Action State Machine 2", ROMX[$512F], BANK[$06]
ItemActionPrepareScriptEngineState::
  call WrapInitiateMainScript
  jp IncItemActionSubSubSubStateIndex

ItemActionPrintErrorMessageState::
  ld a, [W_ItemActionMessageIndex]
  ld b, a
  ld a, [W_ItemActionMessageIndex + 1]
  ld c, a
  ld a, 1
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  call LoadSelectedItemDescription
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

ItemActionPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncItemActionSubSubSubStateIndex
 
ItemActionFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncItemActionSubSubSubStateIndex

SECTION "Item Action State Machine 3", ROMX[$5172], BANK[$06]
ItemActionCostumeStateMachine::
  ld a, [W_ItemActionSubSubSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw ItemActionCostumeDoNothingState
  dw ItemActionCostumeUsabilityCheckState
  dw ItemActionPrepareScriptEngineState
  dw ItemActionPrintErrorMessageState
  dw ItemActionPrepareFadeOutState
  dw ItemActionFadeState
  dw ItemActionCostumeSetCostumeState
  dw ItemActionCostumeLoadOverworldState
  dw ItemActionCostumeDoNothingAgainState
  dw ItemActionCostumeUpdateSpritesState
  dw ItemActionCostumePrepareFadeInState
  dw ItemActionFadeState
  dw ItemActionCostumeExitState

ItemActionCostumeDoNothingState::
  jp IncItemActionSubSubSubStateIndex

ItemActionCostumeUsabilityCheckState::
  ld a, [$C65F]
  and 1
  jp z, .itemCanBeUsedHereMaybe

.itemCantBeUsedHere
  ld bc, $22
  call ItemActionStoreMessageIndex
  jp IncItemActionSubSubSubStateIndex

.itemCanBeUsedHereMaybe
  ld a, [W_CurrentPlayerCostume]
  cp 6
  jr z, .itemCantBeUsedHere
  ld a, 4
  ld [W_ItemActionSubSubSubStateIndex], a
  ret

ItemActionCostumeSetCostumeState::
  ld a, [W_ItemActionSubSubStateIndex]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld b, a
  ld a, [W_CurrentPlayerCostume]
  cp b
  jr z, .resetCostume
  ld a, b
  ld [W_CurrentPlayerCostume], a
  jr  .continue

.resetCostume
  ld a, 0
  ld [W_CurrentPlayerCostume], a
 
 .continue
   ld a, [W_CurrentPlayerCostume]
   ld [$C62C], a
   call $3496
   xor a
   call $349E
   call $33C6
   ld a, 1
   call $349E
   call $33C6
   jp IncItemActionSubSubSubStateIndex

.table
  db 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, $A, $B, $C, $D

ItemActionCostumeLoadOverworldState::
  ld a, 0
  call $1554
  ld a, 5
  rst 8
  ld hl, $DA18
  ld de, $C0A0
  ld bc, $3C0
  call memcpy
  ld a, [$C622]
  ld b, a
  ld a, [$C623]
  ld c, a
  call WrapLoadMaliasGraphics
  call $33E4
  xor a
  call $349E
  call $34C8
  ld a, 0
  ld de, $C100
  call $242E
  call $346D
  call $4B27
  jp IncItemActionSubSubSubStateIndex

ItemActionCostumeDoNothingAgainState::
  jp IncItemActionSubSubSubStateIndex

ItemActionCostumeUpdateSpritesState::
  ld a, 1
  ld [W_OAM_SpritesReady],a
  jp IncItemActionSubSubSubStateIndex

ItemActionCostumePrepareFadeInState::
  ld a, [$C628]
  ld h, a
  ld a, [$C629]
  ld l, a
  ld bc, $10
  ld d, $3F
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncItemActionSubSubSubStateIndex

ItemActionCostumeExitState::
  ld a, 1
  ld [$C106], a
  xor a
  ld [$C0A6], a
  ld a, 8
  ld [W_CoreStateIndex], a
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

INCLUDE "game/src/common/constants.asm"

SECTION "Pause Menu Vars 1", WRAM0[$C490]
W_PauseMenuPerserveSCX:: ds 1
W_PauseMenuPerserveSCY:: ds 1

SECTION "Pause Menu Vars 2", WRAM0[$C562]
W_PauseMenuSelectedOption:: ds 1

SECTION "Pause Menu State Machine 1", ROMX[$4000], BANK[$06]
PauseMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw PauseMenuInitState
  dw $40E4
  dw $4105
  dw PauseMenuMappingState
  dw PauseMenuInputHandlerState
  ; Exit states.
  dw $417E
  dw $419E
  dw PauseMenuDoNothingState
  dw $41C2
  dw PauseMenuExitState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 1 (Medarot) states.
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw PauseMenuPreserveSpriteConfigState
  dw PauseMenuOverlayMappingState
  dw PauseMenuPositionOverlayState
  dw PauseMenuClearScrollPositionState
  dw $427C
  dw $429D
  dw PauseMenuOpenMedarotMenuState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 2 (Item) states.
  dw PauseMenuCanOpenItemMenuCheckState
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw PauseMenuPreserveSpriteConfigState
  dw PauseMenuOverlayMappingState
  dw PauseMenuPositionOverlayState
  dw PauseMenuClearScrollPositionState
  dw $427C
  dw $429D
  dw PauseMenuOpenItemMenuState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 3 states.
  dw $4308
  dw $4338
  dw $435D
  dw $4395
  dw $43E7
  dw $441A
  dw $4458
  dw $4487
  dw $449A
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  ; Option 4 (Save) states.
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw PauseMenuPreserveSpriteConfigState
  dw PauseMenuOverlayMappingState
  dw PauseMenuPositionOverlayState
  dw PauseMenuClearScrollPositionState
  dw $427C
  dw $429D
  dw PauseMenuOpenSaveScreenState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPlaceholderState
  dw PauseMenuPrepareMessageBoxState
  dw PauseMenuDisplayMessageState
  dw PauseMenuPlaceholderState

PauseMenuFadeOutState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

PauseMenuPreserveSpriteConfigState::
  ld a, 5
  rst 8
  ld hl, $C0A0
  ld de, $DA18
  ld bc, $3C0
  call memcpy
  jp IncSubStateIndex

PauseMenuInitState::
  ld a, 1
  ld [$C4D9], a
  ld a, 1
  ld [$C498], a
  ld a, [W_ShadowREG_SCX]
  ld [W_PauseMenuPerserveSCX], a
  ld a, [W_ShadowREG_SCY]
  ld [W_PauseMenuPerserveSCY], a
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 2", ROMX[$4118], BANK[$06]
PauseMenuMappingState::
  ld a, 1
  ld [$C4D9], a
  ld bc, $C00
  ld e, $12
  ld a, 0
  call $33D5
  ld bc, $C00
  ld e, $12
  ld a, 0
  call $33DA
  ld bc, 3
  ld a, 6
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  call $47F5
  jp IncSubStateIndex

PauseMenuInputHandlerState::
  ld a, 1
  ld [$C4D9], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call $483C
  xor a
  call $4880
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  ld a, 3
  call $27DA
  ld a, 1
  call $4880
  ld a, [$C562]
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_CoreSubStateIndex], a
  ret

.table
  db $10,$20,$30,$40

SECTION "Pause Menu State Machine 3", ROMX[$41BF], BANK[$06]
PauseMenuDoNothingState::
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 4", ROMX[$41CD], BANK[$06]
PauseMenuExitState::
  ld a, 1
  ld [$C4D9], a
  ld a, [W_PauseMenuPerserveSCX]
  ld [W_ShadowREG_SCX], a
  ld a, [W_PauseMenuPerserveSCY]
  ld [W_ShadowREG_SCY], a
  ld a, 1
  call $349E
  call $33C6
  ld a, 1
  ld [$C106], a
  xor a
  ld [$C0A6], a
  ld a, 8
  ld [W_CoreStateIndex], a
  ld a, 5
  ld [W_CoreSubStateIndex], a
  call $4B27
  ret

PauseMenuPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $BF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 5", ROMX[$422B], BANK[$06]
PauseMenuOverlayMappingState::
  ld bc, 0
  ld e, $12
  ld a, 0
  call WrapDecompressTilemap1
  ld bc, 0
  ld e, $12
  ld a, 0
  call WrapDecompressAttribmap1
  ld hl, $9DA0
  ld bc, $805
  call $25E5
  ld hl, $9DA0
  ld a, 5
  ld bc, $805
  call $25FF
  ld a, 1
  call $4895
  call $48AA
  jp IncSubStateIndex

PauseMenuPositionOverlayState::
  ld a, $60
  ld [W_ShadowREG_WX], a
  xor a
  ld [W_ShadowREG_WY], a
  ld a, 1
  call $1554
  jp IncSubStateIndex

PauseMenuClearScrollPositionState::
  call $342B
  xor a
  ld [W_ShadowREG_SCX], a
  ld [W_ShadowREG_SCY], a
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 6", ROMX[$42C8], BANK[$06]
PauseMenuOpenMedarotMenuState::
  xor a
  ld [$C563], a
  ld a, $A
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuCanOpenItemMenuCheckState::
  ld a, 5
  rst 8
  ld a, [$D918]
  and $80
  jp nz, IncSubStateIndex
  ld a, 5
  call $27DA
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuOpenItemMenuState::
  ld hl, $C576
  ld bc, 8
  call memclr
  xor a
  ld [$C563], a
  ld a, 1
  ld [$C577], a
  ld a, $B
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Pause Menu State Machine 7", ROMX[$47BA], BANK[$06]
PauseMenuOpenSaveScreenState::
  ld a, $C
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuPrepareMessageBoxState::
  ld a, 1
  ld [$C4D9], a
  ld bc, 2
  ld a, 7
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  call WrapInitiateMainScript
  jp IncSubStateIndex

PauseMenuDisplayMessageState::
  ld a, 1
  ld [$C4D9], a
  ld bc, $29
  ld a, 1
  call $3487
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuPlaceholderState::
  ret

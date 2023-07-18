INCLUDE "game/src/common/constants.asm"

SECTION "Pause Menu Vars 1", WRAM0[$C490]
W_PauseMenuPerserveSCX:: ds 1
W_PauseMenuPerserveSCY:: ds 1

SECTION "Pause Menu Vars 2", WRAM0[$C562]
W_PauseMenuSelectedOption:: ds 1

W_TransportOptionAAvailable EQU $C576
W_TransportOptionBAvailable EQU $C577
W_TransportOptionCAvailable EQU $C578

SECTION "Pause Menu Vars 3", WRAM0[$C579]
W_SelectedTransportOption:: ds 1

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
  ; Option 1 (Medawatch) states.
  dw PauseMenuPrepareFadeOutState
  dw PauseMenuFadeOutState
  dw $420F
  dw PauseMenuPreserveSpriteConfigState
  dw PauseMenuOverlayMappingState
  dw PauseMenuPositionOverlayState
  dw PauseMenuClearScrollPositionState
  dw $427C
  dw $429D
  dw PauseMenuOpenMedawatchMenuState
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
  dw TransportMenuInitState
  dw $4338
  dw TransportMenuCheckInventoryState
  dw TransportMenuMappingState
  dw TransportMenuInputHandlerState
  dw TransportMenuExitState
  dw TransportMenuCheckIfSelectedOptionAvailableState
  dw TransportMenuOptionUnavailableState
  dw TransportMenuLoadOptionStateMachineState
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
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, $C00
  ld e, $12
  ld a, 0
  call WrapDecompressAttribmap0ScrollAdjusted
  ld bc, 3
  ld a, 6
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  call PauseMenuDrawMoney
  jp IncSubStateIndex

PauseMenuInputHandlerState::
  ld a, 1
  ld [$C4D9], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  call $483C
  xor a
  call PauseMenuMaintainCursorAnimation1
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jp nz, IncSubStateIndex
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  ld a, 3
  call ScheduleSoundEffect
  ld a, 1
  call PauseMenuMaintainCursorAnimation1
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
  call PauseMenuMaintainCursorAnimation2
  call PauseMenuMapMoneyDuringTransition
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
PauseMenuOpenMedawatchMenuState::
  xor a
  ld [W_MedawatchMenuSelectedOption], a
  ld a, $A
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuCanOpenItemMenuCheckState::
  ld a, 5
  rst 8
  ld a, [W_Inventory]
  and $80
  jp nz, IncSubStateIndex
  ld a, 5
  call ScheduleSoundEffect
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuOpenItemMenuState::
  ld hl, W_CurrentPageItemSelectionIndex
  ld bc, 8
  call memclr
  xor a
  ld [W_MedawatchMenuSelectedOption], a
  ld a, 1
  ld [W_CurrentItemPage], a
  ld a, $B
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

TransportMenuInitState::
  ld a, 1
  ld [$C4D9], a
  ld a, 5
  rst 8
  ld hl, $C0A0
  ld de, $DA18
  ld bc, $3C0
  call memcpy
  ld a, 2
  ld [$C4EE], a
  ld a, $A
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, 7
  ld [$C4F1], a
  ld a, 0
  call $1153
  jp IncSubStateIndex

SECTION "Pause Menu State Machine 7", ROMX[$435D], BANK[$06]
TransportMenuCheckInventoryState::
  ld a, 1
  ld [$C4D9], a
  ld hl, W_TransportOptionAAvailable
  ld bc, 8
  call memclr

.checkTransportOptionA
  ld a, 6
  call WrapIsItemInInventory
  or a
  jr nz, .checkTransportOptionB
  ld a, 1
  ld [W_TransportOptionAAvailable], a
 
.checkTransportOptionB
  ld a, $24
  call WrapIsItemInInventory
  or a
  jr nz, .checkTransportOptionC
  ld a, 1
  ld [W_TransportOptionBAvailable], a

.checkTransportOptionC
  ld a, $23
  call WrapIsItemInInventory
  or a
  jr nz, .nextState
  ld a, 1
  ld [W_TransportOptionCAvailable], a

.nextState
  jp IncSubStateIndex

TransportMenuMappingState::
  ld a, 1
  ld [$C4D9], a
  ld bc, $200
  ld e, $7E
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, $200
  ld e, $7E
  ld a, 0
  call WrapDecompressAttribmap0ScrollAdjusted
  ld bc, $401
  ld e, $7F
  ld a, [W_TransportOptionAAvailable]
  or a
  jr z, .hideOptionA
  ld e, $80

.hideOptionA
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, $403
  ld e, $7F
  ld a, [W_TransportOptionBAvailable]
  or a
  jr z, .hideOptionB
  ld e, $81

.hideOptionB
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  ld bc, $405
  ld e, $7F
  ld a, [W_TransportOptionCAvailable]
  or a
  jr z, .hideOptionC
  ld e, $82

.hideOptionC
  ld a, 0
  call WrapDecompressTilemap0ScrollAdjusted
  jp IncSubStateIndex

TransportMenuInputHandlerState::
  ld a, 1
  ld [$C4D9], a
  call $49B5
  xor a
  call $49F9
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jp z, .bNotPressed
  ld bc, 0
  ld a, 7
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  jp IncSubStateIndex

.bNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  ret z
  ld a, 1
  call $49F9
  ld a, $36
  ld [W_CoreSubStateIndex], a
  ret

TransportMenuExitState::
  ld a, 1
  ld [$C4D9], a
  ld a, 2
  ld [$C4EE], a
  ld a, $A
  ld [$C4EF], a
  ld a, 0
  ld [$C4F0], a
  ld a, 7
  ld [$C4F1], a
  ld a, 0
  call $123B
  call $346D
  ld a, 1
  ld [$C498], a
  ld bc, 2
  ld a, 7
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ld a, 4
  call ScheduleSoundEffect
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

TransportMenuCheckIfSelectedOptionAvailableState::
  ld a, 1
  ld [$C4D9], a
  ld a, [W_SelectedTransportOption]
  ld hl, W_TransportOptionAAvailable
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  or a
  jr nz, .optionAvailable

.optionUnavailable
  ld a, 5
  call ScheduleSoundEffect
  ld a, $20
  ld [$C48A], a
  jp IncSubStateIndex

.optionAvailable
  ld a, 3
  call ScheduleSoundEffect
  xor a
  ld [W_TransportOptionSubSubSubStateIndex], a
  ld a, $38
  ld [W_CoreSubStateIndex], a
  ret

TransportMenuOptionUnavailableState::
  ld a, 1
  ld [$C4D9], a
  ld a, [$C48A]
  dec a
  ld [$C48A], a
  ret nz
  ld a, $34
  ld [W_CoreSubStateIndex], a
  ret

TransportMenuLoadOptionStateMachineState::
  ld a, 1
  ld [$C4D9], a
  ld a, [W_SelectedTransportOption]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $44AD
  dw $45F2
  dw $4732

SECTION "Pause Menu State Machine 8", ROMX[$47BA], BANK[$06]
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
  call WrapMainScriptProcessor
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld a, 4
  ld [W_CoreSubStateIndex], a
  ret

PauseMenuPlaceholderState::
  ret

SECTION "Pause Menu State Machine 9", ROMX[$47f5], BANK[$06]
PauseMenuDrawMoney::
  ld bc, $0D0B
  call $14ec
  ld a, [W_PlayerMoolah]
  ld b, a
  ld a, [W_PlayerMoolah+1]
  ld c, a
  call MapFourDigitNumber
  ld a, [W_PlayerMoolah]
  ld b, a
  ld a, [W_PlayerMoolah+1]
  or b
  jr z, .draw_00
  ld bc, $110B
  call $14ec
  ld a, $e0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret
.draw_00
  ld bc, $110B
  call $14ec
  ld a, $e0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld bc, $100B
  call $14ec
  ld a, $00
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

SECTION "Pause Menu State Machine 10", ROMX[$4880], BANK[$06]
PauseMenuMaintainCursorAnimation1::
  push af
  ld a, [W_PauseMenuSelectedOption]
  sla a
  ld c, $02
  add c
  ld c, a
  ld b, $0d
  pop af
  add $04
  ld e, a
  ld a, $00
  jp WrapDecompressTilemap0ScrollAdjusted
PauseMenuMaintainCursorAnimation2::
  push af
  ld a, [W_PauseMenuSelectedOption]
  sla a
  ld c, $02
  add c
  ld c, a
  ld b, $01
  pop af
  add $04
  ld e, a
  ld a, $00
  jp WrapDecompressTilemap1
PauseMenuMapMoneyDuringTransition::
  ld hl, $9D61
  ld a, [W_PlayerMoolah]
  ld b, a
  ld a, [$C671]
  ld c, a
  call $48e5
  ld a, [W_PlayerMoolah]
  ld b, a
  ld a, [$C671]
  or b
  jr z, .draw_00
  ld hl, $9D65
  ld a, $e0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret
.draw_00
  ld hl, $9D65
  ld a, $e0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld hl, $9D64
  ld a, $00
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret
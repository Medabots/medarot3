INCLUDE "game/src/common/constants.asm"

SECTION "Part Trading State Machine 1", ROMX[$5000], BANK[$11]
PartTradingStateMachine::
  call $2D04
  or a
  ret nz
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw PartTradingDrawingState
  dw PartTradingMappingState
  dw PartTradingPrepareFadeInState
  dw PartTradingFadeState
  dw PartTradingDrawAndMapSendingPartState
  dw PartTradingPrepareSendingPartFadeInState
  dw PartTradingFadeState
  dw PartTradingDisplaySendingPartNameState
  dw PartTradingPrepareInitialMessageState
  dw PartTradingOutputMessageState
  dw PartTradingEightFrameWaitState
  dw PartTradingInitialHandshakeSendState
  dw PartTradingInitialHandshakeReceiveState
  dw PartTradingEightFrameWaitState
  dw PartTradingResetVariablesState
  dw PartTradingSendPartDataState
  dw PartTradingEightFrameWaitState
  dw PartTradingReceivePartDataState
  dw PartTradingEightFrameWaitState
  dw PartTradingDrawAndMapReceivingPartState
  dw PartTradingPrepareReceivingPartFadeInState
  dw PartTradingFadeState
  dw PartTradingDisplayReceivingPartNameState
  dw PartTradingPrepareTradeReadyMessageState
  dw PartTradingOutputMessageState
  dw PartTradingAnimationPrepareFadeOutState
  dw PartTradingFadeState
  dw PartTradingFlashingAnimationExitCheckState
  dw PartTradingFlashingAnimationPrepareFadeInState
  dw PartTradingFadeState
  dw PartTradingFlashingAnimationLooppointState
  dw PartTradingPlaceholderState

  dw PartTradingAnimateDotPathState
  dw PartTradingPlaceWhooshSpritesState
  dw PartTradingAnimateWhooshSpritesState
  dw PartTradingSwapPartImagesState
  dw PartTradingSwapPartNamesState
  dw PartTradingPreparePostTradeFadeInState
  dw PartTradingFadeState
  dw PartTradingAdjustInventoryState
  dw PartTradingDisplayGetOverlayState
  dw PartTradingAnimateGetOverlayState
  dw PartTradingAnimateGetOverlayUpwardsState
  dw PartTradingPostTradeMessageState
  dw PartTradingPrepareInitialMessageState
  dw PartTradingOutputMessageState
  dw PartTradingEightFrameWaitState
  dw PartTradingInitialHandshakeSendState
  dw PartTradingInitialHandshakeReceiveState
  dw PartTradingEightFrameWaitState
  dw PartTradingPrepareFadeOutState
  dw PartTradingFadeState
  dw PartTradingExitState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState
  dw PartTradingPlaceholderState

PartTradingOutputMessageState::
  ld a, [W_ItemActionMessageIndex]
  ld b, a
  ld a, [W_ItemActionMessageIndex + 1]
  ld c, a
  ld a, 1
  call $3487
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

PartTradingWaitState::
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  jp IncSubStateIndex

PartTradingEightFrameWaitState::
  ld a, [$DCE4]
  inc a
  ld [$DCE4], a
  cp 8
  ret nz
  xor a
  ld [$DCE4], a
  jp IncSubStateIndex

PartTradingFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

PartTradingPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartTradingUnusedFadePreparationState::
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartTradingUnusedLinkCommunicationState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  jp z, IncSubStateIndex
  call LinkMenuAdvanceRecvBufferReadOffset
  jr PartTradingUnusedLinkCommunicationState

PartTradingInitialHandshakeSendState::
  ld a, 1
  ld [W_SerIO_ProcessOutByte], a
  jp IncSubStateIndex

PartTradingInitialHandshakeReceiveState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  call LinkMenuAdvanceRecvBufferReadOffset
  jp IncSubStateIndex

PartTradingPrepareInitialMessageState::
  ld bc, $3E
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

PartTradingAnotherUnusedState::
  ld a, 4
  ld [$CF96], a
  jp IncSubStateIndex

PartTradingDrawingState::
  call $3413
  call $343B
  call $3475
  ld bc, $A5
  call WrapLoadMaliasGraphics
  ld bc, $A6
  call WrapLoadMaliasGraphics
  ld bc, $13
  call WrapLoadMaliasGraphics
  jp IncSubStateIndex

PartTradingMappingState::
  ld bc, 0
  ld e, $69
  ld a, 2
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $69
  ld a, 2
  call WrapDecompressAttribmap0
  call WrapInitiateMainScript
  ld a, $2E
  call $27BA
  jp IncSubStateIndex

PartTradingPrepareFadeInState::
  ld hl, $91
  ld bc, $1A
  ld d, $F3
  ld e, $1F
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

PartTradingDrawAndMapSendingPartState::
  ld a, [$C613]
  ld b, a
  ld c, 0
  ld a, [$C615]
  call DrawPartImageForPartTrading
  ld a, [$C613]
  ld b, a
  ld c, 0
  ld a, 0
  call MapPartImageForPartTrading
  jp IncSubStateIndex

PartTradingPrepareSendingPartFadeInState::
  ld hl, 0
  ld bc, 0
  ld d, 4
  ld e, 0
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, [$C615]
  call GetPartPaletteIndexForPartTrading
  ld a, 2
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartTradingDisplaySendingPartNameState::
  ld a, [$C613]
  ld b, a
  ld hl, $DD90
  ld a, [$C615]
  call PartTradingBufferPartName
  ld hl, $DD90
  ld a, 0
  call PartTradingMapPartName
  jp IncSubStateIndex

PartTradingResetVariablesState::
  call $3475
  jp IncSubStateIndex

PartTradingSendPartDataState::
  ld a, [$C48D]
  cp 0
  jr z, .jpA
  cp 1
  jr z, .jpB
  call $3475
  jp IncSubStateIndex

.jpA
  ld a, [$C613]
  inc a
  ld [W_SerIO_ProcessOutByte], a
  ld hl, $C48D
  inc [hl]
  ret

.jpB
  ld a, [$C615]
  inc a
  ld [W_SerIO_ProcessOutByte], a
  ld hl, $C48D
  inc [hl]
  ret

PartTradingReceivePartDataState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  ld [$C4EE], a
  call LinkMenuAdvanceRecvBufferReadOffset
  ld a, [$C48D]
  cp 0
  jr nz, .jpA
  ld a, [$C4EE]
  dec a
  ld [$C614], a
  ld hl, $C48D
  inc [hl]
  ret

.jpA
  ld a, [$C4EE]
  dec a
  ld [$C616], a
  call $3475
  jp IncSubStateIndex

PartTradingDrawAndMapReceivingPartState::
  ld a, [$C614]
  ld b, a
  ld c, 1
  ld a, [$C616]
  call DrawPartImageForPartTrading
  ld a, [$C614]
  ld b, a
  ld c, 1
  ld a, 1
  call MapPartImageForPartTrading
  jp IncSubStateIndex

PartTradingPrepareReceivingPartFadeInState::
  ld hl, 0
  ld bc, 0
  ld d, 8
  ld e, 0
  ld a, 8
  call WrapSetupPalswapAnimation
  ld a, [$C616]
  call GetPartPaletteIndexForPartTrading
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartTradingDisplayReceivingPartNameState::
  ld a, [$C614]
  ld b, a
  ld hl, $DD99
  ld a, [$C616]
  call PartTradingBufferPartName
  ld hl, $DD99
  ld a, 1
  call PartTradingMapPartName
  jp IncSubStateIndex

PartTradingPrepareTradeReadyMessageState::
  ld bc, $4C
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

PartTradingAnimationPrepareFadeOutState::
  ld hl, 0
  ld bc, 0
  ld d, $C
  ld e, 0
  ld a, $10
  call WrapSetupPalswapAnimation
  ld a, $3C
  call ScheduleSoundEffect
  jp IncSubStateIndex

PartTradingFlashingAnimationExitCheckState::
  ld a, [$C48D]
  inc a
  ld [$C48D], a
  cp 3
  jp nz, IncSubStateIndex
  xor a
  ld [$C48D], a
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

PartTradingFlashingAnimationPrepareFadeInState::
  ld hl, 0
  ld bc, 0
  ld d, $C
  ld e, 0
  ld a, $10
  call WrapSetupPalswapAnimation
  ld a, [$C615]
  call GetPartPaletteIndexForPartTrading
  ld a, 2
  call WrapRestageDestinationBGPalettesForFade
  ld a, [$C616]
  call GetPartPaletteIndexForPartTrading
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartTradingFlashingAnimationLooppointState::
  ld a, $19
  ld [W_CoreSubStateIndex], a
  ret

PartTradingAnimateDotPathState::
  call PartTradingAnimateDotPath
  or a
  ret z
  call $3413
  call $3475
  jp IncSubStateIndex

PartTradingPlaceWhooshSpritesState::
  call PartTradingPlaceWhooshSprite
  jp IncSubStateIndex

PartTradingAnimateWhooshSpritesState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld de, $C0A0
  call $33B7
  ld de, $C0C0
  call $33B7
  ld hl, $C
  add hl, de
  ld a, [hl]
  cp $FF
  ret nz
  ld de, $C0A0
  call $341B
  ld de, $C0C0
  call $341B
  jp IncSubStateIndex

PartTradingSwapPartImagesState::
  ld a, [$C614]
  ld b, a
  ld c, 0
  ld a, [$C616]
  call DrawPartImageForPartTrading
  ld a, [$C614]
  ld b, a
  ld c, 0
  ld a, 0
  call MapPartImageForPartTrading
  ld a, [$C613]
  ld b, a
  ld c, 1
  ld a, [$C615]
  call DrawPartImageForPartTrading
  ld a, [$C613]
  ld b, a
  ld c, 1
  ld a, 1
  call MapPartImageForPartTrading
  jp IncSubStateIndex

PartTradingSwapPartNamesState::
  ld hl, $DD99
  ld a, 0
  call PartTradingMapPartName
  ld hl, $DD90
  ld a, 1
  call PartTradingMapPartName
  jp IncSubStateIndex

PartTradingPreparePostTradeFadeInState::
  ld hl, 0
  ld bc, 0
  ld d, $C
  ld e, 0
  ld a, $10
  call WrapSetupPalswapAnimation
  ld a, [$C615]
  call GetPartPaletteIndexForPartTrading
  ld a, 3
  call WrapRestageDestinationBGPalettesForFade
  ld a, [$C616]
  call GetPartPaletteIndexForPartTrading
  ld a, 2
  call WrapRestageDestinationBGPalettesForFade
  jp IncSubStateIndex

PartTradingAdjustInventoryState::
  ld a, [$C613]
  ld d, a
  ld b, 1
  ld a, [$C615]
  call $35A0
  ld a, [$C614]
  ld d, a
  ld b, 1
  ld a, [$C616]
  call $3596
  call $3628
  jp IncSubStateIndex

PartTradingDisplayGetOverlayState::
  call PartTradingPlaceGetSprite
  ld a, 8
  call ScheduleSoundEffect
  jp IncSubStateIndex

PartTradingAnimateGetOverlayState::
  ld de, $C0A0
  call $33B7
  ld hl, $C
  add hl, de
  ld a, [hl]
  cp $FF
  ret nz
  ld de, $C0A0
  ld a, $1A
  ld b, 0
  call $33B2
  jp IncSubStateIndex

PartTradingAnimateGetOverlayUpwardsState::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld de, $C0A0
  call $33B7
  ld a, [$C0A4]
  dec a
  ld [$C0A4], a
  cp $20
  ret nz
  ld a, 6
  rst 8
  ld hl, $DDA2
  ld a, [$C614]
  call $3731
  ld bc, $4D
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

PartTradingPostTradeMessageState::
  ld de, $C0A0
  call $33B7
  ld a, [W_ItemActionMessageIndex]
  ld b, a
  ld a, [W_ItemActionMessageIndex + 1]
  ld c, a
  ld a, 1
  call $3487
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  ld de, $C0A0
  call $341B
  jp IncSubStateIndex

PartTradingExitState::
  ld a, 1
  ld [$C612], a
  ld a, $1B
  ld [W_CoreStateIndex], a
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

PartTradingPlaceholderState::
  ret

INCLUDE "game/src/common/constants.asm"

SECTION "Link Menu State Machine 1", ROMX[$4000], BANK[$11]
LinkMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  cp $25
  jr c, .fireState
  ld a, [W_CoreSubStateIndex]
  cp $B0
  jr nc, .fireState
  call LinkMenuHasConnectionTimedOut
  ld a, [$C4EE]
  or a
  jr z, .fireState
  ld a, $B0
  ld [W_CoreSubStateIndex], a
  ret

.fireState
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table

; Connection confirmation.

  dw LinkMenuPrepareConnectionConfirmationMessageState ; 00
  dw LinkMenuDisplayMessageState ; 01
  dw LinkMenuConnectionConfirmationInputHandlerState ; 02
  dw LinkMenuPrepareConnectionAbortedMessageState ; 03
  dw LinkMenuDisplayMessageState ; 04
  dw LinkMenuExitToOverworldState ; 05
  dw LinkMenuPlaceholderState ; 06
  dw LinkMenuPlaceholderState ; 07
  dw LinkMenuPrepareConnectingMessageAState ; 08
  dw LinkMenuDisplayMessageState ; 09
  dw LinkMenuSetConnectingMessageTimerState ; 0A
  dw LinkMenuDoCountdownTimerState ; 0B
  dw LinkMenuPrepareConnectingMessageBState ; 0C
  dw LinkMenuDisplayMessageState ; 0D
  dw LinkMenuAttemptConnectionState ; 0E
  dw LinkMenuDoCountdownTimerState ; 0F
  dw LinkMenuCheckConnectionState ; 10
  dw LinkMenuConnectionFailedState ; 11
  dw LinkMenuDisplayMessageState ; 12
  dw LinkMenuExitToOverworldState ; 13
  dw LinkMenuPlaceholderState ; 14
  dw LinkMenuPlaceholderState ; 15
  dw LinkMenuCommunicationCheckState ; 16
  dw LinkMenuPrepareFadeOutToBlackState ; 17
  dw LinkMenuDoFadeState ; 18
  dw LinkMenuJumpToMenuState ; 19
  dw LinkMenuPlaceholderState ; 1A
  dw LinkMenuPlaceholderState ; 1B
  dw LinkMenuPlaceholderState ; 1C
  dw LinkMenuPlaceholderState ; 1D
  dw LinkMenuPlaceholderState ; 1E
  dw LinkMenuPlaceholderState ; 1F

; Link menu.

  dw LinkMenuInitMenuState ; 20
  dw LinkMenuDrawingState ; 21
  dw LinkMenuMappingState ; 22
  dw LinkMenuPrepareFadeIntoMenuState ; 23
  dw LinkMenuDoFadeState ; 24
  dw LinkMenuAwaitEmptyResponseState ; 25
  dw LinkMenuInputHandlerState ; 26
  dw LinkMenuDoEightFrameTimerState ; 27
  dw LinkMenuAwaitEmptyResponseState ; 28
  dw LinkMenuSetSelectionCommunicationTimerState ; 29
  dw LinkMenuDoSelectionCommunicationTimerState ; 2A
  dw LinkMenuSelectionResendState ; 2B
  dw LinkMenuSelectionRereceiveState ; 2C
  dw LinkMenuFinaliseSelectionState ; 2D
  dw LinkMenuJumpToSelectedMenuItemState ; 2E
  dw LinkMenuPlaceholderState ; 2F

; Battles / practice battles.

  dw LinkMenuSetTimerToEightFramesState ; 30
  dw LinkMenuDoCountdownTimerState ; 31
  dw $421A ; 32
  dw LinkMenuPrepareFadeOutToBlackState ; 33
  dw LinkMenuDoFadeState ; 34
  dw LinkMenuAwaitEmptyResponseState ; 35
  dw LinkMenuDoEightFrameTimerState ; 36
  dw $4457 ; 37
  dw $4477 ; 38
  dw LinkMenuDoEightFrameTimerState ; 39
  dw $449F ; 3A
  dw $44E5 ; 3B
  dw $4527 ; 3C
  dw LinkMenuBattleDrawingState ; 3D
  dw LinkMenuBattleMappingState ; 3E
  dw LinkMenuBattleChangeMusicState ; 3F
  dw LinkMenuPrepareFadeIntoBattleState ; 40
  dw LinkMenuDoFadeState ; 41
  dw LinkMenuDisplayMessageState ; 42
  dw LinkMenuPrepareFadeOutToBlackState ; 43
  dw LinkMenuDoFadeState ; 44
  dw LinkMenuAwaitEmptyResponseState ; 45
  dw LinkMenuEnterBattleState ; 46
  dw LinkMenuPlaceholderState ; 47
  dw LinkMenuPlaceholderState ; 48
  dw LinkMenuPlaceholderState ; 49
  dw LinkMenuPlaceholderState ; 4A
  dw LinkMenuPlaceholderState ; 4B
  dw LinkMenuPlaceholderState ; 4C
  dw LinkMenuPlaceholderState ; 4D
  dw LinkMenuPlaceholderState ; 4E
  dw LinkMenuPlaceholderState ; 4F

; Official battles.

  dw LinkMenuOfficialBattlePlayerEligibilityCheckState ; 50
  dw LinkMenuOfficialBattleSendPlayerEligibilityState ; 51
  dw LinkMenuOfficialBattleReceiveOpponentEligibilityState ; 52
  dw LinkMenuOfficialBattleOverallEligibilityCheckState ; 53
  dw LinkMenuOfficialBattleUneligibileMessageState ; 54
  dw LinkMenuOfficialBattleReturnToMenuState ; 55
  dw LinkMenuPlaceholderState ; 56
  dw LinkMenuPlaceholderState ; 57
  dw LinkMenuPlaceholderState ; 58
  dw LinkMenuPlaceholderState ; 59
  dw LinkMenuPlaceholderState ; 5A
  dw LinkMenuPlaceholderState ; 5B
  dw LinkMenuPlaceholderState ; 5C
  dw LinkMenuPlaceholderState ; 5D
  dw LinkMenuPlaceholderState ; 5E
  dw LinkMenuPlaceholderState ; 5F

; Part trading.

  dw $421A ; 60
  dw LinkMenuPrepareFadeOutToBlackState ; 61
  dw LinkMenuDoFadeState ; 62
  dw LinkMenuOpenPartTradingState ; 63
  dw LinkMenuPlaceholderState ; 64
  dw LinkMenuPlaceholderState ; 65
  dw LinkMenuPlaceholderState ; 66
  dw LinkMenuPlaceholderState ; 67
  dw LinkMenuPlaceholderState ; 68
  dw LinkMenuPlaceholderState ; 69
  dw LinkMenuPlaceholderState ; 6A
  dw LinkMenuPlaceholderState ; 6B
  dw LinkMenuPlaceholderState ; 6C
  dw LinkMenuPlaceholderState ; 6D
  dw LinkMenuPlaceholderState ; 6E
  dw LinkMenuPlaceholderState ; 6F

; Status/medals.

  dw LinkMenuCommunicateOpenMedalsIntentState ; 70
  dw LinkMenuReceiveOpenMedalsIntentState ; 71
  dw LinkMenuProcessOpenMedalsIntentState ; 72
  dw $421A ; 73
  dw LinkMenuPrepareFadeOutToBlackState ; 74
  dw LinkMenuDoFadeState ; 75
  dw LinkMenuOpenMedalsState ; 76
  dw LinkMenuPlaceholderState ; 77
  dw LinkMenuPlaceholderState ; 78
  dw LinkMenuPlaceholderState ; 79
  dw LinkMenuPlaceholderState ; 7A
  dw LinkMenuPlaceholderState ; 7B
  dw LinkMenuPlaceholderState ; 7C
  dw LinkMenuPlaceholderState ; 7D
  dw LinkMenuPlaceholderState ; 7E
  dw LinkMenuPlaceholderState ; 7F

; Wait for status/medals to close.

  dw LinkMenuMedalsOpenMessagePrepareState ; 80
  dw LinkMenuDisplayMessageState ; 81
  dw LinkMenuMedalsOpenWaitState ; 82
  dw LinkMenuDoEightFrameTimerState ; 83
  dw LinkMenuIsMedalsStillOpenState ; 84
  dw $421A ; 85
  dw LinkMenuPrepareFadeOutToBlackState ; 86
  dw LinkMenuDoFadeState ; 87
  dw LinkMenuOpenMysteryScreenState ; 88
  dw LinkMenuPlaceholderState ; 89
  dw LinkMenuPlaceholderState ; 8A
  dw LinkMenuPlaceholderState ; 8B
  dw LinkMenuPlaceholderState ; 8C
  dw LinkMenuPlaceholderState ; 8D
  dw LinkMenuPlaceholderState ; 8E
  dw LinkMenuPlaceholderState ; 8F

; Exit to menu.

  dw LinkMenuReturnToMenuInitState ; 90
  dw LinkMenuDrawingState ; 91
  dw LinkMenuMappingState ; 92
  dw LinkMenuPrepareFadeIntoMenuState ; 93
  dw LinkMenuDoFadeState ; 94
  dw LinkMenuCommunicateReturnToMenuIntentState ; 95
  dw LinkMenuPlaceholderState ; 96
  dw LinkMenuPlaceholderState ; 97
  dw LinkMenuDoEightFrameTimerState ; 98
  dw LinkMenuAwaitEmptyResponseState ; 99
  dw LinkMenuDoEightFrameTimerState ; 9A
  dw LinkMenuSendReturnToMenuHandshakeState ; 9B
  dw LinkMenuReceiveReturnToMenuHandshakeState ; 9C
  dw LinkMenuReturnToMenuState ; 9D
  dw LinkMenuPlaceholderState ; 9E
  dw LinkMenuPlaceholderState ; 9F
  dw LinkMenuPlaceholderState ; A0
  dw LinkMenuPlaceholderState ; A1
  dw LinkMenuPlaceholderState ; A2
  dw LinkMenuPlaceholderState ; A3
  dw LinkMenuPlaceholderState ; A4
  dw LinkMenuPlaceholderState ; A5
  dw LinkMenuPlaceholderState ; A6
  dw LinkMenuPlaceholderState ; A7
  dw LinkMenuPlaceholderState ; A8
  dw LinkMenuPlaceholderState ; A9
  dw LinkMenuPlaceholderState ; AA
  dw LinkMenuPlaceholderState ; AB
  dw LinkMenuPlaceholderState ; AC
  dw LinkMenuPlaceholderState ; AD
  dw LinkMenuPlaceholderState ; AE
  dw LinkMenuPlaceholderState ; AF

; Exit.

  dw LinkMenuPrepareFadeOutToWhiteState ; B0
  dw LinkMenuDoFadeState ; B1
  dw LinkMenuResetConnectionState ; B2
  dw LinkMenuExitState ; B3
  dw LinkMenuPlaceholderState ; B4
  dw LinkMenuPlaceholderState ; B5
  dw LinkMenuPlaceholderState ; B6
  dw LinkMenuPlaceholderState ; B7
  dw LinkMenuPlaceholderState ; B8
  dw LinkMenuPlaceholderState ; B9
  dw LinkMenuPlaceholderState ; BA
  dw LinkMenuPlaceholderState ; BB
  dw LinkMenuPlaceholderState ; BC
  dw LinkMenuPlaceholderState ; BD
  dw LinkMenuPlaceholderState ; BE
  dw LinkMenuPlaceholderState ; BF

LinkMenuDisplayMessageState::
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

LinkMenuSetTimerToEightFramesState::
  ld a, 8
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LinkMenuDoCountdownTimerState::
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  jp IncSubStateIndex

LinkMenuDoEightFrameTimerState::
  ld a, [W_MedalMenuWaitTimer]
  inc a
  ld [W_MedalMenuWaitTimer], a
  cp 8
  ret nz
  xor a
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LinkMenuDoFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp IncSubStateIndex

LinkMenuPrepareFadeOutToBlackState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LinkMenuPrepareFadeOutToWhiteState::
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LinkMenuAwaitEmptyResponseState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  jp z, IncSubStateIndex
  call LinkMenuAdvanceRecvBufferReadOffset
  jr LinkMenuAwaitEmptyResponseState

SECTION "Link Menu State Machine 2", ROMX[$4222], BANK[$11]
LinkMenuPrepareConnectionConfirmationMessageState::
  ld bc, $30
  call LinkMenuInitiateMainScript
  ld hl, W_CurrentPageItemSelectionIndex
  ld bc, 8
  call memclr
  jp IncSubStateIndex

LinkMenuConnectionConfirmationInputHandlerState::
  call LinkConfirmationStateMachine
  ld a, [W_TotalItemPages]
  or a
  ret z
  ld a, [W_CurrentPageItemSelectionIndex]
  or a
  jp nz, IncSubStateIndex
  ld a, 8
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuPrepareConnectionAbortedMessageState::
  ld bc, $31
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

LinkMenuExitToOverworldState::
  ld a, 8
  ld [W_CoreStateIndex], a
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuPrepareConnectingMessageAState::
  ld bc, $34
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

LinkMenuSetConnectingMessageTimerState::
  ld a, [$C113]
  ld [$C654], a
  ld a, [$C116]
  ld [$C652], a
  ld a, [$C117]
  ld [$C653], a
  ld a, [$C122]
  and $F
  ld [$C6B4], a
  ld a, [$C136]
  ld [$C6B2], a
  ld a, [$C137]
  ld [$C6B3], a
  call $3628
  ld a, $46
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LinkMenuPrepareConnectingMessageBState::
  ld bc, $32
  call LinkMenuInitiateMainScript
  ld a, $4B
  call ScheduleSoundEffect
  jp IncSubStateIndex

LinkMenuAttemptConnectionState::
  ld a, 4
  ld [W_MedalMenuWaitTimer], a
  ld a, [W_SerIO_State]
  or a
  jp nz, IncSubStateIndex
  call SerIO_SendMysteryPacket
  jp IncSubStateIndex

LinkMenuCheckConnectionState::
  ld a, [W_SerIO_State]
  or a
  jp z, IncSubStateIndex
  xor a
  ld [W_MedalMenuOptionBoxSelectedItemForProcessing], a
  ld a, 2
  ld [W_LinkMenuInitialHandshakeTimer], a
  ld a, $58
  ld [W_LinkMenuInitialHandshakeTimer + 1], a
  ld a, $16
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuConnectionFailedState::
  call SerIO_ResetConnection
  ld a, 0
  ld [$C522], a
  ld bc, $33
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

LinkMenuCommunicationCheckState::
  call LinkMenuHasConnectionTimedOut
  ld a, [$C4EE]
  or a
  jr nz, .connectionLost
  call $55A0
  ld a, [$C4EE]
  or a
  ret z
  cp 1
  jp z, IncSubStateIndex

.connectionLost
  ld a, $11
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuJumpToMenuState::
  xor a
  ld [$C612], a
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuInitMenuState::
  call $3413
  call $343B
  call $3475
  call $5642
  jp IncSubStateIndex

LinkMenuDrawingState::
  ld bc, $7D
  call WrapLoadMaliasGraphics
  ld bc, $7E
  call WrapLoadMaliasGraphics
  ld bc, $11
  call WrapLoadMaliasGraphics
  ld bc, 3
  call $33C6
  ld a, $A
  ld b, 1
  call $3527
  jp IncSubStateIndex

LinkMenuMappingState::
  ld bc, 0
  ld e, $C0
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, $E07
  ld e, $C2
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $C0
  ld a, 0
  call WrapDecompressAttribmap0
  call LinkMenuPlaceAndAnimateArrow
  call WrapInitiateMainScript
  call LinkMenuShowDescription
  ld a, [$C612]
  or a
  jp nz, IncSubStateIndex
  ld a, $2E
  call $27BA
  jp IncSubStateIndex

LinkMenuPrepareFadeIntoMenuState::
  ld hl, $8D
  ld bc, $16
  ld d, $FF
  ld e, $A0
  ld a, 8
  call WrapSetupPalswapAnimation
  jp IncSubStateIndex

LinkMenuInputHandlerState::
  ld de, $C0C0
  call $33B7
  call LinkMenuInputHandler
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  jr z, .optionNotSelectedViaLink
  ld [W_LinkMenuItemIndex], a
  call LinkMenuAdvanceRecvBufferReadOffset
  xor a
  ld [$CC4A], a
  jr .nextStatePlz

.optionNotSelectedViaLink
  ldh a, [H_JPInputChanged]
  and M_JPInputA | M_JPInputStart
  ret z
  ld a, [W_LinkMenuItemIndex]
  inc a
  ld [W_LinkMenuItemIndex], a
  ld [W_SerIO_ProcessOutByte], a
  ld a, 1
  ld [$CC4A], a

.nextStatePlz
  ld a, 3
  call ScheduleSoundEffect
  jp IncSubStateIndex

LinkMenuSetSelectionCommunicationTimerState::
  ld de, $C0C0
  call $33B7
  ld a, 8
  ld [W_MedalMenuWaitTimer], a
  jp IncSubStateIndex

LinkMenuDoSelectionCommunicationTimerState::
  ld de, $C0C0
  call $33B7
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  jp IncSubStateIndex

LinkMenuSelectionResendState::
  ld de, $C0C0
  call $33B7
  ld a, [W_LinkMenuItemIndex]
  ld [W_SerIO_ProcessOutByte], a
  jp IncSubStateIndex

LinkMenuSelectionRereceiveState::
  ld de, $C0C0
  call $33B7
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  call LinkMenuAdvanceRecvBufferReadOffset
  ld b, a
  ld a, [W_LinkMenuItemIndex]
  cp b
  jp z, IncSubStateIndex
  ld a, [W_SerIO_SentMysteryPacket]
  or a
  jp nz, IncSubStateIndex
  ld a, b
  ld [W_LinkMenuItemIndex], a
  xor a
  ld [$CC4A], a
  jp IncSubStateIndex

LinkMenuFinaliseSelectionState::
  ld a, [W_LinkMenuItemIndex]
  dec a
  ld [W_LinkMenuItemIndex], a
  call LinkMenuPlaceAndAnimateArrow
  call LinkMenuShowDescription
  ld a, $CC
  ld [$C0C2], a
  jp IncSubStateIndex

LinkMenuJumpToSelectedMenuItemState::
  ld a, [W_LinkMenuItemIndex]
  cp 0
  jr z, .practiceBattle
  cp 1
  jr z, .officialBattle
  cp 2
  jr z, .partTrading
  cp 3
  jr z, .medals

.exitMenu
  ld a, $B0
  ld [W_CoreSubStateIndex], a
  ret

.practiceBattle
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

.officialBattle
  ld a, $50
  ld [W_CoreSubStateIndex], a
  ret

.partTrading
  ld a, $60
  ld [W_CoreSubStateIndex], a
  ret

.medals
  ld a, $70
  ld [W_CoreSubStateIndex], a
  ret

SECTION "Link Menu State Machine 3", ROMX[$455D], BANK[$11]
LinkMenuBattleDrawingState::
  call $3413
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $1B
  call WrapLoadMaliasGraphics
  ld bc, 6
  call $33C6
  jp IncSubStateIndex

LinkMenuBattleMappingState::
  ld bc, 0
  ld e, $52
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $52
  ld a, 0
  call WrapDecompressAttribmap0
  call $5709
  call $5734
  call $5783
  ld bc, $3B
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

LinkMenuBattleChangeMusicState::
  ld a, $33
  call $27BA
  jp IncSubStateIndex

LinkMenuPrepareFadeIntoBattleState::
  ld hl, $8E
  ld bc, 3
  ld d, $FF
  ld e, $FF
  ld a, 8
  call WrapSetupPalswapAnimation
  call $574E
  call $576B
  jp IncSubStateIndex

LinkMenuEnterBattleState::
  ld hl, W_MedarotSelectionScreenSelectedOption
  ld bc, 8
  call memclr
  ld a, 6
  rst 8
  ld hl, $DC20
  ld bc, $300
  call memclr
  ld a, 1
  ld [$C595], a
  xor a
  ld [W_MedarotBattleSelectionCurrentSelectionOffset], a
  ld a, 3
  ld [$C646], a
  xor a
  ld [$C647], a
  ld a, $F
  ld [W_CoreStateIndex], a
  ld a, 0
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuOfficialBattlePlayerEligibilityCheckState::
  call $56DE
  ld [W_LinkMenuBattlePlayerIneligibility], a
  jp IncSubStateIndex

LinkMenuOfficialBattleSendPlayerEligibilityState::
  ld a, [W_LinkMenuBattlePlayerIneligibility]
  inc a
  ld [W_SerIO_ProcessOutByte], a
  jp IncSubStateIndex

LinkMenuOfficialBattleReceiveOpponentEligibilityState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  dec a
  ld [W_LinkMenuBattleOpponentIneligibility], a
  call LinkMenuAdvanceRecvBufferReadOffset
  jp IncSubStateIndex

LinkMenuOfficialBattleOverallEligibilityCheckState::
  ld a, [W_LinkMenuBattlePlayerIneligibility]
  ld b, a
  ld a, [W_LinkMenuBattleOpponentIneligibility]
  or b
  jr nz, .uneligibile
  ld a, $30
  ld [W_CoreSubStateIndex], a
  ret

.uneligibile
  call $3482
  jp IncSubStateIndex

LinkMenuOfficialBattleUneligibileMessageState::
  ld bc, $3A
  ld a, 1
  call $3487
  ld a, [W_MainScriptExitMode]
  or a
  ret z
  jp IncSubStateIndex

LinkMenuOfficialBattleReturnToMenuState::
  call LinkMenuPlaceAndAnimateArrow
  call LinkMenuShowDescription
  ld a, $25
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuOpenPartTradingState::
  ld hl, W_CurrentPartTypeForListView
  ld bc, $10
  call memclr
  ld a, 2
  ld [W_PartsMenuEntrypoint], a
  ld a, $3F
  call $27BA
  ld a, $D
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuCommunicateOpenMedalsIntentState::
  ld a, [$CC4A]
  inc a
  ld [W_SerIO_ProcessOutByte], a
  jp IncSubStateIndex

LinkMenuReceiveOpenMedalsIntentState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  dec a
  ld b, a
  call LinkMenuAdvanceRecvBufferReadOffset
  ld a, [$CC4A]
  cp b
  jp nz, IncSubStateIndex
  ld a, 1
  ld [$CC4A], a
  ld a, [W_SerIO_SentMysteryPacket]
  or a
  jp nz, IncSubStateIndex
  xor a
  ld [$CC4A], a
  jp IncSubStateIndex

LinkMenuProcessOpenMedalsIntentState::
  ld a, [$CC4A]
  or a
  jp nz, IncSubStateIndex
  ld a, $80
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuOpenMedalsState::
  ld hl, W_CurrentPageItemSelectionIndex
  ld bc, 8
  call memclr
  ld a, 2
  ld [W_TransportOptionSubSubSubStateIndex], a
  ld a, $3F
  call $27BA
  ld a, $E
  ld [W_CoreStateIndex], a
  xor a
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuMedalsOpenMessagePrepareState::
  ld bc, $51
  call LinkMenuInitiateMainScript
  jp IncSubStateIndex

LinkMenuMedalsOpenWaitState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  dec a
  ld [$C617], a
  call LinkMenuAdvanceRecvBufferReadOffset
  ld a, [$C617]
  inc a
  cp $FF
  jp nz, IncSubStateIndex
  ld a, $98
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuIsMedalsStillOpenState::
  ld a, [$C617]
  call $3549
  inc a
  ld [W_SerIO_ProcessOutByte], a
  cp 1
  jp nz, IncSubStateIndex
  ld a, $82
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuOpenMysteryScreenState::
  ld a, $3F
  call $27BA
  ld a, $1F
  ld [W_CoreStateIndex], a
  ld a, $20
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuReturnToMenuInitState::
  call $3413
  call $343B
  call $3475
  xor a
  ld [$C612], a
  jp IncSubStateIndex

LinkMenuCommunicateReturnToMenuIntentState::
  ld a, $FF
  ld [W_SerIO_ProcessOutByte], a
  ld a, $98
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuSendReturnToMenuHandshakeState::
  ld a, 1
  ld [W_SerIO_ProcessOutByte], a
  jp IncSubStateIndex

LinkMenuReceiveReturnToMenuHandshakeState::
  call LinkMenuReadFromRecvBuffer
  ld a, [hl]
  or a
  ret z
  call LinkMenuAdvanceRecvBufferReadOffset
  jp IncSubStateIndex

LinkMenuReturnToMenuState::
  call $3482
  call LinkMenuShowDescription
  ld a, $26
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuResetConnectionState::
  call SerIO_ResetConnection
  ld a, 0
  ld [$C522], a
  jp IncSubStateIndex

LinkMenuExitState::
  xor a
  ld [W_CoreStateIndex], a
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuPlaceholderState::
  ret

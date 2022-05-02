INCLUDE "game/src/common/constants.asm"

SECTION "Link Menu State Machine 1", ROMX[$4000], BANK[$11]
LinkMenuStateMachine::
  ld a, [W_CoreSubStateIndex]
  cp $25
  jr c, .fireState
  ld a, [W_CoreSubStateIndex]
  cp $B0
  jr nc, .fireState
  call $543E
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
  dw $42E3 ; 16
  dw LinkMenuPrepareFadeOutToBlackState ; 17
  dw LinkMenuDoFadeState ; 18
  dw $42FF ; 19
  dw LinkMenuPlaceholderState ; 1A
  dw LinkMenuPlaceholderState ; 1B
  dw LinkMenuPlaceholderState ; 1C
  dw LinkMenuPlaceholderState ; 1D
  dw LinkMenuPlaceholderState ; 1E
  dw LinkMenuPlaceholderState ; 1F

  dw $4309 ; 20
  dw $4318 ; 21
  dw $433A ; 22
  dw $4370 ; 23
  dw LinkMenuDoFadeState ; 24
  dw $420D ; 25
  dw $4382 ; 26
  dw LinkMenuDoEightFrameTimerState ; 27
  dw $420D ; 28
  dw $43BA ; 29
  dw $43C8 ; 2A
  dw $43D9 ; 2B
  dw $43E8 ; 2C
  dw $4411 ; 2D
  dw $4426 ; 2E
  dw LinkMenuPlaceholderState ; 2F

  dw LinkMenuSetTimerToEightFramesState ; 30
  dw LinkMenuDoCountdownTimerState ; 31
  dw $421A ; 32
  dw LinkMenuPrepareFadeOutToBlackState ; 33
  dw LinkMenuDoFadeState ; 34
  dw $420D ; 35
  dw LinkMenuDoEightFrameTimerState ; 36
  dw $4457 ; 37
  dw $4477 ; 38
  dw LinkMenuDoEightFrameTimerState ; 39
  dw $449F ; 3A
  dw $44E5 ; 3B
  dw $4527 ; 3C
  dw $455D ; 3D
  dw $4575 ; 3E
  dw $459B ; 3F
  dw $45A3 ; 40
  dw LinkMenuDoFadeState ; 41
  dw LinkMenuDisplayMessageState ; 42
  dw LinkMenuPrepareFadeOutToBlackState ; 43
  dw LinkMenuDoFadeState ; 44
  dw $420D ; 45
  dw $45BB ; 46
  dw LinkMenuPlaceholderState ; 47
  dw LinkMenuPlaceholderState ; 48
  dw LinkMenuPlaceholderState ; 49
  dw LinkMenuPlaceholderState ; 4A
  dw LinkMenuPlaceholderState ; 4B
  dw LinkMenuPlaceholderState ; 4C
  dw LinkMenuPlaceholderState ; 4D
  dw LinkMenuPlaceholderState ; 4E
  dw LinkMenuPlaceholderState ; 4F

  dw $45ED ; 50
  dw $45F6 ; 51
  dw $4600 ; 52
  dw $4610 ; 53
  dw $4626 ; 54
  dw $4636 ; 55
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

  dw $421A ; 60
  dw LinkMenuPrepareFadeOutToBlackState ; 61
  dw LinkMenuDoFadeState ; 62
  dw $4642 ; 63
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
 
  dw $465F ; 70
  dw $4669 ; 71
  dw $468E ; 72
  dw $421A ; 73
  dw LinkMenuPrepareFadeOutToBlackState ; 74
  dw LinkMenuDoFadeState ; 75
  dw $469B ; 76
  dw LinkMenuPlaceholderState ; 77
  dw LinkMenuPlaceholderState ; 78
  dw LinkMenuPlaceholderState ; 79
  dw LinkMenuPlaceholderState ; 7A
  dw LinkMenuPlaceholderState ; 7B
  dw LinkMenuPlaceholderState ; 7C
  dw LinkMenuPlaceholderState ; 7D
  dw LinkMenuPlaceholderState ; 7E
  dw LinkMenuPlaceholderState ; 7F

  dw $46B8 ; 80
  dw LinkMenuDisplayMessageState ; 81
  dw $46C1 ; 82
  dw LinkMenuDoEightFrameTimerState ; 83
  dw $46DD ; 84
  dw $421A ; 85
  dw LinkMenuPrepareFadeOutToBlackState ; 86
  dw LinkMenuDoFadeState ; 87
  dw $46F2 ; 88
  dw LinkMenuPlaceholderState ; 89
  dw LinkMenuPlaceholderState ; 8A
  dw LinkMenuPlaceholderState ; 8B
  dw LinkMenuPlaceholderState ; 8C
  dw LinkMenuPlaceholderState ; 8D
  dw LinkMenuPlaceholderState ; 8E
  dw LinkMenuPlaceholderState ; 8F

  dw $4702 ; 90
  dw $4318 ; 91
  dw $433A ; 92
  dw $4370 ; 93
  dw LinkMenuDoFadeState ; 94
  dw $4712 ; 95
  dw LinkMenuPlaceholderState ; 96
  dw LinkMenuPlaceholderState ; 97
  dw LinkMenuDoEightFrameTimerState ; 98
  dw $420D ; 99
  dw LinkMenuDoEightFrameTimerState ; 9A
  dw $471D ; 9B
  dw $4725 ; 9C
  dw $4731 ; 9D
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

SECTION "Link Menu State Machine 2", ROMX[$4222], BANK[$11]
LinkMenuPrepareConnectionConfirmationMessageState::
  ld bc, $30
  call $5415
  ld hl, W_CurrentPageItemSelectionIndex
  ld bc, 8
  call memclr
  jp IncSubStateIndex

LinkMenuConnectionConfirmationInputHandlerState::
  call $5459
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
  call $5415
  jp IncSubStateIndex

LinkMenuExitToOverworldState::
  ld a, 8
  ld [W_CoreStateIndex], a
  ld a, 5
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuPrepareConnectingMessageAState::
  ld bc, $34
  call $5415
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
  call $5415
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
  ld [$CC41], a
  ld a, $58
  ld [$CC42], a
  ld a, $16
  ld [W_CoreSubStateIndex], a
  ret

LinkMenuConnectionFailedState::
  call SerIO_ResetConnection
  ld a, 0
  ld [$C522], a
  ld bc, $33
  call $5415
  jp IncSubStateIndex

SECTION "Link Menu State Machine 3", ROMX[$473D], BANK[$11]
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

INCLUDE "game/src/common/constants.asm"

W_NamingScreenCursorPositionIndex EQU $C48D

SECTION "Naming Screen Entry State Machine 1", ROMX[$48F7], BANK[$01]
NamingEntryStateMachine::
  ld a, [W_NamingScreenSubSubSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw NamingEntryDoNothingState ; 00
  dw NamingEntryInputHandlerState ; 01
  dw NamingEntrySwitchCaseState ; 02
  dw $4A5E ; 03
  dw $4BC2 ; 04
  dw $4BD2 ; 05
  dw NamingEntryPlaceholderState ; 06
  dw NamingEntryPlaceholderState ; 07
  dw NamingEntryPlaceholderState ; 08
  dw NamingEntryPlaceholderState ; 09
  dw NamingEntryPlaceholderState ; 0A
  dw NamingEntryPlaceholderState ; 0B
  dw NamingEntryPlaceholderState ; 0C
  dw NamingEntryPlaceholderState ; 0D
  dw NamingEntryPlaceholderState ; 0E
  dw NamingEntryPlaceholderState ; 0F
  dw $4C13 ; 10
  dw $4CB2 ; 11
  dw $4CBB ; 12
  dw $4CF7 ; 13
  dw $4D07 ; 14

NamingEntryDoNothingState::
  ld a, 1
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

NamingEntryInputHandlerState::
  ld de, $C1E0
  call $33B7
  ld de, $C220
  call $33B7
  ld a, [$C761]
  or a
  jr nz, .noWalkingAnimation
  ld de, $C200
  call $33B7

.noWalkingAnimation
  ldh a, [H_JPInputChanged]
  and M_JPInputStart
  jr z, .startNotPressed
  ld a, 5
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.startNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputSelect
  jr z, .selectNotPressed
  ld a, 2
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.selectNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputA
  jr z, .aNotPressed
  ld a, 3
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.aNotPressed
  ldh a, [H_JPInputChanged]
  and M_JPInputB
  jr z, .bNotPressed
  ld a, 4
  call ScheduleSoundEffect
  ld a, 4
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.bNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight | M_JPInputLeft | M_JPInputUp | M_JPInputDown
  ret z
  ld a, 2
  call ScheduleSoundEffect
  ld hl, NamingEntryCursorRepositioningTable
  ld b, 0
  ld a, [W_MedalMenuSkillBarAnimationStage]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  xor a
  jr .directionalInputCommon

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, 1
  jr .directionalInputCommon

.downNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 2
  jr .directionalInputCommon

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  jr z, .directionalInputCommon
  ld a, 3

.directionalInputCommon
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [W_NamingScreenCursorPositionIndex]
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_NamingScreenCursorPositionIndex], a
  ld a, [W_NamingScreenCursorPositionIndex]
  cp $FD
  jp z, .cursorPositionIsSelectCaseOption
  ld a, [W_NamingScreenCursorPositionIndex]
  cp $FE
  jp z, .cursorPositionIsBackOption
  ld a, [W_NamingScreenCursorPositionIndex]
  cp $FF
  jp z, .cursorPositionIsDoneOption
  call $52D4
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.cursorPositionIsSelectCaseOption
  ld a, $86
  ld [$C222], a
  ld a, 8
  ld [$C223], a
  ld a, $80
  ld [$C224], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 0
  ld [$C763], a
  ld a, $10
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.cursorPositionIsBackOption
  ld a, $87
  ld [$C222], a
  ld a, $40
  ld [$C223], a
  ld a, $80
  ld [$C224], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C763], a
  ld a, $10
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.cursorPositionIsDoneOption
  ld a, $87
  ld [$C222], a
  ld a, $70
  ld [$C223], a
  ld a, $80
  ld [$C224], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 2
  ld [$C763], a
  ld a, $10
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

NamingEntrySwitchCaseState::
  call $5214
  ld a, 1
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

SECTION "Naming Screen Entry State Machine 2", ROMX[$4D48], BANK[$01]
NamingEntryPlaceholderState::
  ret

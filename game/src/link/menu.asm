INCLUDE "game/src/common/constants.asm"

SECTION "Link Menu Variables 1", WRAM0[$C605]
W_LinkMenuItemIndex:: ds 1

SECTION "Link Menu Variables 2", WRAM0[$CC41]
W_LinkMenuInitialHandshakeTimer:: ds 2

SECTION "Link Menu Variables 3", WRAM0[$CC48]
W_LinkMenuBattlePlayerIneligibility:: ds 1
W_LinkMenuBattleOpponentIneligibility:: ds 1

SECTION "Link Menu Helper Functions 1", ROMX[$5415], BANK[$11]
LinkMenuInitiateMainScript::
  ld a, b
  ld [W_ItemActionMessageIndex], a
  ld a, c
  ld [W_ItemActionMessageIndex + 1], a
  jp WrapInitiateMainScript

LinkMenuReadFromRecvBuffer::
  ld hl, W_SerIO_RecvBuffer
  ld a, [W_SerIO_RecvBufferReadOffset]
  ld c, a
  ld b, 0
  add hl, bc
  ret

LinkMenuAdvanceRecvBufferReadOffset::
  push hl
  push bc
  push af
  call LinkMenuReadFromRecvBuffer
  xor a
  ld [hl], a
  ld a, [W_SerIO_RecvBufferReadOffset]
  inc a
  ld [W_SerIO_RecvBufferReadOffset], a
  pop af
  pop bc
  pop hl
  ret

LinkMenuHasConnectionTimedOut::
  ld a, [W_SerIO_IdleCounter]
  cp 8
  jp z, .connectionFailed
  inc a
  ld [W_SerIO_IdleCounter], a
  xor a
  ld [$C4EE], a
  ret

.connectionFailed
  xor a
  ld [W_SerIO_IdleCounter], a
  ld a, 1
  ld [$C4EE], a
  ret

SECTION "Link Menu Helper Functions 2", ROMX[$5658], BANK[$11]
LinkMenuPlaceAndAnimateArrow::
  call LinkMenuPlaceArrow
  ld a, $36
  ld b, 0
  ld de, $C0C0
  jp $33B2

LinkMenuPlaceArrow::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0C0], a
  ld a, 0
  ld [$C0C1], a
  ld a, 7
  ld [$C0C5], a
  ld a, $F
  ld [$C0C3], a
  ld a, [W_LinkMenuItemIndex]
  sla a
  sla a
  sla a
  sla a
  add $10
  ld [$C0C4], a
  ret

LinkMenuShowDescription::
  call $3482
  ld a, [W_LinkMenuItemIndex]
  ld hl, $35
  ld b, 0
  ld c, a
  add hl, bc
  ld b, h
  ld c, l
  ld a, 1
  jp $3487

LinkMenuInputHandler::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, [W_LinkMenuItemIndex]
  sub 1
  jr nc, .doNotWrapToBottom
  ld a, 4

.doNotWrapToBottom
  ld [W_LinkMenuItemIndex], a
  call LinkMenuPlaceArrow
  ld a, 2
  call ScheduleSoundEffect
  jp LinkMenuShowDescription

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  ret z
  ld a, [W_LinkMenuItemIndex]
  inc a
  cp 5
  jr nz, .doNotWrapToTop
  xor a

.doNotWrapToTop
  ld [W_LinkMenuItemIndex], a
  call LinkMenuPlaceArrow
  ld a, 2
  call ScheduleSoundEffect
  jp LinkMenuShowDescription

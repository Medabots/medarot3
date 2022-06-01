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

SECTION "Link Menu Helper Functions 2", ROMX[$5415], BANK[$11]

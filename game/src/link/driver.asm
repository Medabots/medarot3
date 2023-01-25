INCLUDE "game/src/common/constants.asm"

SECTION "SerIO Buffers", WRAM0[$CA00]
W_SerIO_SendBuffer:: ds $100
W_SerIO_RecvBuffer:: ds $100

SECTION "SerIO Driver Variables 1", WRAM0[$CC01]
W_SerIO_PacketType:: ds 1
W_SerIO_SentMysteryPacket:: ds 1

SECTION "SerIO Driver Variables 2", WRAM0[$CC05]
W_SerIO_DoingXfer:: ds 1
W_SerIO_State:: ds 1
W_ShadowREG_SB:: ds 1
W_SerIO_IdleCounter:: ds 1

SECTION "SerIO Driver Variables 3", WRAM0[$CC11]
W_SerIO_DriverInByte:: ds 1

SECTION "SerIO Driver Variables 4", WRAM0[$CC20]
W_SerIO_DriverOutByte:: ds 1

SECTION "SerIO Driver Variables 5", WRAM0[$CC27]
W_SerIO_ProcessInByte:: ds 1

SECTION "SerIO Driver Variables 6", WRAM0[$CC2D]
W_SerIO_ProcessOutByte:: ds 1

SECTION "SerIO Driver Variables 7", WRAM0[$CC33]
W_SerIO_SendBufferWrite:: ds 1

SECTION "SerIO Driver Variables 8", WRAM0[$CC35]
W_SerIO_SendBufferRead:: ds 1

SECTION "SerIO Driver Variables 9", WRAM0[$CC37]
W_SerIO_SendBufferReady:: ds 1
W_SerIO_RecvBufferWrite:: ds 1

SECTION "SerIO Driver Variables 10", WRAM0[$CC3A]
W_SerIO_RecvBufferRead:: ds 1

SECTION "SerIO Driver Variables 11", WRAM0[$CC3C]
W_SerIO_RecvBufferReady:: ds 1

SECTION "SerIO Driver Variables 12", WRAM0[$CC3E]
W_SerIO_RecvBufferReadOffset:: ds 1

SECTION "SerIO Driver 1", ROM0[$31FD]
SerIO_SwitchToInternalClock::
  ld a, [W_SerIO_State]
  and a
  ret z
  ld a, [W_SerIO_DoingXfer]
  and a
  ret nz
  ld a, [W_SerIO_PacketType]
  and a
  ret z
  ld a, [W_SerIO_DoingXfer]
  and a
  ret nz
  ld a, $81
  ldh [H_RegSC], a
  ret

SECTION "SerIO Driver 2", ROM0[$32B1]
SerIO_ResetConnection::
  ld hl, W_SerIO_SendBuffer
  ld bc, $300
  call memclr
  ld a, $AA
  ldh [H_RegSB], a
  ld [W_ShadowREG_SB], a
  ld a, $80
  ldh [H_RegSC], a
  ret

SerIO_SendMysteryPacket::
  ld a, 1
  ld [W_SerIO_SentMysteryPacket], a
  ld a, $FC
  ldh [H_RegSB], a
  ld a, $81
  ldh [H_RegSC], a
  ret

SerIO_SendConnectPacket::
  ld a, [W_SerIO_State]
  and a
  ret nz
  ld a, $AA
  ldh [H_RegSB], a
  ld [W_ShadowREG_SB], a
  ld a, $80
  ldh [H_RegSC], a
  ret

SerIO_Wait:: ; 32E5
  dec bc
  ld a, b
  or c
  jr nz, SerIO_Wait
  ret

SerIO_InitializeRecvArea::
  ld hl, W_SerIO_RecvBuffer
  ld bc, $100
  jp memclr
	
SerIO_SendBufferPush::
  di
  ld a, 1
  ld [W_SerIO_SendBufferReady], a
  ld a, [W_SerIO_SendBufferWrite]
  ld l, a
  ld h, W_SerIO_SendBuffer >> 8
  ld a, [W_SerIO_ProcessOutByte]
  ld [hl], a
  inc l
  or a
  jr z, .skipNullByte
  ld a, l
  ld [W_SerIO_SendBufferWrite], a
  xor a
  ld [W_SerIO_ProcessOutByte], a

.skipNullByte
  ei
  ret

SerIO_SendBufferPull::
  ld a, [W_SerIO_SendBufferReady]
  and a
  jr z, .nothingToSend
  xor a
  ld [W_SerIO_SendBufferReady], a
  ld a, [W_SerIO_SendBufferRead]
  ld l, a
  ld h, W_SerIO_SendBuffer >> 8
  ld a, [hl]
  inc l
  ld [W_SerIO_DriverOutByte], a
  or a
  ret z
  ld a, l
  ld [W_SerIO_SendBufferRead], a
  ret

.nothingToSend
  xor a
  ld [W_SerIO_DriverOutByte], a
  ret
	
SerIO_RecvBufferPush::
  ld a, 1
  ld [W_SerIO_RecvBufferReady], a
  ld a, [W_SerIO_RecvBufferWrite]
  ld l, a
  ld h, W_SerIO_RecvBuffer >> 8
  ld a, [W_SerIO_DriverInByte]
  ld [hl], a
  inc l
  or a
  ret z
  ld a, l
  ld [W_SerIO_RecvBufferWrite], a
  ret

SerIO_RecvBufferPull::
  di
  ld a, [W_SerIO_RecvBufferReady]
  and a
  jr z, .nothingToRecv
  xor a
  ld [W_SerIO_RecvBufferReady], a
  ld a, [W_SerIO_RecvBufferRead]
  ld l, a
  ld h, W_SerIO_RecvBuffer >> 8
  ld a, [hl]
  inc l
  ld [W_SerIO_ProcessInByte], a
  or a
  jr z, .skipNullByte
  ld a, l
  ld [W_SerIO_RecvBufferRead], a
	
.skipNullByte
  ei
  ret

.nothingToRecv
  xor a
  ld [W_SerIO_ProcessInByte], a
  ei
  ret

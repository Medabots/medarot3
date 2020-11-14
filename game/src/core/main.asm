INCLUDE "game/src/common/constants.asm"

SECTION "Hardware Identifier",  WRAM0[$C486]
W_GameboyType:: ds 1

SECTION "System Gameloop Variables", WRAM0[$C461]
W_FrameCompleted:: ds 1

SECTION "Main",  ROM0[$0150]
Main::
  ld [W_GameboyType], a
  di
  call DisableLCD
  xor a
  ldh [H_RegIF], a
  ldh [H_RegIE], a
  ld sp, $FFFE
  ld a, 0
  ld [X_MBC5SRAMEnable], a
  ld a, 1
  ld [X_MBC5ROMBankLow], a
  ld a, 0
  ld [X_MBC5ROMBankLow], a
  ld a, 0
  ld [X_MBC5SRAMBank], a
  call SwitchToNormalSpeedMode ; Pointless since the gbc starts in normal speed mode, but whatever.
  call WrapClearVRAM
  ld a, [W_GameboyType]
  push af
  call WrapClearWRAM
  pop af
  ld [W_GameboyType], a
  xor a
  ldh [H_RegVBK], a
  ldh [H_RegSVBK], a
  ldh [H_RegRP], a
  ldh [H_RegHDMA1], a
  ldh [H_RegHDMA2], a
  ldh [H_RegHDMA3], a
  ldh [H_RegHDMA4], a
  ldh [H_RegHDMA5], a
  ldh [H_RegBGPI], a
  ldh [H_RegBGPD], a
  ldh [H_RegOBPI], a
  ldh [H_RegOBPD], a
  ld [$FE00], a
  ld hl, $FE00
  ld c, 0

.clearOAMLoop
  ld [hli], a
  dec c
  jr nz, .clearOAMLoop
  ld hl, H_PushOAM
  ld c, $7F

.clearHRAMLoop
  ld [hli], a
  dec c
  jr nz, .clearHRAMLoop

  call InstallODMADriver
  call $0313
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, $C3
  ld [W_ShadowREG_LCDC], a
  ldh [H_RegLCDC], a
  call SerIO_ResetConnection
  ld a, $40
  ldh [H_LCDStat], a
  xor a
  ldh [H_RegIF], a
  ld a, $B
  ldh [H_RegIE], a
  ei
  ld a, 1
  ld [$CD00], a
  ld [$CD13], a
  ld bc, 0
  call $0CD2
  ld bc, 0
  call $0D56
  call $0C84
  call DMGSetupDirectPalette
  call $0410
  call SetInitialStateAndSubstate
  ld a, 1
  rst $10

.mainGameLoop
  xor a
  ld [$C4D9], a
  call RestartViaABStartSelect
  call SerIO_RecvBufferPull
  call SerIO_SendBufferPush
  call SerIO_SendConnectPacket
  call $0476
  call $2DB7 ; Game State Machine
  call $0507
  ld a, 1
  ld [W_FrameCompleted], a

.waitForNextFrame
  ldh a, [$FF92]
  and a
  jr z, .waitForNextFrame
  
  xor a
  ldh [$FF92], a
  ld [W_FrameCompleted], a
  jp .mainGameLoop

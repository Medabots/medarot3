INCLUDE "game/src/common/constants.asm"

SECTION "Scrolling Animations", WRAM0[$C510]
W_ScrollInstructions:: ds $F
W_DoScroll:: ds 1

SECTION "Universal Looping Timer", WRAM0[$C460]
W_UniversalLoopingTimer:: ds 1

SECTION "vblank",ROM0[$40] ; vblank interrupt
  jp VBlankingIRQ

SECTION "lcd",ROM0[$48] ; lcd interrupt
  jp LCDCStatusIRQ

SECTION "timer",ROM0[$50] ; timer interrupt
  reti

SECTION "serial",ROM0[$58] ; serial interrupt
  jp $3216

SECTION "joypad",ROM0[$60] ; joypad interrupt
  reti

SECTION "LCDC VBlank IRQ", ROM0[$0286]
VBlankingIRQ::
  push af
  push bc
  push de
  push hl
  call $036A
  call SyncShadowRegs
  ldh a, [H_VBlankCompleted]
  or a
  jr nz, .skipOAM
  ld a, [W_OAM_DMAReady]
  or a
  jr z, .skipOAM
  call H_PushOAM
  ei
  xor a
  ld [W_OAM_SpritesReady], a
  ld [W_OAM_DMAReady],a

.skipOAM
  call CGBCommitPalettes
  call CGBCommitFadePalettesBGP
  call CGBCommitFadePalettesOBP
  ld a, 1
  ldh [H_VBlankCompleted], a
  call $033E ; Music most likely.
  call SerIO_SwitchToInternalClock
  pop hl
  pop de
  pop bc
  pop af
  reti

LCDCStatusIRQ::
  push af
  push bc
  push de
  push hl
  ld a, [W_DoScroll]
  or a
  jp nz, .doScroll
  call .clearScrollInstructions
  jp .exit

.doScroll
  ld hl, W_ScrollInstructions
  ld c, 5

.loop
  rst $20
  ld a, [hli]
  or a
  jp z, .clearScroll
  push af
  ld a, [hli]
  ldh [H_RegSCX], a
  ld a, [hli]
  ldh [H_RegSCY], a
  pop af
  ld b, a

.waitUntilLineReady
  ldh a, [H_RegLY]
  cp b
  jr c, .waitUntilLineReady
  
  dec c
  jp nz, .loop

.clearScroll
  xor a
  ldh [H_RegSCX], a
  ldh [H_RegSCY], a

.exit
  pop hl
  pop de
  pop bc
  pop af
  reti

.clearScrollInstructions
  ld hl, W_ScrollInstructions
  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ret

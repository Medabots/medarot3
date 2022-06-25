INCLUDE "game/src/common/constants.asm"

SECTION "Credits Helper Functions 1", ROMX[$43E8], BANK[$16]
CreditsAnimateSidebarPalette::
  ld a, [W_PaletteAnimRunning]
  or a
  jr z, .initiateAnimation
  call $34E6
  ret

.initiateAnimation
  ld a, [$C48D]
  inc a
  and 3
  ld [$C48D], a
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld h, 0
  ld l, a
  ld bc, $3D
  add hl, bc
  ld bc, 0
  ld d, 2
  ld e, 0
  ld a, $14
  call WrapSetupPalswapAnimation
  ret

.table
  db 0,1,0,2

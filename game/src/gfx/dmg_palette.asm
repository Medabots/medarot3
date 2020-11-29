INCLUDE "game/src/common/constants.asm"

SECTION "DMG Palette management", ROM0[$15F6]
DMGSetupDirectPalette::
  ld a, $E4
  ld [W_ShadowREG_BGP], a
  ld a, $E4
  ld [W_ShadowREG_OBP0], a
  ld a, $D0
  ld [W_ShadowREG_OBP1], a
  ret

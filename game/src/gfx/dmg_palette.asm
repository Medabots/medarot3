INCLUDE "game/src/common/constants.asm"

SECTION "DMG Palette Variables",  WRAM0[$C466]
W_ShadowREG_BGP:: ds 1
W_ShadowREG_OBP0:: ds 1
W_ShadowREG_OBP1:: ds 1

SECTION "DMG Palette management", ROM0[$15F6]
DMGSetupDirectPalette::
  ld a, $E4
  ld [W_ShadowREG_BGP], a
  ld a, $E4
  ld [W_ShadowREG_OBP0], a
  ld a, $D0
  ld [W_ShadowREG_OBP1], a
  ret

INCLUDE "game/src/common/constants.asm"

SECTION "Math Functions", ROM0[$1446]
MultiplyBCByPowerOfTwoAndAddToHL::
  ;de=(bc*(2^a))+hl
  sla c
  rl b
  dec a
  jr nz, MultiplyBCByPowerOfTwoAndAddToHL
  add hl, bc
  ld d, h
  ld e, l
  ret

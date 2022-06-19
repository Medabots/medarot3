INCLUDE "game/src/common/constants.asm"

SECTION "Math Functions", ROM0[$1446]
MultiplyBCByTwoToThePowerOfAAndAddToHL::
  ;de=(bc*(2^a))+hl
  sla c
  rl b
  dec a
  jr nz, MultiplyBCByTwoToThePowerOfAAndAddToHL
  add hl, bc
  ld d, h
  ld e, l
  ret

INCLUDE "game/src/common/constants.asm"

SECTION "A B Start Select",  ROM0[$0270]
RestartViaABStartSelect::
  ldh a, [H_JPInputHeldDown]
  and M_JPInputA | M_JPInputB | M_JPInputStart | M_JPInputSelect
  cp M_JPInputA + M_JPInputB + M_JPInputStart + M_JPInputSelect
  ret nz
  ld a, [W_CoreStateIndex]
  cp 0
  ret z
  xor a
  ld [W_CoreStateIndex], a
  xor a
  ld [$C481], a
  ret

INCLUDE "game/src/common/constants.asm"

SECTION "Switch To Normal Speed Mode", ROM0[$0350]
SwitchToNormalSpeedMode::
  ld a, [W_GameboyType]
  cp $11
  ret nz
  ld hl, H_RegKEY1
  bit 7, [hl]
  ret nz
  set 0, [hl]
  xor a
  ldh [$FF0F], a
  ldh [$FFFF], a
  ld a, $30
  ldh [$FF00], a
  stop
  ret

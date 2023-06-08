INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Load Ally Medabot Information", ROMX[$4CF8], BANK[$0A]
BattleAllyInitializeParticipantName::
  ld a, [$C647]
  or a
  ret z
  ld a, $CB
  ; Set the name to $FF as a way to inform that name should be loaded based on head part
  ld hl, $D240
  ld [hl], a
  ld hl, $D440
  ld [hl], a
  ret

  padend $4d3d
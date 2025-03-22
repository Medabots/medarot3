INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Load Ally Medabot Information", ROMX[$4CF8], BANK[$0A]
BattleAllyInitializeParticipantName::
  ld a, [$C647]
  or a
  ret z
  ld a, $CB
  ; Set the name to $CB as a way to inform that name should be loaded based on head part
  ; Store FE afterwards to identify allies
  ld hl, $D240
  ld [hli], a
  ld [hl], $FE
  ld hl, $D440
  ld [hli], a
  ld [hl], $FE
  ret

  padend $4d3d
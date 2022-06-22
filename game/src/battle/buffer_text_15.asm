INCLUDE "game/src/battle/include/buffer_text_macros.asm"

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

SECTION "Load part type for encounter reward", ROMX[$5c17], BANK[$15]
EncounterLoadRewardPartTypeText::
  LoadPartTypeTextIntoDE 15
  PartTypeTable 15

  padend $5c58
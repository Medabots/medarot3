INCLUDE "game/src/common/constants.asm"

SECTION "Sprite Prep Vars", WRAM0[$C4D0]
W_OAM_SpritesReady:: ds 1

SECTION "DMA Ready Var", WRAM0[$C4D8]
W_OAM_DMAReady:: ds 1

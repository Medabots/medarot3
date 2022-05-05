INCLUDE "game/src/common/constants.asm"

SECTION "Link Menu Variables 1", WRAM0[$C605]
W_LinkMenuItemIndex:: ds 1

SECTION "Link Menu Variables 2", WRAM0[$CC48]
W_LinkMenuBattlePlayerIneligibility:: ds 1
W_LinkMenuBattleOpponentIneligibility:: ds 1


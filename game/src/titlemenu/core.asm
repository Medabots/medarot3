INCLUDE "game/src/common/constants.asm"

SECTION "Title Menu Variables", WRAM0[$C720]
W_HasSaveData:: ds 1
W_TitleMenuSelectedOption:: ds 1

; Actual code can be found in the version folders.

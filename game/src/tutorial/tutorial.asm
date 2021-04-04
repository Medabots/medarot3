INCLUDE "game/src/common/constants.asm"

W_TutorialScrollOffset EQU $C562
W_TutorialCursorPosition EQU $C563

SECTION "Tutorial Helper Functions", ROMX[$5F60], BANK[$07]
PrepareMainScriptForTutorial::
  ld a, b
  ld [W_ItemActionMessageIndex], a
  ld a, c
  ld [W_ItemActionMessageIndex + 1], a
  jp WrapInitiateMainScript

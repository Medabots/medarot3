INCLUDE "game/src/common/constants.asm"

SECTION "Link Confirmation Helper Functions 1", ROMX[$555A], BANK[$11]
LinkConfirmationIncSubSubStateIndex::
  ld a, [W_CurrentItemPage]
  inc a
  ld [W_CurrentItemPage], a
  ret

LinkConfirmationMapYNBoxCursor::
  ld a, [W_CurrentPageItemSelectionIndex]
  ld hl, .table
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld b, [hl]
  ld c, a
  ld e, $B2
  ld a, 0
  jp WrapDecompressTilemap0ScrollAdjusted

.table
  db $9,$F
  db $B,$F

LinkConfirmationMapYNBoxCursorAsBlank::
  ld bc, $F09
  ld e, $B4
  ld a, 0
  jp WrapDecompressTilemap0ScrollAdjusted

LinkConfirmationMapYNBoxCursorAsSelected::
  ld a, [W_CurrentPageItemSelectionIndex]
  ld hl, LinkConfirmationMapYNBoxCursor.table
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld b, [hl]
  ld c, a
  ld e, $B3
  ld a, 0
  jp WrapDecompressTilemap0ScrollAdjusted

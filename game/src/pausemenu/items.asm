INCLUDE "game/src/common/constants.asm"

SECTION "Item Pagination",  WRAM0[$C577]
W_CurrentItemPage:: ds 1
W_TotalItemPages:: ds 1

SECTION "Inventory",  WRAMX[$D918], BANK[$05]
W_Inventory:: ds $5E

; The inventory array is 2 bytes per item slot.
; The first is the item index plus $80. Anything below $80 means "this item slot and all following slots are empty".
; The second byte is quantity. $80 and over means that it isn't a consumable item.


SECTION "Item Menu Helper Functions", ROMX[$4C87], BANK[$06]
ItemMenuCountPages::
  ld a, BANK(W_Inventory)
  rst 8
  ld hl, W_Inventory
  ld b, $2F
  ld c, 0

.loop
  ld a, [hli]
  cp $80
  jr c, .exitLoop
  inc hl
  inc c
  dec b
  jr nz, .loop

.exitLoop
  ld b, 0
  ld a, c
  and 3
  jr z, .roundingUnnecessary
  ld b, 1

.roundingUnnecessary
  ld a, c
  srl a
  srl a
  add b
  ld [W_TotalItemPages], a
  ret

ItemMenuMapPageIndicator::
  ld a, [W_CurrentItemPage]
  ld hl, $9824
  ld b, 0
  call $3504
  ld a, [W_TotalItemPages]
  ld hl, $9827
  ld b, 1
  jp $3504

INCLUDE "game/src/common/constants.asm"

SECTION "Item Action Message Index Variable", WRAM0[$C495]
W_ItemActionMessageIndex:: ds 2

SECTION "Item Page Row Index",  WRAM0[$C4FC]
W_ItemPageRowIndex:: ds 1

SECTION "Item Pagination",  WRAM0[$C576]
W_CurrentPageItemSelectionIndex:: ds 1
W_CurrentItemPage:: ds 1
W_TotalItemPages:: ds 1

SECTION "Item Pagination 2",  WRAM0[$C57B]
W_SelectedItemInventorySlotIndex:: ds 1

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

ItemMenuPrintPageItemNames::
  ld a, BANK(W_Inventory)
  rst 8
  ld a, [W_CurrentItemPage]
  dec a
  ld hl, W_Inventory
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld d, h
  ld e, l
  ld hl, $9863
  xor a
  ld [W_ItemPageRowIndex], a

.filledSlotLoop
  push de
  push hl
  ld a, [de]
  and $7F
  ld b, $D
  ld c, 9
  ld [W_ListItemIndexForBuffering], a
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  ld a, 8
  push hl
  call PutStringFixedLength
  pop hl
  ld de, $40
  add hl, de
  pop de
  inc de
  inc de
  ld a, [de]
  cp $80
  jr c, .emptySlotLoop
  ld a, [W_ItemPageRowIndex]
  inc a
  ld [W_ItemPageRowIndex], a
  cp 4
  jr nz, .filledSlotLoop
  ret

.emptySlotLoop
  ld a, [W_ItemPageRowIndex]
  inc a
  ld [W_ItemPageRowIndex], a
  cp 4
  ret z
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $9863
  add hl, bc
  ld bc, $801
  call $25E5
  jr .emptySlotLoop

ItemMenuDetermineSelectedItemInventorySlot::
  ld a, [W_CurrentItemPage]
  dec a
  sla a
  sla a
  ld b, a
  ld a, [W_CurrentPageItemSelectionIndex]
  add b
  ld [W_SelectedItemInventorySlotIndex], a
  ret

ItemMenuPrintSelectedItemQuantity::
  call ItemMenuGetInventorySlotAddress
  inc hl
  ld a, [hl]
  cp $80
  jr c, .printQuantity
  ld hl, $9968
  ld b, 2
  jp ItemMenuPrintDashes

.printQuantity
  ld hl, $9968
  ld b, 0
  jp $3504

ItemMenuGetInventorySlotAddress::
  ld a, BANK(W_Inventory)
  rst 8
  ld a, [W_SelectedItemInventorySlotIndex]
  ld hl, W_Inventory
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ret

ItemMenuPrintDashes::
  push de
  push hl

.loop
  ld a, $EE
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .loop
  pop hl
  pop de
  ret

LoadSelectedItemDescription::
  call WrapInitiateMainScriptAlternate
  call ItemMenuGetInventorySlotAddress
  ld a, [hl]
  and $7F
  ld b, 0
  ld c, a
  ld a, 4
  jp WrapMainScriptProcessor

ItemMenuAnimatePageArrows::
  ld a, [W_TotalItemPages]
  cp 2
  ret c
  ld a, [W_UniversalLoopingTimer]
  and 8
  jr nz, ItemMenuShowPageArrows
  ld a, 0
  ld [$C0E0], a
  ld [$C100], a
  ret

ItemMenuShowPageArrows::
  ld a, [W_TotalItemPages]
  cp 2
  ret c
  ld a, 1
  ld [$C0E0], a
  ld a, 0
  ld [$C0E1], a
  ld a, $A2
  ld [$C0E2], a
  ld a, $18
  ld [$C0E3], a
  ld a, 8
  ld [$C0E4], a
  ld a, 1
  ld [$C100], a
  ld a, 0
  ld [$C101], a
  ld a, $A3
  ld [$C102], a
  ld a, $48
  ld [$C103], a
  ld a, 8
  ld [$C104], a
  ret

SECTION "Item Action Helper Functions", ROMX[$5126], BANK[$06]
ItemActionStoreMessageIndex::
  ld a, b
  ld [W_ItemActionMessageIndex], a
  ld a, c
  ld [W_ItemActionMessageIndex + 1], a
  ret


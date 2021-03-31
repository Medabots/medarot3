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
  xor a
  ld [W_ItemPageRowIndex], a
  ld [W_ListItemInitialOffsetForBuffering], a ; Should never change
  ld a, BANK(W_Inventory)
  rst 8
  ld a, [W_CurrentItemPage]
  dec a
  ; 2 bytes per entry, 4 items per page, so x8 (2^3)
  ld h, $0
  ld l, a
  ld bc, W_Inventory
  add hl, hl
  add hl, hl
  add hl, hl
  add hl, bc ; hl = pointer to start of page
  ld de, $9863 ; de = map address

.filledSlotLoop
  ; Load text to buffer
  ld a, [hli]
  cp $80 ; Check if item is empty slot
  jr c, .emptySlot
  and $7F ; Get actual index
  ld b, $D
  ld c, $9
  ld [W_ListItemIndexForBuffering], a
  push hl
  push de
  call WrapBufferTextFromList
  pop de
  ; Print text
  ld bc, W_NewListItemBufferArea ; String address
  ld a, [W_ItemPageRowIndex] ; only from 0-3 so there's no risk of overflow anyway
  rlca ; 8 tiles per
  rlca
  rlca
  add $18 ; Draw right after fixed text in item menu
  ld h, a ; Tile index of drawing area
  push de ; de is mapping address
  call VWFDrawStringLeftFullAddress8Tiles
  ; Increment mapping area
  pop hl ; hl = de
  ld bc, $40
  add hl, bc
  ld d, h
  ld e, l
  ; Increment item index
  pop hl
  inc hl
  ld a, [W_ItemPageRowIndex]
  inc a
  ld [W_ItemPageRowIndex], a
  cp 4 ; 4 items per page
  jr nz, .filledSlotLoop
  ret

.emptySlot
  ; The rest of this row is empty slots
  ld a, [W_ItemPageRowIndex]
  rlca
  rlca
  rlca
  rlca
  rlca
  rlca ; $40 (2^6) tiles per row
  ld d, 0
  ld e, a ; max row index is 3, so no risk of overflow
.emptySlotLoop
  push de
  ld hl, $9863
  ld bc, $0801
  add hl, de
  call $25E5 ; Clear the row
  pop de
  ld a, e
  add $40
  ld e, a
  ld a, [W_ItemPageRowIndex]
  inc a
  ld [W_ItemPageRowIndex], a
  cp 4
  jr nz, .emptySlotLoop
  ret

.end
REPT $4d4e - .end
  nop
ENDR

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
  ld hl, $9969
  ld b, 2
  jp ItemMenuPrintDashes

.printQuantity
  ld hl, $9969
  ld b, 0 ; Pad right
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

SECTION "Item Helper Functions", ROMX[$54D8], BANK[$15]
IsItemInInventory::
  ld [$C4EE], a
  ld a, BANK(W_Inventory)
  rst 8
  ld de, W_Inventory
  ld c, $2F

.loop
  ld a, [de]
  cp $80
  jr c, .itemNotFound
  and $7F
  ld b, a
  ld a, [$C4EE]
  cp b
  jr z, .itemFound
  inc de
  inc de
  dec c
  jr nz, .loop

.itemNotFound
  ld a, 1
  ret  

.itemFound
  xor a
  ret

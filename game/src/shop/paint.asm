INCLUDE "game/src/common/constants.asm"

SECTION "Paint Shop Helper Functions 1", ROMX[$69FE], BANK[$16]
PaintShopMapMoney::
  push hl
  push bc
  ld a, [hli]
  ld l, [hl]
  ld h, a
  push hl
  call $14EC
  pop bc
  call $35BE
  pop bc
  pop hl
  ld a, [hli]
  ld d, a
  ld a, [hl]
  or d
  jr z, .noMoney
  ld a, 4
  add b
  ld b, a
  call $14EC
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.noMoney
  ld a, 3
  add b
  ld b, a
  call $14EC
  ld a, 0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

PaintShopIsPaintJobUnaffordable::
  ld a, [W_PlayerMoolah]
  cp 0
  jr c, .thisIsStupid ; This condition is impossible to meet.
  jr z, .highByteIsEmpty

.affordable
  xor a
  ret

.highByteIsEmpty
  ld a, [W_PlayerMoolah + 1]
  cp $A
  jr c, .unaffordable
  jr z, .affordableWrapper
  jr .affordable

.unaffordable
  call WrapInitiateMainScript
  ld a, 1
  ret

.affordableWrapper
  jr .affordable

.thisIsStupid
  ld a, [W_PlayerMoolah + 1]
  cp $A
  jr c, .unaffordableStupidEdition
  jr z, .affordableStupidEdition

.affordableStupidEdition
  xor a
  ret

.unaffordableStupidEdition
  call WrapInitiateMainScript
  ld a, 1
  ret

PaintShopUpdateMainMenuCursorPosition::
  ld a, [W_ShopBuyMenuSelection]
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C0E4], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.unusedTable
  db $10,$20,$30,$40,$50,$60,$70,$80

.table
  db $10,$20,$30,$40

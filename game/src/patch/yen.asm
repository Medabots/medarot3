INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Place Yen Symbol", ROM0[$2016]
PlaceYenSymbolShop::
; hl is the money tile mapping address for the least significant digit.
  push bc
  ld b, h
  ld a, l
  sub 5
  ld c, a
  xor a
  ld [bc], a
  inc c

.ext
  call PlaceYenSymbol
  ld h, b
  ld l, c
  pop bc
  ret

PlaceYenSymbolShopAlt::
; hl is the mapping address for the tile before the money tile mapping address.
  push bc
  ld b, h
  ld c, l
  xor a
  ld [bc], a
  inc c
  jr PlaceYenSymbolShop.ext

PlaceYenSymbol::
; bc is the money tile mapping address.
; Warning: This will cause an infinite loop if it can't find an empty tile to map to.
  push bc
  push de
  ld a, c
  add 3
  jr .decccommon

.loop
  di
  rst $20
  ld a, [bc]
  ei
  or a
  jr z, .exit

.decc
  ld a, c
  dec a

.decccommon
  and $1F
  ld d, a
  ld a, c
  and $E0
  add d
  ld c, a
  jr .loop

.exit
  di
  rst $20
  ld a, $EC
  ld [bc], a
  ei
  pop de
  pop bc
  ret

; Free space.
  padend $2060

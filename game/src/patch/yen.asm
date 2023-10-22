INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Place Yen Symbol", ROM0[$2016]
YenMath::
  add c
  and $1F
  ld d, a
  ld a, c
  and $E0
  add d
  ld c, a
  ret

PlaceYenSymbolShop::
; hl is the money tile mapping address for the least significant digit.
  push bc
  ld b, h
  ld c, l
  ld a, -5
  call YenMath

.ext
  xor a
  ld [bc], a
  ld a, 1
  call YenMath
  call PlaceYenSymbol
  ld h, b
  ld l, c
  pop bc
  ret

PlaceYenSymbolPausemenu::
; hl is the money tile mapping address for the tile after the least significant digit.
  push bc
  ld b, h
  ld c, l
  ld a, -6
  call YenMath
  jr PlaceYenSymbolShop.ext

PlaceYenSymbolShopAlt::
; hl is the mapping address for the tile before the money tile mapping address.
  push bc
  ld b, h
  ld c, l
  jr PlaceYenSymbolShop.ext

PlaceYenSymbol::
; bc is the money tile mapping address.
; Warning: This will cause an infinite loop if it can't find an empty tile to map to.
  push bc
  push de
  ld a, 3

.loop
  call YenMath
  di
  rst $20
  ld a, [bc]
  ei
  or a
  jr z, .exit

.decc
  ld a, -1
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

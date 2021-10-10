INCLUDE "game/src/common/constants.asm"

SECTION "Shop Helper Functions", ROMX[$551C], BANK[$04]
PrepareShopFadeByShopkeeper::
  ld a, [W_ShopIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw .shopkeeper0
  dw .shopkeeper1
  dw .shopkeeper2
  dw .shopkeeper0
  dw .shopkeeper0
  dw .shopkeeper1
  dw .shopkeeper0
  dw .shopkeeper0
  dw .shopkeeper0
  dw .shopkeeper3
  dw .shopkeeper3

.shopkeeper0
  ld hl, $30
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

.shopkeeper1
  ld hl, $31
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

.shopkeeper2
  ld hl, $32
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

.shopkeeper3
  ld hl, $33
  ld bc, $25
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ret

SECTION "Shop Stock", ROMX[$6FF4], BANK[$04]
Shop0Stock::
  db $5B,$FF,$FF,$FF
  db $5B,$5C,$FF,$FF
  db $5B,$5C,$3E,$FF
  db $5B,$5C,$3E,$3F

Shop1Stock::
  db $68,$FF,$FF,$FF
  db $68,$6C,$FF,$FF
  db $68,$6C,$70,$FF
  db $68,$6C,$70,$FF

Shop2Stock::
  db $69,$FF,$FF,$FF
  db $69,$6D,$FF,$FF
  db $69,$6D,$FF,$FF
  db $69,$6D,$FF,$FF

Shop3Stock::
  db $6A,$FF,$FF,$FF
  db $6A,$6F,$FF,$FF
  db $6A,$6F,$FF,$FF
  db $6A,$6F,$FF,$FF

Shop4Stock::
  db $22,$FF,$FF,$FF
  db $22,$23,$FF,$FF
  db $22,$23,$24,$FF
  db $22,$23,$24,$26

Shop5Stock::
  db $82,$FF,$FF,$FF
  db $82,$84,$FF,$FF
  db $82,$84,$86,$FF
  db $82,$84,$86,$88

Shop6Stock::
  db $83,$FF,$FF,$FF
  db $83,$85,$FF,$FF
  db $83,$85,$87,$FF
  db $83,$85,$87,$89

Shop7Stock::
  db $04,$FF,$FF,$FF
  db $04,$05,$FF,$FF
  db $04,$05,$06,$FF
  db $04,$05,$06,$07

Shop8Stock::
  db $7A,$FF,$FF,$FF
  db $7A,$7B,$FF,$FF
  db $7A,$7B,$7C,$FF
  db $7A,$7B,$7C,$7D

Shop9Stock::
  db $7E,$FF,$FF,$FF
  db $7E,$7F,$FF,$FF
  db $7E,$7F,$8E,$FF
  db $7E,$7F,$8E,$8D

Shop10Stock::
  db $8B,$FF,$FF,$FF
  db $8B,$8C,$FF,$FF
  db $8B,$8C,$08,$FF
  db $8B,$8C,$08,$27

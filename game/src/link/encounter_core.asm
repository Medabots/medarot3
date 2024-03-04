INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

; TODO: Extract the actual state machine


SECTION "Link Encounter Setup", ROMX[$5709], BANK[$11]
LinkEncounterLoadTerrainMap::
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, $2a
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $14
  ld hl, $8800
  call $34E1
  ld bc, $0104
  ld e, $53
  ld a, $00
  call WrapDecompressTilemap0
  ld a, [W_EncounterTerrainListItemIndex]
  add $b0
  ld e, a
  ld bc, $0104
  ld a, $00
  jp WrapDecompressAttribmap0

LinkEncounterLoadScreenMaps::
  ld bc, $00B0
  call WrapLoadMaliasGraphics
  ld bc, $0C02
  ld e, $16
  ld a, $01
  call WrapDecompressTilemap0
  ld bc, $0C02
  ld e, $b0
  ld a, $01
  jp WrapDecompressAttribmap0

LinkEncounterSetupTerrainPalettes::
  ld hl, $0310
  ld b, $00
  ld a, [W_EncounterTerrainListItemIndex]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld b, h
  ld c, l
  push bc
  ld a, $05
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  ld a, $06
  jp WrapRestageDestinationBGPalettesForFade

LinkEncounterSetupTerrainPalettes2::
  ld bc, $0380
  push bc
  ld a, $00
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  push bc
  ld a, $01
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  ld a, $02
  jp WrapRestageDestinationBGPalettesForFade

LinkEncounterLoadStrings::
  ld b, $11
  ld c, $07
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld bc, W_ListItemBufferArea
  ld a, $06
  call GetTileBasedCenteringOffset
  ld hl, $9821
  ld b, $00
  ld c, a
  add hl, bc
  ld bc, W_ListItemBufferArea
  call PutStringVariableLength
  ld bc, $C5A5
  ld a, $08
  call GetTileBasedCenteringOffset
  ld hl, $996B
  ld b, $00
  ld c, a
  add hl, bc
  ld bc, $C5A5
  jp PutStringVariableLength

  padend $57bf

SECTION "Link Encounter End", ROMX[$4911], BANK[$11]
LinkEncounterLoadWinRateIntoBuffers::
  ld a, $06
  rst $8
  ld a, [$C6A5]
  ld h, a
  ld a, [$C6A6]
  ld l, a
  ld de, cBUF02
  call LinkCalculateWinLossRateDigits
  ld a, [$C6A7]
  ld h, a
  ld a, [$C6A8]
  ld l, a
  ld de, cBUF01
  call LinkCalculateWinLossRateDigits
  ld a, [W_EncounterWinner]
  dec a
  ld h, $00
  ld l, a
  ld bc, $003F
  add hl, bc
  ld b, h
  ld c, l
  call $5415
  jp IncSubStateIndex

SECTION "Link Encounter Calculate Win/loss digits", ROMX[$5864], BANK[$11]
LinkCalculateWinLossRateDigits::
  xor a
  ld [$C4FC], a
  ld bc, $0064
  push de
  call DigitCalculationLoop
  pop de
  ld a, [$C4EE]
  or a
  jr z, .start_calc
  add $e0
  ld [de], a
  inc de
  ld a, $01
  ld [$C4FC], a
.start_calc
  ld a, [$C4E0]
  ld h, a
  ld a, [$C4E1]
  ld l, a
  ld bc, $000A
  push de
  call DigitCalculationLoop
  pop de
  ld a, [$C4EE]
  or a
  jr z, .next_digit_1
  add $e0
  ld [de], a
  inc de
  jr .next_digit_2
.next_digit_1
  ld a, [$C4FC]
  or a
  jr z, .next_digit_2
  ld a, $e0
  ld [de], a
  inc de
.next_digit_2
  ld a, [$C4E0]
  ld h, a
  ld a, [$C4E1]
  ld l, a
  ld bc, $0001
  push de
  call DigitCalculationLoop
  pop de
  ld a, [$C4EE]
  add $e0
  ld [de], a
  inc de
  ld a, $cb
  ld [de], a
  ret
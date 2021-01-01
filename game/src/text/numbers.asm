INCLUDE "game/src/common/constants.asm"

W_MapDigitsBuffer EQU $C4E0 ; Since this address is already symbolised as W_TilemapWritingBaseLocationIndex.

SECTION "Number Mapping Variables 1", WRAM0[$C4E2]
W_MapDigitsAddress:: ds 2

W_MapDigitsCurrentCalculatedDigit EQU $C4EE ; This address is overutilised, so EQU is better.
W_MapDigitsSignificantDigitFound EQU $C4F0 ; This address is overutilised, so EQU is better.
W_MapDigitsMedalExpSignificantDigitFound EQU $C4F2

SECTION "Map Four Digit Numbers", ROM0[$1352]
MapFourDigitNumber::
  push hl
  push de
  push bc
  xor a
  ld [W_MapDigitsSignificantDigitFound], a
  ld a, h
  ld [W_MapDigitsAddress], a
  ld a, l
  ld [W_MapDigitsAddress + 1], a
  ld h, b
  ld l, c

.parseThousandsDigit
  ld bc, 1000 ; in decimal
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .thousandsDigitNotZero
  ld b, a
  ld a, [W_MapDigitsSignificantDigitFound]
  or a
  jr z, .skipThousandsDigit
  ld a, b

.thousandsDigitNotZero
  add $E0
  push af
  ld a, [W_MapDigitsAddress]
  ld h, a
  ld a, [W_MapDigitsAddress + 1]
  ld l, a
  pop af
  di
  push af
  rst $20
  pop af
  ld [hl], a
  ei
  ld a, 1
  ld [W_MapDigitsSignificantDigitFound], a

.skipThousandsDigit
  ld a, [W_MapDigitsBuffer]
  ld h, a
  ld a, [W_MapDigitsBuffer + 1]
  ld l, a

.parseHundredsDigit
  ld bc, 100 ; in decimal
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .hundredsDigitNotZero
  ld b, a
  ld a, [W_MapDigitsSignificantDigitFound]
  or a
  jr z, .skipHundredsDigit
  ld a, b

.hundredsDigitNotZero
  add $E0
  push af
  ld a, [W_MapDigitsAddress]
  ld h, a
  ld a, [W_MapDigitsAddress + 1]
  ld l, a

  ; Someone should have told Natsume that inc hl was a thing.
  ld bc, 1
  add hl, bc
  xor a
  call Tilemap0WrapToLine
  pop af
  di
  push af
  rst $20
  pop af
  ld [hl], a
  ei
  ld a, 1
  ld [W_MapDigitsSignificantDigitFound], a

.skipHundredsDigit
  ld a, [W_MapDigitsBuffer]
  ld h, a
  ld a, [W_MapDigitsBuffer + 1]
  ld l, a

.parseTensDigit
  ld bc, 10 ; in decimal
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .tensDigitNotZero
  ld b, a
  ld a, [W_MapDigitsSignificantDigitFound]
  or a
  jr z, .skipTensDigit
  ld a, b

.tensDigitNotZero
  add $E0
  push af
  ld a, [W_MapDigitsAddress]
  ld h, a
  ld a, [W_MapDigitsAddress + 1]
  ld l, a
  ld bc, 1
  add hl, bc
  xor a
  call Tilemap0WrapToLine
  ld bc, 1
  add hl, bc
  xor a
  call Tilemap0WrapToLine
  pop af
  di
  push af
  rst $20
  pop af
  ld [hl], a
  ei

.skipTensDigit
  ld a, [W_MapDigitsBuffer]
  ld h, a
  ld a, [W_MapDigitsBuffer + 1]
  ld l, a

.parseOnesDigit
  ld bc, 1
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  add $E0
  push af
  ld a, [W_MapDigitsAddress]
  ld h, a
  ld a, [W_MapDigitsAddress + 1]
  ld l, a
  ld bc, 1
  add hl, bc
  xor a
  call Tilemap0WrapToLine
  ld bc, 1
  add hl, bc
  xor a
  call Tilemap0WrapToLine
  ld bc, 1
  add hl, bc
  xor a
  call Tilemap0WrapToLine
  pop af
  di
  push af
  rst $20
  pop af
  ld [hl], a
  ei
  pop bc
  pop de
  pop hl
  ret

SECTION "Map Digit Helper Function", ROM0[$1451]
DigitCalculationLoop::
  xor a
  ld [W_MapDigitsCurrentCalculatedDigit], a
  ld [W_MapDigitsCurrentCalculatedDigit + 1], a
  ld a, b
  or a
  jr nz, .loop
  ld a, c
  or a
  ret z

.loop
  ld a, h
  ld [W_MapDigitsBuffer], a
  ld a, l
  ld [W_MapDigitsBuffer + 1], a
  ld d, b
  ld a, h
  sub d
  ret c
  jr nz, .noChanceOfOverflow
  ld d, c
  ld a, l
  sub d
  ret c

.noChanceOfOverflow
  ld a, [W_MapDigitsBuffer + 1]
  sub c
  ld l, a
  ld a, [W_MapDigitsBuffer]
  sbc b
  ld h, a
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  add 1
  ld [W_MapDigitsCurrentCalculatedDigit], a
  ld a, 0
  adc 0
  ld d, a
  ld a, [W_MapDigitsCurrentCalculatedDigit + 1]
  add d
  ld [W_MapDigitsCurrentCalculatedDigit + 1], a
  jr .loop

SECTION "Medal Menu Exp To Next Level", ROMX[$49A5], BANK[$02]
MapExpToNextLevel::
  push hl
  push de
  push bc
  xor a
  ld [W_MapDigitsMedalExpSignificantDigitFound], a

.parseTenThousandsDigit
  push hl
  ld h, b
  ld l, c
  ld bc, 10000
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .tenThousandsDigitNotZero
  pop hl
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  jr .parseThousandsDigit

.tenThousandsDigitNotZero
  pop hl
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  ld [W_MapDigitsMedalExpSignificantDigitFound], a

.parseThousandsDigit
  push hl
  ld a, [W_MapDigitsBuffer]
  ld h, a
  ld a, [W_MapDigitsBuffer + 1]
  ld l, a
  ld bc, 1000
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .thousandsDigitNotZero
  ld a, [W_MapDigitsMedalExpSignificantDigitFound]
  or a
  jr z, .skipThousandsDigit
  xor a

.thousandsDigitNotZero
  pop hl
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  ld [W_MapDigitsMedalExpSignificantDigitFound], a
  jr .parseHundredsDigit

.skipThousandsDigit
  pop hl
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei

.parseHundredsDigit
  push hl
  ld a, [W_MapDigitsBuffer]
  ld h, a
  ld a, [W_MapDigitsBuffer + 1]
  ld l, a
  ld bc, 100
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .hundredsDigitNotZero
  ld a, [W_MapDigitsMedalExpSignificantDigitFound]
  or a
  jr z, .skipHundredsDigit
  xor a
  jr .hundredsDigitNotZero

.hundredsDigitNotZero
  pop hl
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  ld [W_MapDigitsMedalExpSignificantDigitFound], a
  jr .parseTensDigit

.skipHundredsDigit
  pop hl
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei

.parseTensDigit
  push hl
  ld a, [W_MapDigitsBuffer]
  ld h, a
  ld a, [W_MapDigitsBuffer + 1]
  ld l, a
  ld bc, 10
  call DigitCalculationLoop
  ld a, [W_MapDigitsCurrentCalculatedDigit]
  or a
  jr nz, .tensDigitNotZero
  ld a, [W_MapDigitsMedalExpSignificantDigitFound]
  or a
  jr z, .skipTensDigit
  xor a
  jr .tensDigitNotZero

.tensDigitNotZero
  pop hl
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  ld [W_MapDigitsMedalExpSignificantDigitFound], a
  jr .parseOnesDigit

.skipTensDigit
  pop hl
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei

.parseOnesDigit
  ld a, [W_MapDigitsBuffer + 1]
  add $E0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  pop bc
  pop de
  pop hl
  ret

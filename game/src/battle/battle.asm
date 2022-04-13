INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Battle Helper Functions 1", ROMX[$4DCF], BANK[$0A]
; Part of initial state (0A:40C1 -> 0A:4B84 -> 0A:4DCF)
BattleInitializeLoadParticipantData::
  xor a
  ld [$C4EE], a

.loop
  ld hl, $60
  add hl, de
  ld a, [$C4F2]
  ld [hl], a
  ld hl, $62
  add hl, de
  ld a, 1
  ld [hl], a
  ld hl, 3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 1
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $D0
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, 9
  call memcpy
  pop de
  ld hl, 3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $D9
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  ld a, [$C554]
  ld [hli], a
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C555]
  ld hl, $E6
  add hl, de
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld hl, $ED
  add hl, de
  ld a, [$C55C]
  ld [hl], a
  ld hl, $EE
  add hl, de
  ld a, [$C55E]
  ld [hl], a
  ld hl, $E8
  add hl, de
  ld a, [$C55F]
  ld [hl], a
  ld hl, 4
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 2
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $F0
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, 9
  call memcpy
  pop de
  ld hl, 4
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 1
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $F9
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  ld a, [$C554]
  ld [hli], a
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld a, [$C555]
  ld hl, $106
  add hl, de
  ld [hli], a
  ld hl, $10D
  add hl, de
  ld a, [$C55C]
  ld [hl], a
  ld hl, $108
  add hl, de
  ld a, [$C55F]
  ld [hl], a
  ld hl, 5
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 3
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $110
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, 9
  call memcpy
  pop de
  ld hl, 5
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 2
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $119
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  ld a, [$C554]
  ld [hli], a
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld a, [$C555]
  ld hl, $126
  add hl, de
  ld [hli], a
  ld hl, $12D
  add hl, de
  ld a, [$C55C]
  ld [hl], a
  ld hl, $128
  add hl, de
  ld a, [$C55F]
  ld [hl], a
  ld hl, 6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, 4
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $130
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, 9
  call memcpy
  pop de
  ld hl, 6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 3
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $139
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  inc hl
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld hl, $146
  add hl, de
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld hl, $14D
  add hl, de
  ld a, [$C55C]
  ld [hl], a
  ld hl, $EE
  add hl, de
  ld a, [hl]
  or a
  jp z, .nextParticipant
  ld hl, 3
  add hl, de
  ld a, [hli]
  ld b, a
  ld a, [hli]
  cp b
  jr nz, .jpA

  ld a, [hli]
  cp b
  jr nz, .jpA

  ld a, [hli]
  cp b
  jr z, .jpB

.jpA
  xor a
  ld hl, $EE
  add hl, de
  ld [hl], a
  jp .nextParticipant

.jpB
  ld hl, 3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $159
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  ld a, [$C554]
  ld [hli], a
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld hl, $168
  add hl, de
  ld a, [$C55F]
  ld [hl], a
  ld hl, 4
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 5
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $179
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  ld a, [$C554]
  ld [hli], a
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld hl, $188
  add hl, de
  ld a, [$C55F]
  ld [hl], a
  ld hl, 5
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 6
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $199
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  ld a, [$C554]
  ld [hli], a
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld hl, $1A8
  add hl, de
  ld a, [$C55F]
  ld [hl], a
  ld hl, 6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 7
  push de
  call $34FF
  pop de
  ld a, [$C552]
  ld hl, $1B9
  add hl, de
  ld [hli], a
  ld a, [$C553]
  ld [hli], a
  inc hl
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a
  ld hl, $1C6
  add hl, de
  ld a, [$C555]
  ld [hli], a
  ld a, [$C556]
  ld [hli], a
  ld a, [$C557]
  ld [hli], a
  ld a, [$C558]
  ld [hli], a
  ld a, [$C559]
  ld [hli], a
  ld a, [$C55A]
  ld [hli], a

.nextParticipant
  ld hl, $DC
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $FC
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $11C
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $13C
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$C4EE]
  inc a
  ld [$C4EE], a
  ld a, [$C4F2]
  inc a
  ld [$C4F2], a
  ld a, [$C4F0]
  dec a
  ld [$C4F0], a
  jp nz, .loop
  ret

  padend $5137

SECTION "Battle Helper Functions 2", ROMX[$5662], BANK[$0A]
CalculateBattleParticipantAddress::
  ld hl, $D000
  ld b, 0
  ld c, a
  ld a, 9
  jp MultiplyBCByPowerOfTwoAndAddToHL

SECTION "Battle Helper Functions 3", ROMX[$5778], BANK[$0A]
MapAttackNamesForBattle::
  ld a, [$DCB6]
  ld hl, .table
  rst $30
  jp hl

.table
  dw .standardAttacks
  dw .medaliaAttacks
  dw .medachangeAttacks

.standardAttacks
  ld a, [$DCB9]
  call CalculateBattleParticipantAddress
  call MapPlayerAttackANamePlusAmmoForBattle
  call MapPlayerAttackBNameForBattle
  jp MapPlayerAttackCNameForBattle

.medaliaAttacks
  ld a, [$DCB9]
  call CalculateBattleParticipantAddress
  call MapMedaforceANamePlusAmmoForBattle
  call MapMedaforceBNameForBattle
  jp MapMedaforceCNameForBattle

.medachangeAttacks
  ld a, [$DCB9]
  call CalculateBattleParticipantAddress
  call MapPlayerMedachangeAttackANamePlusAmmoForBattle
  call MapPlayerMedachangeAttackBNameForBattle
  jp MapPlayerMedachangeAttackCNameForBattle

MapPlayerAttackANamePlusAmmoForBattle::
.mapAmmo
  ld hl, $E7
  add hl, de
  ld a, [hl]
  ld hl, $99CF
  ld b, 0
  call $3504
  ld hl, $E0
  add hl, de
  ld a, [hl]
  ld hl, $99D2
  ld b, 1
  call $3504
  ld a, $ED
  ld hl, $99D1
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei

  ; Head part can't be broken
  ld hl, 3
  add hl, de
  ld a, [hl]
  push de ; Must preserve de
  ld de, $99C6
  ld b, $01
  ld h, $70
  call HelperPullPartsTextAndDraw
  pop de
  ret

MapPlayerAttackBNameForBattle::
  ; Check if part is broken
  ld hl, $106
  add hl, de
  ld a, [hl]
  or a
  jr z, .mapDashes
  ld hl, 4
  add hl, de
  ld a, [hl]
  push de ; Must preserve de
  ld de, $9A0B
  ld b, $02
  ld h, $68
  call HelperPullPartsTextAndDraw
  pop de
  ret
.mapDashes
  ld hl, $9A0B
  jr HelperMapDashes

MapPlayerAttackCNameForBattle::
  ; Check if part is broken
  ld hl, $126
  add hl, de
  ld a, [hl]
  or a
  jr z, .mapDashes
  ld hl, 5
  add hl, de
  ld a, [hl]
  push de ; Must preserve de
  ld de, $9A01
  ld b, $03
  ld h, $60
  call HelperPullPartsTextAndDraw
  pop de
  ret
.mapDashes
  ld hl, $9A01
  jr HelperMapDashes

HelperMapDashes:
  ; hl is position to draw
  push hl
  call MapEightDashesForBattle
  pop hl
  ld bc, $DCBA
  jp PutStringVariableLength

HelperPullPartsTextAndDraw:
  ; a - list index
  ; b - part index
  ; de - location to draw
  ; h - tile address
  ld c, $09 ; All parts are c == 09
  ld [W_ListItemIndexForBuffering], a
  ld a, 7 ; skip the the part model
  ld [W_ListItemInitialOffsetForBuffering], a
  push hl
  push de
  call WrapBufferTextFromList
  pop de
  pop hl
  ld bc, W_NewListItemBufferArea
  call VWFDrawStringCentredFullAddress8Tiles
  ret

MapEightDashesForBattle::
  ld hl, $DCBA
  ld b, 8
.loop
  ld a, $EE
  ld [hli], a
  dec b
  jr nz, .loop
  ld a, $CB
  ld [hl], a
  ret

MapMedaforceANamePlusAmmoForBattle::
  ld hl, $15
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  ld [W_ListItemIndexForBuffering], a
  ld bc, $0A09
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  ld h, $70
  ld de, $99c6
  ld bc, W_NewListItemBufferArea
  call VWFDrawStringCentredFullAddress8Tiles
  pop de
  jr .mapDashes

.slotEmpty
  ld hl, $99C6
  call HelperMapDashes

.mapDashes
  ld hl, $99CF
  ld a, 5
  jp MapDashesForBattle

MapMedaforceBNameForBattle::
  ld hl, $16
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  ld [W_ListItemIndexForBuffering], a
  ld bc, $0A09
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  ld h, $68
  ld de, $9A0B
  ld bc, W_NewListItemBufferArea
  call VWFDrawStringCentredFullAddress8Tiles
  pop de
  ret

.slotEmpty
  ld hl, $9A0B
  jp HelperMapDashes

MapMedaforceCNameForBattle::
  ld hl, $17
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  ld [W_ListItemIndexForBuffering], a
  ld bc, $0A09
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  ld h, $60
  ld de, $9A01
  ld bc, W_NewListItemBufferArea
  call VWFDrawStringCentredFullAddress8Tiles
  pop de
  ret

.slotEmpty
  ld hl, $9A01
  jp HelperMapDashes

MapDashesForBattle::
  ld b, a

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
  ret

  padend $592c

MapPlayerMedachangeAttackANamePlusAmmoForBattle::
  push de
  ld hl, $99C6
  ld de, MedachangeAttackAName
  ld b, 8

.loop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .loop
  pop de
  ld hl, $E7
  add hl, de
  ld a, [hl]
  ld hl, $99CF
  ld b, 0
  call $3504
  ld hl, $E0
  add hl, de
  ld a, [hl]
  ld hl, $99D2
  ld b, 1
  call $3504
  ld a, $ED
  ld hl, $99D1
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

MedachangeAttackAName::
  db $00,$00,$56,$57,$58,$59,$00,$00

MedachangeAttackBName::
  db $00,$00,$56,$57,$58,$5A,$00,$00

MedachangeAttackCName::
  db $00,$00,$56,$57,$58,$5B,$00,$00

MapPlayerMedachangeAttackBNameForBattle::
  push de
  ld hl, $9A0B
  ld de, MedachangeAttackBName
  ld b, 8

.loop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .loop
  pop de
  ret

MapPlayerMedachangeAttackCNameForBattle::
  push de
  ld hl, $9A01
  ld de, MedachangeAttackCName
  ld b, 8

.loop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .loop
  pop de
  ret

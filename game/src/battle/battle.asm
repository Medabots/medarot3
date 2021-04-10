INCLUDE "game/src/common/constants.asm"

SECTION "Battle Helper Functions 1", ROMX[$5662], BANK[$0A]
CalculateBattleParticipantAddress::
  ld hl, $D000
  ld b, 0
  ld c, a
  ld a, 9
  jp MultiplyBCByPowerOfTwoAndAddToHL

SECTION "Battle Helper Functions 2", ROMX[$5778], BANK[$0A]
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
  call MapPlayerMedaliaAttackANamePlusAmmoForBattle
  call MapPlayerMedaliaAttackBNameForBattle
  jp MapPlayerMedaliaAttackCNameForBattle

.medachangeAttacks
  ld a, [$DCB9]
  call CalculateBattleParticipantAddress
  call MapPlayerMedachangeAttackANamePlusAmmoForBattle
  call MapPlayerMedachangeAttackBNameForBattle
  jp MapPlayerMedachangeAttackCNameForBattle

MapPlayerAttackANamePlusAmmoForBattle::
  ld hl, $D0
  add hl, de
  ld b, h
  ld c, l
  call BufferCentredAttackNameForBattle
  jr .mapName
  call MapEightDashesForBattle

.mapName
  ld hl, $99C6
  ld bc, $DCBA
  call PutStringVariableLength
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

MapPlayerAttackBNameForBattle::
  ld hl, $106
  add hl, de
  ld a, [hl]
  or a
  jr z, .mapDashes
  ld hl, $F0
  add hl, de
  ld b, h
  ld c, l
  call BufferCentredAttackNameForBattle
  jr .mapName

.mapDashes
  call MapEightDashesForBattle

.mapName
  ld hl, $9A0B
  ld bc, $DCBA
  jp PutStringVariableLength

MapPlayerAttackCNameForBattle::
  ld hl, $126
  add hl, de
  ld a, [hl]
  or a
  jr z, .mapDashes
  ld hl, $110
  add hl, de
  ld b, h
  ld c, l
  call BufferCentredAttackNameForBattle
  jr .mapName

.mapDashes
  call MapEightDashesForBattle

.mapName
  ld hl, $9A01
  ld bc, $DCBA
  jp PutStringVariableLength

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

BufferCentredAttackNameForBattle::
  push de
  push hl
  ld a, 8
  call GetTileBasedCentringOffset
  pop de
  ld b, a
  ld a, 8
  ld [$C4EE], a
  ld hl, $DCBA

.paddingLoop
  ld a, b
  or a
  jr z, .copyLoop
  xor a
  ld [hli], a
  dec b
  ld a, [$C4EE]
  dec a
  ld [$C4EE], a
  jr .paddingLoop

.copyLoop
  ld a, [de]
  cp $CB
  jr z, .endPaddingLoop
  ld [hli], a
  inc de
  ld a, [$C4EE]
  dec a
  ld [$C4EE], a
  jr .copyLoop

.endPaddingLoop
  ld a, [$C4EE]
  or a
  jr z, .addTerminator
  xor a
  ld [hli], a
  ld a, [$C4EE]
  dec a
  ld [$C4EE], a
  jr .endPaddingLoop

.addTerminator
  ld a, $CB
  ld [hl], a
  pop de
  ret

MapPlayerMedaliaAttackANamePlusAmmoForBattle::
  ld hl, $15
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 9
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld hl, W_ListItemBufferArea
  ld bc, W_ListItemBufferArea
  call BufferCentredAttackNameForBattle
  jr .mapName

.slotEmpty
  call MapEightDashesForBattle

.mapName
  ld hl, $99C6
  ld bc, $DCBA
  call PutStringVariableLength
  ld hl, $99CF
  ld a, 5
  jp MapDashesForBattle

MapPlayerMedaliaAttackBNameForBattle::
  ld hl, $16
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 9
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld hl, W_ListItemBufferArea
  ld bc, W_ListItemBufferArea
  call BufferCentredAttackNameForBattle
  jr .mapName

.slotEmpty
  call MapEightDashesForBattle

.mapName
  ld hl, $9A0B
  ld bc, $DCBA
  jp PutStringVariableLength

MapPlayerMedaliaAttackCNameForBattle::
  ld hl, $17
  add hl, de
  ld a, [hl]
  cp $FF
  jr z, .slotEmpty
  ld [W_ListItemIndexForBuffering], a
  ld b, $A
  ld c, 9
  ld a, 6
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld hl, W_ListItemBufferArea
  ld bc, W_ListItemBufferArea
  call BufferCentredAttackNameForBattle
  jr .mapName

.slotEmpty
  call MapEightDashesForBattle

.mapName
  ld hl, $9A01
  ld bc, $DCBA
  jp PutStringVariableLength

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
  db $00,$7B,$27,$02,$7E,$00,$9E,$00

MedachangeAttackBName::
  db $00,$7B,$27,$02,$7E,$00,$9F,$00

MedachangeAttackCName::
  db $00,$7B,$27,$02,$7E,$00,$A0,$00

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

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

INCLUDE "build/pointer_constants.asm"

; In general these are just copies of the routines in battle but only used within link
; There may be some subtle differences


SECTION "Link Battle Helper Functions 1", ROMX[$52BC], BANK[$12]
; TODO: This is identical to the equivalent function in battle
LinkBattleInitializeLoadParticipantData:: 
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
  ld hl, W_NewListItemBufferArea
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
  ld hl, W_NewListItemBufferArea
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
  ld hl, W_NewListItemBufferArea
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
  ld hl, W_NewListItemBufferArea
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
  call LinkBattleInitializeLoadParticipantData_sub
  ld hl, $FC
  add hl, de
  ld a, [hl]
  call LinkBattleInitializeLoadParticipantData_sub
  ld hl, $11C
  add hl, de
  ld a, [hl]
  call LinkBattleInitializeLoadParticipantData_sub
  ld hl, $13C
  add hl, de
  ld a, [hl]
  call LinkBattleInitializeLoadParticipantData_sub
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

LinkBattleInitializeLoadParticipantData_sub:: ; 49624 (12:5624)
  push hl
  ld c, a
  ld hl, $00A8
  add hl, de
  ld a, [hli]
  ld l, [hl]
  ld h, a
  ld b, $00
  add hl, bc
  ld b, h
  ld c, l
  ld hl, $00A8
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld hl, $00AA
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  pop hl
  ret

  padend $5644

SECTION "Link Battle Helper Functions 2", ROMX[$5B40], BANK[$12]
LinkCalculateBattleParticipantAddress::
  ld hl, $D000
  ld b, 0
  ld c, a
  ld a, 9
  jp MultiplyBCByTwoToThePowerOfAAndAddToHL

SECTION "Link Battle Helper Functions 3", ROMX[$5c56], BANK[$12]
LinkMapAttackNamesForBattle::
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
  call LinkCalculateBattleParticipantAddress
  call LinkMapPlayerAttackANamePlusAmmoForBattle
  call LinkMapPlayerAttackBNameForBattle
  jp LinkMapPlayerAttackCNameForBattle

.medaliaAttacks
  ld a, [$DCB9]
  call LinkCalculateBattleParticipantAddress
  call LinkMapMedaforceANamePlusAmmoForBattle
  call LinkMapMedaforceBNameForBattle
  jp LinkMapMedaforceCNameForBattle

.medachangeAttacks
  ld a, [$DCB9]
  call LinkCalculateBattleParticipantAddress
  call LinkMapPlayerMedachangeAttackANamePlusAmmoForBattle
  call LinkMapPlayerMedachangeAttackBNameForBattle
  jp LinkMapPlayerMedachangeAttackCNameForBattle

LinkMapPlayerAttackANamePlusAmmoForBattle::
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
  call LinkHelperPullPartsTextAndDraw
  pop de
  ret

LinkMapPlayerAttackBNameForBattle::
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
  call LinkHelperPullPartsTextAndDraw
  pop de
  ret
.mapDashes
  ld hl, $9A0B
  jr LinkHelperMapDashes

LinkMapPlayerAttackCNameForBattle::
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
  call LinkHelperPullPartsTextAndDraw
  pop de
  ret
.mapDashes
  ld hl, $9A01
  jr LinkHelperMapDashes

LinkHelperMapDashes:
  ; hl is position to draw
  push hl
  call LinkMapEightDashesForBattle
  pop hl
  ld bc, $DCBA
  jp PutStringVariableLength

LinkHelperPullPartsTextAndDraw:
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
  call VWFDrawStringCenteredFullAddress8Tiles
  ret

LinkMapEightDashesForBattle::
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

LinkMapMedaforceANamePlusAmmoForBattle::
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
  call VWFDrawStringCenteredFullAddress8Tiles
  pop de
  jr .mapDashes

.slotEmpty
  ld hl, $99C6
  call LinkHelperMapDashes

.mapDashes
  ld hl, $99CF
  ld a, 5
  jp LinkMapDashesForBattle

LinkMapMedaforceBNameForBattle::
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
  call VWFDrawStringCenteredFullAddress8Tiles
  pop de
  ret

.slotEmpty
  ld hl, $9A0B
  jp LinkHelperMapDashes

LinkMapMedaforceCNameForBattle::
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
  call VWFDrawStringCenteredFullAddress8Tiles
  pop de
  ret

.slotEmpty
  ld hl, $9A01
  jp LinkHelperMapDashes

LinkMapDashesForBattle::
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

  padend $5e0a

LinkMapPlayerMedachangeAttackANamePlusAmmoForBattle::
  push de
  ld hl, $99C6
  ld de, .medachangeAttackAName
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

.medachangeAttackAName
  db $00,$00,$56,$57,$58,$59,$00,$00

.medachangeAttackBName
  db $00,$00,$56,$57,$58,$5A,$00,$00

.medachangeAttackCName
  db $00,$00,$56,$57,$58,$5B,$00,$00

LinkMapPlayerMedachangeAttackBNameForBattle::
  push de
  ld hl, $9A0B
  ld de, LinkMapPlayerMedachangeAttackANamePlusAmmoForBattle.medachangeAttackBName
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

LinkMapPlayerMedachangeAttackCNameForBattle::
  push de
  ld hl, $9A01
  ld de, LinkMapPlayerMedachangeAttackANamePlusAmmoForBattle.medachangeAttackCName
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

SECTION "Link 'Medaforce' selection", ROMX[$6205], BANK[$12]
LinkBattlePrepareMedaforce::
  xor a
  ld [$c4f1], a
  ld a, [$dc10]
  cp $28
  jp z, .no_medaforce_selected
  ld a, b
  cp $ff
  jr z, .check_table
  ld [$c4f0], a
  ld a, $01
  ld [$c4f1], a
  jr .ignore_table
.check_table
  call $ab4
  ld a, [$c4a0]
  and $07
  ld hl, .table
  ld b, $00
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [$c4f0], a
.ignore_table
  xor a
  ld [$c4f2], a
.check_next
  ld hl, $15
  ld b, $00
  ld a, [$c4f0]
  ld c, a
  add hl, bc
  add hl, de
  ld a, [hl]
  cp $ff
  jr z, .no_medaforce
  ld [W_ListItemIndexForBuffering], a
  ld b, $0a
  ld c, $0f
  ld a, $00
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld a, [$c546]
  ld b, a
  ld hl, $1dc
  add hl, de
  ld a, [hl]
  cp b
  jr c, .no_medaforce
  call LinkBattlePrepareMedaforceCopyToStructure
  jr .medaforce_selected
.no_medaforce
  ld a, [$c4f1]
  or a
  jr nz, .no_medaforce_selected
  ld a, [$c4f0]
  sub $01
  jr nc, .increment
  ld a, $02
.increment
  ld [$c4f0], a
  ld a, [$c4f2]
  inc a
  ld [$c4f2], a
  cp $03
  jr nz, .check_next
.no_medaforce_selected
  xor a
  ret
.medaforce_selected
  ld a, $01
  ret
.table
  db $00, $01, $02
  db $00, $01, $02
  db $00, $01

  padend $6293

LinkBattlePrepareMedaforceCopyToStructure::
  push de
  ld hl, $1d0
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea + $6 ; Medaforce name
  ld bc, $9
  call memcpy
  pop de
  ld a, [W_ListItemBufferArea + $3]
  ld hl, $1da
  add hl, de
  ld [hli], a
  ld hl, $15
  ld b, $00
  ld a, [$c4f0]
  ld c, a
  add hl, bc
  add hl, de
  ld a, [hl]
  push af
  ld hl, $1e0
  add hl, de
  pop af
  ld [hli], a
  ld hl, $1db
  add hl, de
  ld a, [W_ListItemBufferArea]
  ld [hl], a
  ld hl, $1dd
  add hl, de
  ld a, [W_ListItemBufferArea + $1]
  ld [hli], a
  ld hl, $1de
  add hl, de
  ld a, [W_ListItemBufferArea + $2]
  ld [hli], a
  ld hl, $1e1
  add hl, de
  ld a, [W_ListItemBufferArea + $4]
  ld [hli], a
  ld hl, $1df
  add hl, de
  ld a, [W_ListItemBufferArea + $5]
  ld [hli], a
  ld hl, $1e6
  add hl, de
  ld a, [$c4f0]
  inc a
  ld [hli], a
  ld hl, $a2
  add hl, de
  ld a, [$c4f0]
  add $04
  ld [hl], a
  ld hl, $1e3
  add hl, de
  ld [hl], $00
  ret

  padend $6301
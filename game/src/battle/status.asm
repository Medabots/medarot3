INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Battle Status Functions 1", ROMX[$6607], BANK[$10]
BufferParticipantDataForBattleStatus::
  push hl
  push bc
  ld hl, $D000
  ld b, 0
  ld c, a
  ld a, 9
  call MultiplyBCByPowerOfTwoAndAddToHL
  pop bc
  ld a, b
  ld [$C4EE], a
  pop hl
  add hl, de
  ld bc, $C552

.loop
  ld a, [hli]
  ld [bc], a
  inc bc
  ld a, [$C4EE]
  dec a
  ld [$C4EE], a
  jr nz, .loop
  ret

BattleStatusDisplayCurrentMedarot::
  call DisplayMedalIconForBattleStatus
  call MapMedalNameForBattleStatus
  call MapHeadPartNameForBattleStatus
  call MapLeftArmPartNameForBattleStatus
  call MapRightArmPartNameForBattleStatus
  call MapLegPartNameForBattleStatus
  call MapHeadPartCompatibilityBonusForBattleStatus
  call MapLeftArmPartCompatibilityBonusForBattleStatus
  call MapRightArmPartCompatibilityBonusForBattleStatus
  call MapLegPartCompatibilityBonusForBattleStatus
  call DisplayMedarotImageForBattleStatus
  ret

DisplayMedalIconForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $11
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $C
  ld hl, $8C80
  call $34E1
  ld bc, $100
  ld e, $46
  ld a, 0
  jp WrapDecompressTilemap0

MapMedalNameForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $11
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  ld [W_ListItemIndexForBuffering], a
  ld bc, $0B06
  xor a
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld de, $9823
  ld h, $01
  ld bc, W_NewListItemBufferArea
  ld a, 5
  jp VWFDrawStringLeftFullAddress

  padend $669d

MapHeadPartNameForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $E6
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr nz, .hasPart
  ld hl, $9863
  ld b, 8
  jp MapDashesForBattleStatus

.hasPart
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $D0
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $9863
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapLeftArmPartNameForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $106
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr nz, .hasPart
  ld hl, $98A3
  ld b, 8
  jp MapDashesForBattleStatus

.hasPart
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $F0
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $98A3
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapRightArmPartNameForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $126
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr nz, .hasPart
  ld hl, $98E3
  ld b, 8
  jp MapDashesForBattleStatus

.hasPart
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $110
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $98E3
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapLegPartNameForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $146
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr nz, .hasPart
  ld hl, $9923
  ld b, 8
  jp MapDashesForBattleStatus

.hasPart
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $130
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $9923
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapDashesForBattleStatus::
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

MapHeadPartCompatibilityBonusForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $D9
  ld b, 1
  call BufferParticipantDataForBattleStatus
  pop af
  ld b, a
  ld a, [$C552]
  cp b
  jr z, .hasBonus
  xor a
  ld hl, $9843
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.hasBonus
  ld a, $F0
  ld hl, $9843
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  ld hl, $1B
  add hl, de
  ld a, [hl]
  pop hl
  jp MapCompatibilityBonusNumberForBattleStatus

MapLeftArmPartCompatibilityBonusForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $F9
  ld b, 1
  call BufferParticipantDataForBattleStatus
  pop af
  ld b, a
  ld a, [$C552]
  cp b
  jr z, .hasBonus
  xor a
  ld hl, $9883
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.hasBonus
  ld a, $F0
  ld hl, $9883
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  ld hl, $1B
  add hl, de
  ld a, [hl]
  pop hl
  jp MapCompatibilityBonusNumberForBattleStatus

MapRightArmPartCompatibilityBonusForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $119
  ld b, 1
  call BufferParticipantDataForBattleStatus
  pop af
  ld b, a
  ld a, [$C552]
  cp b
  jr z, .hasBonus
  xor a
  ld hl, $98C3
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.hasBonus
  ld a, $F0
  ld hl, $98C3
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  ld hl, $1B
  add hl, de
  ld a, [hl]
  pop hl
  jp MapCompatibilityBonusNumberForBattleStatus

MapLegPartCompatibilityBonusForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [W_BattleStatusCursorPosition]
  ld hl, $139
  ld b, 1
  call BufferParticipantDataForBattleStatus
  pop af
  ld b, a
  ld a, [$C552]
  cp b
  jr z, .hasBonus
  xor a
  ld hl, $9903
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.hasBonus
  ld a, $F0
  ld hl, $9903
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  ld hl, $1B
  add hl, de
  ld a, [hl]
  pop hl
  jp MapCompatibilityBonusNumberForBattleStatus

MapCompatibilityBonusNumberForBattleStatus::
  push hl
  ld h, 0
  ld l, a
  ld bc, 10 ; Decimal.
  call DigitCalculationLoop
  pop hl
  ld a, [$C4EE]
  or a
  jr z, .justOneDigit
  ld a, $DA
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4E1]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.justOneDigit
  push hl
  ld a, [$C4E1]
  ld h, 0
  ld l, a
  ld bc, 1
  call DigitCalculationLoop
  pop hl
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  or a
  jr z, .zeroPlz
  ld a, $DA
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

.zeroPlz
  ld a, $DB
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [$C4EE]
  add $D0
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ret

DisplayMedarotImageForBattleStatus::
  ld a, [W_BattleStatusCursorPosition]
  ld hl, 3
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  ld [W_MedarotCurrentHeadPart], a

.checkLeftArmPart
  ld hl, $106
  add hl, de
  ld a, [hl]
  or a
  jr z, .noLeftArmPart
  ld hl, 4
  add hl, de
  ld a, [hl]
  ld [W_MedarotCurrentLeftArmPart], a
  jr .checkRightArmPart

.noLeftArmPart
  ld hl, 1
  add hl, de
  ld a, [hl]
  add $97
  ld [W_MedarotCurrentLeftArmPart], a

.checkRightArmPart
  ld hl, $126
  add hl, de
  ld a, [hl]
  or a
  jr z, .noRightArmPart
  ld hl, 5
  add hl, de
  ld a, [hl]
  ld [W_MedarotCurrentRightArmPart], a
  jr .checkLegPart

.noRightArmPart
  ld hl, 1
  add hl, de
  ld a, [hl]
  add $97
  ld [W_MedarotCurrentRightArmPart], a

.checkLegPart
  ld hl, $146
  add hl, de
  ld a, [hl]
  or a
  jr z, .noLegPart
  ld hl, 6
  add hl, de
  ld a, [hl]
  ld [W_MedarotCurrentLegPart], a
  jr .displayMedarot

.noLegPart
  ld hl, 1
  add hl, de
  ld a, [hl]
  add $97
  ld [W_MedarotCurrentLegPart], a

.displayMedarot
  ld hl, 7
  add hl, de
  ld a, [hl]
  ld [W_MedarotCurrentPalette], a
  call $34F5
  ld de, $8800
  call $34FA
  ld a, 6
  rst 8
  ld bc, $B02
  ld e, 3
  ld a, 0
  jp $3394

SetMedarotImagePaletteForBattleStatus::
  call GetMedarotImagePaletteForBattleStatus
  ld a, 3
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ret

GetMedarotImagePaletteForBattleStatus::
  ld a, [W_MedarotCurrentPalette]
  or a
  jr nz, .specifiedPalette

.headPartPalette
  ld a, [W_MedarotCurrentHeadPart]
  ld b, 0
  ld c, a
  ld hl, $40
  add hl, bc
  ld b, h
  ld c, l
  ret

.specifiedPalette
  dec a
  ld b, 0
  ld c, a
  ld hl, $370
  add hl, bc
  ld b, h
  ld c, l
  ret

DisplayMedarotSpritesForBattleStatus::
  xor a
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantB
  ld a, $21
  ld [$C0C0], a
  ld a, $44
  ld [$C0C1], a
  ld a, $40
  ld [$C0C3], a
  ld a, $58
  ld [$C0C4], a
  ld hl, $13A
  add hl, de
  ld a, [hl]
  sub $50
  ld [$C4EE], a
  sla a
  sla a
  add $12
  ld [$C0C2], a
  ld a, [$C4EE]
  add $2D
  call $34B7
  ld [$C0C5], a

.checkParticipantB
  ld a, 1
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantC
  ld a, $21
  ld [$C0E0], a
  ld a, $44
  ld [$C0E1], a
  ld a, $40
  ld [$C0E3], a
  ld a, $68
  ld [$C0E4], a
  ld hl, $13A
  add hl, de
  ld a, [hl]
  sub $50
  ld [$C4EE], a
  sla a
  sla a
  add $12
  ld [$C0E2], a
  ld a, [$C4EE]
  add $2D
  call $34B7
  ld [$C0E5], a

.checkParticipantC
  ld a, 2
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantD
  ld a, $21
  ld [$C100], a
  ld a, $44
  ld [$C101], a
  ld a, $40
  ld [$C103], a
  ld a, $78
  ld [$C104], a
  ld hl, $13A
  add hl, de
  ld a, [hl]
  sub $50
  ld [$C4EE], a
  sla a
  sla a
  add $12
  ld [$C102], a
  ld a, [$C4EE]
  add $2D
  call $34B7
  ld [$C105], a

.checkParticipantD
  ld a, 3
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantE
  ld a, 1
  ld [$C120], a
  ld a, $44
  ld [$C121], a
  ld a, $50
  ld [$C123], a
  ld a, $58
  ld [$C124], a
  ld hl, $13A
  add hl, de
  ld a, [hl]
  sub $50
  ld [$C4EE], a
  sla a
  sla a
  add $10
  ld [$C122], a
  ld a, [$C4EE]
  add $2D
  call $34B7
  ld [$C125], a

.checkParticipantE
  ld a, 4
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantF
  ld a, 1
  ld [$C140], a
  ld a, $44
  ld [$C141], a
  ld a, $50
  ld [$C143], a
  ld a, $68
  ld [$C144], a
  ld hl, $13A
  add hl, de
  ld a, [hl]
  sub $50
  ld [$C4EE], a
  sla a
  sla a
  add $10
  ld [$C142], a
  ld a, [$C4EE]
  add $2D
  call $34B7
  ld [$C145], a

.checkParticipantF
  ld a, 5
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  ret z
  ld a, 1
  ld [$C160], a
  ld a, $44
  ld [$C161], a
  ld a, $50
  ld [$C163], a
  ld a, $78
  ld [$C164], a
  ld hl, $13A
  add hl, de
  ld a, [hl]
  sub $50
  ld [$C4EE], a
  sla a
  sla a
  add $10
  ld [$C162], a
  ld a, [$C4EE]
  add $2D
  call $34B7
  ld [$C165], a
  ret

DisplayMedarotNamesForBattleStatus::
  xor a
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantB
  ld hl, $40
  add hl, de
  ld b, h
  ld c, l
  push bc
  ld a, 8
  call $25D2
  ld hl, $9980
  ld b, 0
  ld c, a
  add hl, bc
  pop bc
  call PutStringVariableLength

.checkParticipantB
  ld a, 1
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantC
  ld hl, $40
  add hl, de
  ld b, h
  ld c, l
  push bc
  ld a, 8
  call $25D2
  ld hl, $99C0
  ld b, 0
  ld c, a
  add hl, bc
  pop bc
  call PutStringVariableLength

.checkParticipantC
  ld a, 2
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantD
  ld hl, $40
  add hl, de
  ld b, h
  ld c, l
  push bc
  ld a, 8
  call $25D2
  ld hl, $9A00
  ld b, 0
  ld c, a
  add hl, bc
  pop bc
  call PutStringVariableLength

.checkParticipantD
  ld a, 3
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantE
  ld hl, $40
  add hl, de
  ld b, h
  ld c, l
  ld hl, $998C
  call PutStringVariableLength

.checkParticipantE
  ld a, 4
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  jr z, .checkParticipantF
  ld hl, $40
  add hl, de
  ld b, h
  ld c, l
  ld hl, $99CC
  call PutStringVariableLength

.checkParticipantF
  ld a, 5
  ld hl, 0
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  or a
  ret z
  ld hl, $40
  add hl, de
  ld b, h
  ld c, l
  ld hl, $9A0C
  jp PutStringVariableLength

PlaceCursorForBattleStatus::
  ld a, 1
  ld [$C0A0], a
  ld a, $44
  ld [$C0A1], a
  ld hl, .cursorPositionTable
  ld b, 0
  ld a, [W_BattleStatusCursorPosition]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$C0A3], a
  ld a, [hl]
  ld [$C0A4], a
  ld a, $11
  ld b, 0
  ld de, $C0A0
  call $33B2
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.cursorPositionTable
  db $40, $58
  db $40, $68
  db $40, $78
  db $50, $58
  db $50, $68
  db $50, $78

DirectionalInputHandlingForBattleStatus::
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputUp
  jr z, .upNotPressed
  ld a, 0
  ld [$C4EE], a
  jr .fireInputAction

.upNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputDown
  jr z, .downNotPressed
  ld a, 1
  ld [$C4EE], a
  jr .fireInputAction

.downNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputLeft
  jr z, .leftNotPressed
  ld a, 2
  ld [$C4EE], a
  jr .fireInputAction

.leftNotPressed
  ld a, [W_JPInput_TypematicBtns]
  and M_JPInputRight
  ret z
  ld a, 3
  ld [$C4EE], a

.fireInputAction
  ld a, 2
  call ScheduleSoundEffect
  ld hl, .table
  ld a, [$C4EE]
  rst $30
  ld b, 0
  ld a, [W_BattleStatusCursorPosition]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc

.destinationSlotExistsLoop
  push hl
  ld a, [hl]
  ld hl, $D000
  ld b, 0
  ld c, a
  ld a, 9
  call MultiplyBCByPowerOfTwoAndAddToHL
  ld a, [de]
  or a
  jr nz, .destinationSlotFound
  pop hl
  inc hl
  jr .destinationSlotExistsLoop

.destinationSlotFound
  pop hl
  ld a, [hl]
  ld [W_BattleStatusCursorPosition], a
  call PlaceCursorForBattleStatus
  call BattleStatusDisplayCurrentMedarot
  call SetMedarotImagePaletteForBattleStatus
  ret

.table
  dw .upTable
  dw .downTable
  dw .leftTable
  dw .rightTable

.upTable
  db 2,1,5,4,3,0,0,0
  db 0,2,5,4,3,1,0,0
  db 1,0,5,4,3,2,0,0
  db 5,4,2,1,0,3,0,0
  db 3,5,2,1,0,4,0,0
  db 4,3,2,1,0,5,0,0

.downTable
  db 1,2,3,4,5,0,0,0
  db 2,0,3,4,5,1,0,0
  db 0,1,3,4,5,2,0,0
  db 4,5,0,1,2,3,0,0
  db 5,3,0,1,2,4,0,0
  db 3,4,0,1,2,5,0,0

.rightTable
  db 3,1,4,2,5,0,0,0
  db 4,2,5,0,3,1,0,0
  db 5,0,3,1,4,2,0,0
  db 0,4,1,5,2,3,0,0
  db 1,5,2,3,0,4,0,0
  db 2,3,0,4,1,5,0,0

.leftTable
  db 3,1,4,2,5,0,0,0
  db 4,2,5,0,3,1,0,0
  db 5,0,3,1,4,2,0,0
  db 0,4,1,5,2,3,0,0
  db 1,5,2,3,0,4,0,0
  db 2,3,0,4,1,5,0,0

INCLUDE "game/src/common/constants.asm"

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
  call $692C ; Medarot image
  ret

DisplayMedalIconForBattleStatus::
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $11
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  ld [W_ListItemIndexForBuffering], a
  ld b, $B
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, $9823
  ld bc, W_ListItemBufferArea
  ld a, 5
  jp PutStringFixedLength

MapHeadPartNameForBattleStatus::
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $D0
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $9863
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapLeftArmPartNameForBattleStatus::
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $F0
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $98A3
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapRightArmPartNameForBattleStatus::
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $110
  ld b, 9
  call BufferParticipantDataForBattleStatus
  ld hl, $98E3
  ld bc, $C552
  ld a, 8
  jp PutStringFixedLength

MapLegPartNameForBattleStatus::
  ld a, [$DCCA]
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
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [$DCCA]
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
  ld a, [$DCCA]
  ld hl, $18
  ld b, 1
  call BufferParticipantDataForBattleStatus
  ld a, [$C552]
  push af
  ld a, [$DCCA]
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

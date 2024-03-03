INCLUDE "game/src/common/constants.asm"

SECTION "Part Trading Helper Functions 1", ROMX[$5C87], BANK[$11]
DrawPartImageForPartTrading::
  push bc
  call PartIndexToPartImageIndexForPartTrading
  ld a, [$C4F0]
  ld [W_ListItemIndexForBuffering], a
  ld a, b
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, b
  add b
  add b
  ld b, a
  ld a, [$C4EE]
  add b
  ld [$C4EE], a
  ld hl, $8800
  pop bc
  ld a, c
  or a
  jr z, .isPlayersPart
  ld hl, $8A00

.isPlayersPart
  ld a, [$C4EE]
  jp $34E1

.table
  db $13,$11,$11,$13
 
PartIndexToPartImageIndexForPartTrading::
  cp $33
  jr nc, .notFirstBank
  ld [$C4F0], a
  xor a
  ld [$C4EE], a
  ret

.notFirstBank
  cp $66
  jr nc, .notSecondBank
  sub $33
  ld [$C4F0], a
  ld a, 1
  ld [$C4EE], a
  ret
 
.notSecondBank
  sub $66
  ld [$C4F0], a
  ld a, 2
  ld [$C4EE], a
  ret

GetPartPaletteIndexForPartTrading::
  ld h, 0
  ld l, a
  ld bc, $40
  add hl, bc
  ld b, h
  ld c, l
  ret

MapPartImageForPartTrading::
  or a
  jr nz, .topRightPartImage
  ld a, c
  sla a
  sla a
  add b
  add $6A
  ld e, a
  ld bc, $107
  ld a, 2
  jp WrapDecompressTilemap0

.topRightPartImage
  ld a, c
  sla a
  sla a
  add b
  add $6A
  ld e, a
  ld bc, $C01
  ld a, 2
  jp WrapDecompressTilemap0

PartTradingBufferPartName::
  push hl
  ld [W_ListItemIndexForBuffering], a
  inc b
  ld c, 9
  ld a, 7
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop hl
  ld a, 6
  rst 8
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, 9
  jp memcpy

PartTradingMapPartName::
  push af
  ld a, 6
  rst 8
  ld b, h
  ld c, l
  pop af
  ld hl, $996A
  or a
  jr z, .isBottomPartName
  ld hl, $9822

.isBottomPartName
  push bc
  ld bc, $801
  push hl
  call $25E5
  pop hl
  pop bc
  push bc
  ld a, 8
  call GetTileBasedCenteringOffset
  ld b, 0
  ld c, a
  add hl, bc
  pop bc
  ld a, 8
  jp PutStringVariableLength

PartTradingAnimateDotPath::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, [W_MedalMenuWaitTimer]
  inc a
  ld [W_MedalMenuWaitTimer], a
  and 1
  jp z, .nextFrame
  ld a, [$C48D]
  or a
  jr nz, .skipSoundEffect
  ld a, $34
  call ScheduleSoundEffect

.skipSoundEffect
  ld a, 0
  ld [$C0A0], a
  ld [$C0C0], a
  ld [$C0E0], a
  ld [$C100], a
  ld [$C120], a
  ld [$C140], a
  ld a, [$C48D]
  ld hl, .dotPlacementTable
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  xor a
  ld [$C4EE], a
  ld [$C4EF], a

.topLeftDotsLoop
  ld a, [hli]
  or a
  jr z, .skipTopLeftDots
  ld [$C4F0], a
  push hl
  ld hl, $C0A0
  ld a, [$C4EF]
  ld b, 0
  ld c, a
  ld a, 5
  call MultiplyBCByTwoToThePowerOfAAndAddToHL
  ld a, 1
  ld [de], a
  ld a, $33
  ld hl, 1
  add hl, de
  ld [hl], a
  ld hl, .topLeftDotPlacementTable
  ld b, 0
  ld a, [$C4EE]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$C4F2], a
  ld a, [hli]
  ld [$C4F3], a
  ld a, [hl]
  ld b, a
  ld a, [$C4F0]
  dec a
  add b
  ld hl, 2
  add hl, de
  ld [hl], a
  ld hl, 3
  add hl, de
  ld a, [$C4F2]
  ld [hli], a
  ld a, [$C4F3]
  ld [hl], a
  ld hl, $C4EF
  inc [hl]
  pop hl

.skipTopLeftDots
  ld a, [$C4EE]
  inc a
  ld [$C4EE], a
  cp 8
  jr nz, .topLeftDotsLoop
  ld a, [$C48D]
  ld hl, .dotPlacementTable
  ld b, 0
  ld c, a
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  xor a
  ld [$C4EE], a
  ld a, 3
  ld [$C4EF], a

.bottomRightDotsLoop
  ld a, [hli]
  or a
  jr z, .skipBottomRightDots
  ld [$C4F0], a
  push hl
  ld hl, $C0A0
  ld a, [$C4EF]
  ld b, 0
  ld c, a
  ld a, 5
  call MultiplyBCByTwoToThePowerOfAAndAddToHL
  ld a, 1
  ld [de], a
  ld a, $33
  ld hl, 1
  add hl, de
  ld [hl], a
  ld hl, .bottomRightDotPlacementTable
  ld b, 0
  ld a, [$C4EE]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$C4F2], a
  ld a, [hli]
  ld [$C4F3], a
  ld a, [hl]
  ld b, a
  ld a, [$C4F0]
  dec a
  add b
  ld hl, 2
  add hl, de
  ld [hl], a
  ld hl, 3
  add hl, de
  ld a, [$C4F2]
  ld [hli], a
  ld a, [$C4F3]
  ld [hl], a
  ld hl, $C4EF
  inc [hl]
  pop hl

.skipBottomRightDots
  ld a, [$C4EE]
  inc a
  ld [$C4EE], a
  cp 8
  jr nz, .bottomRightDotsLoop
  ld a, [$C48D]
  inc a
  cp $C
  jr nz, .doNotLoopToStart
  xor a

.doNotLoopToStart
  ld [$C48D], a
  or a
  jr nz, .nextFrame
  ld a, [W_MedalMenuSkillBarAnimationStage]
  inc a
  ld [W_MedalMenuSkillBarAnimationStage], a
  cp 6
  jr z, .endAnimation

.nextFrame
  xor a
  ret

.endAnimation
  ld a, 1
  ret

.dotPlacementTable
  db 0,0,0,0,0,0,0,0
  db 1,0,0,0,0,0,0,0
  db 2,1,0,0,0,0,0,0
  db 3,2,1,0,0,0,0,0
  db 0,3,2,1,0,0,0,0
  db 0,0,3,2,1,0,0,0
  db 0,0,0,3,2,1,0,0
  db 0,0,0,0,3,2,1,0
  db 0,0,0,0,0,3,2,1
  db 0,0,0,0,0,0,3,2
  db 0,0,0,0,0,0,0,3
  db 0,0,0,0,0,0,0,0

.topLeftDotPlacementTable
  db $20,$28,$36,$00
  db $20,$20,$36,$00
  db $28,$20,$36,$00
  db $30,$20,$36,$00
  db $38,$20,$36,$00
  db $40,$20,$36,$00
  db $48,$20,$36,$00
  db $50,$20,$39,$00

.bottomRightDotPlacementTable
  db $78,$38,$36,$00
  db $78,$40,$36,$00
  db $70,$40,$36,$00
  db $68,$40,$36,$00
  db $60,$40,$36,$00
  db $58,$40,$36,$00
  db $50,$40,$36,$00
  db $48,$40,$3C,$00

PartTradingPlaceWhooshSprite::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0A0], a
  ld a, $33
  ld [$C0A1], a
  ld a, $68
  ld [$C0A3], a
  ld a, $10
  ld [$C0A4], a
  ld de, $C0A0
  ld b, 0
  ld a, $10
  call $33B2
  ld a, 1
  ld [$C0C0], a
  ld a, $33
  ld [$C0C1], a
  ld a, $10
  ld [$C0C3], a
  ld a, $40
  ld [$C0C4], a
  ld de, $C0C0
  ld b, 0
  ld a, $10
  jp $33B2

PartTradingPlaceGetSprite::
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [$C0A0], a
  ld a, $33
  ld [$C0A1], a
  ld a, $10
  ld [$C0A3], a
  ld a, $40
  ld [$C0A4], a
  ld de, $C0A0
  ld b, 0
  ld a, $11
  jp $33B2

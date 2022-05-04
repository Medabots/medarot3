INCLUDE "game/src/common/constants.asm"

SECTION "Encounter Opponent Buffering", WRAM0[$C5A0]
W_EncounterTerrainListItemIndex:: ds 1
W_EncounterOpponentListItemIndex:: ds 1
W_EncounterOpponentBufferArea:: ds $C

SECTION "Encounter Helper Functions 1", ROMX[$586E], BANK[$05]
SlideOverlayUpForEncounterScreen::
  xor a
  ld [$C4EE], a
  ld a, [W_NamingScreenEnteredTextLength]
  ld b, a
  ld a, [W_ShadowREG_WY]
  sub b
  jr c, .finishSliding
  ld [W_ShadowREG_WY], a
  call ClearSpritesForEncounterOverlay
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld a, [$C48D]
  ld hl, .table
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [W_NamingScreenEnteredTextLength], a
  ld a, [hl]
  ld [W_MedalMenuWaitTimer], a
  ld hl, $C48D
  inc [hl]
  ret

.finishSliding
  xor a
  ld [W_ShadowREG_WY], a
  ld a, 1
  ld [$C4EE], a
  ret

.table
  db 1,8
  db 2,7
  db 3,6
  db 4,5
  db 5,4
  db 6,3
  db 7,2
  db 8,$80
  
ClearSpritesForEncounterOverlay::
  ld de, $C0A0
  ld b, $1E
  ld a, [W_ShadowREG_WY]
  add $10
  ld c, a

.loop
  ld a, [de]
  or a
  jr z, .jpA
  ld hl, 4
  add hl, de
  ld a, [hl]
  cp c
  jr c, .jpA
  xor a
  ld [de], a

.jpA
  ld hl, $20
  add hl, de
  ld d, h
  ld e, l
  dec b
  jr nz, .loop
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

SlideOverlayDownForEncounterScreen::
  xor a
  ld [$C4EE], a
  ld a, [W_NamingScreenEnteredTextLength]
  ld b, a
  ld a, [W_ShadowREG_WY]
  add b
  cp $98
  jr nc, .finishSliding
  ld [W_ShadowREG_WY], a
  ld a, [W_MedalMenuWaitTimer]
  dec a
  ld [W_MedalMenuWaitTimer], a
  ret nz
  ld a, [$C48D]
  ld hl, SlideOverlayUpForEncounterScreen.table
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [W_NamingScreenEnteredTextLength], a
  ld a, [hl]
  ld [W_MedalMenuWaitTimer], a
  ld hl, $C48D
  inc [hl]
  ret

.finishSliding
  xor a
  call $1554
  ld a, 1
  ld [$C4EE], a
  ret

SECTION "Encounter Helper Functions 2", ROMX[$5972], BANK[$05]
BufferOpponentForEncounterScreen::
  ld b, $F
  ld c, $C
  ld a, [W_EncounterOpponentListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld hl, W_ListItemBufferArea
  ld de, W_EncounterOpponentBufferArea
  ld b, $C

.loop
  ld a, [hli]
  ld [de], a
  inc de
  dec b
  jr nz, .loop
  ret

SECTION "Encounter Helper Functions 3", ROMX[$5B32], BANK[$05]
LoadTerrainForEncounterScreen::
  ld hl, $310
  ld b, 0
  ld a, [W_EncounterTerrainListItemIndex]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld b, h
  ld c, l
  push bc
  ld a, 5
  call CGBLoadSingleBGPPaletteIndex
  pop bc
  inc bc
  ld a, 6
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
; Continues into LoadTerrainWithoutPaletteForEncounterScreen.

LoadTerrainWithoutPaletteForEncounterScreen::
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, $2A
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, $14
  ld hl, $8800
  call $34E1
  ld bc, $104
  ld e, $53
  ld a, 0
  call WrapDecompressTilemap0
  ld a, [W_EncounterTerrainListItemIndex]
  add $B0
  ld e, a
  ld bc, $104
  ld a, 0
  call WrapDecompressAttribmap0
  ret

LoadOpponentImageForEncounterScreen::
  ld b, 0
  ld a, [W_EncounterOpponentBufferArea]
  ld c, a
  ld h, b
  ld l, c
  sla c
  rl b
  add hl, bc
  ld b, h
  ld c, l
  ld hl, $380
  add hl, bc
  ld b, h
  ld c, l
  push bc
  ld a, 0
  call CGBLoadSingleBGPPaletteIndex
  pop bc
  inc bc
  push bc
  ld a, 1
  call CGBLoadSingleBGPPaletteIndex
  pop bc
  inc bc
  ld a, 2
  call CGBLoadSingleBGPPaletteIndex
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
; Continues into LoadOpponentImageWithoutPaletteForEncounterScreen.

LoadOpponentImageWithoutPaletteForEncounterScreen::
  ld a, [W_EncounterOpponentBufferArea]
  add $B0
  ld c, a
  ld b, 0
  call WrapLoadMaliasGraphics
  ld bc, $C02
  ld e, $16
  ld a, 1
  call WrapDecompressTilemap0
  ld bc, $C02
  ld a, [W_EncounterOpponentBufferArea]
  add $B0
  ld e, a
  ld a, 1
  call WrapDecompressAttribmap0
  ret

MapTextForEncounterScreen::
  ld b, $11
  ld c, 7
  ld a, [W_EncounterTerrainListItemIndex]
  ld [W_ListItemIndexForBuffering], a
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld bc, W_ListItemBufferArea
  ld a, 6
  call GetTileBasedCentringOffset
  ld hl, $9821
  ld b, 0
  ld c, a
  add hl, bc
  ld bc, W_ListItemBufferArea
  call PutStringVariableLength
  ld bc, W_EncounterOpponentBufferArea + 3
  ld a, 8
  call GetTileBasedCentringOffset
  ld hl, $996B
  ld b, 0
  ld c, a
  add hl, bc
  ld bc, W_EncounterOpponentBufferArea + 3
  jp PutStringVariableLength

SECTION "Encounter Helper Functions 4", ROMX[$609E], BANK[$05]
CalculateParticipantAddressForVictoryResultsScreen::
  ld hl, $D000
  ld b, 0
  ld c, a
  ld a, 9
  jp MultiplyBCByPowerOfTwoAndAddToHL

SECTION "Encounter Helper Functions 5", ROMX[$6675], BANK[$05]
PopulatedVictoryResultsScreen::
  xor a
  ld [$C4F2], a

.loop
  ld a, 6
  rst 8
  ld a, [$C4F2]
  call CalculateParticipantAddressForVictoryResultsScreen
  ld hl, $62
  add hl, de
  ld a, [hl]
  or a
  jr z, .participantSlotEmpty
  ld hl, $68
  add hl, de
  ld a, [hl]
  or a
  jr nz, .participantSlotEmpty
  ld hl, $11
  add hl, de
  ld a, [hl]
  push af
  ld a, 5
  rst 8
  pop af
  call $6311
  call DisplayMedalIconForVictoryResultsScreen
  call MapMedarotNameForVictoryResultsScreen
  call MapMedalLevelForVictoryResultsScreen
  call MapBasicSkillsForVictoryResultsScreen
  call MapMedaliaSkillsForVictoryResultsScreen
  call $6961
  call $6A03
  call $6AF5
  jr .nextParticipant

.participantSlotEmpty
  call DisplayEmptyMedalIconForVictoryResultsScreen
  call MapEmptyMedarotNameForVictoryResultsScreen
  call MapEmptyMedalLevelForVictoryResultsScreen
  call MapEmptyBasicSkillsForVictoryResultsScreen
  call MapEmptyMedaliaSkillsForVictoryResultsScreen

.nextParticipant
  ld a, [$C4F2]
  inc a
  ld [$C4F2], a
  cp 3
  jr nz, .loop
  call $35F0
  ret

DisplayMedalIconForVictoryResultsScreen::
  ld hl, $8B00
  ld a, [$C4F2]
  ld b, 0
  ld c, a
  ld a, 6
  push de
  call MultiplyBCByPowerOfTwoAndAddToHL
  pop de
  push hl
  ld hl, 1
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  pop hl
  ld a, $C
  push de
  call $34E1
  pop de
  ret

DisplayEmptyMedalIconForVictoryResultsScreen::
  ld hl, $8B00
  ld a, [$C4F2]
  ld b, 0
  ld c, a
  ld a, 6
  push de
  call MultiplyBCByPowerOfTwoAndAddToHL
  pop de
  push hl
  ld a, $1E
  ld [W_ListItemIndexForBuffering], a
  ld a, 4
  ld [W_ListItemInitialOffsetForBuffering], a
  pop hl
  ld a, $C
  push de
  call $34E1
  pop de
  ret

MapMedarotNameForVictoryResultsScreen::
  push de
  ld hl, .table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $30
  add hl, de
  ld b, h
  ld c, l
  pop hl
  call PutStringVariableLength
  pop de
  ret

.table
  dw $9864
  dw $9904
  dw $99A4

MapEmptyMedarotNameForVictoryResultsScreen::
  ld hl, MapMedarotNameForVictoryResultsScreen.table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld b, 8
  jp MapDashesForVictoryResultsScreen

MapDashesForVictoryResultsScreen::
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

MapMedalLevelForVictoryResultsScreen::
  push de
  ld hl, .table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, 9
  add hl, de
  ld a, [hl]
  pop hl
  call $351D
  pop de
  ret

.table
 dw $9870
 dw $9910
 dw $99B0

MapEmptyMedalLevelForVictoryResultsScreen::
  ld hl, MapMedalLevelForVictoryResultsScreen.table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld b, 3
  jp MapDashesForVictoryResultsScreen

MapBasicSkillsForVictoryResultsScreen::
  push de
  ld hl, .table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, h
  ld [$C4E4], a
  ld a, l
  ld [$C4E5], a
  xor a
  ld [$C4F4], a

.loop
  push de
  ld hl, $18
  add hl, de
  ld b, 0
  ld a, [$C4F4]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  inc hl
  ld a, [hli]
  push hl
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringVariableLength
  pop hl
  ld a, [hl]
  push af
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, 6
  add hl, bc
  ld b, 0
  pop af
  call $3504
  pop de
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, $20
  add hl, bc
  ld a, h
  ld [$C4E4], a
  ld a, l
  ld [$C4E5], a
  ld a, [$C4F4]
  inc a
  ld [$C4F4], a
  cp 3
  jr nz, .loop
  pop de
  ret

.table
  dw $9881
  dw $9921
  dw $99C1

MapEmptyBasicSkillsForVictoryResultsScreen::
  push de
  ld hl, MapBasicSkillsForVictoryResultsScreen.table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a

.extEntry
  ld a, h
  ld [$C4E4], a
  ld a, l
  ld [$C4E5], a
  xor a
  ld [$C4F4], a

.loop
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld b, 5
  call MapDashesForVictoryResultsScreen
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, 6
  add hl, bc
  ld b, 2
  call MapDashesForVictoryResultsScreen
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, $20
  add hl, bc
  ld a, h
  ld [$C4E4], a
  ld a, l
  ld [$C4E5], a
  ld a, [$C4F4]
  inc a
  ld [$C4F4], a
  cp 3
  jr nz, .loop
  pop de
  ret

MapMedaliaSkillsForVictoryResultsScreen::
  push de
  ld hl, .table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, h
  ld [$C4E4], a
  ld a, l
  ld [$C4E5], a
  xor a
  ld [$C4F4], a

.loop
  push de
  ld hl, $24
  add hl, de
  ld b, 0
  ld a, [$C4F4]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hl]
  cp $FF
  jr z, .medaliaSlotEmpty
  inc hl
  ld a, [hli]
  push hl
  ld [W_ListItemIndexForBuffering], a
  ld b, 6
  ld c, 6
  ld a, 0
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, W_ListItemBufferArea
  ld a, 5
  call PutStringVariableLength
  pop hl
  ld a, [hl]
  push af
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, 6
  add hl, bc
  ld b, 0
  pop af
  call $3504
  jr .nextSkill

.medaliaSlotEmpty
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld b, 5
  call MapDashesForVictoryResultsScreen
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, 6
  add hl, bc
  ld b, 2
  call MapDashesForVictoryResultsScreen

.nextSkill
  pop de
  ld a, [$C4E4]
  ld h, a
  ld a, [$C4E5]
  ld l, a
  ld bc, $20
  add hl, bc
  ld a, h
  ld [$C4E4], a
  ld a, l
  ld [$C4E5], a
  ld a, [$C4F4]
  inc a
  ld [$C4F4], a
  cp 3
  jp nz, .loop
  pop de
  ret

.table
  dw $988B
  dw $992B
  dw $99CB

MapEmptyMedaliaSkillsForVictoryResultsScreen::
  push de
  ld hl, MapMedaliaSkillsForVictoryResultsScreen.table
  ld b, 0
  ld a, [$C4F2]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  jp MapEmptyBasicSkillsForVictoryResultsScreen.extEntry


SECTION "Encounter Helper Functions 6", ROMX[$6c6b], BANK[$05]
MapNewMedaforceTextForVictoryResultsScreen::
  xor a
  ld [$c4f6], a
.loop
  ld a, [$c4f6]
  ld hl, $c7b7
  ld b, $00
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  or a
  jr z, .no_new_medaforce
  ld a, [hl]
  ld [$c4f4], a
  ld a, [$c4f6]
  ld hl, .table
  ld b, $00
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, $ea ; Opening quote
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  push hl
  ld a, [$c4f4]
  ld [W_ListItemIndexForBuffering], a
  ld b, $0a
  ld c, $09
  ld a, $06
  ld [W_ListItemInitialOffsetForBuffering], a
  call WrapBufferTextFromList
  pop hl
  ld bc, W_ListItemBufferArea
  call PutStringVariableLength
  ld de, .text
  ld b, $08
.new_medaforce_draw_loop
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc de
  dec b
  jr nz, .new_medaforce_draw_loop
.no_new_medaforce
  ld a, [$c4f6]
  inc a
  ld [$c4f6], a
  cp $03
  jr nz, .loop
  ret
.table
  dw $98c1
  dw $9961
  dw $9a01
.text
  db $EB,$62,$00,$3C,$99,$3B,$47,$B9 ; (Japanese) '(end quote) Learned Medaforce'
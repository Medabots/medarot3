INCLUDE "game/src/common/constants.asm"
INCLUDE "build/pointer_constants.asm"

W_BattleEncounterSubsubstateIndex EQU $C0A6

SECTION "Encounter State Machine 1", ROMX[$4D9D], BANK[$05]
BattleEncounterStateMachine::
  ld de, W_BattleEncounterSubsubstateIndex - 6
  ld hl, 6
  add hl, de
  ld a, [hl]
  ld hl, .table
  rst $30
  jp hl

.table
  dw BattleEncounterDoNothingState ; 00
  dw $507F ; 01 
  dw BattleEncounterPrepareFadeOutToWhiteState ; 02
  dw BattleEncounterDoFadeState ; 03
  dw $5099 ; 04
  dw BattleEncounterDoNothingState ; 05
  dw BattleEncounterDoNothingState ; 06
  dw BattleEncounterDoNothingState ; 07
  dw BattleEncounterDoNothingState ; 08
  dw BattleEncounterDoNothingState ; 09
  dw BattleEncounterDoNothingState ; 0A
  dw BattleEncounterDoNothingState ; 0B
  dw BattleEncounterDoNothingState ; 0C
  dw BattleEncounterDoNothingState ; 0D
  dw BattleEncounterDoNothingState ; 0E
  dw BattleEncounterDoNothingState ; 0F
  dw $50AB ; 10
  dw BattleEncounterDoNothingState ; 11
  dw BattleEncounterDoNothingState ; 12
  dw BattleEncounterDoNothingState ; 13
  dw BattleEncounterDoNothingState ; 14
  dw BattleEncounterDoNothingState ; 15
  dw BattleEncounterDoNothingState ; 16
  dw BattleEncounterDoNothingState ; 17
  dw $50D1 ; 18
  dw $50BE ; 19
  dw $50F7 ; 1A
  dw BattleEncounterDoNothingState ; 1B
  dw BattleEncounterDoNothingState ; 1C
  dw BattleEncounterDoNothingState ; 1D
  dw BattleEncounterDoNothingState ; 1E
  dw BattleEncounterDoNothingState ; 1F
  dw $50CE ; 20
  dw $50D1 ; 21
  dw $50E4 ; 22
  dw $50F7 ; 23
  dw BattleEncounterDoNothingState ; 24
  dw BattleEncounterDoNothingState ; 25
  dw BattleEncounterDoNothingState ; 26
  dw BattleEncounterDoNothingState ; 27
  dw BattleEncounterDoNothingState ; 28
  dw BattleEncounterDoNothingState ; 29
  dw BattleEncounterDoNothingState ; 2A
  dw BattleEncounterDoNothingState ; 2B
  dw BattleEncounterDoNothingState ; 2C
  dw BattleEncounterDoNothingState ; 2D
  dw BattleEncounterDoNothingState ; 2E
  dw BattleEncounterDoNothingState ; 2F
  dw $510E ; 30
  dw $511E ; 31
  dw $5130 ; 32
  dw $5154 ; 33
  dw $516E ; 34
  dw $51B8 ; 35
  dw $51CA ; 36
  dw $51DF ; 37
  dw $51EF ; 38
  dw BattleEncounterDrawingState ; 39
  dw BattleEncounterMappingState ; 3A
  dw BattleEncounterSlideOverlayAndDrawFontState ; 3B
  dw BattleEncounterMapTextState ; 3C
  dw $5293 ; 3D
  dw $4F7F ; 3E
  dw $52AE ; 3F
  dw $52C8 ; 40
  dw $4F7F ; 41
  dw $4F88 ; 42
  dw $52ED ; 43
  dw $4F7F ; 44
  dw $4F88 ; 45
  dw $4FB8 ; 46
  dw BattleEncounterPrepareFadeOutToWhiteState ; 47
  dw BattleEncounterDoFadeState ; 48
  dw $5007 ; 49
  dw $4F4F ; 4A
  dw BattleEncounterDoFadeState ; 4B
  dw $5047 ; 4C
  dw BattleEncounterPrepareFadeOutState ; 4D
  dw BattleEncounterDoFadeState ; 4E
  dw $5318 ; 4F
  dw BattleEncounterDoNothingState ; 50
  dw BattleEncounterDoNothingState ; 51
  dw BattleEncounterDoNothingState ; 52
  dw BattleEncounterDoNothingState ; 53
  dw BattleEncounterDoNothingState ; 54
  dw BattleEncounterDoNothingState ; 55
  dw BattleEncounterDoNothingState ; 56
  dw BattleEncounterDoNothingState ; 57
  dw BattleEncounterDoNothingState ; 58
  dw BattleEncounterDoNothingState ; 59
  dw BattleEncounterDoNothingState ; 5A
  dw BattleEncounterDoNothingState ; 5B
  dw BattleEncounterDoNothingState ; 5C
  dw BattleEncounterDoNothingState ; 5D
  dw BattleEncounterDoNothingState ; 5E
  dw BattleEncounterDoNothingState ; 5F
  dw $5338 ; 60
  dw BattleEncounterVictoryDrawingAndMappingState ; 61
  dw BattleEncounterVictoryPrepareFadeInState ; 62
  dw BattleEncounterDoFadeState ; 63
  dw BattleEncounterVictoryOrIsItState ; 64
  dw $5410 ; 65
  dw $542B ; 66
  dw $5454 ; 67
  dw BattleEncounterPrepareMedarotterOrPartFadeOutState ; 68
  dw BattleEncounterResultsDrawPrizeState ; 69
  dw $54F7 ; 6A
  dw BattleEncounterPrepareMedarotterOrPartFadeOutState ; 6B
  dw BattleEncounterResultsPrintPrizeMessageState ; 6C
  dw $4FA0 ; 6D
  dw $553C ; 6E
  dw $554C ; 6F
  dw $4FA0 ; 70
  dw $5566 ; 71
  dw $4FA0 ; 72
  dw $5587 ; 73
  dw $5590 ; 74
  dw BattleEncounterPrepareFadeOutState ; 75
  dw BattleEncounterDoFadeState ; 76
  dw BattleEncounterVictoryResultsDrawingAndMappingState ; 77
  dw $55E6 ; 78
  dw BattleEncounterDoFadeState ; 79
  dw $5606 ; 7A
  dw $5649 ; 7B
  dw $565B ; 7C
  dw $5680 ; 7D
  dw $4FB8 ; 7E
  dw BattleEncounterPrepareFadeOutToWhiteState ; 7F
  dw BattleEncounterDoFadeState ; 80
  dw $568B ; 81
  dw $56A5 ; 82
  dw $56CF ; 83
  dw $5703 ; 84
  dw BattleEncounterDoFadeState ; 85
  dw $572F ; 86
  dw $5745 ; 87
  dw BattleEncounterDoFadeState ; 88
  dw $575F ; 89
  dw BattleEncounterDoFadeState ; 8A
  dw $578F ; 8B
  dw $579A ; 8C
  dw BattleEncounterDoFadeState ; 8D
  dw $57BE ; 8E
  dw BattleEncounterDoNothingState ; 8F
  dw $4FB8 ; 90
  dw BattleEncounterPrepareFadeOutToWhiteState ; 91
  dw BattleEncounterDoFadeState ; 92
  dw $4FC0 ; 93
  dw $4FFB ; 94
  dw $5007 ; 95
  dw $4F4F ; 96
  dw BattleEncounterDoFadeState ; 97
  dw $5047 ; 98
  dw BattleEncounterDoNothingState ; 99
  dw $4FB8 ; 9A
  dw BattleEncounterPrepareFadeOutToWhiteState ; 9B
  dw BattleEncounterDoFadeState ; 9C
  dw $5079 ; 9D
  dw BattleEncounterDoNothingState ; 9E
  dw BattleEncounterDoNothingState ; 9F
  dw $57D5 ; A0
  dw $57E8 ; A1
  dw $57F8 ; A2
  dw $5454 ; A3
  dw BattleEncounterPrepareMedarotterOrPartFadeOutState ; A4
  dw BattleEncounterResultsDrawPrizeState ; A5
  dw $54F7 ; A6
  dw BattleEncounterPrepareMedarotterOrPartFadeOutState ; A7
  dw BattleEncounterResultsPrintLostPartMessageState ; A8
  dw $4FA0 ; A9
  dw $5830 ; AA
  dw $5840 ; AB
  dw $4FA0 ; AC
  dw $5853 ; AD
  dw BattleEncounterDoNothingState ; AE
  dw $5859 ; AF
  dw $4FB8 ; B0
  dw BattleEncounterPrepareFadeOutState ; B1
  dw BattleEncounterDoFadeState ; B2
  dw $585F ; B3
  dw BattleEncounterDoNothingState ; B4
  dw BattleEncounterDoNothingState ; B5
  dw BattleEncounterDoNothingState ; B6
  dw BattleEncounterDoNothingState ; B7
  dw BattleEncounterDoNothingState ; B8
  dw BattleEncounterDoNothingState ; B9
  dw BattleEncounterDoNothingState ; BA
  dw BattleEncounterDoNothingState ; BB
  dw BattleEncounterDoNothingState ; BC
  dw BattleEncounterDoNothingState ; BD
  dw BattleEncounterDoNothingState ; BE
  dw BattleEncounterDoNothingState ; BF

BattleEncounterDoNothingState::
  ret

BattleEncounterPrepareFadeOutState::
  ld hl, 1
  ld bc, 1
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp BattleEncounterIncSubsubstateIndex

BattleEncounterPrepareFadeOutToWhiteState::
  ld hl, 0
  ld bc, 0
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 2", ROMX[$4F66], BANK[$05]
BattleEncounterDoFadeState::
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp BattleEncounterIncSubsubstateIndex

BattleEncounterPrepareMedarotterOrPartFadeOutState::
  call $5DC9
  call $34E6
  ld a, [W_PaletteAnimRunning]
  or a
  ret nz
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 3", ROMX[$5201], BANK[$05]
BattleEncounterDrawingState::
  ld a, [W_BattleEncounterSubsubstateIndex]
  push af
  call $3413
  pop af
  ld [W_BattleEncounterSubsubstateIndex], a
  call $3475
  xor a
  ld [W_ShadowREG_SCX], a
  ld [W_ShadowREG_SCY], a
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $1B
  call WrapLoadMaliasGraphics
  ld bc, 6
  call $33C6
  ld bc, $2E
  call WrapCGBLoadBGPPaletteIndexes
  ld a, 1
  ld [W_CGBPaletteStagedBGP], a
  ld bc, 3
  call WrapCGBLoadOBPPaletteIndexes
  ld a, 1
  ld [W_CGBPaletteStagedOBP], a
  jp BattleEncounterIncSubsubstateIndex

BattleEncounterMappingState::
  ld bc, 0
  ld e, $52
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $52
  ld a, 0
  call WrapDecompressAttribmap0
  call LoadTerrainForEncounterScreen
  call LoadOpponentImageForEncounterScreen
  xor a
  ld [W_NamingScreenEnteredTextLength], a
  ld [$C48D], a
  ld a, 1
  ld [W_MedalMenuWaitTimer], a
  jp BattleEncounterIncSubsubstateIndex

BattleEncounterSlideOverlayAndDrawFontState::
  call SlideOverlayDownForEncounterScreen
  ld a, [$C4EE]
  or a
  ret z
  ld bc, 2
  call WrapLoadMaliasGraphics
  ld bc, 3
  call WrapLoadMaliasGraphics
  ld bc, 4
  call WrapLoadMaliasGraphics
  ld bc, 5
  call WrapLoadMaliasGraphics
  jp BattleEncounterIncSubsubstateIndex

BattleEncounterMapTextState::
  call MapTextForEncounterScreen
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 4", ROMX[$534C], BANK[$05]
BattleEncounterVictoryDrawingAndMappingState::
  ld bc, $13
  call WrapLoadMaliasGraphics
  ld bc, $1B
  call WrapLoadMaliasGraphics
  ld bc, 6
  call $33C6
  ld bc, 0
  ld e, $52
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $52
  ld a, 0
  call WrapDecompressAttribmap0
  call LoadTerrainWithoutPaletteForEncounterScreen
  call LoadOpponentImageWithoutPaletteForEncounterScreen
  call MapTextForEncounterScreen
  call $5E38
  call WrapInitiateMainScript
  ld a, [$C594]
  cp 1
  jr nz, .jpA
  call $5E02
  call $5E1D
  ld a, $39
  call $27BA
  jp BattleEncounterIncSubsubstateIndex

.jpA
  call $5E1D
  ld a, $3A
  call $27BA
  jp BattleEncounterIncSubsubstateIndex

BattleEncounterVictoryOrIsItState::
  ld a, [$C594]
  cp 1
  jp z, BattleEncounterIncSubsubstateIndex

; https://www.youtube.com/watch?v=M5QGkOGZubQ
  ld a, $A0
  ld [W_BattleEncounterSubsubstateIndex], a
  ret

BattleEncounterVictoryPrepareFadeInState::
  ld hl, $2E
  ld bc, 3
  ld d, $FF
  ld e, $FF
  ld a, $E
  call WrapSetupPalswapAnimation
  ld bc, 2
  ld a, 7
  call WrapRestageDestinationBGPalettesForFade
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
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  ld a, 6
  call WrapRestageDestinationBGPalettesForFade
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
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  push bc
  ld a, 1
  call WrapRestageDestinationBGPalettesForFade
  pop bc
  inc bc
  ld a, 2
  call WrapRestageDestinationBGPalettesForFade
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 5", ROMX[$5469], BANK[$05]
BattleEncounterResultsDrawPrizeState::
  call $5dc9
  ld bc, $809
  ld hl, $982b
  call $25e5
  ld bc, $809
  ld hl, $982b
  ld a, $02
  call $25ff
  ld bc, $801
  ld hl, $996b
  call $25e5
  ld a, [$c600]
  call $604a
  ld a, [$c4f0]
  ld [W_ListItemIndexForBuffering], a
  ld a, [$c601]
  ld hl, $54f3
  ld b, $00
  ld c, a
  add hl, bc
  ld a, [hl]
  ld [W_ListItemInitialOffsetForBuffering], a
  ld a, [$c601]
  ld b, a
  add b
  add b
  ld b, a
  ld a, [$c4ee]
  add b
  ld hl, $9200
  call $34e1
  ld a, [$c601]
  add $6a
  ld e, a
  ld bc, $b03
  ld a, $00
  call WrapDecompressTilemap0
  ld a, [$c601]
  inc a
  ld b, a
  ld c, $09
  ld a, [$c600]
  ld [W_ListItemIndexForBuffering], a
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  ld bc, W_ListItemBufferArea
  ld a, $08
  call GetTileBasedCentringOffset
  ld hl, $996b
  ld b, $00
  ld c, a
  add hl, bc
  ld bc, W_ListItemBufferArea
  ld a, $08
  call PutStringVariableLength
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 6", ROMX[$551D], BANK[$05]
BattleEncounterResultsPrintPrizeMessageState::
  call $5DC9
  ld a, $06
  rst $8
  ld hl, cBUF01
  ld a, [$c601]
  call WrapEncounterLoadRewardPartTypeText
  call WrapInitiateMainScript
  ld a, $00
  ld [W_ItemActionMessageIndex], a
  ld a, $98
  ld [$c496], a
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 7", ROMX[$55A0], BANK[$05]
BattleEncounterVictoryResultsDrawingAndMappingState::
  ld a, [W_BattleEncounterSubsubstateIndex]
  push af
  call $3413
  pop af
  ld [W_BattleEncounterSubsubstateIndex], a
  call $343B
  call $3475
  ld bc, $7A
  call WrapLoadMaliasGraphics
  ld bc, $10
  call $33C6
  ld bc, 0
  ld e, $6E
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, $102
  ld e, $6F
  ld a, 0
  call WrapDecompressTilemap0
  ld bc, 0
  ld e, $6E
  ld a, 0
  call WrapDecompressAttribmap0
  call $6675
  ld a, 2
  ld [$CF96], a
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 8", ROMX[$5811], BANK[$05]
BattleEncounterResultsPrintLostPartMessageState::
  call $5dc9
  ld a, $06
  rst $8
  ld hl, cBUF01
  ld a, [$c601]
  call WrapEncounterLoadRewardPartTypeText
  call WrapInitiateMainScript
  ld a, $00
  ld [W_ItemActionMessageIndex], a
  ld a, $99
  ld [$c496], a
  jp BattleEncounterIncSubsubstateIndex

SECTION "Encounter State Machine 9", ROMX[$5869], BANK[$05]
BattleEncounterIncSubsubstateIndex::
  ld hl, W_BattleEncounterSubsubstateIndex
  inc [hl]
  ret

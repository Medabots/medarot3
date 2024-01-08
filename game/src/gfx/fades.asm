INCLUDE "game/src/common/constants.asm"

SECTION "Fade Variables 1", WRAM0[$C470]
W_PaletteAnimWaitCounter:: ds 1
W_PaletteAnimSlowdown:: ds 1

SECTION "Fade Variables 2", WRAM0[$C473]
W_PaletteAnimStepController:: ds 1
W_PaletteAnimRunning:: ds 1

DEF W_FadePaletteForUnpacking EQU $C4EE ; This address is overutilised, so EQU is better.

SECTION "CGB Fade Palette Staging", WRAMX[$DB40], BANK[$3]
W_FadeStagingOldBGPaletteIndexes:: ds $10
W_FadeStagingOldOBPaletteIndexes:: ds $10
W_FadeStagingNewBGPaletteIndexes:: ds $10
W_FadeStagingNewOBPaletteIndexes:: ds $10
W_FadeStagingCurrentBGPaletteArea:: ds $40
W_FadeStagingCurrentOBPaletteArea:: ds $40
W_FadeStagingDestinationBGPaletteArea:: ds $40
W_FadeStagingDestinationOBPaletteArea:: ds $40

SECTION "Palette Fade Operations", ROM0[$0EE6]
SetupPalswapAnimation::
  push hl
  push bc
  ld hl, .fadeSpeedTable
  ld b, 0
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [W_PaletteAnimWaitCounter], a
  ld [W_PaletteAnimSlowdown], a
  ld a, [hl]
  ld [W_PaletteAnimStepController], a
  pop bc
  pop hl
  ld a, 3
  rst 8
  ld a, d
  ld [$DC81], a
  ld a, e
  ld [$DC82], a
  push bc
  push hl
  call CopyCurrentPaletteIndexesForFade
  pop hl
  pop bc
  call CopyNewPaletteIndexesForFade
  call $0FB1
  ld a, 1
  ld [W_PaletteAnimRunning], a
  ret

.fadeSpeedTable
  db $00,$1F
  db $00,$10
  db $00,$0F
  db $00,$0E
  db $00,$0D
  db $00,$0C
  db $00,$0B
  db $00,$0A
  db $00,$09
  db $00,$08
  db $00,$07
  db $00,$06
  db $00,$05
  db $00,$04
  db $00,$03
  db $00,$02
  db $00,$01
  db $01,$01
  db $02,$01
  db $03,$01
  db $04,$01
  db $05,$01
  db $06,$01
  db $07,$01
  db $08,$01
  db $09,$01
  db $0A,$01

CopyCurrentPaletteIndexesForFade::
  ld a, 3
  rst 8
  ld hl, W_CGBPaletteIndexesStagedBGP
  ld de, W_FadeStagingOldBGPaletteIndexes
  ld bc, $10
  call memcpy
  ld hl, W_CGBPaletteIndexesStagedOBP
  ld de, W_FadeStagingOldOBPaletteIndexes
  ld bc, $10
  jp memcpy

CopyNewPaletteIndexesForFade::
  push bc
  ld a, 3
  rst 8
  ld a, BANK(BGPPaletteGroupTable)
  rst $10
  sla l
  rl h
  sla l
  rl h
  sla l
  rl h
  sla l
  rl h
  ld bc, BGPPaletteGroupTable
  add hl, bc
  ld de, W_FadeStagingNewBGPaletteIndexes
  ld bc, $10
  call memcpy
  pop bc
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, OBPPaletteGroupTable
  add hl, bc
  ld de, W_FadeStagingNewOBPaletteIndexes
  ld bc, $10
  jp memcpy

StagePalettesForFade::
  ld a, 3
  rst 8
  ld a, BANK(BGPPaletteColorTable)
  rst $10
  xor a
  ld [W_FadePaletteForUnpacking], a

.unpackOldBGPalettesLoop
  ld hl, W_FadeStagingOldBGPaletteIndexes
  call CalculatePaletteIndexAddressForFadeStaging
  ld hl, BGPPaletteColorTable
  call CalculatePaletteAddressForFadeStaging
  push hl
  ld hl, W_FadeStagingCurrentBGPaletteArea
  ld b, 0
  ld a, [W_FadePaletteForUnpacking]
  ld c, a
  call CalculatePaletteAddressForFadeStaging
  ld d, h
  ld e, l
  pop hl
  ld bc, 8
  call memcpy
  ld a, [W_FadePaletteForUnpacking]
  inc a
  ld [W_FadePaletteForUnpacking], a
  cp 8
  jr nz, .unpackOldBGPalettesLoop

  xor a
  ld [W_FadePaletteForUnpacking], a

.unpackOldOBPalettesLoop
  ld hl, W_FadeStagingOldOBPaletteIndexes
  call CalculatePaletteIndexAddressForFadeStaging
  ld hl, OBPPaletteColorTable
  call CalculatePaletteAddressForFadeStaging
  push hl
  ld hl, W_FadeStagingCurrentOBPaletteArea
  ld b, 0
  ld a, [W_FadePaletteForUnpacking]
  ld c, a
  call CalculatePaletteAddressForFadeStaging
  ld d, h
  ld e, l
  pop hl
  ld bc, 8
  call memcpy
  ld a, [W_FadePaletteForUnpacking]
  inc a
  ld [W_FadePaletteForUnpacking], a
  cp 8
  jr nz, .unpackOldOBPalettesLoop

  xor a
  ld [W_FadePaletteForUnpacking], a

.unpackNewBGPalettesLoop
  ld hl, W_FadeStagingNewBGPaletteIndexes
  call CalculatePaletteIndexAddressForFadeStaging
  ld hl, BGPPaletteColorTable
  call CalculatePaletteAddressForFadeStaging
  push hl
  ld hl, W_FadeStagingDestinationBGPaletteArea
  ld b, 0
  ld a, [W_FadePaletteForUnpacking]
  ld c, a
  call CalculatePaletteAddressForFadeStaging
  ld d, h
  ld e, l
  pop hl
  ld bc, 8
  call memcpy
  ld a, [W_FadePaletteForUnpacking]
  inc a
  ld [W_FadePaletteForUnpacking], a
  cp 8
  jr nz, .unpackNewBGPalettesLoop

  xor a
  ld [W_FadePaletteForUnpacking], a

.unpackNewOBPalettesLoop
  ld hl, W_FadeStagingNewOBPaletteIndexes
  call CalculatePaletteIndexAddressForFadeStaging
  ld hl, OBPPaletteColorTable
  call CalculatePaletteAddressForFadeStaging
  push hl
  ld hl, W_FadeStagingDestinationOBPaletteArea
  ld b, 0
  ld a,[W_FadePaletteForUnpacking]
  ld c, a
  call CalculatePaletteAddressForFadeStaging
  ld d, h
  ld e, l
  pop hl
  ld bc, 8
  call memcpy
  ld a, [W_FadePaletteForUnpacking]
  inc a
  ld [W_FadePaletteForUnpacking], a
  cp 8
  jr nz, .unpackNewOBPalettesLoop
  ret

CalculatePaletteIndexAddressForFadeStaging::
  ld b, 0
  ld a, [W_FadePaletteForUnpacking]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld c, [hl]
  ld b, a
  ret

CalculatePaletteAddressForFadeStaging::
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ret

RestageDestinationBGPalettesForFade::
  push hl
  push bc
  push de
  push af
  ld e, a
  ld d, 0
  sla e
  rl d
  ld a, 3
  rst 8
  ld a, BANK(BGPPaletteColorTable)
  rst $10
  ld hl, W_FadeStagingNewBGPaletteIndexes
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld hl, BGPPaletteColorTable
  call CalculatePaletteAddressForFadeStaging
  pop af
  push hl
  ld hl, W_FadeStagingDestinationBGPaletteArea
  ld b, 0
  ld c, a
  call CalculatePaletteAddressForFadeStaging
  ld d, h
  ld e, l
  pop hl
  ld bc, 8
  call memcpy
  pop de
  pop bc
  pop hl
  ret

RestageDestinationOBPalettesForFade::
  push hl
  push bc
  push de
  push af
  ld e, a
  ld d, 0
  sla e
  rl d
  ld a, 3
  rst 8
  ld a, BANK(OBPPaletteColorTable)
  rst $10
  ld hl,W_FadeStagingNewOBPaletteIndexes
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  ld hl, OBPPaletteColorTable
  call CalculatePaletteAddressForFadeStaging
  pop af
  push hl
  ld hl, W_FadeStagingDestinationOBPaletteArea
  ld b, 0
  ld c, a
  call CalculatePaletteAddressForFadeStaging
  ld d, h
  ld e, l
  pop hl
  ld bc, 8
  call memcpy
  pop de
  pop bc
  pop hl
  ret

CGBCommitFadePalettesBGP::
  ld a, [W_PaletteAnimRunning]
  or a
  ret z
  ld a, 3
  ldh [H_RegSVBK], a
  ld hl, W_FadeStagingCurrentBGPaletteArea
  ld d, $20
  ld a, $80
  ldh [H_RegBGPI], a

.loop
  ld a, [hli]
  ld b, a
  ld a, [hli]
  ld c, a
  rst $20
  ld a, b
  ldh [H_RegBGPD], a
  ld a, c
  ldh [H_RegBGPD], a
  dec d
  jr nz, .loop
  ld a, [W_CurrentWRAMBank]
  ldh [H_RegSVBK], a
  ret

CGBCommitFadePalettesOBP::
  ld a, [W_PaletteAnimRunning]
  or a
  ret z
  ld a, 3
  ldh [H_RegSVBK], a
  ld hl, W_FadeStagingCurrentOBPaletteArea
  ld d, $20
  ld a, $80
  ldh [H_RegOBPI], a

.loop
  ld a, [hli]
  ld b, a
  ld a, [hli]
  ld c, a
  rst $20
  ld a, b
  ldh [H_RegOBPD], a
  ld a, c
  ldh [H_RegOBPD], a
  dec d
  jr nz, .loop
  ld a, [W_CurrentWRAMBank]
  ldh [H_RegSVBK], a
  ret

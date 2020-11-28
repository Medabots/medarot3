INCLUDE "game/src/common/constants.asm"

SECTION "CGB Palette Management Staging", WRAMX[$DB80], BANK[$3]
W_PostFadeStagingBGPaletteArea:: ds $40
W_PostFadeStagingOBPaletteArea:: ds $40
W_PreFadeStagingBGPaletteArea:: ds $40
W_PreFadeStagingOBPaletteArea:: ds $40

SECTION "CGB Palette Management Vars 1", WRAM0[$CD00]
W_CGBPaletteStagedBGP:: ds 1
W_CGBPaletteBGPGroupIndex:: ds 2
W_CGBPaletteIndexesStagedBGP:: ds $10
W_CGBPaletteStagedOBP:: ds 1
W_CGBPaletteOBPGroupIndex:: ds 2
W_CGBPaletteIndexesStagedOBP:: ds $10

SECTION "CGB Palette management", ROM0[$0C84]
CGBCommitPalettes::
  ld a, [W_CGBPaletteStagedBGP]
  or a
  jr z, .noCommitPalette
  call CGBCommitPalettesBGP
.noCommitPalette
  ld a, [W_CGBPaletteStagedOBP]
  or a
  ret z
  jp CGBCommitPalettesOBP

CGBCommitPalettesBGP::
  ld a, BANK(BGPPaletteColorTable)
  ld [X_MBC5ROMBankLow], a
  
  ld hl, W_CGBPaletteIndexesStagedBGP
  ld c, 8
  ld a, $80
  ld [H_RegBGPI], a

.indexLoop
  ld a, [hli]
  ld d, a
  ld a, [hli]
  ld e, a
  push hl
  ld hl, BGPPaletteColorTable
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  add hl, de
  ld b, 8

.loop
  ld a, [hli]
  push af
  rst $20
  pop af
  ld [H_RegBGPD], a
  dec b
  jr nz, .loop

  pop hl
  dec c
  jr nz, .indexLoop

  xor a
  ld [W_CGBPaletteStagedBGP], a
  ld a, [W_CurrentBank]
  ld [X_MBC5ROMBankLow], a
  ret

CGBLoadBGPPaletteIndexes::
  push hl
  push bc
  push de
  ld a, b
  ld [W_CGBPaletteBGPGroupIndex], a
  ld a, c
  ld [W_CGBPaletteBGPGroupIndex + 1], a
  ld a, BANK(BGPPaletteGroupTable)
  rst $10
  ld hl, BGPPaletteGroupTable
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld b, $10
  ld de, W_CGBPaletteIndexesStagedBGP

.loop  
  ld a, [hli]
  ld [de], a
  inc de
  dec b
  jr nz, .loop
  pop de
  pop bc
  pop hl
  ret

CGBLoadSingleBGPPaletteIndex::
  push hl
  push bc
  push de
  ld e, a
  ld d, 0
  sla e
  rl d
  ld hl, W_CGBPaletteIndexesStagedBGP
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  pop de
  pop bc
  pop hl
  ret

CGBCommitPalettesOBP::
  ld a, BANK(OBPPaletteColorTable)
  ld [X_MBC5ROMBankLow], a
  
  ld hl, W_CGBPaletteIndexesStagedOBP
  ld c, 8
  ld a, $80
  ld [H_RegOBPI], a

.indexLoop
  ld a, [hli]
  ld d, a
  ld a, [hli]
  ld e, a
  push hl
  ld hl, OBPPaletteColorTable
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  add hl, de
  ld b, 8

.loop
  ld a, [hli]
  push af
  rst $20
  pop af
  ld [H_RegOBPD], a
  dec b
  jr nz, .loop

  pop hl
  dec c
  jr nz, .indexLoop

  xor a
  ld [W_CGBPaletteStagedOBP], a
  ld a, [W_CurrentBank]
  ld [X_MBC5ROMBankLow], a
  ret

CGBLoadOBPPaletteIndexes::
  push hl
  push bc
  push de
  ld a, b
  ld [W_CGBPaletteOBPGroupIndex], a
  ld a, c
  ld [W_CGBPaletteOBPGroupIndex + 1], a
  ld a, BANK(OBPPaletteGroupTable)
  rst $10
  ld hl, OBPPaletteGroupTable
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld b, $10
  ld de, W_CGBPaletteIndexesStagedOBP

.loop  
  ld a, [hli]
  ld [de], a
  inc de
  dec b
  jr nz, .loop
  pop de
  pop bc
  pop hl
  ret

CGBLoadSingleOBPPaletteIndex::
  push hl
  push bc
  push de
  ld e, a
  ld d, 0
  sla e
  rl d
  ld hl, W_CGBPaletteIndexesStagedOBP
  add hl, de
  ld a, b
  ld [hli], a
  ld a, c
  ld [hl], a
  pop de
  pop bc
  pop hl
  ret

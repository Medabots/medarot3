INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Credits Variables for Patch", WRAM0[$C722]
W_CreditsCurrentPagePointerAddress:: ds 2
W_CreditsIsLastPage:: ds 1
W_CreditsOffsetMode:: ds 1

W_CreditsLineAAddress:: ds 2
W_CreditsLineAAnimateInOut:: ds 1
W_CreditsLineAMidTileDestination:: ds 1
W_CreditsLineATextOffset:: ds 1
W_CreditsLineATextLength:: ds 1
W_CreditsLineAStateIndex:: ds 1
W_CreditsLineAProgress:: ds 1
W_CreditsLineATextProgress:: ds 1
W_CreditsLineADestination:: ds 1

W_CreditsLineBAddress:: ds 2
W_CreditsLineBAnimateInOut:: ds 1
W_CreditsLineBMidTileDestination:: ds 1
W_CreditsLineBTextOffset:: ds 1
W_CreditsLineBTextLength:: ds 1
W_CreditsLineBStateIndex:: ds 1
W_CreditsLineBProgress:: ds 1
W_CreditsLineBTextProgress:: ds 1
W_CreditsLineBDestination:: ds 1

W_CreditsLineCAddress:: ds 2
W_CreditsLineCAnimateInOut:: ds 1
W_CreditsLineCMidTileDestination:: ds 1
W_CreditsLineCTextOffset:: ds 1
W_CreditsLineCTextLength:: ds 1
W_CreditsLineCStateIndex:: ds 1
W_CreditsLineCProgress:: ds 1
W_CreditsLineCTextProgress:: ds 1
W_CreditsLineCDestination:: ds 1

W_CreditsLineDAddress:: ds 2
W_CreditsLineDAnimateInOut:: ds 1
W_CreditsLineDMidTileDestination:: ds 1
W_CreditsLineDTextOffset:: ds 1
W_CreditsLineDTextLength:: ds 1
W_CreditsLineDStateIndex:: ds 1
W_CreditsLineDProgress:: ds 1
W_CreditsLineDTextProgress:: ds 1
W_CreditsLineDDestination:: ds 1

W_CreditsLineEAddress:: ds 2
W_CreditsLineEAnimateInOut:: ds 1
W_CreditsLineEMidTileDestination:: ds 1
W_CreditsLineETextOffset:: ds 1
W_CreditsLineETextLength:: ds 1
W_CreditsLineEStateIndex:: ds 1
W_CreditsLineEProgress:: ds 1
W_CreditsLineETextProgress:: ds 1
W_CreditsLineEDestination:: ds 1

W_CreditsLineFAddress:: ds 2
W_CreditsLineFAnimateInOut:: ds 1
W_CreditsLineFMidTileDestination:: ds 1
W_CreditsLineFTextOffset:: ds 1
W_CreditsLineFTextLength:: ds 1
W_CreditsLineFStateIndex:: ds 1
W_CreditsLineFProgress:: ds 1
W_CreditsLineFTextProgress:: ds 1
W_CreditsLineFDestination:: ds 1

W_CreditsLineGAddress:: ds 2
W_CreditsLineGAnimateInOut:: ds 1
W_CreditsLineGMidTileDestination:: ds 1
W_CreditsLineGTextOffset:: ds 1
W_CreditsLineGTextLength:: ds 1
W_CreditsLineGStateIndex:: ds 1
W_CreditsLineGProgress:: ds 1
W_CreditsLineGTextProgress:: ds 1
W_CreditsLineGDestination:: ds 1

W_CreditsCurrentLineAddress:: ds 2
W_CreditsCurrentLineAnimateInOut:: ds 1
W_CreditsCurrentLineMidTileDestination:: ds 1
W_CreditsCurrentLineTextOffset:: ds 1
W_CreditsCurrentLineTextLength:: ds 1
W_CreditsCurrentLineStateIndex:: ds 1
W_CreditsCurrentLineProgress:: ds 1
W_CreditsCurrentLineTextProgress:: ds 1
W_CreditsCurrentLineDestination:: ds 1

W_CreditsCurrentLineDrawingAddressHighByte:: ds 1
W_CreditsCurrentLineNumber:: ds 1

SECTION "Credits Player Name Buffer for Patch", WRAM0[$C794]
W_CreditsPlayerName:: ds $C

SECTION "Credits Helper Functions 1", ROMX[$43E8], BANK[$16]
CreditsAnimateSidebarPalette::
  ld a, [W_PaletteAnimRunning]
  or a
  jr z, .initiateAnimation
  call $34E6
  ret

.initiateAnimation
  ld a, [$C48D]
  inc a
  and 3
  ld [$C48D], a
  ld hl, .table
  ld b, 0
  ld c, a
  add hl, bc
  ld a, [hl]
  ld h, 0
  ld l, a
  ld bc, $3D
  add hl, bc
  ld bc, 0
  ld d, 2
  ld e, 0
  ld a, $14
  call WrapSetupPalswapAnimation
  ret

.table
  db 0,1,0,2

CreditClearDrawingRegion::
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb

  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ei
  dec c
  jr nz, CreditClearDrawingRegion
  ret

CreditDrawUnderline::
  ld bc, $1100
  ld de, .table
  ld hl, $92F0 

.loop
  ld a, [de]
  ld c, a
  di

.wfbA
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbA

  ld a, c
  ld [hli], a
  ld [hli], a
  xor a
  ld [hli], a
  ld [hli], a
  ei
  ld c, 3
  call CreditClearDrawingRegion
  inc de
  dec b
  jr nz, .loop
  ret

.table
  db 0,1,3,7,$F,$1F,$3F,$7F,$FF,$FE,$FC,$F8,$F0,$E0,$C0,$80,0

CreditLineAnimate::
  ld a, c
  ld [W_CreditsCurrentLineNumber], a
  add $88
  ld [W_CreditsCurrentLineDrawingAddressHighByte], a
  push hl
  ld de, W_CreditsCurrentLineAddress
  call CreditLineCopyConfig
  call CreditLineNewAnimationStateMachine
  ld hl, W_CreditsCurrentLineAddress
  pop de
  ; Continues into CreditLineCopyConfig.

CreditLineCopyConfig::
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ld a, [hli]
  ld [de], a
  inc de
  ret

CreditPageAnimate::
  ld hl, W_CreditsLineAAddress
  ld c, 0
  call CreditLineAnimate
  ld hl, W_CreditsLineBAddress
  ld c, 1
  call CreditLineAnimate
  ld hl, W_CreditsLineCAddress
  ld c, 2
  call CreditLineAnimate
  ld hl, W_CreditsLineDAddress
  ld c, 3
  call CreditLineAnimate
  ld hl, W_CreditsLineEAddress
  ld c, 4
  call CreditLineAnimate
  ld hl, W_CreditsLineFAddress
  ld c, 5
  call CreditLineAnimate
  ld hl, W_CreditsLineGAddress
  ld c, 6
  call CreditLineAnimate
  ld hl, W_CreditsLineAStateIndex
  ld de, $A
  ld a, [hl]
  ld c, 4
  cp c
  jr z, .isMidPage
  ld c, 9

.isMidPage
  cp c
  ret nz
  add hl, de
  ld a, [hl]
  cp c
  ret nz
  add hl, de
  ld a, [hl]
  cp c
  ret nz
  add hl, de
  ld a, [hl]
  cp c
  ret nz
  add hl, de
  ld a, [hl]
  cp c
  ret nz
  add hl, de
  ld a, [hl]
  cp c
  ret nz
  add hl, de
  ld a, [hl]
  cp c
  ret nz
  ld a, c
  cp 9
  jr z, .isEndOfPage
  inc a
  ld [W_CreditsLineAStateIndex], a
  ld [W_CreditsLineBStateIndex], a
  ld [W_CreditsLineCStateIndex], a
  ld [W_CreditsLineDStateIndex], a
  ld [W_CreditsLineEStateIndex], a
  ld [W_CreditsLineFStateIndex], a
  ld [W_CreditsLineGStateIndex], a
  ld c, $11
  ld a, $50
  ld [W_CreditsLineAProgress], a
  add c
  ld [W_CreditsLineBProgress], a
  add c
  ld [W_CreditsLineCProgress], a
  add c
  ld [W_CreditsLineDProgress], a
  add c
  ld [W_CreditsLineEProgress], a
  add c
  ld [W_CreditsLineFProgress], a
  add c
  ld [W_CreditsLineGProgress], a
  ret

.isEndOfPage
  ld a, [W_CreditsIsLastPage]
  or a
  ret nz
  ld hl, W_CreditsCurrentPagePointerAddress
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $E
  add hl, de
  ld de, W_CreditsCurrentPagePointerAddress
  ld a, h
  ld [de], a
  ld a, l
  ld [de], a
  ; Continues into CreditInitPage.

CreditInitPage::
  ld hl, W_CreditsLineAAddress

.extEntry
  ld bc, $700
  ld a, [W_CreditsCurrentPagePointerAddress + 1]
  ld d, a
  ld a, [W_CreditsCurrentPagePointerAddress]
  ld e, a

.loop
  ld a, [de]
  ld [hli], a
  inc de
  ld a, [de]
  ld [hli], a

  push bc
  push de
  push hl
  ld h, a
  dec de
  ld a, [de]
  ld l, a
  inc de
  ld bc, 0
  ld a, [hli]
  ld d, a
  ld a, [hli]
  ld e, a
  ld a, [hli]
  cp $CB
  jr nz, .notempty
  xor a
  ld d, 0
  jr .textfits

.notempty
  cp $CC
  jr nz, .notlastpageindicator
  ld [W_CreditsIsLastPage], a
  xor a
  ld d, 0
  jr .textfits

.notlastpageindicator
  cp $CD
  jr nz, .countloop
  ld [W_CreditsOffsetMode], a
  xor a
  ld d, 0
  jr .textfits

.countloop
  push hl
  ld h, VWFDrawLetterTable >> 8
  ld l, a
  ld a, BANK(VWFDrawLetterTable)
  call VWFMeasureCharacterForCredits
  ld a, h
  add b
  ld b, a
  pop hl
  inc c
  ld a, [hli]
  cp $CB
  jr z, .exitcountloop
  jr .countloop

.exitcountloop
  ld a, $80
  sub b
  jr nc, .textfits
  xor a

.textfits
  pop hl
  ld [hl], d
  inc hl
  ld [hl], e
  inc hl
  srl a
  ld [hli], a
  ld [hl], c
  inc hl
  pop de
  pop bc
  inc de

  xor a
  ld [hli], a
  ld [hl], c
  inc hl
  ld [hli], a
  ld [hli], a
  ld a, c
  add $11
  ld c, a
  dec b
  jr nz, .loop

  ; We are using the MidTileDestination variables and Current Line variable block for temporarily storing pallete info, since we won't need pallete info outside of CreditInitPage.
  ld hl, W_CreditsCurrentLineAddress
  ld a, [W_CreditsLineAMidTileDestination]
  ld [hli], a
  ld a, [W_CreditsLineBMidTileDestination]
  ld [hli], a
  ld a, [W_CreditsLineCMidTileDestination]
  ld [hli], a
  ld a, [W_CreditsLineDMidTileDestination]
  ld [hli], a
  ld a, [W_CreditsLineEMidTileDestination]
  ld [hli], a
  ld a, [W_CreditsLineFMidTileDestination]
  ld [hli], a
  ld a, [W_CreditsLineGMidTileDestination]
  ld [hli], a

  ld bc, $8007
  ld hl, $9863
  ld d, 0

.looplines
  ld a, d
  cp 2
  jr nz, .noOffsetRequired
  ld a, [W_CreditsOffsetMode]
  or a
  jr z, .noOffsetRequired
  ld a, $10
  add b
  ld b, a
  jr .mapLineRow

.noOffsetRequired
  ld e, 8

.mapTextLoop
  di

.wfbC
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbC

  ld a, b
  ld [hli], a
  inc a
  ld [hli], a
  ei
  inc a
  ld b, a

  dec e
  jr nz, .mapTextLoop
  call CreditsPaletteMappingHelper

.mapLineRow
  ld e, 4

.loopUnderline
  di

.wfbA
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbA

  ld a, $2F
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ei

  dec e
  jr nz, .loopUnderline

  di

.wfbB
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbB

  ld [hl], $2F
  ei
  
  call CreditsPaletteMappingHelper
  dec c
  jr nz, .looplines
  
  ld a, [W_CreditsOffsetMode]
  or a
  jr z, .noOffsetAdjustment
  
  ld e, 5

.loopClear
  di

.wfbD
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbD

  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ei

  dec e
  jr nz, .loopClear
  
.noOffsetAdjustment
  xor a
  inc a
  ret

CreditsInit::
  ld a, $11
  ld hl, W_CreditsPlayerName
  ld de, W_PlayerName
  ld [hli], a
  ld a, 7
  ld [hli], a
  ld b, 8

.playerNameCopyLoop
  ld a, [de]
  inc e
  ld [hli], a
  dec b
  jr nz, .playerNameCopyLoop

  ld a, $CB
  ld [hli], a
  call CreditDrawUnderline
  ld c, 0
  ld hl, $8800
  call CreditClearDrawingRegion
  call CreditClearDrawingRegion
  ld hl, W_CreditsCurrentPagePointerAddress
  ld a, (PtrListCredits & $FF)
  ld [hli], a
  ld a, (PtrListCredits >> 8)
  ld [hli], a
  xor a
  ld [hli], a
  ld [hli], a
  jp CreditInitPage.extEntry

CreditsPaletteMappingHelper::
  ld a, $F0
  add l
  ld l, a
  push de
  VRAMSwitchToBank1
  ld de, W_CreditsCurrentLineAddress
  ld a, e
  add 7
  sub c
  ld e, a
  ld a, [de]
  ld d, a
  ld e, 4

.loop
  di

.wfbA
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbA

  ld a, d
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ei

  dec e
  jr nz, .loop

  di

.wfbB
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbB

  ld [hl], d
  ei
  
  VRAMSwitchToBank0

  pop de
  ld a, $10
  add l
  jr nc, .noIncH
  inc h

.noIncH
  ld l, a
  inc d
  ret

CreditLineAnimationCommon::
  ld hl, CreditOffsetLineMappingHighAddressTable
  ld a, [W_CreditsOffsetMode]
  or a
  jr nz, .isOffset
  ld l, CreditLineMappingHighAddressTable & $FF

.isOffset
  ld a, [W_CreditsCurrentLineNumber]
  add l
  ld l, a
  ld h, [hl]
  ld a, [W_CreditsCurrentLineProgress]
  ld l, a
  
  di

.wfbA
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfbA

  ld b, [hl]
  ei
  ld a, [W_CreditsCurrentLineDestination]
  cp l
  ret

CreditLineAnimationMapTile::
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb

  ld [hl], b
  ei
  ret

CreditLineCopyTextFromBuffer::
  ld a, [W_CreditsCurrentLineDrawingAddressHighByte]
  ld h, a
  ld de, $8F00
  ld l, e
  ld b, $80

.copyLoop
  di

.wfb
  ldh a, [H_LCDStat]
  and 2
  jr nz, .wfb
  
  ld a, [de]
  ld [hli], a
  ld [hli], a
  ei
  inc e
  inc de
  dec b
  jr nz, .copyLoop
  ret

CreditLineDrawTextInBuffer::
  ld c, $40
  ld hl, $8F00
  call CreditClearDrawingRegion
  
  ld a, [W_CreditsCurrentLineTextOffset]
  ld [W_VWFInitialPaddingOffset], a
  ld a, $10
  ld [W_VWFTileLength], a
  ld h, $F0
  ld a, BANK(VWFDrawStringInitContinued)
  call VWFDrawStringInitForCredits
  ld a, [W_VWFDrawnAreaLength]
  ld e, 0

.loop
  cp 8
  jr c, .exitLoop
  sub 8
  inc e
  jr .loop

.exitLoop
  ld [W_VWFLetterShift], a
  ld a, e
  ld [W_VWFTilesDrawn], a
  xor a
  ld [W_VWFInitialPaddingOffset], a
  
  ld hl, W_CreditsCurrentLineAddress
  ld a, [hli]
  ld h, [hl]
  ld l, a
  inc hl
  inc hl
  
  ld a, [W_CreditsCurrentLineTextProgress]
  srl a
  
  or a
  ret z
  dec a
  jr z, .stageB
  dec a
  jr z, .stageC
  dec a
  jr z, .stageD
  dec a

.stageE
  ld b, a
  xor a
  ld c, a
  ld [W_VWFCurrentFont], a

.loopCharacters
  push bc
  call CreditLineDrawCharacterInBuffer
  pop bc
  ld a, c
  inc c
  cp b
  jr nz, .loopCharacters

.stageD
  ld a, 5
  ld [W_VWFCurrentFont], a
  call CreditLineDrawCharacterInBuffer

.stageC
  ld a, 6
  ld [W_VWFCurrentFont], a
  call CreditLineDrawCharacterInBuffer

.stageB
  ld a, 7
  ld [W_VWFCurrentFont], a
  call CreditLineDrawCharacterInBuffer
  xor a
  ret

CreditLineDrawCharacterInBuffer::
  ld a, [hl]
  cp $CB
  ret z
  inc hl
  ld [W_VWFCurrentLetter], a
  ld a, BANK(VWFWriteCharLimited)
  push hl
  call VWFDrawCharForCredits
  pop hl
  ret
  padend $4800

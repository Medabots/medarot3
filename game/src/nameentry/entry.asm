INCLUDE "game/src/common/constants.asm"

W_NamingScreenCursorPositionIndex EQU $C48D

SECTION "Naming Entry Variables", WRAM0[$C763]
W_NamingEntryBottomRowSelection:: ds 1
W_NamingEntryCursorPositionIndexWithinGroup:: ds 1
W_NamingEntryCursorRowIndex:: ds 1

SECTION "Naming Screen Entry Functions 1", ROMX[$4D49], BANK[$01]
NamingEntryCursorRepositioningTable::
  dw .pointers, .pointers

.pointers
  dw .moveUpTable
  dw .moveDownTable
  dw .moveLeftTable
  dw .moveRightTable

.moveUpTable
  db $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF
  db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E
  db $0F, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D
  db $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C
  db $2D, $2E, $2F, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B

.moveDownTable
  db $0F, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D
  db $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C
  db $2D, $2E, $2F, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B
  db $3C, $3D, $3E, $3F, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $49
  db $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF

.moveLeftTable
  db $0E, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D
  db $1D, $0F, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C
  db $2C, $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B
  db $3B, $2D, $2E, $2F, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A
  db $49, $3C, $3D, $3E, $3F, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49

.moveRightTable
  db $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $00
  db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $0F
  db $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $1E
  db $2E, $2F, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $2D
  db $3D, $3E, $3F, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $3C, $48

NamingEntryCursorIndexInformationTable::
  dw .table, .table

.table
  db $10,$28,0,0
  db $18,$28,1,0
  db $20,$28,2,0
  db $28,$28,3,0
  db $30,$28,4,0
  db $40,$28,0,0
  db $48,$28,1,0
  db $50,$28,2,0
  db $58,$28,3,0
  db $60,$28,4,0
  db $70,$28,0,0
  db $78,$28,1,0
  db $80,$28,2,0
  db $88,$28,3,0
  db $90,$28,4,0
  db $10,$38,0,1
  db $18,$38,1,1
  db $20,$38,2,1
  db $28,$38,3,1
  db $30,$38,4,1
  db $40,$38,0,1
  db $48,$38,1,1
  db $50,$38,2,1
  db $58,$38,3,1
  db $60,$38,4,1
  db $70,$38,0,1
  db $78,$38,1,1
  db $80,$38,2,1
  db $88,$38,3,1
  db $90,$38,4,1
  db $10,$48,0,2
  db $18,$48,1,2
  db $20,$48,2,2
  db $28,$48,3,2
  db $30,$48,4,2
  db $40,$48,0,2
  db $48,$48,1,2
  db $50,$48,2,2
  db $58,$48,3,2
  db $60,$48,4,2
  db $70,$48,0,2
  db $78,$48,1,2
  db $80,$48,2,2
  db $88,$48,3,2
  db $90,$48,4,2
  db $10,$58,0,3
  db $18,$58,1,3
  db $20,$58,2,3
  db $28,$58,3,3
  db $30,$58,4,3
  db $40,$58,0,3
  db $48,$58,1,3
  db $50,$58,2,3
  db $58,$58,3,3
  db $60,$58,4,3
  db $70,$58,0,3
  db $78,$58,1,3
  db $80,$58,2,3
  db $88,$58,3,3
  db $90,$58,4,3
  db $10,$68,0,4
  db $18,$68,1,4
  db $20,$68,2,4
  db $28,$68,3,4
  db $30,$68,4,4
  db $40,$68,0,4
  db $48,$68,1,4
  db $50,$68,2,4
  db $58,$68,3,4
  db $60,$68,4,4
  db $70,$68,0,4
  db $78,$68,1,4
  db $80,$68,2,4
  db $88,$68,3,4
  db $90,$68,3,4

SECTION "Naming Screen Entry Functions 2", ROMX[$4FB1], BANK[$01]
DiacriticConversionTable::
  db     $00,$00,$00,$00,$00,$00,$86,$00,$00,$00,$00,$00,$6D,$00,$6E
  db $00,$6F,$00,$70,$00,$71,$00,$72,$00,$73,$00,$74,$00,$75,$00,$76
  db $00,$77,$00,$78,$00,$79,$00,$7A,$00,$7B,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$7C,$81,$7D,$82,$7E,$83,$7F,$84,$80,$85,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$87,$00,$88,$00,$89
  db $00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$8E,$00,$8F,$00,$90,$00,$91
  db $00,$92,$00,$93,$00,$94,$00,$95,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$96,$9A,$97,$9B,$98,$9C,$99,$9D,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SECTION "Naming Screen Entry Functions 3", ROMX[$51F2], BANK[$01]
PositionNameEntryBottomRowCursor::
  ld a, [W_NamingEntryBottomRowSelection]
  ld hl, .table
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld [$C223], a
  ld a, [hl]
  ld [$C222], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ret

.table
  db $08, $86
  db $40, $87
  db $70, $87

SECTION "Naming Screen Entry Functions 4", ROMX[$5271], BANK[$01]
NameEntryNavigateAwayFromBottomRow::
  ld hl, .table
  ld d, 0
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld h, [hl]
  ld l, a
  push hl
  ld a, [W_NamingEntryBottomRowSelection]
  ld d, 0
  ld e, a
  ld h, 0
  ld l, a
  sla e
  rl d
  sla e
  rl d
  add hl, de
  pop de
  add hl, de
  ld a, [W_NamingEntryCursorPositionIndexWithinGroup]
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [W_NamingScreenCursorPositionIndex], a
  call NameEntryGetCursorPositionIndexDetailsAndPositionCursor
  ld a, $83
  ld [$C222], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 1
  ld [W_NamingScreenSubSubSubStateIndex], a
  ret

.table
  dw .upTable, .downTable

.upTable
  db $3C, $3D, $3E, $3F, $40
  db $41, $42, $43, $44, $45
  db $46, $47, $48, $49, $49

.downTable
  db $00, $01, $02, $03, $04
  db $05, $06, $07, $08, $09
  db $0A, $0B, $0C, $0D, $0E

NameEntryGetCursorPositionIndexDetailsAndPositionCursor::
  ld hl, NamingEntryCursorIndexInformationTable
  ld b, 0
  ld a, [W_MedalMenuSkillBarAnimationStage]
  ld c, a
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld b, 0
  ld a, [W_NamingScreenCursorPositionIndex]
  ld c, a
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld a, [hli]
  ld [$C223], a
  ld a, [hli]
  ld [$C224], a
  ld a, [hli]
  ld [W_NamingEntryCursorPositionIndexWithinGroup], a
  ld a, [hl]
  ld [W_NamingEntryCursorRowIndex], a
  ret

AutofillImagineerAsEnteredName::
  ld hl, W_NamingScreenEnteredTextBuffer
  ld a, 2
  ld [hli], a
  ld a, $1F
  ld [hli], a
  ld a, $73
  ld [hli], a
  ld a, $16
  ld [hli], a
  ld a, 1
  ld [hli], a
  xor a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld a, 5
  ld [W_NamingScreenEnteredTextLength], a
  call $51AD
  call $519F
  ld a, 2
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $1F
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $73
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, $16
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, 1
  ld [$C1E0], a
  ld a, [$C761]
  ld hl, .table
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  ld [$C1E3], a
  ld a, 1
  ld [W_OAM_SpritesReady], a
  ld a, 6
  call ScheduleSoundEffect
  ret

.table
  db $80, $78

SECTION "Naming Screen Entry Functions 5", ROMX[$536F], BANK[$01]
NameEntryDiacriticCheck::
  ld [$C4EE], a
  cp 1
  jr z, .diacriticMaybe
  cp 2
  jr z, .diacriticMaybe
  jr .notDiacritic

.diacriticMaybe
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  di
  rst $20
  ld a, [hl]
  ei
  and 8
  push af
  ld a, 0
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  pop af
  or a
  jr z, .isDiacritic

.notDiacritic
  xor a
  ret

.isDiacritic
  ld a, [$C4EE]
  ret

SECTION "Naming Screen Entry Functions 6", ROMX[$53ED], BANK[$01]
GetTileMappingAddressFromCoordinatesForNameEntry::
  ldh a, [$FF8E]
  sub $10
  srl a
  srl a
  srl a
  ld de, 0
  ld e, a
  ld hl, $9800
  ld b, $20

.mappingRowMathLoop
  add hl, de
  dec b
  jr nz, .mappingRowMathLoop

  ldh a, [$FF8F]
  sub 8
  srl a
  srl a
  srl a
  ld de, 0
  ld e, a
  add hl, de
  ld a, h
  ldh [$FF90], a
  ld a, l
  ldh [$FF91], a
  ret

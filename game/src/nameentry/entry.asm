INCLUDE "game/src/common/constants.asm"

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


SECTION "Naming Screen Entry Functions 3", ROMX[$536F], BANK[$01]
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

SECTION "Naming Screen Entry Functions 4", ROMX[$53ED], BANK[$01]
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

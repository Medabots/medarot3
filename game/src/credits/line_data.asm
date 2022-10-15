INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Credits Line Instructions Pointer Table", ROMX[$5115], BANK[$16]
PtrCreditsLineInstructions::
  dw .line0
  dw .line1
  dw .line2
  dw .line3
  dw .line4
  dw .line5
  dw .line6
  dw .line7

.line0
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $13, 1, 0, $FF
  db $FF, 0, 0, $FF
  db $13, 0, 1, $FF
  db $1B, 1, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $1B, 0, 1, $FF
  db $38, 1, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $38, 0, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF

.line1
  db $FF, 0, 0, $FF
  db $02, 1, 1, $FF
  db $04, 1, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $04, 0, 1, $FF
  db $14, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $19, 1, 1, $FF
  db $1C, 1, 1, $FF
  db $1E, 1, 1, $FF
  db $23, 1, 1, $FF
  db $26, 1, 1, $FF
  db $29, 1, 1, $FF
  db $2F, 1, 1, $FF
  db $33, 1, 1, $FF
  db $39, 1, 1, $FF
  db $3B, 1, 1, $FF
  db $3D, 1, 1, $FF
  db $3F, 1, 1, $FF
  db $41, 1, 1, $FF
  db $44, 1, 1, $FF
  db $48, 1, 1, $FF
  db $4C, 1, 1, $FF
  db $4F, 1, 1, $FF
  db $52, 1, 1, $FF
  db $58, 1, 1, $FF
  db $52, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF

.line2
  db $00, 1, 1, $FF
  db $03, 1, 1, $FF
  db $05, 1, 1, $FF
  db $07, 1, 1, $FF
  db $0B, 1, 1, $FF
  db $0D, 1, 1, $FF
  db $11, 1, 1, $FF
  db $15, 1, 1, $FF
  db $16, 1, 1, $FF
  db $1A, 1, 1, $FF
  db $1D, 1, 1, $FF
  db $1F, 1, 1, $FF
  db $24, 1, 1, $FF
  db $27, 1, 1, $FF
  db $2A, 1, 1, $FF
  db $30, 1, 1, $FF
  db $34, 1, 1, $FF
  db $3A, 1, 1, $FF
  db $3C, 1, 1, $FF
  db $3E, 1, 1, $FF
  db $40, 1, 1, $FF
  db $42, 1, 1, $FF
  db $45, 1, 1, $FF
  db $49, 1, 1, $FF
  db $4D, 1, 1, $FF
  db $50, 1, 1, $FF
  db $53, 1, 1, $FF
  db $59, 1, 1, $FF
  db $5D, 1, 1, $FF
  db $62, 1, 1, $FF
  db $64, 1, 1, $FF

.line3
  db $01, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $06, 1, 1, $FF
  db $08, 1, 1, $FF
  db $0C, 1, 1, $FF
  db $0E, 1, 1, $FF
  db $12, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $17, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $20, 1, 1, $FF
  db $25, 1, 1, $FF
  db $28, 1, 1, $FF
  db $2B, 1, 1, $FF
  db $31, 1, 1, $FF
  db $35, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $43, 1, 1, $FF
  db $46, 1, 1, $FF
  db $4A, 1, 1, $FF
  db $4E, 1, 1, $FF
  db $51, 1, 1, $FF
  db $54, 1, 1, $FF
  db $5A, 1, 1, $FF
  db $5E, 1, 1, $FF
  db $63, 1, 1, $FF
  db $65, 1, 1, $FF

.line4
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $09, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $0F, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $18, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $21, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $2C, 1, 1, $FF
  db $32, 1, 1, $FF
  db $36, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $47, 1, 1, $FF
  db $4B, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $55, 1, 1, $FF
  db $5B, 1, 1, $FF
  db $5F, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $66, 1, 1, $FF

.line5
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $0A, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $10, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $22, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $2D, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $37, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $56, 1, 1, $FF
  db $5C, 1, 1, $FF
  db $60, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF

.line6
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $2E, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $57, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $61, 1, 1, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF

.line7
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF
  db $FF, 0, 0, $FF

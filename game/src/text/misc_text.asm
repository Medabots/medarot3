; Placeholder for miscellaneous text that doesn't have a more appropriate file

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Draw transformation cutscene text", ROMX[$43C8], BANK[$01]
TransformationCutsceneDrawText:
  ld hl, .text_table
  rst $30
  ld d, h
  ld e, l
  ld hl, $8B00
  ld b, $20
.loop
  ld a, [de]
  call WrapMainScriptDrawNonKanjiCharacter
  inc de
  dec b
  jr nz, .loop
  ret
.text_table
  dw .text1
  dw .text2
  dw .text3
  dw .text4
; 16 bytes per line
.text1
  db $22, $77, $11, $32, $ee, $ee, $ee, $ee, $ee, $2e, $73, $b9, $b9, $00, $00, $00 ; メダチェーーーーーンジ!!
  db $2a, $08, $28, $0d, $23, $ee, $7b, $b9, $b9, $00, $00, $00, $00, $00, $00, $00 ; レクリスモード!!
.text2
  db $22, $77, $11, $32, $ee, $ee, $ee, $ee, $ee, $2e, $73, $b9, $b9, $00, $00, $00 ; メダチェーーーーーンジ!!
  db $08, $27, $1c, $13, $30, $23, $ee, $7b, $b9, $b9, $00, $00, $00, $00, $00, $00 ; クラフティモード!!
.text3
  db $39, $69, $40, $67, $b9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $22, $77, $1c, $33, $ee, $0d, $00, $8f, $63, $3d, $39, $91, $b9, $00, $00, $00
.text4 ; Empty entry
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
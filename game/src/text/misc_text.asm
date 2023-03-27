; Placeholder for miscellaneous text that doesn't have a more appropriate file

INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Draw transformation cutscene text", ROMX[$43C8], BANK[$01]
TransformationCutsceneDrawText:
  rla
  ; Draw line 1
  push af
  ld h, $b0
  ld de, $99c1 ; TODO: We don't need to map here, since the tilemap already handles it
  call .sub
  pop af

  ; Draw line 2
  inc a
  ld h, $c0
  ld de, $9a01
  call .sub

  ret
.sub
  push hl
  ld hl, .text_table
  rst $30
  ld b, h
  ld c, l
  pop hl
  ld a, $10 ; 16 tiles to draw
  call VWFDrawStringLeftFullAddress
  ret

.text_table
  dw .text1_line1
  dw .text1_line2
  dw .text2_line1
  dw .text2_line2
  dw .text3_line1
  dw .text3_line2
  dw .text4_line1
  dw .text4_line2
; 16 bytes per line
.text1_line1
  db "Medachaaaange!", $CB ; メダチェーーーーーンジ!!
.text1_line2
  db "Reckless Mode!", $CB ; レクリスモード!!
.text2_line1
  db "Medachaaaange!", $CB ; メダチェーーーーーンジ!!
.text2_line2
  db "Crafty Mode!", $CB ; クラフティモード!!
.text3_line1
  db "Let's go!", $CB ; メダフォース　ぜんかいだ！
.text3_line2
  db "Medaforce is fully recovered!", $CB ; メダフォース　ぜんかいだ！
.text4_line1 ; Empty entry
  db $CB
.text4_line2
  db $CB

  padend $4464
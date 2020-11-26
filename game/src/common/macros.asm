; macro for putting a byte then a word
dbw: MACRO
  db \1
  dw \2
  ENDM

; macro for putting a word then a byte
dwb: MACRO
  dw \1
  db \2
  ENDM

dbww: MACRO
  db \1
  dw \2
  dw \3
  ENDM

dbwb: MACRO
  db \1
  dw \2
  db \3
  ENDM

Load1BPPTilesetLocal: MACRO
  ld hl, \1
  ld de, \2
  ld b, (\3 - \2) / $8
  call Load1BPPTiles
  ENDM

Load1BPPTileset: MACRO
  ld hl, \1
  ld de, \2
  ld b, (\3 - \2) / $8
  call Load1BPPTilesFromFE
  ENDM

VRAMSwitchToBank1: MACRO
  ld a, 1
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ENDM

VRAMSwitchToBank0: MACRO
  xor a
  ld [W_CurrentVRAMBank], a
  ldh [H_RegVBK], a
  ENDM
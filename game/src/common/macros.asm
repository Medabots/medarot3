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

dcolor: MACRO
  dw ((\3) << 10) + ((\2) << 5) + (\1)
  ENDM
    
;CGB palette color indexes are stored as big-endian words for some reason
dpalette: MACRO
  dw (\1 >> 8) | ((\1 & $FF) << 8)
  dw (\2 >> 8) | ((\2 & $FF) << 8)
  dw (\3 >> 8) | ((\3 & $FF) << 8)
  dw (\4 >> 8) | ((\4 & $FF) << 8)
  dw (\5 >> 8) | ((\5 & $FF) << 8)
  dw (\6 >> 8) | ((\6 & $FF) << 8)
  dw (\7 >> 8) | ((\7 & $FF) << 8)
  dw (\8 >> 8) | ((\8 & $FF) << 8)
  ENDM

padend: MACRO
  .end\@
    REPT \1 - .end\@
      nop
    ENDR
  ENDM

creditconf: MACRO
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ENDM


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
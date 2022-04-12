; TODO: Clean-up, this is just a quick dump of functions necessary for translation
SECTION "Battle State Machine Misc. (temp)", ROMX[$4DCF], BANK[$0A]
; Part of initial state (0A:40C1 -> 0A:4B84 -> 0A:4DCF)
BattleInitializeLoadParticipantData:
  xor a
  ld [$c4ee], a
  ld hl, $60
  add hl, de
  ld a, [$c4f2]
  ld [hl], a
  ld hl, $62
  add hl, de
  ld a, $01
  ld [hl], a
  ld hl, $3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $01
  ld c, $09
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $d0
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $9
  call memcpy
  pop de
  ld hl, $3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $00
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $d9
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  ld a, [$c554]
  ld [hli], a
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c555]
  ld hl, $e6
  add hl, de
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld hl, $ed
  add hl, de
  ld a, [$c55c]
  ld [hl], a
  ld hl, $ee
  add hl, de
  ld a, [$c55e]
  ld [hl], a
  ld hl, $e8
  add hl, de
  ld a, [$c55f]
  ld [hl], a
  ld hl, $4
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $02
  ld c, $09
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $f0
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $9
  call memcpy
  pop de
  ld hl, $4
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $01
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $f9
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  ld a, [$c554]
  ld [hli], a
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld a, [$c555]
  ld hl, $106
  add hl, de
  ld [hli], a
  ld hl, $10d
  add hl, de
  ld a, [$c55c]
  ld [hl], a
  ld hl, $108
  add hl, de
  ld a, [$c55f]
  ld [hl], a
  ld hl, $5
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $03
  ld c, $09
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $110
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $9
  call memcpy
  pop de
  ld hl, $5
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $02
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $119
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  ld a, [$c554]
  ld [hli], a
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld a, [$c555]
  ld hl, $126
  add hl, de
  ld [hli], a
  ld hl, $12d
  add hl, de
  ld a, [$c55c]
  ld [hl], a
  ld hl, $128
  add hl, de
  ld a, [$c55f]
  ld [hl], a
  ld hl, $6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld b, $04
  ld c, $09
  ld a, $07
  ld [W_ListItemInitialOffsetForBuffering], a
  push de
  call WrapBufferTextFromList
  pop de
  push de
  ld hl, $130
  add hl, de
  ld d, h
  ld e, l
  ld hl, W_ListItemBufferArea
  ld bc, $9
  call memcpy
  pop de
  ld hl, $6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $03
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $139
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  inc hl
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld hl, $146
  add hl, de
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld hl, $14d
  add hl, de
  ld a, [$c55c]
  ld [hl], a
  ld hl, $ee
  add hl, de
  ld a, [hl]
  or a
  jp z, $50f8
  ld hl, $3
  add hl, de
  ld a, [hli]
  ld b, a
  ld a, [hli]
  cp b
  jr nz, .asm_28fe6
  ld a, [hli]
  cp b
  jr nz, .asm_28fe6
  ld a, [hli]
  cp b
  jr z, .asm_28fef
.asm_28fe6
  xor a
  ld hl, $ee
  add hl, de
  ld [hl], a
  jp $50f8
.asm_28fef
  ld hl, $3
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $04
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $159
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  ld a, [$c554]
  ld [hli], a
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld hl, $168
  add hl, de
  ld a, [$c55f]
  ld [hl], a
  ld hl, $4
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $05
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $179
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  ld a, [$c554]
  ld [hli], a
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld hl, $188
  add hl, de
  ld a, [$c55f]
  ld [hl], a
  ld hl, $5
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $06
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $199
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  ld a, [$c554]
  ld [hli], a
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld hl, $1a8
  add hl, de
  ld a, [$c55f]
  ld [hl], a
  ld hl, $6
  add hl, de
  ld a, [hl]
  ld [W_ListItemIndexForBuffering], a
  ld a, $07
  push de
  call $34ff
  pop de
  ld a, [$c552]
  ld hl, $1b9
  add hl, de
  ld [hli], a
  ld a, [$c553]
  ld [hli], a
  inc hl
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld hl, $1c6
  add hl, de
  ld a, [$c555]
  ld [hli], a
  ld a, [$c556]
  ld [hli], a
  ld a, [$c557]
  ld [hli], a
  ld a, [$c558]
  ld [hli], a
  ld a, [$c559]
  ld [hli], a
  ld a, [$c55a]
  ld [hli], a
  ld hl, $dc
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $fc
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $11c
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $13c
  add hl, de
  ld a, [hl]
  call $5137
  ld hl, $200
  add hl, de
  ld d, h
  ld e, l
  ld a, [$c4ee]
  inc a
  ld [$c4ee], a
  ld a, [$c4f2]
  inc a
  ld [$c4f2], a
  ld a, [$c4f0]
  dec a
  ld [$c4f0], a
  jp nz, $4dd3
  ret
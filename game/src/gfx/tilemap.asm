INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

DEF W_TilemapWritingBaseLocationIndex EQU $C4E0 ; 0 for $9800, 1 for $9C00, I suck at naming things.
DEF W_TilemapPointerTableIndex EQU $C4E1

SECTION "Load Tilemaps", ROM0[$064F]
DecompressTilemap0::
  push af
  ld hl, $9800
  xor a
  ld [W_TilemapWritingBaseLocationIndex], a
  jr DecompressTilemapCommon

DecompressTilemap1::
  push af
  ld hl, $9C00
  ld a, 1
  ld [W_TilemapWritingBaseLocationIndex], a

DecompressTilemapCommon::
  pop af
  ld [W_TilemapPointerTableIndex], a
  push hl
  push de
  ld hl, TilemapBankTable
  ld d, 0
  ld e, a
  add hl, de
  ld a, [hl]
  rst $10
  pop de
  pop hl
  push de
  ld a, b
  and $1F
  ld b, a
  ld a, c
  and $1F
  ld c, a
  xor a
  ld d, a ; a = 0 here
  ld e, c
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  ld c, b
  ld b, a ; a = 0 here
  add hl, bc
  add hl, de
  pop de
  push hl
  ld hl, TilemapAddressTable
  ld d, a ; a = 0 here
  ld a, [W_TilemapPointerTableIndex]
  rst $30
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld d, [hl]
  ld e, a
  pop hl
  ld a, [de]
  cp $FF
  ret z

  push af
  ld c, a
  and $FE
  jr z, .noTileset
  xor a ; TilemapLoadTileset
  rst $38
.noTileset
  pop af

  ld b, h
  ld c, l
  and 1 ; Previously 'and 3', but only 0 and 1 matter for tilemaps
  jr nz, .decompressMode

.copyLinesMode
  inc de
  ld a, [de]
  cp $FF
  ret z
  cp $FE
  jr z, .newLine
  cp $FD
  jr z, .jpA
  cp $FC
  jr z, .jpB
  di 
  push af
  rst $20
  pop af
  ld [hli], a
  ei 
  ld a, [W_TilemapWritingBaseLocationIndex]
  or a
  call z, Tilemap0WrapToLine
  jr .copyLinesMode

.newLine
  push de
  ld de, $20
  ld h, b
  ld l, c
  add hl, de
  ld a, [W_TilemapWritingBaseLocationIndex]
  or a
  call z, ConfineAddressToTilemap0
  ld b, h
  ld c, l
  pop de
  jr .copyLinesMode

.jpA
  inc hl
  ld a, [W_TilemapWritingBaseLocationIndex]
  or a
  call z, Tilemap0WrapToLine
  jr .copyLinesMode

.jpB
  inc de
  ld a, [de]
  ld [$C4EE], a
  inc de
  ld a, [de]
  ld [$C4F0], a

.jpC
  ld a, [$C4EE]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  ld a, [W_TilemapWritingBaseLocationIndex]
  or a
  call z, Tilemap0WrapToLine
  ld a, [$C4F0]
  dec a
  ld [$C4F0], a
  jr nz, .jpC
  jr .copyLinesMode

.decompressMode
  inc de
  ld a, [de]
  cp $FF
  ret z
  ld a, [de]
  and $C0
  cp $C0
  jr z, .cmd3
  cp $80
  jr z, .cmd2
  cp $40
  jr z, .cmd1

.cmd0
  push bc
  ld a, [de]
  inc a
  ld b, a

.cmd0Loop
  inc de
  ld a, [de]
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jp nz, .cmd0Loop
  pop bc
  jr .decompressMode

.cmd1
  push bc
  ld a, [de]
  and $3F
  add 2
  ld b, a
  inc de
  ld a, [de]

.cmd1Repeat
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jp nz, .cmd1Repeat
  pop bc
  jr .decompressMode

.cmd2
  push bc
  ld a, [de]
  and $3F
  add 2
  ld b, a
  inc de
  ld a, [de]

.cmd2RepeatAndIncrement
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc a
  dec b
  jp nz, .cmd2RepeatAndIncrement
  pop bc
  jr .decompressMode

.cmd3
  push bc
  ld a, [de]
  and $3F
  add 2
  ld b, a
  inc de
  ld a, [de]

.cmd3RepeatAndDecrement
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec a
  dec b
  jp nz, .cmd3RepeatAndDecrement
  pop bc
  jr .decompressMode
  padend $078A
TilemapBankTable::
  db BANK(TilemapTable00)
  db BANK(TilemapTable01)
  db BANK(TilemapTable02)
  db BANK(TilemapTable03)

TilemapAddressTable::
  dw TilemapTable00
  dw TilemapTable01
  dw TilemapTable02
  dw TilemapTable03

SECTION "Calculate Tilemap Address", ROM0[$0912]
Tilemap0WrapToLine::
  push af
  push bc
  push de
  call ConfineAddressToTilemap0
  ld d, h
  ld e, l
  ld bc, $6800
  add hl, bc
  srl l
  jr c, .addressNotAtStartOfRow
  srl l
  jr c, .addressNotAtStartOfRow
  srl l
  jr c, .addressNotAtStartOfRow
  srl l
  jr c, .addressNotAtStartOfRow
  srl l
  jr c, .addressNotAtStartOfRow
  jr .backupLineAndExit

.addressNotAtStartOfRow
  ld h, d
  ld l, e
  pop de
  pop bc
  pop af
  ret

.backupLineAndExit
  ld h, d
  ld l, e
  ld bc, -$20
  add hl, bc
  call ConfineAddressToTilemap0
  pop de
  pop bc
  pop af
  ret

Tilemap0WrapToLineBackwards::
  push af
  push bc
  push de
  call ConfineAddressToTilemap0
  ld d, h
  ld e, l
  ld bc, $6800
  add hl, bc
  srl l
  jr nc, .addressNotAtEndOfRow
  srl l
  jr nc, .addressNotAtEndOfRow
  srl l
  jr nc, .addressNotAtEndOfRow
  srl l
  jr nc, .addressNotAtEndOfRow
  srl l
  jr nc, .addressNotAtEndOfRow
  jr .forwardLineAndExit

.addressNotAtEndOfRow
  ld h, d
  ld l, e
  pop de
  pop bc
  pop af
  ret

.forwardLineAndExit
  ld h, d
  ld l, e
  ld bc, $20
  add hl, bc
  call ConfineAddressToTilemap0
  pop de
  pop bc
  pop af
  ret

ConfineAddressToTilemap0::
  ld a, h
  and 3
  or $98
  ld h, a
  ret

SECTION "Load Tilemaps 2", ROM0[$151F]
DecompressTilemap0ScrollAdjusted::
  push af
  call GetOverworldScrollTileOffset
  pop af
  jp DecompressTilemap0

SECTION "Load Tilemaps 3", ROM0[$152F]
GetOverworldScrollTileOffset::
  ld a, [W_ShadowREG_SCX]
  srl a
  srl a
  srl a
  add b
  ld b, a
  ld a, [W_ShadowREG_SCY]
  srl a
  srl a
  srl a
  add c
  ld c, a
  ret

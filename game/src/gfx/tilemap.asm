INCLUDE "game/src/common/constants.asm"

SECTION "Load Tilemaps", ROM0[$064F]
DecompressTilemap0::
  push af
  ld hl, $9800
  xor a
  ld [$C4E0], a
  jr DecompressTilemapCommon

DecompressTilemap1::
  push af
  ld hl, $9C00
  ld a, 1
  ld [$C4E0], a

DecompressTilemapCommon::
  pop af
  ld [$C4E1], a
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
  ld d, 0
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
  ld b, 0
  add hl, bc
  add hl, de
  pop de
  push hl
  ld hl, TilemapAddressTable
  ld a, [$C4E1]
  rst $30
  ld d, 0
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld d, [hl]
  ld e, a
  pop hl
  ld b, h
  ld c, l
  ld a, [de]
  cp $FF
  ret z
  and 3
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
  ld a, [$C4E0]
  or a
  call z, $0912
  jr .copyLinesMode

.newLine
  push de
  ld de, $20
  ld h, b
  ld l, c
  add hl, de
  ld a, [$C4E0]
  or a
  call z, $097C
  ld b, h
  ld c, l
  pop de
  jr .copyLinesMode

.jpA
  inc hl
  ld a, [$C4E0]
  or a
  call z, $0912
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
  ld a, [$C4E0]
  or a
  call z, $0912
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
  jp z, .cmd3
  cp $80
  jp z, .cmd2
  cp $40
  jp z, .cmd1

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
  jp .decompressMode

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
  jp .decompressMode

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
  jp .decompressMode

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
  jp .decompressMode

TilemapBankTable::
  db $33,  $34,  $19,  $AB

TilemapAddressTable::
  dw $4000,  $4000,  $4000,  $4000

; 0x0796
  
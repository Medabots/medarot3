INCLUDE "game/src/common/constants.asm"

SECTION "Load Attribmaps", ROM0[$0796]
DecompressAttribmap0::
  push af
  ld hl, $9800
  xor a
  ld [$C4E0], a
  jr DecompressAttribmapCommon

DecompressAttribmap1::
  push af
  ld hl, $9C00
  ld a, 1
  ld [$C4E0], a

DecompressAttribmapCommon::
  ld a, 1
  ld [$C4CF], a
  ldh [hRegVBK], a
  pop af
  ld [$C4E1], a
  push hl
  push de
  ld hl, AttribmapBankTable
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
  ld hl, AttribmapAddressTable
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
  jp z, .cleanUpAndExit
  and $F8
  ld [$C499], a
  ld a, [de]
  and 3
  jr nz, .decompressMode

.copyLinesMode
  inc de
  ld a, [de]
  cp $FF
  jp z, .cleanUpAndExit
  cp $FE
  jr z, .newLine
  cp $FD
  jr z, .jpA
  cp $FC
  jr z, .jpB
  call $090A
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
  call $090A
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
  jp z, .cleanUpAndExit
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
  call $090A
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
  call $090A
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
  call $090A
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
  call $090A
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

.cleanUpAndExit
  ld a, 0
  ld [$C4CF], a
  ldh [hRegVBK], a
  ret

AttribmapBankTable::
  db $37, $38, $19, $AB

AttribmapAddressTable::
  dw $4000,  $4000,  $47A0,  $5692

; 0x090A
  
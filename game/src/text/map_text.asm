INCLUDE "game/src/common/constants.asm"

SECTION "Text Mapping Functions", ROM0[$258F]
PutStringVariableLength::
  ld a, [bc]
  cp $CB
  ret z
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc bc
  jr PutStringVariableLength

PutStringFixedLength::
  push af
  ld d, 0

.copyLoop
  ld a, [bc]
  cp $CB
  jr z, .clearRemaining
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  inc bc
  inc d
  jr .copyLoop

.clearRemaining
  pop af
  sub d
  ret z
  ld b, a

.clearLoop
  xor a
  di
  push af
  rst $20
  pop af
  ld [hli], a
  ei
  dec b
  jr nz, .clearLoop
  ret

SECTION "Get Tile-Based Centring Offset", ROM0[$25BD]
GetTileBasedCenteringOffset::
  push hl
  push bc
  push af
  ld h, 0

.loop
  ld a, [bc]
  cp $CB
  jr z, .terminatorFound
  inc bc
  inc h
  jr .loop

.terminatorFound
  pop af
  sub h
  srl a
  pop bc
  pop hl
  ret

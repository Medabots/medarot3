INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "List Text Buffering", WRAM0[$C540]
W_ListItemIndexForBuffering:: ds 1
W_ListItemInitialOffsetForBuffering:: ds 1
W_ListItemBufferArea:: ds $C

SECTION "Buffer Text From List", ROM0[$264B]
BufferTextFromList::
  ld e, b
  ld d, 0
  ld l, e
  ld h, d
  sla e
  rl d
  add hl, de
  ld de, .table
  add hl, de
  ld a, [hli]
  rst $10
  ld a, [hli]
  ld h, [hl]
  ld l, a
  ld a, [W_ListItemIndexForBuffering]
  push bc
  rst $30
  pop bc
  ld a, [W_ListItemInitialOffsetForBuffering]
  ld e, a
  ld d, 0
  add hl, de
  ld de, W_ListItemBufferArea

.copyLoop
  ld a, [hli]
  ld [de], a
  inc de
  dec c
  jr nz, .copyLoop
  ret 

.table
  dbw $27, $44FC
  dbw $23, $4671
  dbw $23, $529A
  dbw $23, $5EC3
  dbw $23, $6AEC
  dbw $22, $65C0
  dbw $22, $664C
  dbw $22, $669A
  dbw $22, $66DC
  dbw $22, $68BC
  dbw $22, $6979
  dbw $23, $795B
  dbw $22, $6901
  dbw $23, $7715
  dbw $20, $4000
  dbw $20, $4328
  dbw $20, $4EA4
  dbw $23, $7A23
  dbw $23, $7A80
  dbw $21, $4000
  dbw $21, $461B
  dbw $23, $4000

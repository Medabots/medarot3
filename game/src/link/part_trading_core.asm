INCLUDE "game/src/common/constants.asm"

SECTION "Part Trading State Machine 1", ROMX[$5000], BANK[$11]
PartTradingStateMachine::
  call $2D04
  or a
  ret nz
  ld a, [W_CoreSubStateIndex]
  ld hl, .table
  rst $30
  jp hl

.table
  dw $5121
  dw $513F
  dw $515E
  dw $50C0
  dw $5170
  dw $518A
  dw $50C0
  dw $51A7
  dw $5110
  dw $508F
  dw $50AF
  dw $50FC
  dw $5104
  dw $50AF
  dw $51BF
  dw $51C5
  dw $50AF
  dw $51EE
  dw $50AF
  dw $521A
  dw $5234
  dw $50C0
  dw $5251
  dw $5269
  dw $508F
  dw $5272
  dw $50C0
  dw $5289
  dw $529F
  dw $50C0
  dw $52C7
  dw $5414

  dw $52CD
  dw $52DB
  dw $52E1
  dw $5309
  dw $533A
  dw $534D
  dw $50C0
  dw $5375
  dw $5393
  dw $539E
  dw $53B9
  dw $53E3
  dw $5110
  dw $508F
  dw $50AF
  dw $50FC
  dw $5104
  dw $50AF
  dw $50CB
  dw $50C0
  dw $5404
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414
  dw $5414

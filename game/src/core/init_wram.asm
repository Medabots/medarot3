INCLUDE "game/src/common/constants.asm"

SECTION "Clear WRAM Variables", ROMX[$402A], BANK[$15]
ClearWRAM::
  ld bc, $1000
  ld hl, $C000

.bank0ClearLoop
  xor a
  ld [hli], a
  dec bc
  ld a, b
  or c
  jr nz, .bank0ClearLoop

  ld d, 1

.nextWRAMBank
  ld a, d
  rst 8
  rst 8 ; Why twice?
  ld bc, $1000
  ld hl, $D000

.bankXClearLoop
  xor a
  ld [hli], a
  dec bc
  ld a, b
  or c
  jr nz, .bankXClearLoop

  inc d
  ld a, d
  cp 8
  jr nz, .nextWRAMBank
  xor a
  rst 8
  ret

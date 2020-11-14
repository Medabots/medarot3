INCLUDE "game/src/common/constants.asm"

SECTION "Install ODMA Driver", ROM0[$04AA]
InstallODMADriver::
  ld c, $80
  ld b, $A
  ld hl, ODMADriver

.copyLoop
  ld a, [hli]
  ld [c], a
  inc c
  dec b
  jr nz, .copyLoop
  ret

ODMADriver:
  ld a, $C0
  ld [H_RegDMA], a
  ld a, $28

.spinLock
  dec a
  jr nz, .spinLock
  ret

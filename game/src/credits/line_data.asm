INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Credit Line Mapping Address Tables", ROMX[$7FE0], BANK[$16]
CreditOffsetLineMappingHighAddressTable::
  db $98, $98, $98, $99, $99, $99, $99, $9A

CreditOffsetLineMappingLowAddressTable::
  db $83, $A3, $E3, $23, $63, $A3, $E3, $23

CreditLineMappingHighAddressTable::
  db $98, $98, $99, $99, $99, $99, $9A, $9A

CreditLineMappingLowAddressTable::
  db $83, $C3, $03, $43, $83, $C3, $03, $43

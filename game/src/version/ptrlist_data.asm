INCLUDE "build/ptrlists/ptrlist_data_constants_{GAMEVERSION}.asm"

; End of text pointer section (fixed length)
SECTION "PtrList Pointers", ROMX[$5E4B], BANK[$F2]
PtrListUnknown00::
  INCBIN cUnknown00
PtrListPartsHead::
  INCBIN cPartsHead
PtrListPartsRArm::
  INCBIN cPartsRArm
PtrListPartsLArm::
  INCBIN cPartsLArm
PtrListPartsLegs::
  INCBIN cPartsLegs
PtrListAttributes::
  INCBIN cAttributes
PtrListSkills::
  INCBIN cSkills
PtrListMovement::
  INCBIN cMovement
PtrListUnknown08::
  INCBIN cUnknown08
PtrListPersonalities::
  INCBIN cPersonalities
PtrListMedaforce::
  INCBIN cMedaforce
PtrListMedals::
  INCBIN cMedals
PtrListUnknown0C::
  INCBIN cUnknown0C
PtrListItems::
  INCBIN cItems
PtrListUnknown0E::
  INCBIN cUnknown0E
PtrListMedarotters::
  INCBIN cMedarotters
PtrListUnknown10::
  INCBIN cUnknown10
PtrListTerrain::
  INCBIN cTerrain
PtrListAttacks::
  INCBIN cAttacks
PtrListCharacterNames::
  INCBIN cCharacterNames
PtrListUnknown14::
  INCBIN cUnknown14
PtrListMedarots::
  INCBIN cMedarots
; F2:7C00, fixed

SECTION "PtrList0", ROMX[$7C00], BANK[$F2]
PtrList0:
  INCBIN cPtrList0

SECTION "PtrList1", ROMX[$4000], BANK[$F3]
PtrList1:
  INCBIN cPtrList1

SECTION "PtrList2", ROMX[$4000], BANK[$F4]
PtrList2:
  INCBIN cPtrList2

SECTION "PtrList3", ROMX[$4000], BANK[$F5]
PtrList3:
  INCBIN cPtrList3
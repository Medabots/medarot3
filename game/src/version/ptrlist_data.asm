INCLUDE "./build/ptrlists/ptrlist_data_constants_{GAMEVERSION}.asm"

SECTION "Pointer List - Unknown00", ROMX[$44fc], BANK[$27]
PtrListUnknown00::
  INCBIN cUnknown00

SECTION "Pointer List - PartsHead", ROMX[$4671], BANK[$23]
PtrListPartsHead::
  INCBIN cPartsHead

SECTION "Pointer List - PartsRArm", ROMX[$529a], BANK[$23]
PtrListPartsRArm::
  INCBIN cPartsRArm

SECTION "Pointer List - PartsLArm", ROMX[$5ec3], BANK[$23]
PtrListPartsLArm::
  INCBIN cPartsLArm

SECTION "Pointer List - PartsLegs", ROMX[$6aec], BANK[$23]
PtrListPartsLegs::
  INCBIN cPartsLegs

SECTION "Pointer List - Attributes", ROMX[$65c0], BANK[$22]
PtrListAttributes::
  INCBIN cAttributes

SECTION "Pointer List - Skills", ROMX[$664c], BANK[$22]
PtrListSkills::
  INCBIN cSkills

SECTION "Pointer List - Movement", ROMX[$669a], BANK[$22]
PtrListMovement::
  INCBIN cMovement

SECTION "Pointer List - Unknown08", ROMX[$66dc], BANK[$22]
PtrListUnknown08::
  INCBIN cUnknown08

SECTION "Pointer List - Personalities", ROMX[$68bc], BANK[$22]
PtrListPersonalities::
  INCBIN cPersonalities

SECTION "Pointer List - Medaforce", ROMX[$6979], BANK[$22]
PtrListMedaforce::
  INCBIN cMedaforce

SECTION "Pointer List - Medals", ROMX[$795b], BANK[$23]
PtrListMedals::
  INCBIN cMedals

SECTION "Pointer List - Unknown0C", ROMX[$6901], BANK[$22]
PtrListUnknown0C::
  INCBIN cUnknown0C

SECTION "Pointer List - Items", ROMX[$7715], BANK[$23]
PtrListItems::
  INCBIN cItems

SECTION "Pointer List - Unknown0E", ROMX[$4000], BANK[$20]
PtrListUnknown0E::
  INCBIN cUnknown0E

SECTION "Pointer List - Medarotters", ROMX[$4328], BANK[$20]
PtrListMedarotters::
  INCBIN cMedarotters

SECTION "Pointer List - Unknown10", ROMX[$4ea4], BANK[$20]
PtrListUnknown10::
  INCBIN cUnknown10

SECTION "Pointer List - Terrain", ROMX[$7a23], BANK[$23]
PtrListTerrain::
  INCBIN cTerrain

SECTION "Pointer List - Attacks", ROMX[$7a80], BANK[$23]
PtrListAttacks::
  INCBIN cAttacks

SECTION "Pointer List - CharacterNames", ROMX[$4000], BANK[$21]
PtrListCharacterNames::
  INCBIN cCharacterNames

SECTION "Pointer List - Unknown14", ROMX[$461b], BANK[$21]
PtrListUnknown14::
  INCBIN cUnknown14

SECTION "Pointer List - Medarots", ROMX[$4000], BANK[$23]
PtrListMedarots::
  INCBIN cMedarots

SECTION "Pointer List - GlossaryTerms", ROMX[$60d5], BANK[$07]
PtrListGlossaryTerms::
  INCBIN cGlossaryTerms


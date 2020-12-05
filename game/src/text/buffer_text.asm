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
  dbw BANK(PtrListUnknown00), PtrListUnknown00
  dbw BANK(PtrListPartsHead), PtrListPartsHead
  dbw BANK(PtrListPartsRArm), PtrListPartsRArm
  dbw BANK(PtrListPartsLArm), PtrListPartsLArm
  dbw BANK(PtrListPartsLegs), PtrListPartsLegs
  dbw BANK(PtrListAttributes), PtrListAttributes
  dbw BANK(PtrListSkills), PtrListSkills
  dbw BANK(PtrListMovement), PtrListMovement
  dbw BANK(PtrListUnknown08), PtrListUnknown08
  dbw BANK(PtrListPersonalities), PtrListPersonalities
  dbw BANK(PtrListMedaforce), PtrListMedaforce
  dbw BANK(PtrListMedals), PtrListMedals
  dbw BANK(PtrListUnknown0C), PtrListUnknown0C
  dbw BANK(PtrListItems), PtrListItems
  dbw BANK(PtrListUnknown0E), PtrListUnknown0E
  dbw BANK(PtrListMedarotters), PtrListMedarotters
  dbw BANK(PtrListUnknown10), PtrListUnknown10
  dbw BANK(PtrListTerrain), PtrListTerrain
  dbw BANK(PtrListAttacks), PtrListAttacks
  dbw BANK(PtrListCharacterNames), PtrListCharacterNames
  dbw BANK(PtrListUnknown14), PtrListUnknown14
  dbw BANK(PtrListMedarots), PtrListMedarots

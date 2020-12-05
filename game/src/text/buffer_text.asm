INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "List Text Buffering", WRAM0[$C540]
W_ListItemIndexForBuffering:: ds 1
W_ListItemInitialOffsetForBuffering:: ds 1
W_ListItemBufferArea:: ds $C

SECTION "Buffer Text From List", ROM0[$264B]
BufferTextFromList::
  ; Arguments
  ;   b = pointer list index (idx)
  ;   c = max length
  ;   [W_ListItemIndexForBuffering]
  ;   [W_ListItemInitialOffsetForBuffering]

  ; Get PointerList address from table
  xor a
  ld d, a
  ld e, b
  ld hl, .table
  call .load_triple_byte_pointer_and_bankswap

  ; Get content's address from PointerList
  ld a, [W_ListItemIndexForBuffering]
  ld e, a ; d is still 0
  call .load_triple_byte_pointer_and_bankswap
  ; Copy content into buffer
  ld a, [W_ListItemInitialOffsetForBuffering]
  ld e, a ; d is still 0
  add hl, de
  ld de, W_ListItemBufferArea
.copyLoop
  ld a, [hli]
  ld [de], a
  inc de
  dec c
  jr nz, .copyLoop
  ret

.load_triple_byte_pointer_and_bankswap
  add hl, de ; 3 byte pointers
  add hl, de
  add hl, de 
  ld a, [hli]
  ld e, a ; We cannot switch banks until after retrieving the pointer
  ld a, [hli] 
  ld h, [hl]
  ld l, a
  ld a, e
  rst $10
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

.free
REPT $26B7 - .free
  nop
ENDR
SECTION "State Machine Indexes", WRAM0[$C480]
CoreStateIndex:: ds 1
CoreSubStateIndex:: ds 1

SECTION "Increment Substate Index", ROM0[$0C7C]
IncSubStateIndex::
  ld a, [CoreSubStateIndex]
  inc a
  ld [CoreSubStateIndex], a
  ret
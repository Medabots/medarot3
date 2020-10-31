SECTION "State Machine Indexes", WRAM0[$C480]
W_CoreStateIndex:: ds 1
W_CoreSubStateIndex:: ds 1

SECTION "Increment Substate Index", ROM0[$0C7C]
IncSubStateIndex::
  ld a, [W_CoreSubStateIndex]
  inc a
  ld [W_CoreSubStateIndex], a
  ret
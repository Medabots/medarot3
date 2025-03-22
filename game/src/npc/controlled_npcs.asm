INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Swap Player Name with NPCs", ROMX[$4564], BANK[$08]
NPCSwapPlayerName::
  ld b, $01
  call $51a9
  ld a, [$cd44]
  or a
  jr nz, .load_npc_name
  ld hl, $c665
  ld de, W_PlayerName
  ld bc, $9
  call memcpy
  jr .return
.load_npc_name
  cp $05
  jr nc, .return
  dec a
  ld b, $00
  ld c, a
  ld h, b
  ld l, c
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  add hl, bc
  ld bc, .table
  add hl, bc
  ld de, W_PlayerName
  ld bc, $9
  call memcpy
.return
  ld a, [$cd44]
  call $5317
  ret
.table
  ; 8 characters + terminator
  db "Erika", $CB, $00, $00, $00 ; Erika (アリカ)
  db "Koji", $CB, $00, $00, $00, $00 ; Koji  (コウジ)
  db "Karin", $CB, $00, $00, $00 ; Karin (カリン)
  db "Samantha", $CB ; Kikuhime (キクヒメ)
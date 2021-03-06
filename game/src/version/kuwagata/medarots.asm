INCLUDE "game/src/common/constants.asm"

SECTION "Medarot Helper Functions 2 (Kuwagata)", ROMX[$4B34], BANK[$07]
CheckForStarterMedarot::
  ld a, 5
  rst 8
  ld de, $D000
  ld b, 9

.loop
  ld a, [de]
  cp 3
  jr z, .fullyEquippedMedarotFound

.nextMedarot
  ld hl, M_MedarotSlotLength
  add hl, de
  ld d, h
  ld e, l
  dec b
  jr nz, .loop
  ld a, 1
  ret

.fullyEquippedMedarotFound
  ld a, 1
  cp 2
  jr nc, .jumpThatWillNeverFire
  ld hl, M_MedarotMedal
  add hl, de
  ld a, [hl]
  cp 0
  jr nz, .nextMedarot

.jumpThatWillNeverFire
  xor a
  ret

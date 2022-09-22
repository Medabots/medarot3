; macro for putting a byte then a word
dbw: MACRO
  db \1
  dw \2
  ENDM

; macro for putting a word then a byte
dwb: MACRO
  dw \1
  db \2
  ENDM

dbww: MACRO
  db \1
  dw \2
  dw \3
  ENDM

dbwb: MACRO
  db \1
  dw \2
  db \3
  ENDM

dcolor: MACRO
  dw ((\3) << 10) + ((\2) << 5) + (\1)
  ENDM
    
;CGB palette color indexes are stored as big-endian words for some reason
dpalette: MACRO
  dw (\1 >> 8) | ((\1 & $FF) << 8)
  dw (\2 >> 8) | ((\2 & $FF) << 8)
  dw (\3 >> 8) | ((\3 & $FF) << 8)
  dw (\4 >> 8) | ((\4 & $FF) << 8)
  dw (\5 >> 8) | ((\5 & $FF) << 8)
  dw (\6 >> 8) | ((\6 & $FF) << 8)
  dw (\7 >> 8) | ((\7 & $FF) << 8)
  dw (\8 >> 8) | ((\8 & $FF) << 8)
  ENDM

padend: MACRO
  .end\@
    REPT \1 - .end\@
      nop
    ENDR
  ENDM

creditconf: MACRO
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ENDM

creditconfset: MACRO
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, \2
  ld [hl], a
  ENDM

creditconfreset: MACRO
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  xor a
  ld [hl], a
  ENDM

creditconfinc: MACRO
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  inc a
  ld [hl], a
  ENDM

creditconfdec: MACRO
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  dec a
  ld [hl], a
  ENDM

creditconfsetfroma: MACRO
  push af
  ld de, \1
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  pop af
  ld [hl], a
  ENDM

creditconftextcheck: MACRO
  ld de, M_CreditConfigTextIndex
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  cp $FF
  ENDM

credittext: MACRO
  ld de, M_CreditConfigTextIndex
  ld a, [W_CreditsConfigAddressBuffer]
  ld h, a
  ld a, [W_CreditsConfigAddressBuffer + 1]
  ld l, a
  add hl, de
  ld a, [hl]
  ld hl, PtrListCredits
  rst $30
  ld de, \1
  add hl, de
  ENDM

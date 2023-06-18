INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Sound Sample Data WRAM", WRAM0[$CF8A]
W_Sound_SampleFragmentCount: ds 1

SECTION "Sound Sample Data Functions", ROM0[$3779]
Sound_PlaySample::
  push af
  push bc
  push de
  push hl
  xor a
  ldh [H_RegNR52], a ;Disable sound hardware, resetting all state
  call Sound_OpenSampleData
  
.fragmentLoop
  call Sound_ExitSampleMode ; In Telefang this call is missing.
  call Sound_PrepareSampleFragment
  di ; In Telefang this is before the call to the Sound_PlaySample wrapper function instead.
  call Sound_PlaySampleFragment
  ei ; In Telefang this is after the call to the Sound_PlaySample wrapper function instead.
  ld a, [W_Sound_SampleFragmentCount]
  dec a
  ld [W_Sound_SampleFragmentCount], a
  jr nz, .fragmentLoop
  call Sound_ExitSampleMode
  pop hl
  pop de
  pop bc
  pop af
  rst $18  ; Absent from Telefang (since Telefang uses a wrapper function instead).
  ret

Sound_OpenSampleData::
  ld hl, Sound_SampleMetatable
  ld d, 0
  ldh a, [H_SoundSampleSelect]
  dec a
  ld e, a
  add hl, de
  add hl, de
  ld a, [hli]
  ld d, a
  ld a, [hli]
  ld h, a
  ld l, d
  ld a, [hli]
  ld [W_Sound_SampleFragmentCount], a
  ret

;Assumes that your sample occupies the start of its bank.
Sound_PrepareSampleFragment::
  ld a, [hli]
  rst $10
  ld a, [hli]
  ld c, a
  ld a, [hli]
  ld b, a
  ld de, $4000
  ld a, l
  ld [$CF8B], a
  ld a, h
  ld [$CF8C], a ;Not sure what this does, doesn't seem to do anything
  ret

;Play a sample through CH1 and 2.
;Sample data exists at [DE] for BC samples as 4-bit packed data.
Sound_PlaySampleFragment::
  ld a, $8F ; $80 in Telefang.
  ldh [H_RegNR52], a ;Enable sound, enable all channels
  ld a, $77
  ldh [H_RegNR50], a ;Disable cart audio, full volume elsewhere
  ld a, $FF
  ldh [H_RegNR51], a ;Route both channels to left and right output
  ld a, 0
  ldh [H_RegNR10], a ;Disable CH1 sweep
  ld a, $80
  ldh [H_RegNR11], a
  ldh [H_RegNR21], a ;50% duty cycle, zero length
  ld a, $FF
  ldh [H_RegNR13], a
  ldh [H_RegNR23], a
  ld a, $78
  ldh [H_RegNR12], a
  ldh [H_RegNR22], a ;Envelope 0xFF, sweep disabled
  ld a, $87
  ldh [H_RegNR14], a
  ldh [H_RegNR24], a ;Frequency 0x2FF, consecutive mode
  
.pcmLoop
  ld a, [de]
  and $F0
  or 8
  call Sound_CycleDelay
  ldh [H_RegNR12], a
  ldh [H_RegNR22], a
  ld a, $FF ; 0 in Telefang.
  ldh [H_RegNR13], a
  ldh [H_RegNR23], a
  ld a, $81 ; $80 in Telefang.
  ldh [H_RegNR14], a
  ldh [H_RegNR24], a
  dec bc
  ld a, c
  or b
  ret z
  ld a, [de]
  sla a
  sla a
  sla a
  sla a
  or 8
  nop
  nop
  nop
  call Sound_CycleDelay
  ldh [H_RegNR12], a
  ldh [H_RegNR22], a
  ld a, $FF ; 0 in Telefang.
  ldh [H_RegNR13], a
  ldh [H_RegNR23], a
  ld a, $81 ; $80 in Telefang.
  ldh [H_RegNR14], a
  ldh [H_RegNR24], a
  dec bc
  ld a, c
  or b
  ret z
  inc de
  jr .pcmLoop
  
Sound_CycleDelay:: ; This is 264 clocks longer than in Telefang.
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  push hl
  pop hl
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  ret

Sound_ExitSampleMode::
  xor a
  ldh [H_RegNR12], a
  ldh [H_RegNR22], a
  ldh [H_SoundSampleSelect], a
  ld a, $FF
  ldh [H_RegNR13], a
  ldh [H_RegNR23], a
  ld a, $87
  ldh [H_RegNR14], a
  ldh [H_RegNR24], a
  ret

Sound_SampleMetatable::
  dw .sample00
  dw .sample01
  dw .sample02
  dw .sample03
  dw .sample04
  dw .sample05
  dw .sample06
  dw .sample07
  dw .sample08
  dw .sample09
  dw .sample0A
  dw .sample0B
  dw .sample0C
  dw .sample0D
  dw .sample0E
  dw .sample0F
  dw .sample10
  dw .sample11
  dw .sample12
  dw .sample13
  dw .sample14
  dw .sample15
  dw .sample16
  dw .sample17
  dw .sample18
  dw .sample19
  dw .sample1A
  dw .sample1B
  dw .sample1C
  dw .sample1D
  dw .sample1E
  dw .sample1F
  dw .sample20
  dw .sample21
  dw .sample22
  dw .sample23
  dw .sample24

.sample00
  db 1
  dbw $B0, $631F

.sample01
  db 2
  dbw $B1, $4E46
  dbw $B2, $6186

.sample02
  db 1
  dbw $B3, $3DA6

.sample03
  db 1
  dbw $B4, $3E43

.sample04
  db 1
  dbw $B5, $52F2

.sample05
  db 2
  dbw $B6, $50C6
  dbw $B7, $481B

.sample06
  db 1
  dbw $B8, $7041

.sample07
  db 2
  dbw $B9, $4A1A
  dbw $BA, $4436

.sample08
  db 1
  dbw $BB, $38D2

.sample09
  db 1
  dbw $BC, $2668

.sample0A
  db 2
  dbw $BD, $6C5B
  dbw $BE, $3DEE
  
.sample0B
  db 1
  dbw $BF, $693A

.sample0C
  db 2
  dbw $C0, $3B24
  dbw $C1, $2817

.sample0D
  db 1
  dbw $C2, $5276

.sample0E
  db 2
  dbw $C3, $5CCE
  dbw $C4, $7A8D

.sample0F
  db 2
  dbw $C5, $5927
  dbw $C6, $73BB

.sample10
  db 2
  dbw $C7, $5A56
  dbw $C8, $6BA4

.sample11
  db 2
  dbw $C9, $547E
  dbw $CA, $7973

.sample12
  db 2
  dbw $CB, $54DD
  dbw $CC, $6D42

.sample13
  db 2
  dbw $CD, $4DEC
  dbw $CE, $6CA5

.sample14
  db 1
  dbw $CF, $7691

.sample15
  db 3
  dbw $D0, $41F6
  dbw $D1, $6BC8
  dbw $D2, $658C

.sample16
  db 3
  dbw $D3, $47A3
  dbw $D4, $65A1
  dbw $D5, $644D

.sample17
  db 1
  dbw $D6, $7939

.sample18
  db 3
  dbw $D7, $622A
  dbw $D8, $68C5
  dbw $D9, $7AD9

.sample19
  db 2
  dbw $DA, $6D24
  dbw $DB, $5A54

.sample1A
  db 2
  dbw $DC, $512A
  dbw $DD, $1A9D

.sample1B
  db 2
  dbw $DE, $66EE
  dbw $DF, $51C2

.sample1C
  db 2
  dbw $E0, $6839
  dbw $E1, $62D4

.sample1D
  db 2
  dbw $E2, $5039
  dbw $E3, $5C75

.sample1E
  db 3
  dbw $E4, $40D4
  dbw $E5, $5AE4
  dbw $E6, $4CD9

.sample1F
  db 1
  dbw $E7, $5B30

.sample20
  db 1
  dbw $E8, $61F9

.sample21
  db 1
  dbw $E9, $30DB

.sample22
  db 1
  dbw $EA, $4189

.sample23
  db 3
  dbw $EB, $760E
  dbw $EC, $6473
  dbw $ED, $3EB8

.sample24
  db 3
  dbw $EE, $7658
  dbw $EF, $7754
  dbw $F0, $73BC

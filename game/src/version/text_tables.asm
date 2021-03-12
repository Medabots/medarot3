INCLUDE "./build/dialog/text_table_constants_{GAMEVERSION}.asm"

SECTION "TextSection00", ROMX[$4000], BANK[$24]
TextSection00:
  INCBIN cTextSection00

SECTION "TextSection01", ROMX[$59ec], BANK[$24]
TextSection01:
  INCBIN cTextSection01

SECTION "TextSection02", ROMX[$4000], BANK[$25]
TextSection02:
  INCBIN cTextSection02

SECTION "TextSection03", ROMX[$58e1], BANK[$25]
TextSection03:
  INCBIN cTextSection03

SECTION "TextSection04", ROMX[$5da7], BANK[$25]
TextSection04:
  INCBIN cTextSection04

SECTION "TextSection05", ROMX[$63d0], BANK[$25]
TextSection05:
  INCBIN cTextSection05

SECTION "TextSection06", ROMX[$6f2c], BANK[$25]
TextSection06:
  INCBIN cTextSection06

SECTION "TextSection08", ROMX[$4000], BANK[$47]
TextSection08:
  INCBIN cTextSection08

SECTION "TextSection09", ROMX[$4000], BANK[$76]
TextSection09:
  INCBIN cTextSection09

SECTION "TextSection10", ROMX[$4000], BANK[$77]
TextSection10:
  INCBIN cTextSection10

SECTION "TextSection11", ROMX[$4000], BANK[$78]
TextSection11:
  INCBIN cTextSection11

SECTION "TextSection12", ROMX[$4000], BANK[$79]
TextSection12:
  INCBIN cTextSection12

SECTION "TextSection13", ROMX[$4000], BANK[$7a]
TextSection13:
  INCBIN cTextSection13

SECTION "TextSection14", ROMX[$4000], BANK[$7b]
TextSection14:
  INCBIN cTextSection14

SECTION "TextSection15", ROMX[$4000], BANK[$7c]
TextSection15:
  INCBIN cTextSection15

SECTION "TextSection16", ROMX[$4000], BANK[$7d]
TextSection16:
  INCBIN cTextSection16

SECTION "TextSection17", ROMX[$4000], BANK[$7e]
TextSection17:
  INCBIN cTextSection17

SECTION "TextSection18", ROMX[$4000], BANK[$7f]
TextSection18:
  INCBIN cTextSection18

SECTION "TextSection19", ROMX[$4000], BANK[$80]
TextSection19:
  INCBIN cTextSection19

SECTION "TextSection20", ROMX[$4000], BANK[$81]
TextSection20:
  INCBIN cTextSection20

SECTION "TextSection21", ROMX[$4000], BANK[$82]
TextSection21:
  INCBIN cTextSection21

SECTION "TextSection22", ROMX[$4000], BANK[$83]
TextSection22:
  INCBIN cTextSection22

SECTION "TextSection23", ROMX[$4000], BANK[$84]
TextSection23:
  INCBIN cTextSection23

SECTION "TextSection24", ROMX[$4000], BANK[$85]
TextSection24:
  INCBIN cTextSection24

SECTION "TextSection25", ROMX[$4000], BANK[$86]
TextSection25:
  INCBIN cTextSection25

SECTION "TextSection26", ROMX[$4000], BANK[$87]
TextSection26:
  INCBIN cTextSection26

SECTION "TextSection27", ROMX[$4000], BANK[$88]
TextSection27:
  INCBIN cTextSection27

SECTION "TextSection28", ROMX[$4000], BANK[$89]
TextSection28:
  INCBIN cTextSection28

SECTION "TextSection29", ROMX[$4000], BANK[$8a]
TextSection29:
  INCBIN cTextSection29

SECTION "TextSection30", ROMX[$4000], BANK[$8b]
TextSection30:
  INCBIN cTextSection30

SECTION "TextSection31", ROMX[$4000], BANK[$8c]
TextSection31:
  INCBIN cTextSection31

SECTION "TextSection32", ROMX[$4000], BANK[$8d]
TextSection32:
  INCBIN cTextSection32

SECTION "TextSection33", ROMX[$4000], BANK[$8e]
TextSection33:
  INCBIN cTextSection33

SECTION "TextSection34", ROMX[$4000], BANK[$8f]
TextSection34:
  INCBIN cTextSection34

SECTION "TextSection35", ROMX[$4000], BANK[$90]
TextSection35:
  INCBIN cTextSection35

SECTION "TextSection36", ROMX[$4000], BANK[$91]
TextSection36:
  INCBIN cTextSection36

SECTION "TextSection37", ROMX[$4000], BANK[$a6]
TextSection37:
  INCBIN cTextSection37

SECTION "Dialog Text Tables", ROM0[$20a0]
TextTableBanks:: ; 0x20a0
  db BANK(TextSection00)
  db BANK(TextSection01)
  db BANK(TextSection02)
  db BANK(TextSection03)
  db BANK(TextSection04)
  db BANK(TextSection05)
  db BANK(TextSection06)
  db BANK(TextSection07)
  db BANK(TextSection08)
  db BANK(TextSection09)
  db BANK(TextSection10)
  db BANK(TextSection11)
  db BANK(TextSection12)
  db BANK(TextSection13)
  db BANK(TextSection14)
  db BANK(TextSection15)
  db BANK(TextSection16)
  db BANK(TextSection17)
  db BANK(TextSection18)
  db BANK(TextSection19)
  db BANK(TextSection20)
  db BANK(TextSection21)
  db BANK(TextSection22)
  db BANK(TextSection23)
  db BANK(TextSection24)
  db BANK(TextSection25)
  db BANK(TextSection26)
  db BANK(TextSection27)
  db BANK(TextSection28)
  db BANK(TextSection29)
  db BANK(TextSection30)
  db BANK(TextSection31)
  db BANK(TextSection32)
  db BANK(TextSection33)
  db BANK(TextSection34)
  db BANK(TextSection35)
  db BANK(TextSection36)
  db BANK(TextSection37)

TextTableOffsets::
  dw TextSection00
  dw TextSection01
  dw TextSection02
  dw TextSection03
  dw TextSection04
  dw TextSection05
  dw TextSection06
  dw TextSection07
  dw TextSection08
  dw TextSection09
  dw TextSection10
  dw TextSection11
  dw TextSection12
  dw TextSection13
  dw TextSection14
  dw TextSection15
  dw TextSection16
  dw TextSection17
  dw TextSection18
  dw TextSection19
  dw TextSection20
  dw TextSection21
  dw TextSection22
  dw TextSection23
  dw TextSection24
  dw TextSection25
  dw TextSection26
  dw TextSection27
  dw TextSection28
  dw TextSection29
  dw TextSection30
  dw TextSection31
  dw TextSection32
  dw TextSection33
  dw TextSection34
  dw TextSection35
  dw TextSection36
  dw TextSection37

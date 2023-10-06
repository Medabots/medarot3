INCLUDE "./build/dialog/text_table_constants_{GAMEVERSION}.asm"

SECTION "Text Pointers 0", ROMX[$4000], BANK[$F1]
TextSection00:
  INCBIN cTextSection00
TextSection01:
  INCBIN cTextSection01
TextSection02:
  INCBIN cTextSection02
TextSection03:
  INCBIN cTextSection03
TextSection04:
  INCBIN cTextSection04
TextSection05:
  INCBIN cTextSection05
TextSection06:
  INCBIN cTextSection06
TextSection07:
  INCBIN cTextSection07
TextSection08:
  INCBIN cTextSection08
TextSection09:
  INCBIN cTextSection09
TextSection10:
  INCBIN cTextSection10
TextSection11:
  INCBIN cTextSection11
TextSection12:
  INCBIN cTextSection12
TextSection13:
  INCBIN cTextSection13
TextSection14:
  INCBIN cTextSection14
TextSection15:
  INCBIN cTextSection15
TextSection16:
  INCBIN cTextSection16
TextSection17:
  INCBIN cTextSection17
TextSection18:
  INCBIN cTextSection18
TextSection19:
  INCBIN cTextSection19
TextSection20:
  INCBIN cTextSection20
TextSection21:
  INCBIN cTextSection21
TextSection22:
  INCBIN cTextSection22
TextSection23:
  INCBIN cTextSection23
TextSection24:
  INCBIN cTextSection24

SECTION "Text Pointers 1", ROMX[$4000], BANK[$F2]
TextSection25:
  INCBIN cTextSection25
TextSection26:
  INCBIN cTextSection26
TextSection27:
  INCBIN cTextSection27
TextSection28:
  INCBIN cTextSection28
TextSection29:
  INCBIN cTextSection29
TextSection30:
  INCBIN cTextSection30
TextSection31:
  INCBIN cTextSection31
TextSection32:
  INCBIN cTextSection32
TextSection33:
  INCBIN cTextSection33
TextSection34:
  INCBIN cTextSection34
TextSection35:
  INCBIN cTextSection35
TextSection36:
  INCBIN cTextSection36
TextSection37:
  INCBIN cTextSection37
; F2:5E4B, start of PtrList Pointer section

SECTION "Text0", ROMX[$4000], BANK[$76]
Text0:
  INCBIN cText0

SECTION "Text1", ROMX[$4000], BANK[$77]
Text1:
  INCBIN cText1

SECTION "Text2", ROMX[$4000], BANK[$78]
Text2:
  INCBIN cText2

SECTION "Text3", ROMX[$4000], BANK[$79]
Text3:
  INCBIN cText3

SECTION "Text4", ROMX[$4000], BANK[$7A]
Text4:
  INCBIN cText4

SECTION "Text5", ROMX[$4000], BANK[$7B]
Text5:
  INCBIN cText5

SECTION "Text6", ROMX[$4000], BANK[$7C]
Text6:
  INCBIN cText6

SECTION "Text7", ROMX[$4000], BANK[$7D]
Text7:
  INCBIN cText7

SECTION "Text8", ROMX[$4000], BANK[$7E]
Text8:
  INCBIN cText8

SECTION "Text9", ROMX[$4000], BANK[$7F]
Text9:
  INCBIN cText9

SECTION "Text10", ROMX[$4000], BANK[$80]
Text10:
  INCBIN cText10

SECTION "Text11", ROMX[$4000], BANK[$81]
Text11:
  INCBIN cText11

SECTION "Text12", ROMX[$4000], BANK[$82]
Text12:
  INCBIN cText12

SECTION "Text13", ROMX[$4000], BANK[$83]
Text13:
  INCBIN cText13

SECTION "Text14", ROMX[$4000], BANK[$84]
Text14:
  INCBIN cText14

SECTION "Text15", ROMX[$4000], BANK[$85]
Text15:
  INCBIN cText15

SECTION "Text16", ROMX[$4000], BANK[$86]
Text16:
  INCBIN cText16

SECTION "Text17", ROMX[$4000], BANK[$87]
Text17:
  INCBIN cText17

SECTION "Text18", ROMX[$4000], BANK[$88]
Text18:
  INCBIN cText18

SECTION "Text19", ROMX[$4000], BANK[$89]
Text19:
  INCBIN cText19

SECTION "Text20", ROMX[$4000], BANK[$8A]
Text20:
  INCBIN cText20

SECTION "Text21", ROMX[$4000], BANK[$8B]
Text21:
  INCBIN cText21

SECTION "Text22", ROMX[$4000], BANK[$8C]
Text22:
  INCBIN cText22

SECTION "Text23", ROMX[$4000], BANK[$8D]
Text23:
  INCBIN cText23

SECTION "Text24", ROMX[$4000], BANK[$8E]
Text24:
  INCBIN cText24

SECTION "Text25", ROMX[$4000], BANK[$8F]
Text25:
  INCBIN cText25

SECTION "Text26", ROMX[$4000], BANK[$90]
Text26:
  INCBIN cText26

SECTION "Text27", ROMX[$4000], BANK[$91]
Text27:
  INCBIN cText27

SECTION "Text28", ROMX[$4000], BANK[$f6]
Text28:
  INCBIN cText28

SECTION "Text29", ROMX[$4000], BANK[$f7]
Text29:
  INCBIN cText29

SECTION "Text30", ROMX[$4000], BANK[$f8]
Text30:
  INCBIN cText30

SECTION "Text31", ROMX[$4000], BANK[$f9]
Text31:
  INCBIN cText31

SECTION "Text32", ROMX[$4000], BANK[$fa]
Text32:
  INCBIN cText32

SECTION "Text33", ROMX[$63D0], BANK[$92]
Text33:
  INCBIN cText33

SECTION "Text34", ROMX[$4000], BANK[$93]
Text34:
  INCBIN cText34

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

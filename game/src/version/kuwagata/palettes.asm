INCLUDE "game/src/common/constants.asm"
INCLUDE "game/src/common/macros.asm"

SECTION "Palette Color Table (Kuwagata)", ROMX[$4000], BANK[$35]
BGPPaletteColorTable::
; Palette 0
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
; Palette 1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 3
  dcolor 28, 31, 24
  dcolor 1, 19, 31
  dcolor 0, 7, 29
  dcolor 0, 0, 0
; Palette 4
  dcolor 31, 31, 31
  dcolor 22, 22, 22
  dcolor 14, 14, 14
  dcolor 0, 0, 0
; Palette 5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 10
  dcolor 29, 29, 31
  dcolor 17, 17, 24
  dcolor 26, 4, 6
  dcolor 4, 2, 0
; Palette 11
  dcolor 31, 31, 28
  dcolor 29, 19, 8
  dcolor 19, 7, 0
  dcolor 4, 2, 0
; Palette 12
  dcolor 31, 27, 26
  dcolor 22, 17, 16
  dcolor 17, 9, 8
  dcolor 4, 2, 0
; Palette 13
  dcolor 29, 29, 31
  dcolor 19, 19, 26
  dcolor 17, 9, 8
  dcolor 4, 2, 0
; Palette 14
  dcolor 21, 25, 25
  dcolor 15, 19, 19
  dcolor 17, 9, 8
  dcolor 4, 2, 0
; Palette 15
  dcolor 21, 25, 25
  dcolor 15, 19, 19
  dcolor 11, 15, 15
  dcolor 4, 2, 0
; Palette 16
  dcolor 25, 28, 31
  dcolor 29, 19, 8
  dcolor 7, 10, 26
  dcolor 4, 2, 0
; Palette 17
  dcolor 31, 31, 27
  dcolor 31, 17, 8
  dcolor 27, 7, 0
  dcolor 0, 0, 0
; Palette 18
  dcolor 31, 31, 31
  dcolor 31, 18, 9
  dcolor 22, 9, 0
  dcolor 0, 0, 8
; Palette 19
  dcolor 31, 31, 31
  dcolor 31, 18, 9
  dcolor 11, 16, 29
  dcolor 0, 0, 8
; Palette 1A
  dcolor 31, 31, 31
  dcolor 31, 18, 9
  dcolor 14, 5, 0
  dcolor 0, 0, 8
; Palette 1B
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 31, 15, 15
  dcolor 21, 12, 12
; Palette 1C
  dcolor 31, 31, 31
  dcolor 31, 18, 9
  dcolor 31, 8, 20
  dcolor 0, 0, 8
; Palette 1D
  dcolor 31, 31, 31
  dcolor 31, 18, 9
  dcolor 3, 9, 27
  dcolor 0, 0, 8
; Palette 1E
  dcolor 31, 31, 31
  dcolor 31, 18, 9
  dcolor 20, 4, 4
  dcolor 0, 0, 8
; Palette 1F
  dcolor 31, 31, 27
  dcolor 31, 17, 8
  dcolor 27, 7, 0
  dcolor 0, 0, 0
; Palette 20
  dcolor 12, 0, 0
  dcolor 31, 16, 0
  dcolor 20, 0, 0
  dcolor 0, 0, 0
; Palette 21
  dcolor 31, 22, 0
  dcolor 8, 14, 31
  dcolor 2, 6, 24
  dcolor 0, 0, 0
; Palette 22
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 23
  dcolor 18, 23, 12
  dcolor 15, 18, 8
  dcolor 8, 12, 2
  dcolor 4, 6, 0
; Palette 24
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 25
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 26
  dcolor 28, 31, 24
  dcolor 1, 19, 31
  dcolor 0, 7, 29
  dcolor 0, 0, 0
; Palette 27
  dcolor 31, 22, 0
  dcolor 8, 14, 31
  dcolor 2, 6, 24
  dcolor 0, 0, 0
; Palette 28
  dcolor 31, 22, 0
  dcolor 26, 8, 8
  dcolor 19, 0, 0
  dcolor 0, 0, 0
; Palette 29
  dcolor 31, 22, 0
  dcolor 4, 20, 12
  dcolor 0, 15, 0
  dcolor 0, 0, 0
; Palette 2A
  dcolor 31, 31, 31
  dcolor 21, 23, 25
  dcolor 12, 14, 16
  dcolor 0, 0, 0
; Palette 2B
  dcolor 26, 24, 24
  dcolor 16, 13, 13
  dcolor 9, 7, 7
  dcolor 0, 0, 0
; Palette 2C
  dcolor 26, 26, 31
  dcolor 12, 16, 22
  dcolor 2, 5, 20
  dcolor 0, 0, 0
; Palette 2D
  dcolor 31, 29, 26
  dcolor 31, 26, 0
  dcolor 25, 11, 0
  dcolor 0, 0, 0
; Palette 2E
  dcolor 31, 27, 27
  dcolor 31, 17, 19
  dcolor 23, 0, 0
  dcolor 0, 0, 0
; Palette 2F
  dcolor 31, 25, 0
  dcolor 31, 20, 7
  dcolor 31, 0, 0
  dcolor 0, 0, 0
; Palette 30
  dcolor 30, 30, 31
  dcolor 31, 20, 7
  dcolor 7, 7, 16
  dcolor 0, 0, 0
; Palette 31
  dcolor 30, 30, 31
  dcolor 31, 25, 15
  dcolor 17, 6, 2
  dcolor 0, 0, 0
; Palette 32
  dcolor 31, 9, 18
  dcolor 31, 25, 15
  dcolor 17, 27, 31
  dcolor 0, 0, 0
; Palette 33
  dcolor 30, 30, 31
  dcolor 31, 23, 10
  dcolor 8, 8, 16
  dcolor 0, 0, 0
; Palette 34
  dcolor 31, 31, 11
  dcolor 31, 23, 10
  dcolor 17, 17, 2
  dcolor 0, 0, 0
; Palette 35
  dcolor 31, 31, 31
  dcolor 31, 24, 22
  dcolor 26, 9, 0
  dcolor 0, 0, 0
; Palette 36
  dcolor 31, 26, 0
  dcolor 31, 24, 22
  dcolor 31, 17, 30
  dcolor 0, 0, 0
; Palette 37
  dcolor 31, 31, 31
  dcolor 31, 25, 15
  dcolor 25, 10, 0
  dcolor 0, 0, 0
; Palette 38
  dcolor 17, 20, 31
  dcolor 31, 25, 15
  dcolor 25, 10, 0
  dcolor 0, 0, 0
; Palette 39
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 3A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 3B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 3C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 3D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 3E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 3F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 40
  dcolor 31, 31, 31
  dcolor 31, 15, 21
  dcolor 4, 28, 23
  dcolor 1, 6, 4
; Palette 41
  dcolor 31, 31, 31
  dcolor 15, 18, 27
  dcolor 31, 20, 0
  dcolor 0, 4, 8
; Palette 42
  dcolor 31, 31, 31
  dcolor 15, 24, 31
  dcolor 31, 20, 0
  dcolor 8, 0, 0
; Palette 43
  dcolor 31, 31, 31
  dcolor 20, 11, 0
  dcolor 31, 22, 0
  dcolor 3, 0, 8
; Palette 44
  dcolor 31, 31, 31
  dcolor 16, 26, 31
  dcolor 31, 22, 5
  dcolor 0, 0, 9
; Palette 45
  dcolor 31, 31, 31
  dcolor 31, 27, 4
  dcolor 17, 9, 4
  dcolor 9, 3, 0
; Palette 46
  dcolor 31, 31, 31
  dcolor 22, 22, 22
  dcolor 17, 1, 16
  dcolor 6, 0, 5
; Palette 47
  dcolor 31, 31, 31
  dcolor 25, 23, 20
  dcolor 13, 10, 9
  dcolor 6, 0, 0
; Palette 48
  dcolor 31, 31, 31
  dcolor 31, 18, 22
  dcolor 7, 21, 6
  dcolor 0, 7, 2
; Palette 49
  dcolor 31, 31, 31
  dcolor 26, 28, 10
  dcolor 30, 17, 0
  dcolor 7, 6, 0
; Palette 4A
  dcolor 31, 31, 31
  dcolor 22, 19, 25
  dcolor 27, 11, 0
  dcolor 7, 4, 0
; Palette 4B
  dcolor 31, 31, 31
  dcolor 23, 24, 16
  dcolor 0, 20, 14
  dcolor 0, 8, 0
; Palette 4C
  dcolor 31, 31, 31
  dcolor 21, 18, 24
  dcolor 3, 22, 14
  dcolor 0, 2, 8
; Palette 4D
  dcolor 31, 31, 31
  dcolor 31, 25, 9
  dcolor 0, 20, 21
  dcolor 0, 8, 5
; Palette 4E
  dcolor 31, 31, 31
  dcolor 31, 23, 15
  dcolor 1, 21, 7
  dcolor 0, 8, 0
; Palette 4F
  dcolor 31, 31, 31
  dcolor 16, 22, 31
  dcolor 21, 0, 4
  dcolor 0, 0, 8
; Palette 50
  dcolor 31, 31, 31
  dcolor 26, 26, 19
  dcolor 18, 7, 1
  dcolor 9, 5, 1
; Palette 51
  dcolor 31, 31, 31
  dcolor 22, 21, 31
  dcolor 31, 13, 4
  dcolor 7, 0, 0
; Palette 52
  dcolor 31, 31, 31
  dcolor 21, 20, 22
  dcolor 27, 0, 4
  dcolor 0, 1, 9
; Palette 53
  dcolor 31, 31, 31
  dcolor 27, 13, 21
  dcolor 31, 24, 0
  dcolor 7, 0, 0
; Palette 54
  dcolor 31, 31, 31
  dcolor 30, 24, 14
  dcolor 23, 10, 3
  dcolor 8, 0, 0
; Palette 55
  dcolor 31, 31, 31
  dcolor 27, 20, 9
  dcolor 26, 0, 4
  dcolor 12, 4, 3
; Palette 56
  dcolor 31, 31, 31
  dcolor 21, 20, 27
  dcolor 15, 5, 21
  dcolor 0, 0, 9
; Palette 57
  dcolor 31, 31, 31
  dcolor 27, 26, 16
  dcolor 0, 16, 19
  dcolor 0, 5, 8
; Palette 58
  dcolor 31, 31, 31
  dcolor 16, 18, 21
  dcolor 13, 8, 19
  dcolor 0, 0, 9
; Palette 59
  dcolor 31, 31, 31
  dcolor 19, 23, 28
  dcolor 23, 1, 12
  dcolor 8, 1, 0
; Palette 5A
  dcolor 31, 31, 31
  dcolor 31, 24, 18
  dcolor 31, 17, 0
  dcolor 7, 5, 0
; Palette 5B
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 20, 5, 16
  dcolor 5, 0, 6
; Palette 5C
  dcolor 31, 31, 31
  dcolor 31, 26, 6
  dcolor 18, 5, 1
  dcolor 0, 6, 0
; Palette 5D
  dcolor 31, 31, 31
  dcolor 23, 12, 21
  dcolor 8, 23, 15
  dcolor 7, 0, 7
; Palette 5E
  dcolor 31, 31, 31
  dcolor 18, 26, 21
  dcolor 30, 10, 4
  dcolor 9, 2, 0
; Palette 5F
  dcolor 31, 31, 31
  dcolor 21, 16, 21
  dcolor 20, 9, 0
  dcolor 7, 3, 6
; Palette 60
  dcolor 31, 31, 31
  dcolor 31, 20, 25
  dcolor 27, 10, 1
  dcolor 7, 0, 0
; Palette 61
  dcolor 31, 31, 31
  dcolor 15, 18, 21
  dcolor 31, 11, 0
  dcolor 8, 1, 0
; Palette 62
  dcolor 31, 31, 31
  dcolor 21, 16, 30
  dcolor 0, 16, 10
  dcolor 0, 6, 0
; Palette 63
  dcolor 31, 31, 31
  dcolor 27, 19, 22
  dcolor 16, 0, 2
  dcolor 7, 0, 0
; Palette 64
  dcolor 31, 31, 31
  dcolor 31, 27, 3
  dcolor 3, 8, 13
  dcolor 6, 0, 6
; Palette 65
  dcolor 31, 31, 31
  dcolor 19, 21, 29
  dcolor 21, 19, 0
  dcolor 5, 5, 0
; Palette 66
  dcolor 31, 31, 31
  dcolor 13, 26, 15
  dcolor 13, 9, 19
  dcolor 0, 2, 8
; Palette 67
  dcolor 31, 31, 31
  dcolor 31, 21, 12
  dcolor 14, 7, 2
  dcolor 6, 2, 0
; Palette 68
  dcolor 31, 31, 31
  dcolor 23, 19, 21
  dcolor 13, 0, 9
  dcolor 7, 2, 8
; Palette 69
  dcolor 31, 31, 31
  dcolor 19, 22, 27
  dcolor 13, 0, 15
  dcolor 4, 0, 3
; Palette 6A
  dcolor 31, 31, 31
  dcolor 28, 17, 20
  dcolor 21, 0, 9
  dcolor 9, 0, 0
; Palette 6B
  dcolor 31, 31, 31
  dcolor 31, 23, 25
  dcolor 14, 6, 9
  dcolor 4, 0, 3
; Palette 6C
  dcolor 31, 31, 31
  dcolor 30, 23, 19
  dcolor 16, 4, 0
  dcolor 8, 3, 0
; Palette 6D
  dcolor 31, 31, 31
  dcolor 27, 23, 11
  dcolor 20, 9, 1
  dcolor 9, 5, 0
; Palette 6E
  dcolor 31, 31, 31
  dcolor 30, 20, 23
  dcolor 0, 17, 7
  dcolor 0, 6, 0
; Palette 6F
  dcolor 31, 31, 31
  dcolor 7, 24, 14
  dcolor 21, 9, 3
  dcolor 8, 0, 0
; Palette 70
  dcolor 31, 31, 31
  dcolor 30, 23, 13
  dcolor 16, 8, 1
  dcolor 8, 2, 0
; Palette 71
  dcolor 31, 31, 31
  dcolor 11, 22, 27
  dcolor 0, 22, 4
  dcolor 0, 5, 0
; Palette 72
  dcolor 31, 31, 31
  dcolor 21, 14, 27
  dcolor 31, 24, 0
  dcolor 6, 0, 8
; Palette 73
  dcolor 31, 31, 31
  dcolor 15, 16, 25
  dcolor 27, 13, 0
  dcolor 4, 2, 0
; Palette 74
  dcolor 31, 31, 31
  dcolor 29, 22, 5
  dcolor 16, 19, 24
  dcolor 0, 0, 12
; Palette 75
  dcolor 31, 31, 31
  dcolor 29, 25, 8
  dcolor 24, 10, 0
  dcolor 6, 3, 0
; Palette 76
  dcolor 31, 31, 31
  dcolor 15, 19, 28
  dcolor 22, 13, 0
  dcolor 4, 2, 0
; Palette 77
  dcolor 31, 31, 31
  dcolor 27, 21, 0
  dcolor 27, 5, 0
  dcolor 6, 0, 2
; Palette 78
  dcolor 31, 31, 31
  dcolor 18, 23, 31
  dcolor 29, 17, 2
  dcolor 0, 0, 8
; Palette 79
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 1, 23, 9
  dcolor 0, 6, 0
; Palette 7A
  dcolor 31, 31, 31
  dcolor 30, 17, 4
  dcolor 0, 20, 17
  dcolor 0, 6, 0
; Palette 7B
  dcolor 31, 31, 31
  dcolor 30, 21, 5
  dcolor 14, 13, 21
  dcolor 0, 0, 8
; Palette 7C
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 14, 11, 20
  dcolor 6, 0, 9
; Palette 7D
  dcolor 31, 31, 31
  dcolor 22, 14, 25
  dcolor 25, 0, 0
  dcolor 4, 0, 7
; Palette 7E
  dcolor 31, 31, 31
  dcolor 19, 25, 16
  dcolor 17, 2, 13
  dcolor 7, 0, 5
; Palette 7F
  dcolor 31, 31, 31
  dcolor 31, 12, 20
  dcolor 0, 13, 6
  dcolor 0, 5, 0
; Palette 80
  dcolor 31, 31, 31
  dcolor 17, 21, 24
  dcolor 31, 22, 0
  dcolor 0, 0, 3
; Palette 81
  dcolor 31, 31, 31
  dcolor 29, 22, 15
  dcolor 0, 22, 25
  dcolor 0, 0, 8
; Palette 82
  dcolor 31, 31, 31
  dcolor 20, 22, 24
  dcolor 22, 2, 8
  dcolor 8, 0, 0
; Palette 83
  dcolor 31, 31, 31
  dcolor 31, 23, 4
  dcolor 24, 6, 0
  dcolor 7, 0, 0
; Palette 84
  dcolor 31, 31, 31
  dcolor 25, 23, 13
  dcolor 3, 20, 21
  dcolor 0, 3, 8
; Palette 85
  dcolor 31, 31, 31
  dcolor 17, 14, 30
  dcolor 31, 24, 0
  dcolor 0, 0, 9
; Palette 86
  dcolor 31, 31, 31
  dcolor 31, 28, 9
  dcolor 31, 22, 0
  dcolor 0, 2, 10
; Palette 87
  dcolor 31, 31, 31
  dcolor 18, 17, 23
  dcolor 31, 20, 0
  dcolor 6, 0, 3
; Palette 88
  dcolor 31, 31, 31
  dcolor 31, 26, 2
  dcolor 17, 12, 3
  dcolor 7, 0, 0
; Palette 89
  dcolor 31, 31, 31
  dcolor 30, 24, 6
  dcolor 13, 10, 18
  dcolor 0, 0, 8
; Palette 8A
  dcolor 31, 31, 31
  dcolor 8, 27, 22
  dcolor 31, 15, 0
  dcolor 9, 2, 0
; Palette 8B
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 31, 10, 0
  dcolor 9, 6, 0
; Palette 8C
  dcolor 31, 31, 31
  dcolor 17, 20, 22
  dcolor 31, 21, 0
  dcolor 0, 0, 0
; Palette 8D
  dcolor 31, 31, 31
  dcolor 14, 25, 25
  dcolor 31, 24, 0
  dcolor 0, 5, 0
; Palette 8E
  dcolor 31, 31, 31
  dcolor 21, 20, 25
  dcolor 23, 11, 0
  dcolor 9, 0, 0
; Palette 8F
  dcolor 31, 31, 31
  dcolor 13, 18, 24
  dcolor 31, 22, 0
  dcolor 0, 0, 8
; Palette 90
  dcolor 31, 31, 31
  dcolor 31, 26, 14
  dcolor 4, 10, 20
  dcolor 2, 0, 7
; Palette 91
  dcolor 31, 31, 31
  dcolor 20, 27, 12
  dcolor 20, 10, 3
  dcolor 0, 0, 8
; Palette 92
  dcolor 31, 31, 31
  dcolor 14, 20, 25
  dcolor 24, 2, 11
  dcolor 0, 3, 10
; Palette 93
  dcolor 31, 31, 31
  dcolor 17, 20, 24
  dcolor 27, 9, 15
  dcolor 8, 0, 8
; Palette 94
  dcolor 31, 31, 31
  dcolor 30, 25, 3
  dcolor 24, 0, 13
  dcolor 8, 0, 0
; Palette 95
  dcolor 31, 31, 31
  dcolor 25, 21, 10
  dcolor 25, 7, 0
  dcolor 6, 0, 8
; Palette 96
  dcolor 31, 31, 31
  dcolor 28, 19, 28
  dcolor 30, 10, 5
  dcolor 7, 0, 8
; Palette 97
  dcolor 31, 31, 31
  dcolor 31, 20, 25
  dcolor 0, 18, 7
  dcolor 0, 0, 7
; Palette 98
  dcolor 31, 31, 31
  dcolor 31, 26, 10
  dcolor 25, 1, 10
  dcolor 6, 1, 4
; Palette 99
  dcolor 31, 31, 31
  dcolor 31, 25, 17
  dcolor 23, 0, 2
  dcolor 6, 0, 0
; Palette 9A
  dcolor 31, 31, 31
  dcolor 14, 22, 27
  dcolor 24, 6, 19
  dcolor 9, 0, 3
; Palette 9B
  dcolor 31, 31, 31
  dcolor 31, 26, 4
  dcolor 0, 16, 7
  dcolor 0, 0, 0
; Palette 9C
  dcolor 31, 31, 31
  dcolor 21, 15, 28
  dcolor 25, 0, 2
  dcolor 8, 0, 3
; Palette 9D
  dcolor 31, 31, 31
  dcolor 31, 22, 0
  dcolor 30, 6, 0
  dcolor 7, 0, 0
; Palette 9E
  dcolor 31, 31, 31
  dcolor 29, 25, 3
  dcolor 31, 7, 19
  dcolor 9, 4, 0
; Palette 9F
  dcolor 31, 31, 31
  dcolor 16, 19, 25
  dcolor 1, 17, 0
  dcolor 0, 7, 0
; Palette A0
  dcolor 31, 31, 31
  dcolor 13, 23, 29
  dcolor 31, 19, 0
  dcolor 0, 2, 8
; Palette A1
  dcolor 31, 31, 31
  dcolor 31, 22, 17
  dcolor 0, 11, 19
  dcolor 0, 2, 9
; Palette A2
  dcolor 31, 31, 31
  dcolor 16, 21, 26
  dcolor 16, 16, 12
  dcolor 0, 4, 9
; Palette A3
  dcolor 31, 31, 31
  dcolor 29, 22, 18
  dcolor 19, 1, 8
  dcolor 7, 0, 0
; Palette A4
  dcolor 31, 31, 31
  dcolor 18, 18, 28
  dcolor 21, 7, 19
  dcolor 7, 0, 10
; Palette A5
  dcolor 31, 31, 31
  dcolor 30, 20, 7
  dcolor 25, 0, 7
  dcolor 9, 0, 4
; Palette A6
  dcolor 31, 31, 31
  dcolor 17, 21, 26
  dcolor 21, 2, 8
  dcolor 0, 0, 9
; Palette A7
  dcolor 31, 31, 31
  dcolor 31, 24, 14
  dcolor 29, 5, 15
  dcolor 9, 0, 0
; Palette A8
  dcolor 31, 31, 31
  dcolor 23, 22, 14
  dcolor 24, 1, 4
  dcolor 8, 1, 0
; Palette A9
  dcolor 31, 31, 31
  dcolor 14, 24, 20
  dcolor 31, 16, 0
  dcolor 8, 0, 0
; Palette AA
  dcolor 31, 31, 31
  dcolor 31, 22, 13
  dcolor 23, 0, 9
  dcolor 7, 2, 0
; Palette AB
  dcolor 31, 31, 31
  dcolor 14, 20, 26
  dcolor 19, 0, 6
  dcolor 8, 0, 2
; Palette AC
  dcolor 31, 31, 31
  dcolor 18, 25, 22
  dcolor 30, 19, 0
  dcolor 10, 5, 0
; Palette AD
  dcolor 31, 31, 31
  dcolor 31, 25, 5
  dcolor 26, 15, 6
  dcolor 8, 4, 0
; Palette AE
  dcolor 31, 31, 31
  dcolor 23, 19, 15
  dcolor 31, 10, 0
  dcolor 8, 0, 0
; Palette AF
  dcolor 31, 31, 31
  dcolor 12, 19, 26
  dcolor 3, 11, 21
  dcolor 0, 0, 8
; Palette B0
  dcolor 31, 31, 31
  dcolor 30, 20, 9
  dcolor 27, 2, 11
  dcolor 8, 0, 0
; Palette B1
  dcolor 31, 31, 31
  dcolor 31, 23, 9
  dcolor 19, 4, 17
  dcolor 7, 3, 6
; Palette B2
  dcolor 31, 31, 31
  dcolor 17, 21, 26
  dcolor 28, 5, 1
  dcolor 0, 0, 5
; Palette B3
  dcolor 31, 31, 31
  dcolor 23, 23, 30
  dcolor 26, 0, 4
  dcolor 8, 0, 0
; Palette B4
  dcolor 31, 31, 31
  dcolor 30, 22, 17
  dcolor 29, 5, 1
  dcolor 10, 0, 0
; Palette B5
  dcolor 31, 31, 31
  dcolor 27, 22, 4
  dcolor 29, 0, 3
  dcolor 8, 0, 0
; Palette B6
  dcolor 31, 31, 31
  dcolor 30, 21, 13
  dcolor 0, 19, 4
  dcolor 0, 7, 0
; Palette B7
  dcolor 31, 31, 31
  dcolor 30, 17, 22
  dcolor 31, 18, 0
  dcolor 7, 4, 0
; Palette B8
  dcolor 31, 31, 31
  dcolor 31, 18, 4
  dcolor 0, 11, 20
  dcolor 0, 0, 8
; Palette B9
  dcolor 31, 31, 31
  dcolor 13, 26, 23
  dcolor 25, 17, 0
  dcolor 6, 3, 0
; Palette BA
  dcolor 31, 31, 31
  dcolor 22, 26, 11
  dcolor 19, 8, 0
  dcolor 8, 0, 0
; Palette BB
  dcolor 31, 31, 31
  dcolor 30, 24, 0
  dcolor 3, 25, 15
  dcolor 0, 6, 0
; Palette BC
  dcolor 31, 31, 31
  dcolor 21, 18, 26
  dcolor 0, 12, 6
  dcolor 6, 0, 6
; Palette BD
  dcolor 31, 31, 31
  dcolor 30, 22, 8
  dcolor 3, 19, 17
  dcolor 0, 4, 5
; Palette BE
  dcolor 31, 31, 31
  dcolor 22, 18, 30
  dcolor 9, 19, 0
  dcolor 8, 0, 0
; Palette BF
  dcolor 31, 31, 31
  dcolor 19, 23, 29
  dcolor 26, 10, 2
  dcolor 4, 0, 8
; Palette C0
  dcolor 31, 31, 31
  dcolor 28, 14, 19
  dcolor 22, 0, 8
  dcolor 6, 0, 3
; Palette C1
  dcolor 31, 31, 31
  dcolor 30, 18, 4
  dcolor 12, 10, 3
  dcolor 8, 2, 0
; Palette C2
  dcolor 31, 31, 31
  dcolor 18, 24, 29
  dcolor 6, 11, 24
  dcolor 0, 2, 12
; Palette C3
  dcolor 31, 31, 31
  dcolor 10, 25, 26
  dcolor 20, 12, 0
  dcolor 0, 6, 8
; Palette C4
  dcolor 31, 31, 31
  dcolor 23, 27, 14
  dcolor 18, 1, 11
  dcolor 6, 4, 9
; Palette C5
  dcolor 31, 31, 31
  dcolor 24, 22, 17
  dcolor 23, 8, 0
  dcolor 9, 4, 0
; Palette C6
  dcolor 31, 31, 31
  dcolor 19, 19, 21
  dcolor 5, 12, 21
  dcolor 0, 3, 9
; Palette C7
  dcolor 31, 31, 31
  dcolor 20, 26, 30
  dcolor 3, 7, 21
  dcolor 3, 3, 7
; Palette C8
  dcolor 31, 31, 31
  dcolor 31, 23, 17
  dcolor 19, 0, 9
  dcolor 7, 0, 0
; Palette C9
  dcolor 31, 31, 31
  dcolor 31, 23, 18
  dcolor 29, 0, 18
  dcolor 0, 0, 0
; Palette CA
  dcolor 31, 31, 31
  dcolor 25, 23, 14
  dcolor 9, 17, 5
  dcolor 0, 2, 8
; Palette CB
  dcolor 31, 31, 31
  dcolor 30, 19, 9
  dcolor 27, 7, 0
  dcolor 8, 0, 0
; Palette CC
  dcolor 31, 31, 31
  dcolor 30, 13, 18
  dcolor 22, 0, 8
  dcolor 9, 1, 0
; Palette CD
  dcolor 31, 31, 31
  dcolor 30, 22, 14
  dcolor 20, 6, 0
  dcolor 8, 0, 0
; Palette CE
  dcolor 31, 31, 31
  dcolor 13, 22, 29
  dcolor 28, 5, 0
  dcolor 7, 0, 0
; Palette CF
  dcolor 31, 31, 31
  dcolor 29, 23, 16
  dcolor 25, 10, 0
  dcolor 8, 5, 2
; Palette D0
  dcolor 31, 31, 31
  dcolor 24, 18, 23
  dcolor 31, 0, 0
  dcolor 10, 0, 0
; Palette D1
  dcolor 31, 31, 31
  dcolor 31, 23, 16
  dcolor 1, 12, 25
  dcolor 0, 2, 9
; Palette D2
  dcolor 31, 31, 31
  dcolor 30, 23, 12
  dcolor 31, 10, 0
  dcolor 10, 0, 0
; Palette D3
  dcolor 31, 31, 31
  dcolor 22, 26, 7
  dcolor 24, 2, 14
  dcolor 8, 0, 4
; Palette D4
  dcolor 31, 31, 31
  dcolor 14, 21, 28
  dcolor 31, 20, 0
  dcolor 0, 3, 10
; Palette D5
  dcolor 31, 31, 31
  dcolor 22, 19, 31
  dcolor 0, 11, 19
  dcolor 0, 0, 8
; Palette D6
  dcolor 31, 31, 31
  dcolor 15, 20, 27
  dcolor 19, 2, 16
  dcolor 6, 0, 5
; Palette D7
  dcolor 31, 31, 31
  dcolor 28, 27, 0
  dcolor 5, 14, 23
  dcolor 1, 0, 12
; Palette D8
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 31, 8, 12
  dcolor 8, 0, 0
; Palette D9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette DA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette DB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette DC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0

  dcolor 0, 0, 0
; Palette DD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette DE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette DF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette E0
  dcolor 0, 4, 11
  dcolor 0, 0, 0
  dcolor 12, 14, 31
  dcolor 21, 27, 31
; Palette E1
  dcolor 31, 31, 0
  dcolor 11, 25, 11
  dcolor 0, 16, 0
  dcolor 0, 4, 11
; Palette E2
  dcolor 0, 4, 11
  dcolor 31, 8, 26
  dcolor 8, 19, 28
  dcolor 25, 0, 0
; Palette E3
  dcolor 0, 4, 11
  dcolor 7, 16, 0
  dcolor 0, 4, 11
  dcolor 31, 30, 10
; Palette E4
  dcolor 0, 4, 11
  dcolor 18, 24, 31
  dcolor 7, 15, 25
  dcolor 27, 29, 31
; Palette E5
  dcolor 0, 4, 11
  dcolor 27, 15, 13
  dcolor 24, 2, 0
  dcolor 31, 29, 27
; Palette E6
  dcolor 0, 4, 11
  dcolor 14, 24, 13
  dcolor 2, 18, 0
  dcolor 27, 31, 27
; Palette E7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette E8
  dcolor 31, 31, 31
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 4, 8
; Palette E9
  dcolor 0, 4, 8
  dcolor 0, 11, 15
  dcolor 0, 0, 0
  dcolor 13, 24, 31
; Palette EA
  dcolor 0, 4, 8
  dcolor 17, 9, 27
  dcolor 0, 0, 0
  dcolor 31, 29, 0
; Palette EB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette EC
  dcolor 16, 30, 16
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 4, 8
; Palette ED
  dcolor 19, 31, 19
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 4, 8
; Palette EE
  dcolor 24, 31, 24
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 4, 8
; Palette EF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette F0
  dcolor 31, 21, 31
  dcolor 31, 20, 0
  dcolor 31, 8, 0
  dcolor 0, 0, 8
; Palette F1
  dcolor 20, 29, 14
  dcolor 11, 24, 11
  dcolor 0, 17, 0
  dcolor 9, 23, 31
; Palette F2
  dcolor 17, 9, 3
  dcolor 14, 7, 2
  dcolor 11, 5, 1
  dcolor 0, 17, 0
; Palette F3
  dcolor 20, 11, 5
  dcolor 17, 9, 3
  dcolor 14, 7, 2
  dcolor 11, 5, 1
; Palette F4
  dcolor 31, 5, 0
  dcolor 31, 24, 0
  dcolor 31, 14, 0
  dcolor 10, 0, 0
; Palette F5
  dcolor 31, 26, 0
  dcolor 15, 27, 27
  dcolor 0, 20, 20
  dcolor 0, 3, 16
; Palette F6
  dcolor 31, 28, 0
  dcolor 31, 9, 0
  dcolor 18, 2, 10
  dcolor 8, 0, 0
; Palette F7
  dcolor 20, 25, 31
  dcolor 13, 19, 26
  dcolor 6, 12, 22
  dcolor 0, 8, 18
; Palette F8
  dcolor 31, 21, 31
  dcolor 31, 20, 0
  dcolor 31, 8, 0
  dcolor 0, 0, 8
; Palette F9
  dcolor 31, 31, 31
  dcolor 22, 24, 27
  dcolor 5, 20, 29
  dcolor 0, 0, 0
; Palette FA
  dcolor 19, 27, 0
  dcolor 12, 23, 0
  dcolor 6, 19, 0
  dcolor 0, 16, 0
; Palette FB
  dcolor 19, 27, 0
  dcolor 12, 23, 0
  dcolor 22, 10, 1
  dcolor 11, 4, 0
; Palette FC
  dcolor 11, 20, 31
  dcolor 7, 15, 26
  dcolor 3, 11, 21
  dcolor 18, 24, 31
; Palette FD
  dcolor 26, 17, 5
  dcolor 21, 12, 2
  dcolor 16, 7, 0
  dcolor 7, 15, 26
; Palette FE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette FF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 100
  dcolor 27, 31, 19
  dcolor 18, 23, 9
  dcolor 9, 15, 0
  dcolor 0, 8, 0
; Palette 101
  dcolor 31, 24, 27
  dcolor 28, 12, 16
  dcolor 25, 0, 5
  dcolor 12, 0, 0
; Palette 102
  dcolor 31, 31, 0
  dcolor 23, 21, 0
  dcolor 16, 11, 0
  dcolor 8, 8, 0
; Palette 103
  dcolor 15, 23, 31
  dcolor 7, 15, 27
  dcolor 0, 8, 24
  dcolor 0, 0, 11
; Palette 104
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 105
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 106
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 107
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 108
  dcolor 22, 31, 8
  dcolor 11, 26, 5
  dcolor 0, 17, 5
  dcolor 0, 0, 0
; Palette 109
  dcolor 31, 31, 8
  dcolor 31, 13, 28
  dcolor 0, 0, 0
  dcolor 0, 10, 0
; Palette 10A
  dcolor 27, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 21
; Palette 10B
  dcolor 27, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 16, 31
; Palette 10C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 10D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 10E
  dcolor 31, 31, 8
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 0, 0, 0
; Palette 10F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 110
  dcolor 31, 26, 28
  dcolor 28, 14, 15
  dcolor 26, 4, 5
  dcolor 0, 0, 0
; Palette 111
  dcolor 22, 26, 31
  dcolor 12, 18, 28
  dcolor 3, 10, 26
  dcolor 0, 0, 0
; Palette 112
  dcolor 31, 29, 22
  dcolor 31, 22, 0
  dcolor 23, 14, 0
  dcolor 0, 0, 0
; Palette 113
  dcolor 28, 31, 17
  dcolor 16, 26, 0
  dcolor 8, 20, 0
  dcolor 0, 0, 0
; Palette 114
  dcolor 31, 23, 10
  dcolor 27, 14, 0
  dcolor 20, 8, 0
  dcolor 0, 0, 0
; Palette 115
  dcolor 31, 24, 29
  dcolor 26, 15, 24
  dcolor 21, 5, 13
  dcolor 0, 0, 0
; Palette 116
  dcolor 23, 29, 31
  dcolor 2, 23, 31
  dcolor 0, 16, 22
  dcolor 0, 0, 0
; Palette 117
  dcolor 27, 27, 28
  dcolor 17, 17, 19
  dcolor 11, 11, 13
  dcolor 0, 0, 0
; Palette 118
  dcolor 31, 26, 28
  dcolor 28, 14, 15
  dcolor 26, 4, 5
  dcolor 15, 3, 3
; Palette 119
  dcolor 22, 26, 31
  dcolor 12, 18, 28
  dcolor 3, 10, 26
  dcolor 0, 3, 14
; Palette 11A
  dcolor 31, 29, 22
  dcolor 31, 22, 0
  dcolor 23, 14, 0
  dcolor 11, 5, 0
; Palette 11B
  dcolor 28, 31, 17
  dcolor 16, 26, 0
  dcolor 8, 20, 0
  dcolor 3, 8, 0
; Palette 11C
  dcolor 31, 23, 10
  dcolor 27, 14, 0
  dcolor 20, 8, 0
  dcolor 11, 5, 0
; Palette 11D
  dcolor 31, 24, 29
  dcolor 26, 15, 24
  dcolor 21, 5, 13
  dcolor 12, 2, 5
; Palette 11E
  dcolor 23, 29, 31
  dcolor 2, 23, 31
  dcolor 0, 16, 22
  dcolor 0, 8, 11
; Palette 11F
  dcolor 27, 27, 28
  dcolor 17, 17, 19
  dcolor 11, 11, 13
  dcolor 6, 6, 8
; Palette 120
  dcolor 31, 22, 25
  dcolor 27, 13, 20
  dcolor 24, 0, 0
  dcolor 0, 0, 0
; Palette 121
  dcolor 31, 27, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 22, 7, 22
; Palette 122
  dcolor 31, 27, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 26, 0, 19
; Palette 123
  dcolor 31, 29, 30
  dcolor 31, 13, 28
  dcolor 0, 0, 0
  dcolor 31, 8, 0
; Palette 124
  dcolor 31, 29, 30
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 16
; Palette 125
  dcolor 31, 29, 30
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 28, 0, 0
; Palette 126
  dcolor 31, 29, 30
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 0, 0, 0
; Palette 127
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 128
  dcolor 16, 24, 31
  dcolor 8, 16, 30
  dcolor 0, 9, 29
  dcolor 0, 0, 0
; Palette 129
  dcolor 31, 31, 16
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 16
; Palette 12A
  dcolor 24, 31, 16
  dcolor 31, 13, 28
  dcolor 0, 0, 0
  dcolor 0, 13, 0
; Palette 12B
  dcolor 24, 31, 16
  dcolor 31, 13, 28
  dcolor 0, 0, 0
  dcolor 0, 0, 27
; Palette 12C
  dcolor 24, 31, 16
  dcolor 31, 13, 28
  dcolor 0, 0, 0
  dcolor 20, 0, 20
; Palette 12D
  dcolor 16, 24, 31
  dcolor 31, 13, 28
  dcolor 0, 0, 0
  dcolor 0, 0, 10
; Palette 12E
  dcolor 24, 28, 31
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 0, 0, 10
; Palette 12F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 130
  dcolor 26, 31, 20
  dcolor 18, 27, 9
  dcolor 6, 21, 0
  dcolor 0, 0, 0
; Palette 131
  dcolor 26, 31, 20
  dcolor 31, 9, 17
  dcolor 20, 0, 0
  dcolor 0, 0, 0
; Palette 132
  dcolor 26, 31, 20
  dcolor 31, 26, 0
  dcolor 25, 13, 0
  dcolor 0, 0, 0
; Palette 133
  dcolor 26, 31, 20
  dcolor 5, 15, 31
  dcolor 0, 6, 26
  dcolor 0, 0, 0
; Palette 134
  dcolor 26, 31, 20
  dcolor 15, 29, 10
  dcolor 0, 16, 0
  dcolor 0, 0, 0
; Palette 135
  dcolor 26, 31, 20
  dcolor 26, 12, 31
  dcolor 14, 0, 21
  dcolor 0, 0, 0
; Palette 136
  dcolor 26, 31, 20
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 18, 24, 9
; Palette 137
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 138
  dcolor 18, 24, 31
  dcolor 31, 9, 17
  dcolor 20, 0, 0
  dcolor 0, 0, 0
; Palette 139
  dcolor 18, 24, 31
  dcolor 31, 26, 0
  dcolor 25, 13, 0
  dcolor 0, 0, 0
; Palette 13A
  dcolor 18, 24, 31
  dcolor 5, 15, 31
  dcolor 0, 6, 26
  dcolor 0, 0, 0
; Palette 13B
  dcolor 18, 24, 31
  dcolor 15, 29, 10
  dcolor 0, 16, 0
  dcolor 0, 0, 0
; Palette 13C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 13D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 13E
  dcolor 18, 24, 31
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 9, 18, 31
; Palette 13F
  dcolor 18, 24, 31
  dcolor 26, 12, 31
  dcolor 14, 0, 21
  dcolor 0, 0, 0
; Palette 140
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 28, 0
; Palette 141
  dcolor 0, 0, 8
  dcolor 2, 5, 19
  dcolor 4, 11, 31
  dcolor 31, 28, 0
; Palette 142
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 31, 31
; Palette 143
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 22, 27, 31
; Palette 144
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 10, 16, 24
; Palette 145
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 8, 23
; Palette 146
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 147
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 148
  dcolor 31, 5, 0
  dcolor 31, 24, 0
  dcolor 31, 14, 0
  dcolor 10, 0, 0
; Palette 149
  dcolor 31, 26, 0
  dcolor 15, 27, 27
  dcolor 0, 20, 20
  dcolor 0, 3, 16
; Palette 14A
  dcolor 31, 28, 0
  dcolor 31, 9, 0
  dcolor 18, 2, 10
  dcolor 8, 0, 0
; Palette 14B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 14C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 14D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 14E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 14F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 150
  dcolor 31, 31, 31
  dcolor 23, 23, 15
  dcolor 15, 15, 6
  dcolor 10, 2, 0
; Palette 151
  dcolor 31, 31, 31
  dcolor 31, 22, 9
  dcolor 15, 15, 6
  dcolor 10, 2, 0
; Palette 152
  dcolor 31, 31, 31
  dcolor 31, 22, 9
  dcolor 9, 12, 31
  dcolor 10, 2, 0
; Palette 153
  dcolor 31, 28, 0
  dcolor 31, 5, 18
  dcolor 0, 0, 0
  dcolor 0, 0, 10
; Palette 154
  dcolor 25, 28, 31
  dcolor 12, 18, 27
  dcolor 0, 8, 24
  dcolor 0, 0, 0
; Palette 155
  dcolor 31, 16, 20
  dcolor 25, 2, 4
  dcolor 16, 0, 0
  dcolor 0, 0, 0
; Palette 156
  dcolor 18, 31, 0
  dcolor 12, 22, 0
  dcolor 6, 13, 0
  dcolor 0, 0, 0
; Palette 157
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 158
  dcolor 31, 31, 31
  dcolor 15, 21, 21
  dcolor 0, 11, 11
  dcolor 0, 0, 10
; Palette 159
  dcolor 31, 31, 31
  dcolor 17, 26, 0
  dcolor 0, 11, 11
  dcolor 0, 0, 10
; Palette 15A
  dcolor 31, 31, 31
  dcolor 31, 23, 7
  dcolor 17, 26, 0
  dcolor 0, 0, 10
; Palette 15B
  dcolor 31, 28, 0
  dcolor 31, 5, 18
  dcolor 0, 0, 0
  dcolor 0, 0, 10
; Palette 15C
  dcolor 31, 26, 28
  dcolor 28, 12, 14
  dcolor 25, 2, 4
  dcolor 0, 0, 0
; Palette 15D
  dcolor 25, 28, 31
  dcolor 12, 18, 27
  dcolor 0, 8, 24
  dcolor 0, 0, 0
; Palette 15E
  dcolor 31, 22, 6
  dcolor 22, 15, 3
  dcolor 14, 8, 0
  dcolor 0, 0, 0
; Palette 15F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 160
  dcolor 31, 24, 10
  dcolor 17, 24, 31
  dcolor 7, 14, 22
  dcolor 6, 2, 0
; Palette 161
  dcolor 31, 28, 25
  dcolor 31, 24, 10
  dcolor 7, 14, 22
  dcolor 6, 2, 0
; Palette 162
  dcolor 31, 28, 25
  dcolor 31, 24, 10
  dcolor 24, 10, 1
  dcolor 6, 2, 0
; Palette 163
  dcolor 31, 31, 31
  dcolor 31, 5, 18
  dcolor 0, 0, 0
  dcolor 2, 2, 13
; Palette 164
  dcolor 31, 31, 17
  dcolor 24, 18, 10
  dcolor 17, 10, 4
  dcolor 0, 0, 0
; Palette 165
  dcolor 31, 23, 25
  dcolor 28, 12, 14
  dcolor 25, 2, 4
  dcolor 0, 0, 0
; Palette 166
  dcolor 18, 22, 22
  dcolor 12, 16, 16
  dcolor 6, 10, 10
  dcolor 0, 0, 0
; Palette 167
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 168
  dcolor 31, 31, 31
  dcolor 15, 21, 31
  dcolor 31, 12, 0
  dcolor 0, 3, 9
; Palette 169
  dcolor 31, 31, 31
  dcolor 15, 21, 31
  dcolor 18, 13, 0
  dcolor 0, 3, 9
; Palette 16A
  dcolor 31, 31, 31
  dcolor 15, 21, 31
  dcolor 0, 11, 31
  dcolor 0, 3, 9
; Palette 16B
  dcolor 31, 31, 25
  dcolor 31, 5, 18
  dcolor 0, 0, 0
  dcolor 2, 8, 2
; Palette 16C
  dcolor 31, 31, 19
  dcolor 12, 18, 27
  dcolor 0, 8, 24
  dcolor 0, 0, 0
; Palette 16D
  dcolor 24, 28, 24
  dcolor 18, 21, 18
  dcolor 12, 15, 12
  dcolor 0, 0, 0
; Palette 16E
  dcolor 22, 25, 29
  dcolor 14, 17, 22
  dcolor 6, 10, 15
  dcolor 0, 0, 0
; Palette 16F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 170
  dcolor 22, 27, 31
  dcolor 11, 18, 26
  dcolor 0, 10, 22
  dcolor 0, 0, 0
; Palette 171
  dcolor 31, 22, 0
  dcolor 31, 13, 0
  dcolor 25, 0, 0
  dcolor 0, 0, 0
; Palette 172
  dcolor 31, 31, 31
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 0, 0
; Palette 173
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
; Palette 174
  dcolor 16, 30, 16
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 0, 0
; Palette 175
  dcolor 19, 31, 19
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 0, 0
; Palette 176
  dcolor 24, 31, 24
  dcolor 0, 8, 13
  dcolor 8, 17, 0
  dcolor 0, 0, 0
; Palette 177
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 178
  dcolor 31, 31, 31
  dcolor 16, 21, 26
  dcolor 31, 21, 0
  dcolor 0, 0, 8
; Palette 179
  dcolor 31, 31, 31
  dcolor 16, 21, 26
  dcolor 31, 9, 0
  dcolor 0, 0, 8
; Palette 17A
  dcolor 31, 31, 31
  dcolor 16, 21, 26
  dcolor 0, 8, 23
  dcolor 0, 0, 8
; Palette 17B
  dcolor 28, 30, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 19
; Palette 17C
  dcolor 31, 26, 28
  dcolor 28, 12, 14
  dcolor 25, 2, 4
  dcolor 0, 0, 0
; Palette 17D
  dcolor 12, 30, 21
  dcolor 6, 24, 12
  dcolor 0, 19, 4
  dcolor 0, 0, 0
; Palette 17E
  dcolor 31, 22, 6
  dcolor 22, 15, 3
  dcolor 14, 8, 0
  dcolor 0, 0, 0
; Palette 17F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 180
  dcolor 31, 31, 31
  dcolor 18, 21, 26
  dcolor 0, 0, 10
  dcolor 2, 2, 2
; Palette 181
  dcolor 31, 28, 19
  dcolor 18, 21, 26
  dcolor 0, 0, 10
  dcolor 2, 2, 2
; Palette 182
  dcolor 31, 28, 19
  dcolor 22, 18, 9
  dcolor 0, 0, 10
  dcolor 0, 0, 5
; Palette 183
  dcolor 31, 31, 31
  dcolor 8, 7, 23
  dcolor 17, 13, 11
  dcolor 10, 14, 5
; Palette 184
  dcolor 31, 31, 31
  dcolor 8, 7, 23
  dcolor 0, 0, 10
  dcolor 19, 20, 29
; Palette 185
  dcolor 31, 31, 31
  dcolor 31, 18, 12
  dcolor 0, 3, 11
  dcolor 0, 0, 0
; Palette 186
  dcolor 31, 20, 13
  dcolor 29, 0, 0
  dcolor 14, 0, 0
  dcolor 0, 0, 0
; Palette 187
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 188
  dcolor 31, 31, 31
  dcolor 28, 27, 0
  dcolor 5, 14, 23
  dcolor 0, 3, 10
; Palette 189
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 31, 8, 12
  dcolor 8, 0, 0
; Palette 18A
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 21, 14, 27
  dcolor 6, 0, 8
; Palette 18B
  dcolor 31, 31, 31
  dcolor 18, 21, 25
  dcolor 24, 2, 14
  dcolor 0, 3, 10
; Palette 18C
  dcolor 24, 16, 15
  dcolor 21, 9, 7
  dcolor 18, 2, 0
  dcolor 0, 0, 0
; Palette 18D
  dcolor 19, 25, 31
  dcolor 13, 19, 24
  dcolor 8, 13, 18
  dcolor 0, 0, 0
; Palette 18E
  dcolor 31, 26, 19
  dcolor 24, 19, 12
  dcolor 17, 12, 6
  dcolor 11, 5, 0
; Palette 18F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 190
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 191
  dcolor 25, 24, 31
  dcolor 14, 13, 22
  dcolor 3, 1, 10
  dcolor 6, 0, 0
; Palette 192
  dcolor 31, 23, 15
  dcolor 22, 13, 0
  dcolor 12, 3, 0
  dcolor 6, 0, 0
; Palette 193
  dcolor 31, 31, 31
  dcolor 14, 21, 25
  dcolor 0, 6, 11
  dcolor 6, 0, 0
; Palette 194
  dcolor 31, 28, 15
  dcolor 20, 15, 7
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 195
  dcolor 31, 28, 15
  dcolor 18, 22, 14
  dcolor 5, 12, 0
  dcolor 6, 7, 0
; Palette 196
  dcolor 31, 23, 12
  dcolor 29, 17, 5
  dcolor 13, 21, 0
  dcolor 6, 12, 0
; Palette 197
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 198
  dcolor 31, 31, 31
  dcolor 20, 20, 23
  dcolor 10, 10, 15
  dcolor 0, 0, 8
; Palette 199
  dcolor 31, 31, 31
  dcolor 19, 19, 20
  dcolor 24, 0, 0
  dcolor 0, 0, 8
; Palette 19A
  dcolor 31, 31, 31
  dcolor 19, 19, 20
  dcolor 10, 10, 14
  dcolor 0, 0, 8
; Palette 19B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 19C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 19D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 19E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 19F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1A0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1A1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1A2
  dcolor 23, 31, 23
  dcolor 31, 9, 24
  dcolor 0, 0, 0
  dcolor 0, 7, 0
; Palette 1A3
  dcolor 31, 31, 14
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 10, 0, 0
; Palette 1A4
  dcolor 31, 31, 31
  dcolor 31, 9, 24
  dcolor 0, 0, 0
  dcolor 0, 0, 12
; Palette 1A5
  dcolor 18, 24, 31
  dcolor 9, 16, 27
  dcolor 0, 9, 23
  dcolor 0, 0, 0
; Palette 1A6
  dcolor 31, 31, 14
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 0, 0, 0
; Palette 1A7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1A8
  dcolor 31, 31, 31
  dcolor 22, 22, 22
  dcolor 10, 10, 10
  dcolor 0, 0, 0
; Palette 1A9
  dcolor 31, 31, 5
  dcolor 20, 20, 9
  dcolor 10, 10, 2
  dcolor 0, 0, 8
; Palette 1AA
  dcolor 18, 29, 31
  dcolor 12, 17, 21
  dcolor 1, 6, 12
  dcolor 0, 0, 8
; Palette 1AB
  dcolor 15, 30, 24
  dcolor 10, 22, 12
  dcolor 0, 14, 0
  dcolor 0, 0, 8
; Palette 1AC
  dcolor 30, 20, 22
  dcolor 22, 11, 11
  dcolor 15, 0, 0
  dcolor 0, 0, 8
; Palette 1AD
  dcolor 3, 5, 11
  dcolor 14, 15, 21
  dcolor 25, 26, 31
  dcolor 0, 0, 8
; Palette 1AE
  dcolor 0, 6, 28
  dcolor 2, 15, 0
  dcolor 31, 31, 31
  dcolor 0, 0, 8
; Palette 1AF
  dcolor 31, 31, 31
  dcolor 22, 22, 22
  dcolor 10, 10, 10
  dcolor 0, 0, 0
; Palette 1B0
  dcolor 31, 27, 21
  dcolor 31, 20, 13
  dcolor 19, 12, 5
  dcolor 0, 0, 8
; Palette 1B1
  dcolor 27, 28, 31
  dcolor 14, 22, 27
  dcolor 7, 11, 16
  dcolor 0, 0, 8
; Palette 1B2
  dcolor 19, 12, 5
  dcolor 31, 20, 13
  dcolor 14, 22, 27
  dcolor 0, 0, 8
; Palette 1B3
  dcolor 31, 31, 30
  dcolor 31, 20, 13
  dcolor 14, 8, 19
  dcolor 5, 2, 2
; Palette 1B4
  dcolor 7, 0, 0
  dcolor 31, 29, 0
  dcolor 15, 14, 2
  dcolor 0, 0, 8
; Palette 1B5
  dcolor 7, 0, 0
  dcolor 31, 20, 13
  dcolor 19, 12, 5
  dcolor 0, 0, 8
; Palette 1B6
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 1B7
  dcolor 25, 24, 31
  dcolor 14, 13, 22
  dcolor 3, 1, 10
  dcolor 6, 0, 0
; Palette 1B8
  dcolor 31, 23, 15
  dcolor 22, 13, 0
  dcolor 12, 3, 0
  dcolor 6, 0, 0
; Palette 1B9
  dcolor 31, 31, 31
  dcolor 14, 21, 25
  dcolor 0, 6, 11
  dcolor 6, 0, 0
; Palette 1BA
  dcolor 31, 28, 15
  dcolor 20, 15, 7
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 1BB
  dcolor 31, 28, 15
  dcolor 18, 22, 14
  dcolor 5, 12, 0
  dcolor 6, 7, 0
; Palette 1BC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1BD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1BE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1BF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 1C0
  dcolor 31, 31, 24
  dcolor 31, 4, 0
  dcolor 13, 3, 21
  dcolor 0, 0, 0
; Palette 1C1
  dcolor 31, 31, 24
  dcolor 31, 8, 0
  dcolor 13, 3, 21
  dcolor 0, 0, 0
; Palette 1C2
  dcolor 31, 31, 24
  dcolor 31, 17, 0
  dcolor 13, 3, 21
  dcolor 0, 0, 0
; Palette 1C3
  dcolor 31, 31, 24
  dcolor 31, 25, 0
  dcolor 13, 3, 21
  dcolor 0, 0, 0
; Palette 1C4
  dcolor 31, 31, 27
  dcolor 23, 9, 0
  dcolor 8, 4, 0
  dcolor 0, 0, 0
; Palette 1C5
  dcolor 14, 29, 21
  dcolor 31, 25, 0
  dcolor 3, 19, 6
  dcolor 0, 0, 0
; Palette 1C6
  dcolor 14, 29, 21
  dcolor 31, 8, 0
  dcolor 3, 19, 6
  dcolor 0, 0, 0
; Palette 1C7
  dcolor 31, 31, 24
  dcolor 31, 25, 0
  dcolor 3, 19, 6
  dcolor 0, 0, 0
; Palette 1C8
  dcolor 17, 28, 31
  dcolor 28, 19, 12
  dcolor 0, 16, 28
  dcolor 6, 3, 6
; Palette 1C9
  dcolor 31, 25, 21
  dcolor 28, 19, 12
  dcolor 20, 7, 2
  dcolor 6, 3, 6
; Palette 1CA
  dcolor 23, 29, 31
  dcolor 5, 20, 31
  dcolor 28, 19, 12
  dcolor 6, 3, 6
; Palette 1CB
  dcolor 23, 29, 31
  dcolor 9, 20, 31
  dcolor 31, 6, 0
  dcolor 6, 3, 6
; Palette 1CC
  dcolor 31, 25, 21
  dcolor 28, 19, 12
  dcolor 31, 6, 0
  dcolor 6, 3, 6
; Palette 1CD
  dcolor 12, 25, 21
  dcolor 28, 19, 12
  dcolor 20, 7, 2
  dcolor 6, 3, 6
; Palette 1CE
  dcolor 12, 25, 21
  dcolor 10, 16, 6
  dcolor 27, 7, 21
  dcolor 0, 0, 0
; Palette 1CF
  dcolor 22, 22, 2
  dcolor 31, 28, 26
  dcolor 31, 24, 10
  dcolor 5, 0, 0
; Palette 1D0
  dcolor 31, 28, 26
  dcolor 31, 23, 14
  dcolor 25, 0, 0
  dcolor 5, 0, 0
; Palette 1D1
  dcolor 31, 31, 31
  dcolor 31, 23, 14
  dcolor 21, 11, 4
  dcolor 5, 0, 0
; Palette 1D2
  dcolor 31, 24, 10
  dcolor 31, 23, 14
  dcolor 3, 24, 12
  dcolor 5, 0, 0
; Palette 1D3
  dcolor 31, 28, 26
  dcolor 31, 23, 14
  dcolor 12, 12, 13
  dcolor 5, 0, 0
; Palette 1D4
  dcolor 17, 24, 29
  dcolor 31, 28, 26
  dcolor 23, 15, 22
  dcolor 5, 0, 0
; Palette 1D5
  dcolor 22, 28, 10
  dcolor 31, 23, 14
  dcolor 31, 24, 10
  dcolor 5, 0, 0
; Palette 1D6
  dcolor 28, 30, 31
  dcolor 31, 21, 11
  dcolor 19, 9, 3
  dcolor 4, 0, 6
; Palette 1D7
  dcolor 28, 30, 31
  dcolor 31, 21, 11
  dcolor 27, 0, 0
  dcolor 4, 0, 6
; Palette 1D8
  dcolor 28, 30, 31
  dcolor 23, 27, 2
  dcolor 19, 22, 0
  dcolor 4, 0, 6
; Palette 1D9
  dcolor 28, 30, 31
  dcolor 0, 15, 25
  dcolor 5, 0, 15
  dcolor 4, 0, 6
; Palette 1DA
  dcolor 28, 30, 31
  dcolor 19, 23, 17
  dcolor 0, 15, 25
  dcolor 4, 0, 6
; Palette 1DB
  dcolor 28, 30, 31
  dcolor 31, 21, 11
  dcolor 27, 11, 0
  dcolor 4, 0, 6
; Palette 1DC
  dcolor 28, 30, 31
  dcolor 20, 23, 28
  dcolor 2, 12, 10
  dcolor 4, 0, 6
; Palette 1DD
  dcolor 31, 26, 18
  dcolor 31, 22, 15
  dcolor 31, 3, 0
  dcolor 0, 0, 5
; Palette 1DE
  dcolor 31, 31, 31
  dcolor 31, 22, 15
  dcolor 18, 11, 7
  dcolor 0, 0, 5
; Palette 1DF
  dcolor 31, 31, 31
  dcolor 16, 27, 17
  dcolor 9, 18, 28
  dcolor 0, 0, 5
; Palette 1E0
  dcolor 31, 31, 31
  dcolor 11, 19, 26
  dcolor 19, 5, 20
  dcolor 0, 0, 5
; Palette 1E1
  dcolor 31, 31, 31
  dcolor 31, 26, 18
  dcolor 31, 18, 1
  dcolor 0, 0, 5
; Palette 1E2
  dcolor 31, 31, 31
  dcolor 11, 19, 26
  dcolor 31, 18, 1
  dcolor 0, 0, 5
; Palette 1E3
  dcolor 31, 31, 31
  dcolor 11, 19, 26
  dcolor 31, 0, 1
  dcolor 0, 0, 5
; Palette 1E4
  dcolor 23, 21, 29
  dcolor 31, 22, 15
  dcolor 31, 3, 0
  dcolor 0, 0, 5
; Palette 1E5
  dcolor 31, 31, 31
  dcolor 31, 22, 15
  dcolor 18, 11, 7
  dcolor 0, 0, 5
; Palette 1E6
  dcolor 31, 31, 31
  dcolor 16, 27, 17
  dcolor 9, 18, 28
  dcolor 0, 0, 5
; Palette 1E7
  dcolor 31, 31, 31
  dcolor 23, 21, 29
  dcolor 17, 13, 22
  dcolor 0, 0, 5
; Palette 1E8
  dcolor 31, 31, 31
  dcolor 11, 19, 26
  dcolor 31, 21, 1
  dcolor 0, 0, 5
; Palette 1E9
  dcolor 31, 31, 31
  dcolor 23, 21, 29
  dcolor 31, 19, 1
  dcolor 0, 0, 5
; Palette 1EA
  dcolor 31, 31, 31
  dcolor 11, 19, 26
  dcolor 27, 8, 0
  dcolor 0, 0, 5
; Palette 1EB
  dcolor 31, 31, 28
  dcolor 31, 21, 13
  dcolor 18, 11, 6
  dcolor 7, 3, 0
; Palette 1EC
  dcolor 31, 31, 28
  dcolor 31, 21, 13
  dcolor 28, 6, 0
  dcolor 7, 3, 0
; Palette 1ED
  dcolor 29, 26, 0
  dcolor 31, 21, 26
  dcolor 31, 20, 0
  dcolor 7, 3, 0
; Palette 1EE
  dcolor 31, 31, 28
  dcolor 31, 21, 26
  dcolor 31, 6, 7
  dcolor 7, 3, 0
; Palette 1EF
  dcolor 29, 26, 0
  dcolor 10, 24, 29
  dcolor 31, 20, 0
  dcolor 7, 3, 0
; Palette 1F0
  dcolor 31, 31, 28
  dcolor 10, 24, 29
  dcolor 31, 21, 26
  dcolor 7, 3, 0
; Palette 1F1
  dcolor 31, 31, 28
  dcolor 29, 26, 0
  dcolor 23, 19, 0
  dcolor 7, 3, 0
; Palette 1F2
  dcolor 11, 26, 21
  dcolor 13, 9, 20
  dcolor 28, 0, 0
  dcolor 8, 2, 0
; Palette 1F3
  dcolor 26, 31, 31
  dcolor 31, 16, 18
  dcolor 31, 28, 10
  dcolor 8, 2, 0
; Palette 1F4
  dcolor 31, 28, 26
  dcolor 31, 16, 18
  dcolor 28, 0, 0
  dcolor 8, 2, 0
; Palette 1F5
  dcolor 16, 26, 19
  dcolor 12, 14, 9
  dcolor 0, 17, 21
  dcolor 8, 2, 0
; Palette 1F6
  dcolor 16, 26, 19
  dcolor 31, 27, 6
  dcolor 19, 10, 0
  dcolor 8, 2, 0
; Palette 1F7
  dcolor 31, 28, 26
  dcolor 31, 16, 18
  dcolor 31, 28, 10
  dcolor 8, 2, 0
; Palette 1F8
  dcolor 31, 28, 10
  dcolor 31, 16, 18
  dcolor 19, 9, 9
  dcolor 8, 2, 0
; Palette 1F9
  dcolor 27, 29, 31
  dcolor 13, 18, 27
  dcolor 6, 9, 16
  dcolor 0, 6, 4
; Palette 1FA
  dcolor 27, 29, 31
  dcolor 13, 18, 27
  dcolor 0, 15, 9
  dcolor 0, 6, 4
; Palette 1FB
  dcolor 5, 26, 15
  dcolor 4, 21, 12
  dcolor 0, 15, 9
  dcolor 0, 6, 4
; Palette 1FC
  dcolor 31, 31, 18
  dcolor 23, 23, 13
  dcolor 0, 15, 9
  dcolor 0, 6, 4
; Palette 1FD
  dcolor 31, 31, 18
  dcolor 13, 18, 27
  dcolor 0, 15, 9
  dcolor 0, 6, 4
; Palette 1FE
  dcolor 0, 15, 9
  dcolor 13, 18, 27
  dcolor 6, 9, 16
  dcolor 0, 6, 4
; Palette 1FF
  dcolor 1, 1, 2
  dcolor 13, 18, 27
  dcolor 0, 15, 9
  dcolor 0, 6, 4
; Palette 200
  dcolor 8, 11, 18
  dcolor 6, 8, 16
  dcolor 2, 4, 12
  dcolor 0, 0, 0
; Palette 201
  dcolor 9, 13, 19
  dcolor 7, 10, 17
  dcolor 3, 5, 13
  dcolor 0, 0, 0
; Palette 202
  dcolor 11, 15, 21
  dcolor 8, 11, 18
  dcolor 4, 6, 14
  dcolor 0, 0, 0
; Palette 203
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 204
  dcolor 0, 12, 25
  dcolor 31, 11, 22
  dcolor 0, 0, 0
  dcolor 15, 26, 31
; Palette 205
  dcolor 0, 12, 25
  dcolor 0, 8, 16
  dcolor 0, 4, 8
  dcolor 0, 0, 0
; Palette 206
  dcolor 31, 29, 0
  dcolor 12, 23, 0
  dcolor 3, 16, 0
  dcolor 0, 0, 0
; Palette 207
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 208
  dcolor 31, 31, 31
  dcolor 4, 28, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 209
  dcolor 31, 31, 12
  dcolor 31, 6, 22
  dcolor 0, 0, 0
  dcolor 0, 0, 11
; Palette 20A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 20B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 20C
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 26, 0, 4
  dcolor 0, 0, 8
; Palette 20D
  dcolor 22, 26, 31
  dcolor 13, 19, 28
  dcolor 4, 12, 26
  dcolor 0, 0, 0
; Palette 20E
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 0, 0, 0
; Palette 20F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 210
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 211
  dcolor 26, 29, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 11
; Palette 212

  dcolor 31, 19, 31
  dcolor 31, 0, 21
  dcolor 0, 0, 0
  dcolor 0, 0, 11
; Palette 213
  dcolor 31, 19, 31
  dcolor 25, 11, 25
  dcolor 19, 4, 19
  dcolor 0, 0, 0
; Palette 214
  dcolor 0, 10, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 31, 0
; Palette 215
  dcolor 0, 10, 0
  dcolor 13, 31, 0
  dcolor 0, 0, 0
  dcolor 0, 31, 10
; Palette 216
  dcolor 0, 10, 0
  dcolor 0, 7, 0
  dcolor 0, 5, 0
  dcolor 0, 0, 0
; Palette 217
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 218
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 219
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 21A
  dcolor 31, 25, 31
  dcolor 30, 20, 3
  dcolor 30, 12, 0
  dcolor 18, 0, 0
; Palette 21B
  dcolor 31, 27, 9
  dcolor 30, 20, 3
  dcolor 30, 12, 0
  dcolor 18, 7, 0
; Palette 21C
  dcolor 31, 31, 25
  dcolor 30, 20, 3
  dcolor 30, 12, 0
  dcolor 0, 10, 0
; Palette 21D
  dcolor 31, 27, 9
  dcolor 30, 20, 3
  dcolor 30, 12, 0
  dcolor 0, 0, 0
; Palette 21E
  dcolor 28, 31, 24
  dcolor 1, 19, 31
  dcolor 0, 7, 29
  dcolor 0, 0, 0
; Palette 21F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 220
  dcolor 31, 28, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 9, 18
; Palette 221
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 222
  dcolor 31, 28, 31
  dcolor 19, 22, 31
  dcolor 31, 24, 0
  dcolor 20, 6, 0
; Palette 223
  dcolor 31, 28, 31
  dcolor 19, 22, 31
  dcolor 0, 15, 31
  dcolor 0, 6, 15
; Palette 224
  dcolor 31, 28, 31
  dcolor 19, 22, 31
  dcolor 24, 8, 8
  dcolor 10, 3, 3
; Palette 225
  dcolor 31, 28, 31
  dcolor 31, 18, 26
  dcolor 31, 0, 0
  dcolor 0, 0, 0
; Palette 226
  dcolor 28, 31, 24
  dcolor 1, 19, 31
  dcolor 0, 7, 29
  dcolor 0, 0, 0
; Palette 227
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 228
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 229
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 22A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 22B
  dcolor 23, 31, 0
  dcolor 11, 25, 0
  dcolor 0, 19, 0
  dcolor 0, 0, 0
; Palette 22C
  dcolor 11, 15, 21
  dcolor 8, 11, 18
  dcolor 4, 6, 14
  dcolor 0, 0, 0
; Palette 22D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 22E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 22F
  dcolor 26, 23, 28
  dcolor 20, 15, 16
  dcolor 14, 9, 10
  dcolor 8, 3, 4
; Palette 230
  dcolor 26, 31, 31
  dcolor 31, 21, 15
  dcolor 21, 10, 3
  dcolor 0, 3, 8
; Palette 231
  dcolor 26, 31, 31
  dcolor 31, 21, 15
  dcolor 28, 1, 0
  dcolor 0, 3, 8
; Palette 232
  dcolor 26, 31, 31
  dcolor 31, 21, 15
  dcolor 29, 11, 19
  dcolor 0, 3, 8
; Palette 233
  dcolor 26, 31, 31
  dcolor 9, 21, 28
  dcolor 31, 21, 15
  dcolor 0, 3, 8
; Palette 234
  dcolor 26, 31, 31
  dcolor 31, 21, 15
  dcolor 0, 2, 19
  dcolor 0, 3, 8
; Palette 235
  dcolor 26, 31, 31
  dcolor 31, 21, 15
  dcolor 27, 9, 0
  dcolor 0, 3, 8
; Palette 236
  dcolor 26, 31, 31
  dcolor 31, 12, 0
  dcolor 31, 23, 0
  dcolor 0, 3, 8
; Palette 237
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 238
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 239
  dcolor 24, 24, 31
  dcolor 29, 9, 22
  dcolor 0, 0, 0
  dcolor 0, 0, 17
; Palette 23A
  dcolor 21, 21, 31
  dcolor 29, 9, 22
  dcolor 0, 0, 0
  dcolor 0, 0, 17
; Palette 23B
  dcolor 18, 18, 31
  dcolor 29, 9, 22
  dcolor 0, 0, 0
  dcolor 0, 0, 17
; Palette 23C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 23D
  dcolor 16, 16, 31
  dcolor 29, 9, 22
  dcolor 0, 0, 0
  dcolor 0, 0, 17
; Palette 23E
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 26, 0, 4
  dcolor 17, 0, 7
; Palette 23F
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 31, 6, 0
; Palette 240
  dcolor 31, 31, 31
  dcolor 28, 28, 31
  dcolor 0, 10, 31
  dcolor 0, 0, 0
; Palette 241
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 242
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 243
  dcolor 31, 31, 31
  dcolor 24, 28, 6
  dcolor 10, 18, 0
  dcolor 0, 8, 8
; Palette 244
  dcolor 31, 31, 16
  dcolor 31, 18, 0
  dcolor 24, 3, 3
  dcolor 11, 0, 3
; Palette 245
  dcolor 31, 31, 31
  dcolor 14, 18, 18
  dcolor 8, 12, 12
  dcolor 0, 9, 9
; Palette 246
  dcolor 21, 25, 25
  dcolor 14, 18, 18
  dcolor 8, 12, 12
  dcolor 0, 0, 0
; Palette 247
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 248
  dcolor 31, 26, 0
  dcolor 31, 17, 0
  dcolor 31, 3, 0
  dcolor 0, 0, 8
; Palette 249
  dcolor 0, 8, 31
  dcolor 22, 4, 14
  dcolor 0, 0, 8
  dcolor 0, 18, 31
; Palette 24A
  dcolor 10, 31, 10
  dcolor 7, 19, 31
  dcolor 0, 8, 31
  dcolor 0, 0, 8
; Palette 24B
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 8, 19, 0
; Palette 24C
  dcolor 31, 26, 0
  dcolor 31, 17, 0
  dcolor 31, 3, 0
  dcolor 0, 0, 8
; Palette 24D
  dcolor 0, 19, 4
  dcolor 31, 27, 31
  dcolor 0, 0, 8
  dcolor 0, 27, 7
; Palette 24E
  dcolor 31, 31, 0
  dcolor 4, 31, 12
  dcolor 0, 19, 4
  dcolor 0, 0, 8
; Palette 24F
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 12, 12, 31
; Palette 250
  dcolor 31, 26, 0
  dcolor 31, 17, 0
  dcolor 31, 3, 0
  dcolor 0, 0, 8
; Palette 251
  dcolor 28, 2, 0
  dcolor 22, 4, 14
  dcolor 0, 0, 8
  dcolor 15, 0, 0
; Palette 252
  dcolor 31, 19, 28
  dcolor 31, 14, 0
  dcolor 28, 2, 0
  dcolor 0, 0, 8
; Palette 253
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 28, 12, 0
; Palette 254
  dcolor 0, 15, 6
  dcolor 0, 31, 15
  dcolor 31, 31, 31
  dcolor 0, 0, 0
; Palette 255
  dcolor 0, 31, 15
  dcolor 31, 28, 6
  dcolor 31, 7, 0
  dcolor 0, 0, 0
; Palette 256
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 257
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 258
  dcolor 31, 31, 13
  dcolor 24, 22, 6
  dcolor 17, 14, 0
  dcolor 0, 0, 0
; Palette 259
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 25A
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 31, 27, 0
; Palette 25B
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 7, 28, 31
; Palette 25C
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 0, 14, 0
; Palette 25D
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 21, 26, 31
; Palette 25E
  dcolor 0, 8, 0
  dcolor 31, 24, 0
  dcolor 21, 7, 0
  dcolor 0, 0, 0
; Palette 25F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 260
  dcolor 0, 7, 16
  dcolor 0, 4, 10
  dcolor 0, 2, 5
  dcolor 0, 0, 0
; Palette 261
  dcolor 28, 14, 26
  dcolor 19, 19, 26
  dcolor 8, 8, 21
  dcolor 0, 0, 0
; Palette 262
  dcolor 31, 29, 15
  dcolor 16, 16, 21
  dcolor 5, 5, 14
  dcolor 0, 0, 0
; Palette 263
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 264
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 265
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 266
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 267
  dcolor 0, 6, 0
  dcolor 26, 22, 28
  dcolor 20, 14, 16
  dcolor 31, 27, 0
; Palette 268
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 31, 27, 0
; Palette 269
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 0, 23, 31
; Palette 26A
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 31, 9, 23
; Palette 26B
  dcolor 0, 8, 0
  dcolor 0, 4, 0
  dcolor 0, 0, 0
  dcolor 15, 31, 0
; Palette 26C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 26D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 26E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 26F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 270
  dcolor 31, 6, 19
  dcolor 19, 28, 31
  dcolor 8, 14, 24
  dcolor 0, 4, 17
; Palette 271
  dcolor 19, 28, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 6, 0
; Palette 272
  dcolor 31, 6, 19
  dcolor 29, 23, 14
  dcolor 20, 13, 7
  dcolor 11, 4, 0
; Palette 273
  dcolor 29, 23, 14
  dcolor 31, 19, 0
  dcolor 28, 10, 0
  dcolor 10, 0, 0
; Palette 274
  dcolor 31, 6, 19
  dcolor 31, 31, 14
  dcolor 19, 15, 11
  dcolor 8, 0, 8
; Palette 275
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 276
  dcolor 31, 14, 0
  dcolor 31, 22, 14
  dcolor 0, 9, 27
  dcolor 2, 0, 6
; Palette 277
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 278
  dcolor 24, 21, 31
  dcolor 16, 8, 31
  dcolor 7, 0, 17
  dcolor 0, 0, 0
; Palette 279
  dcolor 31, 31, 21
  dcolor 31, 26, 0
  dcolor 24, 16, 0
  dcolor 0, 0, 0
; Palette 27A
  dcolor 21, 23, 10
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 27B
  dcolor 27, 29, 31
  dcolor 16, 22, 25
  dcolor 5, 15, 20
  dcolor 0, 0, 0
; Palette 27C
  dcolor 31, 31, 27
  dcolor 25, 25, 13
  dcolor 17, 17, 0
  dcolor 0, 0, 0
; Palette 27D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 27E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 31, 31
; Palette 27F
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 280
  dcolor 31, 8, 25
  dcolor 0, 31, 17
  dcolor 0, 17, 3
  dcolor 0, 0, 12
; Palette 281
  dcolor 0, 0, 12
  dcolor 0, 0, 0
  dcolor 31, 31, 0
  dcolor 31, 0, 0
; Palette 282
  dcolor 31, 8, 25
  dcolor 29, 23, 14
  dcolor 20, 13, 7
  dcolor 11, 4, 0
; Palette 283
  dcolor 29, 23, 14
  dcolor 31, 24, 0
  dcolor 31, 5, 0
  dcolor 11, 0, 0
; Palette 284
  dcolor 31, 8, 25
  dcolor 17, 22, 26
  dcolor 4, 14, 22
  dcolor 0, 0, 12
; Palette 285
  dcolor 31, 26, 0
  dcolor 30, 17, 0
  dcolor 29, 8, 0
  dcolor 0, 0, 0
; Palette 286
  dcolor 31, 14, 0
  dcolor 31, 22, 14
  dcolor 0, 9, 27
  dcolor 2, 0, 6
; Palette 287
  dcolor 31, 31, 0
  dcolor 31, 14, 0
  dcolor 25, 4, 0
  dcolor 0, 0, 0
; Palette 288
  dcolor 31, 26, 0
  dcolor 30, 17, 0
  dcolor 29, 8, 0
  dcolor 0, 0, 0
; Palette 289
  dcolor 18, 31, 0
  dcolor 9, 24, 0
  dcolor 0, 18, 0
  dcolor 12, 12, 12
; Palette 28A
  dcolor 31, 20, 31
  dcolor 28, 10, 28
  dcolor 26, 0, 26
  dcolor 0, 0, 0
; Palette 28B
  dcolor 6, 26, 31
  dcolor 3, 16, 31
  dcolor 0, 6, 31
  dcolor 12, 12, 12
; Palette 28C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 28D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 28E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 28F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 290
  dcolor 28, 31, 19
  dcolor 31, 12, 27
  dcolor 0, 0, 0
  dcolor 0, 7, 0
; Palette 291
  dcolor 28, 31, 19
  dcolor 14, 25, 9
  dcolor 0, 20, 0
  dcolor 0, 0, 0
; Palette 292
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 293
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 294
  dcolor 0, 0, 0
  dcolor 18, 18, 0
  dcolor 10, 10, 0
  dcolor 0, 0, 0
; Palette 295
  dcolor 23, 28, 31
  dcolor 31, 12, 27
  dcolor 0, 0, 0
  dcolor 0, 0, 13
; Palette 296
  dcolor 23, 28, 31
  dcolor 11, 20, 28
  dcolor 0, 13, 25
  dcolor 0, 0, 0
; Palette 297
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 298
  dcolor 9, 18, 18
  dcolor 4, 12, 12
  dcolor 0, 6, 6
  dcolor 0, 0, 0
; Palette 299
  dcolor 14, 14, 19
  dcolor 9, 9, 14
  dcolor 4, 4, 10
  dcolor 0, 0, 0
; Palette 29A
  dcolor 19, 19, 24
  dcolor 14, 14, 19
  dcolor 9, 9, 14
  dcolor 0, 0, 0
; Palette 29B
  dcolor 24, 24, 29
  dcolor 19, 19, 24
  dcolor 14, 14, 19
  dcolor 0, 0, 0
; Palette 29C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 29D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 29E
  dcolor 6, 16, 22
  dcolor 3, 11, 17
  dcolor 0, 6, 13
  dcolor 0, 0, 0
; Palette 29F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2A0
  dcolor 26, 31, 31
  dcolor 7, 27, 14
  dcolor 0, 17, 3
  dcolor 0, 0, 0
; Palette 2A1
  dcolor 31, 30, 18
  dcolor 31, 12, 28
  dcolor 26, 1, 21
  dcolor 0, 0, 0
; Palette 2A2
  dcolor 28, 24, 20
  dcolor 25, 18, 10
  dcolor 23, 12, 0
  dcolor 0, 0, 0
; Palette 2A3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2A4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2A5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2A6
  dcolor 31, 25, 12
  dcolor 21, 29, 31
  dcolor 8, 18, 30
  dcolor 0, 1, 4
; Palette 2A7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2A8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2A9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2AA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2AB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2AC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2AD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2AE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2AF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2B0
  dcolor 31, 31, 31
  dcolor 22, 16, 11
  dcolor 12, 18, 27
  dcolor 28, 19, 11
; Palette 2B1
  dcolor 20, 14, 9
  dcolor 28, 19, 11
  dcolor 25, 18, 10
  dcolor 22, 16, 11
; Palette 2B2
  dcolor 21, 16, 10
  dcolor 21, 18, 27
  dcolor 12, 18, 27
  dcolor 25, 18, 10
; Palette 2B3
  dcolor 31, 31, 31
  dcolor 28, 22, 26
  dcolor 26, 11, 15
  dcolor 24, 9, 13
; Palette 2B4
  dcolor 28, 21, 15
  dcolor 23, 17, 12
  dcolor 19, 14, 9
  dcolor 17, 12, 7
; Palette 2B5
  dcolor 31, 31, 31
  dcolor 28, 21, 15
  dcolor 17, 12, 7
  dcolor 24, 9, 13
; Palette 2B6
  dcolor 31, 31, 31
  dcolor 14, 20, 31
  dcolor 27, 17, 9
  dcolor 18, 10, 4
; Palette 2B7
  dcolor 18, 10, 4
  dcolor 10, 20, 10
  dcolor 27, 17, 9
  dcolor 22, 13, 6
; Palette 2B8
  dcolor 18, 10, 4
  dcolor 14, 20, 31
  dcolor 21, 26, 31
  dcolor 22, 13, 6
; Palette 2B9
  dcolor 29, 13, 14
  dcolor 16, 16, 18
  dcolor 23, 15, 8
  dcolor 31, 31, 31
; Palette 2BA
  dcolor 27, 5, 3
  dcolor 23, 14, 7
  dcolor 17, 12, 7
  dcolor 14, 9, 4
; Palette 2BB
  dcolor 29, 13, 14
  dcolor 20, 20, 21
  dcolor 16, 16, 18
  dcolor 14, 9, 4
; Palette 2BC
  dcolor 31, 31, 31
  dcolor 19, 12, 5
  dcolor 11, 22, 31
  dcolor 0, 19, 6
; Palette 2BD
  dcolor 0, 24, 7
  dcolor 0, 19, 6
  dcolor 0, 14, 0
  dcolor 19, 12, 5
; Palette 2BE
  dcolor 0, 14, 0
  dcolor 0, 19, 6
  dcolor 31, 31, 31
  dcolor 11, 22, 31
; Palette 2BF
  dcolor 31, 31, 31
  dcolor 0, 11, 0
  dcolor 9, 16, 1
  dcolor 11, 20, 3
; Palette 2C0
  dcolor 0, 18, 24
  dcolor 11, 20, 3
  dcolor 9, 16, 1
  dcolor 0, 11, 0
; Palette 2C1
  dcolor 14, 9, 5
  dcolor 24, 12, 5
  dcolor 9, 16, 1
  dcolor 0, 11, 0
; Palette 2C2
  dcolor 31, 31, 31
  dcolor 14, 16, 18
  dcolor 14, 19, 31
  dcolor 9, 10, 12
; Palette 2C3
  dcolor 6, 11, 15
  dcolor 23, 26, 29
  dcolor 14, 19, 31
  dcolor 8, 13, 17
; Palette 2C4
  dcolor 6, 11, 15
  dcolor 24, 21, 20
  dcolor 27, 12, 6
  dcolor 19, 13, 10
; Palette 2C5
  dcolor 28, 28, 8
  dcolor 9, 26, 9
  dcolor 25, 9, 6
  dcolor 0, 11, 0
; Palette 2C6
  dcolor 31, 31, 31
  dcolor 14, 20, 26
  dcolor 25, 17, 11
  dcolor 3, 8, 12
; Palette 2C7
  dcolor 9, 14, 21
  dcolor 31, 19, 11
  dcolor 14, 14, 9
  dcolor 3, 8, 12
; Palette 2C8
  dcolor 31, 31, 31
  dcolor 6, 20, 31
  dcolor 5, 15, 26
  dcolor 4, 9, 17
; Palette 2C9
  dcolor 4, 8, 14
  dcolor 6, 20, 31
  dcolor 5, 15, 26
  dcolor 6, 11, 19
; Palette 2CA
  dcolor 31, 15, 9
  dcolor 6, 20, 31
  dcolor 5, 15, 26
  dcolor 4, 9, 17
; Palette 2CB
  dcolor 31, 31, 31
  dcolor 18, 23, 29
  dcolor 13, 18, 24
  dcolor 9, 14, 21
; Palette 2CC
  dcolor 31, 31, 31
  dcolor 18, 23, 29
  dcolor 19, 25, 31
  dcolor 9, 14, 21
; Palette 2CD
  dcolor 31, 31, 31
  dcolor 18, 23, 29
  dcolor 23, 27, 31
  dcolor 9, 14, 21
; Palette 2CE
  dcolor 31, 31, 31
  dcolor 28, 19, 9
  dcolor 19, 11, 5
  dcolor 5, 8, 11
; Palette 2CF
  dcolor 28, 19, 9
  dcolor 24, 15, 7
  dcolor 19, 11, 5
  dcolor 5, 8, 11
; Palette 2D0
  dcolor 17, 23, 28
  dcolor 8, 15, 20
  dcolor 8, 11, 15
  dcolor 5, 8, 11
; Palette 2D1
  dcolor 16, 29, 24
  dcolor 11, 25, 18
  dcolor 31, 31, 31
  dcolor 6, 10, 6
; Palette 2D2
  dcolor 16, 29, 24
  dcolor 11, 25, 18
  dcolor 8, 21, 8
  dcolor 6, 10, 6
; Palette 2D3
  dcolor 16, 29, 24
  dcolor 27, 16, 7
  dcolor 22, 7, 7
  dcolor 6, 10, 6
; Palette 2D4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2D5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2D6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2D7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2D8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2D9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2DA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2DB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2DC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2DD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2DE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2DF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2E0
  dcolor 28, 19, 11
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2E1
  dcolor 28, 19, 11
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2E2
  dcolor 28, 19, 11
  dcolor 25, 18, 10
  dcolor 22, 16, 11
  dcolor 20, 14, 9
; Palette 2E3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2E4
  dcolor 28, 21, 15
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2E5
  dcolor 17, 12, 7
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2E6
  dcolor 23, 17, 12
  dcolor 19, 14, 9
  dcolor 17, 12, 7
  dcolor 28, 21, 15
; Palette 2E7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2E8
  dcolor 18, 10, 4
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2E9
  dcolor 27, 17, 9
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2EA
  dcolor 27, 17, 9
  dcolor 22, 13, 6
  dcolor 10, 20, 10
  dcolor 18, 10, 4
; Palette 2EB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 2EC
  dcolor 11, 8, 5
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2ED
  dcolor 27, 5, 3
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2EE
  dcolor 27, 5, 3
  dcolor 15, 12, 9
  dcolor 12, 9, 6
  dcolor 10, 7, 4
; Palette 2EF
  dcolor 27, 5, 3
  dcolor 15, 12, 9
  dcolor 24, 19, 14
  dcolor 19, 15, 11
; Palette 2F0
  dcolor 0, 14, 0
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2F1
  dcolor 25, 17, 11
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2F2
  dcolor 0, 24, 7
  dcolor 25, 17, 11
  dcolor 19, 12, 5
  dcolor 0, 14, 0
; Palette 2F3
  dcolor 0, 24, 7
  dcolor 0, 19, 6
  dcolor 19, 12, 5
  dcolor 0, 14, 0
; Palette 2F4
  dcolor 0, 11, 0
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2F5
  dcolor 24, 12, 5
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2F6
  dcolor 24, 12, 5
  dcolor 9, 16, 1
  dcolor 14, 9, 5
  dcolor 0, 11, 0
; Palette 2F7
  dcolor 11, 20, 3
  dcolor 9, 16, 1
  dcolor 14, 9, 5
  dcolor 0, 11, 0
; Palette 2F8
  dcolor 21, 21, 24
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2F9
  dcolor 10, 14, 18
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2FA
  dcolor 21, 21, 24
  dcolor 10, 14, 18
  dcolor 24, 16, 6
  dcolor 7, 10, 13
; Palette 2FB
  dcolor 21, 21, 24
  dcolor 10, 14, 18
  dcolor 25, 8, 8
  dcolor 7, 10, 13
; Palette 2FC
  dcolor 6, 11, 15
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 2FD
  dcolor 31, 19, 11
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 2FE
  dcolor 31, 19, 11
  dcolor 27, 14, 9
  dcolor 10, 18, 20
  dcolor 5, 10, 14
; Palette 2FF
  dcolor 31, 19, 11
  dcolor 25, 9, 6
  dcolor 10, 18, 20
  dcolor 5, 10, 14
; Palette 300
  dcolor 4, 8, 14
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 301
  dcolor 6, 11, 19
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 302
  dcolor 6, 11, 19
  dcolor 6, 20, 31
  dcolor 5, 15, 26
  dcolor 4, 8, 14
; Palette 303
  dcolor 6, 11, 19
  dcolor 6, 20, 31
  dcolor 24, 15, 9
  dcolor 9, 14, 0
; Palette 304
  dcolor 23, 27, 31
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 305
  dcolor 23, 27, 31
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 306
  dcolor 13, 18, 24
  dcolor 9, 14, 21
  dcolor 18, 23, 29
  dcolor 23, 27, 31
; Palette 307
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 308
  dcolor 5, 8, 11
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 309
  dcolor 5, 8, 11
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 30A
  dcolor 28, 19, 9
  dcolor 24, 15, 7
  dcolor 19, 11, 5
  dcolor 5, 8, 11
; Palette 30B
  dcolor 17, 23, 28
  dcolor 8, 15, 20
  dcolor 8, 11, 15
  dcolor 5, 8, 11
; Palette 30C
  dcolor 6, 10, 6
  dcolor 9, 21, 0
  dcolor 0, 10, 0
  dcolor 0, 0, 0
; Palette 30D
  dcolor 6, 10, 6
  dcolor 31, 9, 2
  dcolor 1, 6, 20
  dcolor 31, 31, 28
; Palette 30E
  dcolor 16, 29, 24
  dcolor 11, 25, 18
  dcolor 8, 21, 8
  dcolor 6, 10, 6
; Palette 30F
  dcolor 27, 16, 7
  dcolor 22, 7, 7
  dcolor 8, 21, 8
  dcolor 6, 10, 6
; Palette 310
  dcolor 31, 22, 14
  dcolor 25, 18, 10
  dcolor 19, 14, 7
  dcolor 13, 10, 4
; Palette 311
  dcolor 12, 18, 27
  dcolor 21, 18, 27
  dcolor 19, 14, 7
  dcolor 13, 10, 4
; Palette 312
  dcolor 31, 25, 14
  dcolor 22, 18, 9
  dcolor 14, 11, 4
  dcolor 6, 4, 0
; Palette 313
  dcolor 24, 8, 13
  dcolor 27, 18, 22
  dcolor 31, 29, 31
  dcolor 6, 4, 0
; Palette 314
  dcolor 3, 20, 0
  dcolor 22, 12, 4
  dcolor 15, 8, 2
  dcolor 9, 4, 0
; Palette 315
  dcolor 7, 12, 31
  dcolor 23, 28, 31
  dcolor 15, 8, 2
  dcolor 9, 4, 0
; Palette 316
  dcolor 31, 0, 0
  dcolor 29, 13, 0
  dcolor 18, 8, 1
  dcolor 8, 4, 2
; Palette 317
  dcolor 29, 16, 13
  dcolor 22, 22, 23
  dcolor 14, 14, 15
  dcolor 8, 4, 2
; Palette 318
  dcolor 11, 22, 31
  dcolor 0, 26, 8
  dcolor 0, 16, 4
  dcolor 31, 31, 31
; Palette 319
  dcolor 18, 9, 0
  dcolor 0, 26, 8
  dcolor 0, 16, 4
  dcolor 0, 6, 0
; Palette 31A
  dcolor 0, 20, 31
  dcolor 23, 28, 3
  dcolor 11, 17, 1
  dcolor 0, 6, 0
; Palette 31B
  dcolor 11, 17, 1
  dcolor 24, 12, 5
  dcolor 13, 7, 1
  dcolor 0, 6, 0
; Palette 31C
  dcolor 14, 16, 17
  dcolor 12, 21, 31
  dcolor 31, 31, 31
  dcolor 0, 0, 5
; Palette 31D
  dcolor 25, 25, 25
  dcolor 14, 16, 17
  dcolor 25, 3, 0
  dcolor 0, 0, 5
; Palette 31E
  dcolor 11, 20, 31
  dcolor 31, 26, 23
  dcolor 15, 2, 0
  dcolor 7, 0, 0
; Palette 31F
  dcolor 11, 20, 31
  dcolor 31, 29, 31
  dcolor 0, 14, 0
  dcolor 7, 0, 0
; Palette 320
  dcolor 0, 14, 31
  dcolor 0, 9, 22
  dcolor 0, 4, 13
  dcolor 0, 0, 4
; Palette 321
  dcolor 0, 14, 31
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 0, 0, 0
; Palette 322
  dcolor 15, 31, 31
  dcolor 31, 31, 31
  dcolor 20, 22, 25
  dcolor 0, 5, 15
; Palette 323
  dcolor 31, 31, 31
  dcolor 20, 22, 25
  dcolor 10, 13, 20
  dcolor 0, 5, 15
; Palette 324
  dcolor 31, 31, 31
  dcolor 17, 20, 30
  dcolor 4, 10, 29
  dcolor 0, 0, 8
; Palette 325
  dcolor 31, 27, 0
  dcolor 21, 16, 2
  dcolor 11, 6, 4
  dcolor 0, 0, 8
; Palette 326
  dcolor 26, 31, 31
  dcolor 7, 26, 22
  dcolor 0, 15, 0
  dcolor 0, 4, 0
; Palette 327
  dcolor 31, 26, 31
  dcolor 31, 14, 0
  dcolor 18, 0, 0
  dcolor 0, 4, 0
; Palette 328
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 329
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 32A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 32B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 32C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 32D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 32E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 32F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 330
  dcolor 31, 31, 31
  dcolor 31, 7, 0
  dcolor 30, 17, 0
  dcolor 7, 6, 0
; Palette 331
  dcolor 31, 31, 31
  dcolor 22, 19, 25
  dcolor 21, 10, 23
  dcolor 7, 4, 0
; Palette 332
  dcolor 31, 31, 31
  dcolor 31, 9, 0
  dcolor 0, 20, 14
  dcolor 0, 8, 0
; Palette 333
  dcolor 31, 31, 31
  dcolor 26, 26, 19
  dcolor 22, 14, 2
  dcolor 9, 5, 1
; Palette 334
  dcolor 31, 31, 31
  dcolor 24, 23, 31
  dcolor 31, 13, 4
  dcolor 7, 0, 0
; Palette 335
  dcolor 31, 31, 31
  dcolor 29, 23, 15
  dcolor 27, 0, 4
  dcolor 0, 1, 9
; Palette 336
  dcolor 31, 31, 31
  dcolor 31, 23, 7
  dcolor 31, 17, 0
  dcolor 7, 5, 0
; Palette 337
  dcolor 31, 31, 31
  dcolor 28, 7, 0
  dcolor 20, 5, 16
  dcolor 5, 0, 6
; Palette 338
  dcolor 31, 31, 31
  dcolor 31, 13, 0
  dcolor 18, 5, 1
  dcolor 0, 6, 0
; Palette 339
  dcolor 31, 31, 31
  dcolor 8, 21, 25
  dcolor 27, 10, 1
  dcolor 7, 0, 0
; Palette 33A
  dcolor 31, 31, 31
  dcolor 6, 26, 17
  dcolor 20, 9, 1
  dcolor 9, 5, 0
; Palette 33B
  dcolor 31, 31, 31
  dcolor 31, 21, 4
  dcolor 0, 22, 4
  dcolor 0, 0, 8
; Palette 33C
  dcolor 31, 31, 31
  dcolor 17, 21, 24
  dcolor 31, 22, 0
  dcolor 0, 0, 3
; Palette 33D
  dcolor 31, 31, 31
  dcolor 30, 15, 2
  dcolor 0, 22, 25
  dcolor 0, 0, 8
; Palette 33E
  dcolor 31, 31, 31
  dcolor 31, 24, 16
  dcolor 22, 2, 8
  dcolor 8, 0, 0
; Palette 33F
  dcolor 31, 31, 31
  dcolor 31, 23, 4
  dcolor 24, 6, 0
  dcolor 7, 0, 0
; Palette 340
  dcolor 31, 31, 31
  dcolor 31, 22, 9
  dcolor 3, 20, 21
  dcolor 0, 3, 8
; Palette 341
  dcolor 31, 31, 31
  dcolor 17, 14, 30
  dcolor 31, 3, 0
  dcolor 0, 0, 9
; Palette 342
  dcolor 31, 31, 31
  dcolor 31, 28, 9
  dcolor 26, 14, 0
  dcolor 0, 2, 10
; Palette 343
  dcolor 31, 31, 31
  dcolor 18, 17, 23
  dcolor 31, 20, 0
  dcolor 6, 0, 3
; Palette 344
  dcolor 31, 31, 31
  dcolor 24, 7, 14
  dcolor 17, 12, 3
  dcolor 7, 0, 0
; Palette 345
  dcolor 31, 31, 31
  dcolor 30, 24, 6
  dcolor 13, 10, 18
  dcolor 0, 0, 8
; Palette 346
  dcolor 31, 31, 31
  dcolor 31, 27, 2
  dcolor 31, 15, 0
  dcolor 9, 2, 0
; Palette 347
  dcolor 31, 31, 31
  dcolor 16, 24, 31
  dcolor 31, 10, 0
  dcolor 9, 6, 0
; Palette 348
  dcolor 31, 31, 31
  dcolor 17, 20, 22
  dcolor 31, 21, 0
  dcolor 0, 0, 0
; Palette 349
  dcolor 31, 31, 31
  dcolor 31, 10, 7
  dcolor 31, 21, 0
  dcolor 0, 0, 0
; Palette 34A
  dcolor 31, 31, 31
  dcolor 21, 20, 25
  dcolor 5, 18, 26
  dcolor 9, 0, 0
; Palette 34B
  dcolor 31, 31, 31
  dcolor 13, 18, 24
  dcolor 8, 19, 30
  dcolor 0, 0, 8
; Palette 34C
  dcolor 31, 31, 31
  dcolor 31, 26, 14
  dcolor 4, 10, 20
  dcolor 2, 0, 7
; Palette 34D
  dcolor 31, 31, 31
  dcolor 12, 16, 24
  dcolor 20, 10, 3
  dcolor 0, 0, 8
; Palette 34E
  dcolor 31, 31, 31
  dcolor 29, 24, 2
  dcolor 19, 1, 8
  dcolor 7, 0, 0
; Palette 34F
  dcolor 31, 31, 31
  dcolor 2, 14, 26
  dcolor 21, 7, 19
  dcolor 7, 0, 10
; Palette 350
  dcolor 31, 31, 31
  dcolor 30, 20, 7
  dcolor 7, 21, 0
  dcolor 9, 0, 4
; Palette 351
  dcolor 31, 31, 31
  dcolor 17, 21, 26
  dcolor 21, 2, 8
  dcolor 0, 0, 9
; Palette 352
  dcolor 31, 31, 31
  dcolor 5, 28, 18
  dcolor 29, 5, 15
  dcolor 9, 0, 0
; Palette 353
  dcolor 31, 31, 31
  dcolor 28, 14, 19
  dcolor 19, 4, 17
  dcolor 6, 0, 3
; Palette 354
  dcolor 31, 31, 31
  dcolor 17, 21, 26
  dcolor 28, 5, 1
  dcolor 0, 0, 5
; Palette 355
  dcolor 31, 31, 31
  dcolor 23, 23, 30
  dcolor 30, 13, 0
  dcolor 8, 0, 0
; Palette 356
  dcolor 31, 31, 31
  dcolor 30, 22, 17
  dcolor 29, 5, 1
  dcolor 10, 0, 0
; Palette 357
  dcolor 31, 31, 31
  dcolor 15, 20, 25
  dcolor 29, 0, 3
  dcolor 8, 0, 0
; Palette 358
  dcolor 31, 31, 31
  dcolor 30, 21, 13
  dcolor 29, 8, 20
  dcolor 0, 7, 0
; Palette 359
  dcolor 31, 31, 31
  dcolor 13, 24, 29
  dcolor 31, 18, 0
  dcolor 7, 4, 0
; Palette 35A
  dcolor 31, 31, 31
  dcolor 31, 16, 28
  dcolor 12, 10, 3
  dcolor 8, 2, 0
; Palette 35B
  dcolor 31, 31, 31
  dcolor 21, 23, 28
  dcolor 20, 6, 0
  dcolor 8, 0, 0
; Palette 35C
  dcolor 31, 31, 31
  dcolor 24, 25, 31
  dcolor 28, 5, 0
  dcolor 7, 0, 0
; Palette 35D
  dcolor 31, 31, 31
  dcolor 29, 23, 16
  dcolor 25, 10, 0
  dcolor 8, 5, 2
; Palette 35E
  dcolor 31, 31, 31
  dcolor 24, 18, 23
  dcolor 31, 0, 0
  dcolor 10, 0, 0
; Palette 35F
  dcolor 31, 31, 31
  dcolor 30, 26, 12
  dcolor 24, 2, 14
  dcolor 8, 0, 4
; Palette 360
  dcolor 31, 31, 31
  dcolor 14, 21, 28
  dcolor 31, 20, 0
  dcolor 0, 3, 10
; Palette 361
  dcolor 31, 31, 31
  dcolor 22, 19, 31
  dcolor 30, 8, 2
  dcolor 0, 0, 8
; Palette 362
  dcolor 31, 31, 31
  dcolor 15, 20, 27
  dcolor 19, 2, 16
  dcolor 6, 0, 5
; Palette 363
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 364
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 365
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 366
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 367
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 368
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 369
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 36A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 36B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 36C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 36D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 36E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 36F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 370
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 26, 0, 0
  dcolor 10, 0, 0
; Palette 371
  dcolor 31, 31, 31
  dcolor 24, 16, 31
  dcolor 26, 0, 0
  dcolor 10, 0, 0
; Palette 372
  dcolor 31, 31, 31
  dcolor 31, 18, 26
  dcolor 0, 10, 31
  dcolor 0, 0, 10
; Palette 373
  dcolor 31, 31, 31
  dcolor 14, 23, 5
  dcolor 0, 10, 31
  dcolor 0, 0, 10
; Palette 374
  dcolor 31, 31, 31
  dcolor 7, 24, 24
  dcolor 31, 16, 0
  dcolor 5, 2, 0
; Palette 375
  dcolor 31, 31, 31
  dcolor 16, 20, 16
  dcolor 31, 17, 0
  dcolor 5, 2, 0
; Palette 376
  dcolor 31, 31, 31
  dcolor 10, 20, 31
  dcolor 4, 19, 0
  dcolor 0, 5, 0
; Palette 377
  dcolor 31, 31, 31
  dcolor 31, 15, 30
  dcolor 4, 18, 0
  dcolor 0, 5, 0
; Palette 378
  dcolor 31, 31, 31
  dcolor 16, 23, 9
  dcolor 21, 8, 0
  dcolor 6, 2, 0
; Palette 379
  dcolor 31, 31, 31
  dcolor 6, 20, 31
  dcolor 21, 10, 0
  dcolor 6, 2, 0
; Palette 37A
  dcolor 31, 31, 31
  dcolor 31, 20, 0
  dcolor 26, 3, 21
  dcolor 6, 0, 3
; Palette 37B
  dcolor 31, 31, 31
  dcolor 0, 23, 18
  dcolor 26, 6, 21
  dcolor 6, 0, 3
; Palette 37C
  dcolor 31, 31, 31
  dcolor 31, 20, 0
  dcolor 0, 17, 31
  dcolor 0, 0, 6
; Palette 37D
  dcolor 31, 31, 31
  dcolor 31, 14, 14
  dcolor 0, 19, 31
  dcolor 0, 0, 6
; Palette 37E
  dcolor 31, 31, 31
  dcolor 0, 19, 31
  dcolor 11, 11, 15
  dcolor 0, 0, 4
; Palette 37F
  dcolor 31, 31, 31
  dcolor 28, 18, 18
  dcolor 18, 11, 11
  dcolor 5, 0, 0
; Palette 380
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 381
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 382
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 383
  dcolor 31, 31, 31
  dcolor 31, 22, 14
  dcolor 20, 9, 0
  dcolor 8, 0, 0
; Palette 384
  dcolor 31, 31, 31
  dcolor 12, 0, 23
  dcolor 31, 8, 26
  dcolor 8, 0, 0
; Palette 385
  dcolor 31, 31, 31
  dcolor 0, 23, 30
  dcolor 31, 8, 26
  dcolor 8, 0, 0
; Palette 386
  dcolor 31, 31, 31
  dcolor 31, 23, 15
  dcolor 29, 10, 0
  dcolor 6, 0, 0
; Palette 387
  dcolor 31, 31, 31
  dcolor 31, 23, 15
  dcolor 31, 0, 16
  dcolor 6, 0, 0
; Palette 388
  dcolor 31, 31, 31
  dcolor 0, 25, 12
  dcolor 29, 10, 0
  dcolor 6, 0, 0
; Palette 389
  dcolor 31, 31, 31
  dcolor 31, 17, 6
  dcolor 19, 8, 0
  dcolor 0, 0, 6
; Palette 38A
  dcolor 31, 31, 31
  dcolor 31, 17, 6
  dcolor 0, 2, 19
  dcolor 0, 0, 6
; Palette 38B
  dcolor 31, 31, 31
  dcolor 31, 17, 6
  dcolor 18, 22, 24
  dcolor 0, 0, 6
; Palette 38C
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 38D
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 38E
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 38F
  dcolor 31, 31, 31
  dcolor 31, 18, 7
  dcolor 14, 6, 0
  dcolor 0, 0, 0
; Palette 390
  dcolor 31, 31, 31
  dcolor 0, 23, 30
  dcolor 14, 6, 0
  dcolor 0, 0, 0
; Palette 391
  dcolor 31, 31, 31
  dcolor 0, 23, 30
  dcolor 17, 8, 21
  dcolor 0, 0, 0
; Palette 392
  dcolor 31, 31, 31
  dcolor 31, 18, 11
  dcolor 20, 10, 0
  dcolor 0, 0, 6
; Palette 393
  dcolor 31, 31, 31
  dcolor 31, 18, 11
  dcolor 4, 2, 11
  dcolor 0, 0, 6
; Palette 394
  dcolor 31, 31, 31
  dcolor 21, 26, 10
  dcolor 21, 8, 3
  dcolor 0, 0, 6
; Palette 395
  dcolor 31, 31, 31
  dcolor 31, 17, 9
  dcolor 31, 2, 0
  dcolor 0, 5, 0
; Palette 396
  dcolor 31, 31, 31
  dcolor 31, 17, 9
  dcolor 31, 13, 0
  dcolor 0, 5, 0
; Palette 397
  dcolor 31, 31, 31
  dcolor 31, 17, 9
  dcolor 5, 20, 8
  dcolor 0, 5, 0
; Palette 398
  dcolor 31, 31, 31
  dcolor 31, 17, 9
  dcolor 19, 8, 4
  dcolor 8, 0, 0
; Palette 399
  dcolor 31, 31, 31
  dcolor 31, 17, 9
  dcolor 31, 3, 0
  dcolor 8, 0, 0
; Palette 39A
  dcolor 31, 31, 31
  dcolor 31, 17, 9
  dcolor 3, 15, 27
  dcolor 8, 0, 0
; Palette 39B
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 39C
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 39D
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 39E
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 31, 23, 0
  dcolor 3, 0, 9
; Palette 39F
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 14, 3, 23
  dcolor 3, 0, 9
; Palette 3A0
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 22, 8, 0
  dcolor 3, 0, 9
; Palette 3A1
  dcolor 31, 31, 31
  dcolor 31, 16, 10
  dcolor 28, 5, 3
  dcolor 0, 0, 9
; Palette 3A2
  dcolor 31, 31, 31
  dcolor 31, 16, 10
  dcolor 24, 5, 11
  dcolor 0, 0, 9
; Palette 3A3
  dcolor 31, 31, 31
  dcolor 29, 27, 5
  dcolor 24, 5, 11
  dcolor 0, 0, 9
; Palette 3A4
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3A5
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3A6
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3A7
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 31, 3, 5
  dcolor 6, 0, 3
; Palette 3A8
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 26, 0, 5
  dcolor 6, 0, 3
; Palette 3A9
  dcolor 31, 31, 31
  dcolor 31, 21, 0
  dcolor 30, 14, 0
  dcolor 6, 0, 3
; Palette 3AA
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3AB
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3AC
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3AD
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 19, 20, 21
  dcolor 3, 0, 6
; Palette 3AE
  dcolor 31, 31, 31
  dcolor 2, 16, 30
  dcolor 31, 3, 5
  dcolor 3, 0, 6
; Palette 3AF
  dcolor 31, 31, 31
  dcolor 21, 20, 22
  dcolor 12, 10, 14
  dcolor 3, 0, 6
; Palette 3B0
  dcolor 31, 31, 31
  dcolor 31, 22, 15
  dcolor 17, 7, 0
  dcolor 8, 0, 0
; Palette 3B1
  dcolor 31, 31, 31
  dcolor 18, 21, 24
  dcolor 31, 5, 14
  dcolor 8, 0, 0
; Palette 3B2
  dcolor 31, 31, 31
  dcolor 18, 21, 24
  dcolor 17, 7, 0
  dcolor 8, 0, 0
; Palette 3B3
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3B4
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3B5
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3B6
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3B7
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3B8
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3B9
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 6, 3
  dcolor 6, 3, 1
; Palette 3BA
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 31, 0, 0
  dcolor 6, 3, 1
; Palette 3BB
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 6, 25, 0
  dcolor 6, 3, 1
; Palette 3BC
  dcolor 31, 31, 31
  dcolor 31, 19, 7
  dcolor 18, 7, 3
  dcolor 6, 0, 0
; Palette 3BD
  dcolor 31, 31, 31
  dcolor 31, 19, 7
  dcolor 21, 11, 6
  dcolor 6, 0, 0
; Palette 3BE
  dcolor 31, 31, 31
  dcolor 25, 13, 25
  dcolor 21, 11, 6
  dcolor 6, 0, 0
; Palette 3BF
  dcolor 31, 31, 31
  dcolor 31, 17, 7
  dcolor 13, 4, 2
  dcolor 4, 0, 0
; Palette 3C0
  dcolor 31, 31, 31
  dcolor 31, 17, 7
  dcolor 26, 0, 4
  dcolor 4, 0, 0
; Palette 3C1
  dcolor 31, 31, 31
  dcolor 13, 20, 24
  dcolor 0, 18, 2
  dcolor 4, 0, 0
; Palette 3C2
  dcolor 31, 31, 31
  dcolor 31, 20, 12
  dcolor 18, 11, 2
  dcolor 4, 4, 0
; Palette 3C3
  dcolor 31, 31, 31
  dcolor 31, 20, 12
  dcolor 26, 0, 4
  dcolor 4, 4, 0
; Palette 3C4
  dcolor 31, 31, 31
  dcolor 31, 20, 12
  dcolor 0, 15, 22
  dcolor 4, 4, 0
; Palette 3C5
  dcolor 31, 31, 31
  dcolor 31, 18, 11
  dcolor 18, 7, 2
  dcolor 4, 0, 0
; Palette 3C6
  dcolor 31, 31, 31
  dcolor 22, 26, 17
  dcolor 0, 18, 0
  dcolor 4, 0, 0
; Palette 3C7
  dcolor 31, 31, 31
  dcolor 31, 18, 11
  dcolor 10, 8, 22
  dcolor 4, 0, 0
; Palette 3C8
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 10, 22, 28
  dcolor 0, 0, 5
; Palette 3C9
  dcolor 31, 31, 31
  dcolor 20, 20, 24
  dcolor 10, 10, 15
  dcolor 0, 0, 5
; Palette 3CA
  dcolor 31, 31, 31
  dcolor 20, 20, 22
  dcolor 0, 9, 16
  dcolor 0, 0, 5
; Palette 3CB
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 15, 7, 5
  dcolor 0, 0, 3
; Palette 3CC
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 7, 1, 9
  dcolor 0, 0, 3
; Palette 3CD
  dcolor 31, 31, 31
  dcolor 25, 15, 25
  dcolor 7, 1, 9
  dcolor 0, 0, 3
; Palette 3CE
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 11, 14, 23
  dcolor 0, 0, 10
; Palette 3CF
  dcolor 31, 31, 31
  dcolor 21, 27, 29
  dcolor 1, 5, 23
  dcolor 0, 0, 10
; Palette 3D0
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 2, 0
  dcolor 0, 0, 10
; Palette 3D1
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 2, 0
  dcolor 0, 0, 0
; Palette 3D2
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 31, 5, 17
  dcolor 0, 0, 0
; Palette 3D3
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 31, 3, 0
  dcolor 0, 0, 0
; Palette 3D4
  dcolor 31, 31, 31
  dcolor 21, 8, 2
  dcolor 31, 21, 0
  dcolor 0, 0, 6
; Palette 3D5
  dcolor 31, 31, 31
  dcolor 21, 8, 2
  dcolor 13, 5, 23
  dcolor 0, 0, 6
; Palette 3D6
  dcolor 31, 31, 31
  dcolor 13, 18, 22
  dcolor 10, 4, 2
  dcolor 0, 0, 6
; Palette 3D7
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 11, 14, 23
  dcolor 6, 0, 0
; Palette 3D8
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 1, 5, 23
  dcolor 6, 0, 0
; Palette 3D9
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 30, 2, 7
  dcolor 6, 0, 0
; Palette 3DA
  dcolor 31, 31, 31
  dcolor 31, 16, 7
  dcolor 15, 7, 2
  dcolor 0, 4, 0
; Palette 3DB
  dcolor 31, 31, 31
  dcolor 31, 16, 7
  dcolor 4, 26, 14
  dcolor 0, 4, 0
; Palette 3DC
  dcolor 31, 31, 31
  dcolor 31, 16, 7
  dcolor 31, 9, 18
  dcolor 0, 4, 0
; Palette 3DD
  dcolor 31, 31, 31
  dcolor 31, 20, 12
  dcolor 6, 14, 0
  dcolor 7, 0, 4
; Palette 3DE
  dcolor 31, 31, 31
  dcolor 31, 21, 22
  dcolor 17, 5, 18
  dcolor 7, 0, 4
; Palette 3DF
  dcolor 31, 31, 31
  dcolor 31, 20, 12
  dcolor 20, 5, 0
  dcolor 7, 0, 4
; Palette 3E0
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3E1
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3E2
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3E3
  dcolor 31, 31, 31
  dcolor 25, 27, 17
  dcolor 23, 26, 28
  dcolor 0, 0, 8
; Palette 3E4
  dcolor 31, 23, 0
  dcolor 25, 27, 17
  dcolor 23, 26, 28
  dcolor 0, 0, 8
; Palette 3E5
  dcolor 31, 31, 31
  dcolor 25, 27, 17
  dcolor 12, 17, 12
  dcolor 0, 0, 8
; Palette 3E6
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 16, 10, 2
  dcolor 0, 0, 4
; Palette 3E7
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 12, 7, 2
  dcolor 0, 0, 4
; Palette 3E8
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 31, 26, 0
  dcolor 0, 0, 4
; Palette 3E9
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 19, 10, 7
  dcolor 7, 0, 1
; Palette 3EA
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 19, 10, 7
  dcolor 7, 0, 1
; Palette 3EB
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 31, 8, 0
  dcolor 7, 0, 1
; Palette 3EC
  dcolor 31, 31, 31
  dcolor 31, 15, 10
  dcolor 22, 6, 0
  dcolor 0, 5, 0
; Palette 3ED
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 12, 7, 2
  dcolor 0, 5, 0
; Palette 3EE
  dcolor 31, 31, 31
  dcolor 31, 15, 10
  dcolor 15, 10, 5
  dcolor 0, 5, 0
; Palette 3EF
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 16, 10, 2
  dcolor 6, 0, 3
; Palette 3F0
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 31, 8, 2
  dcolor 6, 0, 3
; Palette 3F1
  dcolor 31, 31, 31
  dcolor 31, 28, 2
  dcolor 31, 8, 2
  dcolor 6, 0, 3
; Palette 3F2
  dcolor 31, 31, 31
  dcolor 31, 21, 18
  dcolor 18, 9, 4
  dcolor 8, 3, 0
; Palette 3F3
  dcolor 31, 31, 31
  dcolor 18, 21, 26
  dcolor 16, 8, 22
  dcolor 8, 3, 0
; Palette 3F4
  dcolor 31, 31, 31
  dcolor 31, 21, 18
  dcolor 30, 11, 0
  dcolor 8, 3, 0
; Palette 3F5
  dcolor 31, 31, 31
  dcolor 15, 18, 31
  dcolor 31, 25, 1
  dcolor 0, 0, 7
; Palette 3F6
  dcolor 31, 31, 31
  dcolor 31, 21, 11
  dcolor 4, 14, 24
  dcolor 0, 0, 7
; Palette 3F7
  dcolor 31, 31, 31
  dcolor 31, 17, 1
  dcolor 4, 23, 15
  dcolor 0, 0, 7
; Palette 3F8
  dcolor 31, 31, 31
  dcolor 22, 29, 13
  dcolor 1, 17, 0
  dcolor 0, 4, 0
; Palette 3F9
  dcolor 31, 31, 31
  dcolor 31, 16, 9
  dcolor 31, 26, 9
  dcolor 0, 4, 0
; Palette 3FA
  dcolor 31, 31, 31
  dcolor 21, 9, 0
  dcolor 14, 4, 0
  dcolor 0, 4, 0
; Palette 3FB
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3FC
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3FD
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 3FE
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 3FF
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 400
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 401
  dcolor 31, 31, 31
  dcolor 20, 20, 24
  dcolor 10, 10, 17
  dcolor 0, 0, 10
; Palette 402
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 403
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 404
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 405
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 406
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 407
  dcolor 31, 31, 31
  dcolor 20, 24, 20
  dcolor 10, 17, 10
  dcolor 0, 11, 0
; Palette 408
  dcolor 31, 31, 31
  dcolor 31, 7, 19
  dcolor 15, 9, 9
  dcolor 0, 11, 0
; Palette 409
  dcolor 31, 31, 31
  dcolor 22, 22, 17
  dcolor 14, 13, 4
  dcolor 0, 11, 0
; Palette 40A
  dcolor 31, 31, 31
  dcolor 24, 22, 20
  dcolor 17, 13, 10
  dcolor 12, 3, 0
; Palette 40B
  dcolor 31, 31, 31
  dcolor 0, 28, 10
  dcolor 5, 16, 5
  dcolor 12, 3, 0
; Palette 40C
  dcolor 31, 31, 31
  dcolor 24, 23, 27
  dcolor 17, 15, 23
  dcolor 11, 7, 20
; Palette 40D
  dcolor 31, 31, 31
  dcolor 20, 22, 23
  dcolor 10, 13, 16
  dcolor 0, 5, 9
; Palette 40E
  dcolor 31, 31, 31
  dcolor 31, 30, 0
  dcolor 15, 17, 4
  dcolor 0, 5, 9
; Palette 40F
  dcolor 31, 31, 31
  dcolor 18, 10, 3
  dcolor 9, 7, 6
  dcolor 0, 5, 9
; Palette 410
  dcolor 31, 31, 31
  dcolor 20, 20, 24
  dcolor 10, 10, 17
  dcolor 0, 0, 10
; Palette 411
  dcolor 31, 31, 31
  dcolor 31, 28, 9
  dcolor 15, 14, 9
  dcolor 0, 0, 10
; Palette 412
  dcolor 31, 31, 31
  dcolor 9, 20, 13
  dcolor 4, 10, 11
  dcolor 0, 0, 10
; Palette 413
  dcolor 31, 31, 31
  dcolor 24, 21, 20
  dcolor 17, 11, 10
  dcolor 10, 2, 0
; Palette 414
  dcolor 31, 31, 31
  dcolor 31, 30, 2
  dcolor 17, 19, 4
  dcolor 10, 2, 0
; Palette 415
  dcolor 31, 31, 31
  dcolor 13, 13, 21
  dcolor 11, 7, 10
  dcolor 10, 2, 0
; Palette 416
  dcolor 31, 31, 31
  dcolor 23, 20, 24
  dcolor 16, 10, 18
  dcolor 9, 0, 12
; Palette 417
  dcolor 31, 31, 31
  dcolor 31, 26, 5
  dcolor 20, 13, 8
  dcolor 9, 0, 12
; Palette 418
  dcolor 31, 31, 31
  dcolor 27, 20, 0
  dcolor 18, 10, 6
  dcolor 9, 0, 12
; Palette 419
  dcolor 31, 31, 31
  dcolor 20, 22, 24
  dcolor 10, 13, 18
  dcolor 0, 4, 12
; Palette 41A
  dcolor 31, 31, 31
  dcolor 20, 31, 1
  dcolor 10, 17, 6
  dcolor 0, 4, 12
; Palette 41B
  dcolor 31, 31, 31
  dcolor 17, 28, 28
  dcolor 8, 16, 20
  dcolor 0, 4, 12
; Palette 41C
  dcolor 31, 31, 31
  dcolor 24, 20, 22
  dcolor 17, 10, 14
  dcolor 11, 0, 6
; Palette 41D
  dcolor 31, 31, 31
  dcolor 31, 31, 4
  dcolor 23, 19, 5
  dcolor 11, 0, 6
; Palette 41E
  dcolor 31, 31, 31
  dcolor 31, 23, 19
  dcolor 21, 11, 12
  dcolor 11, 0, 6
; Palette 41F
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 420
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 421
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 422
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 423
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 424
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 425
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 426
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 427
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 428
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 429
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 42A
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 42B
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 42C
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 42D
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 42E
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 42F
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 430
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 431
  dcolor 31, 31, 31
  dcolor 2, 14, 23
  dcolor 1, 11, 7
  dcolor 0, 4, 0
; Palette 432
  dcolor 31, 31, 31
  dcolor 30, 19, 9
  dcolor 1, 11, 7
  dcolor 0, 4, 0
; Palette 433
  dcolor 31, 31, 31
  dcolor 31, 5, 0
  dcolor 1, 11, 7
  dcolor 0, 4, 0
; Palette 434
  dcolor 31, 31, 31
  dcolor 9, 30, 17
  dcolor 7, 13, 28
  dcolor 12, 2, 0
; Palette 435
  dcolor 31, 31, 31
  dcolor 9, 30, 17
  dcolor 31, 12, 0
  dcolor 12, 2, 0
; Palette 436
  dcolor 31, 31, 31
  dcolor 28, 17, 14
  dcolor 21, 7, 0
  dcolor 12, 2, 0
; Palette 437
  dcolor 31, 31, 31
  dcolor 31, 15, 20
  dcolor 31, 26, 0
  dcolor 7, 4, 0
; Palette 438
  dcolor 31, 31, 31
  dcolor 31, 15, 20
  dcolor 31, 5, 6
  dcolor 7, 4, 0
; Palette 439
  dcolor 31, 31, 31
  dcolor 15, 24, 31
  dcolor 31, 26, 0
  dcolor 7, 4, 0
; Palette 43A
  dcolor 31, 31, 31
  dcolor 0, 28, 20
  dcolor 3, 14, 30
  dcolor 0, 0, 6
; Palette 43B
  dcolor 31, 31, 31
  dcolor 0, 28, 20
  dcolor 17, 6, 1
  dcolor 0, 0, 6
; Palette 43C
  dcolor 31, 31, 31
  dcolor 0, 28, 20
  dcolor 4, 19, 11
  dcolor 0, 0, 6
; Palette 43D
  dcolor 31, 31, 31
  dcolor 31, 19, 13
  dcolor 3, 14, 30
  dcolor 0, 0, 8
; Palette 43E
  dcolor 31, 31, 31
  dcolor 31, 19, 13
  dcolor 21, 10, 1
  dcolor 0, 0, 8
; Palette 43F
  dcolor 31, 31, 31
  dcolor 17, 21, 29
  dcolor 3, 14, 30
  dcolor 0, 0, 8
; Palette 440
  dcolor 31, 31, 31
  dcolor 2, 29, 19
  dcolor 31, 24, 0
  dcolor 0, 10, 6
; Palette 441
  dcolor 31, 31, 31
  dcolor 2, 29, 19
  dcolor 1, 19, 12
  dcolor 0, 10, 6
; Palette 442
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 10, 6
; Palette 443
  dcolor 31, 31, 31
  dcolor 31, 23, 17
  dcolor 31, 21, 0
  dcolor 8, 3, 0
; Palette 444
  dcolor 31, 31, 31
  dcolor 31, 23, 17
  dcolor 31, 6, 14
  dcolor 8, 3, 0
; Palette 445
  dcolor 31, 31, 31
  dcolor 31, 21, 0
  dcolor 31, 4, 0
  dcolor 8, 3, 0
; Palette 446
  dcolor 31, 31, 31
  dcolor 31, 19, 24
  dcolor 24, 10, 15
  dcolor 6, 0, 0
; Palette 447
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 448
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 24, 16, 8
  dcolor 6, 0, 0
; Palette 449
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 15, 6, 0
  dcolor 3, 5, 4
; Palette 44A
  dcolor 31, 31, 31
  dcolor 14, 11, 15
  dcolor 0, 9, 22
  dcolor 3, 5, 4
; Palette 44B
  dcolor 31, 31, 31
  dcolor 14, 11, 15
  dcolor 15, 6, 0
  dcolor 3, 5, 4
; Palette 44C
  dcolor 31, 31, 31
  dcolor 31, 19, 7
  dcolor 17, 6, 0
  dcolor 0, 0, 0
; Palette 44D
  dcolor 31, 31, 31
  dcolor 22, 19, 19
  dcolor 17, 6, 0
  dcolor 0, 0, 0
; Palette 44E
  dcolor 31, 31, 31
  dcolor 31, 19, 7
  dcolor 7, 17, 29
  dcolor 0, 0, 0
; Palette 44F
  dcolor 31, 31, 31
  dcolor 31, 18, 7
  dcolor 17, 2, 0
  dcolor 6, 0, 0
; Palette 450
  dcolor 31, 31, 31
  dcolor 22, 19, 19
  dcolor 17, 2, 0
  dcolor 6, 0, 0
; Palette 451
  dcolor 31, 31, 31
  dcolor 31, 18, 7
  dcolor 7, 17, 29
  dcolor 6, 0, 0
; Palette 452
  dcolor 31, 31, 31
  dcolor 31, 26, 10
  dcolor 22, 5, 0
  dcolor 5, 0, 0
; Palette 453
  dcolor 31, 31, 31
  dcolor 31, 18, 10
  dcolor 24, 5, 2
  dcolor 5, 0, 0
; Palette 454
  dcolor 31, 31, 31
  dcolor 2, 8, 6
  dcolor 10, 16, 7
  dcolor 5, 0, 0
; Palette 455
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 12, 7, 2
  dcolor 6, 0, 3
; Palette 456
  dcolor 31, 31, 31
  dcolor 23, 11, 28
  dcolor 8, 7, 19
  dcolor 6, 0, 3
; Palette 457
  dcolor 31, 31, 31
  dcolor 31, 21, 14
  dcolor 18, 24, 31
  dcolor 6, 0, 3
; Palette 458
  dcolor 31, 31, 31
  dcolor 31, 17, 10
  dcolor 18, 8, 8
  dcolor 6, 0, 6
; Palette 459
  dcolor 31, 31, 31
  dcolor 31, 17, 10
  dcolor 29, 3, 8
  dcolor 6, 0, 6
; Palette 45A
  dcolor 31, 31, 31
  dcolor 16, 6, 3
  dcolor 29, 3, 8
  dcolor 6, 0, 6
; Palette 45B
  dcolor 31, 31, 31
  dcolor 31, 24, 18
  dcolor 17, 7, 0
  dcolor 6, 0, 0
; Palette 45C
  dcolor 31, 31, 31
  dcolor 31, 27, 1
  dcolor 31, 3, 5
  dcolor 6, 0, 0
; Palette 45D
  dcolor 31, 31, 31
  dcolor 31, 8, 18
  dcolor 17, 7, 0
  dcolor 6, 0, 0
; Palette 45E
  dcolor 31, 31, 31
  dcolor 31, 16, 7
  dcolor 17, 2, 0
  dcolor 6, 0, 2
; Palette 45F
  dcolor 31, 31, 31
  dcolor 29, 13, 21
  dcolor 17, 2, 0
  dcolor 6, 0, 2
; Palette 460
  dcolor 31, 31, 31
  dcolor 31, 23, 3
  dcolor 6, 19, 0
  dcolor 6, 0, 2
; Palette 461
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 2, 0
  dcolor 6, 0, 0
; Palette 462
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 0, 12, 23
  dcolor 6, 0, 0
; Palette 463
  dcolor 31, 31, 31
  dcolor 17, 21, 29
  dcolor 0, 12, 23
  dcolor 6, 0, 0
; Palette 464
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 2, 0
  dcolor 7, 0, 3
; Palette 465
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 11, 21, 31
  dcolor 7, 0, 3
; Palette 466
  dcolor 31, 31, 31
  dcolor 17, 11, 17
  dcolor 10, 5, 3
  dcolor 7, 0, 3
; Palette 467
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 2, 0
  dcolor 7, 0, 0
; Palette 468
  dcolor 31, 31, 31
  dcolor 11, 21, 31
  dcolor 17, 11, 17
  dcolor 7, 0, 0
; Palette 469
  dcolor 31, 31, 31
  dcolor 31, 14, 7
  dcolor 17, 11, 17
  dcolor 7, 0, 0
; Palette 46A
  dcolor 31, 31, 31
  dcolor 12, 24, 26
  dcolor 27, 5, 0
  dcolor 0, 3, 7
; Palette 46B
  dcolor 31, 31, 31
  dcolor 12, 24, 26
  dcolor 6, 13, 16
  dcolor 0, 3, 7
; Palette 46C
  dcolor 31, 31, 31
  dcolor 11, 21, 15
  dcolor 0, 17, 31
  dcolor 0, 3, 7
; Palette 46D
  dcolor 31, 31, 31
  dcolor 31, 20, 11
  dcolor 30, 4, 0
  dcolor 8, 0, 0
; Palette 46E
  dcolor 31, 31, 31
  dcolor 31, 20, 11
  dcolor 26, 17, 0
  dcolor 8, 0, 0
; Palette 46F
  dcolor 31, 31, 31
  dcolor 31, 20, 11
  dcolor 12, 8, 23
  dcolor 8, 0, 0
; Palette 470
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 471
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 472
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 473
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 474
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 475
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 476
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 477
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 478
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 479
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 47A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 47B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 47C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 47D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 47E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 47F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 480
  dcolor 31, 27, 0
  dcolor 31, 18, 5
  dcolor 31, 0, 0
  dcolor 8, 0, 8
; Palette 481
  dcolor 31, 20, 11
  dcolor 27, 27, 31
  dcolor 31, 10, 25
  dcolor 9, 2, 0
; Palette 482
  dcolor 31, 23, 12
  dcolor 31, 29, 0
  dcolor 31, 9, 0
  dcolor 11, 0, 0
; Palette 483
  dcolor 31, 22, 10
  dcolor 0, 26, 31
  dcolor 11, 9, 21
  dcolor 4, 0, 4
; Palette 484
  dcolor 20, 13, 6
  dcolor 31, 25, 14
  dcolor 31, 10, 10
  dcolor 8, 4, 0
; Palette 485
  dcolor 31, 22, 11
  dcolor 5, 16, 0
  dcolor 18, 11, 0
  dcolor 8, 0, 4
; Palette 486
  dcolor 28, 22, 7
  dcolor 28, 28, 31
  dcolor 0, 22, 22
  dcolor 5, 0, 7
; Palette 487
  dcolor 29, 7, 0
  dcolor 28, 20, 7
  dcolor 31, 25, 0
  dcolor 8, 3, 0
; Palette 488
  dcolor 31, 22, 14
  dcolor 24, 27, 31
  dcolor 31, 5, 0
  dcolor 0, 0, 7
; Palette 489
  dcolor 31, 26, 14
  dcolor 14, 29, 29
  dcolor 10, 13, 17
  dcolor 0, 0, 6
; Palette 48A
  dcolor 31, 15, 0
  dcolor 31, 22, 14
  dcolor 31, 15, 23
  dcolor 2, 0, 6
; Palette 48B
  dcolor 25, 30, 31
  dcolor 31, 28, 10
  dcolor 31, 6, 0
  dcolor 0, 0, 6
; Palette 48C
  dcolor 31, 22, 6
  dcolor 25, 31, 8
  dcolor 1, 9, 25
  dcolor 0, 0, 5
; Palette 48D
  dcolor 31, 27, 22
  dcolor 31, 27, 0
  dcolor 31, 4, 0
  dcolor 0, 0, 0
; Palette 48E
  dcolor 13, 28, 14
  dcolor 31, 24, 18
  dcolor 31, 16, 0
  dcolor 4, 3, 2
; Palette 48F
  dcolor 0, 10, 31
  dcolor 24, 27, 31
  dcolor 31, 23, 15
  dcolor 0, 1, 8
; Palette 490
  dcolor 27, 29, 31
  dcolor 31, 24, 11
  dcolor 31, 17, 28
  dcolor 7, 3, 0
; Palette 491
  dcolor 31, 31, 15
  dcolor 31, 19, 10
  dcolor 4, 10, 31
  dcolor 0, 0, 4
; Palette 492
  dcolor 31, 27, 30
  dcolor 31, 25, 15
  dcolor 31, 10, 10
  dcolor 6, 0, 2
; Palette 493
  dcolor 30, 7, 0
  dcolor 31, 19, 9
  dcolor 0, 18, 31
  dcolor 0, 0, 5
; Palette 494
  dcolor 27, 11, 3
  dcolor 31, 21, 10
  dcolor 13, 28, 31
  dcolor 7, 0, 3
; Palette 495
  dcolor 31, 11, 6
  dcolor 31, 20, 10
  dcolor 13, 31, 23
  dcolor 6, 0, 0
; Palette 496
  dcolor 17, 27, 31
  dcolor 31, 22, 9
  dcolor 25, 12, 1
  dcolor 7, 2, 0
; Palette 497
  dcolor 31, 20, 12
  dcolor 31, 29, 18
  dcolor 30, 6, 12
  dcolor 5, 0, 0
; Palette 498
  dcolor 31, 25, 12
  dcolor 21, 29, 31
  dcolor 8, 18, 30
  dcolor 0, 1, 4
; Palette 499
  dcolor 31, 25, 0
  dcolor 31, 21, 9
  dcolor 16, 8, 25
  dcolor 0, 1, 6
; Palette 49A
  dcolor 31, 19, 7
  dcolor 31, 31, 16
  dcolor 4, 17, 31
  dcolor 0, 0, 0
; Palette 49B
  dcolor 24, 31, 10
  dcolor 31, 20, 13
  dcolor 31, 10, 6
  dcolor 6, 0, 0
; Palette 49C
  dcolor 24, 11, 2
  dcolor 31, 25, 25
  dcolor 31, 17, 0
  dcolor 0, 0, 6
; Palette 49D
  dcolor 31, 6, 0
  dcolor 31, 21, 10
  dcolor 15, 10, 26
  dcolor 0, 0, 0
; Palette 49E
  dcolor 31, 24, 12
  dcolor 31, 17, 15
  dcolor 0, 28, 3
  dcolor 0, 5, 0
; Palette 49F
  dcolor 31, 23, 16
  dcolor 31, 21, 25
  dcolor 29, 8, 0
  dcolor 5, 0, 0
; Palette 4A0
  dcolor 31, 20, 13
  dcolor 1, 25, 16
  dcolor 30, 10, 3
  dcolor 0, 0, 4
; Palette 4A1
  dcolor 31, 21, 1
  dcolor 24, 29, 31
  dcolor 17, 22, 11
  dcolor 0, 0, 4
; Palette 4A2
  dcolor 31, 19, 10
  dcolor 0, 23, 31
  dcolor 31, 25, 2
  dcolor 0, 0, 4
; Palette 4A3
  dcolor 31, 17, 21
  dcolor 31, 22, 14
  dcolor 28, 9, 2
  dcolor 5, 0, 0
; Palette 4A4
  dcolor 2, 30, 10
  dcolor 31, 19, 8
  dcolor 21, 7, 5
  dcolor 0, 5, 0
; Palette 4A5
  dcolor 31, 24, 15
  dcolor 31, 9, 12
  dcolor 31, 20, 0
  dcolor 0, 0, 0
; Palette 4A6
  dcolor 31, 27, 29
  dcolor 31, 21, 11
  dcolor 31, 10, 4
  dcolor 8, 3, 0
; Palette 4A7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4A8
  dcolor 31, 28, 0
  dcolor 31, 18, 11
  dcolor 4, 24, 16
  dcolor 0, 0, 0
; Palette 4A9
  dcolor 31, 19, 11
  dcolor 17, 26, 30
  dcolor 31, 17, 0
  dcolor 4, 0, 0
; Palette 4AA
  dcolor 31, 23, 0
  dcolor 31, 31, 13
  dcolor 31, 3, 0
  dcolor 0, 0, 6
; Palette 4AB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4AC
  dcolor 31, 22, 11
  dcolor 24, 28, 31
  dcolor 31, 5, 0
  dcolor 5, 0, 0
; Palette 4AD
  dcolor 31, 24, 0
  dcolor 13, 28, 28
  dcolor 0, 16, 29
  dcolor 0, 0, 6
; Palette 4AE
  dcolor 31, 27, 0
  dcolor 7, 31, 16
  dcolor 0, 19, 4
  dcolor 5, 0, 0
; Palette 4AF
  dcolor 31, 27, 0
  dcolor 5, 26, 31
  dcolor 30, 14, 0
  dcolor 5, 0, 0
; Palette 4B0
  dcolor 31, 27, 22
  dcolor 31, 21, 5
  dcolor 31, 5, 0
  dcolor 0, 0, 6
; Palette 4B1
  dcolor 31, 26, 1
  dcolor 29, 26, 31
  dcolor 28, 5, 28
  dcolor 0, 0, 8
; Palette 4B2
  dcolor 31, 27, 0
  dcolor 31, 25, 17
  dcolor 18, 9, 0
  dcolor 0, 4, 0
; Palette 4B3
  dcolor 0, 11, 25
  dcolor 14, 27, 30
  dcolor 31, 19, 6
  dcolor 0, 0, 5
; Palette 4B4
  dcolor 31, 22, 28
  dcolor 31, 22, 0
  dcolor 31, 3, 16
  dcolor 5, 0, 0
; Palette 4B5
  dcolor 31, 27, 0
  dcolor 15, 22, 31
  dcolor 29, 14, 0
  dcolor 0, 0, 0
; Palette 4B6
  dcolor 22, 28, 31
  dcolor 16, 10, 31
  dcolor 31, 10, 2
  dcolor 0, 0, 0
; Palette 4B7
  dcolor 31, 28, 18
  dcolor 0, 21, 31
  dcolor 31, 5, 11
  dcolor 0, 4, 9
; Palette 4B8
  dcolor 31, 26, 0
  dcolor 31, 19, 23
  dcolor 31, 0, 9
  dcolor 0, 0, 0
; Palette 4B9
  dcolor 31, 30, 20
  dcolor 31, 29, 0
  dcolor 24, 6, 0
  dcolor 0, 0, 0
; Palette 4BA
  dcolor 31, 23, 12
  dcolor 31, 8, 0
  dcolor 0, 23, 31
  dcolor 0, 0, 0
; Palette 4BB
  dcolor 31, 8, 0
  dcolor 26, 29, 31
  dcolor 0, 14, 29
  dcolor 0, 0, 7
; Palette 4BC
  dcolor 10, 27, 19
  dcolor 26, 3, 1
  dcolor 31, 30, 12
  dcolor 7, 0, 0
; Palette 4BD
  dcolor 21, 26, 31
  dcolor 31, 18, 24
  dcolor 31, 15, 0
  dcolor 4, 0, 0
; Palette 4BE
  dcolor 7, 26, 19
  dcolor 31, 31, 3
  dcolor 0, 11, 26
  dcolor 0, 0, 0
; Palette 4BF
  dcolor 29, 28, 6
  dcolor 31, 22, 13
  dcolor 0, 11, 23
  dcolor 0, 0, 0
; Palette 4C0
  dcolor 31, 27, 0
  dcolor 5, 31, 22
  dcolor 31, 8, 0
  dcolor 0, 0, 0
; Palette 4C1
  dcolor 31, 31, 27
  dcolor 31, 12, 22
  dcolor 31, 31, 0
  dcolor 0, 0, 0
; Palette 4C2
  dcolor 23, 10, 0
  dcolor 31, 20, 9
  dcolor 0, 21, 31
  dcolor 5, 0, 0
; Palette 4C3
  dcolor 12, 31, 26
  dcolor 31, 19, 8
  dcolor 10, 11, 25
  dcolor 0, 0, 5
; Palette 4C4
  dcolor 9, 28, 31
  dcolor 31, 23, 13
  dcolor 29, 10, 18
  dcolor 4, 0, 0
; Palette 4C5
  dcolor 31, 23, 16
  dcolor 31, 7, 20
  dcolor 21, 8, 0
  dcolor 0, 0, 0
; Palette 4C6
  dcolor 31, 25, 0
  dcolor 31, 19, 7
  dcolor 31, 4, 0
  dcolor 0, 0, 0
; Palette 4C7
  dcolor 24, 31, 0
  dcolor 31, 23, 12
  dcolor 8, 15, 31
  dcolor 0, 0, 5
; Palette 4C8
  dcolor 31, 22, 15
  dcolor 15, 9, 26
  dcolor 31, 3, 11
  dcolor 0, 0, 4
; Palette 4C9
  dcolor 31, 22, 15
  dcolor 31, 28, 3
  dcolor 26, 8, 0
  dcolor 0, 0, 0
; Palette 4CA
  dcolor 31, 23, 16
  dcolor 31, 15, 0
  dcolor 15, 9, 30
  dcolor 4, 0, 0
; Palette 4CB
  dcolor 31, 21, 15
  dcolor 18, 31, 2
  dcolor 5, 10, 25
  dcolor 0, 0, 4
; Palette 4CC
  dcolor 31, 21, 12
  dcolor 0, 11, 23
  dcolor 10, 24, 28
  dcolor 0, 0, 5
; Palette 4CD
  dcolor 31, 22, 15
  dcolor 13, 31, 7
  dcolor 4, 22, 30
  dcolor 4, 2, 0
; Palette 4CE
  dcolor 9, 15, 22
  dcolor 21, 28, 31
  dcolor 31, 4, 14
  dcolor 0, 3, 8
; Palette 4CF
  dcolor 31, 20, 13
  dcolor 5, 24, 31
  dcolor 31, 6, 0
  dcolor 0, 0, 0
; Palette 4D0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D2
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4D9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4DA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4DB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4DC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4DD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4DE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4DF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 4E0
  dcolor 31, 5, 26
  dcolor 25, 1, 14
  dcolor 14, 0, 8
  dcolor 0, 0, 0
; Palette 4E1
  dcolor 31, 31, 26
  dcolor 31, 28, 13
  dcolor 27, 20, 0
  dcolor 0, 0, 0
; Palette 4E2
  dcolor 31, 22, 28
  dcolor 26, 11, 14
  dcolor 22, 0, 0
  dcolor 8, 2, 0
; Palette 4E3
  dcolor 31, 28, 10
  dcolor 22, 20, 7
  dcolor 13, 13, 5
  dcolor 8, 2, 0
; Palette 4E4
  dcolor 26, 26, 31
  dcolor 18, 18, 28
  dcolor 10, 10, 18
  dcolor 8, 2, 0
; Palette 4E5
  dcolor 31, 28, 10
  dcolor 14, 21, 31
  dcolor 0, 7, 23
  dcolor 8, 2, 0
; Palette 4E6
  dcolor 24, 31, 31
  dcolor 31, 21, 1
  dcolor 19, 6, 0
  dcolor 8, 2, 0
; Palette 4E7
  dcolor 31, 28, 10
  dcolor 8, 23, 0
  dcolor 3, 14, 0
  dcolor 8, 2, 0
; Palette 4E8
  dcolor 31, 28, 10
  dcolor 26, 21, 12
  dcolor 21, 10, 1
  dcolor 8, 2, 0
; Palette 4E9
  dcolor 31, 29, 0
  dcolor 20, 17, 0
  dcolor 10, 6, 0
  dcolor 0, 0, 0
; Palette 4EA
  dcolor 22, 27, 29
  dcolor 1, 6, 25
  dcolor 12, 16, 24
  dcolor 0, 0, 4
; Palette 4EB
  dcolor 23, 13, 3
  dcolor 1, 6, 25
  dcolor 29, 22, 3
  dcolor 0, 0, 4
; Palette 4EC
  dcolor 1, 6, 25
  dcolor 0, 4, 14
  dcolor 18, 8, 0
  dcolor 23, 13, 3
; Palette 4ED
  dcolor 22, 27, 29
  dcolor 1, 6, 25
  dcolor 23, 13, 3
  dcolor 0, 0, 4
; Palette 4EE
  dcolor 31, 15, 0
  dcolor 22, 22, 31
  dcolor 14, 14, 19
  dcolor 0, 0, 4
; Palette 4EF
  dcolor 31, 31, 15
  dcolor 23, 23, 13
  dcolor 13, 13, 5
  dcolor 0, 0, 4
; Palette 4F0
  dcolor 31, 31, 31
  dcolor 20, 22, 22
  dcolor 6, 16, 12
  dcolor 2, 5, 7
; Palette 4F1
  dcolor 31, 31, 31
  dcolor 21, 26, 31
  dcolor 6, 15, 23
  dcolor 0, 0, 0
; Palette 4F2
  dcolor 31, 31, 31
  dcolor 21, 26, 31
  dcolor 12, 6, 21
  dcolor 0, 0, 0
; Palette 4F3
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 12, 6, 21
  dcolor 0, 0, 0
; Palette 4F4
  dcolor 0, 31, 12
  dcolor 21, 26, 31
  dcolor 6, 15, 23
  dcolor 0, 0, 0
; Palette 4F5
  dcolor 0, 31, 12
  dcolor 12, 6, 21
  dcolor 6, 3, 10
  dcolor 0, 0, 0
; Palette 4F6
  dcolor 31, 0, 0
  dcolor 26, 29, 31
  dcolor 20, 19, 28
  dcolor 0, 0, 0
; Palette 4F7
  dcolor 31, 31, 0
  dcolor 26, 29, 31
  dcolor 20, 19, 28
  dcolor 0, 0, 0
; Palette 4F8
  dcolor 14, 0, 31
  dcolor 26, 29, 31
  dcolor 20, 19, 28
  dcolor 0, 0, 0
; Palette 4F9
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 29, 2, 0
  dcolor 0, 0, 7
; Palette 4FA
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 18, 10, 6
  dcolor 0, 0, 7
; Palette 4FB
  dcolor 31, 31, 31
  dcolor 20, 20, 23
  dcolor 10, 10, 15
  dcolor 0, 0, 7
; Palette 4FC
  dcolor 31, 31, 31
  dcolor 24, 27, 29
  dcolor 27, 0, 20
  dcolor 0, 0, 7
; Palette 4FD
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 27, 0, 20
  dcolor 0, 0, 7
; Palette 4FE
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 21, 27, 31
  dcolor 0, 0, 7
; Palette 4FF
  dcolor 31, 31, 31
  dcolor 21, 27, 31
  dcolor 10, 13, 15
  dcolor 0, 0, 0
; Palette 500
  dcolor 31, 27, 20
  dcolor 22, 17, 11
  dcolor 14, 7, 3
  dcolor 6, 0, 0
; Palette 501
  dcolor 31, 29, 14
  dcolor 27, 19, 5
  dcolor 21, 14, 4
  dcolor 6, 0, 0
; Palette 502
  dcolor 23, 28, 31
  dcolor 14, 15, 31
  dcolor 1, 1, 18
  dcolor 6, 0, 0
; Palette 503
  dcolor 30, 18, 18
  dcolor 24, 11, 11
  dcolor 18, 4, 4
  dcolor 6, 0, 0
; Palette 504
  dcolor 28, 31, 10
  dcolor 11, 22, 4
  dcolor 0, 13, 0
  dcolor 6, 0, 0
; Palette 505
  dcolor 10, 5, 3
  dcolor 11, 22, 4
  dcolor 0, 13, 0
  dcolor 6, 0, 0
; Palette 506
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 507
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 508
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 509
  dcolor 31, 29, 14
  dcolor 27, 19, 5
  dcolor 21, 14, 4
  dcolor 6, 0, 0
; Palette 50A
  dcolor 21, 29, 31
  dcolor 8, 16, 20
  dcolor 1, 8, 10
  dcolor 6, 0, 0
; Palette 50B
  dcolor 31, 23, 20
  dcolor 23, 13, 10
  dcolor 17, 5, 3
  dcolor 6, 0, 0
; Palette 50C
  dcolor 23, 31, 18
  dcolor 14, 23, 11
  dcolor 10, 13, 4
  dcolor 6, 0, 0
; Palette 50D
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 50E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 50F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 510
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 511
  dcolor 31, 29, 14
  dcolor 27, 19, 5
  dcolor 21, 14, 4
  dcolor 6, 0, 0
; Palette 512
  dcolor 21, 29, 31
  dcolor 8, 16, 20
  dcolor 1, 8, 10
  dcolor 6, 0, 0
; Palette 513
  dcolor 31, 18, 13
  dcolor 24, 11, 9
  dcolor 17, 4, 2
  dcolor 6, 0, 0
; Palette 514
  dcolor 23, 31, 18
  dcolor 14, 23, 11
  dcolor 10, 13, 4
  dcolor 6, 0, 0
; Palette 515
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 516
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 517
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 518
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 519
  dcolor 31, 29, 14
  dcolor 27, 19, 5
  dcolor 21, 14, 4
  dcolor 6, 0, 0
; Palette 51A
  dcolor 21, 29, 31
  dcolor 8, 16, 20
  dcolor 1, 8, 10
  dcolor 6, 0, 0
; Palette 51B
  dcolor 31, 23, 20
  dcolor 23, 13, 10
  dcolor 17, 5, 3
  dcolor 6, 0, 0
; Palette 51C
  dcolor 23, 31, 18
  dcolor 14, 23, 11
  dcolor 10, 13, 4
  dcolor 6, 0, 0
; Palette 51D
  dcolor 23, 16, 14
  dcolor 19, 9, 5
  dcolor 10, 2, 0
  dcolor 6, 0, 0
; Palette 51E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 51F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 520
  dcolor 26, 20, 31
  dcolor 16, 12, 20
  dcolor 7, 4, 10
  dcolor 6, 0, 0
; Palette 521
  dcolor 24, 24, 31
  dcolor 9, 13, 18
  dcolor 3, 6, 10
  dcolor 6, 0, 0
; Palette 522
  dcolor 31, 31, 20
  dcolor 22, 17, 10
  dcolor 13, 8, 3
  dcolor 6, 0, 0
; Palette 523
  dcolor 20, 28, 22
  dcolor 31, 16, 0
  dcolor 7, 17, 12
  dcolor 2, 7, 6
; Palette 524
  dcolor 21, 31, 19
  dcolor 10, 16, 5
  dcolor 4, 10, 1
  dcolor 6, 0, 0
; Palette 525
  dcolor 20, 28, 22
  dcolor 13, 24, 17
  dcolor 7, 17, 12
  dcolor 2, 7, 6
; Palette 526
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 527
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 528
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 529
  dcolor 31, 29, 14
  dcolor 27, 19, 5
  dcolor 21, 14, 4
  dcolor 6, 0, 0
; Palette 52A
  dcolor 23, 28, 31
  dcolor 14, 15, 31
  dcolor 1, 1, 18
  dcolor 6, 0, 0
; Palette 52B
  dcolor 30, 23, 23
  dcolor 27, 15, 15
  dcolor 17, 7, 7
  dcolor 6, 0, 0
; Palette 52C
  dcolor 28, 31, 10
  dcolor 11, 22, 4
  dcolor 0, 13, 0
  dcolor 6, 0, 0
; Palette 52D
  dcolor 10, 5, 3
  dcolor 11, 22, 4
  dcolor 0, 13, 0
  dcolor 6, 0, 0
; Palette 52E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 52F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 530
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 531
  dcolor 31, 29, 14
  dcolor 27, 19, 5
  dcolor 21, 14, 4
  dcolor 6, 0, 0
; Palette 532
  dcolor 21, 29, 31
  dcolor 8, 16, 20
  dcolor 1, 8, 10
  dcolor 6, 0, 0
; Palette 533
  dcolor 31, 23, 20
  dcolor 23, 13, 10
  dcolor 17, 5, 3
  dcolor 6, 0, 0
; Palette 534
  dcolor 23, 31, 18
  dcolor 14, 23, 11
  dcolor 10, 13, 4
  dcolor 6, 0, 0
; Palette 535
  dcolor 27, 20, 27
  dcolor 23, 16, 23
  dcolor 20, 13, 20
  dcolor 17, 10, 17
; Palette 536
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 537
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 538
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 539
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 15, 16, 22
  dcolor 6, 0, 0
; Palette 53A
  dcolor 21, 29, 31
  dcolor 8, 16, 20
  dcolor 1, 8, 10
  dcolor 6, 0, 0
; Palette 53B
  dcolor 31, 0, 0
  dcolor 15, 7, 3
  dcolor 31, 20, 7
  dcolor 0, 12, 0
; Palette 53C
  dcolor 28, 31, 10
  dcolor 11, 22, 4
  dcolor 0, 13, 0
  dcolor 6, 0, 0
; Palette 53D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 53E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 53F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 540
  dcolor 25, 26, 31
  dcolor 20, 22, 26
  dcolor 16, 19, 22
  dcolor 6, 0, 0
; Palette 541
  dcolor 28, 25, 16
  dcolor 20, 14, 7
  dcolor 10, 8, 0
  dcolor 6, 0, 0
; Palette 542
  dcolor 23, 26, 31
  dcolor 11, 14, 20
  dcolor 2, 3, 10
  dcolor 6, 0, 0
; Palette 543
  dcolor 18, 27, 11
  dcolor 12, 17, 3
  dcolor 16, 19, 22
  dcolor 2, 8, 0
; Palette 544
  dcolor 25, 31, 22
  dcolor 14, 18, 8
  dcolor 6, 11, 2
  dcolor 6, 0, 0
; Palette 545
  dcolor 23, 22, 17
  dcolor 15, 12, 2
  dcolor 16, 19, 22
  dcolor 6, 0, 0
; Palette 546
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 547
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 548
  dcolor 16, 27, 16
  dcolor 8, 14, 8
  dcolor 1, 6, 1
  dcolor 6, 0, 0
; Palette 549
  dcolor 31, 23, 20
  dcolor 20, 15, 12
  dcolor 10, 6, 3
  dcolor 6, 0, 0
; Palette 54A
  dcolor 31, 23, 22
  dcolor 23, 12, 11
  dcolor 14, 5, 3
  dcolor 6, 0, 0
; Palette 54B
  dcolor 24, 27, 31
  dcolor 13, 16, 20
  dcolor 4, 6, 10
  dcolor 6, 0, 0
; Palette 54C
  dcolor 31, 25, 31
  dcolor 20, 12, 20
  dcolor 10, 6, 10
  dcolor 6, 0, 0
; Palette 54D
  dcolor 21, 31, 21
  dcolor 13, 20, 13
  dcolor 6, 13, 6
  dcolor 6, 0, 0
; Palette 54E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 54F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 550
  dcolor 31, 27, 25
  dcolor 23, 16, 14
  dcolor 10, 3, 0
  dcolor 6, 0, 0
; Palette 551
  dcolor 31, 31, 21
  dcolor 28, 20, 10
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 552
  dcolor 26, 29, 31
  dcolor 15, 18, 25
  dcolor 4, 5, 18
  dcolor 6, 0, 0
; Palette 553
  dcolor 31, 22, 18
  dcolor 25, 12, 0
  dcolor 17, 3, 0
  dcolor 6, 0, 0
; Palette 554
  dcolor 26, 31, 20
  dcolor 14, 20, 6
  dcolor 5, 10, 1
  dcolor 6, 0, 0
; Palette 555
  dcolor 31, 21, 31
  dcolor 20, 10, 20
  dcolor 10, 2, 10
  dcolor 6, 0, 0
; Palette 556
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 557
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 558
  dcolor 26, 29, 31

  dcolor 15, 18, 25
  dcolor 4, 5, 18
  dcolor 6, 0, 0
; Palette 559
  dcolor 25, 31, 14
  dcolor 15, 20, 6
  dcolor 6, 10, 1
  dcolor 6, 0, 0
; Palette 55A
  dcolor 31, 31, 21
  dcolor 28, 20, 10
  dcolor 13, 8, 3
  dcolor 6, 0, 0
; Palette 55B
  dcolor 31, 25, 31
  dcolor 20, 13, 18
  dcolor 10, 3, 8
  dcolor 6, 0, 0
; Palette 55C
  dcolor 31, 23, 22
  dcolor 24, 14, 12
  dcolor 11, 4, 3
  dcolor 6, 0, 0
; Palette 55D
  dcolor 31, 27, 17
  dcolor 19, 15, 15
  dcolor 0, 4, 15
  dcolor 6, 0, 0
; Palette 55E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 55F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 560
  dcolor 31, 27, 20
  dcolor 20, 15, 12
  dcolor 10, 5, 3
  dcolor 6, 0, 0
; Palette 561
  dcolor 31, 22, 20
  dcolor 22, 10, 0
  dcolor 14, 5, 0
  dcolor 6, 0, 0
; Palette 562
  dcolor 21, 29, 31
  dcolor 8, 16, 20
  dcolor 1, 8, 10
  dcolor 6, 0, 0
; Palette 563
  dcolor 31, 0, 0
  dcolor 15, 7, 3
  dcolor 31, 20, 7
  dcolor 0, 12, 0
; Palette 564
  dcolor 28, 31, 10
  dcolor 11, 22, 4
  dcolor 0, 13, 0
  dcolor 6, 0, 0
; Palette 565
  dcolor 31, 31, 18
  dcolor 24, 14, 5
  dcolor 11, 7, 0
  dcolor 6, 0, 0
; Palette 566
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 567
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 568
  dcolor 31, 27, 22
  dcolor 22, 15, 7
  dcolor 14, 6, 4
  dcolor 6, 0, 0
; Palette 569
  dcolor 31, 31, 31
  dcolor 26, 8, 4
  dcolor 17, 2, 1
  dcolor 13, 0, 0
; Palette 56A
  dcolor 31, 31, 31
  dcolor 25, 19, 27
  dcolor 18, 11, 22
  dcolor 0, 4, 10
; Palette 56B
  dcolor 22, 26, 31
  dcolor 12, 17, 28
  dcolor 4, 7, 18
  dcolor 6, 0, 0
; Palette 56C
  dcolor 31, 21, 12
  dcolor 24, 13, 4
  dcolor 14, 7, 0
  dcolor 6, 0, 0
; Palette 56D
  dcolor 31, 31, 20
  dcolor 24, 16, 7
  dcolor 12, 7, 3
  dcolor 6, 0, 0
; Palette 56E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 56F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 570
  dcolor 23, 25, 31
  dcolor 11, 15, 20
  dcolor 4, 6, 13
  dcolor 0, 0, 0
; Palette 571
  dcolor 31, 31, 17
  dcolor 20, 16, 7
  dcolor 10, 7, 2
  dcolor 0, 0, 0
; Palette 572
  dcolor 31, 22, 18
  dcolor 24, 8, 1
  dcolor 13, 3, 0
  dcolor 0, 0, 0
; Palette 573
  dcolor 22, 31, 18
  dcolor 10, 16, 1
  dcolor 4, 8, 0
  dcolor 0, 0, 0
; Palette 574
  dcolor 31, 25, 20
  dcolor 18, 11, 2
  dcolor 11, 5, 0
  dcolor 0, 0, 0
; Palette 575
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 0, 0, 0
; Palette 576
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 577
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 578
  dcolor 31, 31, 12
  dcolor 29, 19, 6
  dcolor 18, 12, 4
  dcolor 6, 0, 0
; Palette 579
  dcolor 23, 17, 23
  dcolor 16, 7, 16
  dcolor 10, 0, 10
  dcolor 6, 0, 0
; Palette 57A
  dcolor 18, 25, 31
  dcolor 5, 16, 31
  dcolor 1, 6, 21
  dcolor 6, 0, 0
; Palette 57B
  dcolor 18, 21, 25
  dcolor 9, 13, 19
  dcolor 4, 7, 14
  dcolor 6, 0, 0
; Palette 57C
  dcolor 31, 19, 15
  dcolor 31, 8, 5
  dcolor 16, 2, 0
  dcolor 6, 0, 0
; Palette 57D
  dcolor 29, 19, 11
  dcolor 23, 13, 7
  dcolor 13, 6, 0
  dcolor 6, 0, 0
; Palette 57E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 57F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 580
  dcolor 23, 25, 31
  dcolor 12, 14, 20
  dcolor 3, 5, 10
  dcolor 6, 0, 0
; Palette 581
  dcolor 22, 31, 19
  dcolor 19, 28, 16
  dcolor 17, 26, 14
  dcolor 6, 0, 0
; Palette 582
  dcolor 31, 28, 19
  dcolor 25, 17, 9
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 583
  dcolor 31, 22, 18
  dcolor 20, 12, 10
  dcolor 10, 3, 2
  dcolor 6, 0, 0
; Palette 584
  dcolor 22, 31, 19
  dcolor 14, 19, 6
  dcolor 7, 12, 3
  dcolor 6, 0, 0
; Palette 585
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 586
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 587
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 588
  dcolor 26, 20, 31
  dcolor 16, 12, 20
  dcolor 7, 4, 10
  dcolor 6, 0, 0
; Palette 589
  dcolor 24, 24, 31
  dcolor 9, 13, 18
  dcolor 3, 6, 10
  dcolor 6, 0, 0
; Palette 58A
  dcolor 31, 31, 20
  dcolor 22, 17, 10
  dcolor 13, 8, 3
  dcolor 6, 0, 0
; Palette 58B
  dcolor 31, 22, 19
  dcolor 20, 12, 9
  dcolor 10, 4, 2
  dcolor 6, 0, 0
; Palette 58C
  dcolor 21, 31, 19
  dcolor 10, 16, 5
  dcolor 4, 10, 1
  dcolor 6, 0, 0
; Palette 58D
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 58E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 58F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 590
  dcolor 26, 22, 26
  dcolor 16, 11, 16
  dcolor 10, 3, 10
  dcolor 6, 0, 0
; Palette 591
  dcolor 31, 28, 17
  dcolor 24, 17, 7
  dcolor 10, 7, 2
  dcolor 6, 0, 0
; Palette 592
  dcolor 21, 24, 31
  dcolor 12, 14, 20
  dcolor 4, 6, 10
  dcolor 6, 0, 0
; Palette 593
  dcolor 31, 17, 19
  dcolor 20, 9, 11
  dcolor 10, 1, 3
  dcolor 6, 0, 0
; Palette 594
  dcolor 31, 24, 18
  dcolor 20, 15, 10
  dcolor 10, 7, 3
  dcolor 6, 0, 0
; Palette 595
  dcolor 21, 24, 31
  dcolor 10, 9, 29
  dcolor 24, 1, 3
  dcolor 6, 0, 0
; Palette 596
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 597
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 598
  dcolor 31, 31, 31
  dcolor 16, 19, 27
  dcolor 0, 16, 10
  dcolor 6, 0, 0
; Palette 599
  dcolor 20, 25, 31
  dcolor 8, 11, 20
  dcolor 0, 3, 10
  dcolor 6, 0, 0
; Palette 59A
  dcolor 31, 31, 15
  dcolor 20, 15, 7
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 59B
  dcolor 23, 31, 21
  dcolor 11, 16, 6
  dcolor 2, 7, 0
  dcolor 6, 0, 0
; Palette 59C
  dcolor 31, 19, 16
  dcolor 20, 7, 5
  dcolor 10, 2, 0
  dcolor 6, 0, 0
; Palette 59D
  dcolor 31, 28, 20
  dcolor 20, 18, 11
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 59E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 59F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5A0
  dcolor 31, 28, 23
  dcolor 25, 21, 18
  dcolor 19, 16, 12
  dcolor 6, 0, 0
; Palette 5A1
  dcolor 28, 31, 21
  dcolor 20, 26, 14
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 5A2
  dcolor 31, 28, 19
  dcolor 20, 15, 9
  dcolor 10, 6, 4
  dcolor 6, 0, 0
; Palette 5A3
  dcolor 24, 31, 31
  dcolor 11, 17, 20
  dcolor 2, 7, 10
  dcolor 6, 0, 0
; Palette 5A4
  dcolor 25, 31, 22
  dcolor 13, 20, 7
  dcolor 3, 10, 0
  dcolor 6, 0, 0
; Palette 5A5
  dcolor 31, 31, 19
  dcolor 29, 20, 10
  dcolor 16, 8, 0
  dcolor 6, 0, 0
; Palette 5A6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5A7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5A8
  dcolor 24, 26, 31
  dcolor 11, 13, 20
  dcolor 4, 6, 10
  dcolor 6, 0, 0
; Palette 5A9
  dcolor 25, 31, 23
  dcolor 14, 20, 12
  dcolor 3, 10, 1
  dcolor 6, 0, 0
; Palette 5AA
  dcolor 31, 22, 22
  dcolor 24, 8, 8
  dcolor 10, 0, 0
  dcolor 6, 0, 0
; Palette 5AB
  dcolor 31, 31, 18
  dcolor 25, 15, 4
  dcolor 10, 4, 1
  dcolor 6, 0, 0
; Palette 5AC
  dcolor 31, 25, 19
  dcolor 20, 13, 9
  dcolor 10, 6, 1
  dcolor 6, 0, 0
; Palette 5AD
  dcolor 27, 20, 31
  dcolor 18, 8, 20
  dcolor 7, 0, 8
  dcolor 6, 0, 0
; Palette 5AE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5AF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5B0
  dcolor 24, 28, 31
  dcolor 13, 17, 20
  dcolor 2, 5, 11
  dcolor 6, 0, 0
; Palette 5B1
  dcolor 28, 23, 31
  dcolor 16, 8, 20
  dcolor 7, 3, 10
  dcolor 6, 0, 0
; Palette 5B2
  dcolor 31, 24, 19
  dcolor 27, 11, 0
  dcolor 14, 2, 0
  dcolor 6, 0, 0
; Palette 5B3
  dcolor 22, 31, 18
  dcolor 10, 16, 8
  dcolor 1, 8, 0
  dcolor 6, 0, 0
; Palette 5B4
  dcolor 31, 31, 15
  dcolor 25, 19, 5
  dcolor 9, 7, 0
  dcolor 6, 0, 0
; Palette 5B5
  dcolor 24, 28, 31
  dcolor 0, 10, 20
  dcolor 24, 0, 0
  dcolor 6, 0, 0
; Palette 5B6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5B7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5B8
  dcolor 31, 27, 20
  dcolor 16, 12, 0
  dcolor 7, 4, 0
  dcolor 6, 0, 0
; Palette 5B9
  dcolor 31, 31, 15
  dcolor 23, 14, 5
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5BA
  dcolor 15, 23, 31
  dcolor 5, 11, 24
  dcolor 0, 0, 10
  dcolor 6, 0, 0
; Palette 5BB
  dcolor 21, 31, 17
  dcolor 11, 16, 6
  dcolor 4, 7, 0
  dcolor 6, 0, 0
; Palette 5BC
  dcolor 31, 21, 23
  dcolor 20, 8, 12
  dcolor 10, 2, 3
  dcolor 6, 0, 0
; Palette 5BD
  dcolor 31, 23, 20
  dcolor 16, 12, 8
  dcolor 9, 6, 3
  dcolor 6, 0, 0
; Palette 5BE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5BF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5C0
  dcolor 31, 31, 20
  dcolor 20, 20, 0
  dcolor 10, 10, 0
  dcolor 6, 0, 0
; Palette 5C1
  dcolor 22, 26, 31
  dcolor 1, 14, 20
  dcolor 0, 0, 13
  dcolor 6, 0, 0
; Palette 5C2
  dcolor 31, 31, 15
  dcolor 23, 13, 0
  dcolor 12, 6, 0
  dcolor 6, 0, 0
; Palette 5C3
  dcolor 31, 25, 31
  dcolor 16, 7, 20
  dcolor 8, 1, 10
  dcolor 6, 0, 0
; Palette 5C4
  dcolor 23, 31, 17
  dcolor 12, 20, 1
  dcolor 5, 10, 0
  dcolor 6, 0, 0
; Palette 5C5
  dcolor 31, 22, 17
  dcolor 20, 9, 6
  dcolor 10, 4, 0
  dcolor 6, 0, 0
; Palette 5C6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5C7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5C8
  dcolor 31, 22, 31
  dcolor 20, 10, 20
  dcolor 10, 4, 10
  dcolor 6, 0, 0
; Palette 5C9
  dcolor 13, 18, 25
  dcolor 2, 5, 13
  dcolor 0, 1, 5
  dcolor 6, 0, 0
; Palette 5CA
  dcolor 14, 24, 31
  dcolor 4, 13, 23
  dcolor 0, 4, 12
  dcolor 6, 0, 0
; Palette 5CB
  dcolor 29, 20, 29
  dcolor 18, 8, 18
  dcolor 8, 2, 8
  dcolor 6, 0, 0
; Palette 5CC
  dcolor 27, 18, 27
  dcolor 16, 6, 16
  dcolor 6, 0, 6
  dcolor 6, 0, 0
; Palette 5CD
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 5CE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5CF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5D0
  dcolor 31, 31, 19
  dcolor 25, 15, 0
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5D1
  dcolor 31, 26, 17
  dcolor 20, 16, 9
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5D2
  dcolor 27, 0, 0
  dcolor 20, 16, 9
  dcolor 11, 7, 1
  dcolor 4, 8, 0
; Palette 5D3
  dcolor 31, 25, 26
  dcolor 26, 17, 18
  dcolor 13, 4, 6
  dcolor 6, 0, 0
; Palette 5D4
  dcolor 24, 31, 21
  dcolor 15, 20, 11
  dcolor 3, 9, 0
  dcolor 6, 0, 0
; Palette 5D5
  dcolor 23, 26, 31
  dcolor 12, 15, 20
  dcolor 3, 7, 10
  dcolor 6, 0, 0
; Palette 5D6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5D7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5D8
  dcolor 23, 26, 31
  dcolor 12, 15, 20
  dcolor 3, 7, 10
  dcolor 6, 0, 0
; Palette 5D9
  dcolor 31, 26, 21
  dcolor 27, 18, 12
  dcolor 15, 8, 0
  dcolor 6, 0, 0
; Palette 5DA
  dcolor 31, 23, 26
  dcolor 28, 16, 19
  dcolor 16, 4, 0
  dcolor 6, 0, 0
; Palette 5DB
  dcolor 31, 25, 15
  dcolor 20, 13, 8
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5DC
  dcolor 26, 31, 20
  dcolor 15, 20, 11
  dcolor 7, 10, 1
  dcolor 6, 0, 0
; Palette 5DD
  dcolor 23, 26, 31
  dcolor 12, 15, 20
  dcolor 3, 7, 10
  dcolor 6, 0, 0
; Palette 5DE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5DF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5E0
  dcolor 23, 26, 31
  dcolor 12, 15, 20
  dcolor 3, 7, 10
  dcolor 6, 0, 0
; Palette 5E1
  dcolor 26, 31, 20
  dcolor 15, 20, 11
  dcolor 7, 10, 1
  dcolor 6, 0, 0
; Palette 5E2
  dcolor 23, 26, 31
  dcolor 12, 15, 20
  dcolor 3, 7, 10
  dcolor 6, 0, 0
; Palette 5E3
  dcolor 31, 25, 15
  dcolor 20, 13, 8
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5E4
  dcolor 31, 25, 22
  dcolor 25, 8, 0
  dcolor 14, 3, 0
  dcolor 6, 0, 0
; Palette 5E5
  dcolor 30, 25, 31
  dcolor 17, 11, 20
  dcolor 10, 4, 10
  dcolor 6, 0, 0
; Palette 5E6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5E7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5E8
  dcolor 18, 29, 31
  dcolor 10, 18, 25
  dcolor 3, 7, 16
  dcolor 6, 0, 0
; Palette 5E9
  dcolor 26, 31, 20
  dcolor 15, 20, 11
  dcolor 7, 10, 1
  dcolor 6, 0, 0
; Palette 5EA
  dcolor 31, 31, 20
  dcolor 23, 14, 0
  dcolor 12, 7, 0
  dcolor 6, 0, 0
; Palette 5EB
  dcolor 31, 25, 15
  dcolor 20, 13, 8
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5EC
  dcolor 31, 25, 22
  dcolor 25, 8, 0
  dcolor 14, 3, 0
  dcolor 6, 0, 0
; Palette 5ED
  dcolor 30, 25, 31
  dcolor 17, 11, 20
  dcolor 10, 4, 10
  dcolor 6, 0, 0
; Palette 5EE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5EF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5F0
  dcolor 23, 25, 31
  dcolor 12, 15, 20
  dcolor 4, 7, 10
  dcolor 6, 0, 0
; Palette 5F1
  dcolor 31, 22, 17
  dcolor 22, 9, 0
  dcolor 10, 3, 0
  dcolor 6, 0, 0
; Palette 5F2
  dcolor 21, 31, 20
  dcolor 11, 20, 9
  dcolor 6, 10, 1
  dcolor 6, 0, 0
; Palette 5F3
  dcolor 31, 31, 19
  dcolor 23, 14, 0
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 5F4
  dcolor 31, 27, 16
  dcolor 20, 14, 4
  dcolor 10, 4, 0
  dcolor 6, 0, 0
; Palette 5F5
  dcolor 28, 24, 31
  dcolor 20, 15, 23
  dcolor 10, 6, 14
  dcolor 6, 0, 0
; Palette 5F6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5F7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5F8
  dcolor 31, 24, 31
  dcolor 24, 12, 20
  dcolor 12, 4, 9
  dcolor 6, 0, 0
; Palette 5F9
  dcolor 31, 22, 14
  dcolor 27, 11, 2
  dcolor 13, 1, 0
  dcolor 6, 0, 0
; Palette 5FA
  dcolor 18, 26, 31
  dcolor 8, 16, 21
  dcolor 2, 7, 11
  dcolor 6, 0, 0
; Palette 5FB
  dcolor 23, 31, 22
  dcolor 11, 20, 8
  dcolor 3, 9, 1
  dcolor 6, 0, 0
; Palette 5FC
  dcolor 31, 31, 14
  dcolor 25, 16, 3
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 5FD
  dcolor 31, 25, 18
  dcolor 20, 13, 8
  dcolor 10, 7, 1
  dcolor 6, 0, 0
; Palette 5FE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 5FF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 600
  dcolor 31, 15, 15
  dcolor 22, 8, 8
  dcolor 14, 3, 0
  dcolor 6, 0, 0
; Palette 601
  dcolor 31, 31, 15
  dcolor 26, 14, 3
  dcolor 14, 0, 0
  dcolor 6, 0, 0
; Palette 602
  dcolor 22, 25, 31
  dcolor 5, 12, 18
  dcolor 3, 5, 10
  dcolor 6, 0, 0
; Palette 603
  dcolor 31, 22, 26
  dcolor 16, 7, 13
  dcolor 10, 1, 8
  dcolor 6, 0, 0
; Palette 604
  dcolor 31, 26, 19
  dcolor 20, 12, 6
  dcolor 10, 4, 0
  dcolor 6, 0, 0
; Palette 605
  dcolor 21, 31, 18
  dcolor 12, 20, 7
  dcolor 3, 10, 0
  dcolor 6, 0, 0
; Palette 606
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 607
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 608
  dcolor 25, 25, 31
  dcolor 14, 17, 26
  dcolor 8, 8, 16
  dcolor 6, 0, 0
; Palette 609
  dcolor 21, 25, 31
  dcolor 8, 12, 20
  dcolor 0, 4, 12
  dcolor 6, 0, 0
; Palette 60A
  dcolor 31, 31, 16
  dcolor 23, 14, 0
  dcolor 12, 7, 0
  dcolor 6, 0, 0
; Palette 60B
  dcolor 31, 23, 20
  dcolor 23, 12, 4
  dcolor 12, 4, 0
  dcolor 6, 0, 0
; Palette 60C
  dcolor 27, 23, 31
  dcolor 15, 11, 19
  dcolor 6, 0, 8
  dcolor 6, 0, 0
; Palette 60D
  dcolor 31, 29, 19
  dcolor 20, 20, 9
  dcolor 10, 10, 0
  dcolor 6, 0, 0
; Palette 60E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 60F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 610
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 611
  dcolor 31, 19, 16
  dcolor 24, 12, 3
  dcolor 16, 2, 0
  dcolor 6, 0, 0
; Palette 612
  dcolor 31, 31, 14
  dcolor 25, 14, 0
  dcolor 12, 6, 0
  dcolor 6, 0, 0
; Palette 613
  dcolor 22, 31, 25
  dcolor 8, 20, 11
  dcolor 0, 10, 4
  dcolor 6, 0, 0
; Palette 614
  dcolor 20, 24, 31
  dcolor 2, 12, 20
  dcolor 0, 6, 15
  dcolor 6, 0, 0
; Palette 615
  dcolor 31, 24, 28
  dcolor 20, 12, 17
  dcolor 10, 5, 8
  dcolor 6, 0, 0
; Palette 616
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 617
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 618
  dcolor 31, 31, 18
  dcolor 26, 15, 4
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 619
  dcolor 23, 31, 16
  dcolor 15, 20, 7
  dcolor 6, 10, 2
  dcolor 6, 0, 0
; Palette 61A
  dcolor 13, 27, 18
  dcolor 6, 16, 12
  dcolor 0, 9, 7
  dcolor 6, 0, 0
; Palette 61B
  dcolor 21, 24, 31
  dcolor 10, 16, 25
  dcolor 2, 6, 14
  dcolor 6, 0, 0
; Palette 61C
  dcolor 31, 23, 17
  dcolor 23, 10, 6
  dcolor 13, 4, 0
  dcolor 6, 0, 0
; Palette 61D
  dcolor 31, 29, 19
  dcolor 20, 16, 7
  dcolor 10, 8, 0
  dcolor 6, 0, 0
; Palette 61E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 61F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 620
  dcolor 31, 23, 31
  dcolor 20, 11, 20
  dcolor 10, 4, 10
  dcolor 6, 0, 0
; Palette 621
  dcolor 18, 26, 31
  dcolor 9, 14, 22
  dcolor 0, 3, 12
  dcolor 6, 0, 0
; Palette 622
  dcolor 31, 24, 20
  dcolor 21, 11, 5
  dcolor 10, 4, 0
  dcolor 6, 0, 0
; Palette 623
  dcolor 31, 31, 17
  dcolor 23, 13, 0
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 624
  dcolor 23, 31, 19
  dcolor 13, 20, 9
  dcolor 5, 10, 0
  dcolor 6, 0, 0
; Palette 625
  dcolor 31, 25, 19
  dcolor 20, 15, 7
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 626
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 627
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 628
  dcolor 31, 28, 19
  dcolor 20, 17, 1
  dcolor 10, 8, 0
  dcolor 6, 0, 0
; Palette 629
  dcolor 31, 21, 17
  dcolor 24, 10, 0
  dcolor 11, 4, 0
  dcolor 6, 0, 0
; Palette 62A
  dcolor 19, 28, 31
  dcolor 10, 13, 23
  dcolor 4, 7, 10
  dcolor 6, 0, 0
; Palette 62B
  dcolor 31, 31, 16
  dcolor 27, 16, 4
  dcolor 13, 9, 4
  dcolor 6, 0, 0
; Palette 62C
  dcolor 28, 20, 31
  dcolor 16, 10, 20
  dcolor 7, 3, 12
  dcolor 6, 0, 0
; Palette 62D
  dcolor 24, 31, 19
  dcolor 15, 20, 9
  dcolor 6, 10, 2
  dcolor 6, 0, 0
; Palette 62E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 62F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 630
  dcolor 31, 31, 18
  dcolor 26, 15, 4
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 631
  dcolor 23, 31, 16
  dcolor 15, 20, 7
  dcolor 6, 10, 2
  dcolor 6, 0, 0
; Palette 632
  dcolor 13, 27, 18
  dcolor 6, 16, 12
  dcolor 0, 9, 7
  dcolor 6, 0, 0
; Palette 633
  dcolor 21, 24, 31
  dcolor 10, 16, 25
  dcolor 2, 6, 14
  dcolor 6, 0, 0
; Palette 634
  dcolor 31, 23, 17
  dcolor 23, 10, 6
  dcolor 13, 4, 0
  dcolor 6, 0, 0
; Palette 635
  dcolor 31, 29, 19
  dcolor 20, 16, 7
  dcolor 10, 8, 0
  dcolor 6, 0, 0
; Palette 636
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 637
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 638
  dcolor 27, 21, 31
  dcolor 15, 10, 20
  dcolor 5, 0, 10
  dcolor 6, 0, 0
; Palette 639
  dcolor 17, 28, 31
  dcolor 0, 10, 23
  dcolor 0, 3, 12
  dcolor 6, 0, 0
; Palette 63A
  dcolor 31, 23, 17
  dcolor 24, 10, 0
  dcolor 12, 4, 1
  dcolor 6, 0, 0
; Palette 63B
  dcolor 31, 31, 8
  dcolor 25, 14, 0
  dcolor 12, 7, 0
  dcolor 6, 0, 0
; Palette 63C
  dcolor 17, 31, 24
  dcolor 0, 18, 10
  dcolor 0, 10, 5
  dcolor 6, 0, 0
; Palette 63D
  dcolor 31, 31, 0
  dcolor 0, 0, 31
  dcolor 31, 0, 0
  dcolor 6, 0, 0
; Palette 63E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 63F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 640
  dcolor 31, 27, 18
  dcolor 20, 16, 8
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 641
  dcolor 20, 24, 31
  dcolor 7, 10, 20
  dcolor 2, 4, 10
  dcolor 6, 0, 0
; Palette 642
  dcolor 26, 31, 22
  dcolor 15, 20, 7
  dcolor 4, 10, 0
  dcolor 6, 0, 0
; Palette 643
  dcolor 31, 26, 21
  dcolor 25, 15, 15
  dcolor 16, 4, 4
  dcolor 6, 0, 0
; Palette 644
  dcolor 31, 25, 31
  dcolor 20, 13, 20
  dcolor 10, 3, 10
  dcolor 6, 0, 0
; Palette 645
  dcolor 31, 31, 21
  dcolor 29, 17, 4
  dcolor 13, 7, 0
  dcolor 6, 0, 0
; Palette 646
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 647
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 648
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 649
  dcolor 31, 31, 21
  dcolor 20, 20, 8
  dcolor 10, 9, 0
  dcolor 6, 0, 0
; Palette 64A
  dcolor 31, 27, 24
  dcolor 20, 12, 0
  dcolor 12, 1, 0
  dcolor 6, 0, 0
; Palette 64B
  dcolor 23, 27, 31
  dcolor 6, 13, 22
  dcolor 0, 5, 10
  dcolor 6, 0, 0
; Palette 64C
  dcolor 28, 24, 31
  dcolor 15, 10, 20
  dcolor 6, 3, 10
  dcolor 6, 0, 0
; Palette 64D
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 64E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 64F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 650
  dcolor 31, 17, 3
  dcolor 15, 11, 0
  dcolor 19, 15, 0
  dcolor 0, 9, 0
; Palette 651
  dcolor 19, 27, 31
  dcolor 10, 16, 20
  dcolor 0, 5, 10
  dcolor 6, 0, 0
; Palette 652
  dcolor 31, 31, 22
  dcolor 25, 15, 0
  dcolor 19, 9, 0
  dcolor 6, 0, 0
; Palette 653
  dcolor 22, 31, 19
  dcolor 12, 20, 8
  dcolor 6, 10, 2
  dcolor 6, 0, 0
; Palette 654
  dcolor 31, 27, 19
  dcolor 26, 21, 10
  dcolor 15, 13, 10
  dcolor 6, 0, 0
; Palette 655
  dcolor 31, 27, 25
  dcolor 23, 13, 10
  dcolor 13, 5, 0
  dcolor 6, 0, 0
; Palette 656
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 657
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 658
  dcolor 31, 22, 31
  dcolor 20, 13, 20
  dcolor 10, 1, 10
  dcolor 6, 0, 0
; Palette 659
  dcolor 31, 31, 7
  dcolor 21, 26, 8
  dcolor 8, 14, 0
  dcolor 6, 0, 0
; Palette 65A
  dcolor 31, 24, 19
  dcolor 24, 11, 5
  dcolor 14, 5, 2
  dcolor 6, 0, 0
; Palette 65B
  dcolor 31, 31, 19
  dcolor 27, 15, 0
  dcolor 11, 7, 0
  dcolor 6, 0, 0
; Palette 65C
  dcolor 19, 27, 31
  dcolor 0, 14, 20
  dcolor 0, 0, 12
  dcolor 6, 0, 0
; Palette 65D
  dcolor 31, 31, 7
  dcolor 15, 21, 3
  dcolor 5, 11, 0
  dcolor 6, 0, 0
; Palette 65E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 65F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 660
  dcolor 31, 31, 31
  dcolor 20, 20, 20
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 661
  dcolor 21, 27, 31
  dcolor 1, 13, 23
  dcolor 2, 5, 12
  dcolor 6, 0, 0
; Palette 662
  dcolor 23, 31, 17
  dcolor 13, 20, 5
  dcolor 4, 10, 0
  dcolor 6, 0, 0
; Palette 663
  dcolor 31, 27, 16
  dcolor 25, 15, 0
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 664
  dcolor 31, 22, 31
  dcolor 20, 11, 20
  dcolor 10, 3, 10
  dcolor 6, 0, 0
; Palette 665
  dcolor 31, 24, 19
  dcolor 20, 8, 0
  dcolor 10, 2, 0
  dcolor 6, 0, 0
; Palette 666
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 667
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 668
  dcolor 31, 31, 31
  dcolor 3, 16, 3
  dcolor 2, 8, 2
  dcolor 6, 0, 0
; Palette 669
  dcolor 27, 27, 14
  dcolor 16, 16, 0
  dcolor 7, 7, 0
  dcolor 6, 0, 0
; Palette 66A
  dcolor 31, 28, 18
  dcolor 20, 15, 5
  dcolor 10, 8, 0
  dcolor 6, 0, 0
; Palette 66B
  dcolor 15, 25, 31
  dcolor 8, 12, 20
  dcolor 0, 5, 14
  dcolor 6, 0, 0
; Palette 66C
  dcolor 31, 31, 7
  dcolor 17, 21, 8
  dcolor 7, 10, 0
  dcolor 6, 0, 0
; Palette 66D
  dcolor 31, 25, 31
  dcolor 20, 13, 20
  dcolor 10, 3, 10
  dcolor 6, 0, 0
; Palette 66E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 66F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 670
  dcolor 28, 22, 28
  dcolor 27, 18, 27
  dcolor 10, 10, 10
  dcolor 6, 0, 0
; Palette 671
  dcolor 31, 31, 14
  dcolor 15, 22, 9
  dcolor 5, 10, 0
  dcolor 6, 0, 0
; Palette 672
  dcolor 22, 27, 31
  dcolor 9, 13, 22
  dcolor 0, 6, 10
  dcolor 6, 0, 0
; Palette 673
  dcolor 31, 25, 21
  dcolor 24, 13, 10
  dcolor 15, 3, 0
  dcolor 6, 0, 0
; Palette 674
  dcolor 31, 31, 14
  dcolor 23, 18, 6
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 675
  dcolor 19, 15, 26
  dcolor 22, 27, 31
  dcolor 0, 6, 10
  dcolor 6, 0, 0
; Palette 676
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 677
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 678
  dcolor 26, 31, 23
  dcolor 15, 20, 11
  dcolor 5, 10, 2
  dcolor 6, 0, 0
; Palette 679
  dcolor 24, 27, 31
  dcolor 13, 16, 20
  dcolor 2, 6, 10
  dcolor 6, 0, 0
; Palette 67A
  dcolor 13, 17, 23
  dcolor 6, 11, 18
  dcolor 0, 2, 6
  dcolor 6, 0, 0
; Palette 67B
  dcolor 4, 9, 16
  dcolor 0, 2, 10
  dcolor 0, 1, 4
  dcolor 6, 0, 0
; Palette 67C
  dcolor 31, 24, 19
  dcolor 20, 11, 4
  dcolor 10, 3, 0
  dcolor 6, 0, 0
; Palette 67D
  dcolor 31, 31, 22
  dcolor 20, 18, 9
  dcolor 11, 7, 0
  dcolor 6, 0, 0
; Palette 67E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 67F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 680
  dcolor 27, 21, 31
  dcolor 16, 10, 20
  dcolor 6, 0, 10
  dcolor 6, 0, 0
; Palette 681
  dcolor 18, 26, 31
  dcolor 9, 12, 20
  dcolor 0, 5, 10
  dcolor 6, 0, 0
; Palette 682
  dcolor 31, 31, 16
  dcolor 26, 17, 5
  dcolor 10, 7, 0
  dcolor 6, 0, 0
; Palette 683
  dcolor 31, 24, 18
  dcolor 22, 9, 5
  dcolor 11, 3, 0
  dcolor 6, 0, 0
; Palette 684
  dcolor 23, 31, 18
  dcolor 12, 20, 5
  dcolor 4, 10, 0
  dcolor 6, 0, 0
; Palette 685
  dcolor 31, 27, 15
  dcolor 20, 14, 3
  dcolor 10, 6, 0
  dcolor 6, 0, 0
; Palette 686
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 687
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 688
  dcolor 26, 31, 22
  dcolor 14, 24, 9
  dcolor 4, 11, 0
  dcolor 6, 0, 0
; Palette 689
  dcolor 27, 27, 14
  dcolor 21, 21, 9
  dcolor 16, 16, 4
  dcolor 11, 11, 0
; Palette 68A
  dcolor 31, 28, 18
  dcolor 20, 15, 5
  dcolor 10, 8, 0
  dcolor 6, 0, 0
; Palette 68B
  dcolor 15, 25, 31
  dcolor 8, 12, 20
  dcolor 0, 5, 14
  dcolor 6, 0, 0
; Palette 68C
  dcolor 27, 19, 23
  dcolor 20, 10, 14
  dcolor 8, 2, 4
  dcolor 6, 0, 0
; Palette 68D
  dcolor 31, 23, 21
  dcolor 22, 11, 3
  dcolor 12, 0, 0
  dcolor 6, 0, 0
; Palette 68E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 68F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 690
  dcolor 27, 27, 16
  dcolor 16, 16, 0
  dcolor 6, 6, 0
  dcolor 0, 0, 4
; Palette 691
  dcolor 10, 16, 19
  dcolor 0, 8, 13
  dcolor 0, 0, 9
  dcolor 0, 0, 4
; Palette 692
  dcolor 15, 15, 5
  dcolor 19, 8, 0
  dcolor 8, 2, 0
  dcolor 0, 0, 4
; Palette 693
  dcolor 21, 14, 21
  dcolor 10, 1, 14
  dcolor 4, 0, 6
  dcolor 0, 0, 4
; Palette 694
  dcolor 20, 12, 18
  dcolor 13, 11, 15
  dcolor 6, 0, 11
  dcolor 0, 0, 4
; Palette 695
  dcolor 21, 16, 11
  dcolor 16, 5, 2
  dcolor 6, 0, 0
  dcolor 0, 0, 4
; Palette 696
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 697
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 698
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 699
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 69A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 69B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 69C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 69D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 69E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 69F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6A0
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 10, 10, 23
  dcolor 0, 0, 0
; Palette 6A1
  dcolor 31, 31, 31
  dcolor 29, 29, 1
  dcolor 5, 21, 0
  dcolor 0, 0, 0
; Palette 6A2
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 22, 13, 4
  dcolor 0, 0, 0
; Palette 6A3
  dcolor 31, 31, 31
  dcolor 31, 26, 16
  dcolor 4, 20, 7
  dcolor 5, 0, 0
; Palette 6A4
  dcolor 31, 31, 31
  dcolor 31, 26, 16
  dcolor 27, 10, 0
  dcolor 5, 0, 0
; Palette 6A5
  dcolor 31, 31, 31
  dcolor 31, 26, 16
  dcolor 28, 10, 19
  dcolor 5, 0, 0
; Palette 6A6
  dcolor 31, 31, 31
  dcolor 31, 26, 16
  dcolor 22, 14, 7
  dcolor 5, 0, 0
; Palette 6A7
  dcolor 31, 31, 31
  dcolor 31, 24, 13
  dcolor 5, 21, 0
  dcolor 0, 0, 0
; Palette 6A8
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 29, 2, 0
  dcolor 0, 0, 7
; Palette 6A9
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 18, 10, 6
  dcolor 0, 0, 7
; Palette 6AA
  dcolor 31, 31, 31
  dcolor 20, 20, 23
  dcolor 10, 10, 15
  dcolor 0, 0, 7
; Palette 6AB
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 22, 8, 0
  dcolor 0, 0, 7
; Palette 6AC
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 31, 18, 0
  dcolor 0, 0, 7
; Palette 6AD
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 5, 20, 31
  dcolor 0, 0, 7
; Palette 6AE
  dcolor 31, 31, 31
  dcolor 5, 20, 31
  dcolor 22, 8, 0
  dcolor 0, 0, 7
; Palette 6AF
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 0, 0
; Palette 6B0
  dcolor 31, 31, 31
  dcolor 22, 22, 22
  dcolor 10, 10, 10
  dcolor 0, 0, 0
; Palette 6B1
  dcolor 31, 31, 31
  dcolor 31, 22, 13
  dcolor 31, 28, 0
  dcolor 0, 0, 0
; Palette 6B2
  dcolor 31, 31, 31
  dcolor 31, 22, 13
  dcolor 18, 8, 0
  dcolor 0, 0, 0
; Palette 6B3
  dcolor 31, 31, 31
  dcolor 31, 28, 0
  dcolor 18, 8, 0
  dcolor 0, 0, 0
; Palette 6B4
  dcolor 31, 31, 31
  dcolor 31, 22, 13
  dcolor 21, 4, 0
  dcolor 0, 0, 0
; Palette 6B5
  dcolor 31, 31, 31
  dcolor 31, 28, 0
  dcolor 15, 14, 0
  dcolor 0, 0, 0
; Palette 6B6
  dcolor 31, 31, 0
  dcolor 31, 28, 0
  dcolor 15, 14, 0
  dcolor 0, 0, 0
; Palette 6B7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6B8
  dcolor 27, 29, 31
  dcolor 13, 18, 27
  dcolor 6, 9, 16
  dcolor 0, 0, 0
; Palette 6B9
  dcolor 27, 29, 31
  dcolor 13, 18, 27
  dcolor 0, 15, 9
  dcolor 0, 0, 0
; Palette 6BA
  dcolor 5, 26, 15
  dcolor 4, 21, 12
  dcolor 0, 15, 9
  dcolor 0, 0, 0
; Palette 6BB
  dcolor 31, 31, 18
  dcolor 23, 23, 13
  dcolor 0, 15, 9
  dcolor 0, 1, 0
; Palette 6BC
  dcolor 31, 31, 18
  dcolor 13, 18, 27
  dcolor 0, 15, 9
  dcolor 0, 0, 0
; Palette 6BD
  dcolor 0, 15, 9
  dcolor 13, 18, 27
  dcolor 6, 9, 16
  dcolor 0, 0, 0
; Palette 6BE
  dcolor 29, 1, 0
  dcolor 13, 18, 27
  dcolor 0, 15, 9
  dcolor 0, 0, 0
; Palette 6BF
  dcolor 31, 31, 18
  dcolor 13, 18, 27
  dcolor 6, 9, 16
  dcolor 0, 0, 0
; Palette 6C0
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6C1
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 31, 6, 0
  dcolor 0, 0, 0
; Palette 6C2
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 31, 27, 0
  dcolor 0, 0, 0
; Palette 6C3
  dcolor 21, 6, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6C4
  dcolor 0, 31, 0
  dcolor 31, 23, 0
  dcolor 31, 6, 0
  dcolor 0, 0, 0
; Palette 6C5
  dcolor 0, 31, 0
  dcolor 31, 23, 0
  dcolor 19, 15, 0
  dcolor 0, 0, 0
; Palette 6C6
  dcolor 0, 31, 0
  dcolor 0, 25, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6C7
  dcolor 0, 31, 0
  dcolor 0, 31, 0
  dcolor 31, 16, 1
  dcolor 0, 0, 0
; Palette 6C8
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6C9
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 31, 6, 0
  dcolor 0, 0, 0
; Palette 6CA
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 31, 27, 0
  dcolor 0, 0, 0
; Palette 6CB
  dcolor 21, 6, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6CC
  dcolor 0, 31, 0
  dcolor 31, 23, 0
  dcolor 31, 6, 0
  dcolor 0, 0, 0
; Palette 6CD
  dcolor 0, 31, 0
  dcolor 31, 23, 0
  dcolor 19, 15, 0
  dcolor 0, 0, 0
; Palette 6CE
  dcolor 0, 31, 0
  dcolor 0, 25, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6CF
  dcolor 0, 31, 0
  dcolor 0, 31, 0
  dcolor 31, 16, 1
  dcolor 0, 0, 0
; Palette 6D0
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6D1
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 31, 6, 0
  dcolor 0, 0, 0
; Palette 6D2
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 31, 22, 0
  dcolor 0, 0, 0
; Palette 6D3
  dcolor 0, 31, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6D4
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 3, 4, 9
  dcolor 0, 0, 0
; Palette 6D5
  dcolor 19, 2, 0
  dcolor 23, 28, 31
  dcolor 10, 16, 20
  dcolor 0, 0, 0
; Palette 6D6
  dcolor 0, 31, 0
  dcolor 26, 30, 31
  dcolor 23, 28, 31
  dcolor 0, 0, 0
; Palette 6D7
  dcolor 0, 31, 0
  dcolor 0, 31, 0
  dcolor 31, 16, 1
  dcolor 0, 0, 0
; Palette 6D8
  dcolor 31, 31, 31
  dcolor 13, 18, 22
  dcolor 5, 10, 13
  dcolor 0, 0, 0
; Palette 6D9
  dcolor 31, 31, 31
  dcolor 15, 20, 24
  dcolor 6, 11, 15
  dcolor 0, 0, 0
; Palette 6DA
  dcolor 31, 31, 31
  dcolor 21, 21, 21
  dcolor 15, 15, 15
  dcolor 0, 0, 0
; Palette 6DB
  dcolor 31, 31, 31
  dcolor 31, 23, 23
  dcolor 31, 16, 15
  dcolor 29, 0, 0
; Palette 6DC
  dcolor 31, 31, 31
  dcolor 31, 20, 0
  dcolor 31, 8, 0
  dcolor 14, 2, 0
; Palette 6DD
  dcolor 31, 31, 31
  dcolor 31, 20, 0
  dcolor 31, 12, 31
  dcolor 14, 2, 0
; Palette 6DE
  dcolor 31, 31, 31
  dcolor 31, 20, 0
  dcolor 0, 10, 31
  dcolor 14, 2, 0
; Palette 6DF
  dcolor 31, 31, 31
  dcolor 31, 12, 31
  dcolor 0, 10, 31
  dcolor 14, 2, 0
; Palette 6E0
  dcolor 31, 31, 31
  dcolor 18, 30, 30
  dcolor 12, 26, 26
  dcolor 0, 22, 22
; Palette 6E1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6E2
  dcolor 0, 0, 0
  dcolor 23, 27, 31
  dcolor 14, 19, 23
  dcolor 6, 11, 16
; Palette 6E3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6E4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 30, 2, 4
; Palette 6E5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 18, 31
; Palette 6E6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 23, 0
; Palette 6E7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 8, 22, 4
; Palette 6E8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 26, 9, 26
; Palette 6E9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 31, 31
; Palette 6EA
  dcolor 31, 22, 0
  dcolor 8, 14, 31
  dcolor 2, 6, 24
  dcolor 0, 0, 0
; Palette 6EB
  dcolor 31, 22, 0
  dcolor 26, 8, 8
  dcolor 19, 0, 0
  dcolor 0, 0, 0
; Palette 6EC
  dcolor 31, 22, 0
  dcolor 4, 20, 12
  dcolor 0, 15, 0
  dcolor 0, 0, 0
; Palette 6ED
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6EE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6EF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6F0
  dcolor 31, 31, 31
  dcolor 14, 27, 26
  dcolor 31, 17, 0
  dcolor 8, 4, 0
; Palette 6F1
  dcolor 31, 31, 31
  dcolor 30, 6, 0
  dcolor 31, 17, 0
  dcolor 8, 4, 0
; Palette 6F2
  dcolor 31, 31, 31
  dcolor 31, 24, 15
  dcolor 31, 17, 0
  dcolor 8, 4, 0
; Palette 6F3
  dcolor 31, 31, 31
  dcolor 14, 27, 26
  dcolor 13, 20, 18
  dcolor 8, 4, 0
; Palette 6F4
  dcolor 31, 31, 31
  dcolor 30, 27, 0
  dcolor 31, 17, 0
  dcolor 8, 4, 0
; Palette 6F5
  dcolor 31, 31, 31
  dcolor 24, 12, 0
  dcolor 31, 17, 0
  dcolor 8, 4, 0
; Palette 6F6
  dcolor 31, 31, 31
  dcolor 23, 22, 28
  dcolor 19, 13, 25
  dcolor 7, 5, 22
; Palette 6F7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 6F8
  dcolor 31, 31, 31
  dcolor 22, 22, 31
  dcolor 16, 16, 24
  dcolor 0, 3, 9
; Palette 6F9
  dcolor 31, 31, 31
  dcolor 22, 22, 31
  dcolor 4, 4, 15
  dcolor 0, 3, 9
; Palette 6FA
  dcolor 31, 31, 31
  dcolor 22, 22, 31
  dcolor 30, 27, 0
  dcolor 0, 3, 9
; Palette 6FB
  dcolor 31, 31, 31
  dcolor 17, 17, 23
  dcolor 4, 4, 15
  dcolor 0, 3, 9
; Palette 6FC
  dcolor 31, 31, 31
  dcolor 22, 22, 31
  dcolor 24, 0, 9
  dcolor 0, 3, 9
; Palette 6FD
  dcolor 31, 31, 31
  dcolor 0, 27, 14
  dcolor 0, 19, 8
  dcolor 0, 3, 9
; Palette 6FE
  dcolor 31, 31, 31
  dcolor 30, 26, 13
  dcolor 30, 12, 3
  dcolor 30, 18, 0
; Palette 6FF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 700
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 31, 8, 0
  dcolor 10, 4, 0
; Palette 701
  dcolor 31, 31, 31
  dcolor 22, 22, 31
  dcolor 31, 8, 0
  dcolor 10, 4, 0
; Palette 702
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 21, 7, 0
  dcolor 10, 4, 0
; Palette 703
  dcolor 31, 31, 31
  dcolor 22, 22, 31
  dcolor 21, 7, 0
  dcolor 10, 4, 0
; Palette 704
  dcolor 31, 31, 31
  dcolor 31, 8, 0
  dcolor 21, 7, 0
  dcolor 10, 4, 0
; Palette 705
  dcolor 21, 7, 0
  dcolor 31, 26, 0
  dcolor 31, 8, 0
  dcolor 10, 4, 0
; Palette 706
  dcolor 31, 31, 31
  dcolor 20, 27, 23
  dcolor 5, 19, 0
  dcolor 2, 12, 3
; Palette 707
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 708
  dcolor 31, 31, 31
  dcolor 31, 25, 14
  dcolor 31, 19, 0
  dcolor 11, 6, 0
; Palette 709
  dcolor 31, 31, 31
  dcolor 31, 25, 14
  dcolor 21, 7, 0
  dcolor 11, 6, 0
; Palette 70A
  dcolor 31, 31, 31
  dcolor 9, 0, 18
  dcolor 16, 18, 24
  dcolor 11, 6, 0
; Palette 70B
  dcolor 31, 31, 31
  dcolor 31, 19, 0
  dcolor 21, 7, 0
  dcolor 11, 6, 0
; Palette 70C
  dcolor 31, 31, 31
  dcolor 0, 19, 7
  dcolor 31, 19, 0
  dcolor 11, 6, 0
; Palette 70D
  dcolor 31, 31, 31
  dcolor 31, 25, 14
  dcolor 9, 0, 18
  dcolor 11, 6, 0
; Palette 70E
  dcolor 31, 31, 31
  dcolor 20, 29, 30
  dcolor 15, 23, 30
  dcolor 2, 9, 21
; Palette 70F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 710
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 711
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 712
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 713
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 714
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 715
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 716
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 717
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 718
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 719
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 71A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 71B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 71C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 71D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 71E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 71F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 720
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 721
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 722
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 723
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 724
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 725
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 726
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 727
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 728
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 729
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 72A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 72B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 72C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 72D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 72E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 72F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0

SECTION "OBP Palette Color Table (Kabuto)", ROMX[$7980], BANK[$35]
OBPPaletteColorTable::
; Palette 730
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 31, 31
; Palette 731
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 732
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 733
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 734
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 735
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 736
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 737
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 738
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 739
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 73A
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 73B
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 73C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 73D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 73E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 73F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 740
  dcolor 31, 31, 31
  dcolor 31, 24, 21
  dcolor 26, 0, 0
  dcolor 6, 0, 0
; Palette 741
  dcolor 31, 31, 31
  dcolor 31, 24, 21
  dcolor 0, 10, 31
  dcolor 0, 0, 6
; Palette 742
  dcolor 31, 31, 31
  dcolor 31, 24, 21
  dcolor 31, 19, 0
  dcolor 5, 2, 0
; Palette 743
  dcolor 31, 31, 31
  dcolor 31, 24, 21
  dcolor 8, 22, 4
  dcolor 0, 4, 0
; Palette 744
  dcolor 31, 31, 31
  dcolor 31, 24, 21
  dcolor 21, 10, 0
  dcolor 5, 2, 0
; Palette 745
  dcolor 31, 31, 31
  dcolor 31, 24, 21
  dcolor 26, 6, 21
  dcolor 6, 0, 0
; Palette 746
  dcolor 31, 31, 31
  dcolor 27, 27, 31
  dcolor 0, 21, 31
  dcolor 0, 0, 6
; Palette 747
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 15, 16, 15
  dcolor 0, 0, 0
; Palette 748
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 26, 0, 0
  dcolor 0, 0, 0
; Palette 749
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 10, 31
  dcolor 0, 0, 0
; Palette 74A
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 19, 0
  dcolor 0, 0, 0
; Palette 74B
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 8, 22, 4
  dcolor 0, 0, 0
; Palette 74C
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 21, 10, 0
  dcolor 0, 0, 0
; Palette 74D
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 26, 6, 21
  dcolor 0, 0, 0
; Palette 74E
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 21, 31
  dcolor 0, 0, 0
; Palette 74F
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 15, 16, 15
  dcolor 0, 0, 0
; Palette 750
  dcolor 31, 31, 31
  dcolor 31, 12, 12
  dcolor 23, 0, 0
  dcolor 0, 0, 0
; Palette 751
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 29, 13, 0
  dcolor 0, 0, 0
; Palette 752
  dcolor 31, 31, 31
  dcolor 11, 14, 31
  dcolor 0, 0, 27
  dcolor 0, 0, 0
; Palette 753
  dcolor 18, 23, 12
  dcolor 15, 18, 8
  dcolor 8, 12, 2
  dcolor 4, 6, 0
; Palette 754
  dcolor 0, 0, 8
  dcolor 31, 21, 0
  dcolor 31, 13, 0
  dcolor 28, 0, 0
; Palette 755
  dcolor 0, 0, 0
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 21, 27, 31
; Palette 756
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 757
  dcolor 31, 31, 31
  dcolor 31, 27, 17
  dcolor 31, 19, 0
  dcolor 16, 0, 0
; Palette 758
  dcolor 31, 31, 31
  dcolor 31, 18, 0
  dcolor 26, 0, 0
  dcolor 14, 0, 0
; Palette 759
  dcolor 31, 31, 31
  dcolor 10, 26, 31
  dcolor 0, 7, 31
  dcolor 0, 0, 14
; Palette 75A
  dcolor 31, 31, 31
  dcolor 31, 24, 0
  dcolor 31, 13, 0
  dcolor 10, 3, 0
; Palette 75B
  dcolor 31, 31, 31
  dcolor 24, 29, 0
  dcolor 6, 24, 0
  dcolor 0, 9, 0
; Palette 75C
  dcolor 31, 31, 31
  dcolor 31, 23, 10
  dcolor 21, 10, 0
  dcolor 10, 3, 0
; Palette 75D
  dcolor 31, 31, 31
  dcolor 31, 17, 28
  dcolor 26, 3, 20
  dcolor 11, 0, 7
; Palette 75E
  dcolor 31, 31, 31
  dcolor 21, 26, 31
  dcolor 0, 21, 31
  dcolor 0, 5, 14
; Palette 75F
  dcolor 31, 31, 31
  dcolor 24, 24, 28
  dcolor 15, 15, 19
  dcolor 0, 0, 0
; Palette 760
  dcolor 31, 31, 31
  dcolor 28, 16, 6
  dcolor 23, 12, 3
  dcolor 16, 8, 0
; Palette 761
  dcolor 31, 31, 31
  dcolor 31, 20, 12
  dcolor 0, 23, 0
  dcolor 0, 0, 8
; Palette 762
  dcolor 31, 31, 31
  dcolor 31, 18, 0
  dcolor 31, 3, 12
  dcolor 0, 0, 8
; Palette 763
  dcolor 31, 31, 31
  dcolor 31, 21, 7
  dcolor 26, 2, 2
  dcolor 0, 0, 0
; Palette 764
  dcolor 31, 31, 31
  dcolor 23, 28, 31
  dcolor 12, 20, 31
  dcolor 4, 10, 26
; Palette 765
  dcolor 31, 31, 31
  dcolor 31, 26, 0
  dcolor 31, 17, 0
  dcolor 24, 0, 0
; Palette 766
  dcolor 31, 31, 31
  dcolor 24, 24, 24
  dcolor 18, 18, 18
  dcolor 12, 12, 12
; Palette 767
  dcolor 31, 31, 31
  dcolor 8, 21, 31
  dcolor 0, 0, 24
  dcolor 0, 0, 10
; Palette 768
  dcolor 31, 31, 31
  dcolor 31, 21, 10
  dcolor 27, 0, 0
  dcolor 0, 0, 4
; Palette 769
  dcolor 31, 31, 31
  dcolor 31, 18, 10
  dcolor 0, 10, 30
  dcolor 0, 0, 0
; Palette 76A
  dcolor 31, 31, 31
  dcolor 31, 31, 24
  dcolor 31, 21, 0
  dcolor 10, 4, 0
; Palette 76B
  dcolor 31, 31, 31
  dcolor 8, 31, 31
  dcolor 5, 20, 12
  dcolor 0, 5, 0
; Palette 76C
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 76D
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 76E
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 76F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 770
  dcolor 0, 0, 0
  dcolor 0, 0, 8
  dcolor 0, 0, 0
  dcolor 31, 13, 0
; Palette 771
  dcolor 31, 31, 31
  dcolor 29, 29, 16
  dcolor 31, 14, 0
  dcolor 3, 3, 0
; Palette 772
  dcolor 31, 31, 31
  dcolor 27, 31, 31
  dcolor 31, 5, 0
  dcolor 0, 0, 10
; Palette 773
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 774
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 775
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 776
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 777
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 778
  dcolor 31, 31, 31
  dcolor 31, 22, 0
  dcolor 5, 13, 5
  dcolor 0, 0, 0
; Palette 779
  dcolor 31, 31, 31
  dcolor 19, 28, 28
  dcolor 8, 12, 12
  dcolor 0, 0, 0
; Palette 77A
  dcolor 31, 31, 31
  dcolor 25, 18, 7
  dcolor 5, 13, 21
  dcolor 0, 0, 0
; Palette 77B
  dcolor 31, 31, 31
  dcolor 20, 27, 31
  dcolor 10, 23, 31
  dcolor 0, 19, 31
; Palette 77C
  dcolor 31, 31, 31
  dcolor 31, 27, 31
  dcolor 31, 23, 31
  dcolor 31, 19, 31
; Palette 77D
  dcolor 31, 31, 31
  dcolor 25, 31, 24
  dcolor 19, 31, 17
  dcolor 13, 31, 10
; Palette 77E
  dcolor 31, 31, 31
  dcolor 31, 29, 20
  dcolor 31, 28, 10
  dcolor 31, 27, 0
; Palette 77F
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 780
  dcolor 31, 31, 31
  dcolor 31, 18, 12
  dcolor 8, 14, 21
  dcolor 0, 3, 7
; Palette 781
  dcolor 31, 31, 31
  dcolor 19, 22, 26
  dcolor 8, 14, 21
  dcolor 0, 3, 7
; Palette 782
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 5, 0
  dcolor 0, 3, 7
; Palette 783
  dcolor 31, 31, 31
  dcolor 31, 18, 12
  dcolor 31, 5, 0
  dcolor 0, 3, 7
; Palette 784
  dcolor 31, 31, 31
  dcolor 31, 31, 31
  dcolor 31, 18, 12
  dcolor 0, 3, 7
; Palette 785
  dcolor 31, 31, 31
  dcolor 31, 18, 12
  dcolor 22, 11, 6
  dcolor 0, 3, 7
; Palette 786
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 14, 8, 1
  dcolor 7, 1, 0
; Palette 787
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 29, 0, 0
  dcolor 7, 1, 0
; Palette 788
  dcolor 31, 31, 31
  dcolor 31, 20, 13
  dcolor 31, 31, 31
  dcolor 7, 1, 0
; Palette 789
  dcolor 31, 31, 31
  dcolor 31, 29, 8
  dcolor 31, 19, 0
  dcolor 17, 5, 0
; Palette 78A
  dcolor 0, 0, 0
  dcolor 31, 17, 0
  dcolor 31, 31, 4
  dcolor 31, 31, 28
; Palette 78B
  dcolor 0, 0, 0
  dcolor 0, 3, 16
  dcolor 10, 16, 23
  dcolor 20, 29, 31
; Palette 78C
  dcolor 0, 0, 0
  dcolor 31, 25, 16
  dcolor 18, 14, 8
  dcolor 1, 3, 6
; Palette 78D
  dcolor 0, 0, 0
  dcolor 31, 25, 16
  dcolor 5, 20, 28
  dcolor 1, 3, 6
; Palette 78E
  dcolor 0, 0, 0
  dcolor 28, 31, 0
  dcolor 5, 20, 28
  dcolor 1, 3, 6
; Palette 78F
  dcolor 0, 0, 0
  dcolor 28, 31, 0
  dcolor 4, 31, 18
  dcolor 1, 3, 6
; Palette 790
  dcolor 31, 31, 31
  dcolor 13, 29, 31
  dcolor 31, 4, 0
  dcolor 12, 0, 0
; Palette 791
  dcolor 31, 31, 31
  dcolor 31, 27, 0
  dcolor 10, 26, 0
  dcolor 0, 14, 0
; Palette 792
  dcolor 31, 31, 31
  dcolor 31, 27, 17
  dcolor 31, 10, 18
  dcolor 12, 5, 0
; Palette 793
  dcolor 31, 31, 31
  dcolor 31, 27, 17
  dcolor 31, 20, 0
  dcolor 12, 5, 0
; Palette 794
  dcolor 31, 31, 31
  dcolor 31, 14, 0
  dcolor 31, 20, 0
  dcolor 12, 5, 0
; Palette 795
  dcolor 31, 31, 31
  dcolor 31, 13, 4
  dcolor 31, 0, 0
  dcolor 5, 0, 0
; Palette 796
  dcolor 0, 0, 0
  dcolor 31, 31, 21
  dcolor 31, 19, 0
  dcolor 22, 10, 0
; Palette 797
  dcolor 0, 0, 0
  dcolor 31, 26, 31
  dcolor 31, 10, 31
  dcolor 18, 4, 9
; Palette 798
  dcolor 0, 0, 0
  dcolor 26, 31, 26
  dcolor 0, 31, 3
  dcolor 0, 14, 0
; Palette 799
  dcolor 0, 0, 0
  dcolor 18, 28, 31
  dcolor 0, 18, 31
  dcolor 0, 0, 20
; Palette 79A
  dcolor 0, 0, 0
  dcolor 31, 31, 21
  dcolor 31, 10, 31
  dcolor 22, 10, 0
; Palette 79B
  dcolor 0, 0, 0
  dcolor 31, 31, 21
  dcolor 0, 31, 3
  dcolor 22, 10, 0
; Palette 79C
  dcolor 0, 0, 0
  dcolor 31, 31, 21
  dcolor 0, 18, 31
  dcolor 22, 10, 0
; Palette 79D
  dcolor 0, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 31
; Palette 79E
  dcolor 0, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 28, 0
; Palette 79F
  dcolor 0, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 31, 20, 0
; Palette 7A0
  dcolor 0, 31, 31
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 29, 0, 0
; Palette 7A1
  dcolor 0, 0, 0
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7A2
  dcolor 31, 31, 31
  dcolor 31, 19, 1
  dcolor 27, 4, 0
  dcolor 11, 3, 0
; Palette 7A3
  dcolor 31, 31, 31
  dcolor 31, 30, 23
  dcolor 31, 19, 1
  dcolor 27, 4, 0
; Palette 7A4
  dcolor 31, 31, 31
  dcolor 31, 30, 23
  dcolor 31, 19, 1
  dcolor 11, 3, 0
; Palette 7A5
  dcolor 31, 31, 31
  dcolor 31, 0, 0
  dcolor 18, 16, 1
  dcolor 0, 0, 0
; Palette 7A6
  dcolor 31, 31, 31
  dcolor 31, 31, 17
  dcolor 31, 15, 0
  dcolor 31, 3, 0
; Palette 7A7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 30, 2, 4
; Palette 7A8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 18, 31
; Palette 7A9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 23, 0
; Palette 7AA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 8, 22, 4
; Palette 7AB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 26, 9, 26
; Palette 7AC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 31, 31, 31
; Palette 7AD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7AE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7AF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7B0
  dcolor 31, 31, 31
  dcolor 31, 31, 8
  dcolor 31, 31, 0
  dcolor 0, 0, 0
; Palette 7B1
  dcolor 0, 0, 0
  dcolor 26, 26, 5
  dcolor 24, 24, 0
  dcolor 0, 0, 0
; Palette 7B2
  dcolor 31, 31, 31
  dcolor 22, 22, 2
  dcolor 17, 17, 0
  dcolor 0, 0, 0
; Palette 7B3
  dcolor 31, 31, 31
  dcolor 0, 19, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7B4
  dcolor 31, 31, 31
  dcolor 31, 23, 0
  dcolor 31, 12, 0
  dcolor 12, 0, 0
; Palette 7B5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7B6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7B7
  dcolor 0, 0, 0
  dcolor 31, 31, 31
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7B8
  dcolor 31, 31, 31
  dcolor 27, 31, 27
  dcolor 8, 31, 12
  dcolor 0, 24, 0
; Palette 7B9
  dcolor 31, 31, 31
  dcolor 30, 22, 3
  dcolor 31, 13, 0
  dcolor 23, 8, 0
; Palette 7BA
  dcolor 31, 31, 31
  dcolor 16, 22, 26
  dcolor 8, 16, 28
  dcolor 0, 31, 31
; Palette 7BB
  dcolor 31, 31, 31
  dcolor 27, 31, 27
  dcolor 8, 31, 12
  dcolor 0, 24, 0
; Palette 7BC
  dcolor 31, 31, 31
  dcolor 18, 23, 31
  dcolor 7, 6, 19
  dcolor 0, 0, 10
; Palette 7BD
  dcolor 31, 31, 31
  dcolor 16, 22, 26
  dcolor 8, 16, 28
  dcolor 0, 31, 31
; Palette 7BE
  dcolor 31, 31, 31
  dcolor 31, 29, 10
  dcolor 31, 20, 5
  dcolor 31, 13, 0
; Palette 7BF
  dcolor 31, 31, 31
  dcolor 20, 27, 31
  dcolor 0, 24, 31
  dcolor 0, 15, 31
; Palette 7C0
  dcolor 31, 31, 31
  dcolor 31, 31, 19
  dcolor 31, 16, 15
  dcolor 31, 0, 0
; Palette 7C1
  dcolor 31, 31, 31
  dcolor 31, 26, 20
  dcolor 31, 22, 0
  dcolor 31, 12, 0
; Palette 7C2
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7C9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7CA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7CB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7CC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7CD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7CE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7CF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D2
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7D9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7DA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7DB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7DC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7DD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7DE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7DF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E2
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7E9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7EA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7EB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7EC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7ED
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7EE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7EF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F1
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F2
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F3
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F4
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F5
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F6
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F7
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F8
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7F9
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7FA
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7FB
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7FC
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7FD
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7FE
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
; Palette 7FF
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0
  dcolor 0, 0, 0

SECTION "BGP Palette Group Table (Kuwagata)", ROMX[$4000], BANK[$36]
BGPPaletteGroupTable::
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 0
  dpalette $1, $1, $1, $1, $1, $1, $1, $1 ; 1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F
  dpalette $10, $11, $12, $13, $14, $15, $16, $2 ; 10
  dpalette $18, $19, $1A, $1B, $1C, $1D, $1E, $2 ; 11
  dpalette $20, $21, $2A, $23, $2F, $30, $26, $0 ; 12
  dpalette $20, $21, $2B, $23, $31, $32, $26, $0 ; 13
  dpalette $20, $21, $2C, $23, $33, $34, $26, $0 ; 14
  dpalette $20, $21, $2D, $23, $35, $36, $26, $0 ; 15
  dpalette $20, $21, $2E, $23, $37, $38, $26, $0 ; 16
  dpalette $0, $27, $0, $0, $0, $0, $0, $0 ; 17
  dpalette $0, $28, $0, $0, $0, $0, $0, $0 ; 18
  dpalette $0, $29, $0, $0, $0, $0, $0, $0 ; 19
  dpalette $0, $E4, $E0, $0, $E1, $E2, $E3, $2 ; 1A
  dpalette $0, $E4, $0, $0, $0, $0, $0, $0 ; 1B
  dpalette $0, $E5, $0, $0, $0, $0, $0, $0 ; 1C
  dpalette $0, $E6, $0, $0, $0, $0, $0, $0 ; 1D
  dpalette $E8, $E9, $EA, $EB, $EC, $ED, $EE, $2 ; 1E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F
  dpalette $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7 ; 20
  dpalette $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF ; 21
  dpalette $100, $101, $102, $103, $104, $105, $106, $107 ; 22
  dpalette $108, $109, $10A, $10B, $10C, $10D, $10E, $10F ; 23
  dpalette $120, $121, $122, $123, $124, $125, $126, $127 ; 24
  dpalette $128, $129, $12A, $12B, $12C, $12D, $12E, $12F ; 25
  dpalette $130, $131, $132, $133, $134, $135, $136, $137 ; 26
  dpalette $138, $139, $13A, $13B, $13C, $13D, $13E, $13F ; 27
  dpalette $140, $141, $142, $143, $144, $145, $146, $2 ; 28
  dpalette $200, $201, $202, $203, $204, $205, $206, $207 ; 29
  dpalette $208, $209, $20A, $20B, $20C, $20D, $20E, $20F ; 2A
  dpalette $210, $211, $212, $213, $214, $215, $216, $217 ; 2B
  dpalette $218, $27, $21A, $21B, $21C, $21D, $21E, $21F ; 2C
  dpalette $220, $27, $222, $223, $224, $225, $226, $227 ; 2D
  dpalette $228, $229, $22A, $22B, $22C, $22D, $22E, $22F ; 2E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2F
  dpalette $150, $151, $152, $153, $154, $155, $156, $157 ; 30
  dpalette $158, $159, $15A, $15B, $15C, $15D, $15E, $15F ; 31
  dpalette $160, $161, $162, $163, $164, $165, $166, $167 ; 32
  dpalette $168, $169, $16A, $16B, $16C, $16D, $16E, $16F ; 33
  dpalette $170, $171, $172, $173, $174, $175, $176, $177 ; 34
  dpalette $178, $179, $17A, $17B, $17C, $17D, $17E, $17F ; 35
  dpalette $180, $181, $182, $183, $184, $185, $186, $187 ; 36
  dpalette $188, $189, $18A, $18B, $18C, $18D, $18E, $18F ; 37
  dpalette $190, $191, $192, $193, $194, $195, $196, $197 ; 38
  dpalette $198, $199, $19A, $19B, $19C, $19D, $19E, $19F ; 39
  dpalette $1B6, $1B7, $1B8, $1B9, $1BA, $1BB, $1BC, $2 ; 3A
  dpalette $6DA, $6DB, $6DC, $6DD, $6DE, $6DF, $6E0, $6E1 ; 3B
  dpalette $6E2, $6E3, $6E4, $6E5, $6E6, $6E7, $6E8, $6E9 ; 3C
  dpalette $0, $6EA, $0, $0, $0, $0, $0, $0 ; 3D
  dpalette $0, $6EB, $0, $0, $0, $0, $0, $0 ; 3E
  dpalette $0, $6EC, $0, $0, $0, $0, $0, $0 ; 3F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 40
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 41
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 42
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 43
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 44
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 45
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 46
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 47
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 48
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 49
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4F
  dpalette $1A0, $1A1, $1A2, $1A3, $1A4, $1A5, $1A6, $1A7 ; 50
  dpalette $1C0, $1C1, $1C2, $1C3, $1C4, $1C5, $1C6, $1C7 ; 51
  dpalette $4E0, $4E1, $0, $0, $0, $0, $0, $2 ; 52
  dpalette $4E2, $4E3, $4E4, $4E5, $4E6, $4E7, $4E8, $2 ; 53
  dpalette $4E9, $4EA, $4EB, $4EC, $4ED, $4EE, $4EF, $2 ; 54
  dpalette $4F0, $0, $0, $0, $0, $0, $0, $0 ; 55
  dpalette $4F1, $4F2, $4F3, $4F4, $4F5, $4F6, $4F7, $4F8 ; 56
  dpalette $4, $4, $4, $4, $4, $4, $4, $4 ; 57
  dpalette $4F9, $4FA, $4FB, $4FC, $4FD, $4FE, $4FF, $1 ; 58
  dpalette $6A0, $6A1, $6A2, $6A3, $6A4, $6A5, $6A6, $6A7 ; 59
  dpalette $6A8, $6A9, $6AA, $6AB, $6AC, $6AD, $6AE, $6AF ; 5A
  dpalette $6B0, $6B1, $6B2, $6B3, $6B4, $6B5, $6B6, $6B7 ; 5B
  dpalette $6B8, $6B9, $6BA, $6BB, $6BC, $6BD, $6BE, $6BF ; 5C
  dpalette $6C0, $6C1, $6C2, $6C3, $6C4, $6C5, $6C6, $6C7 ; 5D
  dpalette $6C8, $6C9, $6CA, $6CB, $6CC, $6CD, $6CE, $6CF ; 5E
  dpalette $6D0, $6D1, $6D2, $6D3, $6D4, $6D5, $6D6, $6D7 ; 5F
  dpalette $1A8, $1A9, $1AA, $1AB, $1AC, $1AD, $1AE, $2 ; 60
  dpalette $1AF, $1B0, $1B1, $1B2, $1B3, $1B4, $1B5, $2 ; 61
  dpalette $1C8, $1C9, $1CA, $1CB, $1CC, $1CD, $1CE, $2 ; 62
  dpalette $1CF, $1D0, $1D1, $1D2, $1D3, $1D4, $1D5, $2 ; 63
  dpalette $1D6, $1D7, $1D8, $1D9, $1DA, $1DB, $1DC, $2 ; 64
  dpalette $1DD, $1DE, $1DF, $1E0, $1E1, $1E2, $1E3, $2 ; 65
  dpalette $1E4, $1E5, $1E6, $1E7, $1E8, $1E9, $1EA, $2 ; 66
  dpalette $1EB, $1EC, $1ED, $1EE, $1EF, $1F0, $1F1, $2 ; 67
  dpalette $1F2, $1F3, $1F4, $1F5, $1F6, $1F7, $1F8, $2 ; 68
  dpalette $1F9, $1FA, $1FB, $1FC, $1FD, $1FE, $1FF, $2 ; 69
  dpalette $230, $231, $232, $233, $234, $235, $236, $2 ; 6A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6E
  dpalette $6D8, $6D9, $1C2, $1C3, $1C4, $1C5, $1C6, $1C7 ; 6F
  dpalette $2E0, $2E1, $2E2, $2E3, $230, $231, $232, $2 ; 70
  dpalette $2E4, $2E5, $2E6, $2E7, $230, $231, $232, $2 ; 71
  dpalette $2E8, $2E9, $2EA, $2EB, $230, $231, $232, $2 ; 72
  dpalette $2EC, $2ED, $2EE, $2EF, $230, $231, $232, $2 ; 73
  dpalette $2F0, $2F1, $2F2, $2F3, $230, $231, $232, $2 ; 74
  dpalette $2F4, $2F5, $2F6, $2F7, $230, $231, $232, $2 ; 75
  dpalette $2F8, $2F9, $2FA, $2FB, $230, $231, $232, $2 ; 76
  dpalette $2FC, $2FD, $2FE, $2FF, $230, $231, $232, $2 ; 77
  dpalette $300, $301, $302, $303, $230, $231, $232, $2 ; 78
  dpalette $304, $305, $306, $307, $230, $231, $232, $2 ; 79
  dpalette $308, $309, $30A, $30B, $230, $231, $232, $2 ; 7A
  dpalette $30C, $30D, $30E, $30F, $230, $231, $232, $2 ; 7B
  dpalette $239, $23A, $23B, $23C, $23D, $23E, $23F, $240 ; 7C
  dpalette $0, $0, $0, $243, $244, $245, $246, $2 ; 7D
  dpalette $258, $259, $25A, $25B, $25C, $25D, $25E, $2 ; 7E
  dpalette $260, $261, $262, $263, $264, $265, $266, $2 ; 7F
  dpalette $254, $255, $0, $0, $2B0, $2B1, $2B2, $2 ; 80
  dpalette $254, $255, $0, $0, $2B3, $2B4, $2B5, $2 ; 81
  dpalette $254, $255, $0, $0, $2B6, $2B7, $2B8, $2 ; 82
  dpalette $254, $255, $0, $0, $2B9, $2BA, $2BB, $2 ; 83
  dpalette $254, $255, $0, $0, $2BC, $2BD, $2BE, $2 ; 84
  dpalette $254, $255, $0, $0, $2BF, $2C0, $2C1, $2 ; 85
  dpalette $254, $255, $0, $0, $2C2, $2C3, $2C4, $2 ; 86
  dpalette $254, $255, $0, $0, $2C5, $2C6, $2C7, $2 ; 87
  dpalette $254, $255, $0, $0, $2C8, $2C9, $2CA, $2 ; 88
  dpalette $254, $255, $0, $0, $2CB, $2CC, $2CD, $2 ; 89
  dpalette $254, $255, $0, $0, $2CE, $2CF, $2D0, $2 ; 8A
  dpalette $254, $255, $0, $0, $2D1, $2D2, $2D3, $2 ; 8B
  dpalette $200, $201, $202, $203, $204, $205, $206, $267 ; 8C
  dpalette $270, $271, $272, $273, $274, $275, $276, $277 ; 8D
  dpalette $228, $229, $22A, $22B, $22C, $22D, $22E, $2 ; 8E
  dpalette $278, $279, $27A, $27B, $27C, $27D, $27E, $2 ; 8F
  dpalette $280, $281, $282, $283, $284, $285, $286, $287 ; 90
  dpalette $290, $291, $292, $293, $294, $295, $296, $2 ; 91
  dpalette $298, $299, $29A, $29B, $29C, $29D, $29E, $2 ; 92
  dpalette $2A0, $2A1, $2A2, $2A3, $2A4, $2A5, $2A6, $2 ; 93
  dpalette $6F0, $6F1, $6F2, $6F3, $6F4, $6F5, $6F6, $2 ; 94
  dpalette $6F8, $6F9, $6FA, $6FB, $6FC, $6FD, $6FE, $2 ; 95
  dpalette $700, $701, $702, $703, $704, $705, $706, $2 ; 96
  dpalette $708, $708, $70A, $70B, $70C, $70D, $70E, $2 ; 97
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 98
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 99
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AF
  dpalette $380, $381, $382, $0, $0, $0, $0, $0 ; B0
  dpalette $383, $384, $385, $0, $0, $0, $0, $0 ; B1
  dpalette $386, $387, $388, $0, $0, $0, $0, $0 ; B2
  dpalette $389, $38A, $38B, $0, $0, $0, $0, $0 ; B3
  dpalette $38C, $38D, $38E, $0, $0, $0, $0, $0 ; B4
  dpalette $38F, $390, $391, $0, $0, $0, $0, $0 ; B5
  dpalette $392, $393, $394, $0, $0, $0, $0, $0 ; B6
  dpalette $395, $396, $397, $0, $0, $0, $0, $0 ; B7
  dpalette $398, $399, $39A, $0, $0, $0, $0, $0 ; B8
  dpalette $39B, $39C, $39D, $0, $0, $0, $0, $0 ; B9
  dpalette $39E, $39F, $3A0, $0, $0, $0, $0, $0 ; BA
  dpalette $3A1, $3A2, $3A3, $0, $0, $0, $0, $0 ; BB
  dpalette $3A4, $3A5, $3A6, $0, $0, $0, $0, $0 ; BC
  dpalette $3A7, $3A8, $3A9, $0, $0, $0, $0, $0 ; BD
  dpalette $3AA, $3AB, $3AC, $0, $0, $0, $0, $0 ; BE
  dpalette $3AD, $3AE, $3AF, $0, $0, $0, $0, $0 ; BF
  dpalette $3B0, $3B1, $3B2, $0, $0, $0, $0, $0 ; C0
  dpalette $3B3, $3B4, $3B5, $0, $0, $0, $0, $0 ; C1
  dpalette $3B6, $3B7, $3B8, $0, $0, $0, $0, $0 ; C2
  dpalette $3B9, $3BA, $3BB, $0, $0, $0, $0, $0 ; C3
  dpalette $3BC, $3BD, $3BE, $0, $0, $0, $0, $0 ; C4
  dpalette $3BF, $3C0, $3C1, $0, $0, $0, $0, $0 ; C5
  dpalette $3C2, $3C3, $3C4, $0, $0, $0, $0, $0 ; C6
  dpalette $3C5, $3C6, $3C7, $0, $0, $0, $0, $0 ; C7
  dpalette $3C8, $3C9, $3CA, $0, $0, $0, $0, $0 ; C8
  dpalette $3CB, $3CC, $3CD, $0, $0, $0, $0, $0 ; C9
  dpalette $3CE, $3CF, $3D0, $0, $0, $0, $0, $0 ; CA
  dpalette $3D1, $3D2, $3D3, $0, $0, $0, $0, $0 ; CB
  dpalette $3D4, $3D5, $3D6, $0, $0, $0, $0, $0 ; CC
  dpalette $3D7, $3D8, $3D9, $0, $0, $0, $0, $0 ; CD
  dpalette $3DA, $3DB, $3DC, $0, $0, $0, $0, $0 ; CE
  dpalette $3DD, $3DE, $3DF, $0, $0, $0, $0, $0 ; CF
  dpalette $3E0, $3E1, $3E2, $0, $0, $0, $0, $0 ; D0
  dpalette $3E3, $3E4, $3E5, $0, $0, $0, $0, $0 ; D1
  dpalette $3E6, $3E7, $3E8, $0, $0, $0, $0, $0 ; D2
  dpalette $3E9, $3EA, $3EB, $0, $0, $0, $0, $0 ; D3
  dpalette $3EC, $3ED, $3EE, $0, $0, $0, $0, $0 ; D4
  dpalette $3EF, $3F0, $3F1, $0, $0, $0, $0, $0 ; D5
  dpalette $3F2, $3F3, $3F4, $0, $0, $0, $0, $0 ; D6
  dpalette $3F5, $3F6, $3F7, $0, $0, $0, $0, $0 ; D7
  dpalette $3F8, $3F9, $3FA, $0, $0, $0, $0, $0 ; D8
  dpalette $3FB, $3FC, $3FD, $0, $0, $0, $0, $0 ; D9
  dpalette $3FE, $3FF, $400, $0, $0, $0, $0, $0 ; DA
  dpalette $401, $402, $403, $0, $0, $0, $0, $0 ; DB
  dpalette $404, $405, $406, $0, $0, $0, $0, $0 ; DC
  dpalette $407, $408, $409, $0, $0, $0, $0, $0 ; DD
  dpalette $40A, $40B, $40C, $0, $0, $0, $0, $0 ; DE
  dpalette $40D, $40E, $40F, $0, $0, $0, $0, $0 ; DF
  dpalette $410, $411, $412, $0, $0, $0, $0, $0 ; E0
  dpalette $413, $414, $415, $0, $0, $0, $0, $0 ; E1
  dpalette $416, $417, $418, $0, $0, $0, $0, $0 ; E2
  dpalette $419, $41A, $41B, $0, $0, $0, $0, $0 ; E3
  dpalette $41C, $41D, $41E, $0, $0, $0, $0, $0 ; E4
  dpalette $41F, $420, $421, $0, $0, $0, $0, $0 ; E5
  dpalette $422, $423, $424, $0, $0, $0, $0, $0 ; E6
  dpalette $425, $426, $427, $0, $0, $0, $0, $0 ; E7
  dpalette $428, $429, $42A, $0, $0, $0, $0, $0 ; E8
  dpalette $42B, $42C, $42D, $0, $0, $0, $0, $0 ; E9
  dpalette $42E, $42F, $430, $0, $0, $0, $0, $0 ; EA
  dpalette $431, $432, $433, $0, $0, $0, $0, $0 ; EB
  dpalette $434, $435, $436, $0, $0, $0, $0, $0 ; EC
  dpalette $437, $438, $439, $0, $0, $0, $0, $0 ; ED
  dpalette $43A, $43B, $43C, $0, $0, $0, $0, $0 ; EE
  dpalette $43D, $43E, $43F, $0, $0, $0, $0, $0 ; EF
  dpalette $440, $441, $442, $0, $0, $0, $0, $0 ; F0
  dpalette $443, $444, $445, $0, $0, $0, $0, $0 ; F1
  dpalette $446, $447, $448, $0, $0, $0, $0, $0 ; F2
  dpalette $449, $44A, $44B, $0, $0, $0, $0, $0 ; F3
  dpalette $44C, $44D, $44E, $0, $0, $0, $0, $0 ; F4
  dpalette $44F, $450, $451, $0, $0, $0, $0, $0 ; F5
  dpalette $452, $453, $454, $0, $0, $0, $0, $0 ; F6
  dpalette $455, $456, $457, $0, $0, $0, $0, $0 ; F7
  dpalette $458, $459, $45A, $0, $0, $0, $0, $0 ; F8
  dpalette $45B, $45C, $45D, $0, $0, $0, $0, $0 ; F9
  dpalette $45E, $45F, $460, $0, $0, $0, $0, $0 ; FA
  dpalette $461, $462, $463, $0, $0, $0, $0, $0 ; FB
  dpalette $464, $465, $466, $0, $0, $0, $0, $0 ; FC
  dpalette $467, $468, $469, $0, $0, $0, $0, $0 ; FD
  dpalette $46A, $46B, $46C, $0, $0, $0, $0, $0 ; FE
  dpalette $46D, $46E, $46F, $0, $0, $0, $0, $0 ; FF
  dpalette $500, $501, $502, $503, $504, $505, $506, $2 ; 100
  dpalette $508, $509, $50A, $50B, $50C, $50D, $50E, $2 ; 101
  dpalette $510, $511, $512, $513, $514, $515, $516, $2 ; 102
  dpalette $518, $519, $51A, $51B, $51C, $51D, $51E, $2 ; 103
  dpalette $520, $521, $522, $523, $524, $525, $526, $2 ; 104
  dpalette $528, $529, $52A, $52B, $52C, $52D, $52E, $2 ; 105
  dpalette $530, $531, $532, $533, $534, $535, $536, $2 ; 106
  dpalette $538, $539, $53A, $53B, $53C, $53D, $53E, $2 ; 107
  dpalette $540, $541, $542, $543, $544, $545, $546, $2 ; 108
  dpalette $548, $549, $54A, $54B, $54C, $54D, $54E, $2 ; 109
  dpalette $550, $551, $552, $553, $554, $555, $556, $2 ; 10A
  dpalette $558, $559, $55A, $55B, $55C, $55D, $55E, $2 ; 10B
  dpalette $560, $561, $562, $563, $564, $565, $566, $2 ; 10C
  dpalette $568, $569, $56A, $56B, $56C, $56D, $56E, $2 ; 10D
  dpalette $570, $571, $572, $573, $574, $575, $576, $2 ; 10E
  dpalette $578, $579, $57A, $57B, $57C, $57D, $57E, $2 ; 10F
  dpalette $580, $581, $582, $583, $584, $585, $586, $2 ; 110
  dpalette $588, $589, $58A, $58B, $58C, $58D, $58E, $2 ; 111
  dpalette $590, $591, $592, $593, $594, $595, $596, $2 ; 112
  dpalette $598, $599, $59A, $59B, $59C, $59D, $59E, $2 ; 113
  dpalette $5A0, $5A1, $5A2, $5A3, $5A4, $5A5, $5A6, $2 ; 114
  dpalette $5A8, $5A9, $5AA, $5AB, $5AC, $5AD, $5AE, $2 ; 115
  dpalette $5B0, $5B1, $5B2, $5B3, $5B4, $5B5, $5B6, $2 ; 116
  dpalette $5B8, $5B9, $5BA, $5BB, $5BC, $5BD, $5BE, $2 ; 117
  dpalette $5C0, $5C1, $5C2, $5C3, $5C4, $5C5, $5C6, $2 ; 118
  dpalette $5C8, $5C9, $5CA, $5CB, $5CC, $5CD, $5CE, $2 ; 119
  dpalette $5D0, $5D1, $5D2, $5D3, $5D4, $5D5, $5D6, $2 ; 11A
  dpalette $5D8, $5D9, $5DA, $5DB, $5DC, $5DD, $5DE, $2 ; 11B
  dpalette $5E0, $5E1, $5E2, $5E3, $5E4, $5E5, $5E6, $2 ; 11C
  dpalette $5E8, $5E9, $5EA, $5EB, $5EC, $5ED, $5EE, $2 ; 11D
  dpalette $5F0, $5F1, $5F2, $5F3, $5F4, $5F5, $5F6, $2 ; 11E
  dpalette $5F8, $5F9, $5FA, $5FB, $5FC, $5FD, $5FE, $2 ; 11F
  dpalette $600, $601, $602, $603, $604, $605, $606, $2 ; 120
  dpalette $608, $609, $60A, $60B, $60C, $60D, $60E, $2 ; 121
  dpalette $610, $611, $612, $613, $614, $615, $616, $2 ; 122
  dpalette $618, $619, $61A, $61B, $61C, $61D, $61E, $2 ; 123
  dpalette $620, $621, $622, $623, $624, $625, $626, $2 ; 124
  dpalette $628, $629, $62A, $62B, $62C, $62D, $62E, $2 ; 125
  dpalette $630, $631, $632, $633, $634, $635, $636, $2 ; 126
  dpalette $638, $639, $63A, $63B, $63C, $63D, $63E, $2 ; 127
  dpalette $640, $641, $642, $643, $644, $645, $646, $2 ; 128
  dpalette $648, $649, $64A, $64B, $64C, $64D, $64E, $2 ; 129
  dpalette $650, $651, $652, $653, $654, $655, $656, $2 ; 12A
  dpalette $658, $659, $65A, $65B, $65C, $65D, $65E, $2 ; 12B
  dpalette $660, $661, $662, $663, $664, $665, $666, $2 ; 12C
  dpalette $668, $669, $66A, $66B, $66C, $66D, $66E, $2 ; 12D
  dpalette $670, $671, $672, $673, $674, $675, $676, $2 ; 12E
  dpalette $678, $679, $67A, $67B, $67C, $67D, $67E, $2 ; 12F
  dpalette $680, $681, $682, $683, $684, $685, $686, $2 ; 130
  dpalette $688, $689, $68A, $68B, $68C, $68D, $68E, $2 ; 131
  dpalette $690, $691, $692, $693, $694, $695, $696, $2 ; 132
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 133
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 134
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 135
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 136
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 137
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 138
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 139
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 140
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 141
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 142
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 143
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 144
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 145
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 146
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 147
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 148
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 149
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 150
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 151
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 152
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 153
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 154
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 155
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 156
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 157
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 158
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 159
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 160
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 161
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 162
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 163
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 164
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 165
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 166
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 167
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 168
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 169
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 170
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 171
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 172
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 173
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 174
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 175
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 176
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 177
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 178
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 179
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 180
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 181
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 182
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 183
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 184
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 185
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 186
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 187
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 188
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 189
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 190
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 191
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 192
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 193
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 194
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 195
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 196
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 197
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 198
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 199
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1ED
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FF

SECTION "OBP Palette Group Table (Kuwagata)", ROMX[$6000], BANK[$36]
OBPPaletteGroupTable::
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 0/200
  dpalette $1, $1, $1, $1, $1, $1, $1, $1 ; 1/201
  dpalette $10, $11, $12, $13, $14, $15, $16, $17 ; 2/202
  dpalette $18, $19, $1A, $1B, $1C, $1D, $1E, $1F ; 3/203
  dpalette $28, $29, $2A, $2B, $2C, $2D, $2E, $2F ; 4/204
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5/205
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6/206
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7/207
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8/208
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9/209
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A/20A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B/20B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C/20C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D/20D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E/20E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F/20F
  dpalette $10, $11, $12, $13, $14, $15, $16, $17 ; 10/210
  dpalette $11, $12, $13, $14, $0, $0, $0, $0 ; 11/211
  dpalette $20, $21, $22, $23, $0, $0, $0, $17 ; 12/212
  dpalette $24, $11, $12, $13, $14, $15, $16, $25 ; 13/213
  dpalette $30, $31, $32, $33, $34, $35, $36, $37 ; 14/214
  dpalette $38, $39, $3A, $3B, $3C, $3D, $3E, $3F ; 15/215
  dpalette $18, $19, $1A, $1B, $1C, $1D, $1E, $24 ; 16/216
  dpalette $0, $0, $0, $0, $0, $0, $24, $40 ; 17/217
  dpalette $41, $42, $0, $0, $0, $0, $0, $0 ; 18/218
  dpalette $48, $49, $4A, $4B, $4C, $4D, $4E, $4F ; 19/219
  dpalette $80, $81, $82, $83, $84, $85, $86, $87 ; 1A/21A
  dpalette $87, $0, $0, $0, $0, $0, $0, $0 ; 1B/21B
  dpalette $88, $89, $8A, $0, $0, $0, $0, $0 ; 1C/21C
  dpalette $8B, $8C, $8D, $0, $0, $0, $0, $0 ; 1D/21D
  dpalette $8E, $8F, $0, $0, $0, $0, $0, $0 ; 1E/21E
  dpalette $90, $91, $0, $0, $0, $0, $0, $0 ; 1F/21F
  dpalette $50, $51, $52, $53, $54, $55, $56, $0 ; 20/220
  dpalette $56, $57, $58, $0, $0, $0, $0, $0 ; 21/221
  dpalette $59, $0, $0, $0, $0, $0, $0, $0 ; 22/222
  dpalette $5A, $5B, $5C, $5D, $5E, $5F, $1, $0 ; 23/223
  dpalette $60, $0, $0, $0, $0, $0, $0, $0 ; 24/224
  dpalette $18, $19, $1A, $1B, $27, $1D, $1E, $24 ; 25/225
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 26/226
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 27/227
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 28/228
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 29/229
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2A/22A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2B/22B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2C/22C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2D/22D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2E/22E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 2F/22F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 30/230
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 31/231
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 32/232
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 33/233
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 34/234
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 35/235
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 36/236
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 37/237
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 38/238
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 39/239
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3A/23A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3B/23B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3C/23C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3D/23D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3E/23E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 3F/23F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 40/240
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 41/241
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 42/242
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 43/243
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 44/244
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 45/245
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 46/246
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 47/247
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 48/248
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 49/249
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4A/24A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4B/24B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4C/24C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4D/24D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4E/24E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 4F/24F
  dpalette $10, $0, $1A, $0, $0, $0, $0, $1F ; 50/250
  dpalette $61, $62, $63, $64, $0, $0, $0, $0 ; 51/251
  dpalette $65, $0, $0, $0, $0, $0, $0, $0 ; 52/252
  dpalette $66, $67, $68, $69, $6A, $6B, $6C, $0 ; 53/253
  dpalette $6D, $6E, $6F, $70, $71, $0, $0, $0 ; 54/254
  dpalette $72, $73, $74, $75, $76, $0, $0, $0 ; 55/255
  dpalette $0, $0, $77, $78, $79, $7A, $7B, $7C ; 56/256
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 57/257
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 58/258
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 59/259
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5A/25A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5B/25B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5C/25C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5D/25D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5E/25E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 5F/25F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 60/260
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 61/261
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 62/262
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 63/263
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 64/264
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 65/265
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 66/266
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 67/267
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 68/268
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 69/269
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6A/26A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6B/26B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6C/26C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6D/26D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6E/26E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 6F/26F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 70/270
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 71/271
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 72/272
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 73/273
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 74/274
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 75/275
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 76/276
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 77/277
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 78/278
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 79/279
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7A/27A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7B/27B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7C/27C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7D/27D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7E/27E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 7F/27F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 80/280
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 81/281
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 82/282
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 83/283
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 84/284
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 85/285
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 86/286
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 87/287
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 88/288
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 89/289
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8A/28A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8B/28B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8C/28C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8D/28D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8E/28E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 8F/28F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 90/290
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 91/291
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 92/292
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 93/293
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 94/294
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 95/295
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 96/296
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 97/297
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 98/298
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 99/299
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9A/29A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9B/29B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9C/29C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9D/29D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9E/29E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 9F/29F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A0/2A0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A1/2A1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A2/2A2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A3/2A3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A4/2A4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A5/2A5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A6/2A6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A7/2A7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A8/2A8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; A9/2A9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AA/2AA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AB/2AB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AC/2AC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AD/2AD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AE/2AE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; AF/2AF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B0/2B0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B1/2B1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B2/2B2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B3/2B3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B4/2B4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B5/2B5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B6/2B6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B7/2B7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B8/2B8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; B9/2B9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; BA/2BA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; BB/2BB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; BC/2BC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; BD/2BD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; BE/2BE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; BF/2BF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C0/2C0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C1/2C1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C2/2C2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C3/2C3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C4/2C4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C5/2C5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C6/2C6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C7/2C7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C8/2C8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; C9/2C9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; CA/2CA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; CB/2CB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; CC/2CC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; CD/2CD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; CE/2CE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; CF/2CF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D0/2D0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D1/2D1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D2/2D2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D3/2D3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D4/2D4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D5/2D5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D6/2D6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D7/2D7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D8/2D8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; D9/2D9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; DA/2DA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; DB/2DB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; DC/2DC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; DD/2DD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; DE/2DE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; DF/2DF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E0/2E0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E1/2E1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E2/2E2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E3/2E3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E4/2E4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E5/2E5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E6/2E6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E7/2E7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E8/2E8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; E9/2E9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; EA/2EA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; EB/2EB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; EC/2EC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; ED/2ED
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; EE/2EE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; EF/2EF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F0/2F0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F1/2F1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F2/2F2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F3/2F3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F4/2F4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F5/2F5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F6/2F6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F7/2F7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F8/2F8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; F9/2F9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; FA/2FA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; FB/2FB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; FC/2FC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; FD/2FD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; FE/2FE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; FF/2FF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 100/300
  dpalette $0, $0, $0, $0, $0, $0, $0, $1 ; 101/301
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 102/302
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 103/303
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 104/304
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 105/305
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 106/306
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 107/307
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 108/308
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 109/309
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 10A/30A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 10B/30B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 10C/30C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 10D/30D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 10E/30E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 10F/30F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 110/310
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 111/311
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 112/312
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 113/313
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 114/314
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 115/315
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 116/316
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 117/317
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 118/318
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 119/319
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 11A/31A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 11B/31B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 11C/31C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 11D/31D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 11E/31E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 11F/31F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 120/320
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 121/321
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 122/322
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 123/323
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 124/324
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 125/325
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 126/326
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 127/327
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 128/328
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 129/329
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 12A/32A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 12B/32B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 12C/32C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 12D/32D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 12E/32E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 12F/32F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 130/330
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 131/331
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 132/332
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 133/333
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 134/334
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 135/335
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 136/336
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 137/337
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 138/338
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 139/339
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13A/33A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13B/33B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13C/33C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13D/33D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13E/33E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 13F/33F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 140/340
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 141/341
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 142/342
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 143/343
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 144/344
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 145/345
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 146/346
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 147/347
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 148/348
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 149/349
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14A/34A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14B/34B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14C/34C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14D/34D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14E/34E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 14F/34F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 150/350
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 151/351
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 152/352
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 153/353
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 154/354
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 155/355
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 156/356
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 157/357
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 158/358
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 159/359
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15A/35A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15B/35B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15C/35C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15D/35D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15E/35E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 15F/35F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 160/360
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 161/361
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 162/362
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 163/363
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 164/364
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 165/365
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 166/366
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 167/367
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 168/368
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 169/369
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16A/36A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16B/36B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16C/36C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16D/36D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16E/36E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 16F/36F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 170/370
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 171/371
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 172/372
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 173/373
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 174/374
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 175/375
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 176/376
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 177/377
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 178/378
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 179/379
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17A/37A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17B/37B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17C/37C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17D/37D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17E/37E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 17F/37F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 180/380
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 181/381
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 182/382
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 183/383
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 184/384
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 185/385
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 186/386
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 187/387
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 188/388
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 189/389
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18A/38A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18B/38B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18C/38C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18D/38D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18E/38E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 18F/38F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 190/390
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 191/391
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 192/392
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 193/393
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 194/394
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 195/395
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 196/396
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 197/397
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 198/398
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 199/399
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19A/39A
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19B/39B
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19C/39C
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19D/39D
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19E/39E
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 19F/39F
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A0/3A0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A1/3A1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A2/3A2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A3/3A3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A4/3A4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A5/3A5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A6/3A6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A7/3A7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A8/3A8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1A9/3A9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AA/3AA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AB/3AB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AC/3AC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AD/3AD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AE/3AE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1AF/3AF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B0/3B0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B1/3B1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B2/3B2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B3/3B3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B4/3B4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B5/3B5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B6/3B6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B7/3B7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B8/3B8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1B9/3B9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BA/3BA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BB/3BB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BC/3BC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BD/3BD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BE/3BE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1BF/3BF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C0/3C0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C1/3C1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C2/3C2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C3/3C3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C4/3C4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C5/3C5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C6/3C6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C7/3C7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C8/3C8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1C9/3C9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CA/3CA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CB/3CB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CC/3CC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CD/3CD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CE/3CE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1CF/3CF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D0/3D0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D1/3D1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D2/3D2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D3/3D3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D4/3D4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D5/3D5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D6/3D6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D7/3D7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D8/3D8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1D9/3D9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DA/3DA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DB/3DB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DC/3DC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DD/3DD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DE/3DE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1DF/3DF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E0/3E0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E1/3E1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E2/3E2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E3/3E3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E4/3E4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E5/3E5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E6/3E6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E7/3E7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E8/3E8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1E9/3E9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EA/3EA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EB/3EB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EC/3EC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1ED/3ED
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EE/3EE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1EF/3EF
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F0/3F0
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F1/3F1
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F2/3F2
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F3/3F3
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F4/3F4
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F5/3F5
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F6/3F6
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F7/3F7
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F8/3F8
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1F9/3F9
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FA/3FA
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FB/3FB
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FC/3FC
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FD/3FD
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FE/3FE
  dpalette $0, $0, $0, $0, $0, $0, $0, $0 ; 1FF/3FF

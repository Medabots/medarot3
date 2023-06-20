INCLUDE "game/src/common/hardware.inc"
INCLUDE "game/src/common/joypad.inc"
; Symbol prefix guide:
; X = 0000 to 7FFF (write mode only)
; V = 8000 to 9FFF (VRAM)
; S = A000 to BFFF (SRAM)
; W = C000 to DFFF (WRAM)
; O = FE00 to FE9F (OAM)
; H = FF00 to FFFF (HRAM and I/O, basically any address ldh works with)
; M = for symbolising values

H_PushOAM             EQU $ff80

H_VBlankCompleted     EQU $ff92
H_SoundEffect         EQU $ffa1
H_SoundSampleSelect   EQU $ffa8

M_MedarotSlotLength   EQU $10

M_MedarotEquipState   EQU $0
M_MedarotType         EQU $1
M_MedarotMedal        EQU $2
M_MedarotHead         EQU $3
M_MedarotLeftArm      EQU $4
M_MedarotRightArm     EQU $5
M_MedarotLegs         EQU $6
M_MedarotPalette      EQU $7

M_MedalSlotLength     EQU $40

M_MedalStatus         EQU $0
M_MedalType           EQU $1
M_MedalExpLower       EQU $2
M_MedalExpUpper       EQU $3
M_MedalImage          EQU $4
M_MedalMedaforceA     EQU $5
M_MedalMedaforceB     EQU $6
M_MedalMedaforceC     EQU $7
M_MedalAttribute      EQU $8
M_MedalLevel          EQU $9
M_MedalPersonality    EQU $A
M_MedalCompatibility  EQU $B
M_MedalSkillAIndex    EQU $19
M_MedalSkillAUses     EQU $1A
M_MedalSkillAExp      EQU $1B
M_MedalSkillAPadding  EQU $1C
M_MedalSkillBIndex    EQU $1D
M_MedalSkillBUses     EQU $1E
M_MedalSkillBExp      EQU $1F
M_MedalSkillBPadding  EQU $20
M_MedalSkillCIndex    EQU $21
M_MedalSkillCUses     EQU $22
M_MedalSkillCExp      EQU $23
M_MedalMedaliaAStatus EQU $24
M_MedalMedaliaASkill  EQU $25
M_MedalMedaliaAUses   EQU $26
M_MedalMedaliaAExp    EQU $27
M_MedalMedaliaBStatus EQU $28
M_MedalMedaliaBSkill  EQU $29
M_MedalMedaliaBUses   EQU $2A
M_MedalMedaliaBExp    EQU $2B
M_MedalMedaliaCStatus EQU $2C
M_MedalMedaliaCSkill  EQU $2D
M_MedalMedaliaCUses   EQU $2E
M_MedalMedaliaCExp    EQU $2F
M_MedalNickname       EQU $30

M_CreditConfigLength    EQU $0C
M_CreditConfigAniIndex  EQU $00
M_CreditConfigDirection EQU $01
M_CreditConfigTimer     EQU $02
M_CreditConfigActIndex  EQU $03
M_CreditConfigPageNum   EQU $04
M_CreditConfigTextIndex EQU $05

M_CreditTextConfigYPos        EQU $00
M_CreditTextConfigXPos        EQU $01
M_CreditTextConfigPalette     EQU $03
M_CreditTextConfigText        EQU $04

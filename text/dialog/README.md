Text is dumped by scripts/dump_text.py, all files are in proper csv format (quoted by '"' if necessary).

Special commands are surrounded by '<>':

(Arguments are denoted by XX for hex notation, NN for decimal notation)

\*XX - Text exit codes, if not explicitly specified then assume it's 00 (normal exit)

CD - Move text to 2nd line of text box

\#XX - Set Text Speed

CF - New text box

&XXXX or &VAR - Load text from specific address in RAM, res/ptrs.tbl has predefined names

D1 - New page without input (keeps portrait)

@Portrait,[Orientation:{LL, LR, RL, RR, CC}][Character:1][Expression:1] - Load character portrait, orientation is of the form (Side)(Facing); CC means clear portrait

KXX - Print Kanji, reference res/tilesets/Kanji.lst as a reference (it starts at 0x00)


table[0xcc] = SpecialCharacter('*', end=True) # End of text
table[0xcd] = SpecialCharacter("CD", bts=0, always_print=True) # Moves to second line of text box
table[0xce] = SpecialCharacter('#') # Text Speed
table[0xcf] = SpecialCharacter("CF", bts=0, always_print=True) # Create new text box
table[0xd0] = SpecialCharacter("&", bts=2, names=name_table) # Pull text from RAM
table[0xd1] = SpecialCharacter("D1", bts=0, always_print=True) # New page (keeps portrait)
# Portrait, [Orientation:{00, 01, 10, 11, FF}][Character:1][Expression:1]
table[0xd2] = SpecialCharacter('@', bts=3, parser=lambda x: "{},{:02X},{:02X}".format({0x00: 'LL', 0x01: 'LR', 0x10: 'RL', 0x11: 'RR', 0xFF: 'CC' }[utils.read_byte(x)], utils.read_byte(x), utils.read_byte(x)) )
table[0xd3] = SpecialCharacter('K', print_control_code=False, parser=lambda x: kanji[utils.read_byte(x)]) # Kanji
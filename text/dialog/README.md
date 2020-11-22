Text is dumped by scripts/dump_text.py, all files are in proper csv format (quoted by '"' if necessary).

Special commands are surrounded by '<>':

(Arguments are denoted by XX for hex notation, NN for decimal notation)

\*XX - Text exit codes, if not explicitly specified then assume it's 00 (normal exit)

CD - Move text to 2nd line of text box

\#XX - Set Text Speed

CF - New text box

&XXXX or &VAR - Load text from specific address in RAM, res/ptrs.tbl has predefined names

D1 - New page without input (keeps portrait)

\@Portrait,\[Orientation:\{LL, LR, RL, RR, CC\}\]\[Character:1\]\[Expression:1\] - Load character portrait, orientation is of the form (Side)(Facing); CC means clear portrait

KXX - Print Kanji, reference res/tilesets/Kanji.lst as a reference (it starts at 0x00)

NOTERM:... - Text without a terminator, unused but needs to be taken into account when rebuilding

FINAL - Indicates the text pointer is the first 'unusable' pointer
INCLUDE "game/src/common/constants.asm"

SECTION "Sound Effect Trigger Function", ROM0[$27DA]
ScheduleSoundEffect::
  ldh [H_SoundEffect], a
  ret

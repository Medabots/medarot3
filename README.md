[![Build All](https://github.com/Medabots/medarot3/actions/workflows/build.yml/badge.svg?branch=tr_EN)](https://github.com/Medabots/medarot3/actions/workflows/build.yml?query=branch%3Atr_EN)

# Building

The tr_LANGCODE branches are focused on modifying extracted components to play the game in other languages (corresponding with the language code in the branch).

The majority of text to be translated is in the text/ directory. 

## Dependencies

* Medarot 3 KABUTO ROM (md5: cbc55f3bb98f8c0443917ae477e56e51) and/or Medarot 3 KUWAGATA ROM (md5: dabfbdc9aba5f2edc21f884c52881e0d)
* Make 4 or greater
* Python 3.6 or greater, aliased to 'python3'
* [rgbds toolchain](https://github.com/rednex/rgbds) v0.4.2 or greater

## Make

1. Name the original ROMs 'baserom_kabuto.gbc' and/or 'baserom_kuwagata.gbc' based on version respectively
1. Place the renamed ROMs into the root folder of the project
1. Execute make (optionally pass -j to speed up the build)
1. medarot3_kabuto.gbc and/or medarot3_kuwagata.gbc will be built in the root folder of the project
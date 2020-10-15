# -*- coding: utf-8 -*-
import os
from . import png
from math import sqrt, floor, ceil
import argparse
import operator


def split(list_, interval):
    """
    Split a list by length.
    """
    for i in range(0, len(list_), interval):
        j = min(i + interval, len(list_))
        yield list_[i:j]


def hex_dump(data, length=0x10):
    """
    just use hexdump -C
    """
    margin = len('%x' % len(data))
    output = []
    address = 0
    for line in split(data, length):
        output += [
            hex(address)[2:].zfill(margin) +
            ' | ' +
            ' '.join('%.2x' % byte for byte in line)
        ]
        address += length
    return '\n'.join(output)


def get_tiles(image):
    """
    Split a 2bpp image into 8x8 tiles.
    """
    return list(split(image, 0x10))

def connect(tiles):
    """
    Combine 8x8 tiles into a 2bpp image.
    """
    return [byte for tile in tiles for byte in tile]

def transpose(tiles, width=None):
    """
    Transpose a tile arrangement along line y=-x.

      00 01 02 03 04 05     00 06 0c 12 18 1e
      06 07 08 09 0a 0b     01 07 0d 13 19 1f
      0c 0d 0e 0f 10 11 <-> 02 08 0e 14 1a 20
      12 13 14 15 16 17     03 09 0f 15 1b 21
      18 19 1a 1b 1c 1d     04 0a 10 16 1c 22
      1e 1f 20 21 22 23     05 0b 11 17 1d 23

      00 01 02 03     00 04 08
      04 05 06 07 <-> 01 05 09
      08 09 0a 0b     02 06 0a
                      03 07 0b
    """
    if width == None:
        width = int(sqrt(len(tiles))) # assume square image
    tiles = sorted(enumerate(tiles), key= lambda i_tile: i_tile[0] % width)
    return [tile for i, tile in tiles]

def transpose_tiles(image, width=None):
    return connect(transpose(get_tiles(image), width))

def interleave(tiles, width):
    """
      00 01 02 03 04 05     00 02 04 06 08 0a
      06 07 08 09 0a 0b     01 03 05 07 09 0b
      0c 0d 0e 0f 10 11 --> 0c 0e 10 12 14 16
      12 13 14 15 16 17     0d 0f 11 13 15 17
      18 19 1a 1b 1c 1d     18 1a 1c 1e 20 22
      1e 1f 20 21 22 23     19 1b 1d 1f 21 23
    """
    interleaved = []
    left, right = split(tiles[::2], width), split(tiles[1::2], width)
    for l, r in zip(left, right):
        interleaved += l + r
    return interleaved

def deinterleave(tiles, width):
    """
      00 02 04 06 08 0a     00 01 02 03 04 05 
      01 03 05 07 09 0b     06 07 08 09 0a 0b
      0c 0e 10 12 14 16 --> 0c 0d 0e 0f 10 11
      0d 0f 11 13 15 17     12 13 14 15 16 17
      18 1a 1c 1e 20 22     18 19 1a 1b 1c 1d
      19 1b 1d 1f 21 23     1e 1f 20 21 22 23
    """
    deinterleaved = []
    rows = list(split(tiles, width))
    for left, right in zip(rows[::2], rows[1::2]):
        for l, r in zip(left, right):
            deinterleaved += [l, r]
    return deinterleaved

def interleave_tiles(image, width):
    return connect(interleave(get_tiles(image), width))

def deinterleave_tiles(image, width):
    return connect(deinterleave(get_tiles(image), width))


def condense_image_to_map(image, pic=0):
    """
    Reduce an image of adjacent frames to an image containing a base frame and any unrepeated tiles.
    Returns the new image and the corresponding tilemap used to reconstruct the input image.

    If <pic> is 0, ignore the concept of frames. This behavior might be better off as another function.
    """
    tiles = get_tiles(image)
    new_tiles, tilemap = condense_tiles_to_map(tiles, pic)
    new_image = connect(new_tiles)
    return new_image, tilemap

def condense_tiles_to_map(tiles, pic=0):
    """
    Reduce a sequence of tiles representing adjacent frames to a base frame and any unrepeated tiles.
    Returns the new tiles and the corresponding tilemap used to reconstruct the input tile sequence.

    If <pic> is 0, ignore the concept of frames. This behavior might be better off as another function.
    """

    # Leave the first frame intact for pics.
    new_tiles = tiles[:pic]
    tilemap   = list(range(pic))

    for i, tile in enumerate(tiles[pic:]):
        if tile not in new_tiles:
            new_tiles.append(tile)

        if pic:
            # Match the first frame exactly where possible.
            # This reduces the space needed to replace tiles in pic animations.
            # For example, if a tile is repeated twice in the first frame,
            # but at the same relative index as the second tile, use the second index.
            # When creating a bitmask later, the second index would not require a replacement, but the first index would have.
            pic_i = i % pic
            if tile == new_tiles[pic_i]:
                tilemap.append(pic_i)
            else:
                tilemap.append(new_tiles.index(tile))
        else:
            tilemap.append(new_tiles.index(tile))
    return new_tiles, tilemap

def test_condense_tiles_to_map():
    test = condense_tiles_to_map(list('abcadbae'))
    if test != (list('abcde'), [0, 1, 2, 0, 3, 1, 0, 4]):
        raise Exception(test)
    test = condense_tiles_to_map(list('abcadbae'), 2)
    if test != (list('abcde'), [0, 1, 2, 0, 3, 1, 0, 4]):
        raise Exception(test)
    test = condense_tiles_to_map(list('abcadbae'), 4)
    if test != (list('abcade'), [0, 1, 2, 3, 4, 1, 0, 5]):
        raise Exception(test)
    test = condense_tiles_to_map(list('abcadbea'), 4)
    if test != (list('abcade'), [0, 1, 2, 3, 4, 1, 5, 3]):
        raise Exception(test)

def bin_to_rgb(word):
    red   = word & 0b11111
    word >>= 5
    green = word & 0b11111
    word >>= 5
    blue  = word & 0b11111
    return (red, green, blue)

def convert_binary_pal_to_text_by_filename(filename):
    with open(filename, 'rb') as f:
        pal = bytearray(f.read())
    return convert_binary_pal_to_text(pal)

def convert_binary_pal_to_text(pal):
    output = ''
    words = [hi * 0x100 + lo for lo, hi in zip(pal[::2], pal[1::2])]
    for word in words:
        red, green, blue = ['%.2d' % c for c in bin_to_rgb(word)]
        output += '\tRGB ' + ', '.join((red, green, blue))
        output += '\n'
    return output

def read_rgb_macros(lines):
    colors = []
    for line in lines:
        macro = line.split(" ")[0].strip()
        if macro == 'RGB':
            params = ' '.join(line.split(" ")[1:]).split(',')
            red, green, blue = [int(v) for v in params]
            colors += [[red, green, blue]]
    return colors


def rewrite_binary_pals_to_text(filenames):
    for filename in filenames:
        pal_text = convert_binary_pal_to_text_by_filename(filename)
        with open(filename, 'w') as out:
            out.write(pal_text)


def flatten(planar):
    """
    Flatten planar 2bpp image data into a quaternary pixel map.
    """
    strips = []
    for bottom, top in split(planar, 2):
        bottom = bottom
        top = top
        strip = []
        for i in range(7,-1,-1):
            color = (
                (bottom >> i & 1) +
                (top *2 >> i & 2)
            )
            strip += [color]
        strips += strip
    return strips

def to_lines(image, width):
    """
    Convert a tiled quaternary pixel map to lines of quaternary pixels.
    """
    tile_width = 8
    tile_height = 8
    num_columns = width // tile_width
    height = len(image) // width

    lines = []
    for cur_line in range(height):
        tile_row = cur_line // tile_height
        line = []
        for column in range(num_columns):
            anchor = (
                num_columns * tile_row * tile_width * tile_height +
                column * tile_width * tile_height +
                cur_line % tile_height * tile_width
            )
            line += image[anchor : anchor + tile_width]
        lines += [line]
    return lines

def convert_2bpp_to_png(image, **kwargs):
    """
    Convert a planar 2bpp graphic to png.
    """

    image = bytearray(image)

    pad_color = bytearray([0])

    width          = kwargs.get('width', 0)
    height         = kwargs.get('height', 0)
    tile_padding   = kwargs.get('tile_padding', 0)
    pic_dimensions = kwargs.get('pic_dimensions', None)
    pal_file       = kwargs.get('pal_file', None)
    interleave     = kwargs.get('interleave', False)

    # Width must be specified to interleave.
    if interleave and width:
        image = interleave_tiles(image, width // 8)

    # Pad the image by a given number of tiles if asked.
    image += pad_color * 0x10 * tile_padding

    # Some images are transposed in blocks.
    if pic_dimensions:
        w, h  = pic_dimensions
        if not width: width = w * 8

        pic_length = w * h * 0x10

        trailing = len(image) % pic_length

        pic = []
        for i in range(0, len(image) - trailing, pic_length):
            pic += transpose_tiles(image[i:i+pic_length], h)
        image = bytearray(pic) + image[len(image) - trailing:]

        # Pad out trailing lines.
        image += pad_color * 0x10 * ((w - (len(image) // 0x10) % h) % w)

    def px_length(img):
        return len(img) * 4
    def tile_length(img):
        return len(img) * 4 // (8*8)

    if width and height:
        tile_width = width // 8
        more_tile_padding = (tile_width - (tile_length(image) % tile_width or tile_width))
        image += pad_color * 0x10 * more_tile_padding

    elif width and not height:
        tile_width = width // 8
        more_tile_padding = (tile_width - (tile_length(image) % tile_width or tile_width))
        image += pad_color * 0x10 * more_tile_padding
        height = px_length(image) // width

    elif height and not width:
        tile_height = height // 8
        more_tile_padding = (tile_height - (tile_length(image) % tile_height or tile_height))
        image += pad_color * 0x10 * more_tile_padding
        width = px_length(image) // height

    # at least one dimension should be given
    if width * height != px_length(image):
        # look for possible combos of width/height that would form a rectangle
        matches = []
        # Height need not be divisible by 8, but width must.
        # See pokered gfx/minimize_pic.1bpp.
        for w in range(8, px_length(image) // 2 + 1, 8):
            h = px_length(image) // w
            if w * h == px_length(image):
                matches += [(w, h)]
        # go for the most square image
        if len(matches):
            width, height = sorted(matches, key= lambda w_h: (w_h[1] % 8 != 0, w_h[0] + w_h[1]))[0] # favor height
        else:
            raise Exception('Image can\'t be divided into tiles (%d px)!' % (px_length(image)))

    # convert tiles to lines
    lines = to_lines(flatten(image), width)

    if pal_file == None:
        palette   = None
        greyscale = True
        bitdepth  = 2
        px_map    = [[3 - pixel for pixel in line] for line in lines]

    else: # gbc color
        palette   = pal_to_png(pal_file)
        greyscale = False
        bitdepth  = 8
        px_map    = [[pixel for pixel in line] for line in lines]

    return width, height, palette, greyscale, bitdepth, px_map

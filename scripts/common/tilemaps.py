MODE_LIT = 0
MODE_REP = 1
MODE_INC = 2
MODE_DEC = 3

def decompress_tilemap(original):
    tmap = []
    rom = iter(original)
    for b in rom:
        if b in [0xfc, 0xfd, 0xfe, 0xff]:
            tmap.append(b)
        else:
            command = (b >> 6) & 0b11
            count = b & 0b00111111
            if command == MODE_LIT:
                for i in range(count+1):
                    tmap.append(next(rom))
            elif command == MODE_REP:
                byte = next(rom)
                for i in range(count+2):
                    tmap.append(byte)
            elif command == MODE_INC:
                byte = next(rom)
                for i in range(count+2):
                    tmap.append((byte+i)&0xff)
            elif command == MODE_DEC:
                byte = next(rom)
                for i in range(count+2):
                    tmap.append((byte-i)%0xff)

    assert tmap[-1] == 0xff 
    assert len(tmap[:-1]) % 0x20 == 0
    assert len(tmap) > 1
    ret = []
    row = []
    # Each line is at max 32 bytes
    # If 0xfe was not explicitly specified by 32 bytes, we need to add a newline
    t = tmap[0]
    for t in tmap:
        if (len(row) != 0 and len(row) % 0x20 == 0) or t == 0xfe:
            ret += row
            ret.append(0xfe)
            row = []
        if t != 0xfe:
            row.append(t)
    else:
        # If the row is only one character, it must be 0xff
        # Remove the unnecessary final newline
        if len(row) == 1:
            assert row == [0xff]
            del ret[-1]
        ret += row[0:0x1F]
    return ret

MAX_COUNT = 63
MIN_COUNT = 1
def compress_mode_literal(idx, tmap):
    return MIN_COUNT

# All non-literal methods must have a minimum size of 2 bytes to make sense
def compress_mode_repeat(idx, tmap):
    i = 0
    curbyte = tmap[idx]
    for i, byte in zip(range(MAX_COUNT+1), tmap[idx + 1:]):
        if byte != curbyte:
            break
    return i

def compress_mode_increment(idx, tmap):
    i = 0
    curbyte = tmap[idx]
    for i, byte in zip(range(MAX_COUNT+1), tmap[idx + 1:]):
        if byte != (curbyte + 1 + i) & 0xFF:
            break
    return i

def compress_mode_decrement(idx, tmap):
    i = 0
    curbyte = tmap[idx]
    for i, byte in zip(range(MAX_COUNT+1), tmap[idx + 1:]):
        if byte != (curbyte - 1 - i) & 0xFF:
            break
    return i

COMPRESSION_METHODS = {
    MODE_LIT : compress_mode_literal,
    MODE_REP : compress_mode_repeat,
    MODE_INC : compress_mode_increment,
    MODE_DEC : compress_mode_decrement,
}
def compress_tmap(tmap):
    compressed_tmap = []
    idx = 0
    while idx < len(tmap):
        best_method = MODE_LIT
        best_size = MIN_COUNT
        for m in COMPRESSION_METHODS: # Just greedily figure out how to compress the next N bytes
            size = COMPRESSION_METHODS[m](idx, tmap)
            if size > best_size:
                best_size = size
                best_method = m
        command = (best_method << 6) | (best_size - 1)
        print(hex(command))
        print(tmap[idx:])
        compressed_tmap.append(command)
        compressed_tmap.append(tmap[idx])
        idx += best_size
        # best_size is the number of bytes that matched the current byte when it's not a literal
        if best_method != MODE_LIT:
            idx += 1
    return compressed_tmap
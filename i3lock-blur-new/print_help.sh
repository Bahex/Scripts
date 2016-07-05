#!/bin/sh
print_help(){ cat << EOF
Usage: $(basename $0) [options]
  Options:
    -h, --help          This help text
    -g, --greyscale     Make lockscreen greyscale instead of color.
    -p, --pixelate      Pixelated lockscreen instead of blurred, runs faster.
    -f, --font <font>	Use a custom font. 'convert -list font' to get a list.
    -l, --listfonts	Give a list of fonts that can be used.
EOF
}

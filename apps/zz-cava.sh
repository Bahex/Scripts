#!/bin/sh
xrdb -override $XFILES/Xresources.d/URxvt/transparency-true-complete
urxvt -geometry 85x10+341-0 -name "Cava" -depth 32 -bg rgba:0000/0000/0000/0000 +sb +bl -e cava &
xrdb $XFILES/Xresources

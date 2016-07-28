#!/bin/sh
xrdb -override $XFILES/Xresources.d/URxvt/transparency-true-complete
urxvt -geometry 85x10+341-0 -name "Cava" -e sh -c "cava" &
xrdb $XFILES/Xresources

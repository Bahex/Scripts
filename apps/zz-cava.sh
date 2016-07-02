#!/bin/sh
xrdb -override $XFILES/Xresources.d/URxvt/transparency-true-complete
urxvt -geometry 75x10+450-0 -name "Cava" -e sh -c "cava" &
xrdb $XFILES/Xresources

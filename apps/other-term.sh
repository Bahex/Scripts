#!/bin/sh
xrdb -override $XFILES/Xresources.d/URxvt/transparency-true
urxvt &
xrdb $XFILES/Xresources

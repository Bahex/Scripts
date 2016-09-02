#!/bin/bash

sdir=`realpath $0`
sdir=${sdir%/*}

MPD_MUSIC_PATH=$HOME/Music
TMP_COVER_PATH="/tmp/mpd-track-cover"

albumart_in_dir(){
    echo "${MPD_CURRENT%/*}"/`ls "${MPD_CURRENT%/*}" | grep "album.*" | head -n 1`
}

ext_cvr(){
    MPD_CURRENT="$MPD_MUSIC_PATH/`mpc --format '%file%' current`"

    if [[ -f "`albumart_in_dir`" && -r "`albumart_in_dir`" ]]; then
        cp "`albumart_in_dir`" $TMP_COVER_PATH
    elif [ ! "x " = "x $(exiftool -Picture "$MPD_CURRENT")" ]; then
        exiftool -b -Picture "${MPD_CURRENT}" > $TMP_COVER_PATH
    else
       cp $sdir/nocover.png $TMP_COVER_PATH
    fi
}

mpc idleloop | while read i; do ext_cvr; done

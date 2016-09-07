#!/bin/bash

### USER CONFIG
MPD_MUSIC_PATH=$HOME/Music
TMP_COVER_PATH="/tmp/mpd-track-cover"

#Get script path
sdir=`realpath $0`
sdir=${sdir%/*}

#Find images in album's directory
albumart_in_dir(){
    cvrs="$(find "${MPD_CURRENT%/*}" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${MPD_ALBUM}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
    echo -n "$cvrs" | head -n 1
}

#Try to find an album cover. If there is no suitable image, fallback on "No Cover"
ext_cvr(){
    MPD_CURRENT="$MPD_MUSIC_PATH/`mpc --format '%file%' current`"
    MPD_ALBUM="`mpc --format '%album%' current`"

    if [[ -f "`albumart_in_dir`" ]]; then
        cp "`albumart_in_dir`" $TMP_COVER_PATH
    elif [ ! "x " = "x $(exiftool -Picture "$MPD_CURRENT")" ]; then
        exiftool -b -Picture "${MPD_CURRENT}" > $TMP_COVER_PATH
    else
       cp $sdir/nocover.png $TMP_COVER_PATH
    fi
}

while mpc idle; do ext_cvr; done

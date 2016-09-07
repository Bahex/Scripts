#!/bin/bash

### USER CONFIG
MPD_MUSIC_PATH=$HOME/Music
TMP_COVER_PATH="/tmp/mpd-track-cover"

#Get script path
sdir=`realpath $0`
sdir=${sdir%/*}

#Find images in album's directory
albumart_in_dir(){
    MPD_ALBUM="`mpc --format '%album%' current`"
    cvrs="$(find "${MPD_CURRENT%/*}" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${MPD_ALBUM}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
    echo -n "$cvrs" | head -n 1
}

#Try to find an album cover. If there is no suitable image, fallback on "No Cover"
ext_cvr(){
    MPD_CURRENT="$MPD_MUSIC_PATH/`mpc --format '%file%' current`"
    
    if [ "${MPD_CURRENT}" = "${MPD_MUSIC_PATH}/" ];then     #No music is selected/playing
        cp $sdir/nocover.png $TMP_COVER_PATH

    elif [ ! "x " = "x $(exiftool -Picture "$MPD_CURRENT")" ]; then     #Music file's own embedded image as cover
        exiftool -b -Picture "${MPD_CURRENT}" > $TMP_COVER_PATH

    elif [[ -f "`albumart_in_dir`" ]]; then         #Use a suitable file from Album's directory
        cp "`albumart_in_dir`" $TMP_COVER_PATH

    else        #"No Cover" as fallback
       cp $sdir/nocover.png $TMP_COVER_PATH
    fi
}

while true; do mpc idle | grep "player" > /dev/null && ext_cvr; done

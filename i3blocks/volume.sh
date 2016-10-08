#!/bin/sh
AUDIO=`/usr/lib/i3blocks/volume`
if echo ${AUDIO} | grep -q "%"; then
    echo " ${AUDIO}"
else
    echo "     "
fi

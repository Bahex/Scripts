#!/bin/sh
AUDIO=`/usr/libexec/i3blocks/volume`
if echo ${AUDIO} | grep -q "%"; then
    echo " ${AUDIO}"
else
    echo " "
fi

#!/bin/sh
if [ $(pidof mpd) ]
then
	ncmpcpp
else
	mpd && ncmpcpp
fi

#!/bin/sh
DEFAULTPLAYER=mpv
CLIPCONTENT=$(xclip -selection clipboard -o)
if [[ $CLIPCONTENT != http* ]]; then
	CLIPCONTENT=""
fi

$DEFAULTPLAYER \
	$(zenity --entry --title="Youtube"\
		--text "Enter the URL to the video:"\
		--entry-text="$CLIPCONTENT")\
	--title="Youtube"
#--ytdl-format=22

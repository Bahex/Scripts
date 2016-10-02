#!/bin/bash

STYLE="$(echo -e "True\nHalf\nNormal" | rofi -dmenu -p "Term: ")"

case $STYLE in
	True)
		urxvt -depth 32 -bg rgba:0000/0000/0000/0000 &
		;;
	Half)
		urxvt -depth 32 -bg rgba:0000/0000/0000/cccc &
		;;
	Normal)
		urxvt &
		;;
	*)
		echo "Fuck"
		;;
esac

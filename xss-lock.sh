#!/bin/sh
###	if { pidof xss-lock; }; then
###		echo "Locker is already running"
###	else
###		xss-lock -- ~/scripts/keybinds/screenlocks/i3lock-fancy/lock
###	fi

killall xss-lock
/usr/bin/xss-lock -- ~/scripts/i3lock-blurry/i3lock-blurry &

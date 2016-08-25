#!/bin/bash

# Pass the password in the block instance
if [[ -n $BLOCK_INSTANCE ]]; then
    password=("-h" "$BLOCK_INSTANCE@localhost")
fi

filter() {
    echo -n '   <b>'
    tr '\n' ' ' | grep -Po '.*(?= \[playing\])|paused' | tr -d '\n'
    echo -n '</b>   '
}

case $BLOCK_BUTTON in
    3) mpc $password toggle | filter ;;  # right click, pause/unpause
    4) mpc $password prev   | filter ;;  # scroll up, previous
    5) mpc $password next   | filter ;;  # scroll down, next
    *) mpc $password status | filter ;;
esac

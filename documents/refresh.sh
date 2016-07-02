#!/bin/bash

[[ -e $1 ]] || { echo -e "You need to specify a valid file."; exit 1; }
[[ -e .browser.pid ]] && kill -- $(< .browser.pid) &> /dev/null
file="`realpath $1`"

chromium --app=file:${file} &> /dev/null &
echo "$!" > .browser.pid

exit 0

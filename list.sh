#!/bin/sh
[[ $# -eq 1 && -f "$1" && -r "$1" ]] || { echo "This script needs a file that is READABLE and PLAINTEXT."; exit 1; }

export i=1
cat $1 | while read line; do
    echo "$i →  ${line}" | fold -s -w 40
    i=$((i+1))
done

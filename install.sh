#!/bin/bash

[ ! "please" == "$1" ] && echo -e "This script is potentially destructive.\nIf you are sure write \"$0 please\"" && exit 1

INSDIR=$(realpath "$0")
INSDIR=${INSDIR%/*}

[ ! -d ~/.local/bin ] && mkdir -p ~/.local/bin

# Executables that should be in $PATH
for file in startx; do
	ln -s ${INSDIR}/${file} ~/.local/bin/${file}
done

# Desktop files
ln -s -t ~/.local/share/applications ${INSDIR}/desktop-files/*

exit 0

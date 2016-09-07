#!/bin/sh

#bright background with dark text and icons
light_bg(){
	fontcolor="black"
	icodir="dark"
	param=(--textcolor=00000000 --insidecolor=0000001c --ringcolor=0000003e \
		--linecolor=00000000 --keyhlcolor=ffffff80 --ringvercolor=ffffff00 \
		--separatorcolor=22222260 --insidevercolor=ffffff1c \
		--ringwrongcolor=ffffff55 --insidewrongcolor=ffffff1c)
}

dark_bg(){
	fontcolor="white"
	icodir="light"
	param=(--textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e \
		--linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 \
		--separatorcolor=22222260 --insidevercolor=0000001c \
		--ringwrongcolor=00000055 --insidewrongcolor=0000001c)
}

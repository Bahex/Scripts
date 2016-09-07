#!/bin/sh
location_effect(){
	real_loc=$(< /etc/location)
	location=${location:-$real_loc}
	case $location in
		BilimMerkezi )	printline=($icodir/BM.png \
			-gravity center \
			-geometry +0+140 \
			-composite) ;;
		* ) : ;; 	# doesn't change the printline
	esac
}

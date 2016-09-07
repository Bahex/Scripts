#!/bin/sh
parse_args(){
eval set -- `getopt -o hpgf:l -l help,pixelate,greyscale,font:,listfonts --name "$0" -- "$@"`
while true; do
	case "$1" in
		-h|--help)	print_help; exit 1 ;;
		-g|--greyscale) hue=(${hue[@]} -set colorspace Gray -separate -average) ; shift ;;
		-p|--pixelate)	effect=(-scale 10% -scale 1000%) ; shift ;;
		-f|--font)
			case "$2" in
				"") shift 2 ;;
				*) font=$2 ; shift 2 ;;
			esac ;;
		-l|--listfonts)	convert -list font | awk -F: '/Font: / { print $2 }' | sort -du; exit 0 ;;
		--) shift ; break ;;
		*) echo "error"; exit 1 ;;
	esac
done
}

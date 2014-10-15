#!/bin/bash

target="./out-marker"
usage() { echo -e "Usage:\n\t`basename $0`[-h] [-o buildOutDirectory]" 1>&2; exit 1; }

while getopts "o:h" o; do
    case "${o}" in
        o)  
            if test -d "${OPTARG}"; then
		target=${OPTARG}
		echo "building in directory ${OPTARG}" 
            else 
                 echo -e "directory: ${OPTARG} doesn't exist \nbuilding in default directory $target"; 
            fi
            ;;
         h)
            usage
            ;;
        *)
            echo "building in default directory $target";
            ;;
    esac
done

set -x

source="./out"
background="markers-matte.png"

someIcon=`find $source -name "*.png" | sort -n | head -1`
wicon=`identify -format "%w" $someIcon`
hicon=`identify -format "%h" $someIcon`

wback=`identify -format "%w" markers-matte.png`
hback=`identify -format "%h" markers-matte.png`

xoff=`echo "scale=2 ; $wback  / 2 - $( echo "scale=2 ; $wicon  / 2 - 1" | bc ) " | bc ` # last -1 to correct bias
mkdir -p  "$target"

if [ -d "$source" ]
then
	for file in `find out/ -name '*.png'` ; do
	 composite -geometry +$xoff+6  "$file" "$background" "${target}/`basename $file .png`.png"
	done
else
	echo "run getAndbuild.sh previously"
fi

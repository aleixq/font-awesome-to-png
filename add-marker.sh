#!/bin/bash
set -x
source="./out"
target="./out-marker"
background="markers-matte.png"

someIcon=`find $source -name "*.png" | sort -n | head -1`
wicon=`identify -format "%w" $someIcon`
hicon=`identify -format "%h" $someIcon`

wback=`identify -format "%w" markers-matte.png`
hback=`identify -format "%h" markers-matte.png`

xoff=`echo "scale=2 ; $wback  / 2 - $( echo "scale=2 ; $wicon  / 2 - 1" | bc ) " | bc `
mkdir -p  $target

if [ -d "$source" ]
then
	for file in `find out/ -name '*.png'` ; do
	 composite -geometry +$xoff+6  "$file" "$background" "${target}/`basename $file .png`.png"
	done
else
	echo "run getAndbuild.sh previously"
fi

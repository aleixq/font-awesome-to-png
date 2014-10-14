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

xoff=`expr $wback / 2 - $( expr $wicon / 2 ) `
echo $wback / 2 -  $wicon / 2
mkdir -p  $target

if [ -d "$source" ]
then
	for file in `find out/ -name '*.png'` ; do
	 composite -geometry +$xoff+12  "$file" "$background" "${target}/`basename $file .png`.png"
	done
else
	echo "run getAndbuild.sh previously"
fi

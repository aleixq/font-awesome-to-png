#!/bin/bash
set -x
source="./out"
target="./out-marker"
background="markers-matte@2x.png"

mkdir -p  $target

if [ -d "$source" ]
then
	for file in `find out/ -name '*.png'` ; do
	 composite -geometry +17+20  "$file" "$background" "${target}/`basename $file .png`.png"
	done
else
	echo "run getAndbuild.sh previously"
fi

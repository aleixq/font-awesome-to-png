#Call this script where the marker icons directory are it will output to :
# currentDirectoryName.ini
someIcon=`ls *.png | sort -n | head -1`
w=`identify -format "%w" $someIcon`
h=`identify -format "%h" $someIcon`
#Position at position South (bottom-middle)
x=`expr $w / 2`
y=$h

output="; Defaults
[defaults]
imagepoint1X = 0
imagepoint1Y = 0
imagepoint2X = $x
imagepoint2Y = $y
shapecoords = 0,0,$w,$h
shapetype = 'rect'

"
for file in *.png; 
do  
	output+="[`basename $file .png`]\nname = \"`basename $file .png`\"\nsequence =\"$file\"\n\n" ; 
done

curdir=${PWD##*/}
echo -e "$output" > $curdir.ini

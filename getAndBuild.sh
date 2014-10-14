mkdir -p out
wget -O - https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/fontawesome-webfont.ttf  > out/fontawesome-webfont.ttf
cd out
python3 ../font-awesome-to-png.py ALL --size 24

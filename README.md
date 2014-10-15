Fork of odyniec/font-awesome-to-png to add some scripts to be able to create markers from font-awesome

The basic change is that it syncs (in a rude and dirty way) the list of items from site http://fortawesome.github.io/Font-Awesome/cheatsheet/ instead of a hard coded way. 
There are also some bash scripts:

    getAndBuild.sh:
Builds a set of icons of 32px to ./out/ directory.
    
    add-marker.sh
Composes a marker with a red marker in this repo (taken from https://github.com/lvoogdt/Leaflet.awesome-markers), for each icon in ./out/ directory . After that stores all these new markers to ./out-marker/ or where specified by -o option
    
    makeIni.sh 
Running it inside of ./out-marker/ directory will create a basic ini file to be used for fantastic https://www.drupal.org/project/getlocations drupal module .


    
After that rename ./out-marker/ to the marker kit name that you choose, and ./out-marker/out-marker.ini too. Copy the directory in sites/all/libraries/getlocations/markers/ and then you can use icons in http://yourdrupal.org/admin/config/services/getlocations


---------Original RM---------------------

Font Awesome to PNG
===================

This program allows you to extract the awesome
[Font Awesome] (http://fortawesome.github.com/Font-Awesome/) icons as PNG images
of specified size.

### Usage

    font-awesome-to-png.py [-h] [--color COLOR] [--filename FILENAME]
                           [--font FONT] [--css CSS] [--list] [--size SIZE]
                           icon [icon ...]

    positional arguments:
      icon                 The name(s) of the icon(s) to export (or "ALL" for
                           all icons)

    optional arguments:
      --color COLOR        Color (HTML color code or name, default: black)
      --filename FILENAME  The name of the output file (it must end with
                           ".png"). If all files are exported, it is used as a
                           prefix.
      --font FONT          Font file to use (default: fontawesome-webfont.ttf)
      --css CSS            Path to the CSS file defining icon names (instead of
                           the predefined list)
      --list               List available icon names and exit
      --size SIZE          Icon size in pixels (default: 16)

    hidden optional arguments:
     --list-update         List available icon names and codes in format suitable
                           for updating the program source.

To use the program, you need the Font Awesome TTF file, which is available in
[Font Awesome Github repository] (https://github.com/FortAwesome/Font-Awesome).

The internal icon list is matched to Font Awesome 4.1.0.  To use a later/different
version, use font-awesome.css from the Font Awesome GitHub repository.

### Examples

Export the "play" and "stop" icons as 24x24 pixels images:

    font-awesome-to-png.py --size 24 play stop

Export the asterisk icon as 32x32 pixels image, in blue:

    font-awesome-to-png.py --size 32 --color blue asterisk

Export all icons as 16x16 pixels images:

    font-awesome-to-png.py ALL

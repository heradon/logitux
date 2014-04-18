#!/bin/bash

#######################
#       gcolor        #
#  Ralf Matthes 2014  #
#######################

#CONFIG="/etc/logitux/logitux.cfg"
#DOWNLOAD_FILE="http://heradon.eu/files.txt"
#FILES="/etc/logitux/lcdfiles.txt"
LCDFILES="/usr/share/logitux/"
XINIT="/usr/share/logitux/xinitrc_g19"
FILES="/home/heradon/logitux/files.txt"

############## NO CHANGE HERE ##############

#rm -rfv files.txt #--> DEBUG ONLY

#wget $DOWNLOAD_FILE 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# Downloading \2/' | zenity --progress --title="Downloading File..."
##################################

CHECKED=`cat $FILES | awk '{print "TRUE\n"$0}' | zenity --list --radiolist \
--separator='/ ' --title="Select Results." \
--text="G19 LCD Conky Files" --column="" --column="Select"`

cp -a $LCDFILES/$CHECKED ~/
cp -a $XINIT ~/.xinitrc_g19
#array=( $CHECKED )
#echo ${array[0]}



##################################
while true; do
	menu_launch="$(zenity --width 500 --height 500 --list --radiolist --column "Choose" --column "Option" TRUE "G19 Color Chooser" FALSE "G19 Info" FALSE "Exit")"
	if [ "$menu_launch" = "Exit" ]; then
	    echo done
	    exit
	elif [ "$menu_launch" = "G19 Color Chooser" ]; then
	    `sh $GCOLOR`
	elif [ "$menu_launch" = "G19 Info" ]; then
	    `sh $GINFO`
	else
	    clear
	    echo Invalid option
	fi
done
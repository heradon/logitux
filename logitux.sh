#!/bin/bash

#######################
#       gcolor        #
#  Ralf Matthes 2014  #
#######################

CONFIG="/etc/logitux/logitux.cfg"
GCOLOR="gcolor.sh"
GINFO=""

############## NO CHANGE HERE ##############

info="Logitux is free Software \\n
Copyright (c)2014 Ralf Matthes"

zenity --info --title="Logitux for Linux" --text="$info"
zenity --question --title="Logitux Main Menu" --text="Would you start the Logitux Software?"
if [[ $? == 0 ]] ; then
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
else
    echo "false"
fi

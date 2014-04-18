#!/bin/bash

# Systray notification (then yad installed)

if [ -f /usr/bin/yad ]
then
	DIENST=`systemctl is-active logitux`
	if [ $DIENST == "active" ]
		then
			yad --notification --image="myicon" --command="zenity --info --text 'Logitux is running!'" &
		else
			yad --notification --image="myicon" --command="zenity --info --text 'Logitux is not running!'" &
	fi
else
    exit
fi
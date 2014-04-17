#!/bin/bash

#######################
#       gcolor        #
#  Ralf Matthes 2014  #
#######################

info="Logitux is free Software \\n
Copyright (c)2014 Ralf Matthes"

zenity --info --title="Logitux for Linux" --text="$info"
zenity --question --title="G19 Color Chooser" --text="Would you start the G19 Color Chooser?"
if [[ $? == 0 ]] ; then
   input=`zenity --color-selection --show-palette`
   col=`echo $input | sed -e 's/^.\{,1\}//'`
   a=`echo $col | cut -c-2`
   b=`echo $col | cut -c5-6`
   c=`echo $col | cut -c9-10`

   color=`echo $a$b$c`
   # echo abc $a$b$c --> DEBUG MESSAGES
   # echo input $input --> DEBUG MESSAGES
   # echo color $color --> DEBUG MESSAGES
   rgb=`printf "%d %d %d\n" 0x${color:0:2} 0x${color:2:2} 0x${color:4:2}`

   echo $rgb
else
   zenity --warning --title="G19 Color Chooser" --text="G19 Color Chooser exited"
fi

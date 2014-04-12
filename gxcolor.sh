#!/bin/bash

#####################
#        gx19       #
# Ralf Matthes 2014 #
#####################

INPUT=/tmp/gxcolor.sh.$$

dialog=Xdialog
title="gx19 Color Chooser"
backtitle="gx19 Color Chooser"
R="255"
G="0"
B="0"
i=1

$dialog --backtitle "$backtitle" --title "$title" --colorsel "Choose a Color" 0 0 $R $G $B 2>"${INPUT}"

# cat $INPUT # ONLY FOR DEBUG
array=( $(< "$INPUT") )

#echo ${array[0]}


colors=( red green blue );
for ((i=0; i<${#array[@]}; i++));
do
    echo ${array[i]} > /sys/bus/hid/drivers/hid-g19/0003\:046D\:C229.0005/leds/g19_0\:${colors[i]}\:bl/brightness
#    echo ${array[i]} > /sys/bus/hid/drivers/hid-g19/0003\\:\046D\\:\C229.0005/leds/g19_0\\:${colors[i]}\\:bl/brightness;
done

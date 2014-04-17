#!/bin/bash

#####################
#      gxcolor      #
# Ralf Matthes 2014 #
#####################

# Gerneral variables
INPUT=/tmp/gxcolor.sh.$$
#CONFIG=/etc/logitux/gxcolor.cfg
CONFIG=testfile.cfg

dialog=Xdialog
title="Logitux G19 Color Chooser"
backtitle="Logitux G19 Color Chooser"
R="255"
G="0"
B="0"
i=1

# Read config file
#echo $(< "$CONFIG" )

#for i in `less -1 $CONFIG | cut -d"=" -f2`; do
#    echo $i;
#done

$dialog --backtitle "$backtitle" --title "$title" --colorsel "Choose a Color" 0 0 $R $G $B 2>"${INPUT}"

# cat $INPUT # ONLY FOR DEBUG
array=( $(< "$INPUT") )

colors=( red green blue );
for ((i=0; i<${#array[@]}; i++));
do
    echo ${array[i]} > /sys/bus/hid/drivers/hid-g19/0003\:046D\:C229.0005/leds/g19_0\:${colors[i]}\:bl/brightness
    echo ${array[i]}
done

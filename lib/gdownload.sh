#!/bin/bash

#######################
#       gcolor        #
#  Ralf Matthes 2014  #
#######################

CONFIG="/etc/logitux/logitux.cfg"
GCOLOR="gcolor.sh"
GINFO=""

############## NO CHANGE HERE ##############

wget http://git.rmatthes.de/logitux/

wget http://filename 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# Downloading \2/' | zenity --progress --title="Downloading File..."

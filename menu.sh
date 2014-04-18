#!/bin/bash

# Scripts for Japanese Support was Downloaded From : http://www.esdebian.org/foro/45378/how-tobeta-dojin-games-linux-koumajo-densetsu-bunny-must-dye-chelsea-and-the-seven-demons

# Go to the Game Directory
Game_Path=${0%/*}
cd "$Game_Path" && cd ..
export WINEPREFIX="$PWD/wine"
export WINEDEBUG="-all"
echo ""
echo ""
echo "If the Game dont start , you need Run $Game_Path/Linux_Japanese_Support.sh for Run Game Properly"

while true; do
  menu_launch="$(zenity  --width 309 --height 240 --list --radiolist  --column "Choose" --column "Option" TRUE "Play Game" FALSE "Launch Game Config" FALSE "Launch Controller Config" FALSE "Exit")"
         if [ "$menu_launch" = "Exit" ]; then
          echo done
          exit
         elif [ "$menu_launch" = "Play Game" ]; then
		`wine "Koumajou.exe" $@`
	 elif [ "$menu_launch" = "Launch Game Config" ]; then
		`wine "config.exe" $@`
	 elif [ "$menu_launch" = "Launch Controller Config" ]; then
		`wine "keyconfig.exe" $@`
         else
          clear
          echo Invalid option
         fi
done

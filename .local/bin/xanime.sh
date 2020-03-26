#!/bin/bash
shopt -s globstar
files=`ls $HOME/Downloads/**/\[*\]*.mkv`
anime=`sed "s|$HOME/Downloads/||g" <<< $files | rofi -i -theme xmaru -scroll-method 1 -dmenu -p "Play anime "` && cvlc "$HOME/Downloads/$anime"
pkill cvlc
#dmenu -i -l 15 -fn 'MonteCarlo Fixed 12:pixelsize=16' -nb '#1C1C23' -sb '#008BDE' -h 18

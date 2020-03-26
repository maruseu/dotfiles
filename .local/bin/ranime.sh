#!/bin/bash
shopt -s globstar
files=`ls $HOME/Downloads/**/\[*\]*.mkv`
anime=`sed "s|$HOME/Downloads/||g" <<< $files | rofi -theme lemon -dmenu -columns 1 -p "> " -width 700px "$@"` && mpv "$HOME/Downloads/$anime"

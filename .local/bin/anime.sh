#!/bin/bash
shopt -s globstar
files=`ls $HOME/Downloads/**/\[*\]*.mkv`
anime=`sed "s|$HOME/Downloads/||g" <<< $files | dmenu -p "Play Anime" "$@"` && mpv "$HOME/Downloads/$anime"

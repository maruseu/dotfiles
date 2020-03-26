#!/bin/bash
current=`mpc current -f "Current: %title%"`
action=`printf "Play/Pause\nNext\nPrevious\nUpdate\nVolume +\nVolume -" | dmenu -p "$current" "$@"` 

if [[ $action == "Next" ]]; then
	mpc next

elif [[ $action == "Previous" ]]; then
	mpc prev
	
elif [[ $action == "Play/Pause" ]]; then
	mpc toggle

elif [[ $action == "Update" ]]; then
	mpc update

elif [[ $action == "Volume +" ]]; then
	mpc volume +5

elif [[ $action == "Volume -" ]]; then
	mpc volume -5

fi

[[ ! -z $action ]] && $0 "$@" &

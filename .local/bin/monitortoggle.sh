#!/bin/dash
if [ $(xrandr --listactivemonitors | head -1 | awk '{print $NF}') -eq 1 ]; then
	~/.scripts/display2.sh
else
	~/.scripts/display1.sh
fi

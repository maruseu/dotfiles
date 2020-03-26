#!/bin/sh
if [ "$1" ]; then
	cp "$1" ~/.bg
fi
feh --bg-fill ~/.bg

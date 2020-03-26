#!/bin/sh
xrandr --output LVDS-1 --off --output VGA-1 --primary --auto --pos 0x0 --rotate normal
~/.fehbg
pkill compton ; compton -b

#!/bin/sh
xrandr --output VGA-1 --off --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal
fehbg
pkill compton ; compton -b

#!/bin/bash
while true; do
watch -n1 -g "mpc | head -n 1 | grep -v volume:" || break
notify-send "Now Playing" "$(mpc | head -n 1 | grep -v volume:)"
kill -USR2 $(</tmp/ram/dwmStat.pid)
pkill -P $(</tmp/ram/dwmStat.pid) sleep
done

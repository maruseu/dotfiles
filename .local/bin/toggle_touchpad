#!/bin/dash
enabled=`xinput --list-props "SynPS/2 Synaptics TouchPad" | grep "Device Enabled" | awk '{print $NF}'`
if [ "$enabled" = "1" ]; then
	xinput disable "SynPS/2 Synaptics TouchPad"
	xinput disable "TPPS/2 IBM TrackPoint" &&
	notify-send "Touchpad OFF"
else
	xinput enable "SynPS/2 Synaptics TouchPad"
	xinput enable "TPPS/2 IBM TrackPoint"
	notify-send "Touchpad ON"
fi

#!/bin/sh
if [ $button -eq 1 ];then
	pavucontrol > /dev/null &
elif [ $button -eq 2 ];then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ $button -eq 3 ];then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ $button -eq 4 ];then
	pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ $button -eq 5 ];then
	pactl set-sink-volume @DEFAULT_SINK@ -5%
fi
volume=`pactl list sinks | grep -v 'Base Volume' | grep Volume | head -1 | awk '{print $5}'`
echo $volume

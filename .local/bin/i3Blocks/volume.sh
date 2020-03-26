#!/bin/sh
if [ $button -eq 1 ];then
	i3-msg 'exec --no-startup-id pavucontrol' > /dev/null || pavucontrol > /dev/null &
elif [ $button -eq 2 ];then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ $button -eq 3 ];then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ $button -eq 4 ];then
	pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ $button -eq 5 ];then
	pactl set-sink-volume @DEFAULT_SINK@ -5%
fi
volume=`pactl list sinks | grep -v 'Base Volume' | grep Volume | head -1 | awk '{print $5}' | tr -d '%'`
mute=`pactl list sinks | grep 'Mute' | awk '{print $2}'`
p1=`~/Scripts/i3Blocks/pangoNormal`
p2=`cat ~/Scripts/i3Blocks/pangoEnd`
pr=`cat ~/Scripts/i3Blocks/pangoRed`
pb=`cat ~/Scripts/i3Blocks/pangoBlu`
pi=`cat ~/Scripts/i3Blocks/pangoInv`
s=`cat ~/Scripts/i3Blocks/separator`
if [ $mute = "yes" ];then
	echo $pi"$s""$volume%""$s"$p2
elif [ $volume -gt 100 ];then
	echo $pr"$s""$volume%""$s"$p2
elif [ $volume -ge 50 ];then
	echo $p1"$s""$volume%""$s"$p2
elif [ $volume -gt 0 ];then
	echo $pb"$s""$volume%""$s"$p2
elif [ $volume -eq 0 ];then
	echo $pi"$s""$volume%""$s"$p2
fi

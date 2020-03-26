#!/bin/sh
monitors=`xrandr --listactivemonitors | grep Monitors | awk '{print $2}'`
single="Single Monitor"
dual="Dual Monitor"
p1=`cat ~/Scripts/i3Blocks/pangoNormal`
p2=`cat ~/Scripts/i3Blocks/pangoEnd`
s=`cat ~/Scripts/i3Blocks/separator`
if [ $monitors = "1" ];then
	if [ $button -eq 1 ];then
		bash ~/Scripts/display2.sh
		echo $p1"$s"$dual"$s"$p2
	else
		echo $p1"$s""$s"ingle"$s"$p2
	fi
else
	if [ $button -eq 1 ];then
		bash ~/Scripts/display1.sh
		echo $p1"$s""$s"ingle"$s"$p2
	else
		echo $p1"$s"$dual"$s"$p2
	fi
fi

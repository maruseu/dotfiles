#!/bin/sh
if [ $button -eq 1 ];then
	zenity --calendar --text="" > /dev/null &
fi
p1=`~/Scripts/i3Blocks/pangoNormal`
c=`LC_ALL=en_US.UTF-8 date +'%a %d/%m %H:%M'`
p2=`cat ~/Scripts/i3Blocks/pangoEnd`
s=`cat ~/Scripts/i3Blocks/separator`
echo $p1"$s"$c"$s"$p2

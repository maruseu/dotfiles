#!/bin/sh
if [ $button -eq 1 ];then
	urxvt +is -e sh -c "sudo pacman -Syu; printf '[31;1m[Press ENTER to exit][0m'; read "> /dev/null
	c=0
else
c=`checkupdates | wc -l`
fi
p1=`~/Scripts/i3Blocks/pangoNormal`
p2=`cat ~/Scripts/i3Blocks/pangoEnd`
s=`cat ~/Scripts/i3Blocks/separator`
echo $p1"$s""⇧ "$c"$s"$p2

#!/bin/sh
if [ $button -eq 1 ];then
	ibus-setup
fi
p1=`~/Scripts/i3Blocks/pangoNormal`
c=`ibus engine | sed 's/:/ /g' | sed 's/-/ /g' | awk '{print toupper($2)}'`
p2=`cat ~/Scripts/i3Blocks/pangoEnd`
s=`cat ~/Scripts/i3Blocks/separator`
echo $p1"$s"\[ $c \]"$s"$p2


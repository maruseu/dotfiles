#!/bin/sh
if [ $button -eq 1 ];then
	i3-msg 'exec --no-startup-id st get_wttr' > /dev/null
fi
p1=`cat ~/Scripts/i3Blocks/pangoNormal`
c=`curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo | sed 's/\°//g'`
p2=`cat ~/Scripts/i3Blocks/pangoEnd`
s=`cat ~/Scripts/i3Blocks/separator`
echo $p1"$s"$c"$s"$p2

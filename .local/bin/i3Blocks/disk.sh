#!/bin/sh
if [ $button -eq '1' ];then
	i3-msg 'exec --no-startup-id urxvt +is -e ncdu' > /dev/null || kitty ncdu
fi
c=`df -h | grep /dev/sd | awk '{print toupper($1)" "$4}' | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/    /g' | sed 's/\/DEV\/SD//g' | rev | rev`
echo "" "$c"

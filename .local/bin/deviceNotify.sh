#!/bin/bash
lsusb | grep -v 'Linux Foundation' | awk '{ print substr($0, index($0,$7)) }' > /tmp/devices

while true; do

	watch -n 0.5 -g "lsusb | awk '{ print substr(\$0, index(\$0,\$7)) }'"

	lsusb | grep -v 'Linux Foundation' | awk '{ print substr($0, index($0,$7)) }' > /tmp/devicesnew

	DEVICECHANGE=`diff -d /tmp/devices /tmp/ram/devicesnew | tail -n1 | sed "s/^[><] //"`
	CONNECT=`diff -d /tmp/ram/devices /tmp/ram/devicesnew | tail -n1 | awk '{print \$1}'`

	if [[ $CONNECT == ">" ]]
	then
		notify-send 'Device connected' "$DEVICECHANGE"
	else
		notify-send 'Device disconnected' "$DEVICECHANGE"
	fi
	
	mv /tmp/ram/devicesnew /tmp/ram/devices

done

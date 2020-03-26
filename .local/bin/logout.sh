#!/bin/bash
action=`echo -e 'Shutdown\nReboot\nLogout' | dmenu -p "Exit?" "$@"`
if [[ $action == "Shutdown" ]]; then
	shutdown now
elif [[ $action == "Reboot" ]]; then
	reboot
elif [[ $action == "Logout" ]]; then
	pkill X
fi

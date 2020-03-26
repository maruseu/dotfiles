#!/bin/zsh
printf '[94mStarting X server'
while true; do
	printf '....'
	pgrep X>>/dev/null && break
done
printf '[0m'

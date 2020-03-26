#!/bin/sh
maim /tmp/ram/lock.png ; convert /tmp/ram/lock.png  channel RGB -filter Gaussian -resize 2% -define filter:sigma=1 -resize 5200% /tmp/ram/lock.png ; i3lock -i /tmp/ram/lock.png

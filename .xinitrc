#!/bin/sh
export XDG_SESSION_TYPE=x11
export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export QT4_IM_MODULE=ibus

sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

xrdb -merge ~/.config/xresources/Xresources
xrdb -merge ~/.config/xresources/Xcolor-sol

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

ibus-daemon -drx &

#Notification
dunst &

#Hide cursor when inactive
unclutter --timeout 5 --jitter 2 --ignore-scrolling -b

#Daemons
pgrep dunst_dev || dunst_devices &
pgrep urxvtd || urxvtd -q -o -f
pgrep transmission-da || transmission-daemon -g .config/transmission

#Keyboard Tuning
xset r rate 250 40

picom -b
#picom --experimental-backends -b

~/.fehbg || xsetroot -solid "#93c9ff"
exec dsession

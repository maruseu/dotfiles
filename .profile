# vim:fileencoding=utf-8:ft=conf:foldmethod=marker

#: Path adds {{{
export PATH=$PATH:~/Documents/love/img/
export PATH=$PATH:~/.local/bin/
#}}}

export EDITOR=nvim

if [ $(tty) = '/dev/tty1' ]; then
	#clear
	#~/Documents/m.a.r.u/info.sh
	#pfetchb
	#~/.scripts/xwait.sh &
	#sleep 1
	#exec pinit
	exec startx -- -dpi 96
# >/dev/null 2>/dev/null
fi

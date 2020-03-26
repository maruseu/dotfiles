engine=`ibus engine`

if [ "$engine" == "xkb:us::eng" ] ; then
	ibus engine xkb:br::por
	echo a
else
	ibus engine xkb:us::eng
	echo b
fi
kill -RTMIN $(</tmp/ram/dwmStat.pid)
pkill -P $(</tmp/ram/dwmStat.pid) sleep

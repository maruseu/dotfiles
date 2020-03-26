#!/bin/sh
asshole=`ls $HOME/.scripts --color=none | grep display_ | sed 's/.sh//g' | sed 's/display_//g' | dmenu "$@"`
"$HOME/.scripts/display_$asshole.sh"

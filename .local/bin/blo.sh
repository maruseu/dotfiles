#!/bin/bash
printf "\n"
for j in {0..1}; do
	for i in {0..7}; do
		s="$s""[9${i}m████[3${i}m"
		if [[ $j == "0" ]]; then
			s="$s""▄ "; else
			s="$s""█ "
		fi; done
	s="$s""
"; done
for i in {0..7}; do s="$s""[3${i}m ▀▀▀▀ " ; done
echo "$s"

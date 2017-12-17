#!/bin/bash

count=0
if [ $# -gt 2 ] || [ $# -lt 1 ]; then
	exit 1
elif [ $# = 1 ]; then
	if [ ! -d "$1" ]; then
		exit 1;
	else
		for file in $1/*; do
			if [ -f "$file" ]; then
				count=$((count+1))
			fi
		done
		echo $count
	fi
else
	exit 0	
fi
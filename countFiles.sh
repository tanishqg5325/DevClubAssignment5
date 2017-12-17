#!/bin/bash

count=0

if [ $# -gt 2 ] || [ $# -lt 1 ] || [ ! -d $1 ] || [ ! -r $1 ]; then
	exit 1
elif [ $# = 1 ]; then
	for file in $1/*; do
		if [ -f "$file" ]; then
			count=$((count+1))
		fi
	done
else
	for file in $1/*$2; do
		if [ -f "$file" ]; then
			count=$((count+1))
		fi
	done
fi

echo $count
exit 0
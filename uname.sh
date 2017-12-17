#!/bin/bash

if [ ! $# = 2 ] || [ ! -f $1 ] || [ ! -r $1 ] || [[ ! "$1" = *.txt ]]; then
	exit 1
else
	while read line; do
		if [[ ! "$line" = *:x:*:*:*:* ]]; then
			exit 1
		fi
	done<$1
	grep "$2:x:*:*:*:*" $1>abc.txt
	if [ ! -s abc.txt ]; then
		echo "Invalid Username"
		rm -f abc.txt
		exit 1
	fi
	cut -d ":" -f 5 abc.txt
	rm -f abc.txt
fi

exit 0
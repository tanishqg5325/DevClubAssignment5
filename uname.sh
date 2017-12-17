#!/bin/bash

if [ ! $# = 2 ] || [ ! -f $1 ] || [ ! -r $1 ] || [[ ! "$1" = *.txt ]]; then
	exit 1
else
	file=$1
	uname=$2
	grep "$uname:x:*:*:*:*" $file>abc.txt
	if [ ! -s abc.txt ]; then
		echo "Invalid Username"
		rm -f abc.txt
		exit 1
	fi
	cut -d ":" -f 5 abc.txt
	rm -f abc.txt
fi

exit 0
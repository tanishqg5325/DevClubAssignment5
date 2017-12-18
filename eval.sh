#!/bin/bash

if [ ! $# = 1 ]  || [ ! -f $1 ] || [ ! -r $1 ] || [[ ! "$1" = *.txt ]]; then
	exit 1
else
	num1=0
	while read line; do
		if [[ ! "$line" =~ ^-?[0-9]+' '.$ ]]; then
			exit 1;
		fi
		num2=$(echo "$line" | cut -d " " -f 1)
		op=$(echo "$line" | cut -d " " -f 2)
		if [[ "$num2" = 0 ]] && [[ "$op" = / ]]; then
			exit 1;
		fi
		
		case "$op" in
			"+") let num1+=num2;;
			"-") let num1-=num2;;
			"*") let num1*=num2;;
			"/") let num1/=num2;;
			*) exit 1;; 
		esac

	done<$1
	echo $num1;
fi

exit 0
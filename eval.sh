#!/bin/bash

if [ ! $# = 1 ]  || [ ! -f $1 ] || [ ! -r $1 ] || [[ ! "$1" = *.txt ]]; then
	exit 1
else
	num=0;
fi

exit 0
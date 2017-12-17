#!/bin/bash

if [ ! $# = 2 ]  || [ ! -f $1 ] || [ ! $1 = *.txt ] || [ ! -r $1 ]; then
	exit 1
else
	file=$1
	uname=$2
	
fi

exit 0
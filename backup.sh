#!/bin/bash

if [ ! $# = 2 ] || [ ! -d $1 ] || [ ! -d $2 ]; then
	exit 1
else
	exit 0
fi

exit 0
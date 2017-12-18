#!/bin/bash

if [ ! $# = 2 ] || [ ! -d $1 ] || [ ! -d $2 ]; then
	exit 1
else
	temp=$(pwd)
	cp -r $1 temp1
	cp -r $2 temp1
	cp -r temp1/dir2/* temp1
	rm -r temp1/dir2
	cp -r temp1 temp2
	cp -r temp1 final
	echo "Files copied from $1 to $2 are:"
	cd $2
	for file in *; do
		cd $temp
		rm -r temp1/$file
		cd $1
	done
	cd $temp
	ls -1 temp1/
	rm -r temp1
	
	echo "Files copied from $2 to $1 are:"
	cd $1
	for file in *; do
		cd $temp
		rm -r temp2/$file
		cd $1
	done
	cd $temp
	ls -1 temp2/
	rm -r temp2
	rm -r $1
	rm -r $2
	cp -r final $1
	cp -r final $2
	rm -r final

fi

exit 0
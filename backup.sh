#!/bin/bash

sync_dir(){
	for file in $(ls $2); do
		rm -r temp1/$file
	done
	ls -1 temp1/
	rm -r temp1
	cp -r final temp1
}

if [ ! $# = 2 ] || [ ! -d $1 ] || [ ! -d $2 ]; then
	exit 1
else
	temp=$(pwd)
	cp -r $1 temp1
	cp -r $2 temp1
	cp -r temp1/dir2/* temp1
	rm -r temp1/dir2
	cp -r temp1 final

	echo "Files copied from $1 to $2 are:"
	sync_dir $1 $2
	
	echo "Files copied from $2 to $1 are:"
	sync_dir $2 $1

	rm -r $1 $2 temp1
	cp -r final $1
	cp -r final $2
	rm -r final
fi

exit 0
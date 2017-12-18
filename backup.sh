#!/bin/bash

sync_dir(){
	for file in $(ls $1); do
		if [ -f $1/$file ]; then
			rm -r $2/$file
		elif [ -d $1/$file ]; then
			sync_dir $1/$file $2/$file
		fi
	done
	ls -1R $2/
	rm -r $2
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
	sync_dir $2 $temp/temp1

	cp -r final temp1
	
	echo "Files copied from $2 to $1 are:"
	sync_dir $1 $temp/temp1

	rm -r $1 $2
	cp -r final $1
	cp -r final $2
	rm -r final
fi

exit 0
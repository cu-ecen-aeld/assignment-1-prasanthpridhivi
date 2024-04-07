#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Missing writefile and writestr arguments"
	exit 1
fi

if [[ $# < 2 ]]; then
	echo "Missing writestr arguments" 
	exit 1
fi

directory=$(dirname $1)

if [[ ! -d $directory ]]; then
	mkdir -p $directory
fi

if [[ ! -e "$1" ]]; then
	touch "$1"
	if [[ $? > 0 ]]; then
		echo "File $1 cannot be created"
		exit 1
	fi
fi

echo "$2" > "$1"

if [[ $? > 0 ]]; then
	echo "Failed to write $2 to file $1"
	exit 1
fi

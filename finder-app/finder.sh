#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Missing filesdir and searchstr arguments"
	exit 1
fi

if [[ $# < 2 ]]; then
	echo "Missing searchstr arguments" 
	exit 1
fi

if [[ ! -d "$1" ]]; then
	echo "filesdir is not a directory"
	exit 1
fi

X=$( find "$1" -type f | wc -l )
Y=$( grep -r "$2" "$1" | wc -l)
echo "The number of files are $X and the number of matching lines are $Y"

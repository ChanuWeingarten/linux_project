#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <file> <separator>"
	exit 1
fi

file="$1"
separator="$2"

while IFS="$separator" read -r -a fields; do
	for (( i=0; i<${#fields[@]}; i++ )); do
		echo "field $((i+1)): ${fields[i]}"
	done
done < "$file"




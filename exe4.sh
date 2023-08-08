#!/bin/bash

if [[ -z "$1" ]]; then
   read -p "Enter a message: " input
else
   input="$1"
fi

for((i=0; i<${#input}; i++)); do
   char="${input:i:1}"
   ascii=$(printf "%d" "'$char'")
   echo "$char = $ascii"
done

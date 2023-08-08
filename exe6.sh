#!/bin/bash

print_array() {
  local array1=("$1")
  local rows=("$2")
  local cols=7
  for ((i = 0; i < $rows; i++)); do
    for ((j = 0; j < $cols; j++)); do
      printf "%6s\t" "${array[$i,$j]}"
    done
    echo  
  done
}


ALL_USERS=$(cat /etc/passwd)
COUNT=$(cat /etc/passwd | wc -l)
declare -A array
row=0
column=0


for user in $ALL_USERS[@]; do   # access each element of array
IFS=":" read -ra single_user <<< "$user"
  for detail in "${single_user[@]}"; do
     array[$row,$((column%7))]="$detail"
     ((column++))
     done
 ((row++))
done

print_array "$array" "$COUNT"
}




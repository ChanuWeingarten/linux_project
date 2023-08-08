#!/bin/bash



declare -A count

words=("one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten")



echo "Enter numbers between 1-10 (press 'q' to quit):"



while true; do

    read -r num

    if [[ $num == "q" ]]; then

        break

    fi

    if [[ $num =~ ^[1-9]$|^10$ ]]; then

        count[$num]=$((${count[$num]}+1))

    else

        echo "Invalid number. Please enter a number between 1-10 or 'q' to quit."

    fi

done



echo -e "\nCounts:"



for ((i=0; i<${#words[@]}; i++)); do

    if [[ -n ${count[$((i+1))]} ]]; then

        echo "${words[$i]} appeared ${count[$((i+1))]} time(s)"

    fi

done

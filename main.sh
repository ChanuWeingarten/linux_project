#!/bin/bash

# Define the executable files
exe_files=("exe1.sh" "exe2.sh" "exe3.sh" "exe4.sh" "exe5.sh" "exe6.sh")

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <file_number> <arguments>"
    exit 1
fi

# Extract the file number and arguments

file_number=$1
# Execute the selected file with the arguments

case $file_number in
    1)
        echo "Executing exe1 with arguments: ${arguments}"
        ./exe1.sh "${@:2}"
        ;;
    2)
        echo "Executing exe2 with arguments: ${arguments}"
        ./exe2.sh "${@:2}"
        ;;
    3)
        echo "Executing exe3 with arguments: ${arguments}"
        ./exe3.sh "${@:2}"
        ;;
    4)
        echo "Executing exe4 with arguments: ${arguments}"
        ./exe4.sh "${@:2}"
        ;;
    5)
        echo "Executing exe5 with arguments: ${arguments}"
        ./exe5.sh "${@:2}"
        ;;
    6)
        echo "Executing file6 with arguments: ${arguments}"
        ./exe6.sh "${@:2}"
        ;;
    *)
        echo "Invalid file number."
        exit 1
        ;;
esac

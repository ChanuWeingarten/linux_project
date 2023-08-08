#!/bin/bash



# Function to generate a random number between 1-100

generate_random_number() {

    echo $((RANDOM % 100 + 1))

}



# Function to initialize the matrix

initialize_matrix() {

    local rows=$1

    local columns=$2

    declare -A matrix



    for ((i=0; i<rows; i++)); do

        for ((j=0; j<columns; j++)); do

            matrix[$i,$j]=$(generate_random_number)

        done

    done



    echo "${matrix[@]}"

}



# Function to print the matrix in a nice format

print_matrix() {

    local rows=$1

    local columns=$2

    local matrix_values=($3)



    for ((i=0; i<rows; i++)); do

        for ((j=0; j<columns; j++)); do

            printf "%3s " "${matrix_values[$((i*columns + j))]}"

        done

        printf "\n"

    done

}

# Generate random number of rows and columns (between 1-10)

rows=$((RANDOM % 10 + 1))

columns=$((RANDOM % 10 + 1))



# Initialize and print the matrix

matrix_values=$(initialize_matrix $rows $columns)

print_matrix $rows $columns "$matrix_values"

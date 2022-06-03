#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 02.05.2022

## EXAMPLE
# ./csv.sh "login_user_screenshot.csv"
# echo "login_user_screenshot.csv" | ./csv.sh

# CONFIG
PATH_TO_CSV_FILE=
[ ! -t 0 ] && IFS='' read -d '' -r PATH_TO_CSV_FILE
[ ! -z "$1" ] && PATH_TO_CSV_FILE=$1
[ -z "$PATH_TO_CSV_FILE" ] && echo "PATH_TO_CSV_FILE is empty" && exit

# START
node ./csv.js $PATH_TO_CSV_FILE
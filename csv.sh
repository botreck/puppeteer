#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 02.05.2022

## EXAMPLE
# ./csv.sh "premium.pl/login_user_screenshot.csv"
# echo "login_user_screenshot.csv" | ./csv.sh

# CONFIG
PATH_TO_CSV_FILE=
[ ! -t 0 ] && IFS='' read -d '' -r PATH_TO_CSV_FILE
[ ! -z "$1" ] && PATH_TO_CSV_FILE=$1
[ -z "$PATH_TO_CSV_FILE" ] && echo "PATH_TO_CSV_FILE is empty" && exit
#ABS_PATH_TO_CSV_FILE="$(pwd)/$PATH_TO_CSV_FILE"
#[ ! -r "$ABS_PATH_TO_CSV_FILE" ] && echo "$ABS_PATH_TO_CSV_FILE not exist" && exit
# START
node ./puppeteer/csv.js $PATH_TO_CSV_FILE
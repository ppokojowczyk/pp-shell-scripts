#!/bin/bash

PREV_IFS=$IFS
IFS=""

showEncoding () {
  echo `file -i $1 | awk -F";" '{ print $2 }'`
}

TEMP_FILE=$1__temp
echo -e "Encoded from: \e[32m$(showEncoding $1)\e[0m"
cp $1 $TEMP_FILE
iconv -f WINDOWS-1250 -t UTF-8 $TEMP_FILE > $1
rm -f $TEMP_FILE
echo -e "To: \e[32m$(showEncoding $1)\e[0m"

IFS=$PREV_IFS

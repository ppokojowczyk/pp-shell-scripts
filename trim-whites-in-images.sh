#!/bin/bash
TARGET_DIR="./trimmed_"`date +%Y_%m_%d_%H_%N_%S`;
SAVE_IFS=$IFS;
IFS=$(echo -en "\n\b")
mkdir -p $TARGET_DIR;
for FILE in `ls -1 *.{png,jpg,jpeg} 2> /dev/null`; do
    echo "$FILE --> $TARGET_DIR/$FILE";
    convert -trim $FILE $TARGET_DIR/$FILE;
done;
IFS=$SAVE_IFS;

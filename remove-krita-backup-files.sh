#!/bin/bash
set -e
SUFFIX="~"
DIR=$1
ALL=$(find $DIR| grep "$SUFFIX")
TO_REMOVE=()
WITHOUT_ORIGINAL=()

warn () {
    echo -e "\e[1;31m\n(!) $1\e[0;0m"
}

for F in $ALL; do
    ORIGINAL=$(echo $F | tr -d "$SUFFIX")
    if [ -f $ORIGINAL ]; then
        TO_REMOVE+=($F)
    else
        WITHOUT_ORIGINAL+=($F)
    fi
done

COUNT_WITHOUT_ORIGINAL=${#WITHOUT_ORIGINAL[@]}

if (( $COUNT_WITHOUT_ORIGINAL != 0 )); then
    warn "There are backup files without originals ($COUNT_WITHOUT_ORIGINAL):"
    for F in "${WITHOUT_ORIGINAL[@]}"; do
        echo "  - $F"
    done
fi

COUNT=${#TO_REMOVE[@]} 

if (( $COUNT == 0 )); then
    echo -e "Nothing to do.\n"
    exit 0
fi

warn "Files to remove ($COUNT):"

for F in "${TO_REMOVE[@]}"; do
    echo "  - $F"
done

warn "Are you sure (Y/y)? "
read -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -e "Exiting.\n"
    exit 1
fi

warn "Removing $COUNT files:"

for F in "${TO_REMOVE[@]}"; do
    echo "  - removing $F"
    #rm -f "$F"
done

echo -e "\nDone.\n"

exit 0


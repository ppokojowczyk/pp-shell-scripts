#!/bin/bash
#
# Download subtitles for all video files in current dir.
#

SUBTITLE_LANG=$1;

if [ -z $SUBTITLE_LANG ]; then
    echo "Missing language argument."
    exit 1
fi

while getopts "p:" opt; do
    case "$opt" in
        p)  SUBTITLE_PROVIDER=$OPTARG;;
    esac
done

# Set default provider if not set
if [ -z "$SUBTITLE_PROVIDER" ]; then
    SUBTITLE_PROVIDER='qnapi';
fi

# Set up command to download subtitle
case $SUBTITLE_PROVIDER in
    'qnapi')
        SUBTITLE_CMD="qnapi -q -l $SUBTITLE_LANG";;
    'subliminal')
        SUBTITLE_CMD="subliminal -l$SUBTITLE_LANG";;
    *)
        echo "Wrong provider"
        exit -1
esac

VIDEO_FILE_RE='mp4|avi|mkv';
SUBTITLE_PROVIDER='qnapi';
SUBTITLES_RE='[txt|srt|sub]$'
FILES=`ls -1 | grep -iE $VIDEO_FILE_RE`;
__IFS__=$IFS
IFS=$'\n';

for file in $FILES; do
    filename=$(basename -- "$file")
    filename="${filename%.*}"
    filename=`echo $filename | sed 's/\[/\\\[/' | sed 's/\]/\\\]/'`
    SUBTITLE_EXISTS=`ls -1 $filename* | grep -iE $SUBTITLES_RE`;
    if [ -z "$SUBTITLE_EXISTS" ]; then
        echo -e "Downloading for $file";
        eval $SUBTITLE_CMD '$file';
    fi;
done;

IFS=$__IFS__


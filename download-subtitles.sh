#!/bin/bash
#
# Download subtitles for all video files in current dir.
#

VIDEO_FILE_RE='mp4|avi|mkv';
LANG='pl';
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
        RES=`$SUBTITLE_PROVIDER -q -l $LANG $file`
    fi;
done;

IFS=$__IFS__


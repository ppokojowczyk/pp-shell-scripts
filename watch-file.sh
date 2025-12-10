#!/bin/bash
set -e 
while inotifywait -e close_write $1; do eval "$2"; done

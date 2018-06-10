#!/bin/bash

#
# Show Dropbox used space percentage.
#

DROPBOX_DIR="$HOME/Dropbox"
TOTAL=`du -cks $DROPBOX_DIR | tail -n1 | cut -f1`
MAX=2097152
PERC=$(( ($TOTAL*100)/$MAX ))
echo $PERC

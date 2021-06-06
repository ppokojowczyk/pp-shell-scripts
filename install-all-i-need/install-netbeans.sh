#!/bin/bash
URL=$(wget -qO - "https://netbeans.apache.org/download/nb120/nb120.html" | egrep -o 'https?://[^"]*(linux-x64)[^" <]*' | egrep -v ".asc|.sha512" | head -n 1 | tr -d "\n")
URL=${URL//www/downloads}
URL=${URL//'dyn/closer.cgi/'/}
if [ ! -z $URL ]
then
    FILENAME=$(basename $URL)
    if [ ! -z "$FILENAME" ]
    then
        echo -e "\e[32mInstalling NetBeans from $FILENAME.\e[0m"
        wget $URL
        chmod +x $FILENAME
        sudo ./$FILENAME
        rm -f $FILENAME
    else
        echo -e "\e[31m(!) Invalid filename.\e[0m"
    fi
else
    echo -e "\e[31m(!) Failed to retrieve URL.\e[0m"
fi

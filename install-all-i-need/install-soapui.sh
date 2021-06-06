#!/bin/bash
SOAPUI_URL=$(wget -qO - "https://www.soapui.org/downloads/latest-release/" | egrep -o "https?://(.*SoapUI-x64[^\"' ]*)" | grep "sh" | head -n 1 | tr -d "\n")
if [ ! -z $SOAPUI_URL ]
then
    FILENAME=$(basename $SOAPUI_URL)
    if [ ! -z "$FILENAME" ]
    then
        echo -e "\e[32mInstalling SoapUI from $FILENAME.\e[0m"
        wget $SOAPUI_URL
        chmod +x $FILENAME
        sudo ./$FILENAME
        rm -f $FILENAME
    else
        echo -e "\e[31m(!) Invalid filename.\e[0m"
    fi
else
    echo -e "\e[31m(!) Failed to retrieve URL.\e[0m"
fi

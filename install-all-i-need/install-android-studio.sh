#!/bin/bash
URL=$(wget -qO - "https://developer.android.com/studio/" | egrep -o 'https?://[^ ",<)]*' | grep 'android-studio-ide' | grep 'linux' | head -n 1 | tr -d "\n")
if [ ! -z $URL ]
then
    FILENAME=$(basename $URL)
    if [ ! -z "$FILENAME" ]
    then
        echo -e "\e[32mUncompressing Android Studio from $FILENAME to $HOME/bin/.\e[0m"
        wget $URL
        echo " Unpacking..."
        mkdir -p $HOME/bin/
        tar zxf $FILENAME -C $HOME/bin/
        rm -f $FILENAME
    else
        echo -e "\e[31m(!) Invalid filename.\e[0m"
    fi
else
    echo -e "\e[31m(!) Failed to retrieve URL.\e[0m"
fi

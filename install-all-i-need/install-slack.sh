SLACK_PKG_URL=$(wget -qO - https://slack.com/intl/en-pl/downloads/instructions/ubuntu | egrep -o 'https?://downloads.slack-edge.com/linux_releases/slack-desktop[^ "]+' | head -n 1 | tr -d "\n")
if [ ! -z $SLACK_PKG_URL ]
then
    PKG_FILENAME=$(basename $SLACK_PKG_URL)
    if [ ! -z "$PKG_FILENAME" ]
    then
        echo -e "\e[32mInstalling Slack from $SLACK_PKG_URL.\e[0m"
        wget $SLACK_PKG_URL
        sudo dpkg --install $PKG_FILENAME
        rm -f $PKG_FILENAME
    else
        echo -e "\e[31m(!) Invalid package filename.\e[0m"
    fi
else
    echo -e "\e[31m(!) Failed to retrieve Slack package URL.\e[0m"
fi

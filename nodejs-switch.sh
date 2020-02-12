#!/bin/bash
NODE_DIR=/opt/
NODE_SYMLINK="node"
NODE_SYMLINK_PATH=$NODE_DIR$NODE_SYMLINK
DIR_PREFIX="node-v"
VERSION=$1
if [[ -z $VERSION ]]; then
    echo "No version defined."
    exit;
fi
echo Switching to version $VERSION.
NEW_VERSION_PATH=`ls -1 $NODE_DIR | grep $DIR_PREFIX$VERSION`
if [[ -z $NEW_VERSION_PATH ]]; then
    echo "NodeJS $VERSION not found."
    exit
fi
C=`echo $NEW_VERSION_PATH|wc -l`
if [[ $C -eq 1 ]]; then
    NEW_NODE_PATH=$NODE_DIR$NEW_VERSION_PATH
    echo "Removing current symlink."
    sudo rm -f $NODE_SYMLINK_PATH
    echo "Creating new symlink: $NODE_SYMLINK_PATH -> $NEW_NODE_PATH"
    echo $NEW_VERSION_PATH
    sudo ln -s $NEW_NODE_PATH $NODE_SYMLINK_PATH
    echo "Current version: "`node --version`
else
    echo "More than one NodeJS found."
    exit
fi

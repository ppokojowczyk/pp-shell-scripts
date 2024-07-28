#!/bin/bash

function fix-mouse {
    MODULE=$1
    sudo modprobe -r ${MODULE}
    sudo modprobe ${MODULE}
}

fix-mouse usbmouse
fix-mouse psmouse

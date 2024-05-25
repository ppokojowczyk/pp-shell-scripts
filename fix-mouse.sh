#!/bin/bash
MODULE=usbmouse
sudo modprobe -r ${MODULE}
sudo modprobe ${MODULE}


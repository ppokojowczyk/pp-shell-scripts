#!/bin/bash

echo -e "* Stopping \e[32mDocker\e[0m service."
sudo service docker stop
echo -e "* Stopping \e[32mContainerd\e[0m service."
sudo service containerd stop

NETWORK_INTERFACES=$(ifconfig |grep "flags" | grep -e "veth" -e "br-" -e "docker" | cut -d ':' -f 1)

for NETWORK_INTERFACE in $NETWORK_INTERFACES; do
    sudo ip link delete $NETWORK_INTERFACE
    echo -e "* Deleted \e[32m${NETWORK_INTERFACE}\e[0m interface."
done;

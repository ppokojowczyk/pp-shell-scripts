#!/bin/bash
xkbset bouncekeys 50
xkbset exp =bo
xkbset q |grep -e "^Bounce-Keys" -e "^Debounce Delay"
xkbset q exp |grep "Expiry Bounce-Keys"

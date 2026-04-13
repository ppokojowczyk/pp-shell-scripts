#!/bin/bash

BATS=(BAT0 BAT1)

total_now=0
total_full=0
status="Discharging"

for BAT in "${BATS[@]}"; do
    now=$(cat /sys/class/power_supply/$BAT/energy_now 2>/dev/null || cat /sys/class/power_supply/$BAT/charge_now)
    full=$(cat /sys/class/power_supply/$BAT/energy_full 2>/dev/null || cat /sys/class/power_supply/$BAT/charge_full)
    stat=$(cat /sys/class/power_supply/$BAT/status)

    total_now=$((total_now + now))
    total_full=$((total_full + full))

    if [ "$stat" = "Charging" ]; then
        status="Charging"
    fi
done

percent=$((100 * total_now / total_full))

#instance=1
icon=" "
[ "$status" = "Charging" ] && icon="⚡"

echo "$icon $percent%"


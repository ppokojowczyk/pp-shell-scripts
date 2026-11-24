#!/bin/bash

BATS=(BAT0 BAT1)

use_total=0
total_now=0
total_full=0
status="Discharging"
final_output=""

function batt_status() {
	status=$1
	percent=$2
	icon=" "
	[ "$status" = "Charging" ] && icon="⚡"
	echo -n "$icon $percent%"
}

for BAT in "${BATS[@]}"; do
	now=$(cat /sys/class/power_supply/$BAT/energy_now 2>/dev/null || cat /sys/class/power_supply/$BAT/charge_now)
	full=$(cat /sys/class/power_supply/$BAT/energy_full 2>/dev/null || cat /sys/class/power_supply/$BAT/charge_full)
	stat=$(cat /sys/class/power_supply/$BAT/status)

	total_now=$((total_now + now))
	total_full=$((total_full + full))

	if [ "$stat" = "Charging" ]; then
		status="Charging"
	fi

	if [ $use_total == 0 ]; then
		percent=$((100 * now / full))
		if [[ -n $final_output ]]; then
			final_output+=" "
		fi
		final_output+=$(batt_status "$stat" "$percent")
	fi
done

if [ $use_total == 1 ]; then
	percent=$((100 * total_now / total_full))
	final_output+=$(batt_status "$status" "$percent")
fi

echo -n "$final_output"

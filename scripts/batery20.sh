#!/bin/bash

while true; do

	BAT=$(upower -i $(upower -e | grep BAT) | grep "percentage:" | awk '{print $2}' | tr -d '%')

	if [ "$BAT" -le 20 ]; then
		notify-send "Battery Low"
		sleep 300
	fi
	sleep 60
done

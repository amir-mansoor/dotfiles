#!/bin/bash

CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
TEMP=$(($TEMP / 1000))

# Color logic
if [ "$TEMP" -gt 80 ]; then
    COLOR="#FF5555"
elif [ "$TEMP" -gt 60 ]; then
    COLOR="#F1FA8C"
else
    COLOR="#50FA7B"
fi

echo "CPU ${CPU}%  ${TEMP}°C"
echo "CPU ${CPU}%  ${TEMP}°C"
echo $COLOR


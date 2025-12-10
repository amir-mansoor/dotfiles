#!/bin/bash

BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

# Font Awesome battery icons (larger)
if [ $BAT -gt 80 ]; then ICON=""
elif [ $BAT -gt 60 ]; then ICON=""
elif [ $BAT -gt 40 ]; then ICON=""
elif [ $BAT -gt 20 ]; then ICON=""
else ICON=""; fi

# Charging (big bolt icon matches battery)
if [ "$STATUS" = "Charging" ]; then ICON=" $ICON"; fi

# Colors
if [ $BAT -lt 20 ]; then COLOR="#FF5555"
elif [ $BAT -lt 40 ]; then COLOR="#F1FA8C"
else COLOR="#50FA7B"; fi

TEXT="$ICON $BAT%"

echo $TEXT
echo $TEXT
echo $COLOR


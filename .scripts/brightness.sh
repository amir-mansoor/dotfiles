#!/bin/bash

# Usage: ./brightness.sh up|down
# Increment step
STEP=1

# Current brightness
CURRENT_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
MAX_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)

if [ "$1" = "up" ]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + STEP))
    # Ensure new brightness does not exceed max brightness
    if [ "$NEW_BRIGHTNESS" -gt "$MAX_BRIGHTNESS" ]; then
        NEW_BRIGHTNESS=$MAX_BRIGHTNESS
    fi
elif [ "$1" = "down" ]; then
    NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - STEP))
    # Ensure new brightness does not go below 0
    if [ "$NEW_BRIGHTNESS" -lt 0 ]; then
        NEW_BRIGHTNESS=0
    fi
else
    echo "Usage: $0 up|down"
    exit 1
fi

# Set the new brightness value
echo $NEW_BRIGHTNESS | sudo tee /sys/class/backlight/intel_backlight/brightness


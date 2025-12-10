#!/bin/bash

# Get battery status
BATTERY_INFO=$(acpi -b)
BATTERY_PERCENT=$(echo $BATTERY_INFO | grep -P -o '[0-9]+(?=%)')
CHARGING=$(echo $BATTERY_INFO | grep -o 'Charging')

# Set icon based on charging status and battery percentage
if [[ $CHARGING ]]; then
    ICON="🔌"  # Charging icon
else
    if [ $BATTERY_PERCENT -ge 80 ]; then
        ICON="🔋"  # High battery icon
    elif [ $BATTERY_PERCENT -ge 60 ]; then
        ICON="🔋"  # Medium battery icon
    elif [ $BATTERY_PERCENT -ge 40 ]; then
        ICON="⚠️"  # Low battery icon
    else
        ICON="🔴"  # Critical battery icon
    fi
fi

# Output
echo "$ICON $BATTERY_PERCENT%"


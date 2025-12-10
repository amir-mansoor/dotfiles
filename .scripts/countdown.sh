#!/bin/bash

# Prompt user to enter minutes using rofi
minutes=$(rofi -dmenu -p "Enter number of minutes:" -lines 0 -font "mono 10" -width 10)

# Check if the input is a valid number
if [[ -n $minutes && $minutes =~ ^[0-9]+$ ]]; then
    # Convert minutes to hours and remaining minutes if minutes are greater than or equal to 60
    if [ $minutes -ge 60 ]; then
        hours=$((minutes / 60))
        remaining_minutes=$((minutes % 60))
        time_string="$hours hour(s) and $remaining_minutes minute(s)"
    else
        time_string="$minutes minute(s)"
    fi

    # Open a terminal with smaller font size and sticky mode
    urxvt -fn "xft:Monospace:size=15" -geometry 10x5 -title "Countdown Timer" -e bash -c "
    # Convert minutes to seconds
    seconds=$((minutes * 60))
    # Start countdown timer
    while [ \$seconds -gt 0 ]; do
        # Calculate remaining time in mm:ss format
        mm=\$((seconds / 60))
        ss=\$((seconds % 60))
        # Display remaining time in terminal title with green color
        echo -ne \"\033]0;\e[$time_string  \$ss seconds\007\"
        sleep 1
        ((seconds--))
        clear
    done
    # When timer reaches zero, display a message and exit
    echo -e \"\e[0;32mTime's up!\e[0m\"
    sleep 2"
fi


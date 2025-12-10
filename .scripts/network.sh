#!/bin/bash

IF=$(ip route | awk '/default/ {print $5}')

if [[ -z "$IF" ]]; then
    echo " Disconnected"
    echo " Disconnected"
    echo "#FF5555"
    exit
fi

SSID=$(iwgetid -r)
IP=$(hostname -I | awk '{print $1}')

if [[ -z "$SSID" ]]; then
    echo " $IP"
    echo " $IP"
    echo "#8BE9FD"
else
    echo " $SSID ($IP)"
    echo " $SSID ($IP)"
    echo "#50FA7B"
fi


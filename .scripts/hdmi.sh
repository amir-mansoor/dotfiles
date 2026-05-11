#!/bin/bash

INTERNAL="eDP-1"

EXTERNAL=$(xrandr | grep " connected" | grep -v "$INTERNAL" | cut -d" " -f1 | head -n1)

if [ -n "$EXTERNAL" ]; then
    xrandr --output "$EXTERNAL" --auto --same-as "$INTERNAL"
fi

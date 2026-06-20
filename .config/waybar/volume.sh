#!/bin/sh
# Get volume of the active hardware sink (excluding easyeffects)

SINK=$(pactl list sinks short | grep RUNNING | grep -v easyeffects | head -1 | cut -f2)
[ -z "$SINK" ] && echo "" && exit 0

MUTE=$(pactl list sinks | grep -A 10 "Name: $SINK" | grep "Mute:" | head -1 | awk '{print $2}')
[ "$MUTE" = "yes" ] && echo "" && exit 0

VOL=$(pactl list sinks | grep -A 10 "Name: $SINK" | grep "Volume:" | head -1 | awk '{print $5}' | tr -d '%')
echo "$VOL"

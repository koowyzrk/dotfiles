#!/bin/bash

CURRENT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d" ")
MUTE_STATUS=$(pactl list sources | grep -A 10 $CURRENT_SOURCE | grep "Mute" | sed -e 's/^\s*//' -e '/^$/d')

if [ "$MUTE_STATUS" == "Mute: yes" ]; then
  pactl set-source-mute $CURRENT_SOURCE false
fi

if [ "$MUTE_STATUS" == "Mute: no" ]; then
  pactl set-source-mute $CURRENT_SOURCE true
fi

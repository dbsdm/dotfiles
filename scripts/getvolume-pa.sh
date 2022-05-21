#!/bin/bash

ismuted () {
    if [ $(pactl list sinks | grep 'Mute:' | awk '{print $2}') == "yes" ]; then
        return 0
    else
        return 1
    fi
}

if ismuted; then
    result="MUTED"
else
    result=$(pactl list sinks | grep 'Volume:' | awk 'FNR == 1 {print $5}')
fi

echo -e "$result"

#!/bin/bash
# usage: set-primary.sh [laptop|external]
ROLE=$1
LAPTOP="eDP-1"
EXTERNAL=$(swaymsg -t get_outputs -r | jq -r '.[] | select(.active==true and .name!="eDP-1") | .name' | head -1)

if [ -z "$EXTERNAL" ]; then
    for ws in 1 2 3 4 5 6; do
        swaymsg "workspace $ws; move workspace to output $LAPTOP"
    done
    exit 0
fi

if [ "$ROLE" == "external" ]; then
    PRIMARY=$EXTERNAL; SECONDARY=$LAPTOP
else
    PRIMARY=$LAPTOP; SECONDARY=$EXTERNAL
fi

for ws in 1 2 3; do swaymsg "workspace $ws; move workspace to output $PRIMARY"; done
for ws in 4 5 6; do swaymsg "workspace $ws; move workspace to output $SECONDARY"; done
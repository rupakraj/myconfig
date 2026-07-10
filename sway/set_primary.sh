#!/bin/bash
# usage: set-primary.sh [laptop|external]
ROLE=$1
LAPTOP="eDP-1"
# pick the first active external output (if any)
EXTERNAL=$(swaymsg -t get_outputs -r | jq -r '.[] | select(.active==true and .name!="eDP-1") | .name' | head -1)

# If there's no external display, move all workspaces 1..8 to the laptop
if [ -z "$EXTERNAL" ]; then
    for ws in 1 2 3 4 5 6 7 8; do
        swaymsg "workspace $ws; move workspace to output $LAPTOP"
    done
    exit 0
fi

# Allow swapping primary/secondary with the script arg
if [ "$ROLE" == "external" ]; then
    PRIMARY=$EXTERNAL; SECONDARY=$LAPTOP
else
    PRIMARY=$LAPTOP; SECONDARY=$EXTERNAL
fi

# Strict mapping: workspaces 1-4 -> primary, 5-8 -> secondary
for ws in 1 2 3 4; do
    swaymsg "workspace $ws; move workspace to output $PRIMARY"
done
for ws in 5 6 7 8; do
    swaymsg "workspace $ws; move workspace to output $SECONDARY"
done

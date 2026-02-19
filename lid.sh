#!/bin/bash

INTERNAL="eDP-1"

EXTERNAL=$(hyprctl monitors | grep -oP 'DP-\d+(?=,)' | head -1)

STATE_FILE="$(dirname "$0")/lid_state.log"

# Function to read lid state from file (returns 0 or 1, defaults to 1 if file doesn't exist)
read_lid_state() {
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        echo "1"  # Default to enabled if no file
    fi
}

# Function to write lid state to file
write_lid_state() {
    echo "$1" > "$STATE_FILE"
}

# Check current state and toggle
CURRENT_STATE=$(read_lid_state)

if [[ $CURRENT_STATE == "1" ]] && hyprctl monitors | grep -q "$EXTERNAL"; then
    hyprctl keyword monitor "$INTERNAL,disable"
    hyprctl keyword monitor "$EXTERNAL,3440x1440@180, auto, 1.25"
    write_lid_state 0
else
    hyprctl keyword monitor "$INTERNAL,2880x1920@120, auto, 2"
    write_lid_state 1
fi

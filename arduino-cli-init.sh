#!/bin/bash 

# This script initializes some of dependencies needed to work in a
# old-school way.
# TODO: create dependencies section in main README.md
# More info: https://siytek.com/arduino-cli-raspberry-pi/


[[ -x $(which arduino-cli) ]] && ARCLI_BIN=$(which arduino-cli) && echo "arduino-cli found at $ARCLI_BIN"

# Updating board and libraries
arduino-cli core update-index

echo "Searching for boards..."
arduino-cli board list

# Process unknown board type
UNKNOWN_BOARDS=$(arduino-cli board list | grep -i unknown | wc -l)
if [[ $UNKNOWN_BOARDS -gt 0 ]]; then
	echo "Found $UNKNOWN_BOARDS not recognized boards. Looking it up manually..."
	arduino-cli board listall
fi

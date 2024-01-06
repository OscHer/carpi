#!/bin/bash 

# This script initializes some of dependencies needed to work in a
# old-school way.
# TODO: create dependencies section in main README.md
# More info: https://siytek.com/arduino-cli-raspberry-pi/

# Update repositories and install recommended software
function update_and_install() {
    	echo
	echo "Updating repositories and installing recommended software"
	(apt update && apt install -y build-essential make) 2> /dev/null 2> /dev/null || echo "You need root privileges. Try with sudo or su - root."
}


update_and_install

# Look for arduino-cli binary
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

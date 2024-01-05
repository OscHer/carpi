#!/bin/bash 

# This script initializes some of dependencies needed to work in a
# old-school way.
# TODO: create dependencies section in main README.md
# More info: https://siytek.com/arduino-cli-raspberry-pi/


[[ -x $(which arduino-cli) ]] && ARCLI_BIN=$(which arduino-cli) && echo "arduino-cli found at $ARCLI_BIN"




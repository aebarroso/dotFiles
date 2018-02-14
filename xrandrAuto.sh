#!/bin/bash
# Auto add screen
MONITOR=LVDS1

# Activate dual screen mode
function ActivateVGA {
echo "Dual Screen"
	xrandr --auto --output VGA1 --mode 1366x768 --right-of LVDS1
	MONITOR=LVDS1VGA1
}
# Function to deactivate VGA
function DeactivateVGA {
	echo "Switching to LVDS1"
	xrandr --output VGA1 --off --output LVDS1 --auto
	MONITOR=LVDS1
}

# Functions to check if VGA is connected and in use
function VGAActive {
	[ $MONITOR = "LCDS1VGA1" ]
}
function VGAConnected {
	! xrandr | grep "^VGA1" | grep disconnected
}

##while true
##do
	if VGAConnected
	then
		ActivateVGA
	fi
	if ! VGAConnected
	then
		DeactivateVGA
	fi
    ##sleep 1s#!/bin/bash
##done

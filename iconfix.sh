#!/bin/bash
# Script made by Un1q32
#modified by LegacyGuides
#credits to Marda33 for these icons

# This script is licensed under the GNU GPLv3
# You can find the license here: http://www.gnu.org/licenses/gpl-3.0.html

rootcheck() {
    if [ "$EUID" != "0" ]; then
        printf "This script must be run as root!\n"
        exit 1
    fi
}

fixpowerapp() {
    rootcheck
    if [ -d /Applications/PowerApp.app ]; then
        printf "Removing old PowerApp icon...\n"
        rm -f /Applications/PowerApp.app/AppIcon*
        printf "Adding new icon...\n"
        cp /usr/share/iconfix2/powerapp.png /Applications/PowerApp.app/Icon-72.png
    else
        printf "PowerApp not found - Skipping...\n"
    fi
}

fixbatterylife() {
    rootcheck
    if [ -d /Applications/BatteryLife.app ]; then
        printf "Removing old BatteryLife icon...\n"
        rm -f /Applications/BatteryLife.app/AppIcon*
        printf "Adding new icon...\n"
        cp /usr/share/iconfix2/batterylife.png /Applications/BatteryLife.app/Icon-72.png
    else
        printf "BatteryLife not found - Skipping...\n"
    fi
}

if [ -z "$1" ]; then
    fixpowerapp
    fixbatterylife
    printf "Done.\n"
    exit 0
fi

case "$1" in
    powerapp)
        fixpowerapp
        printf "Done.\n"
        exit 0


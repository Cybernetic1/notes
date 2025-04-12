#!/bin/bash

# http://ubuntuforums.org/showthread.php?t=1942984

# I needed this when I connected a big monitor to my ubuntu laptop.
# Unity has nice window tiling shortcuts that need the number keypad to work.
# ctrl-alt-num4 sends a window left, ctrl-alt-num6 sends a window right, etc.

# STATUS=$(gsettings get org.gnome.desktop.a11y.keyboard mousekeys-enable) #Are mousekeys on (true or false)

if xset q | grep -q 'Mouse Keys:  off'; then
	# gsettings set org.gnome.desktop.a11y.keyboard mousekeys-enable true
	xset led named 'Mouse Keys'

	notify-send -i  "/usr/share/icons/gnome/48x48/devices/keyboard.png" "                    Mousekeys ON"
	echo "Mousekeys are ON"
else
	# gsettings set org.gnome.desktop.a11y.keyboard mousekeys-enable false
	xset -led named 'Mouse Keys'

	notify-send -i  "/usr/share/icons/gnome/48x48/devices/keyboard.png" "                    Mousekeys OFF"
	echo "Mousekeys are OFF - use ctrl-alt-num4 to send window left, ctrl-alt-num6 to send window right"
fi

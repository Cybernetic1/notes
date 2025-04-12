#!/bin/sh
# echo "processing mouse number:" $id
xinput --set-prop 'Logitech USB Trackball' 'libinput Scroll Method Enabled' 0 0 1
xinput --set-prop 'Logitech USB Trackball' 'libinput Button Scrolling Button' 9
xinput --set-prop 'Logitech USB Trackball' 'libinput Left Handed Enabled' 1
# This disables the annoying 'back' key by mouse button 8:
xinput --set-button-map 'Logitech USB Trackball' 1 2 3 4 5 6 7 0 0

# xinput --set-prop 'Logitech USB Trackball' 'libinput Scroll Method Enabled' 0 0 1
# xinput --set-prop 'Logitech USB Trackball' 'libinput Button Scrolling Button' 9

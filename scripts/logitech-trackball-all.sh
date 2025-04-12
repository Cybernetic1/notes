#!/bin/sh
for id in $(xinput --list | \
            sed -n '/Logitech USB Trackball.*pointer/s/.*=\([0-9]\+\).*/\1/p')
do
  echo "processing mouse number:" $id
  xinput --set-prop $id 'libinput Scroll Method Enabled' 0 0 1
  xinput --set-prop $id 'libinput Button Scrolling Button' 9
  xinput --set-prop $id 'libinput Left Handed Enabled' 1
  # This disables the annoying 'back' key by mouse button 8:
  xinput --set-button-map $id 1 2 3 4 5 6 7 0 0
done

# xinput --set-prop 'Logitech USB Trackball' 'libinput Scroll Method Enabled' 0 0 1
# xinput --set-prop 'Logitech USB Trackball' 'libinput Button Scrolling Button' 9

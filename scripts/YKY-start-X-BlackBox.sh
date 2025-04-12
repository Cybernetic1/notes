# ======= added by YKY ========

# **** set blue trackball acceleration profile (not sure what effects this has):
# xinput --set-prop 'Primax Kensington Eagle Trackball' 'libinput Accel Profile Enabled' 0 1
# * reverse scroll wheel direction:  (this is needed b/c I use left hand in bed):
# xinput --set-prop 'Primax Kensington Eagle Trackball' 'libinput Natural Scrolling Enabled' 1

/home/yky/logitech-trackball.sh
# xinput --set-prop 'Logitech USB Trackball' 'libinput Scroll Method Enabled' 0 0 1
# xinput --set-prop 'Logitech USB Trackball' 'libinput Button Scrolling Button' 9
# xinput --set-prop 'Logitech USB Trackball' 'Device Accel Profile' 2
# xinput --set-prop 'Logitech USB Trackball' 'Device Accel Velocity Scaling' 2.0

# blank screen 15 seconds before 3 minutes (180 seconds)
# sleep 3s && xset dpms 0 0 165

xset s off
xset dpms 0 0 0

# This is moved to /etc/modules
# sudo modprobe pcspkr

exec xautolock -time 3 -locker "systemctl suspend" -notifier "beep -f 1900 -n -f 2500 & xset dpms force off" -notify 15 -corners ---- &

# -cornerdelay 4 -cornerredelay 4 &

# Not sure if this may have caused problem?
# exit 0

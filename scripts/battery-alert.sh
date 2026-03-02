#!/bin/bash
# Get battery percentage
battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
# Get status (Charging/Discharging)
status=$(acpi -b | grep -P -o 'Discharging|Charging')

# If battery is < 2% and not charging
if [ "$battery_level" -le 2 ] && [ "$status" == "Discharging" ]; then
    # Play a sound
    # paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
    XDG_RUNTIME_DIR=/run/user/$(id -u) paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
    # OR use system beep (requires pcspkr module)
    # beep -f 1000 -n -f 1000 -n -f 1000
fi

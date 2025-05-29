#!/bin/bash
mice=$(xinput | grep -o "Logitech USB Trackball\s*id=[0-9]*" | grep -o "id=[0-9]*" | grep -o "[0-9]*")
# for each mouse
for mouse in $mice; do
	echo "Mouse ID: $mouse"
	# grep Device Node (???): \s* "/dev/input/event[0-9]*"
	xinput --list-props $mouse | grep "Device Node ("
done

# use 'hwinfo --mouse' to find the mice's "Unique ID" and "Device Files" lines
echo "Device Files for each mouse:"
hwinfo --mouse | grep "Device Files:"
echo "Unique ID for each mouse:"
hwinfo --mouse | grep "Unique ID:"

echo "The Unique ID 'n4EJ' is the mouse on my bed"
echo "Which mouse do you want to change?"
read mouse
# grep -o means show only non-empty parts of line that match
# Fucking annoying thing is that sometimes the property number is 303
# but sometimes it's 306 or 558
result=$(xinput list-props "$mouse" | grep "Left Handed Enabled (")
propnum=$(echo $result | grep -o "([0-9]*)" | grep -o "[0-9]*")
echo "property number =" $propnum
state=$(echo $result | grep -o "[01]$")
echo "prior state =" $state

if [ $state == '1' ];then
	xinput set-prop $mouse $propnum 0
	echo "current state set to 0"
else
	xinput set-prop $mouse $propnum 1
	echo "current state set to 1"
fi

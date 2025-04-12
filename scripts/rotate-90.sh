!/usr/bin/bash
beep
# **** Cannot use env variables because the env seems to be different
#		and modifications to variables seem not to affect caller's env
orientation=$(cat /home/yky/screen_orientation.txt)
orientation=$(((orientation + 1) % 4))
ekho 旋转 $orientation
echo "$orientation" > "/home/yky/screen_orientation.txt"

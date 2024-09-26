#!/bin/sh

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40
do
	# move mouse to pic
	xdotool mousemove 630 616
	# save image
	xdotool click 3 key Down Down Return
	sleep 1
	xdotool key Return
	sleep 1
	# click "next pic"
	xdotool mousemove 1293 308 click 1
	sleep 2
	# wait a bit... repeat
	echo "scanning number $i"
done
beep

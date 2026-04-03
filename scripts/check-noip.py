from gpiozero import TonalBuzzer
from gpiozero.tones import Tone
import time
import re
import subprocess
import sys

if len(sys.argv) == 2 and sys.argv[1] == "-v":
	verbose = True
else:
	verbose = False

my_IP = 'yky.myddns.me'

# Ping my IP address
result = subprocess.run(['ping', '-c', '1', my_IP], capture_output=True, text=True, timeout=5)
if verbose: print(result.stdout)
pattern = rf"PING \b{re.escape(my_IP)}\b \(([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\)"
ip0 = re.match(pattern, result.stdout)
if ip0 is not None:
	ip1 = ip0.group(1)
else:
	ip1 = '** FAIL **'
if verbose: print("PING", my_IP, ip1)

# check if it is same as ifconfig.me
result2 = subprocess.run(['curl', 'ifconfig.me'], capture_output=True, text=True, timeout=5)
ip2 = result2.stdout
if verbose: print("curl ifconfig.me =", ip2)

def sweep(freq1, freq2, duration, steps):
	for i in range(0,steps):
		freq = freq1 + (freq2 - freq1) * i/steps
		b.play(freq)
		time.sleep(duration / steps)

if ip1 == ip2:
	b = TonalBuzzer(22)
	for i in [1,2,3,4,5]:
		b.play(880.0)
		time.sleep(0.05)
		b.play(220.0)
		time.sleep(0.05)
	b.stop()
else:
	b = TonalBuzzer(22)
	for i in [1,2,3,4,5]:
		sweep(400,800,0.3,30)
		sweep(800,400,0.3,30)
	b.stop()
 

# -*- coding: UTF-8 -*-
__module_name__ = "YKY HexChat script"
__module_version__ = "2.0"
__module_description__ = "(C) YKY 22 July 2019"

import hexchat
hexchat.prnt("\00311Loading YKY script....")

"""Don't display status messages in private chat windows
	Right now only works for `disconnected'
"""
def status_hook(word, word_eol, userdata):
	server = hexchat.get_info("server")
	# print("server = ", server)
	network = hexchat.get_info("network")
	# print("network = ", network)
	context = hexchat.find_context(server=server, channel=network)
	if context is None:
		return
	if type(word_eol) == str:
		context.emit_print("Generic Message", "● " + word_eol)
	elif type(word_eol) == list:
		for line in word_eol:
			context.emit_print("Generic Message", "● ", line)
			# print(line)
	return hexchat.EAT_XCHAT # Don't let xchat do its normal printing 
 
hexchat.hook_print('Disconnected', status_hook)
hexchat.hook_print('Server Connected', status_hook)
hexchat.hook_print('Server Error', status_hook)
hexchat.hook_print('Server Lookup', status_hook)
hexchat.hook_print('Server Notice', status_hook)
hexchat.hook_print('Server Text', status_hook)
hexchat.hook_print('Notify Away', status_hook)
hexchat.hook_print('Notify Back', status_hook)
hexchat.hook_print('Notify Empty', status_hook)
hexchat.hook_print('Notify Header', status_hook)
hexchat.hook_print('Notify Number', status_hook)
hexchat.hook_print('Notify Offline', status_hook)
hexchat.hook_print('Notify Online', status_hook)

# ============ WHOIS stuff ===============

# from playsound import playsound

def whereIs(word, word_eol, userdata):
	# execute /whois
	#ctxt = hexchat.get_context()
	#nick = ctxt.get_info("channel")
	#print("Nickname = " + nick)
	#hexchat.command("whois " + nick)
	address = word[1]
	call(["bash", "/home/yky/find-country.sh", address])
	f = open("found-country.txt")
	print("\00313===== Location =====\n" + f.read())

from subprocess import call
import os

def whoIsNameLine(word, word_eol, userdata):
	address = word[2]
	# check if address is numeric IP address
	if address.replace('.','').isdigit():
		# print(os.getcwd())
		call(["bash", "/home/yky/find-country.sh", address])
		f = open("found-country.txt")
		print("\00313===== Location =====\n" + f.read())
	else:
		hexchat.command("dns " + address)

def whoIs402(word, word_eol, userdata):
	if word[2] == "401" or word[2] == "402":
		print("\00318 Whois: not here")
		# playsound('/home/yky/.config/hexchat/sounds/nosuch.wav')

hexchat.hook_command('whereis', whereIs)
hexchat.hook_print("WhoIs Name Line", whoIsNameLine)
# hexchat.hook_print("Server Notice", whoIs402)
hexchat.hook_print("Server Text", whoIs402)

print("\00311 ....YKY script loaded")

# def key_hook(word, word_eol, userdata):
	# """This code is copied from:
		# https://github.com/hexchat/hexchat-addons
	# Gets the inputbox's text, perform substitutions and replaces it.
	# This function is called every time a key is pressed.
	# It does nothing if that	key isn't Enter or if the input box is empty.
	# KP_Return (keypad Enter key) is ignored, and can be used if you don't want
	# any substitutions to happen.
	# """
	# if not(word[0] == "65293"):
		# return
	# msg = hexchat.get_info('inputbox')
	# if msg is None:
		# return
	# msg += " :)"
	# hexchat.command("settext " + msg)

"""Other hooking methods didn't work --- they lead to endless recursion"""
# hexchat.hook_print('Key Press', key_hook)

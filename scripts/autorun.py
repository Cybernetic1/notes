# -*- coding: UTF-8 -*-
import hexchat
__module_name__ = "YKY AutoRun script"
__module_version__ = "1.0" 
__module_description__ = "YKY's auto run script" 

hexchat.command("menu -p5 ADD Channels")
hexchat.command("menu ADD \"Channels/DAL cum thirsty\" \"join #0!!!!!!!!cumthirsty_girls\"")
hexchat.command("menu ADD \"Channels/DAL dad & dau\" \"join #dad&daughtersex\"")
hexchat.command("menu ADD \"Channels/DAL humiliate a sub\" \"join #0!!!!!!!!Humiliate_A_sub\"")
hexchat.command("menu ADD Channels/-")

hexchat.command("menu ADD \"Channels/Under fem humiliation\" \"join #femhumiliationsex\"")
hexchat.command("menu ADD \"Channels/Under fem submission\" \"join #femsubmissionsex\"")
hexchat.command("menu ADD \"Channels/Under rapesex\" \"join #rapesex\"")
hexchat.command("menu ADD \"Channels/Under fuck my wife\" \"join #0!fuckmywife\"")
hexchat.command("menu ADD \"Channels/Under analsex\" \"join #analsex\"")
hexchat.command("menu ADD \"Channels/Under cybersex\" \"join #cybersex\"")

#### automatically set channel logging to OFF

def youJoin(word, word_eol, userdata):
    # channelName = word[1]
    hexchat.command("chanopt text_logging off")

hexchat.hook_print("You Join", youJoin)

print("\00311 ....Autorun script loaded")

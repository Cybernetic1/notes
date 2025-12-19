#!/bin/bash

CHAT_ID="1032046374"
MESSAGE="SSH login alert: User= $PAM_USER Connection from,to= $SSH_CONNECTION ."

curl -s -X POST https://api.telegram.org/bot8450469449:AAHOhgUZ9KKGiAHsalDgjoduGplVjXZ82MU/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"

# save THIS file to /usr/local/bin/ssh_notify.sh
# edit the file /etc/pam.d/sshd
# add the line:
#    session    optional     pam_exec.so /usr/local/bin/ssh_notify.sh
# restart SSH server:
#    sudo systemctl daemon-reload
#    sudo systemctl restart sshd

# to obtain Telegram bot information:
# get Telegram bot's API token from @BotFather in Telegram
# open a chat message with the bot in Telegram
# then run:
#    curl https://api.telegram.org/bot<API token>/getUpdates
# note down the Chat ID

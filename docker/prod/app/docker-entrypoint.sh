#!/bin/sh

[ ! -d "$USER_SSH_KEYS_FOLDER" ] && mkdir -p $USER_SSH_KEYS_FOLDER

echo $PUB_KEY >~/.ssh/authorized_keys

unset PUB_KEY

/usr/sbin/sshd -D

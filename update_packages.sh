#!/bin/bash

LOGDIR=/var/log/package_update.log

unamestr=$(uname)

case "$unamestr" in
    "Darwin")
	echo -e "==========\n\tbrew update @ $(date)\n==========" >> $LOGDIR
	brew update >> $LOGDIR
	echo -e "==========\n\tbrew upgrade @ $(date)\n==========" >> $LOGDIR
	brew upgrade >> $LOGDIR
	;;
    "Linux")
	sudo apt update  >> $LOGDIR
	sudo apt upgrade  >> $LOGDIR
	;;
    *)
	echo "Lol what OS are you using, buddy? 🤓"
	;;
esac


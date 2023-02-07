#!/bin/bash

LOGDIR=/var/log/package_update.log

echo -e "==========\n\tbrew update @ $(date)\n==========" >> $LOGDIR
brew update >> $LOGDIR
echo -e "==========\n\tbrew upgrade @ $(date)\n==========" >> $LOGDIR
brew upgrade >> $LOGDIR

#!/bin/bash

REPO=~/Documents/repos/update_logs
UPDATE_HIST=/var/log/package_update.log
DOWNLOAD_CLEANUP_HIST=/var/log/download_cleanup.log
cp $UPDATE_HIST ~/Documents/repos/update_logs/$(hostname)_$UPDATE_HIST_$(date | sed "s/ /-/g")
cp $DOWNLOAD_CLEANUP_HIST ~/Documents/repos/update_logs/$(hostname)_$DOWNLOAD_CLEANUP_HIST$(date | sed "s/ /-/g")
cd $REPO ; git add . ; git commit -m "Automatic monthly update commit." ; git push
> $UPDATE_HIST
> $DOWNLOAD_CLEANUP_HIST

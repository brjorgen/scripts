#!/bin/bash

LOGFILE=/var/log/download_cleanup.log

echo -e "$Cleaning up downloads! $(date)\nNew Documentation:\n" >> $LOGFILE
ls -l ~/Downloads/*.{pdf,txt,doc} >> $LOGFILE
mv ~/Downloads/*.{pdf,txt,doc} ~/Documents/documentation
echo -e "\* nNew games:\n" >> $LOGFILE
ls -1 *.{iso,7z} >> $LOGFILE
mv ~/Downloads/*.{iso,7z} ~/Games
echo -e "\n* New pictures:\n" >> $LOGFILE
ls -l ~/Downloads/*.{png,jpg,svg,gif} >> $LOGFILE
mv ~/Downloads/*.{png,jpg,svg,gif} ~/Pictures
echo -e "\n* New videos:\n" >> $LOGFILE
ls -l ~/Downloads/*.{mp4,webm,mov,avi,m4v,mkv,flv} >> $LOGFILE
mv ~/Downloads/*.{mp4,webm,mov,avi,m4v,mkv,flv} ~/Movies
echo -e "\n* New music:\n" >> $LOGFILE
ls -l ~/Downloads/*.{mp3,flac,wav} >> $LOGFILE
mv ~/Downloads/*.{mp3,flac,wav} ~/Music

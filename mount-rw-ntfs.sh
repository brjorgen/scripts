#!/bin/bash

# mounts an NTFS drive with read/write permissions on macOs.
# Why the write operation isn't supported by default will forever be a mistery.

sudo umount /Volumes/My\ Passport/
sudo mkdir /Volumes/disk4s1
sudo mount -t ntfs -o rw,auto,nobrowse /dev/disk4s1 /Volumes/disk4s1
open /Volumes/disk4s1

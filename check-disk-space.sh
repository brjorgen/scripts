#!/bin/sh
du -a . 2>/dev/null | sort -n -r | head -n 20

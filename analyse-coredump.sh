#!/bin/sh
coredumpctl gdb $(coredumpctl list | awk '{print $5}' | tail -1)

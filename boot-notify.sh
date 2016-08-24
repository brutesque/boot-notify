#!/usr/bin/env bash

PYTHON=$(which python)
BOOTNOTIFY="/usr/local/bin/boot-notify.py"

$PYTHON $BOOTNOTIFY >> /var/log/boot-notify.log

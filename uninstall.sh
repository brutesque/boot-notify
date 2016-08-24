#!/usr/bin/env bash

sudo launchctl unload /Library/LaunchDaemons/com.brutesque.BootNotify.plist
sudo rm /Library/LaunchDaemons/com.brutesque.BootNotify.plist
sudo rm /usr/local/bin/boot-notify
sudo rm /usr/local/bin/boot-notify.py
sudo rm /var/log/boot-notify.log

echo "Uninstall complete."
exit 0

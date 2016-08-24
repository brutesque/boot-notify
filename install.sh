#!/usr/bin/env bash

# Exit this script on the first error.
#------------------------------------------------------------------------------
set -e

sudo cp boot-notify.py /usr/local/bin/

read -p "Prowl apikey: " APIKEY
sed_param="s/\[YOUR PROWL API KEY\]/$APIKEY/"
sed "$sed_param" com.brutesque.BootNotify.plist > com.brutesque.BootNotify.plist.new
sudo cp com.brutesque.BootNotify.plist.new /Library/LaunchDaemons/com.brutesque.BootNotify.plist
rm com.brutesque.BootNotify.plist.new

sudo cp boot-notify.sh /usr/local/bin/boot-notify
sudo chmod +x /usr/local/bin/boot-notify
sudo launchctl load /Library/LaunchDaemons/com.brutesque.BootNotify.plist

echo "Install complete."
exit 0

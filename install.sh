#!/usr/bin/env bash

# Exit this script on the first error.
#------------------------------------------------------------------------------
set -e


# Define Operating system
#------------------------------------------------------------------------------
OS=$(uname -s)
if [[ $OS == Darwin ]]; then
    echo "Installing for $OS"
else
    echo "Installation for $OS not implemented."
    exit 1
fi


# Ask for prowl apikey
#------------------------------------------------------------------------------
read -p "Prowl apikey: " APIKEY


# Goto temp directory
#------------------------------------------------------------------------------
pushd $TMPDIR >/dev/null


# Download and install prowlpy
#------------------------------------------------------------------------------
curl -sL https://codeload.github.com/jacobb/prowlpy/zip/master -o prowlpy.zip
unzip prowlpy.zip && rm prowlpy.zip
pushd prowlpy-master/ >/dev/null

sudo python setup.py install

popd >/dev/null


# Download boot-notify
#------------------------------------------------------------------------------
curl -sL https://codeload.github.com/brutesque/boot-notify/zip/master -o boot-notify.zip
unzip boot-notify.zip && rm boot-notify.zip

pushd boot-notify-master/


# Copy scripts to bin
#------------------------------------------------------------------------------
sudo mkdir -p /usr/local/bin/
sudo cp boot-notify.py /usr/local/bin/
sudo cp boot-notify.sh /usr/local/bin/boot-notify
sudo chmod +x /usr/local/bin/boot-notify


# Setup LaunchDeamon with prowlpy apikey
#------------------------------------------------------------------------------
sed_param="s/\[YOUR PROWL API KEY\]/$APIKEY/"
sed "$sed_param" com.brutesque.BootNotify.plist > com.brutesque.BootNotify.plist.new
sudo cp com.brutesque.BootNotify.plist.new /Library/LaunchDaemons/com.brutesque.BootNotify.plist


popd >/dev/null


# Clean temp files and leave /tmp
#------------------------------------------------------------------------------
sudo rm -Rf prowlpy-master/ boot-notify-master/
popd >/dev/null


# Activate the LaunchDaemon
#------------------------------------------------------------------------------
sudo launchctl load /Library/LaunchDaemons/com.brutesque.BootNotify.plist


# Complete installation
#------------------------------------------------------------------------------
echo "Install complete."
exit 0

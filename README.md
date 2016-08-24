# boot-notify
Small app to send notification on boot

The install script sets up a LaunchDaemon to start the notifier when the system has booted. The script will wait until internet connection is established.

You need to install Prowl for iOS (https://www.prowlapp.com) to receive notifications.

## Install

Open Terminal.app and copy-paste the following line:
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/brutesque/boot-notify/master/install.sh)"
```

## Uninstall

Open Terminal.app and copy-paste the following line:
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/brutesque/boot-notify/master/uninstall.sh)"
```

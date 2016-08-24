# BootNotify
Small app to send Push Notification on machine boot

The install script sets up a LaunchDaemon to send the Push Notification when the system has booted. The script will wait until internet connection is established.

BootNotify uses Prowl for iOS to send Push Notifications.


## Install

Firstly install prowl on your iOS device: https://itunes.apple.com/us/app/prowl-easy-push-notifications/id320876271
Create an apikey: https://www.prowlapp.com

Open Terminal.app and copy-paste the following command:
```sh
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/brutesque/boot-notify/master/install.sh)"
```

The script will ask for your prowl api key. It also needs adminstrator rights to install the Daemon to run as root, so it might ask for your password.
```sh
Prowl apikey:
...
Password:
...
Install complete.
```

If everything went well, you should receive a Push Notification immediately.

You can also do a reboot to try it out.


## Uninstall

Open Terminal.app and copy-paste the following line:
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/brutesque/boot-notify/master/uninstall.sh)"
```

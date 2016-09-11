# BootNotify
LaunchDaemon for sending Push Notifications on machine boot. Uses Prowl for iOS to send Push Notifications.


## Install

First install prowl on your iOS device: https://itunes.apple.com/us/app/prowl-easy-push-notifications/id320876271

Create an apikey: https://www.prowlapp.com

Open Terminal.app and enter the following command:
```sh
$ bash -c "$(curl -fsSL raw.githubusercontent.com/brutesque/boot-notify/master/install.sh)"
```

The script will ask for your prowl api key. It also needs adminstrator rights to install the Daemon to run as root, so it might ask for your password.
```
Prowl apikey: a8d7f...
...
Password: ***
...
Install complete.
```

If everything went well, you should receive a Push Notification immediately. You can also do a reboot to try it out.


## Uninstall

Open Terminal.app and copy-paste the following line:
```sh
$ bash -c "$(curl -fsSL raw.githubusercontent.com/brutesque/boot-notify/master/uninstall.sh)"
```

The script might ask for your password.
```
Password: ***
Uninstall complete.
```

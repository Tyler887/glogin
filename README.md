# GLogin
**GLogin** stands for **GNOME Login Prompt** and is a simple GTK+ login prompt for Debian GNU/Linux,
including Debian derivatives like Ubuntu.

## Install
Check your distribution with the following command:
```shell
lsb_release -a
```
This should output something like this:
```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu Kinetic Kudu (development branch)
Release:        22.10
Codename:       kinetic
```
Check if Git (the VCS used by GitHub) is installed by running:
```shell
which git
```
This should output something like:
```
/usr/bin/git
```
Now we clone this repository and install the prompt:
```shell
git clone https://github.com/Tyler887/glogin.git
cd glogin
sudo bash install.sh
```
All dependenices, including the Zenity low-level GNOME window frontend, will be installed,
and GLogin will be installed as a daemon that starts after the GNOME display manager.

Reboot your OS and you will see the new login prompt. Enter your username and password,
and voilá! You got logged in from the magic prompt!

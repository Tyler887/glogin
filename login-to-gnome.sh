#!/bin/bash
USERNAME=`zenity --entry --text='Enter your username.' --title=$(lsb_release -s -i)`
PASSWD=`zenity --password --text='Welcome, $USERNAME! Enter your password to log in.' --title=$(lsb_release -s -i)`

case $? in
         0)
	 	echo $PASSWD | su $USERNAME -c gnome-session;;
         1)
                zenity --warning --title="$(lsb_release -s -i) [becoming root]" --text="Login cancelled. Starting root session for maintenance."
                gnome-session
                ;;
        -1)
                zenity --error --title="$(lsb_release -s -i) [fatal login error]" --text="A fatal error has occured and $(lsb_release -s -i) will now reboot. If this persists, please boot $(lsb_release -i -s) in recovery mode by opening the GRUB bootloader menu."
                reboot
                ;;
esac

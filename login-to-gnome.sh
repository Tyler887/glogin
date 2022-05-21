#!/bin/bash
ENTRY=`zenity --password --username --title=$(lsb_release -s -i)`

case $? in
         0)
	 	echo `$ENTRY | cut -d'|' -f2` | su "`echo $ENTRY | cut -d'|' -f1`" -c gnome-session;;
         1)
                zenity --warning --title="$(lsb_release -s -i)" --text="Login cancelled. Starting root session for maintenance."
                gnome-session
                ;;
        -1)
                zenity --error --title="$(lsb_release -s -i)" --text="A fatal error has occured and $(lsb_release -s -i) will now reboot. If this persists, please boot Ubuntu in recovery mode by opening the GRUB bootloader menu."
                reboot
                ;;
esac

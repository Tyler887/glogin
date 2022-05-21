echo "[!] Checking for root access..."
if [ "`id -u`" -ne "0" ]; then
	echo "Error: No root access (try running with sudo)"
	exit 2
fi
echo "    Installing zenity..."
apt-add-repository -y main # in case the user accidentally removed the main repo (does
                           # not do anything unless main is not an added apt component)
apt-get update
apt-get install -y zenity
echo "    Copying startup script to /usr/sbin..."
cp ./login-to-gnome.sh /usr/sbin/glogind
echo "    Enabling systemd login prompt service, may take a few nanoseconds..."
cp glogin.service /lib/systemd/system
systemctl daemon-reload
systemctl enable glogin
echo "Reboot your OS and you will get a new login prompt"

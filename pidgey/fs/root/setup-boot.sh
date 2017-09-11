#!/bin/bash
#setup systemd startup
systemctl enable kiosk

#setup plymouth
tar xvf starry-night.tar.bz2 --directory /usr/share/plymouth/themes/
update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/starry-night/starry-night.plymouth 100
update-alternatives --config default.plymouth
update-initramfs -u

#setup grub
cp grub /etc/default/
update-grub

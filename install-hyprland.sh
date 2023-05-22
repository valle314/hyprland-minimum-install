#!/bin/bash

cd Hyprland

echo "copy files and configs"

sudo rm /usr/bin/Hyprland
sudo rm /usr/bin/hyprctl
sudo rm /usr/lib/libwlroots.so.12032

sudo cp -R build/Hyprland /usr/bin/
sudo cp -R hyprctl/hyprctl /usr/bin/
sudo cp -R subprojects/wlroots/build/libwlroots.so.12032 /usr/lib/

cd ..

sudo mkdir -p /usr/share/wayland-sessions/
mkdir -p ~/.config/hypr/

sudo cp -n hypr/hyprland.desktop /usr/share/wayland-sessions/
cp -n hypr/hyprland.conf ~/.config/hypr/
cp -n hypr/xdg-portal-hyprland ~/.config/hypr/
echo "done with copying files"
sleep 2

#enable the sddm login manager service
# echo "enabling the SDDM service"
# sudo systemctl enable sddm 
# sleep 2

echo "you can install some additional packages now with the install-additional-packages script"

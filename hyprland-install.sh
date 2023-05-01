#!/bin/bash

#function that will test for a package and if not found it will attempt to install it
install_software() {
    #First lets see if the package is there
    if yay -Q $1 &>> /dev/null ; then
        echo "$1 is already installed."
    else
        #no package found so installing
        echo -e "now installing $1 ..."
        yay -S --noconfirm $1
        #test to make sure package installed
        if yay -Q $1 &>> /dev/null ; then
            echo -e "$1 was installed."
        else
            #if this is hit then a package is missing
            echo -e "$1 install had failed"
            exit
        fi
    fi
}

#install all dependencies for hyprland
echo -e "installing dependencies for hyprland"
for SOFTWR in gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info
do
       install_software $SOFTWR 
done

echo "updating packages"
yay -Syu --devel

#building hyprland
echo "building hyprland"
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
sudo make install

sudo cp -R ./build/Hyprland /usr/bin/
sudo cp -R ./hyprctl /usr/bin/
sudo cp -R ./subprojects/wlroots/build/libwlroots.so.12032 /usr/lib/
sudo cp -R ./examples/hyprland.desktop /usr/share/wayland-sessions/
mkdir ~/.config/hypr
sudo cp -R ./examples/hyprland.conf ~/.config/hypr/
cd ..

#installing essential packages
echo "installing must haves"
for SOFTWR in kitty jq mako xdg-desktop-portal-hyprland-git qt6-wayland sddm-git 
do
       install_software $SOFTWR 
done

#enable the sddm login manager service
echo "enabling the SDDM service"
sudo systemctl enable sddm 
sleep 2

 #clean out other portals
echo "cleaning out conflicting xdg portals"
yay -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk 

        
cp ./start-hypr-nvidia.sh ~/.start-hypr-nvidia.sh
sudo sed -i 's/Exec=Hyprland/Exec=\/home\/'$USER'\/.start-hypr-nvidia.sh/' /usr/share/wayland-sessions/hyprland.desktop


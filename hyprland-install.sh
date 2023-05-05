#!/bin/bash

#function that will test for a package and if not found it will attempt to install it
install_software() {
    #first lets see if the package is there
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

sudo cp -R build/Hyprland /usr/bin/
sudo cp -R hyprctl/hyprctl /usr/bin/
sudo cp -R subprojects/wlroots/build/libwlroots.so.12032 /usr/lib/
cd ..

sudo mkdir /usr/share/wayland-sessions/
sudo mkdir ~/.config/hypr/
sudo cp -R hypr/hyprland.desktop /usr/share/wayland-sessions/
sudo cp -R hypr/hyprland.conf ~/.config/hypr/
sudo cp -R hypr/xdg-portal-hyprland ~/.config/hypr/

#installing essential packages
echo "installing must haves"
for SOFTWR in alacritty jq dunst xdg-desktop-portal-hyprland-git qt6-wayland sddm-git polkit-kde-agent
do
       install_software $SOFTWR 
done

 #clean out other portals
remove_software(){
    if yay -Q $1 &>> /dev/null ; then 
        echo "$1 will be removed"
        yay -R --noconfirm $1
    else
        echo "$1 is not available, nothing to do"
    fi
}

for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
do
    remove_software $SOFT
done

#enable the sddm login manager service
echo "enabling the SDDM service"
sudo systemctl enable sddm 
sleep 2

echo "done!"

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

#installing packages for better usability
#dunst: for notifications
#grim, slurp and swappy: for screenshots
#fuzzel: fuzzy app launcher
#wlogout: logout screen
#hyprpaper: for backgrounds
#copyq: for clipboard
#pavucontrol: audio
#xdg-user-dir: user directories(downloads, pictures, ...)

echo "installing additional packages"
for SOFTWR in dunst grim slurp swappy fuzzel wlogout pavucontrol xdg-user-dirs
do
       install_software $SOFTWR 
done

#copy dots
sudo cp -R additional-dots/alacritty ~/.config/



#additional packages one might install:
#hyprpaper: background
#thunar/vifm/ranger/lf/nnn: file manager 
#thunar-archive-plugin: Adds archive operations to the Thunar file context menus
#file-roller: Create and modify archives
#waybar/ironbar/gbar: status bar
#install rustup: https://rustup.rs/
#nwg-look: for gtk settings
#swayimg: image viewer for wayland
#swaylock-effects: login effects
#
#
#IF YOU HAVE SOME PROBLEMS WITH NVIDIA AND QT OR ELECTRON APPS:
#for qt: qt5-wayland qt5ct 
#fixing electron crashin: nvidia-vaapi-driver-git

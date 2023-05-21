#!/bin/bash

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


for SOFTWR in cmake meson scdoc wayland-protocols gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog gtk3 gobject-introspection libgirepository libpulse libnl libappindicator-gtk3 libdbusmenu-gtk3 fftw libmpdclient libxkbcommon
do
       install_software $SOFTWR 
done

sudo rm -rf ~/.config/waybar/
cp -r waybar/ ~/.config/

git clone https://github.com/Alexays/Waybar
cd Waybar

sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build
meson configure -Dexperimental=true build
meson build
ninja -C build install

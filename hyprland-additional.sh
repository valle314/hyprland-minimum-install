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




#TODO





#installing packages for better usability
# echo "installing additional packages"
# for SOFTWR in swaylock-effects wofi wlogout swappy grim slurp thunar waybar-hyprland hyprpaper 
# do
#        install_software $SOFTWR 
# done

#suche dir noch einige sachen hier aus
# Stage 1 - main components
# echo -e "$CNT - Stage 1 - Installing main components, this may take a while..."
# for SOFTWR in hyprland kitty jq mako waybar-hyprland swww swaylock-effects wofi wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar
# do
#        install_software $SOFTWR 
# done
#
# # Stage 2 - more tools
# echo -e "$CNT - Stage 2 - Installing additional tools and utilities, this may take a while..."
# for SOFTWR in polkit-gnome python-requests pamixer pavucontrol brightnessctl bluez bluez-utils blueman network-manager-applet gvfs thunar-archive-plugin file-roller btop pacman-contrib
# do
#     install_software $SOFTWR
# done
#
# # Stage 3 - some visual tools
# echo -e "$CNT - Stage 3 - Installing theme and visual related tools and utilities, this may take a while..."
# for SOFTWR in starship ttf-jetbrains-mono-nerd noto-fonts-emoji lxappearance xfce4-settings sddm-git sddm-sugar-candy-git 
# do
#     install_software $SOFTWR
# done








#notes
#https://github.com/SolDoesTech/HyprV3/blob/main/set-hypr
#https://wiki.hyprland.org/Nvidia/
#glaube als nächstes dann reboot und dann ein anderes script laufen lassen!?
#schaue dir auch seine anderen config sachen an usw.
#sowas wie hier https://wiki.hyprland.org/Useful-Utilities/Hyprland-desktop-portal/





#this is for the hyprland config later
#monitor=DP-1,highres,0x0,1
#monitor=HDMI-A-1,highres,3840x0,1
#input {
#     kb_layout = de
#     kb_variant =
#     kb_model =
#     kb_options =
#     kb_rules =
#
#     repeat_rate = 100
#     repeat_delay = 200
#
#     follow_mouse = 1
#
#     touchpad {
#         natural_scroll = no
#     }
#
#     sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
# }

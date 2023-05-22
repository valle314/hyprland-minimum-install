#!/bin/bash

#installing yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm
cd ..

echo "updating the yay database..."
yay -Suy --noconfirm 

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

#setup nvidia
echo -e "nvidia setup stage"
for SOFTWR in linux-headers nvidia-dkms nvidia-settings libva libva-nvidia-driver-git nvidia-utils pipewire wireplumber
do
    install_software $SOFTWR
done

echo "now run the configure-nvidia script"

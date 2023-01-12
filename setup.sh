#!/bin/sh

install_paru() {
# Clone, install and cleanup
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd .. && rm -rf paru
}

# Make sure git is installed sudo stuff still unclear
#sudo pacman -S --noconfirm git
#install_paru

## install paru to get aur stuff


## call paru to install everything we need

# Make symlinks of all confs
for d in $(ls -d confs); do
  echo $d
done

# Make vim install all plugins
#nvim -es +PackerSync

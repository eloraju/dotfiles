#!/bin/sh

install_paru() {
# Clone, install and cleanup
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd .. && rm -rf paru
}

install_official_pkgs() {
  sudo pacman -S --noconfirm - < pkgs
}

install_official_pkgs() {
  pary -aS --noconfirm - < aur.pkgs
}

# Make sure git is installed sudo stuff still unclear
#sudo pacman -S --noconfirm git
#install_paru

## install paru to get aur stuff

## call paru to install everything we need

# Make symlinks of all confs with stow
# stow home

# Make vim install all plugins
#nvim -es +PackerSync

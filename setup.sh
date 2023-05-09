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

stow home

#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

setxkbmap -option ctrl:nocaps

run autorandr -c
run nm-applet
run picom
run variety
run xbanish
run 1password
run blueman-applet

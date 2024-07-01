#!/usr/bin/env bash

# Shameless copy-paste
# https://github.com/FelixKratz/SketchyBar/discussions/12?sort=new#discussioncomment-1843975
# I just want my sleep button

sketchybar --add item menu.logo left \
  --set menu.logo \
  icon="" \
  click_script='sketchybar --set $NAME popup.drawing=toggle' \
  icon.font="SF Pro:Black:16.0" \
  label.drawing=off \
  popup.background.border_width=2 \
  popup.background.corner_radius=3 \
  popup.background.border_color=0xff9dd274 \
  popup.background.color=0x60000000 \
  popup.blur_radius=50 \
  --add item menu.preferences popup.menu.logo \
  --set menu.preferences label="Settings" click_script="open -a 'System Settings';sketchybar --set menu.logo popup.drawing=off" \
  --add item menu.activity popup.menu.logo \
  --set menu.activity label="Activity" click_script="open -a 'Activity Monitor';sketchybar --set menu.logo popup.drawing=off" \
  --add item menu.lock popup.menu.logo \
  --set menu.lock label="Lock Screen" click_script="pmset displaysleepnow;sketchybar --set menu.logo popup.drawing=off"

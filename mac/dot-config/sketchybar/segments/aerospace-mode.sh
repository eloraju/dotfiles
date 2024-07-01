#!/usr/bin/env bash

sketchybar --add item mode.current left \
  --subscribe mode.current aerospace_mode_change \
  --set mode.current \
  background.color=0x44ffffff \
  background.corner_radius=5 \
  background.height=20 \
  background.drawing=off \
  label="| ?" \
  script="$CONFIG_DIR/plugins/current-mode.sh"

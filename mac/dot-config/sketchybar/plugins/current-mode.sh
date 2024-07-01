#!/usr/bin/env bash

echo $AESP_MODE
sketchybar --set $NAME label="| ${AESP_MODE:-main}"

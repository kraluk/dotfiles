#!/bin/sh
xrandr --output VIRTUAL1 --off --output LVDS1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output VGA1 --mode 1600x900 --pos 0x0 --rotate normal
i3-msg restart

#!/bin/sh

#Blurring
# picom --experimental-backends --config ~/.config/picom/picom.conf.qtile &

# systray battery icon
cbatticon -u 5 &

# systray volume
volctl &

#nitrogen
nitrogen --restore &

#Discord
# discord & 

#flameshot
dunst &
flameshot &

# bluetooth
blueman-applet &

nm-applet &

xrandr --output eDP --mode 1920x1200 --rate 60 &



# keyboard mapping
setxkbmap -option caps:escape &

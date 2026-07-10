#!/bin/sh
exec >> "$HOME/.local/share/qtile/autostart.log" 2>&1
set -x

cbatticon -u 5 &
dunst &
flameshot &
xrandr --output eDP --mode 1920x1200 --rate 60 &
setxkbmap -option caps:escape &


# popup fix
/usr/lib/xdg-desktop-portal &
/usr/lib/xdg-desktop-portal-gtk &

blueman-applet &
nm-applet &
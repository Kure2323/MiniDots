#!/bin/bash 

wal -R

hyprpaper & 
dunst -conf ~/.config/dunst/dunstrc & 
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
sh ~/.scripts/battery20.sh &

waybar & 

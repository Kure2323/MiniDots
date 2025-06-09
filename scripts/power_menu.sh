#!/bin/bash

# Usar rofi para mostrar el menú
option=$(echo -e "Shutdown\nReboot\nSuspend" | rofi -dmenu -p "Select action:" -theme ~/.cache/wal/colors-rofi-dark.rasi)

case $option in
  Shutdown)
    shutdown now
    ;;
  Reboot)
    reboot
    ;;
  Suspend)
    systemctl suspend
    ;;
  *)
    exit 1
    ;;
esac

#!/bin/bash

xset -dpms
xset s off
#disable ctrl-alt-f1
#xmodmap -pke #list current keymap
xmodmap -e "keycode  67 = F1 F1 F1 F1 F1 F1"
xmodmap -e "keycode  68 = F2 F2 F2 F2 F2 F2"
xmodmap -e "keycode  69 = F3 F3 F3 F3 F3 F3"
xmodmap -e "keycode  70 = F4 F4 F4 F4 F4 F4"
xmodmap -e "keycode  71 = F5 F5 F5 F5 F5 F5"
xmodmap -e "keycode  72 = F6 F6 F6 F6 F6 F6"
xmodmap -e "keycode  73 = F7 F7 F7 F7 F7 F7"
xmodmap -e "keycode  74 = F8 F8 F8 F8 F8 F8"
xmodmap -e "keycode  75 = F9 F9 F9 F9 F9 F9"
xmodmap -e "keycode  76 = F10 F10 F10 F10 F10 F10"
xmodmap -e "keycode  95 = F11 F11 F11 F11 F11 F11"
xmodmap -e "keycode  96 = F12 F12 F12 F12 F12 F12"

openbox-session & start-pulseaudio-x11

#while true; do
#  rm -rf ~/.{config,cache}/google-chrome/
#  chromium-browser --kiosk --no-first-run  'http://google.ca'
#done

while true; do
  /opt/io.cordova.pidgey/cordova-ubuntu
done

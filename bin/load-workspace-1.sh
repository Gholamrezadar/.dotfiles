#!/bin/bash

# check if wmctrl exists
if ! (command -v wmctrl &> /dev/null); then
  echo "wmctrl not found"
  echo "install it using 'sudo apt install wmctrl'"
  exit
fi

# Launch Chrome and move to workspace 1
google-chrome --force-dark-mode --enable-features=WebUIDarkMode --new-window https://www.google.com &
sleep 5 # Wait for Chrome to open before moving it
wmctrl -r chrome -t 0
wmctrl -r chrome -b add,maximized_vert,maximized_horz

# Launch Alacritty and move to workspace 2
alacritty --class=Alacritty &
sleep 1 # Wait for Alacritty to open before moving it
wmctrl -x -r Alacritty -t 1
wmctrl -x -r Alacritty -b add,maximized_vert,maximized_horz

# Launch Brave and move to workspace 3
flatpak run com.brave.Browser --new-window https://chat.openai.com/ &
sleep 5 # Wait for Brave to open before moving it
wmctrl -r brave -t 2
wmctrl -r brave -b add,maximized_vert,maximized_horz

echo "Done"

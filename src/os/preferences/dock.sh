#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.dock expose-group-by-app -bool false" \
    "Do not group windows by application in Mission Control"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

killall "Dock" &> /dev/null

#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_bash() {
    # Test to see if zshell is installed.  If it is:
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then

        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            chsh -s $(which zsh)
        fi
    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_zgen() {
    printf "cloning zgen..."
    git clone https://github.com/tarjoilija/zgen.git ~/
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n   zsh\n\n"

    change_default_bash
    install_zgen
}

main

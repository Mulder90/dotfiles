#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {
    execute \
        "npm install --global --silent $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n   npm\n\n"

    install_npm_package "npm (update)" "npm"
    printf "\n"
    install_npm_package "n" "n"
    install_npm_package "npm-check" "npm-check"
    install_npm_package "tern" "tern"
    install_npm_package "diff-so-fancy" "diff-so-fancy"
    install_npm_package "http-server" "http-server"
    install_npm_package "rebase-editor" "rebase-editor"
}

main

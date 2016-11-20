#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apps() {

    # Cask
    brew_install "Java" "java" "caskroom/cask" "cask"
    brew_install "Flash" "flash-npapi" "caskroom/cask" "cask"
    brew_install "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"
    brew_install "VLC" "vlc" "caskroom/cask" "cask"
    brew_install "AppCleaner" "appcleaner" "caskroom/cask" "cask"
    brew_install "Flux" "flux" "caskroom/cask" "cask"
    brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
    brew_install "Skype" "skype" "caskroom/cask" "cask"
    brew_install "Spotify" "spotify" "caskroom/cask" "cask"
    brew_install "Vagrant" "vagrant" "caskroom/cask" "cask"
    brew_install "Caffeine" "caffeine" "caskroom/cask" "cask"
    brew_install "Gas Mask" "gas-mask" "caskroom/cask" "cask"
    brew_install "Genymotion" "genymotion" "caskroom/cask" "cask"
    brew_install "Slack" "slack" "caskroom/cask" "cask"
    brew_install "Atom" "atom" "caskroom/cask" "cask"
    brew_install "Sublime Text" "sublime-text" "caskroom/cask" "cask"
    brew_install "qlcolorcode" "qlcolorcode" "caskroom/cask" "cask"
    brew_install "qlstephen" "qlstephen" "caskroom/cask" "cask"
    brew_install "quicklook-csv" "quicklook-csv" "caskroom/cask" "cask"
    brew_install "quicklook-json" "quicklook-json" "caskroom/cask" "cask"
    brew_install "qlmarkdown" "qlmarkdown" "caskroom/cask" "cask"
    brew_install "iterm2" "iterm2" "caskroom/cask" "cask"
    brew_install "Dashlane" "dashlane" "caskroom/cask" "cask"
    brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"
    brew_install "Chrome Canary" "google-chrome-canary" "caskroom/versions" "cask"
    brew_install "Firefox" "firefox" "caskroom/cask" "cask"
    brew_install "Firefox Developer" "firefoxdeveloperedition" "caskroom/versions" "cask"
    brew_install "Opera" "opera" "caskroom/cask" "cask"

    if is_supported_version "$(get_os_version)" "10.11.4"; then
        brew_install "Safari Technology Preview" "safari-technology-preview" "caskroom/versions" "cask"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    brew_install "Git" "git"
    brew_install "Node" "node"
    brew_install "wget" "wget --with-iri"
    brew_install "coreutils" "coreutils"
    brew_install "moreutils" "moreutils"
    brew_install "findutils" "findutils"
    brew_install "sed" "gnu-sed --with-default-names"
    brew_install "grep" "homebrew/dupes/grep"
    brew_install "openssh" "homebrew/dupes/openssh"
    brew_install "jq" "jq"
    brew_install "mongodb" "mongodb"
    brew_install "postgresql" "postgresql"
    brew_install "the_silver_searcher" "the_silver_searcher"
    brew_install "yarn" "yarn"
    brew_install "zsh" "zsh"
    brew_install "elixir" "elixir"
    brew_install "pyenv-virtualenv" "pyenv-virtualenv"
    brew_install "FFmpeg" "ffmpeg"
    brew_install "ImageMagick" "imagemagick --with-webp"
    brew_install "exercism" "exercism"
    brew_install "android-platform-tools" "android-platform-tools"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Miscellaneous\n\n"

    install_apps
    printf "\n"
    brew_cleanup

}

main

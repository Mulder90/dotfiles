#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_homebrew_git_config_file_path() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get config file path)"
        return 1
    fi

}

install_homebrew() {

    if ! cmd_exists "brew"; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Homebrew"

}

opt_out_of_analytics() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Try to get the path of the `Homebrew` git config file.

    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Opt-out of Homebrew's analytics.
    # https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out

    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
    fi

    print_result $? "Homebrew (opt-out of analytics)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_cleanup() {

    # By default Homebrew does not uninstall older versions
    # of formulas so, in order to remove them, `brew cleanup`
    # needs to be used.
    #
    # https://github.com/Homebrew/brew/blob/496fff643f352b0943095e2b96dbc5e0f565db61/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula

    execute \
        "brew cleanup" \
        "Homebrew (cleanup)"

    execute \
        "brew cask cleanup" \
        "Homebrew (cask cleanup)"

}

brew_install() {

    declare -r CMD="$4"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r TAP_VALUE="$3"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed.

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If `brew tap` needs to be executed,
    # check if it executed correctly.

    if [ -n "$TAP_VALUE" ]; then
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.

    # shellcheck disable=SC2086
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA" \
            "$FORMULA_READABLE_NAME"
    fi

}

brew_prefix() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --prefix 2> /dev/null)"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get prefix)"
        return 1
    fi

}

brew_tap() {
    brew tap "$1" &> /dev/null
}

brew_update() {

    execute \
        "brew update" \
        "Homebrew (update)"

}

brew_upgrade() {

    execute \
        "brew upgrade" \
        "Homebrew (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apps() {

    # Cask
    brew_install "Java" "java" "caskroom/cask" "cask"
    brew_install "VLC" "vlc" "caskroom/cask" "cask"
    brew_install "AppCleaner" "appcleaner" "caskroom/cask" "cask"
    brew_install "Flux" "flux" "caskroom/cask" "cask"
    brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
    brew_install "Skype" "skype" "caskroom/cask" "cask"
    brew_install "Spotify" "spotify" "caskroom/cask" "cask"
    brew_install "Vagrant" "vagrant" "caskroom/cask" "cask"
    brew_install "Caffeine" "caffeine" "caskroom/cask" "cask"
    brew_install "Slack" "slack" "caskroom/cask" "cask"
    brew_install "Visual Studio Code Insiders" "visual-studio-code-insiders" "caskroom/cask" "cask"
    brew_install "qlcolorcode" "qlcolorcode" "caskroom/cask" "cask"
    brew_install "qlstephen" "qlstephen" "caskroom/cask" "cask"
    brew_install "quicklook-csv" "quicklook-csv" "caskroom/cask" "cask"
    brew_install "quicklook-json" "quicklook-json" "caskroom/cask" "cask"
    brew_install "qlmarkdown" "qlmarkdown" "caskroom/cask" "cask"
    brew_install "iterm2" "iterm2" "caskroom/cask" "cask"
    brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"
    brew_install "Last Pass" "lastpass" "caskroom/cask" "cask"
    brew_install "Clipy" "clipy" "caskroom/cask" "cask"
    brew_install "Slow Quit Apps" "slowquitapps" "caskroom/cask" "cask"
    brew_install "Virtual Box" "virtualbox" "caskroom/cask" "cask"

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
    brew_install "zsh" "zsh"
    brew_install "jq" "jq"
    brew_install "mongodb" "mongodb"
    brew_install "postgresql" "postgresql"
    brew_install "The Silver Searcher" "the_silver_searcher"
    brew_install "yarn" "yarn"
    brew_install "elixir" "elixir"
    brew_install "pyenv-virtualenv" "pyenv-virtualenv"
    brew_install "ffmpeg" "ffmpeg"
    brew_install "ImageMagick" "imagemagick --with-webp"
    brew_install "Ruby Manager" "rbenv"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Homebrew\n\n"

    install_homebrew
    opt_out_of_analytics

    brew_update
    brew_upgrade

    install_apps
    printf "\n"
    brew_cleanup

}

main

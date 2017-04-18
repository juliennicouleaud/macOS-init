#!/usr/bin/env bash

set -x
# Update brew and upgrade all packages
# brew update
# brew outdated
# brew upgrade
# brew cleanup
# brew doctor
# brew prune

# Clean Cask cache
# brew cask cleanup

set +x

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# List all casks and for each of them,
# test if a newer version is available.
indexUpdateAvailable=0
declare -a updateAvailable=()
casks=( $(brew cask list) )

echo "Scanning the casks…"
for cask in ${casks[@]}
do
    version=$(brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
    installed=$(find "/usr/local/Caskroom/$cask" -type d -maxdepth 1 -maxdepth 1 -name "$version")
    if [[ -z $installed ]]; then
        updateAvailable[$indexUpdateAvailable]="${cask}"
        indexUpdateAvailable=$((indexUpdateAvailable+1))
    else
        echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
done
for updateAvailable in ${updateAvailable[@]}
do
    read -p "${red}${updateAvailable}${reset} requires ${red}update${reset}. Do youn want to update? (${green}y${reset}/${red}n${reset}) Default: ${red}no${reset} " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Ok! Doing nothing."
    else
        echo "Ok! Let's update ${green}${updateAvailable}${green}!"
        (set -x; brew cask uninstall $updateAvailable --force;)
        (set -x; brew cask install $updateAvailable --force;)
    fi
done
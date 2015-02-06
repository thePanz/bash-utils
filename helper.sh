#!/bin/bash

#
# Script taken from: http://natelandau.com/bash-scripting-utilities/
#

#
# Set Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

helper_show_header() {
  printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
helper_show_arrow() {
  printf "? $@\n"
}
helper_show_success() {
 printf "${green}? %s${reset}\n" "$@"
}
helper_show_error() { printf "${red}? %s${reset}\n" "$@"
}
helper_show_warning() { printf "${tan}? %s${reset}\n" "$@"
}
helper_show_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
helper_show_bold() { printf "${bold}%s${reset}\n" "$@"
}
helper_show_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

#
# USAGE FOR SEEKING CONFIRMATION
# seek_confirmation "Ask a question"
# Credt: https://github.com/kevva/dotfiles
#
# if is_confirmed; then
#   some action
# else
#   some other action
# fi
#

helper_seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

# underlined
helper_seek_confirmation_head() {
  printf "\n${underline}${bold}$@${reset}"
  read -p "${underline}${bold} (y/n)${reset} " -n 1
  printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
helper_is_confirmed() {
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
fi
    return 1
}

#
# Test whether a command exists
# $1 = cmd to test
# Usage:
# if type_exists 'git'; then
#   some action
# else
#   some other action
# fi
#

helper_type_exists() {
if [ $(type -P $1) ]; then
  return 0
fi
  return 1
}



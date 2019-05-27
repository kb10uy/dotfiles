#!/bin/bash

section() {
  printf "\e[1;2;37m:: $1\e[0m\n"
}

process() {
  printf "\e[34m==> $1\e[0m\n"
}

error() {
  printf "\e[1;31m$1\e[0m\n"
}

warning() {
  printf "\e[1;33m$1\e[0m\n"
}

check_command() {
  section "Checking $1..."
  if ! command -v $1 > /dev/null 2>&1; then
    error "$1 not found!"
    exit 1
  fi
  process $(command -v $1)
}

make_symlink() {
  local target=$(pwd | sed -E "s#^$HOME#~#")
  process "~/dotfiles/$1 => $target/$1"

  if ! [[ -e ./$1 ]]; then
    ln -s ~/dotfiles/$1 ./$1
  else
    warning "Already exists: $target/$1"
  fi
}

check_repository() {
  # Check dotfiles repository
  section "Checking dotfiles repository..."
  local DOTFILESDIR=$(dirname $(realpath $0))
  if ! [[ $DOTFILESDIR = "$HOME/dotfiles" ]]; then
    error "Invalid dotfiles repository position: $DOTFILESDIR"
    error "\e[2mIt must be ~/dotfiles !"
    exit 1
  fi
  export DOTFILESDIR
  process $DOTFILESDIR
}

install_config() {
  section "Installing dotfiles based on XDG Base Directory..."

  mkdir -p ~/.config
  cd ~/.config
  make_symlink zsh
  make_symlink fish
  make_symlink nano
  make_symlink nvim
  make_symlink i3
  make_symlink i3status
  make_symlink dunst

  mkdir -p ~/.config/libskk/rules
  cd ~/.config/libskk/rules
  make_symlink MoreKanaMap2
}

install_dotfiles() {
  section "Installing dotfiles just under home directory..."

  cd
  make_symlink .zshenv
  make_symlink .tmux.conf
  make_symlink .xprofile
  make_symlink .xdg
  make_symlink .Xmodmap
  make_symlink .dmrc
  make_symlink .npmrc
}

install_plugin_managers() {
  section "Installing plugin managers..."

  if ! command -v git > /dev/null 2>&1; then
    error "Git not found! How do you install this repository!?"
    exit 2
  fi

  process "zplug (for zsh)"
  cd
  git clone --depth 1 https://github.com/zplug/zplug .zplug

  process "dein (for nvim)"
  mkdir -p ~/.local/share/nvim/repos/github.com/Shougo
  cd ~/.local/share/nvim/repos/github.com/Shougo
  git clone https://github.com/Shougo/dein.vim

  process "npm (for node)"
  mkdir -p ~/.local/share/node_modules
}

install_nvim_extra() {
  section "Installing extra packages for nvim..."

  cd

  process "pynvim (required for python scripts)"
  pip3 install --user pynvim

  process "neovim-remote (required for LSP connection)"
  pip3 install --user neovim-remote
}

run_setup() {
  check_repository
  check_command zsh
  check_command nvim
  check_command tmux

  check_command python3
  check_command pip3

  install_config
  install_dotfiles
  install_plugin_managers
  install_nvim_extra

  section "Done!!"
}

run_setup

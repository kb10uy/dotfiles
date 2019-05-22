#!/bin/bash

export VISUAL='nvim'
export PATH="$HOME/.local/bin:$PATH"

shopt -s autocd
alias ls='ls --color=auto'
alias lla='ls --color=auto -la'
alias rmrf='rm -rf'

__prompt_command() {
  PS1="\[\e[38;2;252;170;245;48;2;40;77;145m\] [\u@\h] \[\e[m\]\[\e[1;38;2;61;112;26;48;2;188;224;161m\] %w \[\e[m\]"
  local code="$?"
  if [[ $code == 0 ]]; then
    PS1+="\[\e[38;2;118;84;255;48;2;255;224;196m\] @ $code \[\e[m\]"
  else
    PS1+="\[\e[1;38;2;255;81;202;48;2;81;57;89m\] @ $code \[\e[m\]"
  fi
  PS1+="\n$ "
  PS2="> "
}

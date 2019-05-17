# zmodload zsh/zprof && zprof

if ! [[ -e "$HOME/dotfiles" ]]; then
  echo "dotfiles repository not found!"
fi

source "$HOME/.xdg"

if ! [[ -e "$XDG_CONFIG_HOME/zsh" ]]; then
  echo "zsh directory link not found!"
fi
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zsh_history"
export LOCAL_ROOT="$HOME/.local"

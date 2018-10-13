export PYENV_ROOT="$HOME/.pyenv"
export VISUAL="nvim"

echo $PATH

local CUSTOM_PATHS=(
  /usr/local/go/bin
  /usr/local/ssl/bin
  /usr/local/bin
  $HOME/.rbenv/bin
  $PYENV_ROOT/bin
  $HOME/.composer/vendor/bin
  $HOME/.config/composer/vendor/bin
  $LOCAL_ROOT/bin
  $HOME/.nodebrew/current/bin
  $HOME/.opam/system/bin
  $HOME/.nimble/bin
  /usr/local/texlive/2018/bin/x86_64-linux
)

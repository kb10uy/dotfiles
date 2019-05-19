export PYENV_ROOT="$HOME/.pyenv"
export VISUAL="nvim"

CUSTOM_PATHS=(
  /usr/local/go/bin
  /usr/local/ssl/bin
  /usr/local/bin
  /usr/local/texlive/2019/bin/x86_64-linux
  $HOME/.cargo/bin
  $HOME/.opam/system/bin
  $HOME/.local/bin
  $HOME/.config/composer/vendor/bin
  $HOME/.local/share/node_modules/bin
)

export PATH="$(echo ${CUSTOM_PATHS[@]} | sed -re 's/\s+/:/g'):$PATH"
export PATH_IS_SET=1
unset CUSTOM_PATHS

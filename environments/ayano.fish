set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x PYTHON3_PATH '/usr/bin/python3'

set -x PATH \
  $HOME/.cargo/bin \
  $HOME/.local/bin \
  $HOME/.local/share/node_modules/bin \
  $HOME/.fzf/bin \
  /usr/local/go/bin \
  /usr/local/ssl/bin \
  /usr/local/bin \
  /usr/local/lib/node_modules/yarn/bin/ \
  /usr/bin \
  /bin \
  /sbin

source $HOME/.phpbrew/phpbrew.fish

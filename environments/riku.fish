set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x TRANSPARENTTERM 'iTerm2.app'

set -U fish_user_paths \
  /usr/local/texlive/2019/bin/x86_64-darwin \
  $HOME/.cargo/bin \
  $HOME/.composer/vendor/bin \
  $HOME/.config/composer/vendor/bin \
  $LOCAL_ROOT/bin \
  $LOCAL_ROOT/share/node_modules/bin \
  $HOME/.fzf/bin \
  /usr/local/bin \
  /usr/bin \
  /bin

eval (opam env)
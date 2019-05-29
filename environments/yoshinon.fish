set -x EDITOR 'nvim'
set -x VISUAL 'nvim'

set -x PATH \
  $HOME/.cargo/bin \
  $HOME/.opam/system/bin \
  $HOME/.local/bin \
  $HOME/.config/composer/vendor/bin \
  $HOME/.local/share/node_modules/bin \
  /usr/local/texlive/2019/bin/x86_64-linux \
  /usr/local/go/bin \
  /usr/local/ssl/bin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /sbin

set -x GPG_TTY (tty)
if [ -n "$SSH_CONNECTION" ]
  set -x PINENTRY_USER_DATA 'USE_CURSES=1'
end

eval (opam env)

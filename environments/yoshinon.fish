set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x PYTHON3_PATH '/usr/bin/python3'
set -x JAVA_HOME '/usr/lib/jvm/'(archlinux-java get)
set -x DOTNET_ROOT '/usr/share/dotnet'

set -x PATH \
  $HOME/.cargo/bin \
  $HOME/.opam/system/bin \
  $HOME/.local/bin \
  $HOME/.local/kotlin-language-server/bin \
  $HOME/.config/composer/vendor/bin \
  $HOME/.local/share/node_modules/bin \
  $HOME/.fzf/bin \
  /usr/local/texlive/2019/bin/x86_64-linux \
  /usr/local/go/bin \
  /usr/local/ssl/bin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /sbin

# gpg-agent をかわりにつかう
set -x SSH_AGENT_PID ''
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"

set -x GPG_TTY (tty)
if [ -n "$SSH_CONNECTION" ]
  set -x PINENTRY_USER_DATA 'USE_CURSES=1'
end

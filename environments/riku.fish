set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x TRANSPARENTTERM 'iTerm2.app'
set -x PYTHON3_PATH '/usr/local/bin/python3'
set -x GOPATH $HOME'/.go'
set -x GO111MODULE 'on'
set -x JAVA_HOME (/usr/libexec/java_home)
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x RLS_TOOLCHAIN 'stable'

set -x PATH \
  /usr/local/texlive/2019/bin/x86_64-darwin \
  $HOME/.cargo/bin \
  $HOME/.go/bin \
  $HOME/.composer/vendor/bin \
  $HOME/.config/composer/vendor/bin \
  $HOME/Library/Python/3.9/bin \
  $HOME/.poetry/bin \
  $HOME/.local/bin \
  $HOME/.local/share/node_modules/bin \
  $HOME/.fzf/bin \
  /usr/local/bin \
  /usr/local/go/bin \
  /usr/bin \
  /bin

source $HOME/.phpbrew/phpbrew.fish
source (nodenv init - | psub)

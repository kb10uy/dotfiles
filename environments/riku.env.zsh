export VISUAL="nvim"

local CUSTOM_PATHS=(
  /usr/local/texlive/2019/bin/x86_64-darwin
  $HOME/.cargo/bin
  $HOME/.composer/vendor/bin
  $HOME/.config/composer/vendor/bin
  $LOCAL_ROOT/bin
  $HOME/.fzf/bin
)

export PATH="${(pj:\x3a:)CUSTOM_PATHS}:$PATH"
export PATH_IS_SET=1
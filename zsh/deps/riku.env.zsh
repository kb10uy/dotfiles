export VISUAL="nvim"

local CUSTOM_PATHS=(
  $HOME/.cargo/bin
  $HOME/.composer/vendor/bin
  $HOME/.config/composer/vendor/bin
  $LOCAL_ROOT/bin
)

export PATH="${(pj:\x3a:)CUSTOM_PATHS}:$PATH"
export PATH_IS_SET=1

# depfile for morikubo
# 多分Raspi鯖のみ。

alias cputemp='sudo cat /sys/class/thermal/thermal_zone0/temp'
alias kb10uyorg='sudo nginx -p ~/web/nginx/ -c ~/web/config/nginx.conf'
alias nginx='/usr/local/nginx/sbin/nginx'
alias redisin='redis-cli -s /tmp/redis.sock -a SeKLLyQz6cp6 --raw'
alias tmxa='tmux attach'
alias tmxrs='tmux rename-session'
alias tmxrw='tmux rename-window'
alias vim='nvim'

export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/.pyenv"
export VISUAL="nvim"

local CUSTOM_PATHS=(
  /usr/local/go/bin
  /usr/local/ssl/bin
  /usr/local/bin
  $HOME/.rbenv/bin
  $PYENV_ROOT/bin
  $HOME/.composer/vendor/bin
  $HOME/.yarn/bin
  $HOME/.cargo/bin
  $LOCAL_ROOT/bin
)
export PATH="${(pj:\x3a:)CUSTOM_PATHS}:$PATH"

eval "$(rbenv init -)"
eval "$(pyenv init -)"
. "$HOME/.acme.sh/acme.sh.env"
. "$HOME/.phpbrew/bashrc"

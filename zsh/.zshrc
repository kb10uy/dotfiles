export LANG=ja_JP.UTF-8

# 環境変数の設定が個別に存在していれば先に読み込む
local DEPENV="$ZDOTDIR/deps/$HOST.env.zsh"
if [[ -e $DEPENV && ${PATH_IS_SET-0} = 0 ]]; then
  source $DEPENV
fi

# zplug
if [ -f "$HOME/.zplug/init.zsh" ]; then
  source "$HOME/.zplug/init.zsh"

  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  zplug 'joel-porquet/zsh-dircolors-solarized', use:'zsh-dircolors-solarized.zsh'
  zplug 'kb10uy/zsh-starter'
  zplug 'kb10uy/zsh-docker-utils'
  zplug 'kb10uy/zsh-theme-furry-umbrella'

  zplug load
fi

# 環境依存の初期化ファイルを読み込む
# 必須なので存在しなければメッセージを表示
local DEPFILE="$ZDOTDIR/deps/$HOST.zsh"
if [[ -e $DEPFILE ]]; then
  source $DEPFILE
else
  echo "Host dependency script for '$HOST' not found. Create new one or check host name."
fi

bindkey -e
source "$ZDOTDIR/.zkbd/xterm-256color-:0"
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history

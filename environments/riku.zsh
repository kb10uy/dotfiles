alias ls='gls -F --color=auto'
alias dircolors='gdircolors'
if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  export TRANSPARENTTERM='iterm'
fi

eval "$(opam env)"
genell 'node npm' '
  export NVM_DIR="$HOME/.nvm"
  source /usr/local/opt/nvm/nvm.sh
'

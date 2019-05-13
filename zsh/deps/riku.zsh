alias ls='gls -F --color=auto'
alias dircolors='gdircolors'
export NVM_DIR="$HOME/.nvm"
source /usr/local/opt/nvm/nvm.sh
eval $(thefuck --alias)
if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  export TRANSPARENTTERM='iterm'
fi

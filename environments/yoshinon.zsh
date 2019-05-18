alias vim='nvim'
alias ocaml='rlwrap ocaml'

# eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(opam env)"
genell 'php php-fpm phpbrew composer' 'source $HOME/.phpbrew/bashrc'

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]]; then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi


lost() {
  echo '失くした物は何ですか 出逢えます 必ずや'
  echo '幾千の息吹 幾万の聲に触れて'
  echo '今この胸に宿る温もり'

  ls -la ~/.local/share/Trash/files/
}

i18nize() {
  local bins=$(echo $PATH | sed -e "s/:/\n/g" | xargs -I {} find {} -maxdepth 1 2> /dev/null)
  local aliases=$(echo $bins | sed -re "s/^\/.+\///" | gawk 'match($0, /(\w)(.+)(.)/, cap) {print "alias " cap[1] length(cap[2]) cap[3] "=" cap[0]}')
  echo $aliases | source /dev/stdin
}

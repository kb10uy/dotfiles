alias vim='nvim'
alias ocaml='rlwrap ocaml'
alias dpsql='PGPASSWORD=j3pWNtxAnI0fKWzt psql -h localhost'

# gnome-terminalなら多分透過してるので TRANSPARENTTERM をセットしておく
if [[ ! -z ${GNOME_TERMINAL_SCREEN+x} ]]; then
  export TRANSPARENTTERM='gnome-terminal'
fi

eval "$(pyenv init -)"
eval "$(rbenv init -)"
source $HOME/.phpbrew/bashrc

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

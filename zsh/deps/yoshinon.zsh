alias vim='nvim'
alias ocaml='rlwrap ocaml'
alias dpsql='PGPASSWORD=j3pWNtxAnI0fKWzt psql -h localhost'

export PYENV_ROOT="$HOME/.pyenv"
export VISUAL="nvim"

local CUSTOM_PATHS=(
  /usr/local/go/bin
  /usr/local/ssl/bin
  /usr/local/bin
  $HOME/.rbenv/bin
  $PYENV_ROOT/bin
  $HOME/.composer/vendor/bin
  $HOME/.config/composer/vendor/bin
  $LOCAL_ROOT/bin
  $HOME/.nodebrew/current/bin
  $HOME/.opam/system/bin
  /usr/local/texlive/2018/bin/x86_64-linux
)
export PATH="${(pj:\x3a:)CUSTOM_PATHS}:$PATH"

eval "$(pyenv init -)"

ssh-yucky() {
  local user=ubuntu
  local id=~/.ssh/yucky_t2micro.pem
  local ip=$(aws ec2 describe-instances --instance-ids i-031199e932fd984a4 | grep PublicDnsName | head -n 1 | awk -F ":" '{print $2}' | sed 's/[",[:blank:]]//g')
  ssh $user@$ip -i $id
}

http-up() {
  sudo ufw allow 80
  sudo ufw allow 443
  yes | sudo ufw enable
}

http-down() {
  sudo ufw reject 80
  sudo ufw reject 443
  yes | sudo ufw enable
}

pacman-vacuum() {
  sudo pacman -Rs --noconfirm $(pacman -Qdtq)
}

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

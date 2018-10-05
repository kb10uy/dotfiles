alias vim='nvim'
alias ocaml='rlwrap ocaml'
alias dpsql='PGPASSWORD=j3pWNtxAnI0fKWzt psql -h localhost'

function {
  local REALDIR=$(dirname $(readlink -f "$1"))
  source $REALDIR/yoshinon.env.zsh
} $0

eval "$(pyenv init -)"

ssh-yucky() {
  local user=ubuntu
  local id=~/.ssh/yucky_t2micro.pem
  local ip=$(aws ec2 describe-instances --instance-ids i-031199e932fd984a4 | grep PublicDnsName | head -n 1 | awk -F ":" '{print $2}' | sed 's/[",[:blank:]]//g')
  ssh $user@$ip -i $id
}

exec-forward-terminal() {
  export LIBGL_ALWAYS_INDIRECT=1
  lxterminal
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

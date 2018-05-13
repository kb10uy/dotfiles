local DEPFILE="$ZDOTDIR/deps/$HOST.zsh"
if [[ -e $DEPFILE ]]; then
  source $DEPFILE
else
  echo "Host dependency script for '$HOST' not found. Create new one or check host name."
fi

autoload -Uz colors
autoload -Uz select-word-style

colors
select-word-style default

PROMPT=$'%{\e[38;5;%(!.124.33)m%}[%n@%m]%{\e[m%} %{\e[1;38;5;214;48;5;22m%}%~%{\e[m%}
%(!.#.$) '
PROMPT2="%(!.#.>)"

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

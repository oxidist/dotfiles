#              __
#  ____  _____/ /_
# /_  / / ___/ __ \
#  / /_(__  ) / / /
# /___/____/_/ /_/


# Enviroment variables
export ZSH=/home/oxide/.oh-my-zsh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export TERMINAL=terminator
export PAGER=less
export VISUAL=vim
export TERM=xterm-256color
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || highlight -O ansi -l {} 2> /dev/null | head -500" --height 50% --layout=reverse --border'
# Syntax highlighting and tab completion
source /home/oxide/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit

# Colored man pages using less as pager
man() {
    env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

# Aliases for a few useful commands
#alias yaourt="yaourt --color --pager"
alias x="ranger"
alias h="htop"
alias w="weechat"
alias neofetch="neofetch --source=wallpaper --backend=w3m"


# Set name of the theme to load.
ZSH_THEME="lambda-gitster"

local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
# # Plugins to load
plugins=(git fzf)
source $ZSH/oh-my-zsh.sh


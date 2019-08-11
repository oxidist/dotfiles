#              __
#  ____  _____/ /_
# /_  / / ___/ __ \
#  / /_(__  ) / / /
# /___/____/_/ /_/


# Enviroment variables
export ZSH=/home/oxide/.oh-my-zsh/
export SSH_KEY_PATH="~/.ssh/rsa_id"
export TERMINAL=terminator
export PAGER=less
export VISUAL=vim
export TERM=xterm-256color
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
#export PATH=$HOME/.emacs.d/doom-emacs/bin

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
alias yaourt="yaourt --color --pager"
alias x="ranger"
alias h="htop"
alias w="weechat"
alias neofetch="neofetch --source=wallpaper --backend=w3m"
#alias ls = "exa"
#alias emacs="~/.emacs.d/doom-emacs/bin/doom run"

# Set name of the theme to load.
ZSH_THEME="lambda-gitster"

local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{yellow}%K{blue}%} $user_symbol%{%b%f%k%F{blue}%} %{%f%}"

POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_TIME_FORMAT="%D{%b %d %H:%M}"

# # Plugins to load
plugins=(git)
source $ZSH/oh-my-zsh.sh

# zsh-bd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vi='vim'

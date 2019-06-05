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
# alias yaourt="yaourt --color --pager"
alias x="ranger"
alias h="htop"
alias w="weechat"
alias neofetch="neofetch --source=wallpaper --backend=w3m"
# Font mode for powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# Set name of the theme to load.
ZSH_THEME="lambda-gitster"

# Prompt settings BEST
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context time dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)

# status colors
POWERLEVEL9K_STATUS_OK_FOREGROUND='119'
# time colors
POWERLEVEL9K_TIME_BACKGROUND='15'
# dir colors
POWERLEVEL9K_DIR_HOME_BACKGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'
# `git hub colors`
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
# 119
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='227'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'


# Quitar iconos del inicio
POWERLEVEL9K_LINUX_ICON='\uf179' # \uf179 is 
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_OK_ICON='✓'
POWERLEVEL9K_CARRIAGE_RETURN_ICON='↵ '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b ' # \uf09b is 
POWERLEVEL9K_NETWORK_ICON=''

# Tritlo's config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context time dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_BATTERY_ICON="B"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

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
if which ruby >/dev/null && which gem >/dev/null; then
    PATH=/home/oxide/.gem/ruby/2.4.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/oxide/.fzf/bin
fi

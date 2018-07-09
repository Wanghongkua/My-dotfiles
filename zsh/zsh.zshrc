# Path to your oh-my-zsh installation.
export ZSH=/Users/HankWang/.oh-my-zsh
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

KEYTIMEOUT=1
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="sunrise"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump history-substring-search vi-mode python brew tmux)

# User configuration

# To use the autojump



export PATH="/Users/HankWang/anaconda/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/HankWang/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# added by Anaconda3 4.3.1 installer
export PATH="/Users/HankWang/anaconda3/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_AU.UTF-8
export LC_ALL=en_AU.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# 10ms for key sequences
KEYTIMEOUT=1
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
fpath=(/usr/local/share/zsh-completions $fpath)

alias ll='ls -l'
alias la='ls -a'
alias c='clear'
#alias python='python3'
#alias javac="javac -J-Dfile.encoding=utf8"
alias -s html=mvim   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=mvim     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
# alias -s py=vim       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
# alias vim='/usr/local/Cellar/macvim/8.0-136_1/MacVim.app/Contents/MacOS/Vim'
alias vim=nvim
alias ruby=/usr/local/bin/ruby
alias gem=/usr/local/bin/gem
#alias -s gz='tar -xzvf'
#alias -s tgz='tar -xzvf'
#alias -s zip='unzip'
#alias -s bz2='tar -xjvf'
export ECLIPSE_HOME=~/Applications/Eclipse.app/Contents/Eclipse
alias eclim='$ECLIPSE_HOME/eclimd'
alias tmux="TERM=screen-256color-bce tmux"
alias py35="source activate py35"
alias dpy35="source deactivate py35"
alias swipl='/Applications/SWI-Prolog.app/Contents/MacOS/swipl'
alias o="open"
alias unsw="ssh z5095588@login.cse.unsw.edu.au"
#alias ssh="TERM=xterm-256color ssh"
#alias unsw="TERM=xterm-256color ssh z5095588@login.cse.unsw.edu.au"
alias dock="docker run -i -p 2041:80 -v /Users/HankWang/Documents/COMP9041/ass2:/var/www comp2041/cgi"
alias mux="tmuxinator"
# Must be in the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export TERM=xterm-256color-italic
export VIMRC=~/Documents/dotfile/vim.vimrc
export ZSHRC=~/Documents/dotfile/zsh/zsh.zshrc
export DOTFILE=~/Documents/dotfile
# export EDITOR=/usr/local/Cellar/macvim/8.0-127/MacVim.app/Contents/MacOS/Vim
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config
# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
function lazygit(){
    git add .
    git commit -am "$1"
    git push
}
function ks(){
    names=`tmux list-sessions`|| return 1
    if test $# -eq 0; then
        sessions=`echo "$names" | cut -d ':' -f1`
        while read -r line; do
            tmux kill-session -t "$line"
        done <<< "$sessions"
    else
        for line in "$@"; do
            tmux kill-session -t "$line"
        done
    fi
}

function kd(){
    names=`docker ps`|| return 1
    sessions=`echo "$names" | cut -d ' ' -f1`
    n=1
    while read -r line; do
        if test $n -eq 1; then
            n=0
            continue
        else
            docker kill "$line"
        fi
    done <<< "$sessions"
}

# Personal zsh prompt
# source ~/Documents/dotfile/zsh/prompt.zsh
source $DOTFILE/zsh/prompt.zsh

#
# The Z shell configuration file
#

#
# General options
#
unlimit           # use hard limits
limit stack 8192  # except for a smaller stack
limit coredump 0  # and no core dumps
limit -s

# Changing Directories
setopt AUTO_CD AUTO_PUSHD CDABLE_VARS PUSHD_MINUS PUSHD_SILENT PUSHD_TO_HOME

# Completion
setopt AUTO_LIST NO_AUTO_PARAM_SLASH REC_EXACT

# Expansion and Globbing
setopt GLOB_DOTS NO_EXTENDED_GLOB NO_EQUALS

# History
setopt APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# Input/Output
setopt CORRECT CORRECT_ALL NO_CLOBBER RC_QUOTES RM_STAR_SILENT

# Job Control
setopt LONG_LIST_JOBS NOTIFY NO_AUTO_RESUME NO_BG_NICE

# Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
hr() { printf '━%.0s' $(seq $COLUMNS) }

# Autoload all shell functions from all directories in $fpath
for func in $^fpath/*(N-.x:t); autoload $func

# Load zsh functions
autoload zmv

# Load zsh modules
zmodload -a zsh/sched sched
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty

#
# Aliases
#
alias ls='ls -F --group-directories-first --quoting-style=literal --color=auto'
alias ll='ls -lh'
alias rr='rm -rf'
alias grep='egrep --color=auto'
alias j='jobs'
alias h='history'
alias hd='hexdump -C'
alias screen='screen -DR'
alias tree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

if (( $+commands[ncat] )) alias nc='ncat'
if (( $+commands[ack-grep] )) alias ack='ack-grep'

# Avoid correcting and globbing on special commands
for cmd in mv cp mkdir; alias $cmd="nocorrect $cmd"
for cmd in alias expr find; alias $cmd="noglob $cmd"

# Global aliases
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g J='| python -m json.tool'

# Suffix aliases
alias -s c=vim
alias -s cpp=vim
alias -s h=vim
alias -s js=vim
alias -s tex=vim

#
# Environment variables
#
export PAGER="less"
export EDITOR="vim"
#export BROWSER=""
export LESS="-ieMR"
export HELPDIR="/usr/local/lib/zsh/help"  # directory for run-help function to find docs

# Search path for commands
path+=~/bin
path=($^path(N))

# History options
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

# Set prompts
autoload -U colors && colors

if [ ! $MC_SID ] ; then
    if [ $EUID -ne 0 ] ; then
        PROMPT="%{${fg[green]}%}%n@%m %{${fg_bold[blue]}%}%~ %#%{$reset_color%} "
    else
        PROMPT="%{${fg_bold[red]}%}%n@%m %{${fg_bold[blue]}%}%~ %#%{$reset_color%} "
    fi
    RPROMPT=" %(?,%{${fg_bold[green]}%}:%)%{$reset_color%},%{${fg_bold[red]}%}:(%{$reset_color%}"
else
    PROMPT="%n@%m %# "
    # No RPROMPT for Midnight Commander
fi

PROMPT2="%{${fg_bold[blue]}%}>%{$reset_color%} "

# Color setup for ls
eval $(dircolors)

#
# Key bindings
#
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -v   # vi key bindings
#bindkey -e  # emacs key bindings
#bindkey -d  # default key bindings

bindkey '^[[2~' yank                  # Insert key
bindkey '^[[3~' delete-char           # Delete key
bindkey '^[[1~' beginning-of-line     # Home key
bindkey '^[[H'  beginning-of-line
bindkey '^[[4~' end-of-line           # End key
bindkey '^[[F'  end-of-line
bindkey '^[[5~' up-line-or-history    # Page Up key
bindkey '^P'    up-line-or-history
bindkey '^[[6~' down-line-or-history  # Page Down key
bindkey '^N'    down-line-or-history
bindkey '^[[A'  history-beginning-search-backward-end  # Arrow Up key
bindkey '^[OA'  history-beginning-search-backward-end
bindkey '^[[B'  history-beginning-search-forward-end   # Arrow Down key
bindkey '^[OB'  history-beginning-search-forward-end
bindkey ' '     magic-space
bindkey '^I'    complete-word
bindkey '^R'    history-incremental-search-backward

#
# Completion options
#
autoload -U compinit && compinit

# List of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Colorize files completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# Formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Command for process lists
zstyle ':completion:*:processes' command 'ps o pid,user,command'

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?~' '*?.o' '*?.pyc'

# Ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

# Enable cache for the completions
zstyle ':completion::complete:*' use-cache 1

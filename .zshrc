zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
# zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' original true
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle :compinstall filename '/home/rahul/.zshrc'


autoload -Uz compinit
compinit
zmodload -i zsh/complist


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt append_history
setopt inc_append_history
setopt share_history          # share history between open shells
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_expire_dups_first # expire duped history first
setopt hist_save_no_dups
setopt hist_find_no_dups

bindkey -e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

setopt no_beep
setopt auto_cd
setopt cd_able_vars
setopt extended_glob
setopt correct correct_all
setopt promptsubst
setopt chase_dots
setopt chase_links
setopt noclobber
setopt ignoreeof

setopt completeinword
# setopt complete_aliases
setopt list_types


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias x=exit
# alias urxvt="urxvt  -sr -g '80x30' -fn 'xft:DejaVu Sans Mono-12:dpi=75'"
# alias xterm="xterm -g '80x30' -fa 'xft:DejaVu Sans Mono-12:dpi=75'"
alias rm='rm -i'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias md='mkdir -p'
alias em='emacs -nw'
alias es='emacs --daemon'
alias ec='emacsclient -t'
alias a='sudo aptitude'
alias ai='sudo aptitude install'
alias ar='sudo aptitude remove'
alias au='sudo aptitude update'
alias as='apt-cache search'
alias aw='apt-cache show'
alias tmux='tmux -2 -u'
alias tn='\tmux -2 -u new-session -s'
alias ta='\tmux attach-session -t'
alias tl='\tmux list-sessions'

export EDITOR=vim

export PYTHONDIRS=$(/usr/bin/env python -c 'import sys; sys.stdout.write(",".join(sys.path))')
PYTHONDIRS=$(echo $PYTHONDIRS | sed -e 's;\\;/;g')


# Functions
#
# format titles for screen and rxvt
function title() {
    # escape '%' chars in $1, make nonprintables visible
    current=${(V)1//\%/\%\%}
    # Truncate command, and join lines.
    current=$(print -Pn "%40>..>$current" | tr -d "\n")
    host_and_user=$(print -Pn "%40>..>$2")
    working_dir=$(print -Pn "%40<..<$3")
    case $TERM in
    screen*)
        print -Pn "\ek$current:$host_and_user $working_dir\e\\"
        ;;
    xterm*|rxvt*|urxvt*)
        print -Pn "\e]0;$current:$host_and_user $working_dir\a"
        # if [ -n "$STY" ]; then
        #     print -Pn "\ek$current:$host_and_user $working_dir\e\\"
        # fi
            ;;
    esac
}

function precmd() {
    if [ -z "${ST}" ]; then
        title "zsh" "%n@%m" "%~"
    else
        title "$ST" "%n@%m" "%~"
    fi
}

## preexec is called just before any command line is executed
function preexec() {
    if [ -z "${ST}" ]; then
        title "$1" "%n@%m" "%~"
    else
        title "$ST" "%n@%m" "%~"
    fi
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && print "∞($(glb) -> $(grb))" && return
    hg root >/dev/null 2>/dev/null && print "☿($(hg branch))" && return
    print 'o'
}


function ni() { ST="${1}"; }
function nr() { unset ST; }

function glb() { git rev-parse --abbrev-ref HEAD 2> /dev/null }
function grb() { git rev-parse --symbolic-full-name --abbrev-ref HEAD 2> /dev/null }


export PS1="$(print '%{\e[1;33m%}%n@%m%{\e[0m%}'): $(print '%{\e[1;34m%}%~%{\e[0m%}') $(print "%{\e[1;35m%}\$(prompt_char)%{\e[0m%}") $(print '%{\e[1;31m%}%?%{\e[0m%}')
$(print '%{\e[1;32m%}%# ▶%{\e[0m%}') "
export PS2="$(print '%{\e[0;36m%}> %{\e[0m%}')"

## General configuration

# Golang configuration
# gc
prefixes=(5 6 8)
for p in $prefixes; do
	compctl -g "*.${p}" ${p}l
	compctl -g "*.go" ${p}g
done

# standard go tools
compctl -g "*.go" gofmt

# gccgo
compctl -g "*.go" gccgo




export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH

export GOPATH=$HOME/musings/go
export WORKON_HOME=~/venvs
# source /usr/local/bin/virtualenvwrapper.sh

export PIP_DOWNLOAD_CACHE=$HOME/.pip-download-cache
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export RUST_SRC_PATH=/data/sw/rust/src


# OPAM configuration
. /home/rahul/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

PERL_MB_OPT="--install_base \"/home/rahul/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rahul/perl5"; export PERL_MM_OPT;


typeset -U path
path=($HOME/bin $GOPATH/bin $HOME/.rvm/bin /usr/local/heroku/bin ~/data/sw/nim-0.11.2/bin $path)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# source ~/.shell_prompt.sh
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTS="--extended-exact --cycle"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments

export PAGER='less'
stty -ixon -ixoff

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' original true
zstyle :compinstall filename '/home/rahulkum/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
autoload -U colors
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory extendedglob
unsetopt beep
bindkey -e
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
export EDITOR=vim
export PERLDIRS=$(/usr/bin/env perl -e 'print join(",", @INC)')
PERLDIRS=$(echo $PERLDIRS | sed -e 's;\\;/;g')
export PYTHONDIRS=$(/usr/bin/env python -c 'import sys; sys.stdout.write(",".join(sys.path))')
PYTHONDIRS=$(echo $PYTHONDIRS | sed -e 's;\\;/;g')
export PATH=$HOME/bin:$HOME/scala/bin:/var/lib/gems/1.9.1/bin:$PATH
###
# Autoload zsh modules when they are referenced
###
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile


###
# setup options
###
# use share_history instead of setopt APPEND_HISTORY         # appends history to .zsh_history
setopt AUTO_CD                # cd if no matching command
setopt AUTO_PUSHD                # make cd=pushd
setopt AUTO_PARAM_SLASH       # adds slash at end of tabbed dirs
setopt HIST_IGNORE_ALL_DUPS
setopt CHECK_JOBS             # check bg jobs on exit
setopt CORRECT                # corrects spelling
setopt CORRECT_ALL            # corrects spelling
setopt EXTENDED_GLOB          # globs #, ~ and ^
setopt EXTENDED_HISTORY       # saves timestamps on history
setopt GLOB_DOTS              # find dotfiles easier
setopt HASH_CMDS              # save cmd location to skip PATH lookup
setopt HIST_EXPIRE_DUPS_FIRST # expire duped history first
setopt HIST_NO_STORE          # don't save 'history' cmd in history
setopt INC_APPEND_HISTORY     # append history as command are entered
setopt LIST_ROWS_FIRST        # completion options left-to-right, top-to-bottom
setopt LIST_TYPES             # show file types in list
setopt MARK_DIRS              # adds slash to end of completed dirs
setopt NUMERIC_GLOB_SORT      # sort numerically first, before alpha
setopt PROMPT_SUBST           # sub values in prompt (though it seems to work anyway haha)
#setopt RM_STAR_WAIT           # pause before confirming rm *
setopt SHARE_HISTORY          # share history between open shells
setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup


###
# Setup vars
###

HOSTNAME="`hostname`"
REPORTTIME=120 # print elapsed time when more than 10 seconds

export PAGER='less'
export SHELL="/bin/zsh"



###
# Emacs shortcut keys
###
bindkey -e


###
# ssh host completion
###
zstyle -e ':completion:*:(ssh|scp):*' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
       /dev/null)"}%%[# ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
)'


###
# Aliases
###

# general helpers
alias l="ls -laFhG"
alias sr="screen -r"



###
# Bunch of stuff I haven't figured out if I need yet
###
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
# Completion Styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show


case $TERM in
    *xterm*|ansi)
		function settab { print -Pn "\e]1;%n@%m: %~\a" }
		function settitle { print -Pn "\e]2;%n@%m: %~\a" }
		function chpwd { settab;settitle }
		settab;settitle
        ;;
esac

if [ -s ~/.profile ] ; then
    source ~/.profile
fi

export GOROOT=~/go
export GOOS=linux
export GOARCH=386

# PS1 and PS2
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo "☿($(hg branch))" && return
    echo -n '○'
}
export PS1="$(print '%{\e[1;34m%}%n@%m%{\e[0m%}'): $(print '%{\e[0;34m%}%~%{\e[0m%}')
$(print $(prompt_char) $) "
export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

# Vars used later on by Zsh
# type a directory's name to cd to it
compctl -/ cd
bindkey -e

preexec () {
    if [[ "$STY" != "" ]]; then
        if [ -n "$ST" ]; then
            title=$ST
        else
            title="`hostname`"
        fi
        echo -ne "\ek$title\e\\"
    fi
}

precmd () {
    preexec
}

function ni() { ST=$1; }
function nr() { unset ST; }


setopt ALL_EXPORT
setopt CHASE_DOTS
setopt CHASE_LINKS
setopt NO_CLOBBER
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt EQUALS
setopt HASH_DIRS
setopt HASH_LIST_ALL
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
alias ghci="rlwrap -r ghcii.sh"
alias clj="rlwrap -r java clojure.main"
alias x=exit
#source ~/remap.key
# Silence the cpan.
export PERL_MM_USE_DEFAULT=1
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
alias ipython="/usr/bin/env python `which ipython`"
paste-from-clipboard() {
    CLIPOUT=`xclip -o -sel clipboard`
    if [[ "x${CLIPOUT}" == "x" ]]; then
        CLIPOUT=`xclip -o`
    fi
    BUFFER="${BUFFER}${CLIPOUT}"
}
zle -N paste-from-clipboard paste-from-clipboard
bindkey "^v" paste-from-clipboard
yank() {
    CLIPOUT=`xclip -o`
    BUFFER="${BUFFER}${CLIPOUT}"
}
zle -N yank yank
bindkey "^y" yank
# F# aliases
alias fsi='mono ~/Downloads/sw/FSharp/bin/fsi.exe'
alias fsc='mono ~/Downloads/sw/FSharp/bin/fsc.exe --resident'
function calc() { echo "$1" | bc - l}
function bat()
{
    bat_cap=$(acpi -b | sed -r -e 's;^.*:\s*;;' | awk -F, '{print $2}')
    adapter=$(acpi -a | awk -F: '{print $2}')
    echo "${bat_cap}, ${adapter}"
}
setopt prompt_subst
#RPROMPT="\$(bat)"
alias urxvt="urxvt  -sr -g '80x30' -fn 'xft:DejaVu Sans Mono-12:dpi=75'"
alias run_gae='python2.5 ~/google_appengine/dev_appserver.py'
# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME
alias nodei="NODE_NO_READLINE=1 rlwrap node"
TERM=xterm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

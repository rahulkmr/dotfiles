# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' original true
zstyle :compinstall filename '/home/rahulkum/.zshrc'

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


# ssh host completion
zstyle -e ':completion:*:(ssh|scp):*' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
       /dev/null)"}%%[# ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
)'

autoload -Uz compinit promptinit
compinit
promptinit
autoload -U colors
autoload edit-command-line
# End of lines added by compinstall

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Bunch of stuff I haven't figured out if I need yet
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand


# setup options
setopt glob_complete
setopt auto_cd                # cd if no matching command
setopt auto_pushd                # make cd=pushd
setopt auto_param_slash       # adds slash at end of tabbed dirs
setopt hist_ignore_all_dups
setopt check_jobs             # check bg jobs on exit
setopt correct                # corrects spelling
setopt correct_all            # corrects spelling
setopt extended_glob          # globs #, ~ and ^
setopt extended_history       # saves timestamps on history
setopt glob_dots              # find dotfiles easier
setopt hash_cmds              # save cmd location to skip PATH lookup
setopt hist_expire_dups_first # expire duped history first
setopt hist_no_store          # don't save 'history' cmd in history
setopt inc_append_history     # append history as command are entered
setopt list_rows_first        # completion options left-to-right, top-to-bottom
setopt list_types             # show file types in list
setopt mark_dirs              # adds slash to end of completed dirs
setopt numeric_glob_sort      # sort numerically first, before alpha
setopt prompt_subst           # sub values in prompt (though it seems to work anyway haha)
#setopt rm_star_wait           # pause before confirming rm *
setopt share_history          # share history between open shells
setopt pushdminus pushdsilent pushdtohome
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt noclobber
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt sh_word_split
setopt nohup
setopt all_export
setopt chase_dots
setopt chase_links
setopt complete_aliases
setopt complete_in_word
setopt equals
setopt hash_dirs
setopt hash_list_all

compctl -/ cd

# User configurations.

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
unsetopt beep
bindkey -e  # Emacs key bindings.

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
# Silence the cpan.
export PERL_MM_USE_DEFAULT=1
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

export PYTHONDIRS=$(/usr/bin/env python -c 'import sys; sys.stdout.write(",".join(sys.path))')
PYTHONDIRS=$(echo $PYTHONDIRS | sed -e 's;\\;/;g')

export GOROOT=~/Downloads/sw/go
export GOOS=linux
export GOARCH=amd64

export PATH=$HOME/bin:$HOME/scala/bin:$HOME/Downloads/sw/android-sdk-linux_x86/tools:$HOME/projects/clojurescript/bin:$GOROOT/bin:$PATH

HOSTNAME="`hostname`"
REPORTTIME=120 # print elapsed time when more than 10 seconds

export PAGER='less'
export SHELL="/bin/zsh"

# format titles for screen and rxvt
function title() {
    # escape '%' chars in $1, make nonprintables visible
    a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
    screen*)
        print -Pn "\ek$a:$3 $2\e\\"      # screen title (in ^A")
        ;;
    esac
    print -Pn "\e]0;$2 | $a:$3\a" # plain xterm title
}

# precmd is called just before the prompt is printed
function precmd() {
    if [ -z "${ST}" ]; then 
        title "zsh" "%n@%m" "%55<...<%~"
    else
        title "$ST" "%n@%m" "%55<...<%~"
    fi 
}

# preexec is called just before any command line is executed
function preexec() {
    if [ -z "${ST}" ]; then 
        title "$1" "%n@%m" "%55<...<%~"
    else
        title "$ST" "%n@%m" "%55<...<%~"
    fi 
}

function git_info () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# PS1 and PS2
function prompt_char {
    git branch >/dev/null 2>/dev/null && print '±' && return
    hg root >/dev/null 2>/dev/null && print "☿($(hg branch))" && return
    print 'o'
}
export PS1="$(print '%{\e[0;36m%}%n@%m%{\e[0m%}'): $(print '%{\e[0;34m%}%~%{\e[0m%}') \$(git_info)
\$(prompt_char) $ "
export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

function ni() { ST="${1}"; }
function nr() { unset ST; }

zle -N edit-command-line
bindkey '^Xe' edit-command-line

alias clj="rlwrap -r java clojure.main"
alias x=exit

tmux-to-clipboard() {
    tmux show-buffer | xclip -sel clip
    tmux show-buffer | xclip -sel primary
}
zle -N tmux-to-clipboard
bindkey "^y" tmux-to-clipboard

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
#RPROMPT="\$(bat)"

alias urxvt="urxvt  -sr -g '80x30' -fn 'xft:DejaVu Sans Mono-12:dpi=75'"
alias xterm="xterm -g '80x30' -fa 'xft:DejaVu Sans Mono-12:dpi=75'"
alias run_gae='python2.5 ~/google_appengine/dev_appserver.py'
alias nodei="NODE_NO_READLINE=1 rlwrap node"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

ssh-reagent () {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        if ssh-add -l 2>&1 > /dev/null; then
            echo Found working SSH Agent:
            ssh-add -l
            return
        fi
    done
    echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

CLOJURESCRIPT_HOME='/home/rahul/projects/clojurescript'

alias vi=/usr/bin/vim

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
export GOPATH=$HOME/musings/go

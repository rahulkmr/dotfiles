fpath+=~/.zfunc
autoload -Uz compinit
compinit
zmodload -i zsh/complist


zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
# eval "$(dircolors -b)"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' original true
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle :compinstall filename '/home/rahul/.zshrc'




HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt append_history
setopt inc_append_history
setopt share_history          # share history between open shells
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first # expire duped history first
# setopt hist_ignore_space
setopt hist_reduce_blanks

bindkey -e
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

setopt no_beep
setopt auto_cd
setopt cd_able_vars
setopt extended_glob
setopt correct no_correct_all
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
alias ls='ls -G'

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
alias antlr='java -jar ~/data/sw/antlr-4.7-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'


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
    screen*|tmux*)
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
export PS2="$(print '%{\e[0;36m%}%_> %{\e[0m%}')"

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


# source /usr/local/bin/virtualenvwrapper.sh


eval "$(pyenv init -)"
eval "$(pipenv --completion)"
eval "$(rbenv init -)"

# pyenv virtualenvwrapper
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL && $TERM != 'eterm-color' ]] && source $BASE16_SHELL

# source ~/.shell_prompt.sh
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

stty -ixon -ixoff

[ -s "/home/rahul/.dnx/dnvm/dnvm.sh" ] && . "/home/rahul/.dnx/dnvm/dnvm.sh" # Load dnvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/home/rahul/.sdkman"
#[[ -s "/home/rahul/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rahul/.sdkman/bin/sdkman-init.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh


# opam configuration
test -r /Users/rahul/.opam/opam-init/init.zsh && . /Users/rahul/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rahul/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rahul/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rahul/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rahul/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rahul/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

_dotnet_zsh_complete() 
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
if [ /Users/rahul/Downloads/google-cloud-sdk/bin/kubectl ]; then source <(kubectl completion zsh); fi

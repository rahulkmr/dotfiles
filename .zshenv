export EDITOR=vim

export PYTHONDIRS=$(/usr/bin/env python -c 'import sys; sys.stdout.write(",".join(sys.path))')
PYTHONDIRS=$(echo $PYTHONDIRS | sed -e 's;\\;/;g')

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH

export GOROOT=/data/sw/go
export GOPATH=$HOME/musings/go

export WORKON_HOME=~/venvs

export PIP_DOWNLOAD_CACHE=$HOME/.pip-download-cache

#export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export RUST_SRC_PATH=/data/sw/rust/src

export PERL_MB_OPT="--install_base \"/home/rahul/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/rahul/perl5"

export PYENV_ROOT="$HOME/.pyenv"

export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTS="--extended-exact --cycle"

export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments

export PAGER='less'

typeset -U path
path=($HOME/.rvm/bin
$HOME/bin
$GOROOT/bin
$GOPATH/bin
$PYENV_ROOT/bin
/data/sw/nim-0.13.0/bin
~/.nimble/bin
/usr/local/heroku/bin
~/data/sw/swift/bin
~/data/sw/node-v5.7.0-linux-x64/bin
$path)

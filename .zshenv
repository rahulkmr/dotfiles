export EDITOR=vim
export VISUAL=vim

export PYTHONDIRS=$(/usr/bin/env python -c 'import sys; sys.stdout.write(",".join(sys.path))')
PYTHONDIRS=$(echo $PYTHONDIRS | sed -e 's;\\;/;g')

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
# export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export GOPATH=$HOME/go

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

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PAGER='less'
export DOTNET_CLI_TELEMETRY_OPTOUT=1

antlr_path=".:/data/sw/antlr-4.7-complete.jar"
if [ -z "$CLASSPATH" ]; then
    export CLASSPATH="${antlr_path}"
else
    export CLASSPATH="${antlr_path}:$CLASSPATH"
fi

typeset -U path
path=(
$HOME/bin
$HOME/.cargo/bin
$GOPATH/bin
/opt/metasploit-framework/bin
/usr/local/opt/openssl/bin
$path
)

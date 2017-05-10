set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf-8
set undodir=~/.vim/tmp//,/var/tmp//,/tmp//,.
set backupdir=~/.vim/tmp//,/var/tmp//,/tmp//,.
set directory=~/.vim/tmp//,/var/tmp//,/tmp//,.
" set backup
set complete=.,w,b,u,U,t,i,d,k
set completeopt=longest,menuone,preview
set showmode
set gdefault
set virtualedit+=block
set fileformats=unix,mac,dos
set ttyfast
set modeline
set foldmethod=manual
set showcmd
set cmdheight=2
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1

"set statusline+=%4*%{fugitive#statusline()}%*
"set statusline+=%3*\ [%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding}, " encoding
"set statusline+=%{&fileformat}]%* " file format
"set statusline+=%1*\ %f\ %* "path to the file in the buffer, relative to current directory
"set statusline+=%5*\ Line:%l/%L
"set statusline+=\ Column:%c/%v\ 
"set statusline+=\ %h%1*%m%r%w%q%* " flag
"set statusline+=%6*%=%*
"set statusline+=%2*\ Buffer:%n
"set statusline+=\ Character:%b/%B
set laststatus=2
" set UTF-8 encoding
set notitle
set viminfo='50,\"1000,:100,n~/.vim/viminfo
" disable vi compatibility (emulation of old bugs)
set clipboard^=unnamedplus
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set softtabstop=4
set expandtab        " expand tabs to spaces
set smarttab
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set textwidth=0
set wrap
" Incremental search.
set incsearch
set hlsearch
set syntax=auto
set cursorline
set cursorcolumn
"Show menu with possible tab completions
set wildmenu
set wildcharm=<C-z>
""Ignore these files when completing names and in Explorer
set wildignore+=.svn,CVS,.git,*.o,*.a,*.*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.so.*
set wildmode=list:longest
" turn line numbers on
set relativenumber
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Ruler.
set ruler<
" Set backspace
set backspace=eol,start,indent
" Set magic on
set magic
" No sound on errors
set noerrorbells
set novisualbell

"Enable folding, I find it very useful
set foldenable
set foldlevel=0

set shiftround
set nojoinspaces

if &diff
    "I'm only interested in diff colours
    syntax off
endif
"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1


runtime! ftplugin/man.vim

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let mapleader = ","
let maplocalleader = ","
call plug#begin('~/.vim/bundle')
Plug 'Rip-Rip/clang_complete'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'ternjs/tern_for_vim'
Plug 'guns/vim-sexp'
Plug 'mattn/emmet-vim'
Plug 'rking/ag.vim'
Plug 'zah/nim.vim'
Plug 'chriskempson/base16-vim'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'vim-scripts/gtags.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'bling/vim-airline'
"Plug 'nosami/Omnisharp'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-scriptease'
Plug 'davidhalter/jedi-vim'
Plug 'derekwyatt/vim-scala'
"Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-bundler'
Plug 'Wolfy87/vim-enmasse'
Plug 'tkztmk/vim-vala'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-cucumber'
Plug 'mileszs/ack.vim'
Plug 'Townk/vim-autoclose'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/emacsmode'
"Plug 'kongo2002/fsharp-vim'
Plug 'sjl/gundo.vim'
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/Recover.vim'
"Plug 'klen/rope-vim'
Plug 'slim-template/vim-slim'
Plug 'guns/vim-clojure-static'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go'
Plug 'tpope/vim-haml'
Plug 'groenewege/vim-less'
Plug 'wlangstroth/vim-racket'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jpalardy/vim-slime'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'hewes/unite-gtags'
Plug 'talek/vorax4'
Plug 'lucapette/vim-ruby-doc'
Plug 'danchoi/ri.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'phildawes/racer'
Plug 'wting/rust.vim'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'JuliaLang/julia-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'plasticboy/vim-markdown'
Plug 'thoughtbot/vim-rspec'
Plug 'ensime/ensime-vim'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
"Plug 'tpope/vim-classpath'
"Plug 'ivanov/vim-ipython'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-devicons'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tweekmonster/django-plus.vim'
Plug 'mjbrownie/vim-htmldjango_omnicomplete'
Plug 'mhinz/vim-grepper'
Plug 'skywind3000/asyncrun.vim'
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
Plug 'mitsuhiko/vim-jinja'

call plug#end()

if has('gui_running')
    set background=dark
    colorscheme base16-default-dark
else
    " set background=dark
    " colorscheme Tomorrow-Night
    let g:base16colorspace=256
    set background=dark
    colorscheme base16-default-dark
    " colorscheme solarized
endif
"
let g:airline#extensions#tabline#enabled = 1

let g:slime_target = 'tmux'

" set omnifunc=syntaxcomplete#Complete
filetype on
filetype plugin on
filetype indent on

set smartindent
set autoindent
set pastetoggle=<F6>
set scrolljump=10
set hidden
set whichwrap=b,s,h,l,<,>,~,[,]
set nolazyredraw
set nostartofline
set report=0
set sidescrolloff=10
""set formatoptions=rq
set formatoptions=qrn1
syntax enable
set copyindent
set history=10000
set undofile
set undolevels=100
set undoreload=100
let g:html_use_css=1
set linebreak
let g:coffee_no_trailing_space_error = 1
set guioptions-=m
set guioptions-=T

"let g:netrw_chgwin = 2
let g:netrw_liststyle = 3
let g:netrw_browsex_viewer='gnome-open'
"let g:netrw_menu = 0
"let g:netrw_banner = 0
"let g:netrw_altv = 1
"let g:netrw_hide = 0
"let g:netrw_browse_split = 4
"let g:netrw_preview=1
"let g:netrw_ctags="etags"
"let g:netrw_winsize=20
"let g:netrw_cursor=0
fun! s:layout_netrw_split()
  execute "normal! \<C-W>o"
  :20Vex .
endfunction

"command! Lexplore :call s:layout_netrw_split()

fun! s:section(char)
  let l:length = strlen(getline('.'))
  execute "normal k" . length . "i" . a:char
  execute "normal jj" . length . "i" . a:char
endfun
command -nargs=1 K :call s:section(<q-args>)

function! UnhighlightMerlinIfDefined()
  if exists(":MerlinClearEnclosing")
    execute "MerlinClearEnclosing"
  endif
endfunction

augroup global
    au!
    au VimResized * exe "normal! \<c-w>="
    autocmd BufNewFile,BufRead *.slim set filetype=slim
    autocmd BufNewFile,BufRead *.jinja2 set filetype=htmljinja
    autocmd BufNewFile,BufRead *.js.erb set filetype=eruby.javascript
    autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html
    autocmd BufNewFile,BufRead *.coffee.erb set filetype=eruby.coffee
    " au BufNewFile,BufRead * call PareditInitBuffer()
    " let g:paredit_leader = '\'
    autocmd FileType racket nnoremap<buffer> <Space>x :w<CR>:!/usr/bin/env racket %
    autocmd FileType *.cljs set ft=clojure
    au BufRead,BufNewFile *.less set ft=less syntax=less
    au BufNewFile,BufRead *.go set ft=go
    autocmd BufReadPost fugitive://* set bufhidden=delete

    " normal mode mappings
    " ctags
    nnoremap <Space>c :Dispatch ctags --exclude=log --exclude=.git  -R .<CR>
    nnoremap <Space>rc :Dispatch ctags -f gemtags --exclude=.git --exclude=log -R `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR>

    " search and center the search result.
    nnoremap <silent> n nzz
    nnoremap <silent> N Nzz
    nnoremap <silent> * *zz
    nnoremap <silent> # #zz
    nnoremap <silent> g* g*zz
    nnoremap <silent> g# g#zz

    " misc mappings
    nnoremap <Space>m :w<CR>:make<CR>
    nnoremap <Space>i :cclose<CR>:pclose<CR>:lclose<CR>
    " nnoremap ,m :TOhtml<CR>
    nnoremap <Space>w :%s/\s\+$//<cr>:let @/=''<CR>
    nnoremap <Space>a :reg [0123456789"]<CR>
    nnoremap <C-l> :nohl<cr>:call UnhighlightMerlinIfDefined()<cr><c-l>
    nnoremap <C-x>u :update<cr>
    nnoremap <C-x>l :wa<cr>
    nnoremap <C-x>x :q<cr>
    nnoremap <C-x>d :q!<cr>
    nnoremap <C-x>t :qa!<cr>

    " smart regex
    nnoremap / /\v
    vnoremap / /\v
    nnoremap ? ?\v
    vnoremap ? ?\v

    " set filetypes
    nnoremap <Space>dj :set filetype=django<CR>
    nnoremap <Space>jj :set filetype=jinja<CR>
    nnoremap <Space>hd :set filetype=htmldjango<CR>
    nnoremap <Space>hj :set filetype=htmljinja<CR>

    " windows splits
    " nnoremap \v <C-w>v<C-w>l
    " nnoremap \s <C-w>s<C-w>j

    " window navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <c-w><c-k> :bd!<cr>

    " source .vimrc/load it
    nnoremap <Space>v :e ~/.vimrc<CR>
    nnoremap <Space>V :so ~/.vimrc<CR>

    " template shortcuts
    nnoremap <C-x>1 Ea %><Esc>BBi<% <Esc>
    nnoremap <C-x>2 Ea %><Esc>BBi<%= <Esc>
    nnoremap <C-x>3 Ea %}<Esc>BBi{% <Esc>
    nnoremap <C-x>4 Ea }}<Esc>BBi{{ <Esc>

    " plugin mappings
    nnoremap <Space>g :GundoToggle<CR>
    nnoremap <c-w>r :NERDTreeFind<CR><c-w><c-w>
    " nnoremap <c-y> :CtrlPCurWD<CR>
    " nnoremap <c-u> :CtrlPBuffer<CR>
    nnoremap <c-x>v :!gnome-open %<cr>
    nnoremap <Space>f :RecoverPluginFinish<CR>
    nnoremap <c-w>t :NERDTreeToggle<CR>
    nnoremap <Leader>e :Explore<CR>
    "nnoremap \t :Ve<CR><CR>
    nnoremap <Space>l :TagbarToggle<CR>
    nnoremap do :diffget<cr>

    " insert mode mappings
    " autocomplete
    inoremap <Nul> <C-x><C-o>
    " autoclose html tags
    inoremap <C-x>; </<C-x><C-o>
    " convenience mapping for insert mode.
    inoremap <C-x>1 <%<Space><Space>%><Esc>2hi
    inoremap <C-x>2 <%=<Space><Space>%><Esc>2hi
    inoremap <C-x>3 {%<Space><Space>%}<Esc>2hi
    inoremap <C-x>4 {{<Space><Space>}}<Esc>2hi

    "inoremap <C-w> <C-g>u<C-w>
    "inoremap <C-u> <C-g>u<C-u>
    inoremap <Leader>q <C-o>O
    inoremap  u03bb
    inoremap <C-x>u <c-o>:update<cr>
    inoremap <C-x>w <esc>:wq<cr>
    inoremap <C-x>l <esc>:wa<cr>
    inoremap <C-x>x <esc>:q<cr>
    inoremap <C-x>d <esc>:q!<cr>
    inoremap <C-x>t <esc>:qa!<cr>
    inoremap <C-x>c <esc>bgUWea


    " command mode mappings
    " sudo write this
    cnoremap W! w !sudo tee % >/dev/null


    " visual mode mapping
    vnoremap . :normal! .<CR>
    vnoremap @@ :normal! @@<CR>


    " readline style binding
    inoremap        <C-A> <C-O>^
    inoremap   <C-X><C-A> <C-A>
    cnoremap        <C-A> <Home>
    cnoremap   <C-X><C-A> <C-A>

    inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
    cnoremap        <C-B> <Left>

    inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"
    cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"

    inoremap <expr> <C-E> col('.')>strlen(getline('.'))?"\<Lt>C-E>":"\<Lt>End>"

    inoremap <expr> <C-F> col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"
    cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
    noremap! <expr> <SID>transposition getcmdpos()>strlen(getcmdline())?"\<Left>":getcmdpos()>1?'':"\<Right>"
    noremap! <expr> <SID>transpose "\<BS>\<Right>".matchstr(getcmdline()[0 : getcmdpos()-2], '.$')
    cmap   <script> <C-T> <SID>transposition<SID>transpose

    noremap!        <M-b> <S-Left>
    noremap!        <M-d> <C-O>dw
    cnoremap        <M-d> <S-Right><C-W>
    noremap!        <M-BS> <C-W>
    noremap!        <M-f> <S-Right>
    noremap!        <M-n> <Down>
    noremap!        <M-p> <Up>

    nnoremap <c-w>e :SyntasticCheck<cr>
    nnoremap <Space>e :Errors<cr>

    let g:indentLine_enabled = 0
    nnoremap <Leader>ig :IndentLinesToggle<cr>
augroup end

set noautochdir


augroup chicken
    au!
    let g:is_chicken=1
    " au BufNewFile,BufRead *.ss call PareditInitBuffer()
    autocmd FileType scheme nnoremap<buffer> <Space>x :w<CR>:!/usr/bin/env csi -s %
    au FileType scheme setlocal makeprg=csc\ -check-syntax\ %:p
    au FileType scheme setl dictionary+=~/.vim/scheme-word-list
    au FileType scheme setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
    au FileType scheme setl includeexpr=substitute(v:fname,'$','.scm','')
    au FileType scheme setl path+=/usr/local/lib/chicken/3
    au FileType scheme setl suffixesadd=.scm
    au FileType scheme setl lispwords+=let-values,condition-case,with-input-from-string
    au FileType scheme setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
    au FileType scheme setl lispwords+=call-with-output-file
augroup end


augroup python
    au!
    autocmd FileType python nnoremap<buffer> <Space>x :w<CR>:!/usr/bin/env python %
    autocmd FileType python setlocal nosmartindent
    autocmd FileType python setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
    autocmd FileType python setlocal errorformat=%f:%l:\ %m
    autocmd BufRead python setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd FileType python setlocal path+=$PYTHONDIRS
    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#popup_select_first = 0
    "autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;py_compile.compile(r'%')\"
    if has('python3')
      autocmd FileType python setlocal omnifunc=python3complete#Complete
    end
augroup end


augroup go
    au!
    autocmd FileType go setlocal noexpandtab
    autocmd FileType go setlocal makeprg=go\ build\ %
    autocmd FileType go nnoremap<buffer> <Space>x :w<CR>:!go run %
    autocmd FileType go nnoremap<buffer> <Space>o :w<CR>:!go fmt %<cr>
    autocmd FileType go nnoremap<buffer> <Space>i :w<CR>:!go install
    autocmd FileType go nnoremap<buffer> <Space>e :w<CR>:!go clean<cr>
augroup end


augroup perl
    au!
    autocmd FileType perl nnoremap<buffer>  <Space>x :w<CR>:!/usr/bin/env perl %
    autocmd FileType perl setlocal path+=$PERLDIRS
    autocmd FileType perl setlocal makeprg=/usr/bin/env\ perl\ -c\ %
augroup end


augroup c
    au!
    "autocmd FileType c setlocal makeprg=clang\ -fsyntax-only\ %
    " autocmd FileType c setlocal makeprg=clang\ -g\ -c\ %
    " autocmd FileType cpp setlocal makeprg=clang\ -g\ -I/usr/local/include/SDL2\ -c\ %
    autocmd FileType c,cpp nnoremap<buffer> <Space>x :!./%
augroup end



" For full syntax highlighting:
let python_highlight_all=1
"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
    "if os.path.isdir(p):
        "vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF

augroup fsharp
    au!
    autocmd FileType fsharp set autoindent
    autocmd FileType fsharp set smartindent
    " configure tabwidth and insert spaces instead of tabs
    autocmd FileType fsharp set tabstop=4        " tab width is 4 spaces
    autocmd FileType fsharp set shiftwidth=4     " indent also with 4 spaces
    autocmd FileType fsharp set softtabstop=4
    autocmd FileType fsharp set expandtab        " expand tabs to spaces
    "autocmd FileType fsharp setlocal makeprg=fsc_sh\ %
    "autocmd FileType fsharp nnoremap<buffer> <Space>m :w<CR>:make<CR>
    "autocmd FileType fsharp nnoremap<buffer> <Space>x :!./%.exe
augroup end

let g:ragtag_global_maps = 1


let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1
augroup ruby
    au!
    autocmd FileType ruby nnoremap<buffer>  <Space>x :w<CR>:!ruby %
    " autocmd FileType ruby setlocal makeprg=ruby\ -c\ %
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2
    set tags+=gemtags
augroup end

augroup java
    au!
    " Mappings for eclim.
     autocmd FileType java nnoremap<buffer> <Space>jg :JavaGet<CR>
     autocmd FileType java nnoremap<buffer> <Space>js :JavaSet<CR>
     autocmd FileType java nnoremap<buffer> <Space>ja :JavaGetSet<CR>
     autocmd FileType java nnoremap<buffer> <Space>jc :JavaConstructor<CR>
     autocmd FileType java nnoremap<buffer> <Space>jh :JavaHierarchy<CR>
     autocmd FileType java nnoremap<buffer> <Space>jl :JavaImpl<CR>
     autocmd FileType java nnoremap<buffer> <Space>jd :JavaDelegate<CR>
     autocmd FileType java nnoremap<buffer> <Space>ji :JavaImport<CR>
     autocmd FileType java nnoremap<buffer> <Space>jm :w<CR>:JavaImportMissing<CR>:w<CR>
     autocmd FileType java nnoremap<buffer> <Space>jj :JavaSearchContext<CR>
     autocmd FileType java nnoremap<buffer> <Space>jx :Java %<CR>
     autocmd FileType java nnoremap<buffer> <Space>jo :w<CR>:Javac<CR>
     autocmd FileType java nnoremap<buffer> <Space>jv :w<CR>:Validate<CR>
     autocmd FileType java nnoremap<buffer> <Space>jt :JavaCorrect<CR>
     autocmd FileType java nnoremap<buffer> <Space>jr :JavaRename
     autocmd FileType java nnoremap<buffer> <Space>jw :JavaDocComment<CR>
     autocmd FileType java nnoremap<buffer> <Space>jf :w<CR>:%JavaFormat<CR>

    "autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    "autocmd FileType java nnoremap<buffer> <Space>jm :JCimportsAddMissing<cr>
    "autocmd FileType java nnoremap<buffer> <Space>ji :JCimportAddI<cr>
    "autocmd FileType java setlocal makeprg=mvn\ package
    "autocmd FileType java setlocal errorformat=\[ERROR]\ %f:[%l\\,%v]\ %m 
augroup end

let g:EclimCompletionMethod = 'omnifunc'
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java =
    \ '\%(\h\w*\|)\)\.\w*'

let g:clang_complete_auto = 1
let g:clang_snippets = 1

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

nnoremap <Space>g :set operatorfunc=CalcOperator<cr>g@
vnoremap <Space>g :<c-u>call CalcOperator(visualmode())<cr>

function! CalcOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'V'
        normal! `<V`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    let result = string(eval(substitute(@@, '\n', ' ', 'g')))
    if a:type ==# 'v'
        execute "normal! `<v`>c" . result
    elseif a:type ==# 'V'
        execute "normal! `<V`>c" . result
    elseif a:type ==# 'char'
        execute "normal! `[v`]c" . result
    endif
    let @@ = saved_unnamed_register
endfunction


let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
    au!
    au BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
augroup END


let NERDTreeHijackNetrw=0
let NERDTreeShowHidden=1


function! ChangeBuffer()
  if &modifiable && !&diff && stridx(expand("%:t"), ".") != 0 &&
        \ strlen(expand('%')) > 0 && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
    let win_num = winnr()
    NERDTreeFind
    exe win_num . "wincmd w"
  endif
endfunction
let g:BufExplorerFuncRef = function('ChangeBuffer')
"autocmd BufEnter * call ChangeBuffer()


augroup PreviewWin
    au!
    autocmd! CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd! InsertLeave * if pumvisible() == 0|pclose|endif
augroup end


function! RefreshAll()
    set noconfirm
    bufdo e!
    bufdo syntax on
    set confirm
endfunction


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_extensions = ['tag']
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --vimgrep
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" let g:ctrlp_user_command = {
"     \ 'types': {
"         \ 1: ['.git', 'cd %s && git ls-files'],
"         \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"         \ },
"     \ 'fallback': 'find %s -type f'
"     \ }

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

if executable('ocamlmerlin') && has('python')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
endif

autocmd FileType ocaml source /home/rahul/.opam/4.01.0/share/vim/syntax/ocp-indent.vim

let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["java"] }

let g:syntastic_javascript_checkers = ['eslint']

let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'],
      \ }

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
command! -nargs=1 -complete=command -bang Qdo exe 'args '.QuickfixFilenames() | argdo<bang> <args>
function! QuickfixFilenames()
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

let g:rails_projections = {
            \ "app/presenters/*_presenter.rb": {
            \   "command": "presenter",
            \   "related": "app/helpers/%s_helper.rb"
            \ },
            \ "app/processors/*_processor.rb": {
            \   "command": "processor",
            \ }}

command! -bar -range Eval let b:file_name = '/tmp/temp_source_file_for_vim_eval.vim' |
            \ exe "silent" <line1> "," <line2> "w" b:file_name |
            \ exe "source" b:file_name |
            \ call delete(b:file_name) |
            \ unlet b:file_name

" nnoremap <Space>s :grep <cword> %<CR>

nnoremap <silent> <Space>n :set opfunc=<SID>AgMotion<CR>g@
xnoremap <silent> <Space>n :<C-U>call <SID>AgMotion(visualmode())<CR>

nnoremap <silent> <Space>s :set opfunc=<SID>AgMotionCurrentBuffer<CR>g@
xnoremap <silent> <Space>s :<C-U>call <SID>AgMotionCurrentBuffer(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AgMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ag " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

function! s:AgMotionCurrentBuffer(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :grep"  @@  "%\<cr>"
    execute "copen"
    execute "redraw!"

    let @@ = reg_save
endfunction


" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 2
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction
"
"
"
" " Python jedi settings.
" if !exists('g:neocomplcache_omni_functions')
"     let g:neocomplcache_omni_functions = {}
" endif
" let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
" let g:jedi#popup_on_dot = 0
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
"

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 0
" Set minimum syntax keyword length.
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
" if !exists('g:neocomplcache_force_omni_patterns')
"    let g:neocomplcache_force_omni_patterns = {}
"  endif
"  let g:neocomplcache_force_omni_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
augroup ocaml
  au!
  autocmd Filetype ocaml nmap <buffer> <LocalLeader>mr  :MerlinRename
  autocmd Filetype ocaml nmap <buffer> <LocalLeader>mR  :MerlinRenameAppend
  autocmd Filetype ocaml nmap <buffer> <LocalLeader>ml  :MerlinLocate<cr>
  autocmd Filetype ocaml nmap <buffer> <LocalLeader>mu  :MerlinOutline<cr>
  autocmd Filetype ocaml nmap <buffer> <LocalLeader>md  :MerlinDestruct<cr>
  autocmd Filetype ocaml nmap <buffer> <LocalLeader>>  :MerlinGrowEnclosing<cr>
  autocmd Filetype ocaml nmap <buffer> <LocalLeader><  :MerlinShrinkEnclosing<cr>
augroup end

let g:jedi#completions_enabled=0

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'win'  : ['#I', '#T'],
"       \'cwin' : ['#I', '#T']}
" let g:promptline_preset = {
"             \'a' : [ promptline#slices#host(), promptline#slices#user() ],
"             \'b' : [ promptline#slices#cwd() ],
"             \'c' : [ promptline#slices#vcs_branch() ],
"             \'y' : [ promptline#slices#python_virtualenv() ],
"             \'warn' : [ promptline#slices#last_exit_code() ]}

let g:racer_cmd = "/data/sw/racer/target/release/racer"
let $RUST_SRC_PATH = "/data/sw/rust/src""

nnoremap <silent> <Space>u :FZF<cr>
command! -nargs=1 Locate call fzf#run(
      \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

command! FZFBuf call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })
nnoremap <silent> <Space>b :FZFBuf<cr>


" command! -bar FZFTags call fzf#run({
" \   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
" \   'sink':   'tag',
" \ })
" nnoremap <Space>t :FZFTags<cr>


let s:tagquery = ''

function! s:taglist(query)
  redir => message
  silent execute "ts /" . a:query
  redir END
  let repeated_numbers = substitute(message, '\v\s+(\d+)\s+', '\1: \1 ', 'g')
  let result = split(repeated_numbers, '\v\d+:\s')
  let s:tagquery = a:query
  return result
endfunction


function! s:tagopen(selection)
  let tag_number = matchstr(a:selection, '\v^\d+')
  execute tag_number. "tag /" . s:tagquery
endfunction

function! s:tag_open(selection)
  let parts = split(a:selection, '\t')
  execute "edit"  parts[1]
  execute substitute(parts[2], ';"$', '', 'g')
endfunction

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

command! -nargs=? -bar FZFTag call fzf#run({
\   'source': "awk -F'\t' '($0 \!~ /^\!/) && $1 ~ /<args>/{print}' " . join(map(tagfiles(), 'fnamemodify(v:val, ":S")')),
\   'sink': function('<sid>tags_sink'),
\ })
nnoremap <Space>t :FZFTag


function! s:tags()
  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
command! FZFTagFile call fzf#run({
\   'source': "cat " . tagfiles()[0] . ' | grep "' . expand('%:@') . '"' . " | sed -e '/^\\!/d;s/\t.*//' ". ' |  uniq',
\   'sink':   'tag',
\   'options':  '+m',
\   'left':     60,
\ })

function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
nnoremap <silent> <Space>k :BTags<cr>

" reverse-i-search
function! s:get_history()
    redir => history
    silent! history
    redir END
  return map(split(history, '\n'), "strpart(v:val, 9)")
endfunction

function! s:run_ex_cmd(cmd)
    execute a:cmd
endfunction

command! FZFCmds call fzf#run({
    \   'source':   <sid>get_history(),
    \   'sink':     function('<sid>run_ex_cmd'),
    \   'options':  '-x --tac +s',
    \   'down':     '40%'})
nnoremap <silent> <Space>: :FZFCmds<cr>

function! s:get_search_history()
    redir => history
    silent! history/
    redir END
  return map(split(history, '\n'), "strpart(v:val, 9)")
endfunction

function! s:run_search_cmd(cmd)
    execute '/' . a:cmd
endfunction

command! FZFSearchCmds call fzf#run({
    \   'source':   <sid>get_search_history(),
    \   'sink':     function('<sid>run_search_cmd'),
    \   'options':  '-x --tac +s',
    \   'down':     '40%'})
nnoremap <silent> <Space>/ :FZFSearchCmds<cr>


function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})
function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let [key, line] = a:lines[0:1]
  let [file, line, col] = split(line, ':')[0:2]
  let cmd = get({'ctrl-x': 'split', 'ctrl-v': 'vertical split', 'ctrl-t': 'tabe'}, key, 'e')
  execute cmd escape(file, ' %#\')
  execute line
  execute 'normal!' col.'|zz'
endfunction

command! -nargs=1 FZFAg call fzf#run({
\ 'source':  'ag --nogroup --column --color "'. escape(<q-args>, '"\') .'"',
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --no-multi',
\ 'down':    '50%'
\ })
nnoremap <Space>a  :FZFAg
cnoremap <silent> <c-l> <c-\>eGetCompletions()<cr>
"add an extra <cr> at the end of this line to automatically accept the fzf-selected completions.

function! Lister()
    call extend(g:FZF_Cmd_Completion_Pre_List,split(getcmdline(),'\(\\\zs\)\@<!\& '))
endfunction

function! CmdLineDirComplete(prefix, options, rawdir)
    let l:dirprefix = matchstr(a:rawdir,"^.*/")
    if isdirectory(expand(l:dirprefix))
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --select-1  --query=' .
                    \ a:rawdir[matchend(a:rawdir,"^.*/"):len(a:rawdir)],
                    \'dir': expand(l:dirprefix)
                    \}),
                    \'"' . escape(l:dirprefix, " ") . '" . escape(v:val, " ")'))
    else
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --query='. a:rawdir }),
                    \'escape(v:val, " ")'))
        "dropped --select-1 to speed things up on a long query
    endif
endfunction

function! GetCompletions()
    let g:FZF_Cmd_Completion_Pre_List = []
    let l:cmdline_list = split(getcmdline(), '\(\\\zs\)\@<!\& ', 1)
    let l:Prefix = l:cmdline_list[0:-2]
    execute "silent normal! :" . getcmdline() . "\<c-a>\<c-\>eLister()\<cr>\<c-c>"
    let l:FZF_Cmd_Completion_List = g:FZF_Cmd_Completion_Pre_List[len(l:Prefix):-1]
    unlet g:FZF_Cmd_Completion_Pre_List
    if len(l:Prefix) > 0 && l:Prefix[0] =~
                \ '^ed\=i\=t\=$\|^spl\=i\=t\=$\|^tabed\=i\=t\=$\|^arged\=i\=t\=$\|^vsp\=l\=i\=t\=$'
                "single-argument file commands
        return CmdLineDirComplete(l:Prefix, "",l:cmdline_list[-1])
    elseif len(l:Prefix) > 0 && l:Prefix[0] =~
                \ '^arg\=s\=$\|^ne\=x\=t\=$\|^sne\=x\=t\=$\|^argad\=d\=$'
                "multi-argument file commands
        return CmdLineDirComplete(l:Prefix, '--multi', l:cmdline_list[-1])
    else
        return join(l:Prefix + fzf#run({
                    \'source':l:FZF_Cmd_Completion_List,
                    \'options': '--select-1 --query='.shellescape(l:cmdline_list[-1])
                    \}))
    endif
endfunction


let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_math=1

" RSpec.vim mappings
let g:rspec_command = "Dispatch rspec {spec}"
" nnoremap <Leader>n :call RunNearestSpec()<CR>
" nnoremap <Leader>a :call RunAllSpecs()<CR>
" nnoremap <Leader>c :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>

if has("cscope")
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    "elseif filereadable("GTAGS")
      "set cscopeprg=gtags-cscope
      "cs add GTAGS
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

nnoremap <unique> <Space>o :Unite outline<cr>

let g:NERDTReeIgnore = ['\.pyc$']
nnoremap <c-\> :GtagsCursor<cr>

let g:jsx_ext_required = 0

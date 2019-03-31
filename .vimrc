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


set laststatus=2
" set UTF-8 encoding
set notitle
set viminfo='50,\"1000,:100,n~/.vim/viminfo
" disable vi compatibility (emulation of old bugs)
set clipboard^=unnamed
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
"Ignore these files when completing names and in Explorer
set wildignore+=.svn,CVS,.git,*.o,*.a,*.*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.so.*,*.class,*.jar
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

autocmd BufNewFile,BufRead *.jinja2 set filetype=htmljinja | let b:dif_ftplugin = 1

let mapleader = ","
let maplocalleader = ","
call plug#begin('~/.vim/bundle')


Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'


Plug 'rking/ag.vim'
Plug 'vim-scripts/gtags.vim'
Plug 'mhinz/vim-grepper'
Plug 'ramele/agrep'
Plug 'honza/vim-snippets'

Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'lucapette/vim-ruby-doc'
Plug 'danchoi/ri.vim'
Plug 'thoughtbot/vim-rspec'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'

Plug 'hynek/vim-python-pep8-indent'
Plug 'mitsuhiko/vim-jinja'
Plug 'tweekmonster/django-plus.vim'
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'mxw/vim-jsx'
Plug 'Quramy/vim-js-pretty-template'
Plug 'udalov/kotlin-vim'
Plug 'cespare/vim-toml'


"Plug 'nosami/Omnisharp'
Plug 'slim-template/vim-slim'
Plug 'groenewege/vim-less'
Plug 'wlangstroth/vim-racket'
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
Plug 'leafo/moonscript-vim'


Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'Wolfy87/vim-enmasse'
Plug 'vim-scripts/emacsmode'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/matchit'
Plug 'chrisbra/Recover.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'jpalardy/vim-slime'
Plug 'talek/vorax4'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'plasticboy/vim-markdown'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

if has("termguicolors")     " set true colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
if has('gui_running')
    set background=dark
    colorscheme base16-default-dark
else
    let g:base16colorspace=256
    set background=dark
    colorscheme base16-default-dark
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
    "nnoremap / /\v
    "vnoremap / /\v
    "nnoremap ? ?\v
    "vnoremap ? ?\v

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
    "nnoremap <c-w>r :NERDTreeFind<CR><c-w><c-w>
    nnoremap <c-x>v :!gnome-open %<cr>
    nnoremap <Space>f :RecoverPluginFinish<CR>
    nnoremap <c-x>e :NERDTreeToggle<CR>
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

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
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
    autocmd FileType python setlocal path+=$PYTHONDIRS
    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#popup_select_first = 0
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


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --vimgrep
endif

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


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

let g:NERDTReeIgnore = ['\.pyc$']
nnoremap <c-\> :GtagsCursor<cr>

let g:jsx_ext_required = 0
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 159b980aec3076676c883415a3952e61 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/rahul/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line



" ## coc settings

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" if you want to disable auto detect, comment out those two lines
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" ## end of coc settings

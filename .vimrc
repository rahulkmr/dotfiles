set undodir=~/.vim/tmp//,/var/tmp//,/tmp//,.
set backupdir=~/.vim/tmp//,/var/tmp//,/tmp//,.
set directory=~/.vim/tmp//,/var/tmp//,/tmp//,.
set backup
set complete+=.,w,b,u,t,i,k
set showmode
set gdefault
set virtualedit+=block
set fileformats=unix,mac,dos
set ttyfast
set modeline
set fdm=manual
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
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set title
set viminfo='50,\"1000,:100,n~/vim/viminfo
" disable vi compatibility (emulation of old bugs)
set nocompatible
set clipboard=unnamedplus
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
""Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.so.*
set wildmode=list:longest
" turn line numbers on
set relativenumber
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" recreate tags file with F5
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
set fen
set fdl=0

set shiftround
set nojoinspaces

if &diff
    "I'm only interested in diff colours
    syntax off
endif
"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1


" call pathogen#infect()
call plug#begin('~/.vim/bundle')
Plug 'Rip-Rip/clang_complete'
Plug 'quanganhdo/grb256'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'altercation/vim-colors-solarized'
Plug 'twerth/ir_black'
Plug 'marijnh/tern_for_vim'
Plug 'Shougo/vimproc.vim'
Plug 'guns/vim-sexp'
Plug 'mattn/emmet-vim'
Plug 'rking/ag.vim'
Plug 'zah/nimrod.vim'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'vim-scripts/gtags.vim'
Plug 'tpope/vim-markdown'
Plug 'Lokaltog/vim-distinguished'
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'nosami/Omnisharp'
Plug 'jmcantrell/vim-virtualenv'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-scriptease'
Plug 'davidhalter/jedi-vim'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-bundler'
Plug 'Wolfy87/vim-enmasse'
Plug 'tkztmk/vim-vala'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'
" Plug 'tpope/vim-classpath'
Plug 'tpope/vim-cucumber'
Plug 'mileszs/ack.vim'
Plug 'Townk/vim-autoclose'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
" Plug 'cwood/vim-django'
Plug 'vim-scripts/emacsmode'
Plug 'kongo2002/fsharp-vim'
Plug 'sjl/gundo.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/Recover.vim'
Plug 'klen/rope-vim'
Plug 'slim-template/vim-slim'
Plug 'jlanzarotta/bufexplorer'
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
call plug#end()


if has("gui_running")
    set background=dark
    colorscheme base16-default
else
    set background=dark
    colorscheme Tomorrow-Night
    " let base16colorspace=256
    " set background=dark
    " colorscheme base16-default
endif
"
let g:airline#extensions#tabline#enabled = 1


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
set undolevels=10000
set undoreload=10000
let html_use_css=1
set lbr
let coffee_no_trailing_space_error = 1
set guioptions-=m
set guioptions-=T


augroup global
    au!
    au VimResized * exe "normal! \<c-w>="
    autocmd BufNewFile,BufRead *.slim set filetype=slim
    " au BufNewFile,BufRead * call PareditInitBuffer()
    " let g:paredit_leader = '\'
    autocmd FileType racket nnoremap<buffer> ,x :w<CR>:!/usr/bin/env racket %
    autocmd FileType *.cljs set ft=clojure
    au BufRead,BufNewFile *.less set ft=less syntax=less
    au BufNewFile,BufRead *.go set ft=go

    " normal mode mappings
    " ctags
    nnoremap \c :!ctags -R .<CR>
    nnoremap \rc :!ctags --extra=+f --exclude=.git --exclude=log -R . `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR>

    " search and center the search result.
    nnoremap <silent> n nzz
    nnoremap <silent> N Nzz
    nnoremap <silent> * *zz
    nnoremap <silent> # #zz
    nnoremap <silent> g* g*zz
    nnoremap <silent> g# g#zz

    " misc mappings
    nnoremap ,c :w<CR>:make<CR>
    nnoremap \i :cclose<CR>:pclose<CR>:lclose<CR>
    nnoremap ,m :TOhtml<CR>
    nnoremap ,w :%s/\s\+$//<cr>:let @/=''<CR>
    nnoremap ,a :reg [0123456789"]<CR>
    nnoremap <C-l> :nohl<cr><c-l>
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
    nnoremap ,dj :set filetype=django<CR>
    nnoremap ,jj :set filetype=jinja<CR>
    nnoremap ,hd :set filetype=htmldjango<CR>
    nnoremap ,hj :set filetype=htmljinja<CR>

    " windows splits
    " nnoremap \v <C-w>v<C-w>l
    " nnoremap \s <C-w>s<C-w>j

    " window navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k

    " source .vimrc/load it
    nnoremap ,v :e ~/.vimrc<CR>
    nnoremap ,V :so ~/.vimrc<CR>

    " template shortcuts
    nnoremap <C-x>1 Ea %><Esc>BBi<% <Esc>
    nnoremap <C-x>2 Ea %><Esc>BBi<%= <Esc>
    nnoremap <C-x>3 Ea %}<Esc>BBi{% <Esc>
    nnoremap <C-x>4 Ea }}<Esc>BBi{{ <Esc>

    " plugin mappings
    nnoremap ,g :GundoToggle<CR>
    nnoremap ,r :NERDTreeFind<CR><c-w><c-w>
    nnoremap <c-y> :CtrlPCurWD<CR>
    nnoremap <c-u> :CtrlPBuffer<CR>
    nnoremap <c-x>v :!gnome-open %<cr>
    nnoremap ,f :RecoverPluginFinish<CR>
    nnoremap ,t :NERDTreeToggle<CR>
    "nnoremap \t :Ve<CR><CR>
    nnoremap ,l :TagbarToggle<CR>
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
    inoremap \q <Esc>O
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
augroup end

set noautochdir


augroup chicken
    au!
    let g:is_chicken=1
    " au BufNewFile,BufRead *.ss call PareditInitBuffer()
    autocmd FileType scheme nnoremap<buffer> ,x :w<CR>:!/usr/bin/env csi -s %
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
    autocmd FileType python nnoremap<buffer> ,x :w<CR>:!/usr/bin/env python %
    autocmd FileType python setlocal nosmartindent
    autocmd FileType python setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
    autocmd FileType python setlocal errorformat=%f:%l:\ %m
    autocmd BufRead python setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd FileType python setlocal path+=$PYTHONDIRS
    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#popup_select_first = 0
    "autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;py_compile.compile(r'%')\"
augroup end


augroup go
    au!
    autocmd FileType go setlocal noexpandtab
    autocmd FileType go setlocal makeprg=go\ build\ %
    autocmd FileType go nnoremap<buffer> ,x :w<CR>:!go run %
    autocmd FileType go nnoremap<buffer> ,o :w<CR>:!go fmt %<cr>
    autocmd FileType go nnoremap<buffer> ,i :w<CR>:!go install
    autocmd FileType go nnoremap<buffer> ,e :w<CR>:!go clean<cr>
augroup end


augroup perl
    au!
    autocmd FileType perl nnoremap<buffer>  ,x :w<CR>:!/usr/bin/env perl %
    autocmd FileType perl setlocal path+=$PERLDIRS
    autocmd FileType perl setlocal makeprg=/usr/bin/env\ perl\ -c\ %
augroup end


augroup c
    au!
    "autocmd FileType c setlocal makeprg=clang\ -fsyntax-only\ %
    autocmd FileType c setlocal makeprg=clang\ -g\ -o\ %<\ %
    autocmd FileType cpp setlocal makeprg=g++\ -g\ -o\ %<\ %
    autocmd FileType c,cpp nnoremap<buffer> ,x :!./%
augroup end


"let g:netrw_menu = 0
"let g:netrw_banner = 0
"let g:netrw_altv = 1
"let g:netrw_hide = 0
" let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_preview=1
"let g:netrw_browsex_viewer="gnome-open"
"let g:netrw_ctags="etags"
"let g:netrw_winsize=20
"let g:netrw_cursor=0


" For full syntax highlighting:
let python_highlight_all=1
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

augroup fsharp
    au!
    autocmd FileType fsharp set autoindent
    autocmd FileType fsharp set smartindent
    " configure tabwidth and insert spaces instead of tabs
    autocmd FileType fsharp set tabstop=4        " tab width is 4 spaces
    autocmd FileType fsharp set shiftwidth=4     " indent also with 4 spaces
    autocmd FileType fsharp set softtabstop=4
    autocmd FileType fsharp set expandtab        " expand tabs to spaces
    autocmd FileType fsharp setlocal makeprg=fsc_sh\ %
    autocmd FileType fsharp nnoremap<buffer> ,c :w<CR>:make<CR>
    autocmd FileType fsharp nnoremap<buffer> ,x :!./%.exe
augroup end
let g:ragtag_global_maps = 1


let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1
augroup ruby
    au!
    autocmd FileType ruby nnoremap<buffer>  ,x :w<CR>:!ruby %
    " autocmd FileType ruby setlocal makeprg=ruby\ -c\ %
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2
augroup end


augroup java
    au!
    " Mappings for eclim.
    autocmd FileType java nnoremap<buffer> \jg :JavaGet<CR>
    autocmd FileType java nnoremap<buffer> \js :JavaSet<CR>
    autocmd FileType java nnoremap<buffer> \ja :JavaGetSet<CR>
    autocmd FileType java nnoremap<buffer> \jc :JavaConstructor<CR>
    autocmd FileType java nnoremap<buffer> \jh :JavaHierarchy<CR>
    autocmd FileType java nnoremap<buffer> \jl :JavaImpl<CR>
    autocmd FileType java nnoremap<buffer> \jd :JavaDelegate<CR>
    autocmd FileType java nnoremap<buffer> \ji :JavaImport<CR>
    autocmd FileType java nnoremap<buffer> \jm :w<CR>:JavaImportMissing<CR>:w<CR>
    autocmd FileType java nnoremap<buffer> \jj :JavaSearchContext<CR>
    autocmd FileType java nnoremap<buffer> \jx :Java %<CR>
    autocmd FileType java nnoremap<buffer> \jo :w<CR>:Javac<CR>
    autocmd FileType java nnoremap<buffer> \jv :w<CR>:Validate<CR>
    autocmd FileType java nnoremap<buffer> \jt :JavaCorrect<CR>
    autocmd FileType java nnoremap<buffer> \jr :JavaRename
    autocmd FileType java nnoremap<buffer> \jw :JavaDocComment<CR>
    autocmd FileType java nnoremap<buffer> \jf :w<CR>:%JavaFormat<CR>
augroup end


let g:clang_complete_auto = 1
let g:clang_snippets = 1

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

nnoremap \g :set operatorfunc=CalcOperator<cr>g@
vnoremap \g :<c-u>call CalcOperator(visualmode())<cr>

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
    if stridx(expand("%:t"), ".") != 0
        if exists("t:NERDTreeBufName")
            if bufwinnr(t:NERDTreeBufName) != -1
                let win_num = winnr()
                NERDTreeFind
                exe win_num . "wincmd w"
            endif
        end
    end
endfunction
let g:BufExplorerFuncRef = function('ChangeBuffer')
autocmd BufWinEnter * call ChangeBuffer()


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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

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

let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
let g:syntastic_ocaml_checkers = ['merlin']


command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
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

" nnoremap \w :Ag <cword><CR>

nnoremap <silent> \f :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> \f :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ag " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

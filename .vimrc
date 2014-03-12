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
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
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
call pathogen#infect()
colorscheme grb256
let g:airline#extensions#tabline#enabled = 1


set omnifunc=syntaxcomplete#Complete
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
set shiftround
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
    au FocusLost * :wa
    au VimResized * exe "normal! \<c-w>="
    autocmd BufNewFile,BufRead *.slim set filetype=slim
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
    nnoremap \v <C-w>v<C-w>l
    nnoremap \s <C-w>s<C-w>j

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
    nnoremap \w :Ack <cword><CR>
    nnoremap ,g :GundoToggle<CR>
    nnoremap ,r :NERDTreeFind<CR><c-w><c-w>
    nnoremap <c-y> :CtrlPCurWD<CR>
    nnoremap <c-u> :CtrlPBuffer<CR>
    nnoremap <c-x>v :!gnome-open %<cr>
    nnoremap ,f :RecoverPluginFinish<CR>
    nnoremap ,t :NERDTreeToggle<CR>
    "nnoremap \t :Ve<CR><CR>
    nnoremap ,l :TagbarToggle<CR>

    " insert mode mappings
    " autocomplete
    inoremap <Nul> <C-x><C-o>
    " autoclose html tags
    inoremap <C-x>; </<C-x><C-o>
    "convenience mapping for insert mode."
    inoremap <C-x>1 <%<Space><Space>%><Esc>2hi
    inoremap <C-x>2 <%=<Space><Space>%><Esc>2hi
    inoremap <C-x>3 {%<Space><Space>%}<Esc>2hi
    inoremap <C-x>4 {{<Space><Space>}}<Esc>2hi
    
    inoremap <c-a> <c-o>^
    inoremap <c-x><c-a> <c-a>
    inoremap <c-b> <left>
    inoremap <expr> <C-E> col('.')>strlen(getline('.'))?"\<Lt>C-E>":"\<Lt>End>"
    inoremap <c-f> <right>
    inoremap <C-h> <C-g>u<C-h>
    inoremap <C-w> <C-g>u<C-w>
    inoremap <C-u> <C-g>u<C-u>
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
    cmap W! w !sudo tee % >/dev/null
    cnoremap <c-a> <home>
    cnoremap <c-x><c-a> <c-a>
    cnoremap <Esc>b <S-Left>
    cnoremap <Esc>f <S-Right>
    cnoremap <c-b> <left>
    cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
    cnoremap <c-f> <right>
    cnoremap <c-p> <Up>
    cnoremap <c-n> <Down>


    " visual mode mapping
    vnoremap . :normal! .<CR>
    vnoremap @@ :normal! @@<CR>


    " generic mappings
    noremap!        <M-b> <S-Left>
augroup end


" clojure settings.
let g:vimclojure#WantNailgun=1
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#DynamicHighlighting=1
set noautochdir
let g:paredit_leader = ','


augroup chicken
    au!
    let g:is_chicken=1
    au BufNewFile,BufRead *.ss call PareditInitBuffer()
    autocmd FileType scheme nnoremap<buffer> ,x :w<CR>:!/usr/bin/env csi -s %
    au FileType scheme setlocal makeprg=csc\ -check-syntax\ %:p
    au FileType scheme setl dictionary+=~/.vim/scheme-word-list
    "au FileType scheme setl complete+=,k~/.vim/scheme-word-list
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


let g:netrw_menu = 0
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_hide = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_preview=1
let g:netrw_browsex_viewer="gnome-open"
let g:netrw_ctags="etags"
let g:netrw_winsize=20
let g:netrw_cursor=0


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


"readline like mapping for command mode."
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
"nnoremap <C-l> <C-w>l

let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1
augroup ruby
    au!
    autocmd FileType ruby nnoremap<buffer>  ,x :w<CR>:!ruby %
    autocmd FileType ruby setlocal makeprg=ruby\ -c\ %
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
let NERDTreeCursorLine=0
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
    set confirm
endfunction
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

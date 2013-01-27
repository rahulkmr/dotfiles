set undodir=/opt/tmp//
set backupdir=/opt/tmp//
set directory=/opt/tmp//
set backup
set complete+=.,w,b,u,t,i
set showmode
set gdefault
set virtualedit+=block
set fileformats=unix,mac,dos
set ttyfast
set modeline
set fdm=manual
set showcmd
set cmdheight=2
set statusline+=%f "path to the file in the buffer, relative to current directory
set statusline+=\ %h%1*%m%r%w%0* " flag
set statusline+=\ [%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=\ Line:%l/%L
set statusline+=\ Column:%c%V
set statusline+=\ Buffer:%n
set laststatus=2
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set title
set viminfo='50,\"1000,:100,n~/vim/viminfo
" disable vi compatibility (emulation of old bugs)
set nocompatible
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
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" recreate tags file with F5
nnoremap \c :!ctags -R .<CR>
nnoremap \rc :!ctags --extra=+f --exclude=.git --exclude=log -R . `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR>
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

"Make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

if &diff
    "I'm only interested in diff colours
    syntax off
endif
"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1
call pathogen#infect()
filetype on
filetype plugin on
filetype indent on

augroup global
    au!
    au FocusLost * :wa
    au VimResized * exe "normal! \<c-w>="
    autocmd BufNewFile,BufRead *.slim set filetype=slim
    au BufNewFile,BufRead *.ss set filetype=racket
    au BufNewFile,BufRead *.ss call PareditInitBuffer()
    autocmd FileType scheme runtime plugin/rainbow.vim
    autocmd FileType racket runtime plugin/rainbow.vim
    autocmd FileType racket nnoremap<buffer> ,x :w<CR>:!/usr/bin/env racket % <CR>
    autocmd FileType *.cljs set ft=clojure
    au BufRead,BufNewFile *.less set ft=less syntax=less
    au BufNewFile,BufRead *.go set ft=go
augroup end
" clojure settings.
let g:vimclojure#WantNailgun=1
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#DynamicHighlighting=1
nnoremap ,a :set autochdir<CR>
set noautochdir
nnoremap ,n :nohl<CR>
nnoremap ,t :NERDTreeToggle<CR>
"nnoremap \t :Ve<CR><CR>
nnoremap ,l :TagbarToggle<CR>
nnoremap ,y :FufFile<CR>
augroup python
    au!
    autocmd FileType python nnoremap<buffer> ,x :w<CR>:!/usr/bin/env python % <CR>
    autocmd FileType python setlocal nosmartindent
    autocmd FileType python setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
    autocmd FileType python setlocal errorformat=%f:%l:\ %m
    autocmd BufRead python setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd FileType python setlocal path+=$PYTHONDIRS
    "autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;py_compile.compile(r'%')\"
augroup end
augroup go
    au!
    autocmd FileType go setlocal makeprg=go\ build\ %
    autocmd FileType go nnoremap<buffer> ,x :w<CR>:!go run % <CR>
    autocmd FileType go nnoremap<buffer> ,o :w<CR>:!go fmt %<cr>
    autocmd FileType go nnoremap<buffer> ,i :w<CR>:!go install
    autocmd FileType go nnoremap<buffer> ,e :w<CR>:!go clean<cr>
augroup end
augroup perl
    au!
    autocmd FileType perl nnoremap<buffer>  ,x :w<CR>:!/usr/bin/env perl % <CR>
    autocmd FileType perl setlocal path+=$PERLDIRS
    autocmd FileType perl setlocal makeprg=/usr/bin/env\ perl\ -c\ %
augroup end
augroup c
    au!
    autocmd FileType c setlocal makeprg=clang\ -fsyntax-only\ %
    autocmd FileType cpp setlocal makeprg=g++\ -g\ -o\ %<\ %
    autocmd FileType c,cpp nnoremap<buffer> ,x :!./%<<CR>
augroup end
augroup common
    au!
    autocmd FileType c,cpp,perl,python,ruby,go nnoremap<buffer> ,c :w<CR>:make<CR>
augroup end
nnoremap \i :cclose<CR>:pclose<CR>:lclose<CR>
let g:netrw_menu = 0
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_hide = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_preview=1
inoremap <Nul> <C-x><C-o>
nnoremap ,m :TOhtml<CR>
"colorscheme ir_black
colorscheme grb256
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
set history=1000
set undofile
set undolevels=10000
set undoreload=10000
let html_use_css=1
nnoremap ,f :RecoverPluginFinish<CR>
nnoremap / /\v
vnoremap / /\v
set lbr
let coffee_no_trailing_space_error = 1
set guioptions-=m
set guioptions-=T
"convenience mapping for insert mode."
inoremap <c-b> <left>
inoremap <c-f> <right>
"readline like mapping for command mode."
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
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
    autocmd FileType fsharp nnoremap<buffer> ,x :!./%<.exe<CR>
augroup end
vnoremap . :normal! .<CR>
vnoremap @@ :normal! @@<CR>
set omnifunc=syntaxcomplete#Complete
nnoremap ,dj :set filetype=django<CR>
nnoremap ,jj :set filetype=jinja<CR>
nnoremap ,hd :set filetype=htmldjango<CR>
nnoremap ,hj :set filetype=htmljinja<CR>
let g:ragtag_global_maps = 1
nnoremap ,w :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap \v <C-w>v<C-w>l
nnoremap \s <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
nnoremap ,v :e ~/.vimrc<CR>
nnoremap ,V :so ~/.vimrc<CR>
inoremap \1 <%<Space><Space>%><Esc>2hi
inoremap \2 <%=<Space><Space>%><Esc>2hi
inoremap \3 {%<Space><Space>%}<Esc>2hi
inoremap \4 {{<Space><Space>}}<Esc>2hi
inoremap <C-h> <C-g>u<C-h>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
let g:rubycomplete_rails = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1
augroup ruby
    au!
    autocmd FileType ruby nnoremap<buffer>  ,x :w<CR>:!ruby % <CR>
    autocmd FileType ruby setlocal makeprg=ruby\ -c\ %
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2
augroup end
inoremap \q <Esc>O
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
let g:clang_complete_auto = 0
let g:clang_snippets = 1
nnoremap \w :Ack <cword><CR>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
inoremap  u03bb
nnoremap ,g :GundoToggle<CR>
let g:paredit_leader = ','

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

" sudo write this
cmap W! w !sudo tee % >/dev/null

nnoremap ,r :NERDTreeFind<CR><c-w><c-w>
function! ChangeBuffer()
    if stridx(expand("%:t"), ".") != 0
        if exists("t:NERDTreeBufName")
            if bufwinnr(t:NERDTreeBufName) != -1
                exe "normal! ,r"
            endif
        end
    end
endfunction
let g:BufExplorerFuncRef = function('ChangeBuffer')
"autocmd BufWinEnter * call ChangeBuffer()
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

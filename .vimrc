let g:pydiction_location = '~/.vim/complete-dict'
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
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
set wrap
" Incremental search.
set incsearch
set hlsearch
set ignorecase
set smartcase
set syntax=auto
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

" Comment for C like language
if has("autocmd")
    au BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css ino $c /** **/O
endif
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

au FocusLost * :wa
au VimResized * exe "normal! \<c-w>="
" clojure settings.
"let g:vimclojure#WantNailgun=1
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#DynamicHighlighting=1
nnoremap ,a :set autochdir<CR>
set noautochdir
nnoremap ,n :nohl<CR>
nnoremap ,t :NERDTreeToggle<CR>
"nnoremap \t :Ve<CR><CR>
nnoremap ,l :TlistToggle<CR>
nnoremap ,y :FufFile<CR>
autocmd FileType python nnoremap ,x :w<CR>:!/usr/bin/env python % <CR>
autocmd FileType python setlocal nosmartindent
autocmd FileType python setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;py_compile.compile(r'%')\"
autocmd BufRead python setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType python setlocal path+=$PYTHONDIRS
autocmd FileType perl nnoremap  ,x :w<CR>:!/usr/bin/env perl % <CR>
autocmd FileType perl setlocal path+=$PERLDIRS
autocmd FileType perl setlocal makeprg=/usr/bin/env\ perl\ -c\ %
autocmd FileType c setlocal makeprg=clang\ -fsyntax-only\ %
autocmd FileType cpp setlocal makeprg=g++\ -g\ -o\ %<\ %
autocmd FileType c,cpp,perl,python,ruby nnoremap ,c :w<CR>:make<CR>
autocmd FileType c,cpp nnoremap ,x :!./%<<CR>
"autocmd FileType java,c,perl nnoremap ,j :cn<CR> | nnoremap ,k :cp<CR> | nnoremap ,h :cr<CR> | nnoremap ,l :cl<CR> | nnoremap ,i :cw<CR><C-w><C-w>
nnoremap \j :cn<CR>
nnoremap \k :cp<CR>
nnoremap \h :cr<CR>
nnoremap \l :cl<CR>
nnoremap \i :cclose<CR>:pclose<CR>
let g:netrw_menu = 0
let g:netrw_altv = 1
let g:netrw_hide = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 35
let g:netrw_hide = 1
inoremap <Nul> <C-x><C-o>
nnoremap ,m :TOhtml<CR>
colorscheme ir_black
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
" Set filetype for f#"
au BufNewFile,BufRead *.fs set filetype=fs
autocmd FileType fs set autoindent
autocmd FileType fs set smartindent
" configure tabwidth and insert spaces instead of tabs
autocmd FileType fs set tabstop=4        " tab width is 4 spaces
autocmd FileType fs set shiftwidth=4     " indent also with 4 spaces
autocmd FileType fs set softtabstop=4
autocmd FileType fs set expandtab        " expand tabs to spaces
autocmd FileType fs setlocal makeprg=fsc_sh\ %
autocmd FileType fs nnoremap ,c :w<CR>:make<CR>
autocmd FileType fs nnoremap ,x :!./%<.exe<CR>
nnoremap ` @@
vnoremap . :normal .<CR>
vnoremap ` :normal @@<CR>
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
nnoremap <C-l> <C-w>l
nnoremap ,v :e ~/.vimrc<CR>
nnoremap ,V :so ~/.vimrc<CR>
inoremap \1 <%<Space><Space>%><Esc>2hi
inoremap \2 <%=<Space><Space>%><Esc>2hi
inoremap \3 {%<Space><Space>%}<Esc>2hi
inoremap \4 {{<Space><Space>}}<Esc>2hi
au BufRead,BufNewFile *.less set ft=less syntax=less
inoremap <C-h> <C-g>u<C-h>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2
au BufNewFile,BufRead *.rkt set filetype=scheme
autocmd FileType scheme runtime plugin/rainbow.vim
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
autocmd FileType ruby nnoremap  ,x :w<CR>:!ruby % <CR>
autocmd FileType ruby setlocal makeprg=ruby\ -c\ %
inoremap \q <Esc>O
autocmd FileType coffee setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType haml setlocal ts=2 sts=2 sw=2

" Mappings for eclim.
autocmd FileType java nnoremap \jg :JavaGet<CR>
autocmd FileType java nnoremap \js :JavaGet<CR>
autocmd FileType java nnoremap \ja :JavaGetSet<CR>
autocmd FileType java nnoremap \jc :JavaConstructor<CR>
autocmd FileType java nnoremap \jh :JavaHierarchy<CR>
autocmd FileType java nnoremap \jl :JavaImpl<CR>
autocmd FileType java nnoremap \jd :JavaDelegate<CR>
autocmd FileType java nnoremap \ji :JavaImport<CR>
autocmd FileType java nnoremap \jm :JavaImportMissing<CR>
autocmd FileType java nnoremap \js :JavaSearchContext<CR>
autocmd FileType java nnoremap \jx :Java %<CR>
autocmd FileType java nnoremap \jo :Javac<CR>
autocmd FileType java nnoremap \jv :Validate<CR>
autocmd FileType java nnoremap \jt :JavaCorrect<CR>
autocmd FileType java nnoremap \jr :JavaRename
autocmd FileType java nnoremap \jw :JavaDocComment
let g:vimclojure#WantNailgun = 1
let g:clang_complete_auto = 0
let g:clang_snippets = 1
nnoremap \w :Ack <cword><CR>
autocmd FileType *.cljs set ft=clojure

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
inoremap  u03bb

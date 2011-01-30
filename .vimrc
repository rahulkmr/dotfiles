"Format the statusline          
let g:pydiction_location = '~/.vim/complete-dict'
"set cfu=VjdeCompletionFun
set complete+=.,w,b,u,t,i
set showmode            
set fileformats=unix,mac,dos
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
set smartcase
set syntax=auto
"Show menu with possible tab completions
set wildmenu
""Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.so.*
set wildmode=list:longest
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" recreate tags file with F5
map ;c :!ctags -R .<CR>
"map <Leader>/ "yy/<C-r>y<CR>
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
call pathogen#runtime_append_all_bundles()
filetype on
filetype plugin on
filetype indent on
" clojure settings.
let g:vimclojure#WantNailgun=1
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#ParenRainbow=1
let g:vimclojure#DynamicHighlighting=1
nnoremap \ch :set autochdir<CR>
set noautochdir
nmap \n :nohl<CR>
nmap \t :NERDTreeToggle<CR>
"nmap \t :Ve<CR><CR>
nmap \l :TlistToggle<CR>
nmap \y :FufFile<CR>
autocmd FileType python nmap \x :w<CR>:!/usr/bin/env python % <CR>
autocmd FileType python set nosmartindent 
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;py_compile.compile(r'%')\" 
autocmd BufRead python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
autocmd FileType python set path+=$PYTHONDIRS 
autocmd FileType perl nmap  \x :w<CR>:!/usr/bin/env perl % <CR>
autocmd FileType perl set path+=$PERLDIRS 
autocmd FileType perl set makeprg=/usr/bin/env\ perl\ -c\ % 
autocmd FileType c set makeprg=gcc\ -g\ -o\ %<\ %
autocmd FileType cpp set makeprg=g++\ -g\ -o\ %<\ %
autocmd FileType c,cpp,perl,python nmap \c :w<CR>:make<CR>
autocmd FileType c,cpp nmap \x :!./%<<CR>
autocmd FileType java set makeprg=javac\ %
autocmd FileType java nmap \c :w<CR>:make<CR> | nmap \x :!java %<<CR> | nmap \o :call JCommentWriter()<CR>
autocmd FileType java,c,perl nmap \j :cn<CR> | nmap \k :cp<CR> | nmap \h :cr<CR> | nmap \l :cl<CR> | nmap \i :cw<CR><C-w><C-w>
nmap \i <C-w><C-w><C-w>c 
let g:netrw_menu = 0
let g:netrw_altv = 1
let g:netrw_hide = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 35 
let g:netrw_hide = 1
inoremap <Nul> <C-x><C-o>
nnoremap \m :TOhtml<CR>
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
set pastetoggle=<Leader>g
set scrolljump=10
set hidden
set whichwrap=b,s,h,l,<,>,~,[,]
set lazyredraw
set nostartofline
set report=0
set sidescrolloff=10
""set formatoptions=rq
set formatoptions=qrn1
syntax enable
set copyindent
set shiftround
set history=1000
set undolevels=1000
set directory=/tmp//
let html_use_css=1
nnoremap \f :RecoverPluginFinish<CR>
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
cmap <c-a> <home>
cmap <c-e> <end>
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
nnoremap ` @@
vnoremap . :normal .<CR>
vnoremap ` :normal @@<CR>
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
nmap <Leader>dj :set filetype=django<CR>
nmap <Leader>jj :set filetype=jinja<CR>
nmap <Leader>hd :set filetype=htmldjango<CR>
nmap <Leader>hj :set filetype=htmljinja<CR>
let g:ragtag_global_maps = 1
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
inoremap qq <ESC> 
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-o> <Esc>o
nnoremap ,v :e ~/.vimrc<CR>
nnoremap ,V :so ~/.vimrc<CR>

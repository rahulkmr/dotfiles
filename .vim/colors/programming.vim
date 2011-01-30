" Vim color file
" Maintainer:  Abhijit Nadgouda (http://ifacethoughts.net/)

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="programming"

hi normal   guifg=#333333   guibg=#fcfcfc
hi title    guifg=black     guibg=white gui=BOLD
hi lcursor  guibg=cyan      guifg=NONE
hi cursor   guibg=#696969      guifg=NONE

hi lineNr   guifg=white     guibg=#999999

hi comment      guifg=#999999   gui=NONE
hi identifier	guifg=#008000   gui=NONE

hi statement    guifg=#0000c8   gui=NONE
hi typeDef      guifg=#0000c8   gui=NONE
hi type         guifg=#0000c8   gui=NONE
hi boolean      guifg=#0000c8   gui=NONE

hi string       guifg=darkblue  guibg=#f5f6f9   gui=NONE
hi number       guifg=#808080   gui=NONE
hi constant     guifg=#808080   gui=NONE

hi function     guifg=#008040   gui=NONE
hi preproc	guifg=#008040   gui=NONE
hi keyword      guifg=#008040   gui=NONE

hi specialchar  gui=underline


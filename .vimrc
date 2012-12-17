" .vimrc
" 
" WARNING: defaults is to insert 4 spaces instead of tab characters! (FYI)


"
" KEY BINDINGS/SHORTCUTS
"

" this one sounds awesome, but I don't know how to use it:
" change the mapleader from \ to ,
let mapleader=","

" CUSTOM FOR FILES
" compile LaTeX file to pdf
let @l = ":!pdflatex % && thisfile=% && open ${thisfile/tex/pdf}\n"
" compile rst file to pdf
let @r = ":!thisfile=% && rst2pdf --stylesheet-path=lmodern % && open ${thisfile/txt/pdf}\n\n"
" run PHP file
let @p = ":!php %\n"
" run executable
let @e = ":!./%\n"
" This allows you to type @h and then the character you want
" and it will insert the restructured underlines for you.
let @h = "yypVr"
let @v = "yyk[pjj"
" insert a line
"let @l = "i// --------------------------------------------------------\n"
" insert begin phpdoc comment
let @c = "i/**\n" " use with formatoptions=r
" auto-format XML document (THIS ONE IS MAGICAL!!!)
let @x = ":%!xmllint --format %\n"
" auto-format JavaScript document (THIS ONE IS MAGICAL!!!)
let @j = ":%!js -f %\n"
" auto-format JSON document (THIS ONE IS MAGICAL!!!)
let @s = ":%!jsonlint %\n"
" switch tab space to 2 spaces
let @2 = ":set ts=2 sw=2 sts=2 et\n"
" switch tab space to 4 spaces
let @4 = ":set ts=4 sw=4 sts=4 et\n"
" switch tabbing back to normal where it inserts an actual tab character
let @0 = ":set noet\n"
" This is to add a date for documenting code (not very good, but it's a start)
:map @d :.s/.*/\=strftime("\/\/ Modified: %B %Y")/<cr>
:map @t :.s/.*/\=strftime("\/\/ Modified: %D at %r")/<cr>
":map @d :.s/.*/\=strftime("\/\/ %a %b %d %X %Z %Y")/<cr>

" Opens goto file in new buffer
:map gf :edit <cfile><CR>

" Previous/Next Buffer Shortcuts
:map bp :bprev<CR>
:map bn :bnext<CR>

"
" Config
"

" Sets word wrap
set lbr

" Sessions as a Project Manager
" silent source! Session.vim

" SIGNS (never figured this one out)
" :sign define information text=!> linehl=Warning texthl=Error
" :exe ":sign place 123 line=" . line(.) ."name=information file=" . expand("%:p")
" :map <F6> :exe ":sign place 123 line=" . line(".") ."name=information file=" . expand("%:p")<CR>

" Set to auto read when a file is changed from the outside
" set autoread

" AUTO FORMAT (a MUST HAVE for writing PHPDoc)
" c = auto-wrap comments using textwidth
" r = automatically insert the current comment leader in command mode
" o = automatically insert the current comment leader in insert mode
" q = allow formatting with "gq"
set formatoptions=croq



" TABBING AND INDENTATION DEFAULTS
set expandtab     " insert spaces instead of tabs by default
set smartindent   " ?
set cindent       " ?
set cinoptions=>4 " ?

set tabstop=4     " a tab is four spaces
set autoindent    " always set autoindenting on
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
		  "    shiftwidth, not tabstop


" DUNNO WHAT THESE DO?
set ruler
"set autowrite
"set selection=exclusive



" FROM VINCENT DRIESSEN:

" GENERAL
"set nowrap        " don't wrap lines
"set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
"set copyindent    " copy the previous indentation on autoindenting
"set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
"set hlsearch      " highlight search terms
nmap <silent> ,/ :nohlsearch<CR>
		  " auto remove highlighted searches
set incsearch     " show search matches as you type
set nobackup
set noswapfile

" a sweet mapping to switch an opened file to sudo (A MUST HAVE!!!)
cmap w!! w !sudo tee % >/dev/null

" COLOR SCHEME
if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif
" window position and size
if has("gui_running")
		winpos 0 0
		set lines=35
		set columns=100
endif

" TAKE CONTROL OF THE MOUSE IN TERMINAL
set mouse=a " not sure if this actually works

" FORCE TO NOT USE ARROWS
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" HISTORY
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

"
" FILE TYPE ASSOCIATIONS
"

au BufRead,BufNewFile aliases set filetype=sh
au BufRead,BufNewFile aliases_* set filetype=sh
au BufRead,BufNewFile functions set filetype=sh
au BufRead,BufNewFile functions_* set filetype=sh
au BufRead,BufNewFile bash_prompt set filetype=sh
au BufRead,BufNewFile inputrc set filetype=sh
au BufRead,BufNewFile gitconfig set filetype=unix
au BufRead,BufNewFile gitignore set filetype=unix

au BufRead,BufNewFile .aliases* set filetype=sh
au BufRead,BufNewFile .functions* set filetype=sh
au BufRead,BufNewFile .bash_prompt set filetype=sh
au BufRead,BufNewFile .inputrc set filetype=sh
au BufRead,BufNewFile .gitconfig set filetype=unix
au BufRead,BufNewFile .gitignore set filetype=unix

"set fileformats=unix,mac,dos


set pastetoggle=<F2>

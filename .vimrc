" .vimrc
"
" @author Joseph D. Purcell <josephdpurcell@gmail.com>
" @created 1/1/1970
" @modified 3/14/2013

" =========================================================
" PLUGINS:
" =========================================================

" Add CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/taglist.vim
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
nnoremap <C-t> :TlistToggle<CR>

call pathogen#infect()

" =========================================================
" KEY BINDINGS AND SHORTCUTS:
" =========================================================

"
" == Compiling and Executing ==
"

" make
let @m = ":!make"
" make the current file
:map @mf :!make -f %<cr>
" compile LaTeX file to pdf
let @l = ":!pdflatex % && thisfile=% && open ${thisfile/tex/pdf}\n"
" compile rst file to pdf
let @r = ":!thisfile=% && rst2pdf --stylesheet-path=lmodern % && open ${thisfile/txt/pdf}\n\n"
" compile less to css
:map @cl :!lessc % > %:r.css<cr>
" run PHP file
let @p = ":!php %\n"
" run Node.js file
let @n = ":!node %\n"
" run executable (i.e. a bash script)
let @e = ":!./%\n"

"
" == Git Helpers ==
"
:map @gd :!git diff --stat<cr>
:map @gdf :!git diff<cr>
:map @gs :!git status<cr>
:map @gc :!git commit<cr>
:map @gca :!git commit -a<cr>

"
" == Linting, Beautifying, Condensing and Analyzing ==
"

" PHP_CodeSniffer
:map @ps :%!phpcs %<cr>
" lint AND auto-format XML document (THIS ONE IS MAGICAL!!!)
let @x = ":%!xmllint --format %\n"
" lint CSS (THIS ONE IS MAGICAL!!!) http://csslint.net/
" alt: https://npmjs.org/package/PrettyCSS
let @c = ":%!csslint %\n"
" auto-format CSS document (THIS ONE IS MAGICAL!!!) http://mrcoles.com/blog/command-line-css-unminifier-utility/
:map @cc :%!cssunminifier %<cr>
" minify CSS (THIS ONE IS MAGICAL!!!)
:map @cm :%!yuicompress -s %<cr>
" lint JavaScript document (THIS ONE IS MAGICAL!!!)
"let @j = ":%!jslint %\n" " I don't link jslint as much
let @j = ":%!jshint --show-non-errors %\n"
" auto-format JavaScript document (THIS ONE IS MAGICAL!!!)
:map @jj :%!js-beautify %<cr>
" minify JavaScript (THIS ONE IS MAGICAL!!!)
:map @jm :%!yuicompress -s %<cr>
" lint AND auto-format JSON document (THIS ONE IS MAGICAL!!!)
let @s = ":%!jsonlint %\n"

"
" == Code Inserts and Helpers ==
"

" This allows you to type @h and then the character you want
" and it will insert the restructured text underlines for you.
let @h = "yypVr"
" This is to add a date for documenting code (not very good, but it's a start)
":map @d :.s/.*/\=strftime("\/\/ %a %b %d %X %Z %Y")/<cr>
":map @m :.s/.*/\=strftime("\/\/ Modified: %B %Y")/<cr>
:map @t :.s/.*/\=strftime("\/\/ Modified: %D at %r")/<cr>

"
" == Syntax Switching ==
"

" PRIMARY: use tabs instead of spaces
:map @1 :set ts=4 sw=4 sts=4 cino=>4 et<cr>
set ts=4 sw=4 sts=4 cino=>4 et
" SECONDARY: use 4 spaces instead of tabs
:map @2 :set ts=4 sw=4 sts=4 cino=>4 noet<cr>
" CSS: use 2 spaces instead of tabs
:map @3 :set ts=2 sw=2 sts=2 cino=>2 et<cr>
" OFF: switch tabbing back to normal where it inserts an actual tab character
let @0 = ":set noet\n"

"
" == Vim Helpers ==
"

" This will set the current working directory to that of the current opened file
let @d = ":lcd %:p:h\n"
" change the mapleader from \ to ,
let mapleader=","
" Opens goto file in new buffer
:map gf :edit <cfile><CR>
" toggle line numbers using CTRL+n
nnoremap <C-n> :set nonumber!<CR>
" toggle paste
set pastetoggle=<F2>
" toggle paste when function keys aren't avail (i is for toggling insert mode)
nnoremap <C-i> :set paste!<CR>
" toggle hidden characters
nnoremap <C-a> :set invlist!<CR>
" Previous/Next Buffer Shortcuts
:map bp :bprev<CR>
:map bn :bnext<CR>

" =========================================================
" CONFIG:
" =========================================================

"
" Miscelaneous
"

" Remvoes scroll bars (useful for GUI)
set guioptions-=r
set guioptions-=L
" Sets word wrap
set lbr
" Set to auto read when a file is changed from the outside
"set autoread

"
" AUTO FORMAT (a MUST HAVE for writing PHPDoc)
"

" c = auto-wrap comments using textwidth
" r = automatically insert the current comment leader in command mode
" o = automatically insert the current comment leader in insert mode
" q = allow formatting with "gq"
set formatoptions=croq

" =========================================================
" TABBING AND INDENTATION DEFAULTS:
" =========================================================

" for more info see:
"   - http://vim.wikia.com/wiki/Indenting_source_code
"   - http://tedlogan.com/techblog3.html
set autoindent    " always set autoindenting on
set smartindent   " ?
set cindent       " ?
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set ruler " show the ROW,COL for where your cursor is in the file
" set the following 4 in "Syntax Switching"
"set noexpandtab   " insert spaces instead of tabs by default
"set tabstop=4     " to tell vim how many columns a tab character counts for; i.e. a tab shows as four spaces
"set softtabstop=4 " to tell how many columns vim uses when you hit Tab in insert mode
"set shiftwidth=4  " number of spaces to use for autoindenting
"set cinoptions=>4 " a shift width multiplier?

" =========================================================
" FROM VINCENT DRIESSEN:
" =========================================================

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

" a hack for ssh sessionss (not sure why I need this)
if $SSH_TTY || $SSH_CLIENT
    set term=builtin_beos-ansi
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

filetype on " auto-recognize file types
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

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

"set fileformats=unix,mac,dos

"" Reference: http://amix.dk/blog/post/19571
"function! GitBranch()
"    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
"    if branch != ''
"        return '[' . substitute(branch, '\n', '', 'g') . ']'
"    en
"    return ''
"endfunction
"
"" Reference: http://amix.dk/blog/post/19571
"function! HasPaste()
"    if &paste
"        return '  * PASTE MODE * '
"    en
"    return ''
"endfunction
"
"" I don't know what I'm doing here
"set laststatus=2
"set statusline=
"set statusline +=%{GitBranch()}
"set statusline +=%#Question#
"set statusline +=%{HasPaste()}
"set statusline +=%#StatusLine#
"set statusline +=%0*
"set statusline +=\ %<%F            "full path
"set statusline +=%0*                "modified flag
"set statusline +=%#Error#
"set statusline +=%m                "modified flag
"set statusline +=%#StatusLine#
"set statusline +=%0*
"set statusline +=%=%5l             "current line
"set statusline +=/%L               "total lines
"set statusline +=%4v\              "virtual column number
"set statusline +=0x%04B\           "character under cursor
"
let g:GPGPreferArmor=1


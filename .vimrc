" .vimrc
"
" @author Joseph D. Purcell <josephdpurcell@gmail.com>
" @created 1/1/1970
" @modified 7/6/2014

" Thank you http://blog.sanctum.geek.nz/vim-annoyances/
" Also thank you http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" change the mapleader from \ to ,
"let mapleader=","
map <C-q> :q<CR>
" allow ctrl+q to pass to vim:
"silent !stty -ixon > /dev/null 2>/dev/null

" =========================================================
" PLUGINS:
" =========================================================

" Add CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/taglist.vim
"let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
"nnoremap <C-t> :TlistToggle<CR>

call pathogen#infect()

" Generate help tags for plugins.
call pathogen#helptags()

inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

" =========================================================
" KEY BINDINGS AND SHORTCUTS:
" Reference: http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_2%29
" =========================================================

"
" == Vim Default Overrides
"

" make Shift-D erase to end of line and then go into insert mode
map <S-d> Da

" make d-e erase word and then go into insert mode
"nmap de dei

"nmap vw bve

"nmap dw bde
nmap dw bcw

"
" == Compiling and Executing ==
"

" compile with g++
"map @g :!file=% && file=${file\%.c} && g++ % -o $file<cr>
" make
let @m = ":!make"
" make the current file
map @mf :!make -f %<cr>
" compile LaTeX file to pdf
let @l = ":!pdflatex % && thisfile=% && open ${thisfile/tex/pdf}\n"
" compile rst file to pdf
let @r = ":!thisfile=% && rst2pdf --stylesheet-path=lmodern % && open ${thisfile/txt/pdf}\n\n"
" compile less to css
map @cl :!lessc % > %:r.css<cr>
" run PHP file
let @p = ":!php %\n"
" run GOLANG file
let @g = ":!go run %\n"
" run Node.js file
let @n = ":!node %\n"
" run executable (i.e. a bash script)
let @e = ":!./%\n"

"
" == Git Helpers ==
"
map @gd :%!git diff --name-only<cr>
map @gdd :!git diff --stat<cr>
map @gddd :!git diff<cr>
map @gdf :!git diff %<cr>
map @gs :!git status<cr>
map @ga :!git add .<cr>
map @gc :!git commit<cr>
map @gcc :!git commit -a<cr>
" insert the body of the last commit message (good for typing commits with the same task number)
map @gcl :0r !git rev-list --format=\%B --max-count=1 HEAD \| tail -n +2 \| head -1<cr>

"
" == Linting, Beautifying, Condensing and Analyzing ==
"

" PHP Linter
map @pl :%!php -l %<cr>
" PHP_CodeSniffer
map @ps :%!phpcs --standard="$HOME/.phpcs.xml" %<cr>
" PHP Beautify a pasted PHP array
map @pa = :'<,'>s;\(\[[0-9]*\] => \)\?Array\s*\n\s*(;array(;g<cr>:'<,'>s;\[\([^\]]*\)\] => \(.*\)$;'\1' => '\2',;g<cr>:'<,'>s;,\n\(\s*\))\n^\n;\r\1),\r;g<cr>:'<,'>s;),\n\(\s*\));)\r\1);g<cr>
" lint AND auto-format XML document (THIS ONE IS MAGICAL!!!)
let @x = ":%!xmllint --format %\n"
" lint CSS (THIS ONE IS MAGICAL!!!) http://csslint.net/
" alt: https://npmjs.org/package/PrettyCSS
let @c = ":%!csslint --ignore=ids,important,box-model,compatible-vendor-prefixes,adjoining-classes,qualified-headings %\n"
" auto-format CSS document (THIS ONE IS MAGICAL!!!) http://mrcoles.com/blog/command-line-css-unminifier-utility/
map @cc :%!cssunminifier %<cr>
" minify CSS (THIS ONE IS MAGICAL!!!); NOTE: -c 0 will put CSS on one line and is not an actual flag on yuicompress; I mod'd yuicompress
map @cm :%!yuicompress -c 0 -s %<cr>
" minify CSS (THIS ONE IS MAGICAL!!!)
map @cmm :%!yuicompress -s %<cr>
" lint JavaScript document (THIS ONE IS MAGICAL!!!)
"let @j = ":%!jslint %\n" " I don't link jslint as much
let @j = ":%!jshint --show-non-errors %\n"
" auto-format JavaScript document (THIS ONE IS MAGICAL!!!)
map @jj :%!js-beautify %<cr>
" minify JavaScript (THIS ONE IS MAGICAL!!!)
":map @jm :%!yuicompress -s %<cr>
map @jm :%!uglifyjs %<cr>
" lint AND auto-format JSON document (THIS ONE IS MAGICAL!!!)
"let @s = ":%!jsonlint %\n"
" source: http://visibletrap.blogspot.de/2010/05/vim-how-to-format-and-syntax-highlight.html
"map <leader>jt  <Esc>:%!json_pp -f json -t json<CR>
"map @s <Esc>:%!json_pp -f json -t json<CR>
" alt: jq http://stedolan.github.io/jq/tutorial/
" source: http://stackoverflow.com/a/24951417/990642
" Note: this sorts keys
"map @s <Esc>:%!python -m json.tool<CR>
" source: http://www.skorks.com/2013/04/the-best-way-to-pretty-print-json-on-the-command-line/
map @s <Esc>:%!json_reformat<CR>
map @sm :%!json_reformat -m<cr>
" alt:
"map @sm :%!jq --compact-output . %<cr>

"
" == Code Inserts and Helpers ==
"

" This allows you to type @h and then the character you want
" and it will insert the restructured text underlines for you.
let @h = "yypVr"
" This is to add a date for documenting code (not very good, but it's a start)
":map @d :.s/.*/\=strftime("\/\/ %a %b %d %X %Z %Y")/<cr>
":map @m :.s/.*/\=strftime("\/\/ Modified: %B %Y")/<cr>
map @t :.s/.*/\=strftime("\/\/ Modified: %D at %r")/<cr>

"
" == Tab Syntax Switching ==
"

" PRIMARY: use tabs instead of spaces
map @1 :set ts=4 sw=4 sts=4 cino=>4 et<cr>
set ts=4 sw=4 sts=4 cino=>4 et
" SECONDARY: use 4 spaces instead of tabs
map @2 :set ts=4 sw=4 sts=4 cino=>4 noet<cr>
" CSS: use 2 spaces instead of tabs
map @3 :set ts=2 sw=2 sts=2 cino=>2 et<cr>
" OFF: switch tabbing back to normal where it inserts an actual tab character
let @0 = ":set noet\n"

"
" == Vim Helpers ==
"

function! TogglePaste()
  if (&syntax == 'off')
    set syntax=on
  else
    set syntax=off
  endif
  set paste!
endfunction

" This will set the current working directory to that of the current opened file
let @d = ":lcd %:p:h\n"
" Opens goto file in new buffer
map gf :edit <cfile><CR>
" toggle line numbers using CTRL+n
nnoremap <C-n> :set nonumber!<CR>
" toggle paste
set pastetoggle=<F2>
" toggle paste when function keys aren't avail (i is for toggling insert mode)
"nnoremap <C-i> :call TogglePaste()<CR>
nnoremap <C-i> :set paste!<CR>
map <C-v> :r !pbpaste<CR>
" toggle hidden characters
nnoremap <C-a> :set invlist!<CR>
" Previous/Next Buffer Shortcuts
map bp :bprev<CR>
map bn :bnext<CR>
" Open file under cursor in vertical window (a complement to CTRL+w+f)
map <C-w>g :vertical wincmd f<CR><C-w>l
" clear search highlighting
map // :noh<CR>
" toggle highlighting
map ?? :set hlsearch!<CR>

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
set backspace=indent,eol,start " make backspace work like most other apps
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


" a sweet mapping to switch an opened file to sudo (A MUST HAVE!!!)
cmap w!! w !sudo tee % >/dev/null

" CTRL+S to save
nmap <C-S> :w<CR>

" COLOR SCHEME
if &t_Co >= 256 || has("gui_running")
  " use a color scheme if there are at least 256 colors
  colorscheme mustang
endif
if &t_Co > 2 || has("gui_running")
  " switch syntax highlighting on, when the terminal has at least 2 colors
  syntax on
endif

" a hack for ssh sessionss (not sure why I need this; I think it's something for when I ssh in)
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
"set mouse=a " not sure if this actually works

" FORCE TO NOT USE ARROWS
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" HISTORY
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
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

au BufRead,BufNewFile .aliases* set filetype=sh
au BufRead,BufNewFile .functions* set filetype=sh
au BufRead,BufNewFile .bash_prompt set filetype=sh
au BufRead,BufNewFile .inputrc set filetype=sh
au BufRead,BufNewFile .gitconfig set filetype=gitconfig
au BufRead,BufNewFile .gitignore set filetype=gitconfig
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile VagrantFile set filetype=ruby

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md set spell

autocmd BufRead,BufNewFile COMMIT_EDITMSG set filetype=gitcommit spell

" https://github.com/leafgarland/typescript-vim
au BufRead,BufNewFile *.ts set filetype=typescript

" https://github.com/vim-scripts/JSON.vim
au BufRead,BufNewFile *.json set filetype=json 

" Use tabs instead of spaces for golang
au BufRead,BufNewFile *.go set ts=4 sw=4 sts=4 cino=>4 noet

" Use 2 spaces for js
au BufRead,BufNewFile *.js set ts=2 sw=2 sts=2 cino=>2 et

" Use 2 spaces for html
au BufRead,BufNewFile *.html set ts=2 sw=2 sts=2 cino=>2 et

" lol, wut?
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

"let @s = ":%!jsonlint %\n"
"
"command! -range -nargs=1 SendToCommand <line1>,<line2>call SendToCommand(<q-args>) 
"
"function! SendToCommand(UserCommand) range
"    " Get a list of lines containing the selected range
"    let SelectedLines = getline(a:firstline,a:lastline)
"    " Convert to a single string suitable for passing to the command
"    let ScriptInput = join(SelectedLines, "\n") . "\n"
"    " Run the command
"    let result = system(a:UserCommand, ScriptInput)
"    " Echo the result (could just do "echo system(....)")
"    echo result
"endfunction
"

"
" == Syntax Switching ==
"
" matches php.ini-development
au BufWinEnter,BufRead,BufNewFile *.ini[^.]* set filetype=ini
" matches php.ini.default
au BufWinEnter,BufRead,BufNewFile *.ini.[^.]* set filetype=ini

set clipboard+=unnamed
"map cc :w !pbcopy

au BufEnter /private/tmp/crontab.* setl backupcopy=yes
au BufNewFile,BufRead *.less set filetype=less

map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr . "[\t"<CR>

" Insert <Tab> or complete identifier
" if the cursor is after a keyword character
"function MyTabOrComplete()
"    let col = col('.')-1
"    if !col || getline('.')[col-1] ~- '\k'
"        return "\<tab>"
"    else
"        return "\<C-N>"
"    endif
"endfunction
"inoremap <Tab> <C-R>=MyTabOrComplete()<CR>


" make Vim more browser like
"nmap <Space> <PageDown>

" xdebug
"let g:debuggerTimeout = 5
"map <S-B> :Bp<Enter>
"map <C-X> <F5>
let g:vdebug_options= {
\    "port" : 9000,
\    "server" : '',
\    "timeout" : 20,
\    "on_close" : 'detach',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "path_maps" : {
\        "/var/www/dev1.d8.local/web": "/Users/joepurcell/src/sites/dev1.d8.local/web"
\    },
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾'
\}


" phpcs
"let g:phpqa_codesniffer_args = "--standard=PSR2"
let g:phpqa_codesniffer_args = "--standard=Drupal"
let g:phpqa_codesniffer_autorun = 0
" phpmd
let g:phpqa_messdetector_ruleset = 'phpmd_ruleset.xml'
let g:phpqa_messdetector_autorun = 0
let g:phpqa_open_loc = 0

nnoremap <C-u> :GundoToggle<CR>

" use relative numbering so you can jump
"set relativenumber

" supposedly draws the screen faster
set ttyfast

"let loaded_matchparen = 1

set wildmenu
set wildmode=longest:full

set wildignore=*.swp,*.bak,*.pyc,*.class,*~
set wildignore+=*/cache/*
set wildignore+=*/build/*
set wildignore+=*/tmp/*
set wildignore+=*/node_modules/*
set wildignore+=*/vendor/*

" C-X C-F enter tab copmletion mode of file name
inoremap <Tab> <C-X><C-F>

" Don't show intro screen
set shortmess+=I

" always show status menu
set laststatus=2

" =========================================================
" Disable some default mappings
" =========================================================

nnoremap Q <nop>
nnoremap K <nop>

" =========================================================
" Backup, Swap, and History Files
" =========================================================

set backupdir=~/.vim/tmp/backup
set nobackup
set nowritebackup

set directory=~/.vim/tmp/swap
set noswapfile

" Tell Vim to create .<FILENAME>.un~ files to persist change history
set undodir=~/.vim/tmp/history
set undofile

" =========================================================
" Search
" =========================================================

set tags=.ctags

if has('cscope')
    " Search ctags, then cscope.
    set cscopetagorder=1

    " Do not use cstag instead of tag.
    set nocscopetag

    " Add any database in current directory.
    set nocscopeverbose
    if filereadable("cscope.out")
        cs add cscope.out
    " Else add database pointed to by environment.
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    " Find all occurrences of a function calling a function.
    "map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    "map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

    " Shortcuts for each option:
    "   0 or s: Find this C symbol
    "   1 or g: Find this definition
    "   2 or d: Find functions called by this function
    "   3 or c: Find functions calling this function
    "   4 or t: Find this text string
    "   6 or e: Find this egrep pattern
    "   7 or f: Find this file
    "   8 or i: Find files #including this file
    nmap <C-[><C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-[><C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-[><C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' then a search type makes the vim window
    " split horizontally, with search result displayed in
    " the new window.

    "nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one

    "nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

" =========================================================
" Finding/opening files
" =========================================================

" AWESOME! CTRL-P with tags. Yes.
"nnoremap @<C-p> :CtrlPTag<CR>
"nnoremap <C-t><C-p> :CtrlPTag<CR>
"nnoremap <C-g><C-p> :CtrlPBufTag<CR>
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = "~/.vim/tmp/ctrlp"
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <C-d><C-p> :CtrlPClearCache<CR>

" good tags help: http://vim.wikia.com/wiki/Browsing_programs_with_tags
let g:SuperTabDefaultCompletionType = "<c-n>"


" =========================================================
" Git Gutter
" =========================================================

let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime = 1

nnoremap <C-g><C-g> :GitGutterToggle<CR>
"nmap <C-g><C-g> <Plug>GitGutterToggle

" keep selection after in/outdent
"vnoremap < <gv
"vnoremap > >gv

" override Nerd tree's next/prev shortcuts to allow us to use them
" use C-n and C-p instead of C-j and C-k
let NERDTreeMapJumpNextSibling="<C-n>"
let NERDTreeMapJumpPrevSibling="<C-p>"
" show hidden files
let NERDTreeShowHidden=1

" easy split navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Use tab to navigate splits.
" Source: https://github.com/clarkduvall/dotfiles/blob/master/files/.vimrc#L77
"nnoremap <tab> <C-w><C-w>
"nnoremap <s-tab> <C-w><left>

nnoremap ; :

nmap <C-_> :resize +900<CR>
"nmap <C-=> :resize +900<CR>
nmap <C-\> :vertical resize +900<CR>

"nnoremap <C-3> g#
"nnoremap <C-8> g*

"map <C-q> :q<CR>
"noremap <Leader>q :q<CR>

" =========================================================
" Sessions
" =========================================================

" Save/load a session
map @ss :mksession! ~/.vim/session.vim<cr>
map @sl :source ~/.vim/session.vim<cr>
set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds

" Expose whitespace
" Source: http://nvie.com/posts/how-i-boosted-my-vim/
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
" allow tabs in html and xml
"autocmd filetype html,xml set listchars-=tab:>.

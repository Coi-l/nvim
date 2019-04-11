let mapleader=" "

"----------
" VIM PLUG
" https://github.com/junegunn/vim-plug
"----------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
"tagbar requires ctags, use universal ctags https://ctags.io/
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'vim-scripts/YankRing.vim'
Plug 'w0rp/ale'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"-------
" SCRIPT FUNCTIONS
"-------
" Map key to toggle opt
function! MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)

"-------
" AIRLINE OPTIONS
"-------
let g:airline#extensions#tabline#enabled = 1

"-------
" CTRL-P OPTIONS (or related)
"-------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

"-------
" TEXT OPTIONS
"-------
set encoding=utf-8

" expand tabs to spaces
set expandtab

" tabs are 4 spaces
set tabstop=4
" tab key input is 4 spaces
set softtabstop=4
"indent width is 4 spaces
set shiftwidth=4


" allow backspace deletion over indentation
" end of line and start of insert mode
set backspace=indent,eol,start

" turn of the beep
set noerrorbells

" searching, incremental search, ignore case, but if we type big letters be
" smart
set incsearch
set ignorecase
set smartcase

" update the title of the window
set title

" no backup or swap
set nowb
set nobackup
set noswapfile

" automatically reread when file is changed from outside
set autoread

" reuse indent from previous line
set autoindent
" for C-like languages, be smarted on how to reuse indent
set smartindent

" dont't wrap lines
set nowrap

"---------
" VISUAL OPTIONS
"---------

" enable syntax highlighting
syntax enable

" always display the status line
set laststatus=2

" line numbering
set number
set numberwidth=4

" number of lines in the command area
set cmdheight=2

" always show current mode
set showmode

" show file position
set ruler

" show number of changed lines
set report=0

" show matching brackets/parenthesis/curly
set showmatch
" show for 2 seconds
set matchtime=2

" show 10 lines above and below cursor
set scrolloff=10

" Allow buffers to remain open
set hidden

" don't show whitespace/tabs
set nolist

" when showing whitespace, use these chars
set listchars=tab:>-,space:·,eol:$,extends:>,precedes:<,nbsp:%
if $LANG =~ ".*\.UTF-8$" || $LANG =~ ".*utf8$" || $LANG =~ ".*utf-8$"
set listchars=tab:»·,space:·,eol:$,precedes:…,extends:…,nbsp:%
endif

" disable folding
set nofoldenable

"---------
" MISC
"---------
" enable automatic filetype detection
filetype on
filetype plugin on

"show partial command in the last line of the scren
set showcmd

set suffixes+=.class,.hi,.so,.a,.pyc,.la
set suffixes-=.h

"---------
" KEY MAPPINGS
"---------
MapToggle <F1> hlsearch
map <F2> :TagbarToggle <CR>
MapToggle <F3> list
map <F6> :NERDTreeToggle <CR>
map <F12> :so $MYVIMRC <CR> :echo "Reloaded" $MYVIMRC <CR>

nmap <Tab> :wincmd w <CR>
nmap <S-Tab> :wincmd W <CR>

" shortcut for closing buffers
map <Leader>d :bd! <CR>

"step through buffers
map <C-n> :bn! <CR>
map <C-b> :bp! <CR>

" move current line up or down
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>
" move the currently selected visual block up or down
vmap <C-j> :m'>+<CR> gv
vmap <C-k> :m'<-2<CR> gv

" move the current line tab left or tab right
nmap <C-l> >>
nmap <C-h> <<
"move the current selected visual block left or right
vmap <C-l> >gv
vmap <C-h> <gv

"-----------------
" AUTOCOMMANDS
"-----------------
"
"autocmd FileType python	call s:MyPythonSettings()
"
"
"
function! s:MyPythonSettings()
    "pep8 friendly
    setlocal noic
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=79
    setlocal smarttab
    setlocal expandtab
    setlocal comments=:#
    setlocal fileformat=unix
    setlocal encoding=utf-8
    setlocal tags+=./python.ctags
    setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    setlocal omnifunc=pythoncomplete#Complete
endfunction
